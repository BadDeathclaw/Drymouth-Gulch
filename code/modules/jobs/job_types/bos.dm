/*
BoS access:
Main doors: ACCESS_CAPTAIN 20
*/

/datum/job/bos //do NOT use this for anything, it's just to store faction datums.
	department_flag = BOS
	selection_color = "#95a5a6"
	exp_type = EXP_TYPE_BROTHERHOOD
	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	outfit = /datum/outfit/job/bos/

/datum/outfit/job/bos
	name = "bosdatums"
	jobtype = /datum/job/bos
	backpack = /obj/item/storage/backpack/explorer
	ears = /obj/item/radio/headset/headset_bos
	uniform = /obj/item/clothing/under/f13/recon
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military
	glasses = /obj/item/clothing/glasses/night
	id = /obj/item/card/id/dogtag

/datum/outfit/job/bos/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/datum/outfit/job/bos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/*
Elder
*/

/datum/job/bos/f13elder
	title = "Elder"
	flag = F13ELDER
	faction = "BOS"
	head_announce = list("Security")
	supervisors = "the high elders"
	selection_color = "#7f8c8d"
	req_admin_notify = 1
	exp_requirements = 2700
	total_positions = 0
	spawn_positions = 0
	outfit = /datum/outfit/job/bos/f13elder

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13elder
	name = "Elder"
	jobtype = /datum/job/bos/f13elder
	pa_wear = TRUE
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
	faction = "BOS"
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the field commander for the security team assigned to this region and are the direct superior to the Knights. As a Paladin, you lead your subordinates on patrols and scouting missions throughout the region. You are also responsible for managing the bunkers operations and security, and should take extra care in ensuring that your presence or location in the region is hidden to any outsider."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the elder"
	selection_color = "#7f8c8d"
	exp_requirements = 1800

	outfit = /datum/outfit/job/bos/f13paladin

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13paladin
	name = "Paladin"
	jobtype = /datum/job/bos/f13paladin
	pa_wear = TRUE
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/t51b
	head = 			/obj/item/clothing/head/helmet/power_armor/t51b
	suit_store =	/obj/item/gun/energy/laser/scatter
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1, \
		/obj/item/ammo_box/magazine/m10mm_adv=2)

/datum/job/bos/f13paladin/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/*
Head Scribe
*/

/datum/job/bos/f13headscribe
	title = "Head Scribe"
	flag = F13HEADSCRIBE
	head_announce = list("Security")
	faction = "BOS"
	total_positions = 1
	spawn_positions = 1
	description = "You are the experienced scribe placed in charge of the research team assigned to this region, and the direct superior to the Scribes. As the Head Scribe, you are in charge of ensuring that supplies are processed into gear for the Knights, and work with the Paladin in organizing missions. The Brotherhoods presence in the Mojave is unknown to most outsiders, so you should take care in making sure that wastelanders do not recognize your identity, or find the location of your bunker."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the elder"
	selection_color = "#7f8c8d"
	exp_requirements = 600
	exp_type = EXP_TYPE_SCRIBE

	outfit = /datum/outfit/job/bos/f13headscribe

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13headscribe
	name = "Head Scribe"
	jobtype = /datum/job/bos/f13headscribe
	pa_wear = TRUE
	chemwhiz = TRUE
	suit = 			/obj/item/clothing/suit/armor/f13/headscribe
	suit_store =	/obj/item/gun/energy/laser/pistol
	belt = 			/obj/item/storage/belt/utility/full/engi
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/stock_parts/cell/ammo/ec=2)

/*
Knight
*/

/datum/job/bos/f13knight
	title = "Knight"
	flag = F13KNIGHT
	faction = "BOS"
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Paladin, acting as a foot soldier on patrol and are responsible for the continued training and wellbeing of the initiate-knights. The Brotherhoods presence in the Mojave is unknown to most outsiders, so you should take care in making sure that wastelanders do not recognize your identity, or find the location of your bunker."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Paladin"
	selection_color = "#95a5a6"
	exp_requirements = 900

	outfit = /datum/outfit/job/bos/f13knight

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13knight
	name = "Knight"
	jobtype = /datum/job/bos/f13knight
	pa_wear = TRUE
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/t45d
	head = 			/obj/item/clothing/head/helmet/power_armor/t45d
	suit_store =	/obj/item/gun/energy/laser/aer9
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1, \
		/obj/item/ammo_box/magazine/m10mm_adv=2)

/datum/job/bos/f13knight/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")

/*
Scribe
*/

/datum/job/bos/f13scribe
	title = "Scribe"
	flag = F13SCRIBE
	faction = "BOS"
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Head Scribe, tasked with researching and reverse-engineering recovered technologies from the old world, while maintaining the brotherhoods scientific archives. You may also be given a trainee to assign duties to. The Brotherhoods presence in the Mojave is unknown to most outsiders, so you should take care in making sure that wastelanders do not recognize your identity, or find the location of your bunker."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Head Scribe"
	selection_color = "#95a5a6"
	exp_requirements = 600

	outfit = /datum/outfit/job/bos/f13scribe

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13scribe
	name = "Scribe"
	jobtype = /datum/job/bos/f13scribe
	chemwhiz = TRUE
	shoes = 		/obj/item/clothing/shoes/combat
	suit = 			/obj/item/clothing/suit/f13/scribe
	belt = 			/obj/item/storage/belt/utility/full/engi
	id = 			/obj/item/card/id/dogtag
	glasses =		/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/energy/laser/pistol=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2) //super paks not in yet
	//PA training not in yet

/*
Initiate Knight
*/

/datum/job/bos/f13initiateknight
	title = "Initiate Knight"
	flag = F13INITIATEKNIGHT
	faction = "BOS"
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Knights, as an inexperienced member of the brotherhood your sole purpose is to train in order to become a fully-fledged Knight in the future. You should take care in not straying from the bunker without an escort. The Brotherhoods presence in the Mojave is unknown to most outsiders, so you should take care in making sure that wastelanders do not recognize your identity, or find the location of your bunker."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the knights"
	selection_color = "#95a5a6"
	exp_requirements = 1800
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/bos/f13initiateknight

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13initiateknight
	name = "Initiate Knight"
	jobtype = /datum/job/bos/f13initiateknight
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood
	suit_store =	/obj/item/gun/energy/laser/aer9
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2, \
		/obj/item/gun/energy/laser/pistol=1, \
		/obj/item/stock_parts/cell/ammo/ec=2)
/*
Initiate Scribe
*/

/datum/job/bos/f13initiatescribe
	title = "Initiate Scribe"
	flag = F13INITIATESCRIBE
	faction = "BOS"
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Scribes, and are tasked with training and taking orders from them to learn the basics of research, engineering and any other tasks assigned to you by your superiors. The Brotherhoods presence in the Mojave is unknown to most outsiders, so you should take care in making sure that wastelanders do not recognize your identity, or find the location of your bunker."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the scribes"
	selection_color = "#95a5a6"
	exp_requirements = 1800
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/bos/f13initiatescribe

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13initiatescribe
	name = "Initiate Scribe"
	jobtype = /datum/job/bos/f13initiatescribe
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/f13/recon
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	belt = 			/obj/item/storage/belt/utility/full/engi
	glasses =		/obj/item/clothing/glasses/sunglasses/big
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/gun/energy/laser/pistol=1, \
		/obj/item/stock_parts/cell/ammo/ec=2)
