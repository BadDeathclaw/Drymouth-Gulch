/datum/job/ncr //do NOT use this for anything, it's just to store faction datums
	department_flag = NCR
	selection_color = "#ffeeaa"
	exp_type = EXP_TYPE_NCR
	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_NCR)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_NCR)
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, raiders (anywhere, being one is a crime), allying with factions you are at war with (such as the Legion or Brotherhood of Steel), and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."

/datum/outfit/job/ncr/
	name = "NCRdatums"
	jobtype = /datum/job/ncr/
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	ears = 			/obj/item/radio/headset/headset_ncr
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr
	gloves =        /obj/item/clothing/gloves/f13/ncr

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
	belt        = /obj/item/storage/belt/military/assault/ncr
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	suit_store  = /obj/item/gun/ballistic/automatic/marksman
	shoes       = /obj/item/clothing/shoes/f13/military/ncr_officer
	gloves      = /obj/item/clothing/gloves/f13/leather/ncr_officer
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45=3, \
		/obj/item/ammo_box/magazine/m556/rifle=2, \
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
	description = "You are the commanding officer of your company and direct superior to the Veteran Ranger and Lieutenant, coordinating with your staff you must ensure that the objectives of central command are completed to the letter. Working closely with them on logistics, mission planning and special operations with the Rangers, you are here to establish a strong foothold for the NCR within the region."
	supervisors = "Colonel"
	req_admin_notify = 1
	exp_requirements = 900
	exp_type = EXP_TYPE_NCRCOMMAND

	outfit = /datum/outfit/job/ncr/f13captain

/datum/outfit/job/ncr/f13captain
	name = "NCR Captain"
	jobtype 	= /datum/job/ncr/f13captain
	id 			= /obj/item/card/id/dogtag/ncrcaptain
	uniform		= /obj/item/clothing/under/f13/ncr/officer
	accessory 	= /obj/item/clothing/accessory/ncr/CPT
	suit 		= /obj/item/clothing/suit/armor/f13/ncrarmor/captain
	head 		= /obj/item/clothing/head/beret/ncr
	belt        = /obj/item/storage/belt/military/assault/ncr
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	suit_store 	= /obj/item/gun/ballistic/automatic/pistol/deagle
	shoes       = /obj/item/clothing/shoes/f13/military/ncr_officer
	gloves      = /obj/item/clothing/gloves/f13/leather/ncr_officer
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m50=3, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/twohanded/binocs=1, \
		/obj/item/storage/bag/money/small/ncr, \
		/obj/item/clothing/mask/ncr_facewrap)
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
	description = "You are the direct superior to the Sergeant and Enlisted, working with the Captain and under special circumstances, Rangers. You plan patrols, training and missions, working in some cases with Rangers in accomplishing objectives otherwise beyond the capabilities of ordinary enlisted personnel."
	supervisors = "Captain and above"
	selection_color = "#fff5cc"
	exp_requirements = 2100

	outfit = /datum/outfit/job/ncr/f13lieutenant

/datum/outfit/job/ncr/f13lieutenant
	name		= "NCR Lieutenant"
	jobtype		= /datum/job/ncr/f13lieutenant
	id			= /obj/item/card/id/dogtag/ncrlieutenant
	uniform		= /obj/item/clothing/under/f13/ncr/officer
	accessory	= /obj/item/clothing/accessory/ncr/LT
	suit 		= /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	head 		= /obj/item/clothing/head/beret/ncr
	belt        = /obj/item/storage/belt/military/assault/ncr
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	suit_store 	= /obj/item/gun/ballistic/automatic/marksman/servicerifle/r82
	shoes       = /obj/item/clothing/shoes/f13/military/ncr_officer
	gloves      = /obj/item/clothing/gloves/f13/leather/ncr_officer
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=2, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/m1911=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/ammo_box/magazine/m45=2, \
		/obj/item/twohanded/binocs=1, \
		/obj/item/storage/bag/money/small/ncrofficers, \
		/obj/item/clothing/mask/ncr_facewrap)
	box = null
/*
Sergeant
*/
/datum/job/ncr/f13sergeant
	title = "NCR Sergeant"
	flag = F13SERGEANT
	total_positions = 2
	spawn_positions = 2
	faction = "NCR"
	description = "You are the direct superior to the enlisted troops, working with the chain of command you echo the orders of your superiors and ensure that the Enlisted follow them to the letter. Additionally you are responsible for the well being of the troops and their ongoing training with the NCR."
	supervisors = "Lieutenants and above"
	selection_color = "#fff5cc"
	exp_requirements = 1200

	outfit = /datum/outfit/job/ncr/f13sergeant
	
	loadout_options = list(
	/datum/outfit/loadout/rifle,
	/datum/outfit/loadout/leader)

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
	id = 			/obj/item/card/id/dogtag/ncrsergeant
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/SGT
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	belt =          /obj/item/storage/belt/military/assault/ncr
	suit_store = 	null
	head =          /obj/item/clothing/head/f13/ncr
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr
	gloves =        /obj/item/clothing/gloves/f13/ncr
	backpack_contents = list(
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/storage/bag/money/small/ncrofficers, \
		/obj/item/clothing/mask/ncr_facewrap)
	box = null
	
/datum/outfit/loadout/rifle
	name = "Rifleman"
	suit_store = /obj/item/gun/ballistic/automatic/marksman/servicerifle/r82
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1,
		/obj/item/ammo_box/magazine/m9mm=2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1)

/datum/outfit/loadout/leader
	name = "Patrol Leader"
	suit_store = /obj/item/gun/ballistic/shotgun/trench
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911=1,
		/obj/item/ammo_box/magazine/m45=2,
		/obj/item/storage/box/lethalshot=1,
		/obj/item/twohanded/binocs=1)
		
/*
Corporal
*/
/datum/job/ncr/f13corporal
	title = "NCR Corporal"
	flag = F13CORPORAL
	faction = "NCR"
	total_positions = 4
	spawn_positions = 4
	description = "You answer to your Sergeant and follow the chain of command, to your commanding officer, the Captain."
	supervisors = "Sergeants and above"
	selection_color = "#fff5cc"
	exp_requirements = 600

	outfit = /datum/outfit/job/ncr/f13corporal

	loadout_options = list(
	/datum/outfit/loadout/corporal,
	/datum/outfit/loadout/medic,
	/datum/outfit/loadout/marksman)

/datum/outfit/job/ncr/f13corporal
	name = "NCR Corporal"
	jobtype = /datum/job/ncr/f13corporal
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/CPL
	suit = 			null
	head = 			null
	glasses = 		null
	belt =          /obj/item/storage/belt/military/NCR_Bandolier
	suit_store = 	null
	backpack_contents = list(
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/storage/bag/money/small/ncrenlisted, \
		/obj/item/clothing/mask/ncr_facewrap)
	box = null

/datum/outfit/loadout/corporal
	name = "Corporal"
	suit_store = /obj/item/gun/ballistic/automatic/marksman/servicerifle
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	head = /obj/item/clothing/head/f13/ncr/goggles
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=3,
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1)

/datum/outfit/loadout/medic
	name = "Medic"
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ninemil
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/labcoat
	head = /obj/item/clothing/head/f13/ncr/medic
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mm=2,
		/obj/item/storage/firstaid/regular=1,
		/obj/item/storage/pill_bottle/mining=1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super=1
		/obj/item/book/granter/trait/chemistry=1)

/datum/outfit/loadout/marksman
	name = "Marksman"
	suit_store = /obj/item/gun/ballistic/shotgun/remington/scoped
	head = /obj/item/clothing/head/beret/ncr_scout
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/scout
	backpack_contents = list(
		/obj/item/ammo_box/a308=3)
/*
Trooper
*/
/datum/job/ncr/f13trooper
	title = "NCR Trooper"
	flag = F13TROOPER
	faction = "NCR"
	total_positions = 6
	spawn_positions = 6
	description =  "You answer to the Sergeants or Corporals,  following the chain of command, to your commanding officer, the Captain."
	supervisors = "Corporals and above"
	selection_color = "#fff5cc"
	exp_requirements = 300

	outfit = /datum/outfit/job/ncr/f13trooper

	loadout_options = list(
	/datum/outfit/loadout/trooper,
	/datum/outfit/loadout/hunting)

/datum/outfit/job/ncr/f13trooper
	name = "NCR Trooper"
	jobtype = /datum/job/ncr/f13trooper
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/TPR
	ears = null
	head = 			/obj/item/clothing/head/f13/ncr/goggles
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	belt =          /obj/item/storage/belt/military/NCR_Bandolier
	glasses = 		null
	suit_store = 	null
	backpack_contents = list(
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/storage/bag/money/small/ncrenlisted, \
		/obj/item/clothing/mask/ncr_facewrap)
	box = null

/datum/outfit/loadout/trooper
	name = "Service Rifle"
	suit_store = /obj/item/gun/ballistic/automatic/marksman/servicerifle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=2)

/datum/outfit/loadout/hunting
	name = ".308 Rifle"
	suit_store = /obj/item/gun/ballistic/shotgun/remington
	backpack_contents = list(
		/obj/item/ammo_box/a308=2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1)

/*
Recruit
*/
/datum/job/ncr/f13recruit
	title = "NCR Recruit"
	flag = F13RECRUIT
	faction = "NCR"
	total_positions = 6
	spawn_positions = 6
	description = "You answer to the Sergeants or Corporals,  following the chain of command, to your commanding officer, the Captain."
	supervisors = "Corporals and above"
	selection_color = "#fff5cc"
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/ncr/f13recruit

/datum/outfit/job/ncr/f13recruit
	name = "NCR Recruit"
	jobtype = /datum/job/ncr/f13recruit
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/REC
	ears = null
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	gloves = null
	head = 			/obj/item/clothing/head/f13/ncr
	glasses = 		null
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman/servicerifle/varmint
	belt =          /obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/small=2, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/storage/bag/money/small/ncrenlisted)
	box = null

/*
Veteran Ranger
*/
/datum/job/ncr/f13vetranger
	title = "NCR Veteran Ranger"
	flag = F13VETRANGER
	faction = "NCR"
	total_positions = 0
	spawn_positions = 0
	description = "You answer directly to the Captain, working either independently or in a team to complete your mission objectives however required, operating either alone, in a squad or with the NCR Army. As a Veteran Ranger you work closely with the Captain in planning special operations with your team while also carrying out those orders in the field by any means necessary."
	supervisors = "Lieutenants and above"
	selection_color = "#ffeeaa"
	exp_requirements = 1500
	exp_type = EXP_TYPE_RANGER

	outfit = /datum/outfit/job/ncr/f13vetranger


/datum/job/ncr/f13vetranger/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/datum/outfit/job/ncr/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype = /datum/job/ncr/f13vetranger
	id = 			/obj/item/card/id/dogtag/ncrranger
	uniform =  		/obj/item/clothing/under/f13/vetranger
	suit = 			/obj/item/clothing/suit/armor/f13/rangercombat
	belt =			/obj/item/storage/belt/military/assault/ncr
	head = 			/obj/item/clothing/head/helmet/f13/ncr/rangercombat
	gloves =		/obj/item/clothing/gloves/rifleman
	shoes =			/obj/item/clothing/shoes/laced
	suit_store = 	/obj/item/gun/ballistic/shotgun/antimateriel
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/sequoia=1, \
		/obj/item/ammo_box/c4570=2, \
		/obj/item/ammo_box/a50MG=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrofficers)

/*
Ranger
*/
/datum/job/ncr/f13ranger
	title = "NCR Patrol Ranger"
	flag = F13RANGER
	faction = "NCR"
	total_positions = 0
	spawn_positions = 0
	description = "You answer directly to the Veteran Ranger and Captain, working either independently with other Rangers or Infantry to complete your mission objectives however required, working either alone, in a squad or with the Army. As a Ranger, you seize, destroy, capture, exploit, or recover designated targets on behalf of the NCR."
	supervisors = "Veteran Ranger"
	selection_color = "#fff5cc"
	exp_requirements = 720
	exp_type = EXP_TYPE_NCRCOMMAND

	outfit = /datum/outfit/job/ncr/f13ranger


/datum/job/ncr/f13ranger/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/datum/outfit/job/ncr/f13ranger
	name = "NCR Ranger"
	jobtype = /datum/job/ncr/f13ranger
	id = 			/obj/item/card/id/dogtag/ncrranger
	uniform =  		/obj/item/clothing/under/f13/patrolranger
	suit = 			/obj/item/clothing/suit/armor/f13/combat/ncr
	belt =			/obj/item/storage/belt/military/assault/ncr
	head = 			/obj/item/clothing/head/f13/ranger
	gloves =		/obj/item/clothing/gloves/patrol
	shoes =			/obj/item/clothing/shoes/laced
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/hunting/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44=3, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrenlisted)
	r_pocket = /obj/item/twohanded/binocs

/*
Recon Ranger
*/
/datum/job/ncr/f13recranger
	title = "NCR Recon Ranger"
	flag = F13RECRANGER
	faction = "NCR"
	total_positions = 0
	spawn_positions = 0
	description = "You answer directly to the Captain, working either independently with other Rangers or Infantry to complete your mission objectives however required, working either alone, in a squad or with the Army. As a Recon Ranger, you perform reconnaissance, seize or destroy assets and capture, exploit, or recover designated targets on behalf of the NCR."
	supervisors = "Veteran Ranger"
	selection_color = "#fff5cc"
	exp_requirements = 720
	exp_type = EXP_TYPE_NCRCOMMAND

	outfit = /datum/outfit/job/ncr/f13recranger


/datum/job/ncr/f13recranger/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/datum/outfit/job/ncr/f13recranger
	name = "NCR Recon Ranger"
	jobtype = /datum/job/ncr/f13recranger
	id = 			/obj/item/card/id/dogtag/ncrranger
	uniform =  		/obj/item/clothing/under/f13/ranger
	suit = 			/obj/item/clothing/suit/toggle/armor/f13/rangerrecon
	belt =			/obj/item/storage/belt/military/reconbandolier
	head = 			/obj/item/clothing/head/f13/ranger
	shoes = 		/obj/item/clothing/shoes/laced
	gloves = null
	glasses = 		/obj/item/clothing/glasses/sunglasses
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/hunting/cowboy/scoped
	backpack_contents = list(
		/obj/item/ammo_box/tube/a357=3, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrenlisted)
	box = null
	/*
	*/

