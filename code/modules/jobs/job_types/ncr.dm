/datum/job/ncr //do NOT use this for anything, it's just to store faction datums
	department_flag = NCR
	selection_color = "#ffeeaa"
	exp_type = EXP_TYPE_NCR
	total_positions = 0
	spawn_positions = 0
	faction = "NCR"
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
	head_announce = list("Security")
	supervisors = "the general"
	req_admin_notify = 1
	exp_requirements = 2700

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
	total_positions = 1
	spawn_positions = 1
	supervisors = "the colonel"
	req_admin_notify = 1
	exp_requirements = 1560

	outfit = /datum/outfit/job/ncr/f13captain

/datum/outfit/job/ncr/f13captain
	name = "NCR Captain"
	jobtype = /datum/job/ncr/f13captain
	uniform =  		/obj/item/clothing/under/f13/ncr/officer
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
	supervisors = "the captain"
	selection_color = "#fff5cc"
	exp_requirements = 1200

	outfit = /datum/outfit/job/ncr/f13lieutenant

/datum/outfit/job/ncr/f13lieutenant
	name = "NCR Lieutenant"
	jobtype = /datum/job/ncr/f13lieutenant
	uniform =  		/obj/item/clothing/under/f13/ncr/officer
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
		/obj/item/stack/f13Cash/random/ncr/ncrpay_officer)
	box = null

/*
Sergeant
*/
/datum/job/ncr/f13sergeant
	title = "NCR Sergeant"
	flag = F13SERGEANT
	total_positions = 2
	spawn_positions = 2
	supervisors = "the lieutenant"
	selection_color = "#fff5cc"
	exp_requirements = 600

	outfit = /datum/outfit/job/ncr/f13sergeant

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
	uniform =  		/obj/item/clothing/under/f13/ncr
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
		/obj/item/stack/f13Cash/random/ncr/ncrpay_officer)
	box = null

/*
Trooper
*/
/datum/job/ncr/f13trooper
	title = "NCR Trooper"
	flag = F13TROOPER
	total_positions = 8
	spawn_positions = 8
	supervisors = "sergeants"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/ncr/f13trooper

/datum/outfit/job/ncr/f13trooper
	name = "NCR Trooper"
	jobtype = /datum/job/ncr/f13trooper
	uniform =  		/obj/item/clothing/under/f13/ncr
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
		/obj/item/stack/f13Cash/random/ncr/ncrpay_basic)
	box = null

/*
Recruit
*/
/datum/job/ncr/f13recruit
	title = "NCR Recruit"
	flag = F13RECRUIT
	total_positions = 12
	spawn_positions = 12
	supervisors = "sergeants"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/ncr/f13recruit

/datum/outfit/job/ncr/f13recruit
	name = "NCR Recruit"
	jobtype = /datum/job/ncr/f13recruit
	uniform =  		/obj/item/clothing/under/f13/ncr
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
		/obj/item/stack/f13Cash/random/ncr/ncrpay_basic)
	box = null

/*
Veteran Ranger
*/
/datum/job/ncr/f13vetranger
	title = "NCR Veteran Ranger"
	flag = F13VETRANGER
	total_positions = 1
	spawn_positions = 1
	supervisors = "the lieutenant"
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
		/obj/item/stack/f13Cash/random/ncr/ncrpay_veteran)

/*
Ranger
*/
/datum/job/ncr/f13ranger
	title = "NCR Patrol Ranger"
	flag = F13RANGER
	total_positions = 2
	spawn_positions = 2
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
/datum/job/ncr/f13recranger
	title = "NCR Recon Ranger"
	flag = F13RECRANGER
	total_positions = 3
	spawn_positions = 3
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
		/obj/item/stack/f13Cash/random/ncr/ncrpay_veteran)
	box = null
