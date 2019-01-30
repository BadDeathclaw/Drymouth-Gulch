/datum/job/wasteland
	department_flag = WASTELAND

/*
Cult Leader
*/
/datum/job/wasteland/f13cultleader
	title = "Cult Leader"
	flag = F13CULTLEADER
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "your God"
	selection_color = "#ffddf0"

	outfit = /datum/outfit/job/wasteland/f13cultleader

/datum/outfit/job/wasteland/f13cultleader
	name = "Cult Leader"
	jobtype = /datum/job/wasteland/f13cultleader

	id = 			/obj/item/card/id/gold
	uniform =  		/obj/item/clothing/under/rank/captain


/*
wasteland
*/

/datum/job/wasteland/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	faction = "Wastelander"
	total_positions = -1
	spawn_positions = -1
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13wastelander

/datum/outfit/job/wasteland/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/wasteland/f13wastelander

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

/datum/outfit/job/wasteland/f13wastelander/pre_equip(mob/living/carbon/human/H)
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
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/reagent_containers/blood/radaway=1, \
		/obj/item/reagent_containers/food/drinks/flask, \
		/obj/item/storage/bag/money/small/wastelander)



/*
Raider
*/

/datum/job/wasteland/f13raider
	title = "Raider"
	flag = F13RAIDER
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	total_positions = -1
	spawn_positions = -1
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13raider

	access = list()
	minimal_access = list()

/datum/outfit/job/wasteland/f13raider
	name = "Raider"
	jobtype = /datum/job/wasteland/f13raider

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

/datum/outfit/job/wasteland/f13raider/pre_equip(mob/living/carbon/human/H)
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
		/obj/item/clothing/suit/poncho/red,\
		/obj/item/clothing/suit/det_suit/grey,\
		/obj/item/clothing/suit/det_suit,\
		/obj/item/clothing/suit/chickensuit,\
		/obj/item/clothing/suit/bomb_suit,\
		/obj/item/clothing/suit/bio_suit/security,\
		/obj/item/clothing/suit/apron/chef,\
		/obj/item/clothing/suit/apron/overalls,\
		/obj/item/clothing/suit/toggle/labcoat/mad,\
		/obj/item/clothing/suit/pirate,\
		/obj/item/clothing/suit/armor/f13/kit/terrible,\
		/obj/item/clothing/suit/armor/f13/leatherarmor/terrible, \
		/obj/item/clothing/suit/armor/f13/bmetalarmor/terrible, \
		/obj/item/clothing/suit/armor/f13/raider/yankee, \
		/obj/item/clothing/suit/armor/f13/raider/sadist, \
		/obj/item/clothing/suit/armor/f13/raider/blastmaster)
	if(prob(10))
		mask = pick(
			/obj/item/clothing/mask/joy,\
			/obj/item/clothing/mask/pig,\
			/obj/item/clothing/mask/frog,\
			/obj/item/clothing/mask/rat,\
			/obj/item/clothing/mask/rat/fox,\
			/obj/item/clothing/mask/rat/bee,\
			/obj/item/clothing/mask/rat/bear,\
			/obj/item/clothing/mask/rat/bat,\
			/obj/item/clothing/mask/rat/raven,\
			/obj/item/clothing/mask/rat/jackal)
	head = pick(
		/obj/item/clothing/head/papersack, \
		/obj/item/clothing/head/helmet/f13/raider,\
		/obj/item/clothing/head/helmet/f13/eyebot,\
		/obj/item/clothing/head/helmet/f13/brokenpa/t45d,\
		/obj/item/clothing/head/chicken,\
		/obj/item/clothing/head/hardhat,\
		/obj/item/clothing/head/santa,\
		/obj/item/clothing/head/helmet/roman,\
		/obj/item/clothing/head/helmet/gladiator,\
		/obj/item/clothing/head/festive,\
		/obj/item/clothing/head/canada,\
		/obj/item/clothing/head/bio_hood/security,\
		/obj/item/clothing/head/bandana,\
		/obj/item/clothing/head/welding,\
		/obj/item/clothing/head/sombrero,\
		/obj/item/clothing/head/sombrero/green,\
		/obj/item/clothing/head/collectable,\
		/obj/item/clothing/head/rice_hat,\
		/obj/item/clothing/head/jester,\
		/obj/item/clothing/head/cone,\
		/obj/item/clothing/head/helmet/f13/raider/arclight,\
		/obj/item/clothing/head/helmet/f13/raider/blastmaster,\
		/obj/item/clothing/head/helmet/f13/raider/yankee,\
		/obj/item/clothing/head/hooded/carp_hood,\
		/obj/item/clothing/head/jester/alt,\
		/obj/item/clothing/head/lobsterhat,\
		/obj/item/clothing/head/cueball,\
		/obj/item/clothing/head/fedora)
	r_pocket = pick(
		/obj/item/flashlight/flare/torch, \
		/obj/item/flashlight/flare)
	shoes = 			/obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/restraints/handcuffs=2, \
		/obj/item/claymore/machete/pipe=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/raider=1)

	suit_store = pick(
		/obj/item/gun/ballistic/revolver/caravan_shotgun, \
		/obj/item/gun/ballistic/revolver/single_shotgun)



/*
Pusher
*/

/datum/job/wasteland/f13pusher
	title = "Pusher"
	flag = F13PUSHER
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	total_positions = 4
	spawn_positions = 4
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13pusher

	access = list()
	minimal_access = list()

/datum/outfit/job/wasteland/f13pusher
	name = "Pusher"
	jobtype = /datum/job/wasteland/f13pusher

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

	uniform =  		/obj/item/clothing/under/jabroni
	suit = /obj/item/clothing/suit/f13/duster

/datum/outfit/job/f13pusher/pre_equip(mob/living/carbon/human/H)
	..()
	r_pocket = pick(
		/obj/item/flashlight/flare/torch, \
		/obj/item/flashlight/flare)
	l_pocket = /obj/item/storage/bag/money/small/wastelander
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/jet=3, \
		/obj/item/reagent_containers/syringe/medx=2)

/*
Punished Raider
*/

/datum/job/wasteland/f13punraider
	title = "Punished Raider"
	flag = F13PUNRAIDER
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	total_positions = 0
	spawn_positions = 0
	supervisors = "no one"
	selection_color = "#dddddd"
	outfit = /datum/outfit/job/wasteland/f13punraider

	access = list()
	minimal_access = list()

/datum/outfit/job/wasteland/f13punraider
	name = "Punished Raider"
	jobtype = /datum/job/wasteland/f13punraider

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

/datum/outfit/job/wasteland/f13punraider/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/kilt/highlander, \
		/obj/item/clothing/under/sexymime, \
		/obj/item/clothing/under/sundress, \
		/obj/item/clothing/under/schoolgirl, \
		/obj/item/clothing/under/rank/clown, \
		null)
	suit = pick(
		/obj/item/clothing/suit/whitedress, \
		/obj/item/clothing/suit/poncho/ponchoshame, \
		/obj/item/clothing/suit/chickensuit, \
		/obj/item/clothing/suit/straight_jacket, \
		null)
	head = pick(
		/obj/item/clothing/head/sombrero/shamebrero, \
		/obj/item/clothing/head/papersack, \
		/obj/item/clothing/head/chicken,\
		/obj/item/clothing/head/santa,\
		/obj/item/clothing/head/festive,\
		/obj/item/clothing/head/canada,\
		/obj/item/clothing/head/bandana,\
		/obj/item/clothing/head/collectable,\
		/obj/item/clothing/head/rice_hat,\
		/obj/item/clothing/head/jester,\
		/obj/item/clothing/head/cone,\
		/obj/item/clothing/head/hooded/carp_hood
		/obj/item/clothing/head/fedora,\
		/obj/item/clothing/head/lobsterhat,\
		null)
	mask = pick(
		/obj/item/clothing/mask/joy,\
		/obj/item/clothing/mask/spig,\
		/obj/item/clothing/mask/joy/joyful,\
		/obj/item/clothing/mask/cowmask,\
		/obj/item/clothing/mask/frog/cursed,\
		/obj/item/clothing/mask/horsehead,\
		null)
	r_pocket = pick(
		/obj/item/organ/appendix, \
		/obj/item/reagent_containers/food/snacks/grown/potato,\
		null)
	shoes = pick(
		/obj/item/clothing/shoes/clown_shoes,\
		null)
	backpack_contents = pick(
		/obj/item/restraints/handcuffs, \
		/obj/item/gun/ballistic/revolver/russian, \
		/obj/item/reagent_containers/food/snacks/grown/banana)
	belt  = (/obj/item/claymore/machete/pipe)

/*
Trader
*/

/*
/datum/job/wasteland/f13traider
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

	outfit = /datum/outfit/job/wasteland/f13traider

	access = list()
	minimal_access = list()

/datum/outfit/job/wasteland/f13traider
	name = "Traider"
	jobtype = /datum/job/wasteland/f13traider

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

*/
