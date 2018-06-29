/*
Elder
*/
/datum/job/f13elder
	title = "Elder"
	flag = F13ELDER
	department_flag = BOS
	head_announce = list("Security")
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the high elders"
	selection_color = "#7f8c8d"
	req_admin_notify = 1

	outfit = /datum/outfit/job/f13elder

	access = list()
	minimal_access = list()

/datum/outfit/job/f13elder
	name = "Elder"
	jobtype = /datum/job/f13elder

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Paladin
*/

/datum/job/f13paladin
	title = "Paladin"
	flag = F13PALADIN
	department_flag = BOS
	head_announce = list("Security")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the elder"
	selection_color = "#95a5a6"
	minimal_player_age = 2

	outfit = /datum/outfit/job/f13paladin

	access = list()
	minimal_access = list()

/datum/outfit/job/f13paladin
	name = "Paladin"
	jobtype = /datum/job/f13paladin

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Knight
*/
/datum/job/f13knight
	title = "Knight"
	flag = F13KNIGHT
	department_flag = BOS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the elder"
	selection_color = "#95a5a6"
	minimal_player_age = 2

	outfit = /datum/outfit/job/f13knight

	access = list()
	minimal_access = list()

/datum/outfit/job/f13knight
	name = "Knight"
	jobtype = /datum/job/f13knight

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Scribe
*/
/datum/job/f13scribe
	title = "Scribe"
	flag = F13SCRIBE
	department_flag = BOS
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the elder"
	selection_color = "#95a5a6"


	outfit = /datum/outfit/job/f13scribe

	access = list()
	minimal_access = list()

/datum/outfit/job/f13scribe
	name = "Scribe"
	jobtype = /datum/job/f13scribe

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Initiate
*/
/datum/job/f13initiate
	title = "Initiate"
	flag = F13INITIATE
	department_flag = BOS
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the scribes and knights"
	selection_color = "#95a5a6"


	outfit = /datum/outfit/job/f13initiate

	access = list()
	minimal_access = list()

/datum/outfit/job/f13initiate
	name = "Initiate"
	jobtype = /datum/job/f13initiate

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain