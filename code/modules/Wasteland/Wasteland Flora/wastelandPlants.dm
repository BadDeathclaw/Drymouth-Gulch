//Fallout 13 general flora directory

/obj/structure/flora/grass/wasteland
	icon = 'icons/fallout/flora/flora.dmi'
	desc = "Some dry, virtually dead grass."
	icon_state = "tall_grass_1"

/obj/structure/flora/grass/wasteland/New()
	..()
	icon_state = "tall_grass_[rand(1,8)]"

/obj/structure/flora/grass/wasteland/attackby(obj/item/W, mob/user, params) //we dont use /weapon any more
	if(W.sharpness && W.force > 0 && !(NODECONSTRUCT_1 in flags_1))
		to_chat(user, "You begin to harvest [src]...")
		if(do_after(user, 100/W.force, target = user))
			to_chat(user, "<span class='notice'>You've collected [src]</span>")
			var/obj/item/stack/sheet/hay/H = user.get_inactive_held_item()
			if(istype(H))
				H.add(1)
			else
				new /obj/item/stack/sheet/hay/(get_turf(src))
			qdel(src)
			return 1
	else
		. = ..()

/obj/structure/flora/tree/wasteland
	name = "dead tree"
	desc = "It's a tree. Useful for combustion and/or construction."
	icon = 'icons/fallout/flora/trees.dmi'
	icon_state = "deadtree_1"
	log_amount = 4
	obj_integrity = 100
	max_integrity = 100

/obj/structure/flora/tree/wasteland/New()
	icon_state = "deadtree_[rand(1,6)]"
	..()
