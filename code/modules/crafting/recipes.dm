
/datum/crafting_recipe
	var/name = "" //in-game display name
	var/reqs[] = list() //type paths of items consumed associated with how many are needed
	var/result //type path of item resulting from this craft
	var/tools[] = list() //type paths of items needed but not consumed
	var/traits[] = list() //type paths of traits needed, hopefully
	var/time = 30 //time in deciseconds
	var/parts[] = list() //type paths of items that will be placed in the result
	var/chem_catalysts[] = list() //like tools but for reagents
	var/category = CAT_NONE //where it shows up in the crafting UI
	var/subcategory = CAT_NONE


/datum/crafting_recipe/pin_removal
	name = "Pin Removal"
	result = /obj/item/gun
	reqs = list(/obj/item/gun = 1)
	parts = list(/obj/item/gun = 1)
	tools = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
	
/datum/crafting_recipe/IED
	name = "IED"
	result = /obj/item/grenade/iedcasing
	reqs = list(/datum/reagent/fuel = 50,
				/obj/item/stack/cable_coil = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/reagent_containers/food/drinks/soda_cans = 1)
	parts = list(/obj/item/reagent_containers/food/drinks/soda_cans = 1)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/molotov
	name = "Molotov"
	result = /obj/item/reagent_containers/food/drinks/bottle/molotov
	reqs = list(/obj/item/reagent_containers/glass/rag = 1,
				/obj/item/reagent_containers/food/drinks/bottle = 1)
	parts = list(/obj/item/reagent_containers/food/drinks/bottle = 1)
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/bola
	name = "Bola"
	result = /obj/item/restraints/legcuffs/bola
	reqs = list(/obj/item/restraints/handcuffs/cable = 1,
				/obj/item/stack/sheet/metal = 6)
	time = 20//15 faster than crafting them by hand!
	category= CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/ed209
	name = "ED209"
	result = /mob/living/simple_animal/bot/ed209
	reqs = list(/obj/item/robot_suit = 1,
				/obj/item/clothing/head/helmet = 1,
				/obj/item/clothing/suit/armor/vest = 1,
				/obj/item/bodypart/l_leg/robot = 1,
				/obj/item/bodypart/r_leg/robot = 1,
				/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/cable_coil = 1,
				/obj/item/gun/energy/e_gun/advtaser = 1,
				/obj/item/stock_parts/cell = 1,
				/obj/item/assembly/prox_sensor = 1)
	tools = list(TOOL_WELDER, TOOL_SCREWDRIVER)
	time = 60
	category = CAT_ROBOT

/datum/crafting_recipe/cleanbot
	name = "Cleanbot"
	result = /mob/living/simple_animal/bot/cleanbot
	reqs = list(/obj/item/reagent_containers/glass/bucket = 1,
				/obj/item/assembly/prox_sensor = 1,
				/obj/item/bodypart/r_arm/robot = 1)
	time = 40
	category = CAT_ROBOT

/datum/crafting_recipe/floorbot
	name = "Floorbot"
	result = /mob/living/simple_animal/bot/floorbot
	reqs = list(/obj/item/storage/toolbox/mechanical = 1,
				/obj/item/stack/tile/plasteel = 1,
				/obj/item/assembly/prox_sensor = 1,
				/obj/item/bodypart/r_arm/robot = 1)
	time = 40
	category = CAT_ROBOT

/datum/crafting_recipe/medbot
	name = "Medbot"
	result = /mob/living/simple_animal/bot/medbot
	reqs = list(/obj/item/healthanalyzer = 1,
				/obj/item/storage/firstaid = 1,
				/obj/item/assembly/prox_sensor = 1,
				/obj/item/bodypart/r_arm/robot = 1)
	time = 40
	category = CAT_ROBOT

/datum/crafting_recipe/honkbot
	name = "Honkbot"
	result = /mob/living/simple_animal/bot/honkbot
	reqs = list(/obj/item/storage/box/clown = 1,
				/obj/item/bodypart/r_arm/robot = 1,
				/obj/item/assembly/prox_sensor = 1,
				/obj/item/bikehorn/ = 1)
	time = 40
	category = CAT_ROBOT

/datum/crafting_recipe/m44
	name = ".44 Magnum speed loader"
	result = /obj/item/ammo_box/m44
	reqs = list(/obj/item/stack/sheet/metal = 3)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/c10mm
	name = "10mm ammo box"
	result = /obj/item/ammo_box/c10mm
	reqs = list(/obj/item/stack/sheet/metal = 8)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/lethalshot
	name = "buckshot shotgun box"
	result = /obj/item/storage/box/lethalshot
	reqs = list(/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/slugshot
	name = "slug shotgun box"
	result = /obj/item/storage/box/slugshot
	reqs = list(/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/beanbag
	name = "beanbag shotgun box"
	result = /obj/item/storage/box/rubbershot/beanbag
	reqs = list(/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/rubbershot
	name = "rubbershot shotgun box"
	result = /obj/item/storage/box/rubbershot
	reqs = list(/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/a556
	name = "5.56mm ammo box"
	result = /obj/item/ammo_box/a556
	reqs = list(/obj/item/stack/sheet/metal = 10)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/c9mm
	name = "9mm ammo box"
	result = /obj/item/ammo_box/c9mm
	reqs = list(/obj/item/stack/sheet/metal = 8)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/a762
	name = "7.62mm stripper clip"
	result = /obj/item/ammo_box/a762
	reqs = list(/obj/item/stack/sheet/metal = 3)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/a762lp
	name = "7.62mm lowpower double stacked stripper clip"
	result = /obj/item/ammo_box/a762/doublestacked
	reqs = list(/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/a308
	name = ".308 stripper clip"
	result = /obj/item/ammo_box/a308
	reqs = list(/obj/item/stack/sheet/metal = 4)
	tools = list(TOOL_SCREWDRIVER,
				TOOL_RELOADER)
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/spear
	name = "Spear"
	result = /obj/item/twohanded/spear
	reqs = list(/obj/item/restraints/handcuffs/cable = 1,
				/obj/item/shard = 1,
				/obj/item/stack/rods = 1)
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/throwing_spear
	name = "Throwing Spear"
	result = /obj/item/throwing_star/spear
	reqs = list(/obj/item/stack/ore/iron = 1,
				/obj/item/stack/rods = 3,
				/obj/item/stack/sheet/sinew = 1)
	tools = list(TOOL_WELDER)
	time = 50
	category= CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/kittyears
	name = "Kitty Ears"
	result = /obj/item/clothing/head/kitty/genuine
	time = 10
	reqs = list(/obj/item/organ/tail/cat = 1,
				/obj/item/organ/ears/cat = 1)
	category = CAT_MISC
/*
/datum/crafting_recipe/skateboard
	name = "Skateboard"
	result = /obj/vehicle/ridden/scooter/skateboard
	time = 60
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/rods = 10)
	category = CAT_MISC

/datum/crafting_recipe/scooter
	name = "Scooter"
	result = /obj/vehicle/ridden/scooter
	time = 65
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/rods = 12)
	category = CAT_MISC
*/
/datum/crafting_recipe/papersack
	name = "Paper Sack"
	result = /obj/item/storage/box/papersack
	time = 10
	reqs = list(/obj/item/paper = 5)
	category = CAT_MISC


/datum/crafting_recipe/flashlight_eyes
	name = "Flashlight Eyes"
	result = /obj/item/organ/eyes/robotic/flashlight
	time = 10
	reqs = list(
		/obj/item/flashlight = 2,
		/obj/item/restraints/handcuffs/cable = 1
	)
	category = CAT_MISC

/datum/crafting_recipe/paperframes
	name = "Paper Frames"
	result = /obj/item/stack/sheet/paperframes/five
	time = 10
	reqs = list(/obj/item/stack/sheet/mineral/wood = 5, /obj/item/paper = 20)
	category = CAT_MISC

/datum/crafting_recipe/naturalpaper
	name = "Hand-Pressed Paper"
	time = 30
	reqs = list(/datum/reagent/water = 50, /obj/item/stack/sheet/mineral/wood = 1)
	tools = list(/obj/item/hatchet)
	result = /obj/item/paper_bin/bundlenatural
	category = CAT_MISC

/datum/crafting_recipe/blackcarpet
	name = "Black Carpet"
	reqs = list(/obj/item/stack/tile/carpet = 50, /obj/item/toy/crayon/black = 1)
	result = /obj/item/stack/tile/carpet/black/fifty
	category = CAT_MISC

/datum/crafting_recipe/showercurtain
	name = "Shower Curtains"
	reqs = 	list(/obj/item/stack/sheet/cloth = 2, /obj/item/stack/sheet/plastic = 2, /obj/item/stack/rods = 1)
	result = /obj/structure/curtain
	category = CAT_MISC

/datum/crafting_recipe/chemical_payload
	name = "Chemical Payload (C4)"
	result = /obj/item/bombcore/chemical
	reqs = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/grenade/plastic/c4 = 1,
		/obj/item/grenade/chem_grenade = 2
	)
	parts = list(/obj/item/stock_parts/matter_bin = 1, /obj/item/grenade/chem_grenade = 2)
	time = 30
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/chemical_payload2
	name = "Chemical Payload (Gibtonite)"
	result = /obj/item/bombcore/chemical
	reqs = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/twohanded/required/gibtonite = 1,
		/obj/item/grenade/chem_grenade = 2
	)
	parts = list(/obj/item/stock_parts/matter_bin = 1, /obj/item/grenade/chem_grenade = 2)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/bonearmor
	name = "Bone Armor"
	result = /obj/item/clothing/suit/armor/bone
	time = 30
	reqs = list(/obj/item/stack/sheet/bone = 6)
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/bonetalisman
	name = "Bone Talisman"
	result = /obj/item/clothing/accessory/talisman
	time = 20
	reqs = list(/obj/item/stack/sheet/bone = 2,
				 /obj/item/stack/sheet/sinew = 1)
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/bonecodpiece
	name = "Skull Codpiece"
	result = /obj/item/clothing/accessory/skullcodpiece
	time = 20
	reqs = list(/obj/item/stack/sheet/bone = 2,
				 /obj/item/stack/sheet/animalhide/goliath_hide = 1)
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/bracers
	name = "Bone Bracers"
	result = /obj/item/clothing/gloves/bracer
	time = 20
	reqs = list(/obj/item/stack/sheet/bone = 2,
				 /obj/item/stack/sheet/sinew = 1)
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/skullhelm
	name = "Skull Helmet"
	result = /obj/item/clothing/head/helmet/skull
	time = 30
	reqs = list(/obj/item/stack/sheet/bone = 4)
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/bonedagger
	name = "Bone Dagger"
	result = /obj/item/kitchen/knife/combat/bone
	time = 20
	reqs = list(/obj/item/stack/sheet/bone = 2)
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/bonespear
	name = "Bone Spear"
	result = /obj/item/twohanded/bonespear
	time = 30
	reqs = list(/obj/item/stack/sheet/bone = 4,
				 /obj/item/stack/sheet/sinew = 1)
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/boneaxe
	name = "Bone Axe"
	result = /obj/item/twohanded/fireaxe/boneaxe
	time = 50
	reqs = list(/obj/item/stack/sheet/bone = 6,
				 /obj/item/stack/sheet/sinew = 3)
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/tribal_torch
	name = "Tribal Torch"
	result = /obj/item/candle/tribal_torch
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 4)
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/handheld_torch
	name = "Handheld Torch"
	result = /obj/item/flashlight/flare/torch
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 3,
				/obj/item/stack/sheet/cloth = 1)
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/headpike
	name = "Spike Head (Glass Spear)"
	time = 65
	reqs = list(/obj/item/twohanded/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/twohanded/spear = 1)
	result = /obj/structure/headpike
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/headpikebone
	name = "Spike Head (Bone Spear)"
	time = 65
	reqs = list(/obj/item/twohanded/bonespear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/twohanded/bonespear = 1)
	result = /obj/structure/headpike/bone
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/headpikelegion
	name = "Spike Head (Throwing Spear)"
	time = 65
	reqs = list(/obj/item/throwing_star/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/throwing_star/spear = 1)
	result = /obj/structure/headpike
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL
	
/datum/crafting_recipe/goliathcloak
	name = "Goliath Cloak"
	result = /obj/item/clothing/suit/hooded/cloak/goliath
	time = 50
	reqs = list(/obj/item/stack/sheet/leather = 2,
				/obj/item/stack/sheet/sinew = 2,
				/obj/item/stack/sheet/animalhide/goliath_hide = 2) //it takes 4 goliaths to make 1 cloak if the plates are skinned
	category = CAT_PRIMAL
	subcategory = CAT_TRIBAL

/datum/crafting_recipe/smallcarton
	name = "Small Carton"
	result = /obj/item/reagent_containers/food/drinks/sillycup/smallcarton
	time = 10
	reqs = list(/obj/item/stack/sheet/cardboard = 1)
	category = CAT_MISC

/datum/crafting_recipe/pressureplate
	name = "Pressure Plate"
	result = /obj/item/pressure_plate
	time = 5
	reqs = list(/obj/item/stack/sheet/metal = 1,
				  /obj/item/stack/tile/plasteel = 1,
				  /obj/item/stack/cable_coil = 2,
				  /obj/item/assembly/igniter = 1)
	category = CAT_MISC


/datum/crafting_recipe/rcl
	name = "Makeshift Rapid Cable Layer"
	result = /obj/item/twohanded/rcl/ghetto
	time = 40
	tools = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH)
	reqs = list(/obj/item/stack/sheet/metal = 15)
	category = CAT_MISC

/datum/crafting_recipe/guillotine
	name = "Guillotine"
	result = /obj/structure/guillotine
	time = 150 // Building a functioning guillotine takes time
	reqs = list(/obj/item/stack/sheet/plasteel = 3,
		        /obj/item/stack/sheet/mineral/wood = 20,
		        /obj/item/stack/cable_coil = 10)
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	category = CAT_MISC
	
/datum/crafting_recipe/spooky_camera
	name = "Camera Obscura"
	result = /obj/item/camera/spooky
	time = 15
	reqs = list(/obj/item/camera = 1,
				/datum/reagent/water/holywater = 10)
	parts = list(/obj/item/camera = 1)
	category = CAT_MISC

/datum/crafting_recipe/jet
	name = "Jet"
	result = /obj/item/reagent_containers/pill/patch/jet
	time = 20
	reqs = list(/datum/reagent/consumable/milk = 25, /obj/item/clothing/mask/cigarette = 3, /obj/item/toy/crayon/spraycan)
	category = CAT_DRUGS


/datum/crafting_recipe/rags
	name = "Cut clothing into rags"
	result = /obj/item/stack/sheet/cloth/three
	reqs = list(/obj/item/clothing/under = 1)
	time = 20
	category = CAT_MISC

/datum/crafting_recipe/healpowder
	name = "Healing powder"
	result = /obj/item/reagent_containers/pill/patch/healingpowder
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 1,
				/obj/item/reagent_containers/food/snacks/grown/xander = 1)
	time = 20
	category = CAT_DRUGS

/datum/crafting_recipe/healpoultice
	name = "Healing poultice"
	result = /obj/item/reagent_containers/pill/patch/healpoultice
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 1,
				/obj/item/reagent_containers/food/snacks/grown/xander = 1,
				/obj/item/reagent_containers/food/snacks/grown/feracactus = 1,
				/obj/item/reagent_containers/food/snacks/grown/fungus = 1)
	time = 40
	category = CAT_DRUGS

/datum/crafting_recipe/stimpak
	name = "Stimpak"
	result = /obj/item/reagent_containers/hypospray/medipen/stimpak
	reqs = list(/obj/item/reagent_containers/pill/patch/healingpowder = 1,
				/obj/item/reagent_containers/syringe = 1,)
	tools = list(/obj/item/lighter,
				/obj/item/reagent_containers/glass/beaker)
	time = 20
	category = CAT_DRUGS


/datum/crafting_recipe/superstimpak
	name = "Super Stimpak"
	result = /obj/item/reagent_containers/hypospray/medipen/stimpak/super
	reqs = list(/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
				/obj/item/stack/sheet/leather = 1,
				/obj/item/stack/cable_coil = 5,
				/obj/item/reagent_containers/food/drinks/soda_cans/f13nukacola = 1,
 				/obj/item/reagent_containers/food/snacks/grown/mutfruit = 1)
	tools = list(/obj/item/lighter, /obj/item/screwdriver, /obj/item/wirecutters)
	time = 90
	category = CAT_DRUGS


/datum/crafting_recipe/stimsyringe
	name = "Recycled Stimpak"
	result = /obj/item/reagent_containers/syringe
	reqs = list(/obj/item/reagent_containers/hypospray/medipen/stimpak = 1)
	time = 20
	category = CAT_MEDICAL


/datum/crafting_recipe/slavecollar
	name = "Slave Collar"
	result = /obj/item/assembly/signaler/electropack/shockcollar
	reqs = list(/obj/item/clothing/neck/petcollar = 1,
				/obj/item/assembly/signaler = 1,
				/obj/item/assembly/igniter =1)
	time = 40
	category = CAT_MISC

/datum/crafting_recipe/mop
	name = "Mop"
	result = /obj/item/mop
	reqs = list(/obj/item/stack/rods = 2,
				/obj/item/reagent_containers/glass/rag = 1)
	time = 30
	category = CAT_MISC

//F13
///ASSEMBLY ITEMS
/datum/crafting_recipe/mousetrap
	name = "Mousetrap"
	result = /obj/item/assembly/mousetrap
	reqs = list(/obj/item/stack/sheet/mineral/wood = 1,
				/obj/item/stack/rods = 1)
	time = 10
	category = CAT_ASSEM

/datum/crafting_recipe/igniter
	name = "Igniter"
	result = /obj/item/assembly/igniter
	reqs = list(/obj/item/stack/sheet/glass = 1,
				/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/rods = 1,
				/obj/item/stack/cable_coil = 1)
	time = 10
	category = CAT_ASSEM

/datum/crafting_recipe/health_sensor
	name = "Health sensor"
	result = /obj/item/assembly/health
	reqs = list(/obj/item/stack/sheet/glass = 1,
				/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/rods = 1)
	time = 10
	category = CAT_ASSEM

/datum/crafting_recipe/timer
	name = "Timer"
	result = /obj/item/assembly/timer
	reqs = list(/obj/item/stack/sheet/glass = 1,
				/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/rods = 1)
	time = 10
	category = CAT_ASSEM

/datum/crafting_recipe/signaler
	name = "Remote signaling device"
	result = /obj/item/assembly/signaler
	reqs = list(/obj/item/stack/sheet/glass = 1,
				/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/rods = 1,
				/obj/item/stack/cable_coil = 2)
	time = 10
	category = CAT_ASSEM

/datum/crafting_recipe/infrared
	name = "Infrared emitter"
	result = /obj/item/assembly/infra
	reqs = list(/obj/item/stack/sheet/glass = 1,
				/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/rods = 1)
	time = 10
	category = CAT_ASSEM

/datum/crafting_recipe/proximity
	name = "Proximity sensor"
	result = /obj/item/assembly/prox_sensor
	reqs = list(/obj/item/stack/sheet/glass = 1,
				/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/rods = 1)
	time = 10
	category = CAT_ASSEM
///Medical
/datum/crafting_recipe/healthanalyzer
	name = "Health analyzer"
	result = /obj/item/healthanalyzer
	reqs = list(/obj/item/stack/sheet/glass = 1,
				/obj/item/stack/sheet/metal = 1,
				/obj/item/assembly/infra = 1,
				/obj/item/assembly/health)
	tools = list(TOOL_WELDER, TOOL_SCREWDRIVER)
	time = 10
	category = CAT_MEDICAL

/datum/crafting_recipe/beaker
	name = "Beaker"
	result = /obj/item/reagent_containers/glass/beaker
	reqs = list(/obj/item/stack/sheet/glass = 2)
	tools = list(TOOL_WELDER)
	time = 10
	category = CAT_MEDICAL

/datum/crafting_recipe/beaker_large
	name = "Large beaker"
	result = /obj/item/reagent_containers/glass/beaker/large
	reqs = list(/obj/item/stack/sheet/glass = 6)
	tools = list(TOOL_WELDER)
	time = 40
	category = CAT_MEDICAL

/datum/crafting_recipe/syringe
	name = "Syringe"
	result = /obj/item/reagent_containers/syringe
	reqs = list(/obj/item/stack/rods = 1,
				/obj/item/stack/sheet/glass = 1)
	tools = list(TOOL_WIRECUTTER)
	time = 10
	category = CAT_MEDICAL

/datum/crafting_recipe/solids
	name = "Solid beaker"
	result = /obj/item/reagent_containers/glass/beaker/solids
	reqs = list(/obj/item/stack/sheet/glass = 2,
				/obj/item/stack/sheet/metal = 2)
	tools = list(TOOL_WELDER)
	time = 30
	category = CAT_MEDICAL



