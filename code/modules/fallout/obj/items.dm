/obj/item/ring
	name = "One Ring"
	desc = "One ring to rule them all, one ring to find them,<br>One ring to bring them all and in the darkness bind them..."
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "one_ring"
	item_state = "null"
	throwforce = 0
	hitsound = null
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7

/obj/item/ring/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/ring/process()
	if(iscarbon(loc))
		var/mob/living/carbon/M = loc
		if(M.health < M.maxHealth)
			M.adjustBruteLoss(-2) //Heal that poor bastard
			M.adjustFireLoss(-2)
			M.adjustToxLoss(-2)
			M.adjustOxyLoss(-2)
			flick("one_ring_anim", src)
			icon_state = initial(icon_state)