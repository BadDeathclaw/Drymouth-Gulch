//Wasteland food
//Food made from mostly wasteland ingredients, hooray for immershun

/datum/crafting_recipe/food/moleratwondermeat
	name = "Molerat Wondermeat"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/meat/steak/molerat = 1,
		/obj/item/crafting/wonderglue = 1
	)
	tools = list(TOOL_LUNCHBOX)
	result = /obj/item/reagent_containers/food/snacks/f13/molejerky
	category = CAT_FOOD
	subcategory = CAT_WASTEFOOD

/datum/crafting_recipe/food/caravanlunch
	name = "Caravan Lunch"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/f13/instamash = 1,
		/obj/item/reagent_containers/food/snacks/f13/cram = 1,
		/obj/item/reagent_containers/food/snacks/f13/porknbeans = 1,
		/obj/item/crafting/lunchbox = 1
	)
	result = /obj/item/reagent_containers/food/snacks/f13/caravanlunch
	category = CAT_FOOD
	subcategory = CAT_WASTEFOOD

/datum/crafting_recipe/food/wastelandwellington
	name = "Wasteland Wellington"
	reqs = list(
		/datum/reagent/consumable/flour = 10,
		/obj/item/reagent_containers/food/snacks/f13/blamco = 1,
		/obj/item/reagent_containers/food/snacks/meat/steak = 2
	)
	result = /obj/item/reagent_containers/food/snacks/f13/wastelandwellington
	category = CAT_FOOD
	subcategory = CAT_WASTEFOOD

/datum/crafting_recipe/food/deathclawomelette
	name = "Deathclaw Omelette"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/f13/deathclawegg = 1,
		/obj/item/reagent_containers/food/snacks/meat/steak/deathclaw = 1,
		/obj/item/reagent_containers/food/snacks/butter =2,
		/obj/item/reagent_containers/food/snacks/grown/mutfruit = 1
	)
	result = /obj/item/reagent_containers/food/snacks/f13/deathclawomelette
	category = CAT_FOOD
	subcategory = CAT_WASTEFOOD

/datum/crafting_recipe/food/moleratstew
	name = "Molerat Stew"
	reqs = list(
		/obj/item/reagent_containers/food/drinks/beer = 1,
		/obj/item/reagent_containers/food/snacks/meat/slab/molerat = 1,
		/obj/item/reagent_containers/food/snacks/grown/corn = 1,
		/obj/item/reagent_containers/food/snacks/grown/soybeans = 1
	)
	result = /obj/item/reagent_containers/food/snacks/f13/moleratstew
	category = CAT_FOOD
	subcategory = CAT_WASTEFOOD

/datum/crafting_recipe/food/crispysquirrel
	name = "Crispy Squirrel Bits"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/meat/steak/squirrel = 1,
		/obj/item/stack/rods = 1
	)
	result = /obj/item/reagent_containers/food/snacks/f13/crispysquirrel
	category = CAT_FOOD
	subcategory = CAT_WASTEFOOD

/datum/crafting_recipe/food/squirrelstick
	name = "Squirrel on a Stick"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/meat/steak/squirrel = 2,
		/obj/item/stack/rods = 1
	)
	result = /obj/item/reagent_containers/food/snacks/f13/squirrelstick
	category = CAT_FOOD
	subcategory = CAT_WASTEFOOD

/datum/crafting_recipe/food/squirrelstew
	name = "Squirrel Stew"
	reqs = list(
    	/obj/item/reagent_containers/food/snacks/meat/steak/squirrel = 1,
    	/obj/item/reagent_containers/food/snacks/grown/carrot = 1,
    	/obj/item/reagent_containers/food/snacks/grown/potato = 1
	)
	result = /obj/item/reagent_containers/food/snacks/f13/squirrelstew
	category = CAT_FOOD
	subcategory = CAT_WASTEFOOD
