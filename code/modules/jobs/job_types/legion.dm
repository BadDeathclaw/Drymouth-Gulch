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

	outfit = /datum/outfit/job/f13legate

	access = list()
	minimal_access = list()

/datum/outfit/job/f13legate
	name = "Legate"
	jobtype = /datum/job/f13legate


	id = null
	ears = null
	belt = null

	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionlegat
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/leglegat
	head = 			/obj/item/clothing/head/helmet/f13/legion/leglegat
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	mask = 			/obj/item/clothing/mask/facewrap/red
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=2, \
		/obj/item/throwing_star/spear
		/obj/item/melee/powerfist=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/magazine/r20=2, \
		/obj/item/flashlight/flare/torch=1)


/*
Centurion
*/
/datum/job/f13centurion
	title = "Centurion"
	flag = F13CENTURION
	department_flag = LEGION
	head_announce = list("Security")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Legate"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	minimal_player_age = 6

	outfit = /datum/outfit/job/f13centurion

/datum/outfit/job/f13centurion
	name = "Centurion"
	jobtype = /datum/job/f13centurion

	id = null
	ears = null
	belt = null

	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legcenturion
	head = 			/obj/item/clothing/head/helmet/f13/legion/legcenturion
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	mask = 			/obj/item/clothing/mask/facewrap/red
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear
		/obj/item/melee/powerfist=1, \
		/obj/item/book/granter/martial/cqc=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/magazine/r20=2, \
		/obj/item/flashlight/flare/torch=1)

/*
Vexillarius
*/
/datum/job/f13vexillarius
	title = "Vexillarius"
	flag = F13VEXILLARIUS
	department_flag = LEGION
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the centurion"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13vexillarius

/datum/outfit/job/f13vexillarius
	name = "Vexillarius"
	jobtype = /datum/job/f13vexillarius

	id = null
	ears = null
	belt = null

	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legvexil
	head = 			/obj/item/clothing/head/helmet/f13/legion/legvexil
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	mask = 			/obj/item/clothing/mask/facewrap/red
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman
	r_hand = 		/obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, \
		/obj/item/throwing_star/spear
		/obj/item/throwing_star/spear
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/magazine/r20=1, \
		/obj/item/flashlight/flare/torch=1)

/*
Decan
*/
/datum/job/f13decan
	title = "Decanus"
	flag = F13DECAN
	department_flag = LEGION
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "vexillarius troops"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13decan

/datum/outfit/job/f13decan
	name = "Decanus"
	jobtype = /datum/job/f13decan

	id = null
	ears = null
	belt = null

	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionleather
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit
	head = 			/obj/item/clothing/head/helmet/f13/legion/legdecan
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	mask = 			/obj/item/clothing/mask/facewrap/red
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic
	r_hand = 		/obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/magazine/d12g=2, \
		/obj/item/flashlight/flare/torch=1)

/*
Veteran
*/
/datum/job/f13vetlegion
	title = "Veteran Legionnaire"
	flag = F13VETLEGION
	department_flag = LEGION
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "decanus troops"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13vetlegion

/datum/outfit/job/f13vetlegion
	name = "Veteran Legionnaire"
	jobtype = /datum/job/f13vetlegion

	id = null
	ears = null
	belt = null

	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit/vet
	head = 			/obj/item/clothing/head/helmet/f13/legion/legveteran
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	mask = 			/obj/item/clothing/mask/facewrap/red
	suit_store = 	/obj/item/gun/ballistic/shotgun
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear
		/obj/item/claymore/machete=1, \
		/obj/item/storage/box/lethalshot=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/flashlight/flare/torch=1)

/*
Legionary
*/
/datum/job/f13legionary
	title = "Legionary"
	flag = F13LEGIONARY
	department_flag = LEGION
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "decanus troops"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13legionary

/datum/outfit/job/f13legionary
	name = "Legionary"
	jobtype = /datum/job/f13legionary

	id = null
	ears = null
	belt = null

	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionleather
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit
	head = 			/obj/item/clothing/head/helmet/f13/legion/legrecruit
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	mask = 			/obj/item/clothing/mask/facewrap/red
	suit_store = 	/obj/item/gun/ballistic/revolver/m29
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/m44=2, \
		/obj/item/flashlight/flare/torch=1)