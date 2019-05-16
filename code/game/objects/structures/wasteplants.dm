/obj/structure/wasteplant
	name = "wasteland plant"
	desc = "It's a wasteland plant."
	icon = 'icons/misc/plants.dmi'
	anchored = 1
	density = 0
	var has_plod = 1
	var/obj/item/reagent_containers/food/snacks/grown/produce = null

/obj/structure/wasteplant/broc/attack_hand(mob/user)
	if(has_plod)
		user.put_in_hands(new produce)
		user << "<span class='notice'>You take [produce.name] from [src].</span>"
		has_plod = null
	update_icon()
	regrow()

/obj/structure/wasteplant/proc/regrow()
	if(!has_plod)
		spawn(5000)
			has_plod = !has_plod
			update_icon()

/obj/structure/wasteplant/update_icon()
	if(has_plod)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]_no"

/obj/structure/wasteplant/broc
	name = "Broc Flower"
	icon_state = "broc"
	produce = /obj/item/reagent_containers/food/snacks/grown/broc


/obj/structure/wasteplant/xander
	name = "Xander Root"
	icon_state = "xander"
	produce = /obj/item/reagent_containers/food/snacks/grown/xander


/obj/structure/wasteplant/feracactus
	name = "Ferocactus"
	icon_state = "cactus"
	produce = /obj/item/reagent_containers/food/snacks/grown/feracactus


/obj/structure/wasteplant/mutfruit
	name = "Mutfruit"

	icon_state = "mutfruit"
	produce = /obj/item/reagent_containers/food/snacks/grown/mutfruit


/obj/structure/wasteplant/fungus
	name = "Cave fungus"
	icon_state = "fungus"
	produce = /obj/item/reagent_containers/food/snacks/grown/fungus