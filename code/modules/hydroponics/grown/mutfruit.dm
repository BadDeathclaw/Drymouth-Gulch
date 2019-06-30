/obj/item/seeds/mutfruit
	name = "pack of mutfruit seeds"
	desc = "These seeds grow into mutfruit."
	icon_state = "seed-mutfruit"
	species = "mutfruit"
	plantname = "Mutfruit"
	growing_icon = 'icons/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "mutfruit-grow"
	icon_dead = "mutfruit-dead"
	product = /obj/item/reagent_containers/food/snacks/grown/mutfruit
	lifespan = 30
	endurance = 20
	yield = 3
	growthstages = 3
	production = 5
	maturation = 5

/obj/item/reagent_containers/food/snacks/grown/mutfruit
	seed = /obj/item/seeds/mutfruit
	name = "Mutfruit"
	desc = "Mutfruit provides both hydration and sustenance, and provides them at moderately higher levels than other fruits, it gives a small amount of Radiation."
	icon_state = "mutfruit"
	filling_color = "#FF6347"

/obj/item/reagent_containers/food/snacks/grown/mutfruit/add_juice()
	if(..())
		reagents.add_reagent("nutriment", 3 + round((seed.potency / 20), 1))
		reagents.add_reagent("radium", 1 + round((seed.potency / 20), 1))
		bitesize = 1 + round(reagents.total_volume / 3, 1)

