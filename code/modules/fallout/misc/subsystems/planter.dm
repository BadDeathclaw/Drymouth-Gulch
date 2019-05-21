//Fallout 13 dynamic flora simulation

SUBSYSTEM_DEF(planter)
	name = "Planter"
	wait = 150

/datum/controller/subsystem/planter/New()
	NEW_SS_GLOBAL(SSplanter)

/datum/controller/subsystem/planter/Initialize(timeofday, zlevel)
	var/plants_count = (world.maxx * world.maxy * world.maxz) * 0.01
	for(var/i=0, i<plants_count, i++)
		var/obj/structure/flora/wild_plant/p = spawn_plant()
		if(p)
			p.age = rand(1,5)
	generate_trees()
	generate_grass()
	..()

/datum/controller/subsystem/planter/fire()
	spawn_plant()

/datum/controller/subsystem/planter/proc/spawn_plant()
	var/turf/open/turf = locate(rand(1,world.maxx), rand(1,world.maxy), rand(1,world.maxz))
	var/area/A = get_area(turf) //SHIT CODE RIGHT HERE
	if(A.grow_chance && prob(A.grow_chance) && istype(turf) && !has_density(turf) && turf.allowed_plants && turf.allowed_plants.len && !(locate(/obj/structure/flora) in turf))
		return new /obj/structure/flora/wild_plant(turf, pick(turf.allowed_plants))

/datum/controller/subsystem/planter/proc/generate_trees()
	for(var/turf/T in get_area_turfs(/area/f13/forest))
		if(T.flags & CAN_HAVE_NATURE && prob(3) && !(locate(/obj) in T))
			var/cont = 0
			for(var/T2 in RANGE_TURFS(1,T))
				if(locate(/obj/structure/flora/tree) in T2)
					cont = 1
					break
			if(cont)
				continue
			var/tree_type = pick(/obj/structure/flora/tree/wasteland, /obj/structure/flora/tree/tall)
			var/obj/structure/flora/tree/tree = new tree_type()
			tree.forceMove(T)

/datum/controller/subsystem/planter/proc/generate_grass()
	for(var/turf/turf in world)
		if(!(turf.flags & CAN_HAVE_NATURE))
			continue
		if(locate(/obj/structure/flora) in turf)
			continue
		if(prob(5))
			new/obj/structure/flora/grass/wasteland(turf)
		else
			var/chance = 0
			for(var/turf/open/indestructible/ground/desert/T in RANGE_TURFS(1,turf))
				if(locate(/obj/structure/flora/grass) in T)
					chance += 10
			if(prob(chance))
				new/obj/structure/flora/grass/wasteland(turf)