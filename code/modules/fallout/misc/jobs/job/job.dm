/datum/job

	var/status = "none"

	var/whitelist_on = 0

	var/disallowed_gender = 0

/datum/job/proc/is_gender_allowed(client/client)
	if(!client)
		return 0
	if(client.prefs.gender == disallowed_gender)
		return 0
	return 1