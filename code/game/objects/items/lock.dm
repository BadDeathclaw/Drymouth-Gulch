/obj/item/lock
	name = "lock"
	desc = "A heavy-duty lock for doors."
	icon = 'icons/obj/lock.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/uid
	var/static/lock_uid = 0

/obj/item/lock/New()
	..()
	uid = lock_uid++