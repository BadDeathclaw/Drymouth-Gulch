/datum/outfit/job/enclave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/datum/outfit/job/enclave/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/*
Commander
*/
/datum/job/enclave/f13uscommander
	title = "US Commander"
	flag = F13USCOMMANDER
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the US Government"
	selection_color = "#aaaaf7"

	outfit = /datum/outfit/job/enclave/f13uscommander

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave/f13uscommander
	name = "US Commander"
	jobtype = /datum/job/enclave/f13uscommander

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Medic
*/
/datum/job/enclave/f13usmedic
	title = "US Medic"
	flag = F13USMEDIC
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13usmedic

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave/f13usmedic
	name = "US Medic"
	jobtype = /datum/job/enclave/f13usmedic
	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Private
*/
/datum/job/enclave/f13usprivate
	title = "US Private"
	flag = F13USPRIVATE
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13usprivate

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave/f13usprivate
	name = "US Private"
	jobtype = /datum/job/enclave/f13usprivate

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Scientist
*/
/datum/job/enclave/f13usscientist
	title = "US Scientist"
	flag = F13USSCIENTIST
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13usscientist

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave/f13usscientist
	name = "US Scientist"
	jobtype = /datum/job/enclave/f13usscientist

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Engineer
*/
/datum/job/enclave/f13usengineer
	title = "US Engineer"
	flag = F13USENGINEER
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13usengineer

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave/f13usengineer
	name = "US Engineer"
	jobtype = /datum/job/enclave/f13usengineer

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Colonist
*/
/datum/job/enclave/f13uscolonist
	title = "US Colonist"
	flag = F13USCOLONIST
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13uscolonist

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave/f13uscolonist
	name = "US Colonist"
	jobtype = /datum/job/enclave/f13uscolonist

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain
