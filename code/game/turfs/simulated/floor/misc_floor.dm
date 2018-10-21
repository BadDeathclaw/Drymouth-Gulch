/turf/open/floor/goonplaque
	name = "commemorative plaque"
	icon_state = "plaque"
	desc = "\"This is a plaque in honour of our comrades on the G4407 Stations. Hopefully TG4407 model can live up to your fame and fortune.\" Scratched in beneath that is a crude image of a meteor and a spaceman. The spaceman is laughing. The meteor is exploding."
	floor_tile = /obj/item/stack/tile/plasteel

/turf/open/floor/vault
	icon_state = "rockvault"
	floor_tile = /obj/item/stack/tile/plasteel

//Circuit flooring, glows a little
/turf/open/floor/circuit
	icon = 'icons/turf/floors.dmi'
	icon_state = "bcircuit"
	var/icon_normal = "bcircuit"
	light_color = LIGHT_COLOR_CYAN
	floor_tile = /obj/item/stack/tile/circuit
	var/on = TRUE

/turf/open/floor/circuit/Initialize()
	SSmapping.nuke_tiles += src
	update_icon()
	. = ..()

/turf/open/floor/circuit/Destroy()
	SSmapping.nuke_tiles -= src
	return ..()

/turf/open/floor/circuit/update_icon()
	if(on)
		if(LAZYLEN(SSmapping.nuke_threats))
			icon_state = "rcircuitanim"
			light_color = LIGHT_COLOR_FLARE
		else
			icon_state = icon_normal
			light_color = initial(light_color)
		set_light(1.4, 0.5)
	else
		icon_state = "[icon_normal]off"
		set_light(0)

/turf/open/floor/circuit/off
	icon_state = "bcircuitoff"
	on = FALSE

/turf/open/floor/circuit/airless
	initial_gas_mix = "TEMP=2.7"

/turf/open/floor/circuit/killroom
	name = "killroom Floor"
	initial_gas_mix = "n2=500;TEMP=80"

/turf/open/floor/circuit/telecomms
	initial_gas_mix = "n2=100;TEMP=80"

/turf/open/floor/circuit/telecomms/mainframe
	name = "mainframe Base"

/turf/open/floor/circuit/telecomms/server
	name = "server Base"

/turf/open/floor/circuit/green
	icon_state = "gcircuit"
	icon_normal = "gcircuit"
	light_color = LIGHT_COLOR_GREEN
	floor_tile = /obj/item/stack/tile/circuit/green

/turf/open/floor/circuit/green/off
	icon_state = "gcircuitoff"
	on = FALSE

/turf/open/floor/circuit/green/anim
	icon_state = "gcircuitanim"
	icon_normal = "gcircuitanim"
	floor_tile = /obj/item/stack/tile/circuit/green/anim

/turf/open/floor/circuit/green/airless
	initial_gas_mix = "TEMP=2.7"

/turf/open/floor/circuit/green/telecomms
	initial_gas_mix = "n2=100;TEMP=80"

/turf/open/floor/circuit/green/telecomms/mainframe
	name = "mainframe Base"

/turf/open/floor/circuit/red
	icon_state = "rcircuit"
	icon_normal = "rcircuit"
	light_color = LIGHT_COLOR_FLARE
	floor_tile = /obj/item/stack/tile/circuit/red

/turf/open/floor/circuit/red/off
	icon_state = "rcircuitoff"
	on = FALSE

/turf/open/floor/circuit/red/anim
	icon_state = "rcircuitanim"
	icon_normal = "rcircuitanim"
	floor_tile = /obj/item/stack/tile/circuit/red/anim

/turf/open/floor/circuit/red/airless
	initial_gas_mix = "TEMP=2.7"

/turf/open/floor/circuit/red/telecomms
	initial_gas_mix = "n2=100;TEMP=80"

/turf/open/floor/pod
	name = "pod floor"
	icon_state = "podfloor"
	icon_regular_floor = "podfloor"
	floor_tile = /obj/item/stack/tile/pod

/turf/open/floor/pod/light
	icon_state = "podfloor_light"
	icon_regular_floor = "podfloor_light"
	floor_tile = /obj/item/stack/tile/pod/light

/turf/open/floor/pod/dark
	icon_state = "podfloor_dark"
	icon_regular_floor = "podfloor_dark"
	floor_tile = /obj/item/stack/tile/pod/dark


/turf/open/floor/noslip
	name = "high-traction floor"
	icon_state = "noslip"
	floor_tile = /obj/item/stack/tile/noslip
	broken_states = list("noslip-damaged1","noslip-damaged2","noslip-damaged3")
	burnt_states = list("noslip-scorched1","noslip-scorched2")
	slowdown = -0.3

/turf/open/floor/noslip/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/floor/oldshuttle
	icon = 'icons/turf/shuttleold.dmi'
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/plasteel

//Clockwork floor: Slowly heals toxin damage on nearby servants.
/turf/open/floor/clockwork
	name = "clockwork floor"
	desc = "Tightly-pressed brass tiles. They emit minute vibration."
	icon_state = "plating"
	baseturfs = /turf/open/floor/clockwork
	var/uses_overlay = TRUE
	var/obj/effect/clockwork/overlay/floor/realappearence

/turf/open/floor/clockwork/Bless() //Who needs holy blessings when you have DADDY RATVAR?
	return

/turf/open/floor/clockwork/Initialize()
	. = ..()
	if(uses_overlay)
		new /obj/effect/temp_visual/ratvar/floor(src)
		new /obj/effect/temp_visual/ratvar/beam(src)
		realappearence = new /obj/effect/clockwork/overlay/floor(src)
		realappearence.linked = src

/turf/open/floor/clockwork/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(uses_overlay && realappearence)
		QDEL_NULL(realappearence)
	return ..()

/turf/open/floor/clockwork/ReplaceWithLattice()
	. = ..()
	for(var/obj/structure/lattice/L in src)
		L.ratvar_act()

/turf/open/floor/clockwork/Entered(atom/movable/AM)
	..()
	START_PROCESSING(SSobj, src)

/turf/open/floor/clockwork/process()
	if(!healservants())
		STOP_PROCESSING(SSobj, src)

/turf/open/floor/clockwork/proc/healservants()
	for(var/mob/living/L in src)
		if(L.stat == DEAD)
			continue
		. = 1
		if(!is_servant_of_ratvar(L) || !L.toxloss)
			continue

		var/image/I = new('icons/effects/effects.dmi', src, "heal", ABOVE_MOB_LAYER) //fake a healing glow for servants
		I.appearance_flags = RESET_COLOR
		I.color = "#5A6068"
		I.pixel_x = rand(-12, 12)
		I.pixel_y = rand(-9, 0)
		var/list/viewing = list()
		for(var/mob/M in viewers(src))
			if(M.client && (is_servant_of_ratvar(M) || isobserver(M) || M.stat == DEAD))
				viewing += M.client
		flick_overlay(I, viewing, 8)
		L.adjustToxLoss(-3, TRUE, TRUE)

/turf/open/floor/clockwork/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/clockwork/crowbar_act(mob/living/user, obj/item/I)
	if(baseturfs == type)
		return TRUE
	user.visible_message("<span class='notice'>[user] begins slowly prying up [src]...</span>", "<span class='notice'>You begin painstakingly prying up [src]...</span>")
	if(I.use_tool(src, user, 70, volume=80))
		user.visible_message("<span class='notice'>[user] pries up [src]!</span>", "<span class='notice'>You pry up [src]!</span>")
		make_plating()
	return TRUE

/turf/open/floor/clockwork/make_plating()
	new /obj/item/stack/tile/brass(src)
	return ..()

/turf/open/floor/clockwork/narsie_act()
	..()
	if(istype(src, /turf/open/floor/clockwork)) //if we haven't changed type
		var/previouscolor = color
		color = "#960000"
		animate(src, color = previouscolor, time = 8)
		addtimer(CALLBACK(src, /atom/proc/update_atom_colour), 8)

/turf/open/floor/clockwork/reebe
	name = "cogplate"
	desc = "Warm brass plating. You can feel it gently vibrating, as if machinery is on the other side."
	icon_state = "reebe"
	baseturfs = /turf/open/floor/clockwork/reebe
	uses_overlay = FALSE
	planetary_atmos = TRUE

/turf/open/floor/bluespace
	slowdown = -1
	icon_state = "bluespace"
	desc = "Through a series of micro-teleports these tiles let people move at incredible speeds."
	floor_tile = /obj/item/stack/tile/bluespace


/turf/open/floor/sepia
	slowdown = 2
	icon_state = "sepia"
	desc = "Time seems to flow very slowly around these tiles."
	floor_tile = /obj/item/stack/tile/sepia


/turf/open/floor/bronze
	name = "bronze floor"
	desc = "Some heavy bronze tiles."
	icon = 'icons/obj/clockwork_objects.dmi'
	icon_state = "clockwork_floor"
	floor_tile = /obj/item/stack/tile/bronze

/turf/open/floor/bronze
	name = "bronze floor"
	desc = "Some heavy bronze tiles."
	icon = 'icons/obj/clockwork_objects.dmi'
	icon_state = "clockwork_floor"
	floor_tile = /obj/item/stack/tile/bronze






/* Fallout stuff - TODO: Move to a separate folder/file */
/* Also, a terrain class or something needs to be used as the common parent  for asteroid and outside */
/* lazy Saturday coding */

/*Surely setting planetary atmos won't fuck everything?*/
/turf/open/floor/plating/f13/outside
	icon = 'icons/turf/f13desert.dmi'
	icon_state = "wasteland1"
	light_range = 3
	light_power = 0.75
	planetary_atmos = TRUE

/turf/open/floor/plating/f13
	gender = PLURAL
	name = "\proper desert"
	baseturfs = /turf/open/floor/plating/f13/outside
	icon = 'icons/turf/f13desert.dmi'
	icon_state = "wasteland1"
	icon_plating = "wasteland1"
	attachment_holes = FALSE
	light_range = 3
	light_power = 0.75
	planetary_atmos = TRUE

/* so we can't break this */
/turf/open/floor/plating/f13/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/plating/f13/burn_tile()
	return

/turf/open/floor/plating/f13/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/floor/plating/f13/MakeDry()
	return

#define GRASS_SPONTANEOUS 		2
#define GRASS_WEIGHT 			4
#define LUSH_PLANT_SPAWN_LIST list(/obj/structure/flora/grass/wasteland = 10, /obj/structure/flora/tree/wasteland = 1)
#define DESOLATE_PLANT_SPAWN_LIST list(/obj/structure/flora/grass/wasteland = 1)
/* Outside turfs get global lighting */
/turf/open/floor/plating/f13/outside/Initialize()
	. = ..()
	flags_2 |= GLOBAL_LIGHT_TURF_2



/turf/open/floor/plating/f13/outside/desert
	name = "\proper desert"
	desc = "A stretch of desert."
	icon = 'icons/turf/f13desert.dmi'
	icon_state = "wasteland1"
	var/obj/structure/flora/turfPlant = null
	//light_color = LIGHT_COLOR_LAVA
	slowdown = 2
	//PIT
	//var/turf_type = /turf/ground/desert
	//var/dug = 0
	//var/storedindex = 0
	//var/mob/living/gravebody
	//var/obj/structure/closet/coffin/gravecoffin
	//var/pitcontents = list()
	//var/obj/dugpit/ground/mypit
	//var/unburylevel = 0



/turf/open/floor/plating/f13/outside/desert/Initialize()
	. = ..()
	//If no fences, machines (soil patches are machines), etc. try to plant grass
	if(!(\
			(locate(/obj/structure) in src) || \
			(locate(/obj/machinery) in src) ))
		plantGrass()

//Pass PlantForce for admin stuff I guess?
/turf/open/floor/plating/f13/outside/desert/proc/plantGrass(Plantforce = FALSE)
	var/Weight = 0
	var/randPlant = null

	//spontaneously spawn grass
	if(Plantforce || prob(GRASS_SPONTANEOUS))
		randPlant = pickweight(LUSH_PLANT_SPAWN_LIST) //Create a new grass object at this location, and assign var
		turfPlant = new randPlant(src)
		. = TRUE //in case we ever need this to return if we spawned
		return.

	//loop through neighbouring desert turfs, if they have grass, then increase weight
	for(var/turf/open/floor/plating/f13/outside/desert/T in RANGE_TURFS(3, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

	//use weight to try to spawn grass
	if(prob(Weight))

		//If surrounded on 5+ sides, pick from lush
		if(Weight == (5 * GRASS_WEIGHT))
			randPlant = pickweight(LUSH_PLANT_SPAWN_LIST)
		else
			randPlant = pickweight(DESOLATE_PLANT_SPAWN_LIST)
		turfPlant = new randPlant(src)
		. = TRUE


//Make sure we delete the plant if we ever change turfs
/turf/open/floor/plating/f13/outside/desert/ChangeTurf()
	if(turfPlant)
		qdel(turfPlant)
	. =  ..()


/turf/open/floor/plating/f13/outside/desert/New()
	..()
	icon_state = "wasteland[rand(1,31)]"

/turf/open/floor/plating/f13/outside/road
	name = "\proper road"
	desc = "A stretch of road."
	icon = 'icons/turf/f13road.dmi'
	icon_state = "outermiddle"

/turf/open/floor/wood/f13
	icon = 'icons/turf/f13floorsmisc.dmi'
	icon_state = "housewood1"

/turf/open/floor/wood/f13/old
	name = "wood planks"
	desc = "Rotting wooden flooring."

/turf/open/floor/plasteel/f13/vault_floor
	name = "vault floor"
	icon = 'icons/turf/f13floors2.dmi'
	icon_state = "vault_floor"

/turf/open/floor/plating/f13/inside/mountain
	name = "mountain"
	desc = "Damp cave flooring."
	icon = 'icons/turf/f13floors2.dmi'
	icon_state = "mountain0"

/turf/open/floor/plating/f13/inside/mountain/New()
	..()
	icon_state = "mountain[rand(0,10)]"
