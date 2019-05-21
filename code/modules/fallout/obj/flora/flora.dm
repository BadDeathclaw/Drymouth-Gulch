//Fallout 13 general flora directory

/obj/structure/flora/grass/wasteland
	icon = 'icons/fallout/flora/flora.dmi'
	desc = "You see nothing out of the ordinary."
	icon_state = "tall_grass_1"

/obj/structure/flora/grass/wasteland/New()
	..()
	icon_state = "tall_grass_[rand(1,8)]"

/obj/structure/flora/grass/wasteland/attackby(obj/item/weapon/W, mob/user, params)
	if(W.sharpness && W.force > 0 && !(NODECONSTRUCT in flags))
		to_chat(user, "You begin to harvest [src]...")
		if(do_after(user, 100/W.force, target = user))
			to_chat(user, "<span class='notice'>You've collected [src]</span>")
			var/obj/item/stack/sheet/grass/G = user.get_inactive_held_item()
			if(istype(G))
				G.add(1)
			else
				new /obj/item/stack/sheet/grass(get_turf(src))
			qdel(src)
			return 1
	else
		. = ..()

/obj/structure/flora/tree/wasteland
	name = "dead tree"
	desc = "It's the most dull thing you have ever seen in your life."
	icon = 'icons/fallout/flora/trees.dmi'
	icon_state = "deadtree_1"
	log_amount = 3
	obj_integrity = 100
	max_integrity = 100

/obj/structure/flora/tree/wasteland/New()
	icon_state = "deadtree_[rand(1,6)]"
	..()

/obj/structure/flora/tree/wasteland/attackby(obj/item/weapon/W, mob/user, params)
	..()
	if(cut)
		icon = 'icons/fallout/flora/trees.dmi'
		icon_state = "tree_stump"

/obj/structure/flora/tree/tall
	name = "dead tree"
	desc = "A rather tall tree that has been dead for a long time.<br>Interestingly it is still standing, as a reminder of its green past."
	icon = 'icons/fallout/flora/talltrees.dmi'
	icon_state = "tree_1"
	log_amount = 7
	obj_integrity = 350
	max_integrity = 350

/obj/structure/flora/tree/tall/New()
	icon_state = "tree_[rand(1,3)]"
	..()

/obj/structure/flora/tree/tall/attackby(obj/item/weapon/W, mob/user, params)
	..()
	if(cut)
		icon = 'icons/fallout/flora/talltrees.dmi'
		icon_state = "tree_stump"

/obj/structure/flora/cactus
	name = "cactus"
	desc = "A brave green cactus."
	icon = 'icons/fallout/flora/trees.dmi'
	icon_state = "cactus"
	density = 1
	pixel_x = -16
	layer = FLY_LAYER