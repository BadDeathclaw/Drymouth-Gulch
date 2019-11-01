//Faction datums of sorts, use the dang hierarchies in the future
//It looks like var/faction controls what becomes visible on setup. Should likely be fixed or something, but I'm not doing it.
/datum/job/CaesarsLegion
	department_flag = LEGION
	selection_color = "#ffeeee"
	exp_type = EXP_TYPE_LEGION
	forbids = "The Legion forbids: Ghouls (joining the legion, don't kill random wastelander ghouls just for being ghouls), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."

/datum/outfit/job/CaesarsLegion
	id = null
	ears = null
	box = null

/datum/outfit/job/CaesarsLegion/Legionnaire
	belt = /obj/item/storage/belt/military/assault/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/f13/military/legionmetal
	gloves =		/obj/item/clothing/gloves/legion

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)
	if(H.gender == FEMALE)
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()
	if(H.real_name == ("Biggus Dickus" || "Bigus Dickus"))
		H.real_name = "Minimae Coles"
		H.name = "Minimae Coles"
		H.lust_tolerance = 0
		H.sexual_potency = 0
		H.lust = 0

/*
Legate

Needs whitelist
*/
/datum/job/CaesarsLegion/Legionnaire/f13legate
	title = "Legate"
//	faction = "Legion"
	flag = F13LEGATE
	head_announce = list("Security")
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	exp_requirements = 2700
	total_positions = 0
	spawn_positions = 0

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legate

	access = list()
	minimal_access = list()


/datum/job/CaesarsLegion/Legionnaire/f13legate/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate
	name = "Legate"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legate
	shoes = 		/obj/item/clothing/shoes/f13/military/legionlegate
	suit = 			/obj/item/clothing/suit/armor/f13/legion/legate
	head = 			/obj/item/clothing/head/helmet/f13/legion/legate
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola=2, \
		/obj/item/throwing_star/spear, \
		/obj/item/melee/powerfist=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/magazine/m556/rifle=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/storage/bag/money/small/legion)

/*
Centurion
*/
/datum/job/CaesarsLegion/Legionnaire/f13centurion
	title = "Legion Centurion"
	flag = F13CENTURION
	faction = "Legion"
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the commander of the Centuria and are the direct superior to the Decanii, working with them and your soldiers to ensure that your Garrison is prepared for the coming battle of Hoover Dam. You are to establish yourself within the region in order to defeat the Profligates who would oppose Caesar, while allying with those who would make your Legion stronger."
	supervisors = "Legate"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	exp_requirements = 900
	exp_type = EXP_TYPE_DECANUS

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	
	loadout_options = list(
	/datum/outfit/loadout/smg,
	/datum/outfit/loadout/thermic)

/datum/job/CaesarsLegion/Legionnaire/f13centurion/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	name = "Legion Centurion"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13centurion
	id =			/obj/item/card/id/dogtag/legcenturion
	suit = 			/obj/item/clothing/suit/armor/f13/legion/centurion
	head = 			/obj/item/clothing/head/helmet/f13/legion/centurion
	mask =			/obj/item/clothing/mask/bandana/legcenturion
	r_hand =		null
	suit_store =	null
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	r_pocket =      /obj/item/restraints/handcuffs
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/twohanded/binocs=1, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/key/scollar=1, \
		/obj/item/key/bcollar=1, \
		/obj/item/assembly/signaler/electropack/shockcollar=1, \
		/obj/item/assembly/signaler/electropack/boomcollar=2, \
		/obj/item/storage/bag/money/small/legion)
		
/datum/outfit/loadout/smg
	name = "SMG & Powerfist"
	suit_store = /obj/item/gun/ballistic/automatic/smg10mm
	backpack_contents = list(
		/obj/item/melee/powerfist=1,
		/obj/item/ammo_box/magazine/m10mm_auto=2)

/datum/outfit/loadout/thermic
	name = "Thermic Lance"
	suit_store = /obj/item/gun/ballistic/automatic/smg10mm
	backpack_contents = list(
		/obj/item/twohanded/required/thermic_lance=1)

/*
Decanus
*/
/datum/job/CaesarsLegion/Legionnaire/f13decan
	title = "Legion Decanus"
	flag = F13DECAN
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Centurion, working with them to organize the Legionaries as needed. You help run the camp and lead the men on patrols, raids and scouting missions on behalf of your Centurion."
	supervisors = "The Centurion and up."
	exp_requirements = 1200

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decan

/datum/job/CaesarsLegion/Legionnaire/f13decan/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	name = "Legion Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decan
	id = 			/obj/item/card/id/dogtag/legveteran
	suit = 			/obj/item/clothing/suit/armor/f13/legion/vet
	head = 			/obj/item/clothing/head/helmet/f13/legion/vet/decan
	mask =			/obj/item/clothing/mask/bandana/legdecan
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/hunting/trail
	r_hand = 		/obj/item/twohanded/fireaxe/bmprsword
	r_pocket =      /obj/item/restraints/handcuffs
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete/gladius=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/tube/m44=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/twohanded/binocs=1, \
		/obj/item/key/scollar=1, \
		/obj/item/assembly/signaler/electropack/shockcollar=1, \
		/obj/item/storage/bag/money/small/legofficers)

/*
Vexillarius
*/
/datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	title = "Legion Vexillarius"
	flag = F13VEXILLARIUS
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Decanus and the Centurion, acting as a standard bearer for your Centuria. You raise troop morale, relay orders from the Decanii and the Centurion, and rally men when ordered, however, you hold no actual authority over the troops and should instead only relay orders from your superiors."
	supervisors = "Decanus and up."
	exp_requirements = 900

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius

/datum/job/CaesarsLegion/Legionnaire/f13vexillarius/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	name = "Legion Vexillarius"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	id = 			/obj/item/card/id/dogtag/legveteran
	suit = 			/obj/item/clothing/suit/armor/f13/legion/vet/vexil
	head = 			/obj/item/clothing/head/helmet/f13/legion/vet/vexil
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/hunting/cowboy
	backpack_contents = list(
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete/gladius=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/tube/a357=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/megaphone/cornu=1, \
		/obj/item/storage/bag/money/small/legenlisted)
	r_pocket = /obj/item/restraints/handcuffs

/*
Veteran
*/
/datum/job/CaesarsLegion/Legionnaire/f13vetlegion
	title = "Veteran Legionnaire"
	flag = F13VETLEGION
	faction = "Legion"
	total_positions = 4
	spawn_positions = 4
	description = "You answer directly to the Decanus and the Centurion, acting as a loyal soldier of the Centuria, you have the great honour of serving under Caesar in his quest to unite the scattered tribes of The Mojave. You are a hardened Veteran, and have been waging war with the Legion for the better part of ten years."
	supervisors = "Decanus and up."
	exp_requirements = 600

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vetlegion

	loadout_options = list(
	/datum/outfit/loadout/veteran,
	/datum/outfit/loadout/explorer)

/datum/job/CaesarsLegion/Legionnaire/f13vetlegion/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")


/datum/outfit/job/CaesarsLegion/Legionnaire/f13vetlegion
	name = "Veteran Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vetlegion
	id = 			/obj/item/card/id/dogtag/legveteran
	suit = 			null
	head = 			null
	mask =			/obj/item/clothing/mask/bandana/legvet
	glasses = 		/obj/item/clothing/glasses/legiongoggles
	suit_store = 	null
	r_hand = 		null
	r_pocket =      /obj/item/restraints/handcuffs
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/reagent_containers/pill/patch/healingpowder=1, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/storage/bag/money/small/legenlisted)

/datum/outfit/loadout/veteran
	name = "Veteran"
	suit_store = /obj/item/gun/ballistic/shotgun/trench
	backpack_contents = list(
		/obj/item/storage/box/lethalshot=1,
		/obj/item/twohanded/fireaxe=1,
		/obj/item/clothing/suit/armor/f13/legion/vet=1,
		/obj/item/clothing/head/helmet/f13/legion/vet=1,
		/obj/item/reagent_containers/pill/patch/healpoultice=1)

/datum/outfit/loadout/explorer
	name = "Explorer"
	suit_store = /obj/item/gun/ballistic/shotgun/remington/scoped
	backpack_contents = list(
		/obj/item/ammo_box/a308=2,
		/obj/item/claymore/machete/gladius=1,
		/obj/item/clothing/suit/armor/f13/legion/vet/explorer=1,
		/obj/item/clothing/head/helmet/f13/legion/vet/explorer=1)

/*
Prime
*/
/datum/job/CaesarsLegion/Legionnaire/f13primelegion
	title = "Prime Legionnaire"
	flag = F13PRIMELEGION
	faction = "Legion"
	total_positions = 8
	spawn_positions = 8
	description = "You answer directly to the Decanus and the Centurion. You act as a loyal soldier within the Centuria, you have the great honour of serving under Caesar in his quest to unite the scattered tribes of The Mojave."
	supervisors = "Decanus and up."
	exp_requirements = 300

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13primelegion

	loadout_options = list(
	/datum/outfit/loadout/prime,
	/datum/outfit/loadout/primerev)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13primelegion
	name = "Prime Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13primelegion
	id = 			/obj/item/card/id/dogtag/legprime
	shoes =         /obj/item/clothing/shoes/f13/military/legionleather
	suit = 			/obj/item/clothing/suit/armor/f13/legion/prime
	head = 			/obj/item/clothing/head/helmet/f13/legion/prime
	mask =			/obj/item/clothing/mask/bandana/legprime
	glasses = 		/obj/item/clothing/glasses/legiongoggles
	suit_store = 	null
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/throwing_star/spear, \
		/obj/item/reagent_containers/pill/patch/healingpowder=1, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/storage/bag/money/small/legenlisted)
	r_pocket = /obj/item/restraints/handcuffs

/datum/outfit/loadout/prime
	name = "Shotgun"
	suit_store = /obj/item/gun/ballistic/shotgun
	backpack_contents = list(
		/obj/item/storage/box/lethalshot=1,
		/obj/item/claymore/machete/gladius=1,
		/obj/item/reagent_containers/pill/patch/healingpowder=1)

/datum/outfit/loadout/primerev
	name = "Revolver"
	suit_store = /obj/item/gun/ballistic/revolver/colt357
	backpack_contents = list(
		/obj/item/ammo_box/a357=2,
		/obj/item/claymore/machete=1)


/*
Legionary
*/
/datum/job/CaesarsLegion/Legionnaire/f13legionary
	title = "Recruit Legionnaire"
	flag = F13LEGIONARY
	faction = "Legion"
	total_positions = 4
	spawn_positions = 4
	description = "You answer directly to the Decanus and the Centurion. You act as a loyal soldier within the Centuria, you have the great honour of serving under Caesar in his quest to unite the scattered tribes of The Mojave."
	supervisors = "Decanus and up."
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW


	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary
	name = "Recruit Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legionary
	id = 			/obj/item/card/id/dogtag/legrecruit
	shoes = 		/obj/item/clothing/shoes/f13/military/legionleather
	suit = 			/obj/item/clothing/suit/armor/f13/legion/recruit
	head = 			/obj/item/clothing/head/helmet/f13/legion/recruit
	mask =			/obj/item/clothing/mask/bandana/legrecruit
	glasses = 		/obj/item/clothing/glasses/legiongoggles
	r_pocket =      /obj/item/restraints/handcuffs
	suit_store = 	null
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/throwing_star/spear, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/flashlight/flare/torch=1)

/datum/job/CaesarsLegion/f13campfollower
	title = "Camp Follower"
	flag = F13CAMPFOLLOWER
	faction = "Legion"
	total_positions = 3
	spawn_positions = 3
	description = "You answer directly to any member of the Legion, working as a Camp Follower for the Centuria, you bear the great honor of supporting Caesar?s Army in its conquest of the Mojave in whatever capacity required from those whom you serve. You perform any tasks required of you, for you know how to serve the Legion well."
	supervisors = "the entire legion"
	exp_requirements = 300

	outfit = /datum/outfit/job/CaesarsLegion/f13campfollower

/datum/outfit/job/CaesarsLegion/f13campfollower
	name = "Camp Follower"
	jobtype = /datum/outfit/job/CaesarsLegion/f13campfollower
	shoes = /obj/item/clothing/shoes/sandal

/datum/outfit/job/CaesarsLegion/f13campfollower/pre_equip(mob/living/carbon/human/H)
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
