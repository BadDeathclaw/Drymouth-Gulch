var/datum/subsystem/mob_spawner/SSspawner

//Var which showing how many hostiles alive at this time.
var/global/live_hostiles = 0

/datum/subsystem/mob_spawner
	name = "Mob Spawner"
	wait = 300
	var/list/spawners

/datum/subsystem/mob_spawner/New()
	NEW_SS_GLOBAL(SSspawner)

/datum/subsystem/mob_spawner/Initialize(timeofday, zlevel)
	spawners = list()
	for(var/obj/effect/mob_spawner/spawner in world)
		if(spawner.mob_type)
			spawners += spawner
		else
			qdel(spawner)
	..()

/datum/subsystem/mob_spawner/fire()
	if(!spawners || !spawners.len)
		return
	if(config.hostiles_count <= live_hostiles)
		return
	var/obj/effect/mob_spawner/S = pick(spawners)
	if(!S)
		spawners -= S
		return
	PoolOrNew(S.mob_type, get_turf(S))

/datum/subsystem/mob_spawner/stat_entry()
	..("S:[spawners.len]")
