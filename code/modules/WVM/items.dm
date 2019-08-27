/* Code by Tienn */

// -- Key --
/obj/item/key/vending
	name = "Vending Machine Key"
	desc = "Vending machine key."
	icon = 'icons/fallout/vehicles/small_vehicles.dmi'
	icon_state = "key-door"
	var/id = 0

/obj/item/key/vending/proc/set_name(newname)
	if(name != newname)
		name = newname + " key"
		playsound(src, 'sound/misc/splort.ogg', 60, 1)

/obj/item/key/vending/attackby(obj/item/P, mob/living/carbon/human/user, params)
	if(istype(P, /obj/item/pen) || istype(P, /obj/item/toy/crayon))
		var/newkeyname = input(usr, "Input a new key name", "Name change", name) as null|text
		set_name(newkeyname)
		to_chat(usr, "You changed the name to - " + name)

// -- Lock --
/obj/item/lock_part
	name = "Vending Machine Lock"
	desc = "Vending machine lock"
	icon = 'icons/WVM/lock_icon.dmi'
	icon_state = "lock"

	var/is_open = 0
	var/is_secured = 1
	var/keys[0]

/obj/item/lock_part/proc/check_key(obj/item/key/vending/K)
	if(K in keys)
		return 1
	else
		return 0

/obj/item/lock_part/proc/set_open(var/newopen)
	if(is_open != newopen)
		is_open = newopen

/obj/item/lock_part/proc/store_key(obj/item/key/vending/K)
	if(is_secured)
		to_chat(usr, "Nothing happens. I need to use screwdriver first")
		return

	if(K in keys)
		to_chat(usr, "Key already stored.")
	else
		keys += K
		playsound(src, 'sound/machines/ding.ogg', 60, 1)
		to_chat(usr, "Now you can unlock this lock by your key..")

/obj/item/lock_part/attackby(obj/item/P, mob/living/carbon/human/user, params)
	if(istype(P, /obj/item/screwdriver))
		if(is_secured)
			is_secured = 0
			to_chat(usr, "Now you can store your key.")
		else
			is_secured = 1
			to_chat(usr, "Now this lock can be attached to vending machine.")
		playsound(src, 'sound/items/Screwdriver2.ogg', 60, 1)

	if(istype(P, /obj/item/key/vending))
		store_key(P)
