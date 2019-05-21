//Fallout 13 Legion faction directory

/datum/job/legate
	title = "Legate"
	desc = "Caesar's will is the will of the Legion.<br>The Legate is the hand of Caesar!<br>Veni, vidi, vici!"
	flag = LEGLEGAT
	department_head = list("Caesar")
	department_flag = WASTELAND
	faction = "legion"
	status = "legate"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Caesar"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	whitelist_on = 1

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	required_items = list(
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/device/radio,
	/obj/item/weapon/lighter/gold,
	/obj/item/weapon/reagent_containers/pill/patch/stimpak,
	/obj/item/weapon/reagent_containers/pill/patch/supstimpak
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/leglegate

	access = list()
	minimal_access = list()

/datum/outfit/job/leglegate
	name = "Legate"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionlegate
	gloves = /obj/item/clothing/gloves/f13/legionlegate
	suit = /obj/item/clothing/suit/armor/f13/leglegate
	head = /obj/item/clothing/head/helmet/f13/leglegate
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	weapon = /obj/item/weapon/gun/ballistic/automatic/rifle

//Legion Centurion

/datum/job/centurion
	title = "Centurion"
	desc = "We are the Legion - one is many.<br>The Centurion is a guardian of Caesar!<br>Ab uno disce omnes!"
	flag = LEGCENTURION
	department_head = list("legate")
	department_flag = WASTELAND
	faction = "legion"
	status = "centurion"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Legate"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	required_items = list(
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/device/radio,
	/obj/item/weapon/lighter/engraved,
	/obj/item/weapon/reagent_containers/pill/patch/stimpak
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/legcenturion

	access = list()
	minimal_access = list()

/datum/outfit/job/legcenturion
	name = "Centurion"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionmetal
	gloves = /obj/item/clothing/gloves/f13/leather
	suit = /obj/item/clothing/suit/armor/f13/legcenturion
	head = /obj/item/clothing/head/helmet/f13/legcenturion
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle/scope

//Legion Vexillarius

/datum/job/vex
	title = "Vexillarius"
	desc = "Mortal actions never deceive the gods.<br>The Vexillarius is an ambassador of Caesar!<br>Acta deos numquam mortalia fallunt!"
	flag = LEGVEX
	department_head = list("legate", "centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "vexillarius"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Legate"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	required_items = list(
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/device/radio,
	/obj/item/weapon/lighter/engraved,
	/obj/item/weapon/reagent_containers/pill/patch/stimpak
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/legvex

	access = list()
	minimal_access = list()

/datum/outfit/job/legvex
	name = "Vexillarius"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionmetal
	gloves = /obj/item/clothing/gloves/f13/leather
	suit = /obj/item/clothing/suit/armor/f13/legvexil
	head = /obj/item/clothing/head/helmet/f13/legvexil
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle/scope

//Legion Decanus

/datum/job/decan
	title = "Decanus"
	desc = "Boldness is our wall, action is our shield.<br>The Decanus is a weapon of Caesar!<br>Audacia pro muro et scuto opus!"
	flag = LEGDECAN
	department_head = list("legate", "centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "decanus"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Centurion"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	required_items = list(
	/obj/item/clothing/head/helmet/f13/legdecan/alt,
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/device/radio,
	/obj/item/weapon/reagent_containers/pill/patch/healingpowder
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/legdecan

	access = list()
	minimal_access = list()

/datum/outfit/job/legdecan
	name = "Decanus"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionleather
	gloves = /obj/item/clothing/gloves/f13/leather
	suit = /obj/item/clothing/suit/armor/f13/legrecruit
	head = /obj/item/clothing/head/helmet/f13/legdecan
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	mask = /obj/item/clothing/mask/bandana/f13/legdecan
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle

//Legion Prime

/datum/job/prime
	title = "Prime"
	desc = "Victory favors bravery.<br>The Prime is a servant of Caesar!<br>Ad victoriam!"
	flag = PRIME
	department_head = list("Centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "prime"
	total_positions = 20
	spawn_positions = 20
	supervisors = "the Centurion"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	required_items = list(
	/obj/item/weapon/machete,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/spear,
	/obj/item/weapon/harpoon,
	/obj/item/weapon/reagent_containers/pill/patch/healingpowder
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/prime

	access = list()
	minimal_access = list()

/datum/outfit/job/prime
	name = "Prime"
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/military/legionleather
	gloves = /obj/item/clothing/gloves/f13/leather
	suit = /obj/item/clothing/suit/armor/f13/legrecruit
	head = /obj/item/clothing/head/helmet/f13/legrecruit
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	mask = /obj/item/clothing/mask/bandana/f13/legrecruit
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/weapon/storage/wallet=1,/obj/item/weapon/reagent_containers/pill/patch/healingpowder)
