// /datum/crafting_recipe
//	var/name = "" //in-game display name
//	var/reqs[] = list() //type paths of items consumed associated with how many are needed
//	var/result //type path of item resulting from this craft
//	var/tools[] = list() //type paths of items needed but not consumed
//	var/time = 30 //time in deciseconds
//	var/parts[] = list() //type paths of items that will be placed in the result
//	var/category = CAT_NONE //where it shows up in the crafting UI
//	var/subcategory = CAT_NONE
//9mm 10mm 357. 44. 45. 5.56 7.62
// in the future, if you want to add more calibers, you'll need to create a bullet, bullet recipie, die, die recipie, and bullet creation recipies.
// to adjust scarcity levels, change the amount of bullets that you get with one metal sheet from five to a lower number
// made by john oxford

// Equipment
/obj/item/reloading
	icon = 'icons/obj/reloading.dmi'

/obj/item/reloading/reloadingpress
	name = "reloading press"
	desc = "An Oxford Armory™ universal combination reloading press, complete with a primer synthesizer, automatic powder measuring, and a high tourqe pressing rod."
	attack_verb = list("clonked", "smashed", "chunked", "whacked")
	icon_state = "reloadingpress"

// Dies

/obj/item/reloading/die
	name = "reloading die"
	desc = "This probally shouldn't exist, quit admin abusing."
	attack_verb = list("cracked", "chipped", "smashed", "clocked")
	icon_state = "diesmall"

/obj/item/reloading/die/ninemilimeter
	name = "9mm reloading die"
	desc = "A sandstone reloading die with 5 slots each carved into the shape of a 9mm bullet. You vaguely can make out the letters O and X on the bottom of the brick."
	icon_state = "diesmall"

/obj/item/reloading/die/tenmilimeter
	name = "10mm reloading die"
	desc = "A sandstone reloading die with 5 slots each carved into the shape of a 9mm bullet. You vaguely can make out the letters O and X on the bottom of the brick."
	icon_state = "diesmall"

/obj/item/reloading/die/threefiftyseven
	name = "357. reloading die"
	desc = "A sandstone reloading die with 5 slots each carved into the shape of a 9mm bullet. You vaguely can make out the letters O and X on the bottom of the brick."
	icon_state = "diesmall"

/obj/item/reloading/die/fortyfour
	name = "44. reloading die"
	desc = "A sandstone reloading die with 5 slots each carved into the shape of a 9mm bullet. You vaguely can make out the letters O and X on the bottom of the brick."
	icon_state = "diesmall"

/obj/item/reloading/die/fortyfive
	name = "45. reloading die"
	desc = "A sandstone reloading die with 5 slots each carved into the shape of a 9mm bullet. You vaguely can make out the letters O and X on the bottom of the brick."
	icon_state = "diesmall"

/obj/item/reloading/die/fivefivesix
	name = "5.56x45 reloading die"
	desc = "A sandstone reloading die with 5 slots each carved into the shape of a 9mm bullet. You vaguely can make out the letters O and X on the bottom of the brick."
	icon_state = "diemedium"

/obj/item/reloading/die/sevensixtwo
	name = "7.62x51 reloading die"
	desc = "A sandstone reloading die with 5 slots each carved into the shape of a 9mm bullet. You vaguely can make out the letters O and X on the bottom of the brick."
	icon_state = "diemedium"

// Bullets (literally just the bullet)

/obj/item/reloading/bullet
	name = "bullet"
	desc = "This probally shouldn't exist, quit admin abusing."
	icon = 'icons/obj/reloading.dmi'

/obj/item/reloading/bullet/ninemilimeter
	name = "9mm bullet"
	desc = "A bullet designed for 9mm cartridges."
	icon_state = "smallbullet"

/obj/item/reloading/bullet/tenmilimeter
	name = "10mm bullet"
	desc = "A bullet designed for 10mm cartridges."
	icon_state = "smallbullet"

/obj/item/reloading/bullet/threefiftyseven
	name = "357. bullet"
	desc = "A bullet designed for .357 cartridges."
	icon_state = "revolverbullet"

/obj/item/reloading/bullet/fortyfour
	name = "44. bullet"
	desc = "A bullet designed for 44. cartridges."
	icon_state = "revolverbullet"

/obj/item/reloading/bullet/fortyfive
	name = "45. bullet"
	desc = "A bullet designed for 45. cartridges."
	icon_state = "revolverbullet"

/obj/item/reloading/bullet/fivefivesix
	name = "5.56x45 bullet"
	desc = "A bullet designed for 5.56x45 cartridges."
	icon_state = "riflebullet"

/obj/item/reloading/bullet/sevensixtwo
	name = "7.62x51 bullet"
	desc = "A bullet designed for 7.62x51 cartridges."
	icon_state = "heavyriflebullet"

// Crafting Recipies for bullet dies

/datum/crafting_recipe/die9mm
	name = "9mm bullet die"
	result = /obj/item/reloading/die/ninemilimeter
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 1)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/die10mm
	name = "10mm bullet die"
	result = /obj/item/reloading/die/tenmilimeter
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 1)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/die357
	name = "357. bullet die"
	result = /obj/item/reloading/die/threefiftyseven
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 1)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/die44
	name = "44. bullet die"
	result = /obj/item/reloading/die/fortyfour
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 1)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/die45
	name = "45. bullet die"
	result = /obj/item/reloading/die/fortyfive
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 1)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/die556
	name = "5.56x45 bullet die"
	result = /obj/item/reloading/die/fivefivesix
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 1)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/die762
	name = "7.62x51 bullet die"
	result = /obj/item/reloading/die/sevensixtwo
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 1)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

// Crafting Recipies for the Bullets individually

/datum/crafting_recipe/ninemilimeterbullet
	name = "9mm bullet"
	result = list(/obj/item/reloading/bullet/ninemilimeter = 5)
	reqs = list(/obj/item/stack/sheet/metal = 1)
	tools = list(/obj/item/reloading/die/ninemilimeter, TOOL_WELDER)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/tenmilimeterbullet
	name = "10mm bullet"
	result = list(/obj/item/reloading/bullet/tenmilimeter = 5)
	reqs = list(/obj/item/stack/sheet/metal = 1)
	tools = list(/obj/item/reloading/die/tenmilimeter, TOOL_WELDER)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/threefiftysevenbullet
	name = "357. bullet"
	result = list(/obj/item/reloading/bullet/threefiftyseven = 5)
	reqs = list(/obj/item/stack/sheet/metal = 1)
	tools = list(/obj/item/reloading/die/threefiftyseven, TOOL_WELDER)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/fortyfourbullet
	name = "44. bullet"
	result = list(/obj/item/reloading/bullet/fortyfour = 5)
	reqs = list(/obj/item/stack/sheet/metal = 1)
	tools = list(/obj/item/reloading/die/fortyfour, TOOL_WELDER)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/fortyfivebullet
	name = "45. bullet"
	result = list(/obj/item/reloading/bullet/fortyfive = 5)
	reqs = list(/obj/item/stack/sheet/metal = 1)
	tools = list(/obj/item/reloading/die/fortyfive, TOOL_WELDER)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/fivefivesixbullet
	name = "5.56x45 bullet"
	result = list(/obj/item/reloading/bullet/fivefivesix = 5)
	reqs = list(/obj/item/stack/sheet/metal = 1)
	tools = list(/obj/item/reloading/die/fivefivesix, TOOL_WELDER)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

/datum/crafting_recipe/sevensixtwobullet
	name = "7.62x51 bullet"
	result = list(/obj/item/reloading/bullet/sevensixtwo = 5)
	reqs = list(/obj/item/stack/sheet/metal = 1)
	tools = list(/obj/item/reloading/die/sevensixtwo, TOOL_WELDER)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_RELOADING

// Complete Cartridge Recipies
// since i literally have no fucking idea how to distinguish between casings that are and arent fired in a list, we'll just make it require some metal instead of a spent casing of the same type.

/datum/crafting_recipe/ninemilimeter
	name = "9mm cartridge"
	result = list(/obj/item/ammo_casing/c9mm = 1)
	reqs = list(/obj/item/reloading/bullet/ninemilimeter= 1, /datum/reagent/blackpowder = 3, /obj/item/stack/sheet/metal = 1 )
	tools = list(/obj/item/reloading/reloadingpress = 1, )
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/tenmilimeter
	name = "10mm cartridge"
	result = list(/obj/item/ammo_casing/c10mm = 1)
	reqs = list(/obj/item/reloading/bullet/tenmilimeter = 1, /datum/reagent/blackpowder = 3, /obj/item/stack/sheet/metal = 1 )
	tools = list(/obj/item/reloading/reloadingpress = 1, )
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/threefiftyseven
	name = "357. cartridge"
	result = list(/obj/item/ammo_casing/a357 = 1)
	reqs = list(/obj/item/reloading/bullet/threefiftyseven = 1, /datum/reagent/blackpowder = 3, /obj/item/stack/sheet/metal = 1 )
	tools = list(/obj/item/reloading/reloadingpress = 1, )
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/fortyfour
	name = "44. cartridge"
	result = list(/obj/item/ammo_casing/m44 = 1)
	reqs = list(/obj/item/reloading/bullet/fortyfour = 1, /datum/reagent/blackpowder = 3, /obj/item/stack/sheet/metal = 1 )
	tools = list(/obj/item/reloading/reloadingpress = 1, )
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/fortyfive
	name = "45. cartridge"
	result = list(/obj/item/ammo_casing/c45= 1)
	reqs = list(/obj/item/reloading/bullet/fortyfive = 1, /datum/reagent/blackpowder = 3, /obj/item/stack/sheet/metal = 1 )
	tools = list(/obj/item/reloading/reloadingpress = 1, )
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/fivefivesix
	name = "5.56x45 cartridge"
	result = list(/obj/item/ammo_casing/a556 = 1)
	reqs = list(/obj/item/reloading/bullet/fivefivesix = 1, /datum/reagent/blackpowder = 3, /obj/item/stack/sheet/metal = 1 )
	tools = list(/obj/item/reloading/reloadingpress = 1, )
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/sevensixtwo
	name = "7.62x51 cartridge"
	result = list(/obj/item/ammo_casing/a762 = 1)
	reqs = list(/obj/item/reloading/bullet/sevensixtwo = 1, /datum/reagent/blackpowder = 3, /obj/item/stack/sheet/metal = 1 )
	tools = list(/obj/item/reloading/reloadingpress = 1, )
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

