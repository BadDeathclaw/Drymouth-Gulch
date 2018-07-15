/*
Cult Leader
*/
/datum/job/f13cultleader
	title = "Cult Leader"
	flag = F13CULTLEADER
	department_flag = WASTELAND
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "your God"
	selection_color = "#ffddf0"

	outfit = /datum/outfit/job/f13cultleader

/datum/outfit/job/f13cultleader
	name = "Cult Leader"
	jobtype = /datum/job/f13cultleader

	id = 			/obj/item/card/id/gold
	uniform =  		/obj/item/clothing/under/rank/captain


/*
Wastelander
*/

/datum/job/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	department_flag = WASTELAND
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/f13wastelander

/datum/outfit/job/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/f13wastelander

	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null

/datum/outfit/job/f13wastelander/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	l_pocket = 		/obj/item/reagent_containers/food/drinks/flask
	r_pocket = pick(
		/obj/item/flashlight/flare/torch, \
		/obj/item/flashlight/flare)
	belt = 			/obj/item/kitchen/knife/combat/survival
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=3, \
		/obj/item/reagent_containers/blood/radaway=2, \
		/obj/item/reagent_containers/food/drinks/flask)



/*
Raider
*/

/datum/job/f13raider
	title = "Raider"
	flag = F13RAIDER
	department_head = list("Captain")
	department_flag = WASTELAND
	head_announce = list("Security")
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/f13raider

	access = list()
	minimal_access = list()

/datum/outfit/job/f13raider
	name = "Raider"
	jobtype = /datum/job/f13raider

	id = null
	ears = null
	belt = null

/datum/outfit/job/f13raider/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/merca, \
		/obj/item/clothing/under/f13/mercc, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/cowboyb, \
		/obj/item/clothing/under/f13/cowboyg, \
		/obj/item/clothing/under/f13/caravaneer, \
		/obj/item/clothing/under/f13/khan, \
		/obj/item/clothing/under/f13/ranger, \
		/obj/item/clothing/under/f13/roving, \
		/obj/item/clothing/under/f13/doctorm, \
		/obj/item/clothing/under/roman)
	suit = pick(
		/obj/item/clothing/head/helmet/f13/raider,\
		/obj/item/clothing/suit/fluff/cowboybvest,\
		/obj/item/clothing/suit/fluff/cowboygvest,\
		/obj/item/clothing/suit/fluff/battlecruiser,\
		/obj/item/clothing/suit/fluff/vest,\
		/obj/item/clothing/suit/armor/fluff/chestplate,\
		/obj/item/clothing/suit/f13/veteran,\
		/obj/item/clothing/suit/f13/duster,\
		/obj/item/clothing/suit/f13/autumn,\
		/obj/item/clothing/suit/poncho,\
		/obj/item/clothing/suit/poncho/green,\
		/obj/item/clothing/suit/poncho/ponchoshame,\
		/obj/item/clothing/suit/poncho/red,\
		/obj/item/clothing/suit/det_suit/grey,\
		/obj/item/clothing/suit/det_suit,\
		/obj/item/clothing/suit/chickensuit,\
		/obj/item/clothing/suit/bomb_suit,\
		/obj/item/clothing/suit/bio_suit/security,\
		/obj/item/clothing/suit/apron/chef,\
		/obj/item/clothing/suit/apron/overalls,\
		/obj/item/clothing/suit/straight_jacket,\
		/obj/item/clothing/suit/toggle/labcoat/mad,\
		/obj/item/clothing/suit/pirate,\
		/obj/item/clothing/suit/cardborg,\
		/obj/item/clothing/suit/armor/f13/bmetalarmor,\
		/obj/item/clothing/suit/armor/f13/raider/yankee, \
		/obj/item/clothing/suit/armor/f13/raider/sadist, \
		/obj/item/clothing/suit/armor/f13/raider/blastmaster)
	head = pick(/obj/item/clothing/head/helmet/f13/raider,\
		/obj/item/clothing/head/helmet/f13/eyebot,\
		/obj/item/clothing/head/helmet/f13/brokenpa/t45d,\
		/obj/item/clothing/head/chicken,\
		/obj/item/clothing/head/hardhat,\
		/obj/item/clothing/head/santa,\
		/obj/item/clothing/head/helmet/roman,\
		/obj/item/clothing/head/helmet/gladiator,\
		/obj/item/clothing/head/helmet/bluetaghelm,\
		/obj/item/clothing/head/helmet/redtaghelm,\
		/obj/item/clothing/head/festive,\
		/obj/item/clothing/head/canada,\
		/obj/item/clothing/head/cardborg,\
		/obj/item/clothing/head/bio_hood/security,\
		/obj/item/clothing/head/bandana,\
		/obj/item/clothing/head/welding,\
		/obj/item/clothing/head/sombrero,\
		/obj/item/clothing/head/sombrero/green,\
		/obj/item/clothing/head/sombrero/shamebrero,\
		/obj/item/clothing/head/collectable,\
		/obj/item/clothing/head/rice_hat,\
		/obj/item/clothing/head/jester,\
		/obj/item/clothing/head/cone,\
		/obj/item/clothing/head/helmet/f13/raider/arclight,\
		/obj/item/clothing/head/helmet/f13/raider/blastmaster,\
		/obj/item/clothing/head/helmet/f13/raider/yankee)
	r_pocket = pick(
		/obj/item/flashlight/flare/torch, \
		/obj/item/flashlight/flare)
	shoes = 			/obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/restraints/handcuffs=2, \
		/obj/item/claymore/machete/pipe=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1)
		//if(prob(5))
		//	glasses = 	/obj/item/clothing/glasses/sunglasses
		//if(prob(8))
		//	l_hand = 	/obj/item/hatchet

	suit_store = pick(
		/obj/item/gun/ballistic/revolver/caravan_shotgun, \
		/obj/item/gun/ballistic/revolver/single_shotgun)



/*
Pusher
*/

/datum/job/f13pusher
	title = "Pusher"
	flag = F13PUSHER
	department_head = list("Captain")
	department_flag = WASTELAND
	head_announce = list("Security")
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/f13pusher

	access = list()
	minimal_access = list()

/datum/outfit/job/f13pusher
	name = "Pusher"
	jobtype = /datum/job/f13pusher

	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null

	uniform =  		/obj/item/clothing/under/jabroni
/datum/outfit/job/f13pusher/pre_equip(mob/living/carbon/human/H)
	..()
	r_pocket = pick(
		/obj/item/flashlight/flare/torch, \
		/obj/item/flashlight/flare)

/*
Preacher
*/

/datum/job/f13preacher
	title = "Preacher"
	flag = F13PREACHER
	department_head = list("Captain")
	department_flag = WASTELAND
	head_announce = list("Security")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/f13preacher

	access = list()
	minimal_access = list()

/datum/outfit/job/f13preacher
	name = "Preacher"
	jobtype = /datum/job/f13preacher

	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null

	uniform = 		/obj/item/clothing/under/rank/chaplain
	gloves =		/obj/item/clothing/gloves/fingerless
	shoes = 		/obj/item/clothing/shoes/jackboots
	backpack = 		/obj/item/storage/backpack/cultpack
	satchel = 		/obj/item/storage/backpack/cultpack
	mask = 			/obj/item/clothing/mask/gas/syndicate
	r_hand = 		/obj/item/gun/ballistic/shotgun/boltaction/remington/scoped
	backpack_contents = list(
		/obj/item/ammo_box/magazine/internal/boltaction=2, \
		/obj/item/reagent_containers/food/drinks/flask=1)


/*
Trader
*/

/*
/datum/job/f13traider
	title = "Traider"
	flag = F13TRAIDER
	department_head = list("Captain")
	department_flag = WASTELAND
	head_announce = list("Security")
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "no one"
	selection_color = "#ffdddd"

	outfit = /datum/outfit/job/f13traider

	access = list()
	minimal_access = list()

/datum/outfit/job/f13traider
	name = "Traider"
	jobtype = /datum/job/f13traider

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

*/