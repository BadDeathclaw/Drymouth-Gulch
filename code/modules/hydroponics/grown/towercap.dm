/obj/item/seeds/tower
	name = "pack of tower-cap mycelium"
	desc = "This mycelium grows into tower-cap mushrooms."
	icon_state = "mycelium-tower"
	species = "towercap"
	plantname = "Tower Caps"
	product = /obj/item/grown/log
	lifespan = 80
	endurance = 50
	maturation = 15
	production = 1
	yield = 5
	potency = 50
	growthstages = 3
	growing_icon = 'icons/obj/hydroponics/growing_mushrooms.dmi'
	icon_dead = "towercap-dead"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	mutatelist = list(/obj/item/seeds/tower/steel)

/obj/item/seeds/tower/steel
	name = "pack of steel-cap mycelium"
	desc = "This mycelium grows into steel logs."
	icon_state = "mycelium-steelcap"
	species = "steelcap"
	plantname = "Steel Caps"
	product = /obj/item/grown/log/steel
	mutatelist = list()
	rarity = 20

/obj/item/grown/log
	seed = /obj/item/seeds/tower
	name = "tower-cap log"
	desc = "It's better than bad, it's good!"
	icon_state = "logs"
	force = 5
	throwforce = 5
	w_class = WEIGHT_CLASS_NORMAL
	throw_speed = 2
	throw_range = 3
	attack_verb = list("bashed", "battered", "bludgeoned", "whacked")
	var/plank_type = /obj/item/stack/sheet/mineral/wood
	var/plank_name = "wooden planks"
	var/static/list/accepted = typecacheof(list(/obj/item/reagent_containers/food/snacks/grown/tobacco,
	/obj/item/reagent_containers/food/snacks/grown/tea,
	/obj/item/reagent_containers/food/snacks/grown/ambrosia/vulgaris,
	/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus,
	/obj/item/reagent_containers/food/snacks/grown/wheat))

/obj/item/grown/log/attackby(obj/item/W, mob/user, params)
	if(W.sharpness)
		user.show_message("<span class='notice'>You make [plank_name] out of \the [src]!</span>", 1)
		var/seed_modifier = 3
		if(seed)
			seed_modifier = round(seed.potency / 25)
		var/obj/item/stack/plank = new plank_type(user.loc, 1 + seed_modifier)
		var/old_plank_amount = plank.amount
		for(var/obj/item/stack/ST in user.loc)
			if(ST != plank && istype(ST, plank_type) && ST.amount < ST.max_amount)
				ST.attackby(plank, user) //we try to transfer all old unfinished stacks to the new stack we created.
		if(plank.amount > old_plank_amount)
			to_chat(user, "<span class='notice'>You add the newly-formed [plank_name] to the stack. It now contains [plank.amount] [plank_name].</span>")
		qdel(src)

	if(CheckAccepted(W))
		var/obj/item/reagent_containers/food/snacks/grown/leaf = W
		if(leaf.dry)
			user.show_message("<span class='notice'>You wrap \the [W] around the log, turning it into a torch!</span>")
			var/obj/item/flashlight/flare/torch/T = new /obj/item/flashlight/flare/torch(user.loc)
			T.desc = "A handheld torch fashioned from some leaves wrapped around a log."
			usr.dropItemToGround(W)
			usr.put_in_active_hand(T)
			qdel(leaf)
			qdel(src)
			return
		else
			to_chat(usr, "<span class ='warning'>You must dry this first!</span>")
	else
		return ..()

/obj/item/grown/log/proc/CheckAccepted(obj/item/I)
	return is_type_in_typecache(I, accepted)

/obj/item/grown/log/tree
	seed = null
	name = "wood log"
	desc = "TIMMMMM-BERRRRRRRRRRR!"
	icon = 'icons/fallout/flora/flora.dmi'
	icon_state = "tree_timber"

/obj/item/grown/log/steel
	seed = /obj/item/seeds/tower/steel
	name = "steel-cap log"
	desc = "It's made of metal."
	icon_state = "steellogs"
	plank_type = /obj/item/stack/rods
	plank_name = "rods"

/obj/item/grown/log/steel/CheckAccepted(obj/item/I)
	return FALSE
