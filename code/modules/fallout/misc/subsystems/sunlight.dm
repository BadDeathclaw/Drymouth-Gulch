#define STAGE_SOURCES  1
#define STAGE_CORNERS  2
#define STAGE_OVERLAYS 3

#define STEP_MORNING 0
#define STEP_DAY 1
#define STEP_EVENING 2
#define STEP_NIGHT 3

var/datum/subsystem/sunlight/SSsunlight

var/list/sunlighting_update_lights    = list() // List of lighting sources  queued for update.
var/list/sunlighting_update_corners   = list() // List of lighting corners  queued for update.
var/list/sunlighting_update_overlays  = list() // List of lighting overlays queued for update.

var/list/datum/time_of_day/time_cycle_steps = list(new /datum/time_of_day/morning(), new /datum/time_of_day/day(), \
                                 new /datum/time_of_day/evening(), new /datum/time_of_day/night())


/datum/subsystem/sunlight
	name          = "Sun Lighting"
	init_order    = 2
	display_order = 6
	wait          = LIGHTING_INTERVAL
	priority      = 25
	flags         = SS_TICKER

	var/list/currentrun_lights
	var/list/currentrun_corners
	var/list/currentrun_overlays
	var/list/sunlighting_planes = list()

	var/datum/time_of_day/current_step_datum
	var/datum/time_of_day/next_step_datum
	var/current_step
	var/next_step
	var/step_started
	var/step_finish
	var/current_color

	var/resuming_stage = 0


/datum/subsystem/sunlight/New()
	NEW_SS_GLOBAL(SSsunlight)


/datum/subsystem/sunlight/stat_entry()
	..("L:[sunlighting_update_lights.len]|C:[sunlighting_update_corners.len]|O:[sunlighting_update_overlays.len]")


/datum/subsystem/sunlight/Initialize(timeofday)
	if (config.starlight)
		for(var/area/A in world)
			if (A.dynamic_lighting == DYNAMIC_LIGHTING_IFSTARLIGHT)
				A.luminosity = 0

	set_time_of_day(STEP_DAY)

	create_all_sunlighting_overlays()

	..()

/datum/subsystem/sunlight/proc/set_time_of_day(var/step)
	if(step > time_cycle_steps.len)
		step = STEP_DAY
		dodaychange()
		/*
	switch(step)
		if(STEP_MORNING)
			if(prob(10)) //Sunrise brings hope for a new better day
				sandstorm()
		if(STEP_DAY)
			if(prob(15)) //Daylight bears hidden dangers
				sandstorm()
		if(STEP_EVENING)
			if(prob(10)) //Sundown gives expectations of safer night
				sandstorm()
		if(STEP_NIGHT)
			if(prob(5)) //The darkness of a night shouldn't be any worse
				sandstorm()
				*/
	step_started = world.time
	current_step = step
	current_step_datum = time_cycle_steps[current_step]
	step_finish = current_step_datum.duration + world.time

	next_step = current_step + 1
	if(next_step > time_cycle_steps.len)
		next_step = 1
	next_step_datum = time_cycle_steps[next_step]

/datum/subsystem/sunlight/proc/check_cycle()
	if(world.time > step_finish)
		set_time_of_day(current_step + 1)

/datum/subsystem/sunlight/proc/update_color()
	var/blend_amount = (world.time - step_started) / current_step_datum.duration
	current_color = BlendRGB(current_step_datum.color, next_step_datum.color, blend_amount)
	for(var/obj/screen/plane_master/lighting/P in sunlighting_planes)
		P.color = current_color

/datum/subsystem/sunlight/fire(resumed=FALSE)
	check_cycle()
	update_color()

	if (resuming_stage == 0 || !resumed)
		currentrun_lights   = sunlighting_update_lights
		sunlighting_update_lights   = list()

		resuming_stage = STAGE_SOURCES

	while (currentrun_lights.len)
		var/datum/sunlight_source/L = currentrun_lights[currentrun_lights.len]
		currentrun_lights.len--

		if (L.check() || L.destroyed || L.force_update)
			L.remove_lum()
			if (!L.destroyed)
				L.apply_lum()

		else if (L.vis_update) //We smartly update only tiles that became (in) visible to use.
			L.smart_vis_update()

		L.vis_update   = FALSE
		L.force_update = FALSE
		L.needs_update = FALSE

		if (MC_TICK_CHECK)
			return

	if (resuming_stage == STAGE_SOURCES || !resumed)
		currentrun_corners  = sunlighting_update_corners
		sunlighting_update_corners  = list()

		resuming_stage = STAGE_CORNERS

	while (currentrun_corners.len)
		var/datum/sunlighting_corner/C = currentrun_corners[currentrun_corners.len]
		currentrun_corners.len--

		C.update_overlays()
		C.needs_update = FALSE
		if (MC_TICK_CHECK)
			return

	if (resuming_stage == STAGE_CORNERS || !resumed)
		currentrun_overlays = sunlighting_update_overlays.Copy()

		resuming_stage = STAGE_OVERLAYS

	while (currentrun_overlays.len)
		var/atom/movable/sunlighting_overlay/O = currentrun_overlays[currentrun_overlays.len]
		currentrun_overlays.len--

		if (qdeleted(O))
			continue

		O.update_overlay()
		O.needs_update = FALSE
		if (MC_TICK_CHECK)
			return
#if defined(LIGHTING_ANIMATION)
	for(var/atom/movable/sunlighting_overlay/O in sunlighting_update_overlays)
		O.animate_color()
#endif
	sunlighting_update_overlays.Cut()
	resuming_stage = 0


/datum/subsystem/sunlight/Recover()
	initialized = SSsunlight.initialized
	..()

#undef STAGE_SOURCES
#undef STAGE_CORNERS
#undef STAGE_OVERLAYS