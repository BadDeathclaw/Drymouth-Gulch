/obj/item/seeds/agave
	name = "pack of agave seeds"
	desc = "These seeds grow into agave."
	icon = 'icons/obj/hydroponics/seeds.dmi'
	icon_state = "seed-agave"
	species = "agave"
	plantname = "agave"
	product = /obj/item/reagent_containers/food/snacks/grown/agave
	lifespan = 60
	endurance = 10
	yield = 5
	growthstages = 3
	production = 7
	maturation = 7
	growing_icon = 'icons/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "agave-grow"
	icon_dead = "agave-dead"
	icon_harvest = "agave-harvest"
	reagents_add = list("kelotane" = 0.05, "lipolicide" = 0.05)


/obj/item/reagent_containers/food/snacks/grown/agave
	seed = /obj/item/seeds/agave
	name = "agave leaf"
	desc = "A strange kind of grass often used in primitive holistic medicines & pharmaceuticals"
	icon_state = "Agave Leaf"
	icon = 'icons/obj/flora/wastelandflora.dmi'
	distill_reagent = "tequila"