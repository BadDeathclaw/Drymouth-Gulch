/*
Legat

Needs whitelist
*/
/datum/job/f13legate
	title = "The Legate"
	flag = F13LEGATE
	department_flag = LEGION
	head_announce = list("Security")
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	exp_requirements = 2700
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13legate

	access = list()
	minimal_access = list()

/datum/outfit/job/f13legate
	name = "The Legate"
	jobtype = /datum/job/f13legate


	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionlegat
	gloves =		/obj/item/clothing/gloves/legion
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
	box = null

/*
Centurion
*/
/datum/job/f13centurion
	title = "Legion Centurion"
	flag = F13CENTURION
	department_flag = LEGION
	head_announce = list("Security")
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	description = "You are the commander of the Centuria and are the direct superior to the Veteran Decanus, working with them and your soldiers to ensure that your Garrison is prepared for the coming battle of Hoover Dam. You are to establish yourself within the region in order to defeat the Profligates who would oppose Caesar, while allying with those who would make your Legion stronger."
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	supervisors = "Legate"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	exp_requirements = 2160
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13centurion

/datum/outfit/job/f13centurion
	name = "Centurion"
	jobtype = /datum/job/f13centurion

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
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
	box = null

/datum/outfit/job/f13centurion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/*
Veteran Decan
*/
/datum/job/f13vetdecan
	title = "Legion Veteran Decanus"
	flag = F13VETDECAN
	department_flag = LEGION
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Centurion, working with them as their second in command, you run the camp, gather intelligence and lead the Centuria on patrols, raids and scouting missions on behalf of your Commander."
	supervisors = "the centurion"
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	selection_color = "#ffeeee"
	exp_requirements = 1500
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13vetdecan

/datum/outfit/job/f13vetdecan
	name = "Veteran Decanus"
	jobtype = /datum/job/f13vetdecan

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit/vet
	head = 			/obj/item/clothing/head/helmet/f13/legion/legdecan/vet
	mask =			/obj/item/clothing/mask/bandana/legdecan
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/revolver/m29/alt
	r_hand = 		/obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/m44=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_officer)
	box = null

/datum/outfit/job/f13vetdecan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/*
Vexillarius
*/
/datum/job/f13vexillarius
	title = "Legion Vexillarius"
	flag = F13VEXILLARIUS
	department_flag = LEGION
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to the Decanus and Centurion, acting as an elite soldier of the Legion you hold the standard of Caesar in battle, raising troop morale and rallying the Centuria to your banner in the heat of battle, guiding them back to you."
	supervisors = "veteran decanus"
	selection_color = "#ffeeee"
	exp_requirements = 1200
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13vexillarius

/datum/outfit/job/f13vexillarius
	name = "Legion Vexillarius"
	jobtype = /datum/job/f13vexillarius

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legvexil
	head = 			/obj/item/clothing/head/helmet/f13/legion/legvexil
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/shotgun
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/storage/box/lethalshot, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_officer)
	box = null

/datum/outfit/job/f13vexillarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/*
Decan
*/
/datum/job/f13decan
	title = "Legion Decanus"
	flag = F13DECAN
	department_flag = LEGION
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to the Veteran Decanus and Centurion, working with them as their lieutenants, running the camp and training recruits, gathering intelligence and leading the Centuria on patrols, raids and scouting missions on behalf of the commander."
	supervisors = "veteran decanus"
	selection_color = "#ffeeee"
	exp_requirements = 960
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13decan

/datum/outfit/job/f13decan
	name = "Legion Decanus"
	jobtype = /datum/job/f13decan

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionleather
	gloves =		/obj/item/clothing/gloves/legion
	suit = 			/obj/item/clothing/suit/armor/f13/legrecruit
	head = 			/obj/item/clothing/head/helmet/f13/legion/legdecan
	mask =			/obj/item/clothing/mask/bandana/legdecan
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/revolver/m29/alt
	r_hand = 		/obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/throwing_star/spear, \
		/obj/item/claymore/machete=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/ammo_box/m44=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_officer)
	box = null

/datum/outfit/job/f13decan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/*
Veteran
*/
/datum/job/f13vetlegion
	title = "Veteran Legionary"
	flag = F13VETLEGION
	department_flag = LEGION
	faction = "Legion"
	total_positions = 8
	spawn_positions = 8
	description = "You answer directly to the Decanus, acting as a loyal soldier of the Centuria, you have the great honour of serving under Caesar in his quest to unite the scattered tribes of The Mojave. You are a hardened Veteran, and have been waging war for the Legion for the better part of ten years."
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	supervisors = "decanus troops"
	selection_color = "#ffeeee"
	exp_requirements = 300
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13vetlegion

/datum/outfit/job/f13vetlegion
	name = "Veteran Legionary"
	jobtype = /datum/job/f13vetlegion

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
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
		/obj/item/claymore/machete=1, \
		/obj/item/ammo_box/m44=1, \
		/obj/item/reagent_containers/pill/patch/healingpowder=2, \
		/obj/item/flashlight/flare/torch=1, \
		/obj/item/stack/f13Cash/random/denarius/legionpay_veteran)
	box = null

/datum/outfit/job/f13vetlegion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/*
Legionary
*/
/datum/job/f13legionary
	title = "Legionary"
	flag = F13LEGIONARY
	department_flag = LEGION
	faction = "Legion"
	total_positions = 15
	spawn_positions = 15
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to the Decanus, acting as a loyal soldier within the Centuria, you have the great honour of serving under Caesar in his quest to unite the scattered tribes of The Mojave."
	supervisors = "decanus troops"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13legionary

/datum/outfit/job/f13legionary
	name = "Legionary"
	jobtype = /datum/job/f13legionary

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionleather
	gloves =		/obj/item/clothing/gloves/legion
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
	box = null

/datum/outfit/job/f13legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/datum/job/f13explorer
	title = "Legion Explorer"
	flag = F13EXPLORER
	department_flag = LEGION
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to the Centurion, acting as the eyes of the Centuria you bear the responsibility of obtaining intelligence for your Commander and lead the Scouts in reconnaissance on their behalf."
	supervisors = "decanus troops"
	selection_color = "#ffeeee"
	exp_requirements = 600
	exp_type = EXP_TYPE_LEGION

	outfit = /datum/outfit/job/f13explorer

/datum/outfit/job/f13explorer
	name = "Explorer"
	jobtype = /datum/job/f13explorer

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionmetal
	gloves =		/obj/item/clothing/gloves/legion
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
	box = null
	r_pocket = /obj/item/binocs

/datum/outfit/job/f13explorer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/datum/job/f13scout
	title = "Legion Scout"
	flag = F13SCOUT
	department_flag = LEGION
	faction = "Legion"
	total_positions = 4
	spawn_positions = 4
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to the Explorer, acting as the eyes of the Centuria. You bear the responsibility of obtaining intelligence for your Commander and when under attack, are expected to be the first to respond and assault the enemy."
	supervisors = "explorer troops"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13scout

/datum/outfit/job/f13scout
	name = "Scout"
	jobtype = /datum/job/f13scout

	id = null
	ears = null
	belt = /obj/item/storage/belt/military/legion
	backpack = /obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/legionleather
	gloves =		/obj/item/clothing/gloves/legion
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

/datum/outfit/job/f13scout/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MONKEYLIKE)

/datum/job/f13campfollower
	title = "Legion Camp Follower"
	flag = F13CAMPFOLLOWER
	department_flag = LEGION
	faction = "Legion"
	total_positions = 3
	spawn_positions = 3
	forbids = "The legion forbids: Ghouls(Anywhere), Women in armed roles, chems and medicine besides healing powder. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator. Expansion of Caesars Domain."
	description = "You answer directly to any member of the Legion, working as a Camp Follower for the Centuria, you bear the great honor of supporting Caesar’s Army in its conquest of the Mojave in whatever capacity required from those whom you serve. You perform any tasks required of you, for you know how to serve the Legion well."
	supervisors = "the entire legion"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13campfollower

/datum/outfit/job/f13campfollower
	name = "Camp Follower"
	jobtype = /datum/outfit/job/f13campfollower

	id = null
	ears = null
	belt = null
	shoes = /obj/item/clothing/shoes/sandal
	box = null

/datum/outfit/job/f13campfollower/pre_equip(mob/living/carbon/human/H)
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
