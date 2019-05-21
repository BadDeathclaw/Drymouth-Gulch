//Fallout 13 Raider faction roles

/datum/job/gangleader
	title = "Gang Leader"
	desc = "A criminal mastermind.<br>If someone goes against you, you either make an offer they can't refuse, or make sure no one will find the body later."
	flag = GANGLEAD
	department_flag = MEDSCI
	faction = "raiders"
	status = "gangleader"
	total_positions = 1
	spawn_positions = 1
	supervisors = "nobody"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/gangleader
	whitelist_on = 1

	allowed_packs = list("starter", "cigarettes", "team_fortress", "vault13", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom")

	required_items = list(
	/obj/item/clothing/shoes/f13/military,
	/obj/item/clothing/shoes/f13/brownie,
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/glasses/f13/biker,
	/obj/item/clothing/under/suit_jacket,
	/obj/item/clothing/suit/armor/f13/chestplate,
	/obj/item/clothing/suit/armor/f13/metalarmor,
	/obj/item/clothing/suit/armor/f13/tribal,
	/obj/item/clothing/suit/armor/f13/slam,
	/obj/item/clothing/suit/armor/f13/supafly,
	/obj/item/clothing/suit/armor/f13/yankee,
	/obj/item/clothing/head/helmet/f13/broken,
	/obj/item/clothing/head/helmet/f13/motorcycle,
	/obj/item/clothing/head/helmet/f13/firefighter,
	/obj/item/clothing/head/helmet/f13/supaflyhelmet,
	/obj/item/clothing/head/helmet/f13/yankee,
	/obj/item/clothing/head/helmet/knight/f13/metal,
	/obj/item/clothing/head/helmet/knight/f13/rider,
	/obj/item/clothing/head/welding/f13/fire,
	/obj/item/clothing/head/welding/f13/japan,
	/obj/item/clothing/glasses/eyepatch,
	/obj/item/weapon/golf9,
	/obj/item/weapon/harpoon,
	/obj/item/weapon/twohanded/sledgehammer,
	/obj/item/weapon/twohanded/largehammer,
	/obj/item/weapon/powergauntlet,
	/obj/item/weapon/restraints/legcuffs/bola/raider,
	/obj/item/weapon/lighter/gold,
	/obj/item/weapon/lighter/detonator
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin
	)

/datum/outfit/job/gangleader
	name = "Gang Leader"
	uniform = /obj/item/clothing/under/f13/villain
	shoes = /obj/item/clothing/shoes/laceup

//Basic Raider

/datum/job/raider
	title = "Raider"
	desc = "A bloodthirsty savage.<br>You have broken every rule but the most important one - the Gang Leader is your supreme commander, the powerful Godfather of all bandits, the only one you trust with your life."
	flag = RAIDER
	department_head = list("gangleader")
	department_flag = WASTELAND
	faction = "raiders"
	status = "raider"
	total_positions = -1
	spawn_positions = -1 //does not matter for late join
	supervisors = "the Gang Leader"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/raider

	allowed_packs = list("starter", "cigarettes", "team_fortress", "vault13", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom")

	required_items = list(
	/obj/item/clothing/glasses/f13/biker,
	/obj/item/clothing/suit/armor/f13/chestplate,
	/obj/item/clothing/suit/armor/f13/tribal,
	/obj/item/clothing/suit/armor/f13/slam,
	/obj/item/clothing/suit/armor/f13/yankee,
	/obj/item/clothing/head/helmet/f13/broken,
	/obj/item/clothing/head/helmet/f13/motorcycle,
	/obj/item/clothing/head/helmet/f13/firefighter,
	/obj/item/clothing/head/helmet/f13/yankee,
	/obj/item/clothing/glasses/eyepatch,
	/obj/item/weapon/golf9,
	/obj/item/weapon/harpoon,
	/obj/item/weapon/twohanded/sledgehammer,
	/obj/item/weapon/restraints/legcuffs/bola/raider,
	/obj/item/weapon/lighter/detonator
	)

	denied_items = list(
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/under/f13/worn
	)

/datum/outfit/job/raider
	name = "Raider"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/rag
	shoes = /obj/item/clothing/shoes/f13/rag
	suit = /obj/item/clothing/suit/armor/f13/supafly
	head = /obj/item/clothing/head/helmet/f13/supaflyhelmet

