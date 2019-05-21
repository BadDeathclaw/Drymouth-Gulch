/obj/item/seeds/xander
	name = "pack of xander seeds"
	desc = "These seeds grow into xander root."
	icon_state = "seed-xander"
	species = "xander"
	plantname = "Xander Plants"
	product = /obj/item/reagent_containers/food/snacks/grown/xander
	lifespan = 25
	endurance = 10
	yield = 3 //6 //Where did you get 6 from???
	growthstages = 3
	production = 1
	maturation = 1
	growing_icon = 'icons/obj/hydroponics/growing_vegetables.dmi'
	icon_grow = "potato-grow"
	icon_dead = "potato-dead"

/obj/item/reagent_containers/food/snacks/grown/xander
	seed = /obj/item/seeds/xander
	name = "xander root"
	desc = "Xander root is a large, turnip-like root with mild healing properties. It can easily be identified by its exposed head and tall green stalk protruding from a raised ring of dirt, resembling an onion. Once collected, xander root can be used in the crafting of both healing powder and stimpaks."
	icon_state = "xander"
	filling_color = "#FF6347"

/obj/item/reagent_containers/food/snacks/grown/xander/add_juice()
	if(..())
		reagents.add_reagent("salglu_solution", 1 + round((seed.potency / 5), 1))
		reagents.add_reagent("vitamin", 1 + round((seed.potency / 20), 1))
		bitesize = 1 + round(reagents.total_volume / 3, 1)
