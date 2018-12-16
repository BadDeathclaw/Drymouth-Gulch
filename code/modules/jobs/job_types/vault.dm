/*
Vault access doors
Overseer/Chief of security: 19 ACCESS_HEADS
Security: 1 ACCESS_SECURITY
General access: 31 ACCESS_CARGO
Engineering: 10, 11 ACCESS_ENGINE_EQUIP, ACCESS_ENGINE
Science: 47 ACCESS_RESEARCH
here's a tip, go search DEFINES/access.dm
*/

/datum/outfit/job/vaultie/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK)

/*
Overseer
*/
/datum/job/vaultie/f13overseer
	title = "Overseer"
	flag = F13OVERSEER
	department_flag = VAULT
	head_announce = list("Security")
	faction = "Vault"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Vault-Tec"
	selection_color = "#ccffcc"
	req_admin_notify = 1
	minimal_player_age = 6

	exp_requirements = 45
	exp_type = EXP_TYPE_VAULT

	outfit = /datum/outfit/job/vaultie/f13overseer

	access = list()			//See get_access()
	minimal_access = list()	//See get_access()

/datum/job/vaultie/f13overseer/get_access()
	return get_all_accesses()

/datum/outfit/job/vaultie/f13overseer
	name = "Overseer"
	jobtype = /datum/job/vaultie/f13overseer

	implants = list(/obj/item/implant/mindshield)

	id = 			/obj/item/card/id/gold
	//pda
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

/datum/job/vaultie/f13hos
	title = "Chief of Security"
	flag = F13HOS
	department_head = list("Overseer")
	department_flag = VAULT
	head_announce = list("Security")
	faction = "Vault"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the overseer"
	selection_color = "#ccffcc"
	req_admin_notify = 1
	minimal_player_age = 4
	exp_requirements = 30
	exp_type = EXP_TYPE_VAULT
	exp_type_department = EXP_TYPE_SECURITY

	outfit = /datum/outfit/job/vaultie/f13hos

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_WEAPONS,ACCESS_FORENSICS_LOCKERS,
						ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MINING, ACCESS_MEDICAL,
						ACCESS_CARGO, ACCESS_HEADS, ACCESS_HOS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_WEAPONS, ACCESS_FORENSICS_LOCKERS,
						ACCESS_MORGUE, ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MINING, ACCESS_MEDICAL, ACCESS_CARGO, ACCESS_HEADS,
						ACCESS_HOS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_MINERAL_STOREROOM)

/datum/outfit/job/vaultie/f13hos
	name = "Chief of Security"
	jobtype = /datum/job/vaultie/f13hos

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
/datum/job/vaultie/f13doctor
	title = "Vault-tec Doctor"
	flag = F13DOCTOR
	department_head = list("Overseer")
	department_flag = VAULT
	faction = "Vault"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the overseer"
	selection_color = "#ddffdd"

	outfit = /datum/outfit/job/vaultie/f13doctor

	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_MINERAL_STOREROOM, ACCESS_CARGO)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_MINERAL_STOREROOM, ACCESS_CARGO)

/datum/outfit/job/vaultie/f13doctor
	name = "Medical Doctor"
	jobtype = /datum/job/vaultie/f13doctor

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
/datum/job/vaultie/f13vaultscientist
	title = "Vault-tec Scientist"
	flag = F13VAULTSCIENTIST
	department_head = list("Overseer")
	department_flag = VAULT
	faction = "Vault"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the overseer"
	selection_color = "#ddffdd"

	outfit = /datum/outfit/job/vaultie/f13vaultscientist

	access = list(ACCESS_ROBOTICS, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM, ACCESS_TECH_STORAGE, ACCESS_CARGO)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM, ACCESS_CARGO)

/datum/outfit/job/vaultie/f13vaultscientist
	name = "Scientist"
	jobtype = /datum/job/vaultie/f13vaultscientist

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
/datum/job/vaultie/f13officer
	title = "Vault-tec Security"
	flag = F13OFFICER
	department_head = list("Chief of Security")
	department_flag = VAULT
	faction = "Vault"
	total_positions = 2 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	spawn_positions = 2 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	supervisors = "the head of security"
	selection_color = "#ddffdd"
	minimal_player_age = 1
	exp_requirements = 15
	exp_type = EXP_TYPE_VAULT

	outfit = /datum/outfit/job/vaultie/f13security

	access = list(ACCESS_CARGO, ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_FORENSICS_LOCKERS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_CARGO, ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM) //BUT SEE /DATUM/JOB/WARDEN/GET_ACCESS()



/datum/outfit/job/vaultie/f13security
	name = "Vault-tec Security"
	jobtype = /datum/job/vaultie/f13officer

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
	keyslot = new /obj/item/encryptionkey/headset_sec
	keyslot2 = new /obj/item/encryptionkey/headset_eng

/obj/item/radio/headset/headset_sec/alt/department/supply
	keyslot = new /obj/item/encryptionkey/headset_sec
	keyslot2 = new /obj/item/encryptionkey/headset_cargo

/obj/item/radio/headset/headset_sec/alt/department/med
	keyslot = new /obj/item/encryptionkey/headset_sec
	keyslot2 = new /obj/item/encryptionkey/headset_med

/obj/item/radio/headset/headset_sec/alt/department/sci
	keyslot = new /obj/item/encryptionkey/headset_sec
	keyslot2 = new /obj/item/encryptionkey/headset_sci

/*
Station Engineer
*/
/datum/job/vaultie/f13vaultengineer
	title = "Vault-tec Engineer"
	flag = F13VAULTENGINEER
	department_head = list("Overseer")
	department_flag = VAULT
	faction = "Vault"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the overseer"
	selection_color = "#ddffdd"

	outfit = /datum/outfit/job/vaultie/f13vaultengineer

	access = list(ACCESS_CARGO, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_ATMOSPHERICS, ACCESS_TCOMSAT, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_CARGO, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MINERAL_STOREROOM)

/datum/outfit/job/vaultie/f13vaultengineer
	name = "Vault-tec Engineer"
	jobtype = /datum/job/vaultie/f13vaultengineer

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


/datum/job/vaultie/f13vaultDweller
	title = "Vault Dweller"
	flag = ASSISTANT
	department_flag = VAULT
	faction = "Vault"
	total_positions = 8
	spawn_positions = 8
	supervisors = "absolutely everyone"
	selection_color = "#ddffdd"
	access = list()			//See /datum/job/vaultie/assistant/get_access()
	minimal_access = list()	//See /datum/job/vaultie/assistant/get_access()
	outfit = /datum/outfit/job/vaultie/f13vaultDweller
	//antag_rep = 7

/datum/job/vaultie/f13vaultDweller/get_access()
	if(CONFIG_GET(flag/assistants_have_maint_access) || !CONFIG_GET(flag/jobs_have_minimal_access)) //Config has assistant maint access set
		. = ..()
		. |= list(ACCESS_MAINT_TUNNELS)
	else
		return ..()

/datum/outfit/job/vaultie/f13vaultDweller
	name = "Vault Dweller"
	jobtype = /datum/job/vaultie/f13vaultDweller

/datum/outfit/job/vaultie/f13vaultDweller/pre_equip(mob/living/carbon/human/H)
	..()
	if (CONFIG_GET(flag/grey_assistants))
		uniform = /obj/item/clothing/under/f13/vault13
		ears = /obj/item/radio/headset/headset_vault
		shoes = /obj/item/clothing/shoes/jackboots
	else
		uniform = /obj/item/clothing/under/f13/vault13
		ears = /obj/item/radio/headset/headset_vault
		shoes = /obj/item/clothing/shoes/jackboots
