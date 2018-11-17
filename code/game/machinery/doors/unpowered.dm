/obj/machinery/door/unpowered
	var/obj/item/lock_construct/Lock
	var/lock_data

/obj/machinery/door/unpowered/emag_act()
	return

/obj/machinery/door/unpowered/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/lock_construct/) && do_after(user, 10, target = src))
		var/obj/item/lock_construct/L = I
		if(!user.transferItemToLoc(I, src))
			return
		Lock = L
		src.lock_data = L.lock_data
		user.visible_message("[user] adds a lock to the door.")
		desc = "[desc] has a lock engraved with a [L.lock_data]"
		return
	if(istype(I, /obj/item/key))
		var/obj/item/key/K = I
		if(Lock) //to check if we have added a lock, and should test the key
			return Lock.check_key(K)
	else
		return ..()

/obj/machinery/door/unpowered/CollidedWith(atom/movable/AM)
	..()
	if(Lock)
		if(Lock.check_key())
			return
..()

/obj/machinery/door/unpowered/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(Lock)
		if(Lock.check_key())
			to_chat(user, "It's locked!")
			return
	return try_to_activate_door(user)

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