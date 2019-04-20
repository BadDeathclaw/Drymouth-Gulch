/obj/machinery/door/unpowered

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
	max_integrity = 60
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 70)
	assemblytype = /obj/item/stack/sheet/mineral/wood/five
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

/obj/machinery/door/unpowered/wooddoor/attackby(obj/item/I, mob/living/user, params)
	add_fingerprint(user)
	if(istype(I, /obj/item/screwdriver) && density == FALSE)
		to_chat(user, "<span class='notice'>You begin to take apart the [name].</span>")
		if(do_after(user, 60, target = src))
			var/turf/T = get_turf(src)
			new /obj/item/stack/sheet/mineral/wood(T, 10)
			qdel(src)