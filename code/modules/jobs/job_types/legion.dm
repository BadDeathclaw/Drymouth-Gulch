//Faction datums of sorts, use the dang hierarchies in the future
//It looks like var/faction controls what becomes visible on setup. Should likely be fixed or something, but I'm not doing it.
/datum/job/CaesarsLegion
	department_flag = LEGION
	selection_color = "#ffeeee"
	exp_type = EXP_TYPE_LEGION

/datum/outfit/job/CaesarsLegion
	id = null
	ears = null
	box = null

/datum/outfit/job/CaesarsLegion/Legionnaire
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
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

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate
	name = "Legate"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legate
	shoes = 		/obj/item/clothing/shoes/legionlegat
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


/*
Centurion
*/
/datum/job/CaesarsLegion/Legionnaire/f13centurion
	title = "Centurion"
	flag = F13CENTURION
	faction = "Legion"
	head_announce = list("Security")

	total_positions = 1
	spawn_positions = 1
	description = "You are the commander of the Centuria and are the direct superior to the Veteran Decanus, working with them and your soldiers to ensure that your Garrison is prepared for the coming battle of Hoover Dam. You are to establish yourself within the region in order to defeat the Profligates who would oppose Caesar, while allying with those who would make your Legion stronger."
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	supervisors = "Legate"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	exp_requirements = 1900


	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	name = "Centurion"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13centurion
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


/*
Veteran Decan
*/
/datum/job/CaesarsLegion/Legionnaire/f13vetdecan
	title = "Veteran Decanus"
	flag = F13VETDECAN
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Centurion, working with them as their second in command, you run the camp, gather intelligence and lead the Centuria on patrols, raids and scouting missions on behalf of your Commander."
	supervisors = "the centurion"
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	exp_requirements = 1500

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vetdecan

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vetdecan
	name = "Veteran Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vetdecan
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit/vet
	head = 			/obj/item/clothing/head/helmet/f13/legion/legdecan/vet
	mask =			/obj/item/clothing/mask/bandana/legdecan
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/revolver/m29/alt
	r_hand = 		/obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete/gladius=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/m44=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_officer)


/*
Vexillarius
*/
/datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	title = "Vexillarius"
	flag = F13VEXILLARIUS
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to the Decanus and Centurion, acting as an elite soldier of the Legion you hold the standard of Caesar in battle, raising troop morale and rallying the Centuria to your banner in the heat of battle, guiding them back to you."
	supervisors = "veteran decanus"

	exp_requirements = 1200


	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	name = "Vexillarius"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	suit = 			/obj/item/clothing/suit/armor/f13/legvexil
	head = 			/obj/item/clothing/head/helmet/f13/legion/legvexil
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun/trench
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete/gladius=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/storage/box/lethalshot, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/megaphone/cornu=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_officer)


/*
Decan
*/
/datum/job/CaesarsLegion/Legionnaire/f13decan
	title = "Decanus"
	flag = F13DECAN
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to the Veteran Decanus and Centurion, working with them as their lieutenants, running the camp and training recruits, gathering intelligence and leading the Centuria on patrols, raids and scouting missions on behalf of the commander."
	supervisors = "veteran decanus"

	exp_requirements = 960


	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decan

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	name = "Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decan
	shoes = 		/obj/item/clothing/shoes/legionleather
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit
	head = 			/obj/item/clothing/head/helmet/f13/legion/legdecan
	mask =			/obj/item/clothing/mask/bandana/legdecan
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/revolver/m29/alt
	r_hand = 		/obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete/gladius=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/m44=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_officer)


/*
Veteran
*/
/datum/job/CaesarsLegion/Legionnaire/f13vetlegion
	title = "Veteran Legionnaire"
	flag = F13VETLEGION
	faction = "Legion"
	total_positions = 8
	spawn_positions = 8
	description = "You answer directly to the Decanus, acting as a loyal soldier of the Centuria, you have the great honour of serving under Caesar in his quest to unite the scattered tribes of The Mojave. You are a hardened Veteran, and have been waging war for the Legion for the better part of ten years."
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	supervisors = "decanus troops"
	exp_requirements = 300

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vetlegion

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vetlegion
	name = "Veteran Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vetlegion
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
		/obj/item/claymore/machete/gladius=1, \
		/obj/item/ammo_box/m44=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_veteran)


/*
Legionary
*/
/datum/job/CaesarsLegion/Legionnaire/f13legionary
	title = "Legionary"
	flag = F13LEGIONARY
	faction = "Legion"
	total_positions = 15
	spawn_positions = 15
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to the Decanus, acting as a loyal soldier within the Centuria, you have the great honour of serving under Caesar in his quest to unite the scattered tribes of The Mojave."
	supervisors = "decanus troops"


	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary
	name = "Legionary"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legionary
	shoes = 		/obj/item/clothing/shoes/legionleather
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


/datum/job/CaesarsLegion/Legionnaire/f13explorer
	title = "Explorer"
	flag = F13EXPLORER
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to the Centurion, acting as the eyes of the Centuria you bear the responsibility of obtaining intelligence for your Commander and lead the Scouts in reconnaissance on their behalf."
	supervisors = "decanus troops"

	exp_requirements = 600


	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	name = "Explorer"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13explorer
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
	r_pocket = /obj/item/binocs

/datum/job/CaesarsLegion/Legionnaire/f13scout
	title = "Scout"
	flag = F13SCOUT
	total_positions = 4
	spawn_positions = 4
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to the Explorer, acting as the eyes of the Centuria. You bear the responsibility of obtaining intelligence for your Commander and when under attack, are expected to be the first to respond and assault the enemy."
	supervisors = "explorer troops"

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13scout

/datum/outfit/job/CaesarsLegion/Legionnaire/f13scout
	name = "Scout"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13scout
	shoes = 		/obj/item/clothing/shoes/legionleather
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

/datum/job/CaesarsLegion/f13campfollower
	title = "Camp Follower"
	flag = F13CAMPFOLLOWER
	faction = "Legion"
	total_positions = 3
	spawn_positions = 3
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to any member of the Legion, working as a Camp Follower for the Centuria, you bear the great honor of supporting Caesar�s Army in its conquest of the Mojave in whatever capacity required from those whom you serve. You perform any tasks required of you, for you know how to serve the Legion well."
	supervisors = "the entire legion"

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
