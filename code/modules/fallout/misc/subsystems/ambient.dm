//Fallout 13 - the best sound atmosphere there is before year 2020

SUBSYSTEM_DEF(ambient)
	name = "Ambient"
	init_order = 20
	priority = 20

	wait = 5

	var/list/processing = list()
	var/list/currentrun = list()
	var/min_wait_random_ambient = 1000
	var/max_wait_random_ambient = 2000 //1000 - 1,5 min 2000 - 3 min 3000 - 5 min
	var/next_speach = 0

/datum/controller/subsystem/ambient/New()
	NEW_SS_GLOBAL(SSambient)

/datum/controller/subsystem/ambient/Initialize(start_timeofday)
	next_speach = world.time + rand(min_wait_random_ambient, max_wait_random_ambient)
	..()
/datum/controller/subsystem/ambient/stat_entry()
	..("P:[processing.len]")

/datum/controller/subsystem/ambient/fire(resumed = 0)
	if (!resumed)
		src.currentrun = processing.Copy()
	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while(currentrun.len)
		var/atom/thing = currentrun[currentrun.len]
		currentrun.len--
		if(thing)
			thing.RefreshAmbient()
		else
			SSambient.processing -= thing
		if (MC_TICK_CHECK)
			return

	if(next_speach < world.time)
		random_ambient()
		next_speach = world.time + rand(min_wait_random_ambient, max_wait_random_ambient)

/datum/controller/subsystem/ambient/Recover()
	if (istype(SSambient.processing))
		processing = SSambient.processing

/datum/controller/subsystem/ambient/proc/random_ambient()
	for(var/area/A in world)
		if(!A.ambientsounds || !A.ambientsounds.len)
			continue
		var/sound/S = sound(pick(A.ambientsounds))
		if(istype(S))
			for(var/mob/M in A)
				if(M.client)
					S.volume = M.client.prefs.sounds_volume * 100
					to_chat(M, S)

