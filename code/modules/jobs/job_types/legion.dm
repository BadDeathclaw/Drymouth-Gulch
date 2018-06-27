/*
Legat

Needs whitelist
*/
/datum/job/f13legate
	title = "Legate"
	flag = F13LEGATE
	department_flag = LEGION
	head_announce = list("Security")
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	req_admin_notify = 1

	outfit = /datum/outfit/job/f13legate

	access = list()
	minimal_access = list()

/datum/outfit/job/f13legate
	name = "Legate"
	jobtype = /datum/job/f13legate

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Centurion
*/
/datum/job/f13centurion
	title = "Centurion"
	flag = F13CENTURION
	department_flag = LEGION
	head_announce = list("Security")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Legate"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	minimal_player_age = 6

	outfit = /datum/outfit/job/f13centurion

/datum/outfit/job/f13centurion
	name = "Centurion"
	jobtype = /datum/job/f13centurion

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Vexillarius
*/
/datum/job/f13vexillarius
	title = "Vexillarius"
	flag = F13VEXILLARIUS
	department_flag = LEGION
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the centurion"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13vexillarius

/datum/outfit/job/f13vexillarius
	name = "Vexillarius"
	jobtype = /datum/job/f13vexillarius

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Decan
*/
/datum/job/f13decan
	title = "Decanus"
	flag = F13DECAN
	department_flag = LEGION
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "vexillarius troops"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13decan

/datum/outfit/job/f13decan
	name = "Decanus"
	jobtype = /datum/job/f13decan

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Veteran
*/
/datum/job/f13vetlegion
	title = "Veteran Legionnaire"
	flag = F13VETLEGION
	department_flag = LEGION
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "decanus troops"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13vetlegion

/datum/outfit/job/f13vetlegion
	name = "Veteran Legionnaire"
	jobtype = /datum/job/f13vetlegion

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Legionary
*/
/datum/job/f13legionary
	title = "Legionary"
	flag = F13LEGIONARY
	department_flag = LEGION
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "decanus troops"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/f13legionary

/datum/outfit/job/f13legionary
	name = "Legionary"
	jobtype = /datum/job/f13legionary

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain