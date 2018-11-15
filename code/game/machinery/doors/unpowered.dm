/obj/machinery/door/unpowered
	var/lock_data
	var/lock

/obj/machinery/door/unpowered/emag_act()
	return

/obj/machinery/door/unpowered/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/lock_construct) && do_after(user, 5, target = src))
		var/obj/item/lock_construct/L = I
		if((lock) && (!locked))
			to_chat(user, "You key the lock to be the same.")
			L.lock_data = lock_data
			L.desc = "A heavy-duty lock for doors. It has a [lock_data] engraved on it."
			return
		if((lock) && (locked))
			to_chat(user, "This door already has a lock on it!")
			return
		lock_data = L.lock_data
		lock = TRUE
		qdel(L)
		user.visible_message("[user] adds a lock to the door.")
		desc = "Has a lock with [lock_data] etched into it."
	if(istype(I, /obj/item/key))
		var/obj/item/key/K = I
		if(!lock)
			to_chat(user, "This door doesn't have a lock.")
			return
		if((lock) && (K.lock_data != lock_data))
			to_chat(user, "This is the wrong key!")
			return
		if((lock) && (K.lock_data == lock_data) && (locked == FALSE))
			locked = TRUE
			user.visible_message("[user] locks the door.")
			return
		if((lock) && (K.lock_data == lock_data) && (locked == TRUE))
			locked = FALSE
			user.visible_message("[user] unlocks the door.")
			return
	else
		return ..()

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
	autoclose = TRUE

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