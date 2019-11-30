/datum/crafting_recipe/metalarmor
	name = "metal armor"
	result = /obj/item/clothing/suit/armor/fluff/chestplate
	reqs = list(/obj/item/stack/sheet/leather = 1,
				/obj/item/stack/sheet/durathread = 5,
				/obj/item/stack/crafting/metalparts = 5)
	tools = list(TOOL_SWORKBENCH)
	time = 120
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/metalarmormk2
	name = "metal armor mark 2"
	result = /obj/item/clothing/suit/armor/fluff/chestplate/mk2
	reqs = list(/obj/item/clothing/suit/armor/fluff/chestplate = 1,
				/obj/item/stack/crafting/goodparts = 2,
				/obj/item/stack/crafting/metalparts = 3)
	tools = list(TOOL_SWORKBENCH)
	time = 120
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/metalmask
	name = "metal mask"
	result = /obj/item/clothing/head/helmet/f13/metalmask
	reqs = list(/obj/item/stack/sheet/leather = 1,
				/obj/item/stack/sheet/durathread = 1,
				/obj/item/stack/crafting/metalparts = 2)
	tools = list(TOOL_SWORKBENCH)
	time = 60
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/metalmaskmk2
	name = "metal mask mk2"
	result = /obj/item/clothing/head/helmet/f13/metalmask/mk2
	reqs = list(/obj/item/clothing/head/helmet/f13/metalmask = 1,
				/obj/item/stack/crafting/goodparts = 2)
	tools = list(TOOL_SWORKBENCH)
	time = 60
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/leatherarmor
	name = "leather armor"
	result = /obj/item/clothing/suit/armor/f13/leatherarmor
	reqs = list(/obj/item/stack/sheet/leather = 3,
				/obj/item/stack/sheet/durathread = 2)
	tools = list(TOOL_BWORKBENCH)
	time = 60
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/armorkit
	name = "armor kit"
	result = /obj/item/clothing/suit/armor/f13/kit
	reqs = list(/obj/item/stack/sheet/leather = 3,
				/obj/item/stack/sheet/durathread = 1,
				/obj/item/stack/crafting/metalparts = 1)
	tools = list(TOOL_BWORKBENCH)
	time = 60
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING
/*
/datum/crafting_recipe/durathread_vest
	name = "Makeshift Vest"
	result = /obj/item/clothing/suit/armor/vest/durathread
	reqs = list( /obj/item/stack/sheet/durathread = 5,
				/obj/item/stack/sheet/leather = 4)
	time = 50
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/durathread_helmet
	name = "Makeshift Helmet"
	result = /obj/item/clothing/head/helmet/durathread
	reqs = list( /obj/item/stack/sheet/durathread = 4,
				/obj/item/stack/sheet/leather = 5)
	time = 40
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/fannypack
	name = "Fannypack"
	result = /obj/item/storage/belt/fannypack
	reqs = list(/obj/item/stack/sheet/cloth = 2,
				/obj/item/stack/sheet/leather = 1)
	time = 20
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

	/datum/crafting_recipe/bandolier
	name = "Bandolier"
	result = /obj/item/storage/belt/bandolier
	reqs = list(/obj/item/stack/sheet/hay = 3,
				/obj/item/stack/sheet/leather = 4)
	time = 40
	category = CAT_CLOTHING
	subcategory = CAT_BELTS

/* - Commented out for now, these are particularly rare without rnd anyway and dont fit all sunglasses types.
/datum/crafting_recipe/hudsunsec
	name = "Security HUDsunglasses"
	result = /obj/item/clothing/glasses/hud/security/sunglasses
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/security = 1,
				  /obj/item/clothing/glasses/sunglasses = 1,
				  /obj/item/stack/cable_coil = 5)
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/hudsunsecremoval
	name = "Security HUD removal"
	result = /obj/item/clothing/glasses/sunglasses
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/security/sunglasses = 1)
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/hudsunmed
	name = "Medical HUDsunglasses"
	result = /obj/item/clothing/glasses/hud/health/sunglasses
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/health = 1,
				  /obj/item/clothing/glasses/sunglasses = 1,
				  /obj/item/stack/cable_coil = 5)
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/hudsunmedremoval
	name = "Medical HUD removal"
	result = /obj/item/clothing/glasses/sunglasses
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/health/sunglasses = 1)
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING


/datum/crafting_recipe/beergoggles
	name = "Beer Goggles"
	result = /obj/item/clothing/glasses/sunglasses/reagent
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/science = 1,
				  /obj/item/clothing/glasses/sunglasses = 1,
				  /obj/item/stack/cable_coil = 5)
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/beergogglesremoval
	name = "Beer Goggles removal"
	result = /obj/item/clothing/glasses/sunglasses
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/sunglasses/reagent = 1)
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING
*/

/datum/crafting_recipe/ghostsheet
	name = "Ghost Sheet"
	result = /obj/item/clothing/suit/ghost_sheet
	time = 5
	tools = list(TOOL_WIRECUTTER)
	reqs = list(/obj/item/bedsheet = 1)
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

//f13 additions
/datum/crafting_recipe/metalarmor
	name = "metal armor"
	result = /obj/item/clothing/suit/armor/f13/bmetalarmor
	reqs = list(/obj/item/stack/sheet/leather = 1,
				/obj/item/stack/cable_coil = 5,
				/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	time = 120
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING


/datum/crafting_recipe/Imetalarmor
	name = "improved metal armor"
	result = /obj/item/clothing/suit/armor/f13/ibmetalarmor
	reqs = list(/obj/item/stack/sheet/leather = 1,
				/obj/item/stack/cable_coil = 5,
				/obj/item/stack/sheet/metal = 4,
				/obj/item/stack/sheet/plasteel = 2)
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	time = 120
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/IImetalarmor
	name = "upgrading metal armor"
	result = /obj/item/clothing/suit/armor/f13/ibmetalarmor
	reqs = list(/obj/item/clothing/suit/armor/f13/bmetalarmor = 1,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/sheet/plasteel = 2)
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	time = 120
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING

/datum/crafting_recipe/settler
	name = "Settler Outfit"
	result = /obj/item/clothing/under/f13/settler
	reqs = list(/obj/item/stack/sheet/leather = 1,
				/obj/item/stack/sheet/cloth = 3)
	time = 15
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

/datum/crafting_recipe/merchant
	name = "Merchant Outfit"
	result = /obj/item/clothing/under/f13/merchant
	reqs = list(/obj/item/stack/sheet/hay = 2,
				/obj/item/stack/sheet/cloth = 3)
	time = 15
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

/datum/crafting_recipe/mercenary
	name = "Mercenary Outfit"
	result = /obj/item/clothing/under/f13/merca
	reqs = list(/obj/item/stack/sheet/hay = 2,
				/obj/item/stack/sheet/cloth = 3)
	time = 15
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

/datum/crafting_recipe/cowboyhat
	name = "Wide Brim Cowboy Hat"
	result = /obj/item/clothing/head/f13/cowboy
	reqs = list(/obj/item/stack/sheet/leather = 2,
				/obj/item/stack/sheet/cloth = 1)
	time = 15
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

/datum/crafting_recipe/cowboyboots
	name = "Cowboy Boots"
	result = /obj/item/clothing/shoes/f13/cowboy
	reqs = list(/obj/item/stack/sheet/leather = 2,
				/obj/item/stack/sheet/cloth = 2)
	time = 15
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

/datum/crafting_recipe/poncho
	name = "Poncho"
	result = /obj/item/clothing/suit/poncho
	reqs = list(/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/sheet/hay = 2)
	time = 15
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

/datum/crafting_recipe/sombrero
	name = "Sombrero"
	result = /obj/item/clothing/head/sombrero
	reqs = list(/obj/item/stack/sheet/hay = 4)
	time = 15
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

/datum/crafting_recipe/duster
	name = "Duster"
	result = /obj/item/clothing/suit/f13/duster
	reqs = list(/obj/item/stack/sheet/hay = 3,
				/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/sheet/leather = 6)
	time = 40
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

/datum/crafting_recipe/belt
	name = "Belt"
	result = /obj/item/storage/belt
	reqs = list(/obj/item/stack/sheet/hay = 3,
				/obj/item/stack/sheet/leather = 3)
	time = 15
	category = CAT_CLOTHING
	subcategory = CAT_BELTS

/datum/crafting_recipe/chestrig
	name = "Chest Rig"
	result = /obj/item/storage/belt/military
	reqs = list(/obj/item/stack/sheet/plastic = 2,
				/obj/item/stack/sheet/leather = 3)
	time = 30
	category = CAT_CLOTHING
	subcategory = CAT_BELTS

/datum/crafting_recipe/webbing
	name = "Webbing"
	result = /obj/item/storage/belt/military/alt
	reqs = list(/obj/item/stack/sheet/leather = 3,
				/obj/item/stack/sheet/cloth = 2)
	time = 15
	category = CAT_CLOTHING
	subcategory = CAT_BELTS

/datum/crafting_recipe/shoulderholster
	name = "Shoulder Holster"
	result = /obj/item/storage/belt/holster
	reqs = list(/obj/item/stack/sheet/leather = 2,
				/obj/item/stack/sheet/hay = 3)
	time = 15
	category = CAT_CLOTHING
	subcategory = CAT_BELTS

/datum/crafting_recipe/maletribal
	name = "Male Tribal Outfit"
	result = /obj/item/clothing/under/f13/tribal
	reqs = list(/obj/item/stack/sheet/cloth = 3)
	time = 10
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

/datum/crafting_recipe/femaletribal
	name = "Female Tribal Outfit"
	result = /obj/item/clothing/under/f13/female/tribal
	reqs = list(/obj/item/stack/sheet/cloth = 3)
	time = 10
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

/datum/crafting_recipe/facewrap
	name = "Desert Facewrap"
	result = /obj/item/clothing/mask/facewrap
	reqs = list(/obj/item/stack/sheet/cloth = 2)
	time = 10
	category = CAT_CLOTHING
	subcategory = CAT_WASTELAND

//Tribal armors

/datum/crafting_recipe/tribalgeckoarmor
	name = "Gecko Armor"
	result = /obj/item/clothing/suit/armor/f13/tribal
	reqs = list(/obj/item/stack/sheet/animalhide/geckohide = 2,
				/obj/item/stack/sheet/cloth = 2,
				/obj/item/stack/sheet/hay = 3)
	time = 10
	category = CAT_CLOTHING
	subcategory = CAT_CLOTHING
*/