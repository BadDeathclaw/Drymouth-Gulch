//Fallout 13 - supporters deserve a reward!

var/const/MESSIAH			=(1<<50)
var/const/SLIMEMAN			=(1<<51)
//SourcePony
/datum/job/messiah
	title = "Messiah"
	flag = MESSIAH
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Wasteland"
	status = "Messiah"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffddf0"
	minimal_player_age = 7
	donaters = 1
	outfit = /datum/outfit/job/messiah

	access = list()
	minimal_access = list()

/datum/outfit/job/messiah
	name = "Messiah"
	id = null
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/cowboyb
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	head = /obj/item/clothing/head/helmet/f13/rangercombat
	glasses = /obj/item/clothing/glasses/night
	suit_store = /obj/item/weapon/gun/projectile/automatic/assault_rifle
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 2, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1)
	mask = /obj/item/clothing/mask/gas/sechailer
	ears = /obj/item/device/radio/headset

//SourcePony
/datum/job/slimeman
	title = "Slime Dude"
	flag = MESSIAH
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Wasteland"
	status = "Wastelander"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffddf0"
	minimal_player_age = 7
	donaters = 1
	outfit = /datum/outfit/job/slimeman

	access = list()
	minimal_access = list()

/datum/outfit/job/slimeman
	name = "Slime Dude"
	id = null
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/sneakers/black
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	head = /obj/item/clothing/head/helmet/f13/rangercombat
	glasses = /obj/item/clothing/glasses/night
	suit_store = /obj/item/weapon/gun/projectile/automatic/assault_rifle
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 2, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1)
	mask = /obj/item/clothing/mask/gas/sechailer
	ears = /obj/item/device/radio/headset