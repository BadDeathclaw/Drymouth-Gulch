//Fallout 13 dynamic quest system

/datum/f13_objective
	var
		name = "Objective"
		desc = "Objective description"
		points = 0
		kind = BOTH
		list/available_factions = list("all")
		list/available_roles = list("all")

		list/datum/objective_holder/holders = list()
	proc
		//Check can mob take this objective
		check_mob(mob/living/carbon/human/H)
			if(!available_factions.Find("all") && !available_factions.Find(H.social_faction))
				return 0
			if(!available_roles.Find("all") && !available_roles.Find(H.status))
				return 0
			return 1

		check_faction(datum/f13_faction/faction)
			if(!available_factions.Find("all") && !available_factions.Find(faction.id))
				return 0
			return 1

		assignto(subject, var/list/data = list())
			if(istype(subject, /datum/mind))
				assignto_mind(subject, data)
			else if(istype(subject, /datum/f13_faction))
				assignto_faction(subject, data)

		assignto_mind(datum/mind/M, var/list/data = list())
			var/datum/objective_holder/holder = new /datum/objective_holder(M, src, data)
			M.objective = holder
			holders += holder

			to_chat(M.current, "<span class='notice'>Your current objective is: <b>[name]</b></span>")
			to_chat(M.current, FormatText("\t<i>[desc]<i>", data))
			if(data["custom_desc"])
				to_chat(M.current, "\t[FormatText(data["custom_desc"],data)]")

		assignto_faction(datum/f13_faction/F, var/list/data = list())
			var/datum/objective_holder/holder = new /datum/objective_holder(F, src, data)
			F.objective = holder
			holders += holder
			for(var/member in F.members)
				to_chat(member, "<span class='notice'>Your current <i>faction</i> objective is: <b>[name]</b></span>")
				to_chat(member, FormatText("\t<i>[desc]<i>", data))
				if(data["custom_desc"])
					to_chat(member, "\t[FormatText(data["custom_desc"],data)]")

		check_complete(var/datum/objective_holder/holder)
			return 1