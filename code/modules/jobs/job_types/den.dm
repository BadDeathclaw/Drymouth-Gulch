/*
Sheriff
*/
/datum/job/f13sheriff
	title = "Sheriff"
	flag = F13SHERIFF
	department_flag = DEN
	head_announce = list("Security")
	faction = "Den"
	total_positions = 1
	spawn_positions = 1
	supervisors = "no one"
	selection_color = "#d7b088"
	exp_requirements = 10
	exp_type = EXP_TYPE_DEN

	outfit = /datum/outfit/job/f13sheriff

/datum/outfit/job/f13sheriff
	name = "Sheriff"
	jobtype = /datum/job/f13sheriff

	id = /obj/item/card/id/sheriff
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

	ears = 			/obj/item/radio/headset/headset_den
	uniform =  		/obj/item/clothing/under/f13/cowboyb
	shoes = 		/obj/item/clothing/shoes/workboots
	suit = 			/obj/item/clothing/suit/det_suit
	head = 			/obj/item/clothing/head/fluff/cowboy
	glasses =		/obj/item/clothing/glasses/sunglasses
	l_hand = 		/obj/item/gun/ballistic/shotgun
	l_pocket =		/obj/item/storage/bag/money/small/den
	backpack_contents = list(/obj/item/storage/box/deputy_badges=1)


	//pick("grey", "white", "yellow", "purple", "brown", "whatever")
	//var/item1_type = pick( /obj/item/stack/spacecash/c10, /obj/item/stack/spacecash/c100, /obj/item/stack/spacecash/c1000, /obj/item/stack/spacecash/c20, /obj/item/stack/spacecash/c200, /obj/item/stack/spacecash/c50, /obj/item/stack/spacecash/c500)

	/datum/outfit/job/f13sheriff/pre_equip(mob/living/carbon/human/H)
		..()
		r_pocket = pick(/obj/item/flashlight/flare/torch, /obj/item/flashlight/flare)
		suit_store = pick(/obj/item/gun/ballistic/automatic/pistol/m1911, /obj/item/gun/ballistic/revolver/m29, /obj/item/gun/ballistic/revolver/colt6250)
/*
Settler
*/

/datum/job/f13settler
	title = "Settler"
	flag = F13SETTLER
	department_flag = DEN
	faction = "Den"
	total_positions = -1
	spawn_positions = -1
	supervisors = "the sheriff"
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/f13settler

/datum/outfit/job/f13settler
	name = "Settler"
	jobtype = /datum/job/f13settler

	ears = 			/obj/item/radio/headset/headset_den
	id = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler

/datum/outfit/job/f13settler/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	r_pocket = pick(
		/obj/item/flashlight/flare/torch, \
		/obj/item/flashlight/flare)