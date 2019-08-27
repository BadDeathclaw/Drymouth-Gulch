GLOBAL_LIST_EMPTY(global_locks)
/obj/item/lock_construct
	name = "\improper lock"
	icon = 'icons/obj/lock.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/lock_data
	var/static/lock_uid = 1
	var/locked = FALSE
	var/prying = FALSE //if somebody is trying to pry us off

/obj/item/lock_construct/Initialize() // Same system machines use for UID. Could probably add a global UID for everything if you wanted and use it for shenanigans, or simpler loading.
	..()
	lock_data = lock_uid++
	desc = "A heavy-duty lock for doors. It has [lock_data] engraved on it."
	GLOB.global_locks += src
	
/obj/item/lock_construct/Destroy()
	..()
	GLOB.global_locks -= src

/obj/item/lock_construct/attackby(obj/item/I, mob/user) // Blatantly borrowed from Baystation coders and modified for simplicity. Thanks for pointing me in that direction, Rhicora.
	if(iskey(I))
		var/obj/item/key/K = I
		if(!K.lock_data)
			to_chat(user, "<span class='notice'>You fashion \the [I] to unlock \the [src]</span>")
			K.lock_data = lock_data
			K.desc = "A simple key for locks. It has [K.lock_data] engraved on it."
		else
			to_chat(user, "<span class='warning'>\The [I] already unlocks something...</span>")
		return
	if(islock(I))
		var/obj/item/lock_construct/L = I
		L.lock_data = src.lock_data
		to_chat(user, "<span class='notice'>You copy the lock from \the [src] to \the [L], making them identical.</span>")
		L.desc = "A heavy-duty lock for doors. It has [L.lock_data] engraved on it."
		return
	..()

/obj/item/lock_construct/proc/check_key(obj/item/key/K, mob/user = null)
	if(K.lock_data == src.lock_data) //if the key matches us
		if(locked)
			user.visible_message("<span class='warning'>[user] unlocks \the [src].</span>")
			locked = FALSE
		else
			user.visible_message("<span class='warning'>[user] locks \the [src].</span>")
			locked = TRUE
	else
		to_chat(user, "<span class='warning'>This is the wrong key!</span>")

/obj/item/lock_construct/proc/check_locked()
	return locked

/obj/item/lock_construct/proc/pry_off(mob/living/user, atom/A)
	if(!prying)
		user.visible_message("<span class='notice'>[user] starts prying [src] off [A].</span>", \
							 "<span class='notice'>You start prying [src] off [A].</span>")
		var/time_to_open = 50
		playsound(src, 'sound/machines/airlock_alien_prying.ogg',100,1) //is it aliens or just the CE being a dick?
		prying = TRUE
		var/result = do_after(user, time_to_open, target = A)
		prying = FALSE
		if(result)
			user.visible_message("<span class='notice'>[src] breaks off [A] and falls to pieces.</span>")
			return TRUE
	return FALSE

/obj/item/key
	name = "\improper key"
	icon = 'icons/obj/key.dmi'
	w_class = WEIGHT_CLASS_TINY
	var/lock_data = ""

/obj/item/key/Initialize()
	. = ..()
	desc = "A simple key for locks. It has [src.lock_data ? src.lock_data : "nothing"] engraved on it."

/obj/item/key/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/rods))
		var/obj/item/stack/rods/M = I
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