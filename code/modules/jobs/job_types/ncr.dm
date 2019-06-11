/datum/job/ncr //do NOT use this for anything, it's just to store faction datums
	department_flag = NCR
	selection_color = "#ffeeaa"
	exp_type = EXP_TYPE_NCR
	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/ncr/
	name = "NCRdatums"
	jobtype = /datum/job/ncr/
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	belt = 			/obj/item/storage/belt/military/assault
	shoes = 		/obj/item/clothing/shoes/jackboots

/*
Colonel
*/
/datum/job/ncr/f13colonel
	title = "NCR Colonel"
	flag = F13COLONEL
//	faction = "Station"
	head_announce = list("Security")
	supervisors = "the general"
	req_admin_notify = 1
	exp_requirements = 2700
	total_positions = 0
	spawn_positions = 0

	outfit = /datum/outfit/job/ncr/f13colonel

/datum/outfit/job/ncr/f13colonel
	name 		= "NCR Colonel"
	jobtype 	= /datum/job/ncr/f13colonel
	uniform		= /obj/item/clothing/under/f13/ncr/officer
	accessory 	= /obj/item/clothing/accessory/ncr
	suit 		= /obj/item/clothing/suit/armor/f13/power_armor/t51b/sierra
	head 		= /obj/item/clothing/head/beret/ncr
	gloves 		= /obj/item/clothing/gloves/combat
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	suit_store  = /obj/item/gun/ballistic/automatic/marksman
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45=3, \
		/obj/item/ammo_box/magazine/r20=2, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/m1911=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/storage/bag/money/small/ncr)
	box = null

/*
Captain
*/
/datum/job/ncr/f13captain
	title = "NCR Captain"
	flag = F13CAPTAIN
	head_announce = list("Security")
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are the commanding officer of your company and direct superior to the Veteran Ranger and Lieutenant, coordinating with your staff you must ensure that the objectives of central command are completed to the letter. Working closely with them on logistics, mission planning and special operations with the Rangers, you are here to establish a strong foothold for the NCR within the region."
	supervisors = "Colonel"
	req_admin_notify = 1
	exp_requirements = 1800

	outfit = /datum/outfit/job/ncr/f13captain

/datum/outfit/job/ncr/f13captain
	name = "NCR Captain"
	jobtype 	= /datum/job/ncr/f13captain
	id 			= /obj/item/card/id/ncrcaptain
	uniform		= /obj/item/clothing/under/f13/ncr/officer
	accessory 	= /obj/item/clothing/accessory/ncr/CPT
	suit 		= /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head 		= /obj/item/clothing/head/beret/ncr
	gloves 		= /obj/item/clothing/gloves/combat
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m50=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/deagle=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/storage/bag/money/small/ncr)
	box = null

/*
Lieutenant
*/
/datum/job/ncr/f13lieutenant
	title = "NCR Lieutenant"
	flag = F13LIEUTENANT
	total_positions = 1
	spawn_positions = 1
	faction = "NCR"
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are the direct superior to the Sergeant and Enlisted, working with the Captain and under special circumstances, Rangers. You plan patrols, training and missions, working in some cases with Rangers in accomplishing objectives otherwise beyond the capabilities of ordinary enlisted personnel."
	supervisors = "Captain and above"
	selection_color = "#fff5cc"
	exp_requirements = 1200

	outfit = /datum/outfit/job/ncr/f13lieutenant

/datum/outfit/job/ncr/f13lieutenant
	name		= "NCR Lieutenant"
	jobtype		= /datum/job/ncr/f13lieutenant
	id			= /obj/item/card/id/ncrlieutenant
	uniform		= /obj/item/clothing/under/f13/ncr/officer
	accessory	= /obj/item/clothing/accessory/ncr/LT
	suit 		= /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head 		= /obj/item/clothing/head/beret/ncr
	gloves 		= /obj/item/clothing/gloves/combat
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	suit_store 	= /obj/item/gun/ballistic/shotgun/automatic/hunting
	backpack_contents = list(
		/obj/item/ammo_box/a762/doublestacked=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrofficers)
	box = null

	/*
Medic
*/
/datum/job/ncr/f13medic
	title = "NCR Medical Officer"
	flag = F13MEDIC
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are in charge of providing medical support and organization to the NCR throughout the region. You answer directly to the Captain and organize NCR personnel for medical operations as needed."
	supervisors = "Captain and above"
	selection_color = "#fff5cc"
	exp_requirements = 1200

	outfit = /datum/outfit/job/ncr/f13medic

/datum/outfit/job/ncr/f13medic
	name = "NCR Medical Officer"
	jobtype = /datum/job/ncr/f13medic
	id		= /obj/item/card/id/ncrlieutenant
	uniform =  		/obj/item/clothing/under/f13/ncr/officer
	accessory =     /obj/item/clothing/accessory/ncr/LT
	suit = 			/obj/item/clothing/suit/toggle/labcoat/cmo
	head = 			/obj/item/clothing/head/beret/ncr
	glasses = 		/obj/item/clothing/glasses/hud/health
	suit_store =    /obj/item/healthanalyzer
	belt =          /obj/item/storage/belt/medical
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mm=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/storage/pill_bottle/mining, \
		/obj/item/storage/firstaid/regular,  \
		/obj/item/storage/bag/money/small/ncrofficers,  \
		)
	box = null

//sergeant


/datum/job/ncr/f13sergeant
	title = "NCR Sergeant"
	flag = F13SERGEANT
	total_positions = 2
	spawn_positions = 2
	faction = "NCR"
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are the direct superior to the enlisted troops, working with the chain of command you echo the orders of your superiors and ensure that the Enlisted follow them to the letter. Additionally you are responsible for the well being of the troops and their ongoing training with the NCR."
	supervisors = "Lieutenants and above"
	selection_color = "#fff5cc"
	exp_requirements = 600

	outfit = /datum/outfit/job/ncr/f13sergeant

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
	id = 			/obj/item/card/id/ncrsergeant
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/SGT
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/f13/ncr
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun
	backpack_contents = list(
		/obj/item/storage/box/lethalshot, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/storage/bag/money/small/ncrofficers)
	box = null



/*
Quartermaster
*/
/datum/job/ncr/f13quartermaster
	title = "NCR Quartermaster"
	flag = F13QUARTERMASTER
	faction= "NCR"
	total_positions = 1
	spawn_positions = 1
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	description = "You are in charge of requisitions and organizing the armory for the NCR camp. You answer directly to the Lieutenant and Captain, while also organizing grunts to assist you as needed."
	supervisors = "Lieutenants and above"
	selection_color = "fff5cc"
	exp_requirements = 1200

	outfit = /datum/outfit/job/ncr/f13quartermaster

/datum/outfit/job/ncr/f13quartermaster
	name = "NCR Quartermaster"
	jobtype = /datum/job/ncr/f13quartermaster
	id = 			/obj/item/card/id/ncrquartermaster
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/ssgt
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/f13/ncr
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store  = /obj/item/gun/ballistic/automatic/marksman
	backpack_contents = list(
		/obj/item/ammo_box/magazine/r20=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1,  \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/storage/bag/money/small/ncrofficers)
	box = null

/*
Engineer
*/
/datum/job/ncr/f13engineer
	title = "NCR Engineer"
	flag = F13ENGINEER
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are in charge of fortifying and building for NCR strategic locations throughout the region. You answer directly to the Lieutenant and Captain, while also organizing grunts to assist you as needed."
	supervisors = "Lieutenants and above"
	selection_color = "#fff5cc"
	exp_requirements = 600

	outfit = /datum/outfit/job/ncr/f13engineer

/datum/outfit/job/ncr/f13engineer
	name = "NCR Engineer"
	jobtype = /datum/job/ncr/f13engineer
	uniform =  		/obj/item/clothing/under/f13/ncr
	id = 			/obj/item/card/id/ncrsergeant
	accessory =     /obj/item/clothing/accessory/ncr/SGT
	suit =          /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/hardhat/orange
	glasses = 		/obj/item/clothing/glasses/welding
	belt =          /obj/item/storage/belt/utility/full/engi
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mm=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/stack/sheet/metal/ten,  \
		/obj/item/storage/bag/money/small/ncrofficers,  \
		/obj/item/stack/sheet/mineral/wood/twenty,  \
		/obj/item/storage/box/emptysandbags,  \
		)
	box = null

/*
Trooper
*/
/datum/job/ncr/f13trooper
	title = "NCR Trooper"
	flag = F13TROOPER
	faction = "NCR"
	total_positions = 8
	spawn_positions = 8
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer to your Sergeant and follow the chain of command, to your commanding officer, the Captain."
	supervisors = "Sergeants and above"
	selection_color = "#fff5cc"
	exp_requirements = 180

	outfit = /datum/outfit/job/ncr/f13trooper

/datum/outfit/job/ncr/f13trooper
	name = "NCR Trooper"
	jobtype = /datum/job/ncr/f13trooper
	id = 			/obj/item/card/id/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/TPR
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	head = 			/obj/item/clothing/head/f13/ncr
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman/servicerifle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/r20=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/storage/bag/money/small/ncrenlisted)
	box = null

/*
Recruit
*/
/datum/job/ncr/f13recruit
	title = "NCR Recruit"
	flag = F13RECRUIT
	faction = "NCR"
	total_positions = 10
	spawn_positions = 10
	forbids = "The NCR forbids: Drugs (xcept for med-X) Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer to your Sergeant and other Troopers,  following the chain of command, to your commanding officer, the Captain."
	supervisors = "Sergeants and above"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/ncr/f13recruit

/datum/outfit/job/ncr/f13recruit
	name = "NCR Recruit"
	jobtype = /datum/job/ncr/f13recruit
	id = 			/obj/item/card/id/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/REC
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	head = 			/obj/item/clothing/head/f13/ncr
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington
	backpack_contents = list(
		/obj/item/ammo_box/a762=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/storage/bag/money/small/ncrenlisted)
	box = null

/*
Heavy Trooper
*/
/datum/job/ncr/f13heavytroop
	title = "NCR Heavy Trooper"
	flag = F13HEAVYTROOP
	total_positions = 2
	spawn_positions = 2
	faction = "NCR"
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are an elite, heavy trooper with the NCR that has years of experience and training under their belt. You are also equivalent to a Sergeant, and as such, can organize lower troops as you see fit to assist in NCR interests and goals throughout the region."
	supervisors = "Lieutenants and above"
	selection_color = "#fff5cc"
	exp_requirements = 1500

	outfit = /datum/outfit/job/ncr/f13heavytroop

/datum/outfit/job/ncr/f13heavytroop
	name = "NCR Heavy Trooper"
	jobtype = /datum/job/ncr/f13heavytroop
	id = 			/obj/item/card/id/ncrsergeant
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/SGT
	suit = 			/obj/item/clothing/suit/armor/f13/brokenpa/t45b
	head = 			/obj/item/clothing/head/helmet/f13/brokenpa/t45b
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	shoes =         /obj/item/clothing/shoes/combat/swat
	suit_store = 	/obj/item/gun/ballistic/shotgun/riot
	backpack_contents = list(
		/obj/item/storage/box/lethalshot, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/storage/bag/money/small/ncrofficers)
	box = null

/*
Veteran Ranger
*/
/datum/job/ncr/f13vetranger
	title = "NCR Veteran Ranger"
	flag = F13VETRANGER
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	forbids = "The NCR forbids: Drugs (xcept for med-X) Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer directly to the Captain, working either independently or in a team to complete your mission objectives however required, operating either alone, in a squad or with the NCR Army. As a Veteran Ranger you work closely with the Captain in planning special operations with your team while also carrying out those orders in the field by any means necessary."
	supervisors = "Lieutenants and above"
	selection_color = "#ffeeaa"
	exp_requirements = 1500

	outfit = /datum/outfit/job/ncr/f13vetranger


/datum/job/ncr/f13vetranger/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/datum/outfit/job/ncr/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype = /datum/job/ncr/f13vetranger
	id = 			/obj/item/card/id/ncrranger
	uniform =  		/obj/item/clothing/under/f13/vetranger
	suit = 			/obj/item/clothing/suit/armor/f13/rangercombat
	belt =			/obj/item/storage/belt/military/ncr
	head = 			/obj/item/clothing/head/helmet/f13/ncr/rangercombat
	gloves =		/obj/item/clothing/gloves/rifleman
	shoes =			/obj/item/clothing/shoes/laced
	suit_store = 	/obj/item/gun/ballistic/shotgun/antimateriel
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/sequoia=1, \
		/obj/item/ammo_box/c4570=2, \
		/obj/item/ammo_box/a50MG=2, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrofficers)

/*
Ranger
*/
/datum/job/ncr/f13ranger
	title = "NCR Patrol Ranger"
	flag = F13RANGER
	faction = "NCR"
	total_positions = 2
	spawn_positions = 2
	forbids = "The NCR forbids: Drugs (xcept for med-X) Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer directly to the Veteran Ranger and Captain, working either independently with other Rangers or Infantry to complete your mission objectives however required, working either alone, in a squad or with the Army. As a Ranger, you seize, destroy, capture, exploit, or recover designated targets on behalf of the NCR."
	supervisors = "Veteran Ranger"
	selection_color = "#fff5cc"
	exp_requirements = 720

	outfit = /datum/outfit/job/ncr/f13ranger


/datum/job/ncr/f13ranger/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/datum/outfit/job/ncr/f13ranger
	name = "NCR Ranger"
	jobtype = /datum/job/ncr/f13ranger
	id = 			/obj/item/card/id/ncrranger
	uniform =  		/obj/item/clothing/under/f13/patrolranger
	suit = 			/obj/item/clothing/suit/armor/f13/combat/ncr
	belt =			/obj/item/storage/belt/military/ncr
	head = 			/obj/item/clothing/head/f13/ranger
	gloves =		/obj/item/clothing/gloves/patrol
	shoes =			/obj/item/clothing/shoes/laced
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/hunting
	backpack_contents = list(
		/obj/item/ammo_box/a762/doublestacked = 3, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrenlisted)
	r_pocket = /obj/item/binocs

/*
Recon Ranger
*/
/datum/job/ncr/f13recranger
	title = "NCR Recon Ranger"
	flag = F13RECRANGER
	faction = "NCR"
	total_positions = 3
	spawn_positions = 3
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer directly to the Captain, working either independently with other Rangers or Infantry to complete your mission objectives however required, working either alone, in a squad or with the Army. As a Recon Ranger, you perform reconnaissance, seize or destroy assets and capture, exploit, or recover designated targets on behalf of the NCR."
	supervisors = "Veteran Ranger"
	selection_color = "#fff5cc"
	exp_requirements = 420

	outfit = /datum/outfit/job/ncr/f13recranger


/datum/job/ncr/f13recranger/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/datum/outfit/job/ncr/f13recranger
	name = "NCR Recon Ranger"
	jobtype = /datum/job/ncr/f13recranger
	id = 			/obj/item/card/id/ncrranger
	uniform =  		/obj/item/clothing/under/f13/ranger
	suit = 			/obj/item/clothing/suit/toggle/armor/f13/rangerrecon
	belt =			/obj/item/storage/belt/military/reconbandolier
	head = 			/obj/item/clothing/head/f13/ranger
	shoes = 		/obj/item/clothing/shoes/laced
	glasses = 		/obj/item/clothing/glasses/sunglasses
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington/scoped
	backpack_contents = list(
		/obj/item/ammo_box/a308 = 4, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrenlisted)
	box = null
