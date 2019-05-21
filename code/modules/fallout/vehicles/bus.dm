//Fallout 13 ambush bus directory

/obj/structure/closet/bus
	name = "\proper ancient City Liner bus"
	desc = "A derelict bus that belonged to a City Liner network.<br>Despite all the decades it has spent out in the open, the exterior looks more or less intact."
	icon_state = "bus"
	pixel_x = -110
	pixel_y = -18
	anchored = 1
	layer = ABOVE_MOB_LAYER
	icon = 'icons/fallout/vehicles/bus.dmi'
	density = 1
	appearance_flags = 0
	icon_door_override = TRUE
	obj_integrity = 200
	max_integrity = 200
	integrity_failure = 50

/obj/structure/closet/bus/New()
	..()
	var/go/S = new (locate(x-3,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x-2,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x-1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	S = new (locate(x+2,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()

/obj/structure/closet/bus/can_close(mob/living/user)
	if(broken)
		return 0
	return ..()

/obj/structure/closet/bus/update_icon()
	cut_overlays()
	var/image/I = image(icon,src,"bus_overlay",LOW_OBJ_LAYER)
	add_overlay(I)
	if(!broken)
		if(!opened)
			I = image(icon,src,"bus_closed",CLOSED_DOOR_LAYER)
			add_overlay(I)
		else
			I = image(icon,src,"bus_open",ABOVE_MOB_LAYER)
			add_overlay(I)

/obj/structure/closet/bus/CheckExit(go/O as mob|obj, target)
	. = ..()
	if(!.)
		return 0
	if(get_dir(O.loc, target) == NORTH)
		return 0

/obj/structure/closet/bus/CanPass(go/mover, turf/target, height=0)
	. = ..()
	if(!.)
		return 0
	if(get_dir(loc, target) == NORTH)
		return 0

/obj/structure/closet/bus/bust_open()
	..()
	new /obj/structure/bus_door(locate(x,y - 1,z))
	resistance_flags |= INDESTRUCTIBLE
	playsound(src, 'sound/effects/meteorimpact.ogg', rand(50,100), 1)

/obj/structure/bus_door
	name = "broken bus door"
	icon = 'icons/fallout/objects/structures/trash.dmi'
	icon_state = "bus_door"
	anchored = 1
	density = 0