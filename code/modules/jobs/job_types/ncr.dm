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
	name = "NCR Colonel"
	jobtype = /datum/job/ncr/f13colonel


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
	supervisors = "the colonel"
	req_admin_notify = 1
	exp_requirements = 1560

	outfit = /datum/outfit/job/ncr/f13captain

/datum/outfit/job/ncr/f13captain
	name = "NCR Lieutenant"
	jobtype = /datum/job/ncr/f13captain
	uniform =  		/obj/item/clothing/under/f13/ncr/officer
	accessory =       /obj/item/clothing/accessory/ncr/CPT
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/beret/ncr
	gloves =		/obj/item/clothing/gloves/combat
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/automatic/pistol/m1911
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
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
	supervisors = "the captain"
	selection_color = "#fff5cc"
	exp_requirements = 1200

	outfit = /datum/outfit/job/ncr/f13lieutenant

/datum/outfit/job/ncr/f13lieutenant
	name = "NCR Lieutenant"
	jobtype = /datum/job/ncr/f13lieutenant
	uniform =  		/obj/item/clothing/under/f13/ncr/officer
	accessory =     /obj/item/clothing/accessory/ncr/LT
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/beret/ncr
	gloves =		/obj/item/clothing/gloves/combat
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/hunting
	backpack_contents = list(
		/obj/item/ammo_box/a762/doublestacked=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrofficers)
	box = null

/*
qm Sergeant
*/
/datum/job/ncr/f13qmsergeant
	title = "NCR Quartermaster Sergeant"
	flag = F13QMSERGEANT
	total_positions = 1
	spawn_positions = 1
	faction = "NCR"
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are the direct superior to any and all enlisted troops, you are incharge of the armory, and all the contents inside, make sure they are distributed and taken care of."
	supervisors = "the lieutenant"
	selection_color = "#fff5cc"
	exp_requirements = 800

	outfit = /datum/outfit/job/ncr/f13sergeant

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Quartermaster Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/SSGT
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

//sergeant


/datum/job/ncr/f13sergeant
	title = "NCR Quartermaster Sergeant"
	flag = F13QMSERGEANT
	total_positions = 1
	spawn_positions = 1
	faction = "NCR"
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are the direct superior to any and all enlisted troops, you are incharge of the armory, and all the contents inside, make sure they are distributed and taken care of."
	supervisors = "the lieutenant"
	selection_color = "#fff5cc"
	exp_requirements = 800

	outfit = /datum/outfit/job/ncr/f13sergeant

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/SSGT
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
	supervisors = "the lieutenant"
	selection_color = "#fff5cc"
	exp_requirements = 600

	outfit = /datum/outfit/job/ncr/f13sergeant

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
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
	supervisors = "sergeants"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/ncr/f13trooper

/datum/outfit/job/ncr/f13trooper
	name = "NCR Trooper"
	jobtype = /datum/job/ncr/f13trooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/TPR
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	head = 			/obj/item/clothing/head/f13/ncr
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman/servicerifle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/r20=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
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
	total_positions = 12
	spawn_positions = 12
	forbids = "The NCR forbids: Drugs (xcept for med-X) Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer to your Sergeant and other Troopers,  following the chain of command, to your commanding officer, the Captain."
	supervisors = "sergeants"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/ncr/f13recruit

/datum/outfit/job/ncr/f13recruit
	name = "NCR Recruit"
	jobtype = /datum/job/ncr/f13recruit
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/REC
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	head = 			/obj/item/clothing/head/f13/ncr
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington
	backpack_contents = list(
		/obj/item/ammo_box/a762=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
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
	total_positions = 1
	spawn_positions = 1
	forbids = "The NCR forbids: Drugs (xcept for med-X) Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer directly to the Captain, working either independently or in a team to complete your mission objectives however required, operating either alone, in a squad or with the NCR Army. As a Veteran Ranger you work closely with the Captain in planning special operations with your team while also carrying out those orders in the field by any means necessary."
	supervisors = "the lieutenant"
	selection_color = "#ffeeaa"
	exp_requirements = 1500

	outfit = /datum/outfit/job/ncr/f13vetranger

/datum/outfit/job/ncr/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype = /datum/job/ncr/f13vetranger
	uniform =  		/obj/item/clothing/under/f13/cowboyb
	suit = 			/obj/item/clothing/suit/armor/f13/rangercombat
	head = 			/obj/item/clothing/head/helmet/f13/ncr/rangercombat
	gloves =		/obj/item/clothing/gloves/fingerless
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington/scoped
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/sequoia=1, \
		/obj/item/ammo_box/magazine/internal/cylinder/rev4570=2, \
		/obj/item/ammo_box/a762/doublestacked=2, \
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
	supervisors = "the veteran ranger"
	selection_color = "#fff5cc"
	exp_requirements = 720

	outfit = /datum/outfit/job/ncr/f13ranger

/datum/outfit/job/ncr/f13ranger
	name = "NCR Ranger"
	jobtype = /datum/job/ncr/f13ranger
	uniform =  		/obj/item/clothing/under/f13/ranger
	suit = 			/obj/item/clothing/suit/armor/f13/combat/ncr
	head = 			/obj/item/clothing/head/f13/ranger
	gloves =	/obj/item/clothing/gloves/fingerless
	shoes = 		/obj/item/clothing/shoes/workboots
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/hunting
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29=1, \
		/obj/item/ammo_box/a762/doublestacked=2, \
		/obj/item/ammo_box/magazine/internal/cylinder/rev44=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrenlisted)
	box = null

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
	supervisors = "the veteran ranger"
	selection_color = "#fff5cc"
	exp_requirements = 420

	outfit = /datum/outfit/job/ncr/f13recranger

/datum/outfit/job/ncr/f13recranger
	name = "NCR Recon Ranger"
	jobtype = /datum/job/ncr/f13recranger
	uniform =  		/obj/item/clothing/under/f13/ranger
	suit = 			/obj/item/clothing/suit/f13/duster
	head = 			/obj/item/clothing/head/fluff/cowboy
	gloves =		/obj/item/clothing/gloves/botanic_leather
	shoes = 		/obj/item/clothing/shoes/workboots
	glasses = 		/obj/item/clothing/glasses/sunglasses
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington/scoped
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29=1, \
		/obj/item/ammo_box/a762=2, \
		/obj/item/ammo_box/magazine/internal/cylinder/rev44=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrenlisted)
	box = null
