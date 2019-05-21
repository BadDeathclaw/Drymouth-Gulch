//Fallout 13 farming simulation

/obj/item/seeds/broc
	name = "pack of broc seeds"
	desc = "These seeds grow into broc flowers."
	icon = 'icons/fallout/objects/seeds.dmi'
	icon_state = "seed-broc"
	species = "broc"
	plantname = "Broc Bush"
	product = /obj/item/weapon/reagent_containers/food/snacks/grown/broc
	lifespan = 25
	endurance = 10
	yield = 2
	growthstages = 3
	production = 4
	maturation = 4
	growing_icon = 'icons/fallout/flora/flora.dmi'
	icon_grow = "broc-grow"
	icon_dead = "broc-dead"
	icon_harvest = "broc-harvest"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("nutriment" = 0.1, "salglu_solution" = 0.05)


/obj/item/seeds/xander
	name = "pack of xander seeds"
	desc = "These seeds grow into xander root."
	icon = 'icons/fallout/objects/seeds.dmi'
	icon_state = "seed-xander"
	species = "xander"
	plantname = "Xander Root"
	product = /obj/item/weapon/reagent_containers/food/snacks/grown/xander
	lifespan = 25
	endurance = 10
	yield = 1
	growthstages = 3
	production = 1
	maturation = 1
	growing_icon = 'icons/fallout/flora/flora.dmi'
	icon_grow = "xander-grow"
	icon_dead = "xander-dead"
	icon_harvest = "xander-harvest"
	reagents_add = list("vitamin" = 0.1, "nutriment" = 0.1)

/obj/item/seeds/mutfruit
	name = "pack of mutfruit seeds"
	desc = "These seeds grow into mutfruit."
	icon = 'icons/fallout/objects/seeds.dmi'
	icon_state = "seed-mutfruit"
	species = "mutfruit"
	plantname = "Mutfruit"
	product = /obj/item/weapon/reagent_containers/food/snacks/grown/mutfruit
	lifespan = 30
	endurance = 20
	yield = 3
	growthstages = 3
	production = 5
	maturation = 5
	growing_icon = 'icons/fallout/flora/flora.dmi'
	icon_grow = "mutfruit-grow"
	icon_dead = "mutfruit-dead"
	icon_harvest = "mutfruit-harvest"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("vitamin" = 0.04, "nutriment" = 0.1)

/obj/item/seeds/ferocactus
	name = "pack of ferocactus seeds"
	desc = "These seeds grow into ferocactus."
	icon = 'icons/fallout/objects/seeds.dmi'
	icon_state = "seed-ferocactus"
	species = "ferocactus"
	plantname = "Ferocactus"
	product = /obj/item/weapon/reagent_containers/food/snacks/grown/ferocactus
	lifespan = 60
	endurance = 20
	yield = 1
	growthstages = 3
	production = 20
	maturation = 20
	growing_icon = 'icons/fallout/flora/flora.dmi'
	icon_grow = "ferocactus-grow"
	icon_dead = "ferocactus-dead"
	icon_harvest = "ferocactus-harvest"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("calomel" = 0.04, "nutriment" = 0.1, "mindbreaker" = 0.2, "space_drugs" = 0.01)

/obj/item/seeds/shroom
	name = "pack of shroom seeds"
	desc = "These seeds grow into shrooms."
	icon = 'icons/fallout/objects/seeds.dmi'
	icon_state = "mycelium-shroom"
	species = "shroom"
	plantname = "Shrooms"
	product = /obj/item/weapon/reagent_containers/food/snacks/grown/shroom
	lifespan = 50
	endurance = 10
	yield = 5
	growthstages = 3
	production = 20
	maturation = 20
	growing_icon = 'icons/fallout/flora/flora.dmi'
	icon_grow = "shroom-grow"
	icon_dead = "shroom-dead"
	icon_harvest = "shroom-harvest"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("charcoal" = 0.04, "nutriment" = 0.1, "vitamin" = 0.01, "radium" = 0.05)

/obj/item/seeds/glow
	name = "pack of glowing fungus seeds"
	desc = "These seeds grow into glowing fungus."
	icon = 'icons/fallout/objects/seeds.dmi'
	icon_state = "mycelium-glow"
	species = "glow"
	plantname = "Glowing Fungus"
	product = /obj/item/weapon/reagent_containers/food/snacks/grown/glow
	lifespan = 60
	endurance = 10
	yield = 5
	growthstages = 3
	production = 20
	maturation = 20
	growing_icon = 'icons/fallout/flora/flora.dmi'
	icon_grow = "glow-grow"
	icon_dead = "glow-dead"
	icon_harvest = "glow-harvest"
	genes = list(/datum/plant_gene/trait/repeated_harvest, /datum/plant_gene/trait/glow)
	reagents_add = list("space_drugs" = 0.04, "mindbreaker" = 0.1, "mutagen" = 0.01, "radium" = 0.05)

/obj/item/seeds/agave
	name = "pack of agave seeds"
	desc = "These seeds grow into agave."
	icon = 'icons/fallout/objects/seeds.dmi'
	icon_state = "seed-agave"
	species = "agave"
	plantname = "Agave"
	product = /obj/item/weapon/reagent_containers/food/snacks/grown/agave
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