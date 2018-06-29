/*
Commander
*/
/datum/job/f13uscommander
	title = "US Commander"
	flag = F13USCOMMANDER
	department_flag = ENCLAVE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the US Government"
	selection_color = "#aaaaf7"
	minimal_player_age = 6

	outfit = /datum/outfit/job/f13uscommander

	access = list()
	minimal_access = list()

/datum/outfit/job/f13uscommander
	name = "US Commander"
	jobtype = /datum/job/f13uscommander

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Medic
*/
/datum/job/f13usmedic
	title = "US Medic"
	flag = F13USMEDIC
	department_flag = ENCLAVE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commander"
	selection_color = "#ccccff"
	minimal_player_age = 3

	outfit = /datum/outfit/job/f13usmedic

	access = list()
	minimal_access = list()

/datum/outfit/job/f13usmedic
	name = "US Medic"
	jobtype = /datum/job/f13usmedic

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Private
*/
/datum/job/f13usprivate
	title = "US Private"
	flag = F13USPRIVATE
	department_flag = ENCLAVE
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the commander"
	selection_color = "#ccccff"
	minimal_player_age = 3

	outfit = /datum/outfit/job/f13usprivate

	access = list()
	minimal_access = list()

/datum/outfit/job/f13usprivate
	name = "US Private"
	jobtype = /datum/job/f13usprivate

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Scientist
*/
/datum/job/f13usscientist
	title = "US Scientist"
	flag = F13USSCIENTIST
	department_flag = ENCLAVE
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the commander"
	selection_color = "#ccccff"
	minimal_player_age = 3

	outfit = /datum/outfit/job/f13usscientist

	access = list()
	minimal_access = list()

/datum/outfit/job/f13usscientist
	name = "US Scientist"
	jobtype = /datum/job/f13usscientist

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Engineer
*/
/datum/job/f13usengineer
	title = "US Engineer"
	flag = F13USENGINEER
	department_flag = ENCLAVE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commander"
	selection_color = "#ccccff"
	minimal_player_age = 3

	outfit = /datum/outfit/job/f13usengineer

	access = list()
	minimal_access = list()

/datum/outfit/job/f13usengineer
	name = "US Engineer"
	jobtype = /datum/job/f13usengineer

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Colonist
*/
/datum/job/f13uscolonist
	title = "US Colonist"
	flag = F13USCOLONIST
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the commander"
	selection_color = "#ccccff"
	minimal_player_age = 3

	outfit = /datum/outfit/job/f13uscolonist

	access = list()
	minimal_access = list()

/datum/outfit/job/f13uscolonist
	name = "US Colonist"
	jobtype = /datum/job/f13uscolonist

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

