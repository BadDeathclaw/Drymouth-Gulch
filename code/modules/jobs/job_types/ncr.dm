/*
Colonel
*/
/datum/job/NewCaliforniaRepublic/f13colonel
	title = "NCR Colonel"
	flag = F13COLONEL
	department_flag = NCR
	head_announce = list("Security")
	total_positions = 0
	spawn_positions = 0
	supervisors = "the general"
	selection_color = "#ffeeaa"
	req_admin_notify = 1
	exp_requirements = 45
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/NewCaliforniaRepublic/f13colonel

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/NewCaliforniaRepublic/f13colonel
	name = "NCR Colonel"
	jobtype = /datum/job/NewCaliforniaRepublic/f13colonel

/*
Captain
*/
/datum/job/NewCaliforniaRepublic/f13captain
	title = "NCR Captain"
	flag = F13CAPTAIN
	department_flag = NCR
	head_announce = list("Security")
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the colonel"
	selection_color = "#ffeeaa"
	req_admin_notify = 1
	minimal_player_age = 6
	exp_requirements = 30
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/NewCaliforniaRepublic/f13captain

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/NewCaliforniaRepublic/f13captain
	name = "NCR Captain"
	jobtype = /datum/job/NewCaliforniaRepublic/f13captain
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ncr/officer
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/beret/ncr
	belt = 			/obj/item/storage/belt/military/assault
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
/datum/job/NewCaliforniaRepublic/f13lieutenant
	title = "NCR Lieutenant"
	flag = F13LIEUTENANT
	department_flag = NCR
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#fff5cc"
	exp_requirements = 20
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/NewCaliforniaRepublic/f13lieutenant

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/NewCaliforniaRepublic/f13lieutenant
	name = "NCR Lieutenant"
	jobtype = /datum/job/NewCaliforniaRepublic/f13lieutenant
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ncr/officer
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/beret/ncr
	belt = 			/obj/item/storage/belt/military/assault
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
		/obj/item/stack/f13Cash/random/ncr/ncrpay_officer)
	box = null

/*
Sergeant
*/
/datum/job/NewCaliforniaRepublic/f13sergeant
	title = "NCR Sergeant"
	flag = F13SERGEANT
	department_flag = NCR
	faction = "NCR"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the lieutenant"
	selection_color = "#fff5cc"
	exp_requirements = 5
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/NewCaliforniaRepublic/f13sergeant

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/NewCaliforniaRepublic/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/NewCaliforniaRepublic/f13sergeant
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ncr
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = 			/obj/item/clothing/head/f13/ncr
	belt = 			/obj/item/storage/belt/military/assault
	shoes = 		/obj/item/clothing/shoes/jackboots
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/combat
	backpack_contents = list(
		/obj/item/storage/box/lethalshot, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/stack/f13Cash/random/ncr/ncrpay_officer)
	box = null

/*
Trooper
*/
/datum/job/NewCaliforniaRepublic/f13trooper
	title = "NCR Trooper"
	flag = F13TROOPER
	department_flag = NCR
	faction = "NCR"
	total_positions = -1
	spawn_positions = -1
	supervisors = "sergeants"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/NewCaliforniaRepublic/f13trooper

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/NewCaliforniaRepublic/f13trooper
	name = "NCR Trooper"
	jobtype = /datum/job/NewCaliforniaRepublic/f13trooper
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ncr
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	head = 			/obj/item/clothing/head/f13/ncr
	belt = 			/obj/item/storage/belt/military/assault
	shoes = 		/obj/item/clothing/shoes/jackboots
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman/servicerifle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/r20=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/stack/f13Cash/random/ncr/ncrpay_basic)
	box = null

/*
Recruit
*/
/datum/job/NewCaliforniaRepublic/f13recruit
	title = "NCR Recruit"
	flag = F13RECRUIT
	department_flag = NCR
	faction = "NCR"
	total_positions = -1
	spawn_positions = -1
	supervisors = "sergeants"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/NewCaliforniaRepublic/f13recruit

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/NewCaliforniaRepublic/f13recruit
	name = "NCR Recruit"
	jobtype = /datum/job/NewCaliforniaRepublic/f13recruit
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ncr
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	head = 			/obj/item/clothing/head/f13/ncr
	belt = 			/obj/item/storage/belt/military/assault
	shoes = 		/obj/item/clothing/shoes/jackboots
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington
	backpack_contents = list(
		/obj/item/ammo_box/a762=3, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/stack/f13Cash/random/ncr/ncrpay_basic)
	box = null

/*
Veteran Ranger
*/
/datum/job/NewCaliforniaRepublic/f13vetranger
	title = "NCR Veteran Ranger"
	flag = F13VETRANGER
	department_flag = NCR
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the lieutenant"
	selection_color = "#ffeeaa"
	minimal_player_age = 2
	exp_requirements = 25
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/NewCaliforniaRepublic/f13vetranger

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/NewCaliforniaRepublic/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype = /datum/job/NewCaliforniaRepublic/f13vetranger
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/cowboyb
	suit = 			/obj/item/clothing/suit/armor/f13/rangercombat
	head = 			/obj/item/clothing/head/helmet/f13/ncr/rangercombat
	gloves =		/obj/item/clothing/gloves/fingerless
	belt = 			/obj/item/storage/belt/military/assault
	shoes = 		/obj/item/clothing/shoes/jackboots
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington/scoped
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/sequoia=1, \
		/obj/item/ammo_box/magazine/internal/cylinder/rev4570=2, \
		/obj/item/ammo_box/magazine/r20=1, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/f13Cash/random/ncr/ncrpay_veteran)

/*
Ranger
*/
/datum/job/NewCaliforniaRepublic/f13ranger
	title = "NCR Patrol Ranger"
	flag = F13RANGER
	department_flag = NCR
	faction = "NCR"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the veteran ranger"
	selection_color = "#fff5cc"
	exp_requirements = 12
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/NewCaliforniaRepublic/f13ranger

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/NewCaliforniaRepublic/f13ranger
	name = "NCR Ranger"
	jobtype = /datum/job/NewCaliforniaRepublic/f13ranger
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ranger
	suit = 			/obj/item/clothing/suit/armor/f13/combat/ncr
	head = 			/obj/item/clothing/head/f13/ranger
	gloves =	/obj/item/clothing/gloves/fingerless
	belt = 			/obj/item/storage/belt/military/assault
	shoes = 		/obj/item/clothing/shoes/workboots
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington/scoped
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29=1, \
		/obj/item/ammo_box/a762/doublestacked=2, \
		/obj/item/ammo_box/magazine/internal/cylinder/rev44=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/f13Cash/random/ncr/ncrpay_basic)
	box = null

/*
Recon Ranger
*/
/datum/job/NewCaliforniaRepublic/f13recranger
	title = "NCR Recon Ranger"
	flag = F13RECRANGER
	department_flag = NCR
	faction = "NCR"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the veteran ranger"
	selection_color = "#fff5cc"
	exp_requirements = 7
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/NewCaliforniaRepublic/f13recranger

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

/datum/outfit/job/NewCaliforniaRepublic/f13recranger
	name = "NCR Recon Ranger"
	jobtype = /datum/job/NewCaliforniaRepublic/f13recranger
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_ncr
	uniform =  		/obj/item/clothing/under/f13/ranger
	suit = 			/obj/item/clothing/suit/f13/duster
	head = 			/obj/item/clothing/head/fluff/cowboy
	gloves =		/obj/item/clothing/gloves/botanic_leather
	belt = 			/obj/item/storage/belt/military/assault
	shoes = 		/obj/item/clothing/shoes/workboots
	glasses = 		/obj/item/clothing/glasses/sunglasses
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington/scoped
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29=1, \
		/obj/item/ammo_box/a762=2, \
		/obj/item/ammo_box/magazine/internal/cylinder/rev44=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/f13Cash/random/ncr/ncrpay_veteran)
	box = null
