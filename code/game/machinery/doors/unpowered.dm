/obj/machinery/door/unpowered

/obj/machinery/door/unpowered/CollidedWith(atom/movable/AM)
	if(src.locked)
		return
	..()
	return


/obj/machinery/door/unpowered/attackby(obj/item/I, mob/user, params)
	if(locked)
		return
	else
		return ..()

/obj/machinery/door/unpowered/emag_act()
	return

/obj/machinery/door/unpowered/shuttle
	icon = 'icons/turf/shuttle.dmi'
	name = "door"
	icon_state = "door1"
	opacity = 1
	density = TRUE
	explosion_block = 1

/obj/machinery/door/unpowered/wooddoor
	icon = 'icons/obj/doors/wasteland_doors.dmi' //
	name = "wooden door"
	icon_state = "room1" //
	opacity = 1
	density = TRUE
	explosion_block = 1


/obj/machinery/door/unpowered/wooddoor/update_icon()
	if(density)
		icon_state = "room1"
	else
		icon_state = "room0"

/obj/machinery/door/unpowered/wooddoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("roomc0", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("roomc1", src)