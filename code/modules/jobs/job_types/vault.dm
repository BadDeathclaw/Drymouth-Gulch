/*
Vault access doors
Overseer/Chief of security: 19 ACCESS_HEADS
Security: 1 ACCESS_SECURITY
General access: 31 ACCESS_CARGO
Engineering: 10, 11 ACCESS_ENGINE_EQUIP, ACCESS_ENGINE
Science: 47 ACCESS_RESEARCH
here's a tip, go search DEFINES/access.dm
*/
// I swear to god stop copy-pasting you damn snowflakes
/datum/job/vault
	department_flag = VAULT
	exp_type = EXP_TYPE_VAULT

/datum/outfit/job/vault
	gloves = /obj/item/pda

/datum/outfit/job/vault/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)


/datum/outfit/job/vault/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/*
Overseer
*/
/datum/job/vault/f13overseer
	title = "Overseer"
	flag = F13OVERSEER
	department_flag = VAULT
	head_announce = list("Security")
	faction = "Vault"
	total_positions = 1
	spawn_positions = 1
	forbids = "The vault forbids: Harming other Vault Dwellers. Dereliction of duty. Leaving the Vault unless there is no other choice."
	enforces = "The vault expects: Obeying the Overseer. Adherence to VaultTec Corporate Regulations. Participation in special projects (the vaults experiment, which you wont know about.)"
	description = "You are the leader of the Vault and the direct superior to the Chief Of Security, working with them and your fellow vault dwellers, your goal is to ensure the continued prosperity and survival of the vault through whatever means are at your disposal. "
	supervisors = "Vault-Tec"
	selection_color = "#ccffcc"
	req_admin_notify = 1
	exp_requirements = 2160

	outfit = /datum/outfit/job/vault/f13overseer

	access = list()			//See get_access()
	minimal_access = list()	//See get_access()

/datum/job/vault/f13overseer/get_access()
	return get_all_accesses()

/datum/outfit/job/vault/f13overseer
	name = "Overseer"
	jobtype = /datum/job/vault/f13overseer

	implants = list(/obj/item/implant/mindshield)

	id = 			/obj/item/card/id/gold
	uniform = 		/obj/item/clothing/under/f13/vault13
	shoes = 		/obj/item/clothing/shoes/jackboots
	glasses = 		/obj/item/clothing/glasses/sunglasses
	ears = 			/obj/item/radio/headset/headset_overseer
	shoes = 		/obj/item/clothing/shoes/sneakers/brown
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(/obj/item/storage/box/ids = 1, /obj/item/melee/oldstyle = 1)

///datum/outfit/f13overseer/post_equip(mob/living/carbon/human/H)
	//..()
	//var/obj/item/radio/headset/heads/captain/R = H.ears
	//R.set_frequency(FREQ_F13_VAULT)
	//R.freqlock = TRUE
	//R.independent = TRUE
	//H.dna.species.stunmod = 0

/*
Head of Security
*/

/datum/job/vault/f13hos
	title = "Chief of Security"
	flag = F13HOS
	department_head = list("Overseer")
	department_flag = VAULT
	head_announce = list("Security")
	faction = "Vault"
	total_positions = 1
	spawn_positions = 1
	forbids = "The vault forbids: Harming other Vault Dwellers. Dereliction of duty. Leaving the Vault unless there is no other choice."
	enforces = "The vault expects: Obeying the Overseer. Adherence to VaultTec Corporate Regulations. Participation in special projects (the vaults experiment, which you wont know about.)"
	description = "You answer directly to the Overseer, organising the safety, security and readiness of the Vault. If the time comes, you are in charge of organising and preparing an expedition team for the Wasteland. Until such a time, you keep your Vault ready and safe, training capable dwellers in the usage of weapons, issuing permits for their usage."
	supervisors = "the overseer"
	selection_color = "#ccffcc"
	req_admin_notify = 1
	exp_requirements = 960
	exp_type = EXP_TYPE_SECURITY

	outfit = /datum/outfit/job/vault/f13hos

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_WEAPONS,ACCESS_FORENSICS_LOCKERS,
						ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MINING, ACCESS_MEDICAL,
						ACCESS_CARGO, ACCESS_HEADS, ACCESS_HOS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_WEAPONS, ACCESS_FORENSICS_LOCKERS,
						ACCESS_MORGUE, ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MINING, ACCESS_MEDICAL, ACCESS_CARGO, ACCESS_HEADS,
						ACCESS_HOS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_MINERAL_STOREROOM)

/datum/outfit/job/vault/f13hos
	name = "Chief of Security"
	jobtype = /datum/job/vault/f13hos

	id = /obj/item/card/id/silver
	//pda
	ears = 			/obj/item/radio/headset/headset_vault_hos/alt
	uniform = 		/obj/item/clothing/under/f13/vault13
	shoes = 		/obj/item/clothing/shoes/jackboots
	suit = 			/obj/item/clothing/suit/armor/vest/alt
	head = 			/obj/item/clothing/head/collectable/police/cos
	glasses = 		/obj/item/clothing/glasses/hud/security/sunglasses
	l_hand =		/obj/item/shield/riot
	r_pocket = 		/obj/item/assembly/flash/handheld
	l_pocket = 		/obj/item/restraints/handcuffs
	backpack = 		/obj/item/storage/backpack/security
	satchel = 		/obj/item/storage/backpack/satchel/sec
	duffelbag = 	/obj/item/storage/backpack/duffelbag/sec
	box = 			/obj/item/storage/box/security
	backpack_contents = list(/obj/item/melee/oldstyle = 1, /obj/item/restraints/handcuffs = 2)

	implants = list(/obj/item/implant/mindshield)


/*
Medical Doctor
*/
/datum/job/vault/f13doctor
	title = "Vault-tec Doctor"
	flag = F13DOCTOR
	department_head = list("Overseer")
	department_flag = VAULT
	faction = "Vault"
	total_positions = 2
	spawn_positions = 2
	forbids = "The vault forbids: Harming other Vault Dwellers. Dereliction of duty. Leaving the Vault unless there is no other choice."
	enforces = "The vault expects: Obeying the Overseer. Adherence to VaultTec Corporate Regulations. Participation in special projects (the vaults experiment, which you wont know about.)"
	description = "You answer directly to the Overseer, administering medical aid to your fellow vault dwellers, you also work around the clock to produce the vital medicines and compounds needed to keep your department running. "
	supervisors = "the overseer"
	selection_color = "#ddffdd"
	exp_requirements = 540

	outfit = /datum/outfit/job/vault/f13doctor

	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_MINERAL_STOREROOM, ACCESS_CARGO)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_MINERAL_STOREROOM, ACCESS_CARGO)

/datum/outfit/job/vault/f13doctor
	name = "Medical Doctor"
	jobtype = /datum/job/vault/f13doctor
	chemwhiz = TRUE
	//pda
	uniform = 		/obj/item/clothing/under/f13/vault13
	ears = 			/obj/item/radio/headset/headset_vault
	shoes = 		/obj/item/clothing/shoes/jackboots
	suit =			/obj/item/clothing/suit/toggle/labcoat
	l_hand = 		/obj/item/storage/firstaid/regular
	suit_store = 	/obj/item/flashlight/pen
	backpack = 		/obj/item/storage/backpack/medic
	satchel = 		/obj/item/storage/backpack/satchel/med
	duffelbag = 	/obj/item/storage/backpack/duffelbag/med


/*
Scientist
*/
/datum/job/vault/f13vaultscientist
	title = "Vault-tec Scientist"
	flag = F13VAULTSCIENTIST
	department_head = list("Overseer")
	department_flag = VAULT
	faction = "Vault"
	total_positions = 2
	spawn_positions = 2
	forbids = "The vault forbids: Harming other Vault Dwellers. Dereliction of duty. Leaving the Vault unless there is no other choice."
	enforces = "The vault expects: Obeying the Overseer. Adherence to VaultTec Corporate Regulations. Participation in special projects (the vaults experiment, which you wont know about.)"
	description = "You answer directly to the Overseer, conducting vital research for the denizens of the vault, you spend your days pouring over pre-war blueprints in the hopes of revitalizing the sciences of the old world. "
	supervisors = "the overseer"
	selection_color = "#ddffdd"
	exp_requirements = 360

	outfit = /datum/outfit/job/vault/f13vaultscientist

	access = list(ACCESS_ROBOTICS, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM, ACCESS_TECH_STORAGE, ACCESS_CARGO)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM, ACCESS_CARGO)

/datum/outfit/job/vault/f13vaultscientist
	name = "Scientist"
	jobtype = /datum/job/vault/f13vaultscientist

	//pda
	uniform = 		/obj/item/clothing/under/f13/vault13
	ears = 			/obj/item/radio/headset/headset_vault
	shoes = 		/obj/item/clothing/shoes/jackboots
	suit =			/obj/item/clothing/suit/toggle/labcoat
	backpack = 		/obj/item/storage/backpack/science
	satchel = 		/obj/item/storage/backpack/satchel/tox

/*
Security Officer
*/
/datum/job/vault/f13officer
	title = "Vault-tec Security"
	flag = F13OFFICER
	department_head = list("Chief of Security")
	department_flag = VAULT
	faction = "Vault"
	total_positions = 2 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	spawn_positions = 2 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	forbids = "The vault forbids: Harming other Vault Dwellers. Dereliction of duty. Leaving the Vault unless there is no other choice."
	enforces = "The vault expects: Obeying the Overseer. Adherence to VaultTec Corporate Regulations. Participation in special projects (the vaults experiment, which you wont know about.)"
	description = "You answer directly to the Chief Of Security, acting as the first line of defense against civil unrest and outside intrusion, you enforce the laws created by the Overseer, while proactively seeking out potential threats to the safety of vault residents."
	supervisors = "the head of security"
	selection_color = "#ddffdd"
	exp_requirements = 480

	outfit = /datum/outfit/job/vault/f13security

	access = list(ACCESS_CARGO, ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_FORENSICS_LOCKERS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_CARGO, ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM) //BUT SEE /DATUM/JOB/WARDEN/GET_ACCESS()


/datum/job/vault/f13officer/get_access()
	var/list/L = list()
	L |= ..() | check_config_for_sec_maint()
	return L

/datum/job/vault/f13officer/after_spawn(mob/living/carbon/human/H, mob/M)
	// Assign department security
	var/department
	if(M && M.client && M.client.prefs)
		department = M.client.prefs.prefered_security_department
		if(!LAZYLEN(GLOB.available_depts) || department == "None")
			return
		else if(department in GLOB.available_depts)
			LAZYREMOVE(GLOB.available_depts, department)
		else
			department = pick_n_take(GLOB.available_depts)
	var/ears = null
	var/accessory = null
	var/list/dep_access = null
	var/destination = null
	var/spawn_point = null
	switch(department)
		if(SEC_DEPT_SUPPLY)
			ears = /obj/item/radio/headset/headset_sec/alt/department/supply
			dep_access = list(ACCESS_MAILSORTING, ACCESS_MINING, ACCESS_MINING_STATION)
			destination = /area/security/checkpoint/supply
			spawn_point = locate(/obj/effect/landmark/start/depsec/supply) in GLOB.department_security_spawns
			accessory = /obj/item/clothing/accessory/armband/cargo
		if(SEC_DEPT_ENGINEERING)
			ears = /obj/item/radio/headset/headset_sec/alt/department/engi
			dep_access = list(ACCESS_CONSTRUCTION, ACCESS_ENGINE)
			destination = /area/security/checkpoint/engineering
			spawn_point = locate(/obj/effect/landmark/start/depsec/engineering) in GLOB.department_security_spawns
			accessory = /obj/item/clothing/accessory/armband/engine
		if(SEC_DEPT_MEDICAL)
			ears = /obj/item/radio/headset/headset_sec/alt/department/med
			dep_access = list(ACCESS_MEDICAL)
			destination = /area/security/checkpoint/medical
			spawn_point = locate(/obj/effect/landmark/start/depsec/medical) in GLOB.department_security_spawns
			accessory =  /obj/item/clothing/accessory/armband/medblue
		if(SEC_DEPT_SCIENCE)
			ears = /obj/item/radio/headset/headset_sec/alt/department/sci
			dep_access = list(ACCESS_RESEARCH)
			destination = /area/security/checkpoint/science
			spawn_point = locate(/obj/effect/landmark/start/depsec/science) in GLOB.department_security_spawns
			accessory = /obj/item/clothing/accessory/armband/science

	if(accessory)
		var/obj/item/clothing/under/U = H.w_uniform
		U.attach_accessory(new accessory)
	if(ears)
		if(H.ears)
			qdel(H.ears)
		H.equip_to_slot_or_del(new ears(H),SLOT_EARS)

	var/obj/item/card/id/W = H.wear_id
	W.access |= dep_access

	var/teleport = 0
	if(!CONFIG_GET(flag/sec_start_brig))
		if(destination || spawn_point)
			teleport = 1
	if(teleport)
		var/turf/T
		if(spawn_point)
			T = get_turf(spawn_point)
			H.Move(T)
		else
			var/safety = 0
			while(safety < 25)
				T = safepick(get_area_turfs(destination))
				if(T && !H.Move(T))
					safety += 1
					continue
				else
					break
	if(department)
		to_chat(M, "<b>You have been assigned to [department]!</b>")
	else
		to_chat(M, "<b>You have not been assigned to any department. Patrol the halls and help where needed.</b>")



/datum/outfit/job/vault/f13security
	name = "Vault-tec Security"
	jobtype = /datum/job/vault/f13officer

	//pda
	ears = 			/obj/item/radio/headset/headset_vaultsec
	uniform = 		/obj/item/clothing/under/f13/vault13
	head = 			/obj/item/clothing/head/helmet/riot/vaultsec
	suit =			/obj/item/clothing/suit/armor/vest/alt
	shoes = 		/obj/item/clothing/shoes/jackboots
	l_hand =		/obj/item/shield/riot
	l_pocket = 		/obj/item/restraints/handcuffs
	r_pocket = 		/obj/item/assembly/flash/handheld
	backpack = 		/obj/item/storage/backpack/security
	satchel = 		/obj/item/storage/backpack/satchel/sec
	duffelbag = 	/obj/item/storage/backpack/duffelbag/sec
	box = 			/obj/item/storage/box/security
	backpack_contents = list(/obj/item/melee/oldstyle = 1, /obj/item/restraints/handcuffs = 1)

	implants = list(/obj/item/implant/mindshield)


/obj/item/radio/headset/headset_sec/alt/department/Initialize()
	. = ..()
	wires = new/datum/wires/radio(src)
	secure_radio_connections = new
	recalculateChannels()

/obj/item/radio/headset/headset_sec/alt/department/engi
	keyslot = new /obj/item/encryptionkey/headset_vault_security
	keyslot2 = new /obj/item/encryptionkey/headset_eng

/obj/item/radio/headset/headset_sec/alt/department/supply
	keyslot = new /obj/item/encryptionkey/headset_vault_security
	keyslot2 = new /obj/item/encryptionkey/headset_cargo

/obj/item/radio/headset/headset_sec/alt/department/med
	keyslot = new /obj/item/encryptionkey/headset_vault_security
	keyslot2 = new /obj/item/encryptionkey/headset_med

/obj/item/radio/headset/headset_sec/alt/department/sci
	keyslot = new /obj/item/encryptionkey/headset_vault_security
	keyslot2 = new /obj/item/encryptionkey/headset_sci

/*
Vault Engineer
*/
/datum/job/vault/f13vaultengineer
	title = "Vault-tec Engineer"
	flag = F13VAULTENGINEER
	department_head = list("Overseer")
	department_flag = VAULT
	faction = "Vault"
	total_positions = 2
	spawn_positions = 2
	forbids = "The vault forbids: Harming other Vault Dwellers. Dereliction of duty. Leaving the Vault unless there is no other choice."
	enforces = "The vault expects: Obeying the Overseer. Adherence to VaultTec Corporate Regulations. Participation in special projects (the vaults experiment, which you wont know about.)"
	description = "You answer directly to the Overseer, tasked with the maintenance of the vaults defenses and machinery, while also overseeing the smooth operation of its generators and electrical systems."
	supervisors = "the overseer"
	selection_color = "#ddffdd"
	exp_requirements = 180

	outfit = /datum/outfit/job/vault/f13vaultengineer

	access = list(ACCESS_CARGO, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_ATMOSPHERICS, ACCESS_TCOMSAT, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_CARGO, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MINERAL_STOREROOM)

/datum/outfit/job/vault/f13vaultengineer
	name = "Vault-tec Engineer"
	jobtype = /datum/job/vault/f13vaultengineer

	//pda
	ears = 			/obj/item/radio/headset/headset_vault
	uniform = 		/obj/item/clothing/under/f13/vault13
	belt = 			/obj/item/storage/belt/utility/full/engi
	shoes = 		/obj/item/clothing/shoes/workboots
	head = 			/obj/item/clothing/head/hardhat
	r_pocket = 		/obj/item/t_scanner
	backpack = 		/obj/item/storage/backpack/industrial
	satchel = 		/obj/item/storage/backpack/satchel/eng
	duffelbag = 	/obj/item/storage/backpack/duffelbag/engineering
	box = 			/obj/item/storage/box/engineer



/datum/job/vault/f13vaultDweller
	title = "Vault Dweller"
	flag = ASSISTANT
	department_flag = VAULT
	faction = "Vault"
	total_positions = 8
	spawn_positions = 8
	forbids = "The vault forbids: Harming other Vault Dwellers. Dereliction of duty. Leaving the Vault unless there is no other choice."
	enforces = "The vault expects: Obeying the Overseer. Adherence to VaultTec Corporate Regulations. Participation in special projects (the vaults experiment, which you wont know about.)"
	description = "You answer directly to the Overseer, being assigned to fulfill whatever menial tasks are required. You lack an assignment, but may be given one the Overseer if required or requested. You should otherwise busy yourself with assisting personnel with tasks around the Vault."
	supervisors = "absolutely everyone"
	selection_color = "#ddffdd"
	access = list()			//See /datum/job/vault/assistant/get_access()
	minimal_access = list()	//See /datum/job/vault/assistant/get_access()
	exp_requirements = 900
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/vault/f13vaultDweller

/datum/job/vault/f13vaultDweller/get_access()
	if(CONFIG_GET(flag/assistants_have_maint_access) || !CONFIG_GET(flag/jobs_have_minimal_access)) //Config has assistant maint access set
		. = ..()
		. |= list(ACCESS_MAINT_TUNNELS)
	else
		return ..()

/datum/outfit/job/vault/f13vaultDweller
	name = "Vault Dweller"
	jobtype = /datum/job/vault/f13vaultDweller

/datum/outfit/job/vault/f13vaultDweller/pre_equip(mob/living/carbon/human/H)
	..()
	if (CONFIG_GET(flag/grey_assistants))
		uniform = /obj/item/clothing/under/f13/vault13
		ears = /obj/item/radio/headset/headset_vault
		shoes = /obj/item/clothing/shoes/jackboots
	else
		uniform = /obj/item/clothing/under/f13/vault13
		ears = /obj/item/radio/headset/headset_vault
		shoes = /obj/item/clothing/shoes/jackboots


/datum/job/vault/New()
	..()
	if(SSmapping.config.map_name == "Pahrump")
		total_positions = 0
		spawn_positions = 0 
