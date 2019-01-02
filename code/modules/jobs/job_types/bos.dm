/*
BoS access:
Main doors: ACCESS_CAPTAIN 20
*/

/datum/job/bos //do NOT use this for anything, it's just to store faction datums
	department_flag = BOS
	faction = "BOS"
	total_positions = 0
	spawn_positions = 0
	selection_color = "#95a5a6"
	exp_type = EXP_TYPE_BROTHERHOOD
	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR)
	outfit = /datum/outfit/job/bos/

/datum/outfit/job/bos
	name = "bosdatums"
	jobtype = /datum/job/bos
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/f13/recon
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	belt = 			/obj/item/storage/belt/military
	glasses =		/obj/item/clothing/glasses/night

/datum/outfit/job/bos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK)

/*
Elder
*/
/datum/job/bos/f13elder
	title = "Elder"
	flag = F13ELDER
	head_announce = list("Security")
	//faction = "BOS"
	supervisors = "the high elders"
	selection_color = "#7f8c8d"
	req_admin_notify = 1
	exp_requirements = 2700

	outfit = /datum/outfit/job/bos/f13elder

	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR)

/datum/outfit/job/bos/f13elder
	name = "Elder"
	jobtype = /datum/job/bos/f13elder
	id = /obj/item/card/id/gold
	suit = 			/obj/item/clothing/suit/f13/elder
	suit_store =	/obj/item/gun/energy/laser/plasma
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1)


/*
Paladin
*/

/datum/job/bos/f13paladin
	title = "Paladin"
	flag = F13PALADIN

	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	supervisors = "the elder"
	selection_color = "#95a5a6"
	exp_requirements = 1800


	outfit = /datum/outfit/job/bos/f13paladin

/datum/outfit/job/bos/f13paladin
	name = "Paladin"
	jobtype = /datum/job/bos/f13paladin
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/t51b
	head = 			/obj/item/clothing/head/helmet/power_armor/t51b
	suit_store =	/obj/item/gun/energy/laser/scatter
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1)
	//PA training not in yet

/*
Knight
*/
/datum/job/bos/f13knight
	title = "Knight"
	flag = F13KNIGHT
	total_positions = 1
	spawn_positions = 1
	supervisors = "the elder"
	selection_color = "#95a5a6"
	exp_requirements = 1500

	outfit = /datum/outfit/job/bos/f13knight

	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS,ACCESS_KITCHEN, ACCESS_BAR)

/datum/outfit/job/bos/f13knight
	name = "Knight"
	jobtype = /datum/job/bos/f13knight
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/t45d
	head = 			/obj/item/clothing/head/helmet/power_armor/t45d
	suit_store =	/obj/item/gun/energy/laser/scatter
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1)
	//PA training not in yet

/*
Scribe
*/
/datum/job/bos/f13scribe
	title = "Scribe"
	flag = F13SCRIBE
	total_positions = 2
	spawn_positions = 2
	supervisors = "the elder"
	exp_requirements = 600


	outfit = /datum/outfit/job/bos/f13scribe

	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS)

/datum/outfit/job/bos/f13scribe
	name = "Scribe"
	jobtype = /datum/job/bos/f13scribe
	uniform =		/obj/item/clothing/under/syndicate
	shoes = 		/obj/item/clothing/shoes/combat
	suit = 			/obj/item/clothing/suit/f13/scribe
	belt = 			/obj/item/storage/belt/utility/full/engi
	suit_store =	/obj/item/gun/ballistic/automatic/smg10mm
	glasses =		/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_auto=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/energy/laser/pistol=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=4) //super paks not in yet
	//PA training not in yet

/*
Initiate
*/
/datum/job/bos/f13initiate
	title = "Initiate"
	flag = F13INITIATE
	total_positions = 2
	spawn_positions = 2
	supervisors = "the scribes and knights"

	outfit = /datum/outfit/job/bos/f13initiate

	access = list(ACCESS_BOS)
	minimal_access = list(ACCESS_BOS)

/datum/outfit/job/bos/f13initiate
	name = "Initiate"
	jobtype = /datum/job/bos/f13initiate
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood
	suit_store =	/obj/item/gun/ballistic/automatic/assault_rifle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/r20=3, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1)
