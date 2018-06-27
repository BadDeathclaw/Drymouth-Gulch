/*
Cult Leader
*/
/datum/job/f13cultleader
	title = "Cult Leader"
	flag = F13CULTLEADER
	department_flag = WASTELAND
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "your God"
	selection_color = "#ffddf0"

	outfit = /datum/outfit/job/f13cultleader

/datum/outfit/job/f13cultleader
	name = "Cult Leader"
	jobtype = /datum/job/f13cultleader

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Wastelander
*/

/datum/job/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	department_flag = WASTELAND
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/f13wastelander

/datum/outfit/job/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/f13wastelander

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Raider
*/

/datum/job/f13raider
	title = "Raider"
	flag = F13RAIDER
	department_head = list("Captain")
	department_flag = WASTELAND
	head_announce = list("Security")
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/f13raider

	access = list()
	minimal_access = list()

/datum/outfit/job/f13raider
	name = "Raider"
	jobtype = /datum/job/f13raider

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Pusher
*/

/datum/job/f13pusher
	title = "Pusher"
	flag = F13PUSHER
	department_head = list("Captain")
	department_flag = WASTELAND
	head_announce = list("Security")
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/f13pusher

	access = list()
	minimal_access = list()

/datum/outfit/job/f13pusher
	name = "Pusher"
	jobtype = /datum/job/f13pusher

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Preacher
*/

/datum/job/f13preacher
	title = "Preacher"
	flag = F13PREACHER
	department_head = list("Captain")
	department_flag = WASTELAND
	head_announce = list("Security")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/f13preacher

	access = list()
	minimal_access = list()

/datum/outfit/job/f13preacher
	name = "Preacher"
	jobtype = /datum/job/f13preacher

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Trader
*/

/*
/datum/job/f13traider
	title = "Traider"
	flag = F13TRAIDER
	department_head = list("Captain")
	department_flag = WASTELAND
	head_announce = list("Security")
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "no one"
	selection_color = "#ffdddd"

	outfit = /datum/outfit/job/f13traider

	access = list()
	minimal_access = list()

/datum/outfit/job/f13traider
	name = "Traider"
	jobtype = /datum/job/f13traider

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

*/