/obj/item/seeds/fungus
	name = "pack of fungus seeds"
	desc = "These seeds grow into fungus mushrooms."
	icon_state = "seed-fungus"
	species = "fungus"
	plantname = "Fungus"
	product = /obj/item/reagent_containers/food/snacks/grown/fungus
	lifespan = 50
	endurance = 10
	maturation = 8
	production = 3
	yield = 6
	potency = 20
	growthstages = 3

/obj/item/reagent_containers/food/snacks/grown/fungus
	seed = /obj/item/seeds/fungus
	name = "cave fungus"
	desc = "Cave fungus is an edible mushroom which has the ability to decrease radioation."
	icon_state = "fungus"
	filling_color = "#FF6347"

/obj/item/reagent_containers/food/snacks/grown/fungus/add_juice()
	if(..())
		reagents.add_reagent("nutriment", 1 + round((seed.potency / 20), 1))
		reagents.add_reagent("charcoal", 1 + round((seed.potency / 20), 1))
		reagents.add_reagent("mutadone", 1 + round((seed.potency / 20), 1))
		bitesize = 1 + round(reagents.total_volume / 3, 1)

