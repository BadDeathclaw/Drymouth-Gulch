/*
Sheriff
*/
/datum/job/f13sheriff
	title = "Sheriff"
	flag = F13SHERIFF
	department_flag = DEN
	head_announce = list("Security")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "no one"
	selection_color = "#d7b088"

	outfit = /datum/outfit/job/f13sheriff

/datum/outfit/job/f13sheriff
	name = "Sheriff"
	jobtype = /datum/job/f13sheriff

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain


/*
Settler
*/

/datum/job/f13settler
	title = "Settler"
	flag = F13SETTLER
	department_flag = DEN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "the sheriff"
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/f13settler

/datum/outfit/job/f13settler
	name = "Settler"
	jobtype = /datum/job/f13settler

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain
