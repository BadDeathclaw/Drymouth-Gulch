/*
Colonel
*/
/datum/job/f13colonel
	title = "NCR Colonel"
	flag = F13COLONEL
	department_flag = NCR
	head_announce = list("Security")
	total_positions = 0
	spawn_positions = 0
	supervisors = "the general"
	selection_color = "#ffeeaa"
	req_admin_notify = 1

	outfit = /datum/outfit/job/f13colonel

	access = list()
	minimal_access = list()

/datum/outfit/job/f13colonel
	name = "NCR Colonel"
	jobtype = /datum/job/f13colonel

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Captain
*/

/datum/job/f13captain
	title = "NCR Captain"
	flag = F13CAPTAIN
	department_flag = NCR
	head_announce = list("Security")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the colonel"
	selection_color = "#ffeeaa"
	req_admin_notify = 1
	minimal_player_age = 6

	outfit = /datum/outfit/job/f13captain

	access = list()
	minimal_access = list()

/datum/outfit/job/f13captain
	name = "NCR Captain"
	jobtype = /datum/job/f13captain

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Lieutenant
*/
/datum/job/f13lieutenant
	title = "NCR Lieutenant"
	flag = F13LIEUTENANT
	department_flag = NCR
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/f13lieutenant

	access = list()
	minimal_access = list()

/datum/outfit/job/f13lieutenant
	name = "NCR Lieutenant"
	jobtype = /datum/job/f13lieutenant

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Sergeant
*/
/datum/job/f13sergeant
	title = "NCR Sergeant"
	flag = F13SERGEANT
	department_flag = NCR
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the lieutenant"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/f13sergeant

	access = list()
	minimal_access = list()

/datum/outfit/job/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/f13sergeant

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Trooper
*/
/datum/job/f13trooper
	title = "NCR Trooper"
	flag = F13TROOPER
	department_flag = NCR
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "sergeants"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/f13trooper

	access = list()
	minimal_access = list()

/datum/outfit/job/f13trooper
	name = "NCR Trooper"
	jobtype = /datum/job/f13trooper

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Recruit
*/
/datum/job/f13recruit
	title = "NCR Recruit"
	flag = F13RECRUIT
	department_flag = NCR
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "sergeants"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/f13recruit

	access = list()
	minimal_access = list()

/datum/outfit/job/f13recruit
	name = "NCR Recruit"
	jobtype = /datum/job/f13recruit

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Veteran Ranger
*/
/datum/job/f13vetranger
	title = "NCR Veteran Ranger"
	flag = F13VETRANGER
	department_flag = NCR
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the lieutenant"
	selection_color = "#ffeeaa"
	minimal_player_age = 2

	outfit = /datum/outfit/job/f13vetranger

	access = list()
	minimal_access = list()

/datum/outfit/job/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype = /datum/job/f13vetranger

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

/*
Ranger
*/
/datum/job/f13ranger
	title = "NCR Ranger"
	flag = F13RANGER
	department_flag = NCR
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the veteran ranger"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/f13ranger

	access = list()
	minimal_access = list()

/datum/outfit/job/f13ranger
	name = "NCR Ranger"
	jobtype = /datum/job/f13ranger

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

	/*
Recon Ranger
*/
/datum/job/f13recranger
	title = "NCR Recon Ranger"
	flag = F13RECRANGER
	department_flag = NCR
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the veteran ranger"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/f13recranger

	access = list()
	minimal_access = list()

/datum/outfit/job/f13recranger
	name = "NCR Recon Ranger"
	jobtype = /datum/job/f13recranger

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain