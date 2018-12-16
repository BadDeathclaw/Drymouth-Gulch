/*
Commander
*/
/datum/job/enclavef13uscommander
	title = "US Commander"
	flag = F13USCOMMANDER
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the US Government"
	selection_color = "#aaaaf7"
	minimal_player_age = 6

	outfit = /datum/outfit/job/enclavef13uscommander

	access = list()
	minimal_access = list()

/datum/outfit/job/enclavef13uscommander
	name = "US Commander"
	jobtype = /datum/job/enclavef13uscommander

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Medic
*/
/datum/job/enclavef13usmedic
	title = "US Medic"
	flag = F13USMEDIC
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commander"
	selection_color = "#ccccff"
	minimal_player_age = 3

	outfit = /datum/outfit/job/enclavef13usmedic

	access = list()
	minimal_access = list()

/datum/outfit/job/enclavef13usmedic
	name = "US Medic"
	jobtype = /datum/job/enclavef13usmedic

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Private
*/
/datum/job/enclavef13usprivate
	title = "US Private"
	flag = F13USPRIVATE
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the commander"
	selection_color = "#ccccff"
	minimal_player_age = 3

	outfit = /datum/outfit/job/enclavef13usprivate

	access = list()
	minimal_access = list()

/datum/outfit/job/enclavef13usprivate
	name = "US Private"
	jobtype = /datum/job/enclavef13usprivate

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Scientist
*/
/datum/job/enclavef13usscientist
	title = "US Scientist"
	flag = F13USSCIENTIST
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the commander"
	selection_color = "#ccccff"
	minimal_player_age = 3

	outfit = /datum/outfit/job/enclavef13usscientist

	access = list()
	minimal_access = list()

/datum/outfit/job/enclavef13usscientist
	name = "US Scientist"
	jobtype = /datum/job/enclavef13usscientist

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Engineer
*/
/datum/job/enclavef13usengineer
	title = "US Engineer"
	flag = F13USENGINEER
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commander"
	selection_color = "#ccccff"
	minimal_player_age = 3

	outfit = /datum/outfit/job/enclavef13usengineer

	access = list()
	minimal_access = list()

/datum/outfit/job/enclavef13usengineer
	name = "US Engineer"
	jobtype = /datum/job/enclavef13usengineer

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Colonist
*/
/datum/job/enclavef13uscolonist
	title = "US Colonist"
	flag = F13USCOLONIST
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the commander"
	selection_color = "#ccccff"
	minimal_player_age = 3

	outfit = /datum/outfit/job/enclavef13uscolonist

	access = list()
	minimal_access = list()

/datum/outfit/job/enclavef13uscolonist
	name = "US Colonist"
	jobtype = /datum/job/enclavef13uscolonist

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain
