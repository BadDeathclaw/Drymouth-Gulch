/*
Legat

Needs whitelist
*/
/datum/job/f13legate
	title = "Legate"
	flag = F13LEGATE
	department_flag = LEGION
	head_announce = list("Security")
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	exp_requirements = 2700
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13legate

	access = list()
	minimal_access = list()

/datum/outfit/job/f13legate
	name = "Legate"
	jobtype = /datum/job/f13legate


	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionlegat
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/leglegat
	head = 			/obj/item/clothing/head/helmet/f13/legion/leglegat
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=2, \
		/obj/item/throwing_star/spear, \
		/obj/item/melee/powerfist=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/magazine/r20=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/storage/bag/money/small/legion)
	box = null

/*
Centurion
*/
/datum/job/f13centurion
	title = "Centurion"
	flag = F13CENTURION
	department_flag = LEGION
	head_announce = list("Security")
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Legate"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	exp_requirements = 2160
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13centurion

/datum/outfit/job/f13centurion
	name = "Centurion"
	jobtype = /datum/job/f13centurion

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legcenturion
	head = 			/obj/item/clothing/head/helmet/f13/legion/legcenturion
	mask =			/obj/item/clothing/mask/bandana/legcenturion
	r_hand =		/obj/item/melee/powerfist
	l_hand =		/obj/item/tank/internals/oxygen
	suit_store =	/obj/item/gun/ballistic/automatic/smg10mm
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/book/granter/martial/cqc=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/magazine/m10mm_auto=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/storage/bag/money/small/legion)
	box = null

/datum/outfit/job/f13centurion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/*
Veteran Decan
*/
/datum/job/f13vetdecan
	title = "Veteran Decanus"
	flag = F13VETDECAN
	department_flag = LEGION
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the centurion"
	selection_color = "#ffeeee"
	exp_requirements = 1500
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13vetdecan

/datum/outfit/job/f13vetdecan
	name = "Veteran Decanus"
	jobtype = /datum/job/f13vetdecan

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit/vet
	head = 			/obj/item/clothing/head/helmet/f13/legion/legdecan/vet
	mask =			/obj/item/clothing/mask/bandana/legdecan
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/revolver/m29/alt
	r_hand = 		/obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/m44=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_officer)
	box = null

/datum/outfit/job/f13vetdecan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/*
Vexillarius
*/
/datum/job/f13vexillarius
	title = "Vexillarius"
	flag = F13VEXILLARIUS
	department_flag = LEGION
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	supervisors = "veteran decanus"
	selection_color = "#ffeeee"
	exp_requirements = 1200
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13vexillarius

/datum/outfit/job/f13vexillarius
	name = "Vexillarius"
	jobtype = /datum/job/f13vexillarius

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legvexil
	head = 			/obj/item/clothing/head/helmet/f13/legion/legvexil
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/storage/box/lethalshot, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_officer)
	box = null

/datum/outfit/job/f13vexillarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/*
Decan
*/
/datum/job/f13decan
	title = "Decanus"
	flag = F13DECAN
	department_flag = LEGION
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	supervisors = "veteran decanus"
	selection_color = "#ffeeee"
	exp_requirements = 960
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13decan

/datum/outfit/job/f13decan
	name = "Decanus"
	jobtype = /datum/job/f13decan

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionleather
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit
	head = 			/obj/item/clothing/head/helmet/f13/legion/legdecan
	mask =			/obj/item/clothing/mask/bandana/legdecan
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/revolver/m29/alt
	r_hand = 		/obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/m44=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_officer)
	box = null

/datum/outfit/job/f13decan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/*
Veteran
*/
/datum/job/f13vetlegion
	title = "Veteran Legionnaire"
	flag = F13VETLEGION
	department_flag = LEGION
	faction = "Legion"
	total_positions = 8
	spawn_positions = 8
	supervisors = "decanus troops"
	selection_color = "#ffeeee"
	exp_requirements = 300
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13vetlegion

/datum/outfit/job/f13vetlegion
	name = "Veteran Legionnaire"
	jobtype = /datum/job/f13vetlegion

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit/vet
	head = 			/obj/item/clothing/head/helmet/f13/legion/legveteran
	mask =			/obj/item/clothing/mask/bandana/legvet
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/revolver/m29
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/throwing_star/spear, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/claymore/machete=1, \
		/obj/item/ammo_box/m44=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_veteran)
	box = null

/datum/outfit/job/f13vetlegion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/*
Legionary
*/
/datum/job/f13legionary
	title = "Legionary"
	flag = F13LEGIONARY
	department_flag = LEGION
	faction = "Legion"
	total_positions = 15
	spawn_positions = 15
	supervisors = "decanus troops"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13legionary

/datum/outfit/job/f13legionary
	name = "Legionary"
	jobtype = /datum/job/f13legionary

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionleather
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit
	head = 			/obj/item/clothing/head/helmet/f13/legion/legrecruit
	mask =			/obj/item/clothing/mask/bandana/legrecruit
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/throwing_star/spear, \
		/obj/item/throwing_star/spear, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_basic)
	box = null

/datum/outfit/job/f13legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/datum/job/f13explorer
	title = "Explorer"
	flag = F13EXPLORER
	department_flag = LEGION
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	supervisors = "decanus troops"
	selection_color = "#ffeeee"
	exp_requirements = 600
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13explorer

/datum/outfit/job/f13explorer
	name = "Explorer"
	jobtype = /datum/job/f13explorer

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit/vet
	head = 			/obj/item/clothing/head/helmet/f13/legion/explorer
	glasses = null
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/hunting
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/claymore/machete=1, \
		/obj/item/ammo_box/a762/doublestacked=2, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_veteran)
	box = null
	r_pocket = /obj/item/binocs

/datum/outfit/job/f13explorer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/datum/job/f13scout
	title = "Scout"
	flag = F13SCOUT
	department_flag = LEGION
	faction = "Legion"
	total_positions = 4
	spawn_positions = 4
	supervisors = "explorer troops"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13scout

/datum/outfit/job/f13scout
	name = "Scout"
	jobtype = /datum/job/f13scout

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionleather
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit
	head = 			/obj/item/clothing/head/helmet/f13/legion/scout
	glasses = null
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington/scoped
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/a762=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_basic)
	box = null

/datum/outfit/job/f13scout/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/datum/job/f13campfollower
	title = "Camp Follower"
	flag = F13CAMPFOLLOWER
	department_flag = LEGION
	faction = "Legion"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the entire legion"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13campfollower

/datum/outfit/job/f13campfollower
	name = "Camp Follower"
	jobtype = /datum/outfit/job/f13campfollower

	id = null
	ears = null
	belt = null
	shoes = /obj/item/clothing/shoes/sandal
	box = null

/datum/outfit/job/f13campfollower/pre_equip(mob/living/carbon/human/H)
	..()
	var/follower_job = "nothing"
	if (H.gender == MALE)
		uniform = pick(
			/obj/item/clothing/under/f13/caravan, \
			/obj/item/clothing/under/f13/brahminm)
		follower_job = pick("miner", "farmer", "smith", "healer", "nothing")
	else
		uniform = pick(
			/obj/item/clothing/under/f13/caravan, \
			/obj/item/clothing/under/f13/brahminf)
		follower_job = pick("cook", "farmer", "healer", "caretaker", "nothing")

	if (follower_job == "cook")
		belt = /obj/item/kitchen/knife
		if (prob(50))
			suit = /obj/item/clothing/suit/apron/chef
	else if (follower_job == "miner")
		belt = /obj/item/storage/bag/ore
		backpack = /obj/item/pickaxe
		if (prob(50))
			suit = /obj/item/clothing/suit/fluff/vest
	else if (follower_job == "farmer")
		belt = /obj/item/storage/bag/plants
		if (prob(50))
			suit = /obj/item/clothing/suit/fluff/vest
	else if (follower_job == "smith")
		backpack = /obj/item/storage/backpack/satchel/explorer
		backpack_contents = list(/obj/item/screwdriver, /obj/item/wrench, /obj/item/crowbar, /obj/item/wirecutters)
		if (prob(50))
			suit = /obj/item/clothing/suit/fluff/vest
	else if (follower_job == "healer")
		backpack = /obj/item/storage/backpack/satchel/explorer
		backpack_contents = list(/obj/item/reagent_containers/pill/patch/healingpowder=4, /obj/item/stack/medical/gauze/improvised = 2)
		if (prob(50))
			suit = /obj/item/clothing/suit/apron/surgical
	else if (follower_job == "caretaker")
		backpack = /obj/item/storage/backpack/satchel/explorer
		backpack_contents = list(/obj/item/soap/homemade, /obj/item/melee/flyswatter, /obj/item/reagent_containers/glass/rag, /obj/item/reagent_containers/glass/bucket, /obj/item/stack/medical/gauze/improvised)

	r_pocket = /obj/item/flashlight/flare/torch
