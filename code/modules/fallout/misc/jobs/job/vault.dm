//I'm warning you - this code section is under construction. Ceiling, walls, and floor are unstable.

/datum/job/overseer
	title = "Overseer"
	flag = CAPTAIN
	department_head = list("Centcom")
	department_flag = ENGSEC
	faction = "Vault"
	status = "Overseer"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Vault-tec"
	selection_color = "#005A20"
	req_admin_notify = 1
	minimal_player_age = 14

	outfit = /datum/outfit/job/overseer

	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()


/datum/outfit/job/overseer
	name = "Overseer"

	id = /obj/item/weapon/card/id/gold
//	gloves = /obj/item/clothing/gloves/pda/captain
	glasses = /obj/item/clothing/glasses/sunglasses
//	ears = /obj/item/device/radio/headset/headset_vlt
	//gloves = /obj/item/clothing/gloves/color/captain
	uniform = /obj/item/clothing/under/f13/vault/v13
	//suit = /obj/item/clothing/suit/armor/vest/capcarapace
	shoes = /obj/item/clothing/shoes/sneakers/brown
	//head = /obj/item/clothing/head/caphat
	backpack_contents = list(/obj/item/weapon/storage/box/ids=1,\
		/obj/item/weapon/melee/classic_baton/telescopic=1)

	//backpack = /obj/item/weapon/storage/backpack/captain
	//satchel = /obj/item/weapon/storage/backpack/satchel_cap

/datum/job/vlt_engineer
	title = "Engineer"
	flag = ENGINEER
	department_head = list("Chief Engineer")
	department_flag = ENGSEC
	faction = "Vault"
	status = "Member"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the chief engineer"
	selection_color = "#005A20"

	outfit = /datum/outfit/job/vlt_engineer

	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
									access_external_airlocks, access_construction, access_atmospherics, access_tcomsat)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
									access_external_airlocks, access_construction, access_tcomsat)

/datum/outfit/job/vlt_engineer
	name = "Engineer"

//	gloves = /obj/item/clothing/gloves/pda/engineering
//	ears = /obj/item/device/radio/headset/headset_vlt
	uniform = /obj/item/clothing/under/f13/vault/v13
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat
	r_pocket = /obj/item/device/t_scanner

	backpack = /obj/item/weapon/storage/backpack/industrial
	satchel = /obj/item/weapon/storage/backpack/satchel
	box = /obj/item/weapon/storage/box/engineer
	pda_slot = slot_l_store
/datum/job/vlt_doctor
	title = "Medical Doctor"
	flag = DOCTOR
	department_head = list("Chief Medical Officer")
	department_flag = MEDSCI
	faction = "Vault"
	status = "Member"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the chief medical officer"
	selection_color = "#005A20"

	outfit = /datum/outfit/job/vlt_doctor

	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_mineral_storeroom)
	minimal_access = list(access_medical, access_morgue, access_surgery)

/datum/outfit/job/vlt_doctor
	name = "Medical Doctor"

//	gloves = /obj/item/clothing/gloves/pda/medical
//	ears = /obj/item/device/radio/headset/headset_vlt
	uniform = /obj/item/clothing/under/f13/vault/v13
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/toggle/labcoat
	l_hand = /obj/item/weapon/storage/firstaid/regular
	suit_store = /obj/item/device/flashlight/pen

	backpack = /obj/item/weapon/storage/backpack/medic
	satchel = /obj/item/weapon/storage/backpack/satchel

/datum/job/scientist
	title = "Scientist"
	flag = SCIENTIST
	department_head = list("Research Director")
	department_flag = MEDSCI
	faction = "Vault"
	status = "Member"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the research director"
	selection_color = "#005A20"

	outfit = /datum/outfit/job/vlt_scientist

	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom, access_tech_storage, access_genetics)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom)

/datum/outfit/job/vlt_scientist
	name = "Scientist"

//	gloves = /obj/item/clothing/gloves/pda/toxins
//	ears = /obj/item/device/radio/headset/headset_vlt
	uniform = /obj/item/clothing/under/f13/vault/v13
	//shoes = /obj/item/clothing/shoes/sneakers/white
	suit = /obj/item/clothing/suit/toggle/labcoat/science
/datum/job/vlt_officer
	title = "Security Officer"
	flag = OFFICER
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Vault"
	status = "Member"
	total_positions = 8 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	spawn_positions = 8 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	supervisors = "the head of security, and the head of your assigned department (if applicable)"
	selection_color = "#005A20"
	minimal_player_age = 7

	outfit = /datum/outfit/job/vlt_security

	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue, access_weapons, access_forensics_lockers)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court, access_weapons) //But see /datum/job/warden/get_access()

/datum/job/vlt_officer/get_access()
	var/list/L = list()
	L |= ..() | check_config_for_sec_maint()
	return L


/datum/outfit/job/vlt_security
	name = "Security Officer"

//	gloves = /obj/item/clothing/gloves/pda/security
//	ears = /obj/item/device/radio/headset/headset_vlt
	uniform = /obj/item/clothing/under/f13/vault/v13
	//gloves = /obj/item/clothing/gloves/color/black
	//head = /obj/item/clothing/head/helmet/sec
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/device/assembly/flash/handheld
//	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	backpack_contents = list(/obj/item/weapon/melee/classic_baton/telescopic=1,\
		/obj/item/weapon/restraints/handcuffs=1)

	backpack = /obj/item/weapon/storage/backpack/security
	satchel = /obj/item/weapon/storage/backpack/satchel
	box = /obj/item/weapon/storage/box/security

	var/department = null
	var/tie = null
	var/list/dep_access = null
	var/destination = null
	var/spawn_point = null

/datum/job/dweller
	title = "Vault dweller"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Vault"
	status = "Member"
	total_positions = -1
	spawn_positions = -1
	supervisors = "overseer"
	selection_color = "#005A20"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/job/dweller

/datum/job/dweller/get_access()
	if((config.jobs_have_maint_access & ASSISTANTS_HAVE_MAINT_ACCESS) || !config.jobs_have_minimal_access) //Config has assistant maint access set
		. = ..()
		. |= list(access_maint_tunnels)
	else
		return ..()

/datum/job/assistant/config_check()
	if(config && !(config.assistant_cap == 0))
		total_positions = config.assistant_cap
		spawn_positions = config.assistant_cap
		return 1
	return 0


/datum/outfit/job/dweller
	name = "Vault dweller"

/datum/outfit/job/dweller/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = /obj/item/clothing/under/f13/vault/v13
//	gloves = /obj/item/clothing/gloves/pda
//	ears = /obj/item/device/radio/headset/headset_vlt