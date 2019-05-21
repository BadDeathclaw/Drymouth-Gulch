/mob
	var/status = "none"
	var/list/allow_recipes = list()

var/human_status = list()

proc/get_status_datum(status)
	if(!human_status[status])
		return null
	return human_status[status]

proc/remove_everyone_from_status(status)
	var/datum/status/S = get_status_datum(status)
	if(!S)
		return 0
	for(var/mob/M in world)
		if(M.status == S.id)
			M.set_status("none")

proc/get_mobs_by_status(status)
	. = list()
	var/datum/status/S = get_status_datum(status)
	if(!S)
		return .
	for(var/mob/M in world)
		if(M.status == S.id)
			. += M


/datum/status
	var/name = "UNKNOWN"
	var/id = "none"

	var/desc = ""

	var/welcome_text = ""

	var/verbs = list()

	var/change_faction = 1

	var/purge_faction = null

	var/list/can_invite_to = new()

	var/can_invite_to_himself = 0

	var/color = "#171717"

	var/craft_recipes = list()

	var/flag = null

/datum/status/New()
	..()
	if(can_invite_to_himself)
		can_invite_to += "[name]"
	if(id != "none")
		verbs += /mob/proc/leave_faction
	if(can_invite_to.len)
		verbs += /mob/proc/convert_to_status

mob/proc/set_status(var/status)
	var/datum/status/S = get_status_datum(status)
	var/datum/status/last_S = get_status_datum(src.status)
	if(!S)
		return 0
	if(last_S)
		src.verbs -= last_S.verbs
		src.allow_recipes -= last_S.craft_recipes


	src.status = S.id
	var/text
	text += "<span class='notice'>Now you are <span style='color: [S.color];'>[S.name]</span>.</span>"
	if(S.welcome_text)
		text += "<br>[S.welcome_text]"
	to_chat(src, text)
	src.verbs += S.verbs
	src.allow_recipes += S.craft_recipes
	if(S.purge_faction != null)
		src.set_faction(S.purge_faction)

	return 1

/mob/proc/leave_faction()
	set name = "Leave Faction"
	set category = "Faction"
	if(status == "none")
		return
	if(alert("Are you sure you want to leave?",,"Yes","No")=="No")
		return
	set_status("none")


/mob/proc/convert_to_status(mob/M in oview(), status in get_can_invite_status())
	set name = "Invite To"
	set category = "Faction"
	if(!M.mind || !M.client)
		return
	if(M.status == status)
		return
	if(alert(M, "[src] invites you to be [status].",,"Yes","No")=="No")
		to_chat(src, "<span class='warning'>[M.name] refused the offer to join a faction.</span>")
		return
	else
		to_chat(src, "<span class='notice'>[M.name] accepted the offer to join a faction.</span>")
	var/datum/status/S = get_status_datum(status)
	if(S && S.change_faction && M.social_faction != src.social_faction)
		M.set_faction(src.social_faction)
		var/datum/f13_faction/F = get_faction_datum(src.social_faction)
		to_chat(M, "<span class='notice'>You have joined the <span style='color: [F.color];'>[F.name]</span> faction.</span>")
		if(F.welcome_text)
			to_chat(M, "<br>[F.welcome_text]")
	M.set_status(status)
	to_chat(M, "<span class='notice'>Now you are <span style='color: [S.color];'>[S.name]</span>.</span>")
	if(S.welcome_text)
		to_chat(M, "<br>[S.welcome_text]")

/mob/proc/get_can_invite_status()
	var/datum/status/S = get_status_datum(src.status)
	return S.can_invite_to

//***Status***

/datum/status/recruit
	name = "Recruit"
	id = "recruit"
	change_faction = 1

/datum/status/prime
	name = "Prime"
	id = "prime"
	change_faction = 1
	color = "#A6423B"

/datum/status/decanus
	name = "Decanus"
	id = "decanus"
	change_faction = 1
	can_invite_to = list("recruit", "prime")
	color = "#A6423B"

/datum/status/vexillarius
	name = "Vexillarius"
	id = "vexillarius"
	change_faction = 1
	can_invite_to = list("recruit", "prime", "decanus")
//	craft_recipes = list(/datum/table_recipe/legion_vex_armor, /datum/table_recipe/legion_vex_helm)
	color = "#983C36"

/datum/status/centurion
	name = "Centurion"
	id = "centurion"
	change_faction = 1
	can_invite_to = list("recruit", "prime", "decanus", "vexillarius")
//	craft_recipes = list(/datum/table_recipe/legion_cent_armor, /datum/table_recipe/legion_cent_helm)
	color = "#8D3731"

/datum/status/legate
	name = "Legate"
	id = "legate"
	change_faction = 1
	can_invite_to = list("recruit", "prime", "decanus", "vexillarius", "centurion")
//	craft_recipes = list(/datum/table_recipe/legion_legat_armor, /datum/table_recipe/legion_legat_helm, \
	/datum/table_recipe/legion_legat_gloves, /datum/table_recipe/legion_legat_shoes)
	color = "#7A302A"

/datum/status/vranger
	name = "Veteran Ranger"
	id = "vranger"
	change_faction = 1
	color = "#020070"

/datum/status/ncr_general
	name = "General"
	id = "ncr_general"
	change_faction = 1
	can_invite_to = list("recruit", "trooper", "ncr_sergeant")
	color = "#02005C"

/datum/status/ncr_sergeant
	name = "Sergeant"
	id = "ncr_sergeant"
	change_faction = 1
	color = "#02005C"

/datum/status/trooper
	name = "Trooper"
	id = "trooper"
	change_faction = 1
	color = "#02005C"

/datum/status/elite_trooper
	name = "Elite Trooper"
	id = "etrooper"
	change_faction = 1
	color = "#02005C"

/datum/status/raider
	name = "Raider"
	id = "raider"
	purge_faction = "raiders"
	color = "#FF0000"

/datum/status/gangleader
	name = "Gang Leader"
	id = "gangleader"
	purge_faction = "raiders"
	can_invite_to = list("raider")
	color = "#FF0000"

//	craft_recipes = list(/datum/table_recipe/raider_yankee_armor, /datum/table_recipe/raider_supafly_armor, \
	/datum/table_recipe/raider_supafly_helmet, /datum/table_recipe/raider_yankee_helmet)

/datum/status/neutral
	name = "Neutral"
	id = "none"
	purge_faction = "none"

/datum/status/member
	name = "Member"
	id = "member"
	change_faction = 1

/datum/status/sheriff
	name = "Sheriff"
	id = "sheriff"
	can_invite_to = list("member")
	purge_faction = "city"
	color = "#704200"

/datum/status/mayor
	name = "Mayor"
	id = "mayor"
	can_invite_to = list("member", "sheriff")
	purge_faction = "city"
	color = "#704200"

/datum/status/overseer
	name = "Overseer"
	id = "overseer"
	can_invite_to = list("member")
	purge_faction = "vault"
	color = "#00491A"

//Acolytes

/datum/status/atom_master
	name = "Master"
	id = "master_atom"
	can_invite_to = list("hand_atom", "priest_atom")
	purge_faction = "acolytes"
	color = "#4fa102"

/datum/status/atom_hand
	name = "Hand"
	id = "hand_atom"
	purge_faction = "acolytes"
	color = "#438702"

/datum/status/atom_priest
	name = "Priest"
	id = "priest_atom"
	purge_faction = "acolytes"
	color = "#306300"

//Enclave

/datum/status/colonel
	name = "Colonel"
	id = "colonel"
	can_invite_to = list("enclave_sergeant", "private", "volunteer")
	purge_faction = "enclave"
	color = "#000"

/datum/status/enclave_sergeant
	name = "Sergeant"
	id = "enclave_sergeant"
	purge_faction = "enclave"
	color = "#000"

/datum/status/private
	name = "Private"
	id = "private"
	purge_faction = "enclave"
	color = "#000"

/datum/status/volunteer
	name = "Volunteer"
	id = "volunteer"
	purge_faction = "enclave"
	color = "#000"

//Brotherhood

/datum/status/elder
	name = "Elder"
	id = "elder"
	can_invite_to = list("paladin", "knight", "scriber", "initiate")
	purge_faction = "bs"
	color = "#13306d"

/datum/status/paladin
	name = "Paladin"
	id = "paladin"
	purge_faction = "bs"
	color = "#13306d"

/datum/status/knight
	name = "Knight"
	id = "knight"
	purge_faction = "bs"
	color = "#13306d"

/datum/status/scriber
	name = "Scriber"
	id = "scriber"
	purge_faction = "bs"
	color = "#13306d"

/datum/status/initiate
	name = "Initiate"
	id = "initiate"
	purge_faction = "bs"
	color = "#13306d"