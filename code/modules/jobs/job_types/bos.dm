/*
BoS access:
Main doors: ACCESS_CAPTAIN 20
*/



/*
Elder
*/
/datum/job/f13elder
	title = "Elder"
	flag = F13ELDER
	department_flag = BOS
	head_announce = list("Security")
	//faction = "BOS"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the high elders"
	selection_color = "#7f8c8d"
	req_admin_notify = 1
	exp_requirements = 2700
	exp_type = EXP_TYPE_BROTHERHOOD

	outfit = /datum/outfit/job/f13elder

	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR)

/datum/outfit/job/f13elder
	name = "Elder"
	jobtype = /datum/job/f13elder

	id = /obj/item/card/id/gold

	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/f13/recon
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	suit = 			/obj/item/clothing/suit/f13/elder
	suit_store =	/obj/item/gun/energy/laser/plasma
	belt = 			/obj/item/storage/belt/military
	glasses =		/obj/item/clothing/glasses/night
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1)




/*
Paladin
*/

/datum/job/f13paladin
	title = "Paladin"
	flag = F13PALADIN
	department_flag = BOS
	head_announce = list("Security")
	faction = "BOS"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the elder"
	selection_color = "#95a5a6"
	exp_requirements = 1800
	exp_type = EXP_TYPE_BROTHERHOOD

	outfit = /datum/outfit/job/f13paladin

	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR)

/datum/outfit/job/f13paladin
	name = "Paladin"
	jobtype = /datum/job/f13paladin
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/f13/recon
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/t51b
	head = 			/obj/item/clothing/head/helmet/power_armor/t51b
	suit_store =	/obj/item/gun/energy/laser/scatter
	belt = 			/obj/item/storage/belt/military
	glasses =		/obj/item/clothing/glasses/night
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1)


/*Head Scribe
*/

/datum/job/f13headscribe
	title = "Head Scribe"
	flag = F13HEADSCRIBE
	department_flag = BOS
	head_announce = list("Security")
	faction = "BOS"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the elder"
	selection_color = "#95a5a6"
	exp_requirements = 1800
	exp_type = EXP_TYPE_BROTHERHOOD

	outfit = /datum/outfit/job/f13headscribe

	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR)

/datum/outfit/job/f13headscribe
	name = "Head Scribe"
	jobtype = /datum/job/f13headscribe
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/f13/recon
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	suit = 			/obj/item/clothing/suit/armor/f13/headscribe
	suit_store =	/obj/item/gun/energy/laser/pistol
	belt = 			/obj/item/storage/belt/utility/full/engi
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1)


/*
Knight
*/
/datum/job/f13knight
	title = "Knight"
	flag = F13KNIGHT
	department_flag = BOS
	faction = "BOS"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Paladin"
	selection_color = "#95a5a6"
	exp_requirements = 900
	exp_type = EXP_TYPE_BROTHERHOOD

	outfit = /datum/outfit/job/f13knight

	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS,ACCESS_KITCHEN, ACCESS_BAR)

/datum/outfit/job/f13knight
	name = "Knight"
	jobtype = /datum/job/f13knight
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/f13/recon
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/t45d
	head = 			/obj/item/clothing/head/helmet/power_armor/t45d
	suit_store =	/obj/item/gun/energy/laser/aer9
	belt = 			/obj/item/storage/belt/military
	glasses =		/obj/item/clothing/glasses/night
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1)


/*
Scribe
*/
/datum/job/f13scribe
	title = "Scribe"
	flag = F13SCRIBE
	department_flag = BOS
	faction = "BOS"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Head Scribe"
	selection_color = "#95a5a6"
	exp_requirements = 600
	exp_type = EXP_TYPE_BROTHERHOOD


	outfit = /datum/outfit/job/f13scribe

	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS)

/datum/outfit/job/f13scribe
	name = "Scribe"
	jobtype = /datum/job/f13scribe
	backpack = 		/obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/f13/recon
	shoes = 		/obj/item/clothing/shoes/combat
	gloves = 		/obj/item/clothing/gloves/combat
	suit = 			/obj/item/clothing/suit/f13/scribe
	belt = 			/obj/item/storage/belt/utility/full/engi
	suit_store =	/obj/item/gun/ballistic/automatic/smg10mm
	glasses =		/obj/item/clothing/glasses/sunglasses/big
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_auto=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/energy/laser/pistol=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=4) //super paks not in yet
	//PA training not in yet

/*
Initiate Knight
*/
/datum/job/f13initiateknight
	title = "Initiate Knight"
	flag = F13INITIATEKNIGHT
	department_flag = BOS
	faction = "BOS"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the knights"
	selection_color = "#95a5a6"


	outfit = /datum/outfit/job/f13initiateknight

	access = list(ACCESS_BOS)
	minimal_access = list(ACCESS_BOS)

/datum/outfit/job/f13initiateknight
	name = "Initiate Knight"
	jobtype = /datum/job/f13initiateknight
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/f13/recon
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood
	suit_store =	/obj/item/gun/ballistic/automatic/marksman/servicerifle
	belt = 			/obj/item/storage/belt/military
	glasses =		/obj/item/clothing/glasses/night
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/ammo_box/magazine/r20=3, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/energy/laser/pistol=1)

/*
Initiate Scribe
*/
/datum/job/f13initiatescribe
	title = "Initiate Scribe"
	flag = F13INITIATESCRIBE
	department_flag = BOS
	faction = "BOS"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the scribes"
	selection_color = "#95a5a6"


	outfit = /datum/outfit/job/f13initiatescribe

	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS)

/datum/outfit/job/f13initiatescribe
	name = "Initiate Scribe"
	jobtype = /datum/job/f13initiatescribe
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/f13/recon
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	belt = 			/obj/item/storage/belt/utility/full/engi
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/n99=1)