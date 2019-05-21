//Fallout 13 Acolytes of Atom faction roles

/datum/job/ac_master
	title = "Master of the Atom"
	flag = GHOUL_MASTER
	department_flag = MEDSCI
	faction = "acolytes"
	status = "master_atom"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the atom"
	selection_color = "##204200"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/ac_master

/datum/outfit/job/ac_master
	name = "Master of the Atom"
	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null

//Priest of the Atom

/datum/job/ac_priest
	title = "Priest of the Atom"
	flag = GHOUL_PRIEST
	department_flag = MEDSCI
	faction = "acolytes"
	status = "priest_atom"
	total_positions = 10
	spawn_positions = 10
	supervisors = "the master of the atom"
	selection_color = "#204200"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/ac_priest

/datum/outfit/job/ac_priest
	name = "Priest of the Atom"
	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null

//Hand of the Atom

/datum/job/ac_hand
	title = "Hand of the Atom"
	flag = GHOUL_HAND
	department_flag = MEDSCI
	faction = "acolytes"
	status = "master_atom"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the master of the atom"
	selection_color = "#204200"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/ac_hand

/datum/outfit/job/ac_hand
	name = "Hand of the Atom"
	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null