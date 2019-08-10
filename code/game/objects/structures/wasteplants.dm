/obj/structure/flora/wasteplant
	name = "wasteland plant"
	desc = "It's a wasteland plant."
	icon = 'icons/obj/flora/wastelandflora.dmi'
	anchored = 1
	density = 0
	var/has_plod = TRUE
	var/obj/item/reagent_containers/food/snacks/grown/produce = null

/obj/structure/flora/wasteplant/attack_hand(mob/user)
	if(has_plod)
		user.put_in_hands(new produce)
		user << "<span class='notice'>You take [produce] from [src].</span>"
		has_plod = FALSE
		update_icon() //Won't update due to proc otherwise
		regrow()
	update_icon()

/obj/structure/flora/wasteplant/proc/regrow()
	if(!has_plod)
		sleep(5000)
		has_plod = TRUE
		update_icon()

/obj/structure/flora/wasteplant/update_icon()
	if(has_plod)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]_no"

/obj/structure/flora/wasteplant/wild_broc
	name = "broc flower"
	icon_state = "wild_broc"
	produce = /obj/item/reagent_containers/food/snacks/grown/broc


/obj/structure/flora/wasteplant/wild_xander
	name = "xander root"
	icon_state = "wild_xander"
	produce = /obj/item/reagent_containers/food/snacks/grown/xander


/obj/structure/flora/wasteplant/wild_feracactus
	name = "barrel cactus"
	icon_state = "wild_feracactus"
	produce = /obj/item/reagent_containers/food/snacks/grown/feracactus


/obj/structure/flora/wasteplant/wild_mutfruit
	name = "mutfruit"

	icon_state = "wild_mutfruit"
	produce = /obj/item/reagent_containers/food/snacks/grown/mutfruit


/obj/structure/flora/wasteplant/wild_fungus
	name = "cave fungus"
	icon_state = "wild_fungus"
	produce = /obj/item/reagent_containers/food/snacks/grown/fungus


/obj/structure/flora/wasteplant/wild_agave
	name = "wild agave"
	icon_state = "wild_agave"
	produce = /obj/item/reagent_containers/food/snacks/grown/agave