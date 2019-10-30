/obj/item/seeds/xander
	name = "pack of xander seeds"
	desc = "These seeds grow into xander roots."
	icon_state = "seed-xander"
	species = "xander"
	plantname = "xander roots"
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
	desc = "Xander roots are large, hardy, turnip-like roots with mild healing properties."
	icon_state = "xander"
	filling_color = "#FF6347"

/obj/item/reagent_containers/food/snacks/grown/xander/add_juice()
	if(..())
		reagents.add_reagent("antitoxin", 1 + round((seed.potency / 5), 1))
		reagents.add_reagent("salglu_solution", 1 + round((seed.potency / 20), 1))
		bitesize = 1 + round(reagents.total_volume / 3, 1)
