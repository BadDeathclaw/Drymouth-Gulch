/*
Colonel
*/
/datum/job/f13colonel
	title = "NCR Colonel"
	flag = F13COLONEL
	department_flag = NCR
	head_announce = list("Security")
	total_positions = 0
	spawn_positions = 0
	supervisors = "the general"
	selection_color = "#ffeeaa"
	req_admin_notify = 1
	exp_requirements = 2700
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/f13colonel

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/f13colonel
	name = "NCR Colonel"
	jobtype = /datum/job/f13colonel

/*
Captain
*/
/datum/job/f13captain
	title = "NCR Captain"
	flag = F13CAPTAIN
	department_flag = NCR
	head_announce = list("Security")
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are the commanding officer of your company and direct superior to the Veteran Ranger and Lieutenant, coordinating with your staff you must ensure that the objectives of central command are completed to the letter. Working closely with them on logistics, mission planning and special operations with the Rangers, you are here to establish a strong foothold for the NCR within the region."
	supervisors = "the colonel"
	selection_color = "#ffeeaa"
	req_admin_notify = 1
	exp_requirements = 1560
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/f13captain

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/f13captain
	name = "NCR Captain"
	jobtype = /datum/job/f13captain
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/heads/ncr
	uniform =  		/obj/item/clothing/under/f13/ncr/officer
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/beret/ncr
	belt = 			/obj/item/storage/belt/military/ncr
	gloves =		/obj/item/clothing/gloves/combat
	shoes = 		/obj/item/clothing/shoes/jackboots
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
/datum/job/f13lieutenant
	title = "NCR Lieutenant"
	flag = F13LIEUTENANT
	department_flag = NCR
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are the direct superior to the Sergeant and Enlisted, working with the Captain and under special circumstances, Rangers. You plan patrols, training and missions, working in some cases with Rangers in accomplishing objectives otherwise beyond the capabilities of ordinary enlisted personnel."
	supervisors = "the captain"
	selection_color = "#fff5cc"
	exp_requirements = 1200
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/f13lieutenant

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/f13lieutenant
	name = "NCR Lieutenant"
	jobtype = /datum/job/f13lieutenant
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/heads/ncr
	uniform =  		/obj/item/clothing/under/f13/ncr/officer
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/beret/ncr
	belt = 			/obj/item/storage/belt/military/ncr
	shoes = 		/obj/item/clothing/shoes/jackboots
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
Sergeant
*/
/datum/job/f13sergeant
	title = "NCR Sergeant"
	flag = F13SERGEANT
	department_flag = NCR
	faction = "NCR"
	total_positions = 2
	spawn_positions = 2
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You are the direct superior to the enlisted troops, working with the chain of command you echo the orders of your superiors and ensure that the Enlisted follow them to the letter. Additionally you are responsible for the well being of the troops and their ongoing training with the NCR."
	supervisors = "the lieutenant"
	selection_color = "#fff5cc"
	exp_requirements = 600
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/f13sergeant

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/f13sergeant
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ncr
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/f13/ncr
	belt = 			/obj/item/storage/belt/military/ncr
	shoes = 		/obj/item/clothing/shoes/jackboots
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
/datum/job/f13trooper
	title = "NCR Trooper"
	flag = F13TROOPER
	department_flag = NCR
	faction = "NCR"
	total_positions = 8
	spawn_positions = 8
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer to your Sergeant and follow the chain of command, to your commanding officer, the Captain."
	supervisors = "sergeants"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/f13trooper

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/f13trooper
	name = "NCR Trooper"
	jobtype = /datum/job/f13trooper
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ncr
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	head = 			/obj/item/clothing/head/f13/ncr
	belt = 			/obj/item/storage/belt/military/ncr
	shoes = 		/obj/item/clothing/shoes/jackboots
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
/datum/job/f13recruit
	title = "NCR Recruit"
	flag = F13RECRUIT
	department_flag = NCR
	faction = "NCR"
	total_positions = 12
	spawn_positions = 12
	forbids = "The NCR forbids: Drugs (xcept for med-X) Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer to your Sergeant and other Troopers,  following the chain of command, to your commanding officer, the Captain."
	supervisors = "sergeants"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/f13recruit

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/f13recruit
	name = "NCR Recruit"
	jobtype = /datum/job/f13recruit
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ncr
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	head = 			/obj/item/clothing/head/f13/ncr
	belt = 			/obj/item/storage/belt/military/ncr
	shoes = 		/obj/item/clothing/shoes/jackboots
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
/datum/job/f13vetranger
	title = "NCR Veteran Ranger"
	flag = F13VETRANGER
	department_flag = NCR
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	forbids = "The NCR forbids: Drugs (xcept for med-X) Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer directly to the Captain, working either independently or in a team to complete your mission objectives however required, operating either alone, in a squad or with the NCR Army. As a Veteran Ranger you work closely with the Captain in planning special operations with your team while also carrying out those orders in the field by any means necessary."
	supervisors = "the lieutenant"
	selection_color = "#ffeeaa"
	exp_requirements = 1500
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/f13vetranger

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype = /datum/job/f13vetranger
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/heads/ncr
	uniform =  		/obj/item/clothing/under/f13/cowboyb
	suit = 			/obj/item/clothing/suit/armor/f13/rangercombat
	head = 			/obj/item/clothing/head/helmet/f13/ncr/rangercombat
	gloves =		/obj/item/clothing/gloves/fingerless
	belt = 			/obj/item/storage/belt/military/ncr
	shoes = 		/obj/item/clothing/shoes/jackboots
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
/datum/job/f13ranger
	title = "NCR Patrol Ranger"
	flag = F13RANGER
	department_flag = NCR
	faction = "NCR"
	total_positions = 2
	spawn_positions = 2
	forbids = "The NCR forbids: Drugs (xcept for med-X) Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer directly to the Veteran Ranger and Captain, working either independently with other Rangers or Infantry to complete your mission objectives however required, working either alone, in a squad or with the Army. As a Ranger, you seize, destroy, capture, exploit, or recover designated targets on behalf of the NCR."
	supervisors = "the veteran ranger"
	selection_color = "#fff5cc"
	exp_requirements = 720
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/f13ranger

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/f13ranger
	name = "NCR Ranger"
	jobtype = /datum/job/f13ranger
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ranger
	suit = 			/obj/item/clothing/suit/armor/f13/combat/ncr
	head = 			/obj/item/clothing/head/f13/ranger
	gloves =	/obj/item/clothing/gloves/fingerless
	belt = 			/obj/item/storage/belt/military/ncr
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
/datum/job/f13recranger
	title = "NCR Recon Ranger"
	flag = F13RECRANGER
	department_flag = NCR
	faction = "NCR"
	total_positions = 3
	spawn_positions = 3
	forbids = "The NCR forbids: Drugs (except for med-X), Drinking, Gambling, and sex on duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform."
	description = "You answer directly to the Captain, working either independently with other Rangers or Infantry to complete your mission objectives however required, working either alone, in a squad or with the Army. As a Recon Ranger, you perform reconnaissance, seize or destroy assets and capture, exploit, or recover designated targets on behalf of the NCR."
	supervisors = "the veteran ranger"
	selection_color = "#fff5cc"
	exp_requirements = 420
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/f13recranger

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/f13recranger
	name = "NCR Recon Ranger"
	jobtype = /datum/job/f13recranger
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ranger
	suit = 			/obj/item/clothing/suit/f13/duster
	head = 			/obj/item/clothing/head/fluff/cowboy
	gloves =		/obj/item/clothing/gloves/botanic_leather
	belt = 			/obj/item/storage/belt/military/ncr
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
