/*  6:00 AM 	- 	21600
	6:45 AM 	- 	24300
	11:45 AM 	- 	42300
	4:45 PM 	- 	60300
	9:45 PM 	- 	78300
	10:30 PM 	- 	81000 */
#define CYCLE_SUNRISE 	216000
#define CYCLE_MORNING 	243000
#define CYCLE_DAYTIME 	423000
#define CYCLE_AFTERNOON 603000
#define CYCLE_SUNSET 	783000
#define CYCLE_NIGHTTIME 810000


GLOBAL_LIST_EMPTY(GLOBAL_LIGHT_OVERLAYS) // global light overlays
GLOBAL_REAL_VAR(GLOBAL_LIGHT_RANGE)

/var/total_sunlight_overlays = 0
/var/sunlight_overlays_initialised = FALSE

// cannibalized from lighting.dm



/*
    on initialize - all sunlight_overlays will set theirs states
    1 - full square
    2 - off (roofed)
    3 - lighting
    4 - lighting neighbour - we need to do cornering stuff to cancel out the lighting from #3

    on stateCheck:
		states that were 3, or are now 3 will add their neighbours to the state 4 queue to be processed

    Timechange:
		runs when we are changing to a new time bracket, and need to set a new colour, light intensity, etc.
		After setting new lighting vars
		    run updateColour with GLOBAL_LIGHT_OVERLAYS as target, to update everything

    updateColour:
		loop over target list to run the sunlight_overlay.updateColour proc


*/

SUBSYSTEM_DEF(sunlight)
	name = "sunlight"
	wait = 1
	// init_order = SS_INIT_sunlight

	// Queues of update counts, waiting to be rolled into stats lists
	var/list/stats_queues = list(
		"Overlay" = list(),
		"colour" = list()
	)
	// Stats lists
	var/list/stats_lists = list(
		"Overlay" = list(),
		"colour" = list()
	)

	var/processed_colours = 0
	var/processed_overlays = 0
	var/processed_corners = 0

	var/update_stats_every = 1
	var/next_stats_update = 0
	var/stat_updates_to_keep = 5

	var/list/workQueue = list()    /* turfs to be stateChecked */
	var/wq_index = 1
	var/list/updateQueue = list()    /* turfs to have their colour/lights/etc updated */
	var/uq_indeq = 1
	var/list/cornerQueue = list()    /* turfs to have their colours updated via corners (filter out the unroofed dudes) */
	var/cq_indeq = 1

	var/light_color = "#808080"
	var/light_power = 3
	var/light_range = 3
	var/color = "#808080"
	var/list/cornerColour = list()
	var/currentTime



/datum/controller/subsystem/sunlight/Initialize()
	// InitializeTurfs()
	workQueue = GLOB.GLOBAL_LIGHT_OVERLAYS
	fire(FALSE,TRUE)
	sunlight_overlays_initialised = TRUE
	..()

// It's safe to pass a list of non-turfs to this list - it'll only check turfs.
/* This is the proc that starts the crash loop. Maybe log what passes through it?
	-Thooloo
	*/
/datum/controller/subsystem/sunlight/proc/InitializeTurfs(list/targets)
	//for (var/turf/T in (targets || world))
	for (var/z in SSmapping.levels_by_trait(ZTRAIT_STATION))
		for (var/turf/T in block(locate(1,1,z), locate(world.maxx,world.maxy,z)))
			if (T.dynamic_lighting && T.loc:dynamic_lighting)
				T.sunlight_overlay = new /atom/movable/sunlight_overlay(T)

// // It's safe to pass a list of non-turfs to this list - it'll only check turfs.

// /datum/controller/subsystem/sunlight/proc/InitializeTurfs(list/targets)
// 	for (var/turf/T in (targets || world))

// 		if (T.dynamic_sunlight && T.loc:dynamic_sunlight)
// 			T.sunlight_build_overlay()



/* set sunlight colour */
/datum/controller/subsystem/sunlight/proc/setColour()
	var/rp = /*LIGHTING_MULT_FACTOR **/ sqrt(GetRedPart(light_color)   / 255		)
	var/bp = /*LIGHTING_MULT_FACTOR **/ sqrt(GetBluePart(light_color)  / 255		)
	var/gp = /*LIGHTING_MULT_FACTOR **/ sqrt(GetGreenPart(light_color) / 255		)

	var/mx = max(rp, bp, gp) // Scale it so 1 is the strongest lum, if it is above 1.
	. = 1 // factor
	if (mx > 1)
		. = 1 / mx

	rp = round(rp * ., LIGHTING_ROUND_VALUE)
	bp = round(bp * ., LIGHTING_ROUND_VALUE)
	gp = round(gp * ., LIGHTING_ROUND_VALUE)

	color = list(
		-rp, -gp, -bp, 00,
		-rp, -gp, -bp, 00,
		-rp, -gp, -bp, 00,
		-rp, -gp, -bp, 00,
		-00, -00, -00, 01
	)


	//SSsunlight.cornerColour["[cr][cg][cb][ca]"]
	/* get all variations of corner colours, so we dont have to recalc this */
	/* I couldn't think of a neater way to do this */
	for( var/cr = 0 to 1)
		for( var/cg = 0 to 1)
			for( var/cb = 0 to 1)	
				for( var/ca = 0 to 1)
					cornerColour["[cr][cg][cb][ca]"] = \
					list(
						(cr * rp), (cr * gp), (cr * bp), 00,
						(cg * rp), (cg * gp), (cg * bp), 00,
						(cb * rp), (cb * gp), (cb * bp), 00,
						(ca * rp), (ca * gp), (ca * bp), 00,
						 01       ,  01       ,  01       , 01
					)





/datum/controller/subsystem/sunlight/fire(resumed = FALSE, no_mc_tick = FALSE)

	if(!(SSlighting.initialized))
		return
	nextBracket()

	MC_SPLIT_TICK_INIT(3)
	if (!no_mc_tick)
		MC_SPLIT_TICK

	while (wq_index <= workQueue.len)
		var/atom/movable/sunlight_overlay/W = workQueue[wq_index]
		wq_index += 1

		W.check_state()
		updateQueue |= W

		processed_overlays += 1

		if (no_mc_tick)
			CHECK_TICK
		else if (MC_TICK_CHECK)
			break

	if (wq_index > 1)
		workQueue.Cut(1, wq_index)
		wq_index = 1

	if (!no_mc_tick)
		MC_SPLIT_TICK

	while (uq_indeq <= updateQueue.len)
		var/atom/movable/sunlight_overlay/U = updateQueue[uq_indeq]
		uq_indeq += 1

		U.update_colour()

		processed_colours += 1

		if (no_mc_tick)
			CHECK_TICK
		else if (MC_TICK_CHECK)
			break

	if (uq_indeq > 1)
		updateQueue.Cut(1, uq_indeq)
		uq_indeq = 1

	if (!no_mc_tick)
		MC_SPLIT_TICK


	/* this runs uber slow when we do a unique |= add in the sunlight calc loop, so do it here */
	// cornerQueue = uniqueList(cornerQueue)
	while (cq_indeq <= cornerQueue.len)
		var/atom/movable/sunlight_overlay/U = cornerQueue[cq_indeq].sunlight_overlay
		cq_indeq += 1

		var/turf/T = U.loc
		if(!T.roof) /* unroofed turfs already are fullbright */
			continue

		U.update_corner()

		processed_corners += 1

		if (no_mc_tick)
			CHECK_TICK
		else if (MC_TICK_CHECK)
			break

	if (cq_indeq > 1)
		cornerQueue.Cut(1, cq_indeq)
		cq_indeq = 1

	if (!no_mc_tick)
		MC_SPLIT_TICK

/datum/controller/subsystem/sunlight/proc/nextBracket()
	var/Time = station_time()
	var/newTime

	switch (Time)
		if (CYCLE_SUNRISE 	to CYCLE_MORNING - 1)
			newTime = "SUNRISE"
		if (CYCLE_MORNING 	to CYCLE_DAYTIME 	- 1)
			newTime = "MORNING"
		if (CYCLE_DAYTIME 	to CYCLE_AFTERNOON	- 1)
			newTime = "DAYTIME"
		if (CYCLE_AFTERNOON to CYCLE_SUNSET 	- 1)
			newTime = "AFTERNOON"
		if (CYCLE_SUNSET 	to CYCLE_NIGHTTIME - 1)
			newTime = "SUNSET"
		else
			newTime = "NIGHTTIME"

	if (newTime != currentTime)
		currentTime = newTime
		updateLight(currentTime)
		setColour()
		. = TRUE


/datum/controller/subsystem/sunlight/proc/updateLight(newTime)
	light_color = "#808080"
	// switch (newTime)
	// 	if ("SUNRISE")
	// 		light_color = "#ffd1b3"
	// 		light_power = 0.3
	// 	if ("MORNING")
	// 		light_color = "#fff2e6"
	// 		light_power = 0.5
	// 	if ("DAYTIME")
	// 		light_color = "#FFFFFF"
	// 		light_power = 0.75
	// 	if ("AFTERNOON")
	// 		light_color = "#fff2e6"
	// 		light_power = 0.5
	// 	if ("SUNSET")
	// 		light_color = "#ffcccc"
	// 		light_power = 0.3
	// 	if("NIGHTTIME")
	// 		light_color = "#00111a"
	// 		light_power = 0.15


#undef CYCLE_SUNRISE
#undef CYCLE_MORNING
#undef CYCLE_DAYTIME
#undef CYCLE_AFTERNOON
#undef CYCLE_SUNSET
#undef CYCLE_NIGHTTIME
