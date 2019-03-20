/obj/item/seeds/cactus
	name = "pack of cactus seeds"
	desc = "These seeds grow into an cactus which bears fruit."
	icon_state = "seed-cactus"
	species = "cactus"
	plantname = "cactus fruits"
	product = /obj/item/reagent_containers/food/snacks/grown/cactus
	lifespan = 50
	endurance = 20
	maturation = 8
	production = 2
	yield = 6
	potency = 20
	growthstages = 3
	growing_icon = 'icons/obj/hydroponics/growing_fruits.dmi'
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	icon_grow = "cactus-grow"
	icon_dead = "cactus-dead"

/obj/item/reagent_containers/food/snacks/grown/cactus
	seed = /obj/item/seeds/cactus
	name = "barrel cactus fruit"
	desc = "Barrel cactus fruit are found on barrel cactus; a spherical cacti that can be encountered while wandering the Texas. They usually form in groups, with one large barrel cactus that contains the fruit surrounded by several smaller cacti. Like all other Texas plants, fruit-bearing barrel cacti will eventually grow back after being picked."
	icon_state = "feracactus"
	filling_color = "#FF6347"

/obj/item/reagent_containers/food/snacks/grown/mutfruit/add_juice()
	if(..())
		reagents.add_reagent("nutriment", 1 + round((seed.potency / 20), 1))
		reagents.add_reagent("calomel", 0 + round((seed.potency / 20), 1))
		bitesize = 1 + round(reagents.total_volume / 3, 1)