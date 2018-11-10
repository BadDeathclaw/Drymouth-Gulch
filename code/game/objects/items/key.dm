/obj/item/key
	name = "key"
	desc = "A simple key for locks."
	icon = 'icons/obj/key.dmi'
	w_class = WEIGHT_CLASS_TINY
	var/uid

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
		S.uid = src.uid
	else
		return ..()
