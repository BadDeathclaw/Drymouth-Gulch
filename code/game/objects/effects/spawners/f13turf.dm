// Procedural Mountain Spawner
// This makes mountains passable or impassable based on a random seed 1-10
// To use:
// - Place a "procedural rock spawner type 3" down in the mountain
// - If the seed is 3, it will spawn mineable rock, otherwise it will do nothing.
// - You can also use "procedural dense spawner type 3" to spawn impassable rock, conditional on the seed drawn.

/obj/effect/spawner/turf
	name = "map turf spawner"
	var/list/spawn_list
	var/spawn_on = 0

/obj/effect/spawner/turf/Initialize()
	. = ..()
	if(SPAWNER_SEED == spawn_on)
		if(spawn_list && spawn_list.len)
			for(var/T in spawn_list)
				new T(get_turf(src))
	return INITIALIZE_HINT_QDEL

/obj/effect/spawner/turf/dense
	icon = 'icons/obj/structures_spawners.dmi'
	icon_state = "rock_closed_1"
	name = "procedural dense spawner"
	spawn_list = list(/turf/closed/indestructible/rock)
	spawn_on = 1

/obj/effect/spawner/turf/dense/type2
	spawn_on = 2
	icon_state = "rock_closed_2"

/obj/effect/spawner/turf/dense/type3
	spawn_on = 3
	icon_state = "rock_closed_3"

/obj/effect/spawner/turf/dense/type4
	spawn_on = 4
	icon_state = "rock_closed_4"

/obj/effect/spawner/turf/dense/type5
	spawn_on = 5
	icon_state = "rock_closed_5"

/obj/effect/spawner/turf/dense/type6
	spawn_on = 6
	icon_state = "rock_closed_6"

/obj/effect/spawner/turf/dense/type7
	spawn_on = 7
	icon_state = "rock_closed_7"

/obj/effect/spawner/turf/dense/type8
	spawn_on = 8
	icon_state = "rock_closed_8"

/obj/effect/spawner/turf/dense/type9
	spawn_on = 9
	icon_state = "rock_closed_9"

/obj/effect/spawner/turf/dense/type10
	spawn_on = 10
	icon_state = "rock_closed_10"

/obj/effect/spawner/turf/open
	icon = 'icons/obj/structures_spawners.dmi'
	icon_state = "rock_open_1"
	name = "procedural rock spawner"
	spawn_list = list(/turf/closed/mineral/random/low_chance)
	spawn_on = 1

/obj/effect/spawner/turf/open/type2
	spawn_on = 2
	icon_state = "rock_open_2"

/obj/effect/spawner/turf/open/type3
	spawn_on = 3
	icon_state = "rock_open_3"

/obj/effect/spawner/turf/open/type4
	spawn_on = 4
	icon_state = "rock_open_4"

/obj/effect/spawner/turf/open/type5
	spawn_on = 5
	icon_state = "rock_open_5"

/obj/effect/spawner/turf/open/type6
	spawn_on = 6
	icon_state = "rock_open_6"

/obj/effect/spawner/turf/open/type7
	spawn_on = 7
	icon_state = "rock_open_7"

/obj/effect/spawner/turf/open/type8
	spawn_on = 8
	icon_state = "rock_open_8"

/obj/effect/spawner/turf/open/type9
	spawn_on = 9
	icon_state = "rock_open_9"

/obj/effect/spawner/turf/open/type10
	spawn_on = 10
	icon_state = "rock_open_10"