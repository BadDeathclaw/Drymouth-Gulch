/obj/machinery/forge
	name = "metalworking forge"
	desc = "A large furnace used for forging metal items such as swords, spears and shields. You can imagine yourself making iron daggers here for a long time."
	icon = 'icons/obj/cult.dmi'
	icon_state = "forge"
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	machine_tool_behaviour = list(TOOL_FORGE)

/obj/machinery/forge/wrench_act(mob/living/user, obj/item/I)
	default_unfasten_wrench(user, I, 10)
	return TRUE

/datum/crafting_recipe/machete
	name = "Machete"
	result = /obj/item/claymore/machete
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 7,
				/obj/item/stack/sheet/cloth = 1)
	category = CAT_PRIMAL
	subcategory = CAT_FORGE

/datum/crafting_recipe/gladius
	name = "Machete Gladius"
	result = /obj/item/claymore/machete/gladius
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/sheet/cloth = 2)
	category = CAT_PRIMAL
	subcategory = CAT_FORGE

/datum/crafting_recipe/katana
	name = "Katana"
	result = /obj/item/katana
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 6)
	category = CAT_PRIMAL
	subcategory = CAT_FORGE

/datum/crafting_recipe/forgeglaive
	name = "Improvised Metal Glaive"
	result = /obj/item/twohanded/spear
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 2,
				/obj/item/stack/sheet/mineral/wood = 1)
	category = CAT_PRIMAL
	subcategory = CAT_FORGE

/datum/crafting_recipe/forgethrowingspear
	name = "Throwing Spear"
	result = /obj/item/throwing_star/spear
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/sheet/mineral/wood = 1)
	category = CAT_PRIMAL
	subcategory = CAT_FORGE

/datum/crafting_recipe/legionshield
	name = "Legion Shield"
	result = /obj/item/shield/legion
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 3,
				/obj/item/stack/sheet/mineral/wood = 8,
				/obj/item/stack/sheet/cloth = 2)
	category = CAT_PRIMAL
	subcategory = CAT_FORGE

/datum/crafting_recipe/fireaxe
	name = "Fire Axe"
	result = /obj/item/twohanded/fireaxe
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 12,
				/obj/item/stack/sheet/mineral/wood = 6,
				/obj/item/stack/sheet/cloth = 2)
	category = CAT_PRIMAL
	subcategory = CAT_FORGE

/datum/crafting_recipe/bumpersword
	name = "Bumper Sword"
	result = /obj/item/twohanded/fireaxe/bmprsword
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 16,
				/obj/item/stack/sheet/cloth = 4)
	category = CAT_PRIMAL
	subcategory = CAT_FORGE

/datum/crafting_recipe/combatknife
	name = "Combat Knife"
	result = /obj/item/kitchen/knife/combat
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 4,
				/obj/item/stack/sheet/cloth = 2)
	category = CAT_PRIMAL
	subcategory = CAT_FORGE