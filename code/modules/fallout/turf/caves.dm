//Fallout 13 caves and mining system, classics of SS13 circa 2012

/**********************Mineral deposits**************************/

var/global/list/rockTurfEdgeCache
#define NORTH_EDGING	"north"
#define SOUTH_EDGING	"south"
#define EAST_EDGING		"east"
#define WEST_EDGING		"west"
turf/var/rockpick=null
turf/closed/mineral/proc/randomizerock(mineraltype)
	icon_state = pick("rock1","rock2","rock3","rock4","rock5","rock6")
	spawn(50)
		spawn(1)
			for(var/turf/t in orange(1,src))
				t.updateMineralOverlays()
	switch(mineraltype)
		if("iron")
			icon_state = pick("rock_Iron1","rock_Iron2","rock_Iron3")
		if("gold")
			icon_state = pick("rock_Gold1","rock_Gold2","rock_Gold3")
		if("silver")
			icon_state = pick("rock_Silver1","rock_Silver2","rock_Silver3")
		if("uranium")
			icon_state = pick("rock_Uranium1","rock_Uranium2","rock_Uranium3")
		if("diamond")
			icon_state = pick("rock_Diamond1","rock_Diamond2","rock_Diamond3")
		if("plasma")
			icon_state = pick("rock_Plasma1","rock_Plasma2","rock_Plasma3")
		if("bscrystal")
			icon_state = pick("rock_Iron1","rock_Iron2","rock_Iron3")
		if("bananium")
			icon_state = pick("rock_Clown1","rock_Clown2","rock_Clown3")

/turf/closed/mineral //wall piece
	name = "rock"
	icon = 'icons/fallout/turfs/mining.dmi'
	var/smooth_icon = 'icons/turf/smoothrocks.dmi'
	smooth = SMOOTH_MORE|SMOOTH_BORDER
	canSmoothWith
	layer = TURF_LAYER + 0.1

/turf/closed/mineral/New()
	..()
	randomizerock(mineraltype)

/turf/closed/mineral/shuttleRotate(rotation)
	setDir(angle2dir(rotation+dir2angle(dir)))
	queue_smooth(src)

/turf/closed/mineral/ChangeTurf(path, defer_change = FALSE, ignore_air = FALSE)
	for(var/turf/t in range(1,src))
		t.clearMineralOverlays()
	..()
	for(var/turf/t in range(1,src))
		t.updateMineralOverlays()


/*/turf/closed/mineral/random/New()
	..()
	if (prob(mineralChance))
		mineralSpawnChanceList = list(
			/turf/closed/mineral/uranium = 5, /turf/closed/mineral/diamond = 1, /turf/closed/mineral/gold = 10,
			/turf/closed/mineral/silver = 12, /turf/closed/mineral/plasma = 20, /turf/closed/mineral/iron = 40, /turf/closed/mineral/titanium = 11,
			/turf/closed/mineral/gibtonite = 4, /turf/open/indestructible/ground/mountain = 2, /turf/closed/mineral/bscrystal = 1)
		var/mName = pickweight(mineralSpawnChanceList) //temp mineral name
		if (mName)
			var/turf/closed/mineral/M
			switch(mName)
				if("Uranium")
					M = new/turf/closed/mineral/uranium(src)
					M.randomizerock("uranium")
				if("Iron")
					M = new/turf/closed/mineral/iron(src)
					M.randomizerock("iron")
				if("Diamond")
					M = new/turf/closed/mineral/diamond(src)
					M.randomizerock("diamond")
				if("Gold")
					M = new/turf/closed/mineral/gold(src)
					M.randomizerock("gold")
				if("Silver")
					M = new/turf/closed/mineral/silver(src)
					M.randomizerock("silver")
				if("Plasma")
					M = new/turf/closed/mineral/plasma(src)
					M.randomizerock("plasma")
					new/turf/open/indestructible/ground/mountain(src)
				if("Gibtonite")
					M = new/turf/closed/mineral/gibtonite(src)
					M.randomizerock("gibtonite")
				if("Bananium")
					M = new/turf/closed/mineral/clown(src)
					M.randomizerock("bananium")
				if("BScrystal")
					M = new/turf/closed/mineral/bscrystal(src)
					M.randomizerock("bscrystal")
				/*if("Adamantine")
					M = new/turf/closed/mineral/adamantine(src)*/
			if(M)
				M.mineralAmt = rand(1, 5)
				M.environment_type = src.environment_type
				M.turf_type = src.turf_type
				M.baseturf = src.baseturf
				src = M
				M.levelupdate()
	return
*/

/turf/closed/mineral/random/New()
	if (!mineralSpawnChanceList)
		mineralSpawnChanceList = list(
			/turf/closed/mineral/uranium = 5, /turf/closed/mineral/diamond = 1, /turf/closed/mineral/gold = 10,
			/turf/closed/mineral/silver = 12, /turf/closed/mineral/plasma = 20, /turf/closed/mineral/iron = 40, /turf/closed/mineral/titanium = 11,
			/turf/closed/mineral/gibtonite = 4, /turf/open/indestructible/ground/mountain = 2, /turf/closed/mineral/bscrystal = 1)
	if (display_icon_state)
		icon_state = display_icon_state
	..()
	if (prob(mineralChance))
		var/path = pickweight(mineralSpawnChanceList)
		var/turf/T = ChangeTurf(path,FALSE,TRUE)

		if(T && ismineralturf(T))
			var/turf/closed/mineral/M = T
			M.mineralAmt = rand(1, 5)
			M.environment_type = src.environment_type
			M.turf_type = src.turf_type
			M.randomizerock(M.mineraltype)
			M.baseturf = src.baseturf
			src = M
			M.levelupdate()
			M.recalc_atom_opacity()
