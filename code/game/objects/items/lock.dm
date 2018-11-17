/obj/item/lock_construct
	name = "lock"
	icon = 'icons/obj/lock.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/locked
	var/lock_data
	var/static/lock_uid = 1

/obj/item/lock_construct/Initialize() // Same system machines use for UID. Could probably add a global UID for everything if you wanted and use it for shenanigans, or simpler loading.
	..()
	lock_data = lock_uid++
	desc = "A heavy-duty lock for doors. It has a [lock_data] engraved on it."

/obj/item/lock_construct/attackby(/obj/item/I, var/mob/user) // Blatantly borrowed from Baystation coders and modified for simplicity. Thanks for pointing me in that direction, Rhicora.
	if(istype(I,/obj/item/key))
		var/obj/item/key/K = I
		if(!K.lock_data)
			to_chat(user, "<span class='notice'>You fashion \the [I] to unlock \the [src]</span>")
			K.lock_data = lock_data
			K.desc = "A simple key for locks. It has a [K.lock_data] engraved on it."
		else
			to_chat(user, "<span class='warning'>\The [I] already unlocks something...</span>")
		return
	if(istype(I,/obj/item/lock_construct))
		var/obj/item/lock_construct/L = I
		L.lock_data = src.lock_data
		to_chat(user, "<span class='notice'>You copy the lock from \the [src] to \the [L], making them identical.</span>")
		L.desc = "A heavy-duty lock for doors. It has a [L.lock_data] engraved on it."
		return
	..()

/obj/item/lock_construct/proc/check_key(obj/item/key/K, mob/user = null)
	if(K.lock_data == src.lock_data) //if the key matches us
		if(locked)
			user.visible_message("[user] unlocks the door.")
			locked = FALSE
		else
			user.visible_message("[user] locks the door.")
			locked = TRUE
	else
		to_chat(user, "This is the wrong key!")

/obj/item/key
	name = "key"
	icon = 'icons/obj/key.dmi'
	w_class = WEIGHT_CLASS_TINY
	var/lock_data = ""

/obj/item/key/New()
	..()
	desc = "A simple key for locks. It has a [lock_data] engraved on it."

/obj/item/key/attackby(/obj/item/stack/rods, mob/user, params)
	var/obj/item/stack/rods/M
	to_chat(user, "<span class='notice'>You begin to shape a rod into [src]...</span>")
	if(do_after(user, 35, target = src))
		if(M.get_amount() < 1 || !M)
			return
		var/obj/item/key/S = new /obj/item/key
		M.use(1)
		user.put_in_hands(S)
		to_chat(user, "<span class='notice'>You make a [S] identical to the old [src].</span>")
		S.lock_data = src.lock_data
	else
		return ..()

