/obj/item/seeds/agave
	name = "pack of agave seeds"
	desc = "These seeds grow into agave."
	icon = 'icons/obj/hydroponics/seeds.dmi'
	icon_state = "seed-agave"
	species = "agave"
	plantname = "Agave"
	product = /obj/item/reagent_containers/food/snacks/grown/agave
	lifespan = 60
	endurance = 10
	yield = 5
	growthstages = 3
	production = 20
	maturation = 20
	growing_icon = 'icons/fallout/flora/flora.dmi'
	icon_grow = "agave-grow"
	icon_dead = "agave-dead"
	icon_harvest = "agave-harvest"
	reagents_add = list("nutriment" = 0.1)

/obj/item/reagent_containers/food/snacks/grown/agave
	seed = /obj/item/seeds/agave
	name = "agave"
	desc = "Strange grass. Looks safe."
	icon_state = "agave"
	icon = 'icons/fallout/objects/food&drinks/grown.dmi'