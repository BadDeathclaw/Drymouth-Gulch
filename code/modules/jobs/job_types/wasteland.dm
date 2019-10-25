/datum/job/wasteland
	department_flag = WASTELAND

/*
Cult Leader
*/

/*
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

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

*/

/*
Great Khan
*/

/datum/job/wasteland/f13pusher
	title = "Great Khan"
	flag = F13PUSHER
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 6
	spawn_positions = 6
	description = "Due to your experience dealing with underground elements, you can recognize common raiders at a glance even if they have their face covered."
	supervisors = "your gang leadership"
	selection_color = "#ff915e"
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/wasteland/f13pusher

	access = list()
	minimal_access = list()

/datum/outfit/job/wasteland/f13pusher
	name = "Great Khan"
	jobtype = /datum/job/wasteland/f13pusher

	id = null
	ears = null
	belt = /obj/item/claymore/machete/pipe
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

	suit = /obj/item/clothing/suit/armor/khan
	uniform = /obj/item/clothing/under/f13/khan

/datum/outfit/job/wasteland/f13pusher/pre_equip(mob/living/carbon/human/H)
	..()
	r_pocket = pick(
		/obj/item/flashlight/flare/torch, \
		/obj/item/flashlight/flare)
	l_pocket = /obj/item/storage/bag/money/small/khan
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, \
		/obj/item/reagent_containers/pill/patch/jet=2, \
		/obj/item/reagent_containers/syringe/medx=1)
	suit_store = pick(
		/obj/item/gun/ballistic/revolver/detective, \
		/obj/item/gun/ballistic/shotgun/remington, \
		/obj/item/gun/ballistic/revolver/caravan_shotgun, \
		/obj/item/gun/ballistic/revolver/pipe_rifle, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil)
	head = /obj/item/clothing/head/helmet/f13/khan
	shoes = /obj/item/clothing/shoes/f13/khan

/datum/outfit/job/wasteland/f13pusher/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.social_faction = "Raiders"

	if(!H.gang)
		var/datum/gang/greatkhans/GK = GLOB.greatkhans
		GLOB.all_gangs |= GK
		GK.add_member(H)
		H.gang = GK

/*
Raider
*/

/datum/job/wasteland/f13raider
	title = "Raider"
	flag = F13RAIDER
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 20
	spawn_positions = 40
	description = "Everyone will naturally know of your violent nature unless you cover your face. Due to your experience with your own kind, you can recognize other raiders even if they have their face covered, and they can recognize you."
	supervisors = "your desires"
	selection_color = "#ff4747"

	outfit = /datum/outfit/job/wasteland/f13raider

	access = list()
	minimal_access = list()
	loadout_options = list(
	/datum/outfit/loadout/raider_supafly,
	/datum/outfit/loadout/raider_yankee,
	/datum/outfit/loadout/raider_blast,
	/datum/outfit/loadout/raider_sadist,
	/datum/outfit/loadout/raider_metal,
	/datum/outfit/loadout/raider_painspike,
	/datum/outfit/loadout/raider_badlands,
	/datum/outfit/loadout/raider_metal/chestplate)

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
		/obj/item/clothing/under/f13/cowboyb, \
		/obj/item/clothing/under/f13/cowboyg, \
		/obj/item/clothing/under/f13/raider_leather, \
		/obj/item/clothing/under/f13/raiderrags, \
		/obj/item/clothing/under/pants/f13/ghoul, \
		/obj/item/clothing/under/jabroni)
	suit = pick(
		/obj/item/clothing/suit/armor/f13/raider,\
		/obj/item/clothing/suit/armor/f13/raider/yankee, \
		/obj/item/clothing/suit/armor/f13/raider/sadist, \
		/obj/item/clothing/suit/armor/f13/raider/blastmaster, \
		/obj/item/clothing/suit/armor/f13/badlands, \
		/obj/item/clothing/suit/armor/f13/raider/painspike)
	if(prob(10))
		mask = pick(
			/obj/item/clothing/mask/bandana/red,\
			/obj/item/clothing/mask/bandana/blue,\
			/obj/item/clothing/mask/bandana/green,\
			/obj/item/clothing/mask/bandana/gold,\
			/obj/item/clothing/mask/bandana/black,\
			/obj/item/clothing/mask/bandana/skull)
	head = pick(
		/obj/item/clothing/head/sombrero,\
		/obj/item/clothing/head/helmet/f13/raider,\
		/obj/item/clothing/head/helmet/f13/eyebot,\
		/obj/item/clothing/head/helmet/f13/raider/arclight,\
		/obj/item/clothing/head/helmet/f13/raider/blastmaster,\
		/obj/item/clothing/head/helmet/f13/raider/yankee,\
		/obj/item/clothing/head/helmet/f13/raider/psychotic,\
		/obj/item/clothing/head/helmet/f13/fiend)
	r_pocket = /obj/item/flashlight/flare
	shoes = pick(
			/obj/item/clothing/shoes/jackboots,\
			/obj/item/clothing/shoes/f13/raidertreads)
	gloves = /obj/item/clothing/gloves/f13/handwraps
	backpack_contents = list(
		/obj/item/restraints/handcuffs=2, \
		/obj/item/claymore/machete/pipe=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/raider=1)

	suit_store = pick(
		/obj/item/gun/ballistic/revolver/detective, \
		/obj/item/gun/ballistic/shotgun/remington, \
		/obj/item/gun/ballistic/revolver/zipgun, \
		/obj/item/gun/ballistic/revolver/pipe_rifle, \
		/obj/item/gun/ballistic/revolver/caravan_shotgun, \
		/obj/item/gun/ballistic/revolver/single_shotgun)

/datum/outfit/job/wasteland/f13raider/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.social_faction = "Raiders"
	H.verbs |= /mob/living/proc/creategang



/datum/outfit/loadout/raider_supafly
	name = "Supa-fly"
	suit = /obj/item/clothing/suit/armor/f13/raider
	head = /obj/item/clothing/head/helmet/f13/raider

/datum/outfit/loadout/raider_yankee
	name = "Yankee"
	suit = /obj/item/clothing/suit/armor/f13/raider/yankee
	head = /obj/item/clothing/head/helmet/f13/raider/yankee

/datum/outfit/loadout/raider_blast
	name = "Blastmaster"
	suit = /obj/item/clothing/suit/armor/f13/raider/blastmaster
	head = /obj/item/clothing/head/helmet/f13/raider/blastmaster

/datum/outfit/loadout/raider_sadist
	name = "Sadist"
	suit = /obj/item/clothing/suit/armor/f13/raider/sadist
	head = /obj/item/clothing/head/helmet/f13/raider/arclight

/datum/outfit/loadout/raider_badlands
	name = "Badlands"
	suit = /obj/item/clothing/suit/armor/f13/badlands
	head = /obj/item/clothing/head/helmet/f13/fiend

/datum/outfit/loadout/raider_painspike
	name = "Painspike"
	suit = /obj/item/clothing/suit/armor/f13/raider/painspike
	head = /obj/item/clothing/head/helmet/f13/raider/psychotic

/datum/outfit/loadout/raider_metal
	name = "Metal - Black"
	suit = /obj/item/clothing/suit/armor/f13/bmetalarmor
	head = list(/obj/item/clothing/head/helmet/f13/metalmask,
	/obj/item/clothing/head/helmet/knight/fluff/metal,
	/obj/item/clothing/head/helmet/f13/motorcycle,
	/obj/item/clothing/head/helmet/f13/eyebot = 0.2)
	//This 0.2 weight will make the eyebot less common. Everything has a weight of 1 if not specified

//As a subclass, this inherits the helmets from the raider_metal outfit
/datum/outfit/loadout/raider_metal/chestplate
	name = "Metal - Chest"
	suit = /obj/item/clothing/suit/armor/fluff/chestplate

/*
Wastelander
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
	r_hand = pick(
		/obj/item/claymore/machete/pipe, \
		/obj/item/claymore/machete/golf, \
		/obj/item/switchblade, \
		/obj/item/kitchen/knife)
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	suit = pick(
		/obj/item/clothing/suit/armor/f13/kit, \
		/obj/item/clothing/suit/f13/veteran, \
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer, \
		/obj/item/clothing/suit/armor/f13/leatherarmor)
	l_pocket = 	/obj/item/reagent_containers/food/drinks/flask
	r_pocket = /obj/item/flashlight/flare
	belt = 	/obj/item/kitchen/knife/combat/survival
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/reagent_containers/pill/radx=1, \
		/obj/item/storage/bag/money/small/wastelander)
	suit_store = pick(
	/obj/item/gun/ballistic/revolver/detective, \
	/obj/item/gun/ballistic/shotgun/remington, \
	/obj/item/gun/ballistic/revolver/zipgun, \
	/obj/item/gun/ballistic/revolver/pipe_rifle)

/*
Punished Raider
*/

/*
/datum/job/wasteland/f13punraider
	title = "Punished Raider"
	flag = F13PUNRAIDER
	department_head = list("Captain")
	head_announce = list("Security")
	req_admin_notify = 1
//	faction = "Station"
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
		/obj/item/clothing/head/hooded/carp_hood,\
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
	belt  = /obj/item/claymore/machete/pipe

*/

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
