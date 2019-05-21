//Fallout 13 - We work in the dark, to serve the light. We are Assassins.

/datum/f13_objective/assassinate
	name = "Assassin's Creed"
	desc = "You were hired by a secret society to make a specific person vanish."
	kind = BOTH

	check_mob(mob/living/carbon/human/H)
		if(!..())
			return 0
		if(ticker.minds.len < 2)
			return 0
		return 1

	check_faction(datum/f13_faction/faction)
		if(faction.id != "raiders")
			return 0
		var/list/correct_targets = get_targets_for_faction(faction)
		if(!correct_targets.len)
			return 0
		return 1

	assignto_mind(datum/mind/M, var/list/data = list())
		var/list/minds = shuffle(ticker.minds)
		var/datum/mind/target
		for(var/datum/mind/mind in minds)
			if(mind != M && mind.current && mind.current.stat != DEAD)
				target = mind
				break
		if(target == M)
			CRASH("Same minds for assassinate objective")
		data["target"] = target
		data["target_rank"] = target.assigned_role
		data["custom_desc"] = "Your target is <b>%target%</b>, the <b>%target_rank%</b>"
		..()

	assignto_faction(datum/f13_faction/F, var/list/data = list())
		var/list/targets = get_targets_for_faction(F)
		if(!targets.len)
			CRASH("Can't find correct target for [F]")
		var/mob/living/mob = pick(targets)
		var/datum/mind/target = mob.mind
		data["target"] = target
		data["target_rank"] = target.assigned_role
		data["custom_desc"] = "Your target is <b>%target%</b>, the <b>%target_rank%</b>"
		..()

	check_complete(var/datum/objective_holder/holder)
		if(!holder || !holder.data["target"])
			return 1
		var/datum/mind/target = holder.data["target"]
		if(target.current.stat == DEAD)
			return 1
		return 0


	proc/get_targets_for_faction(datum/f13_faction/faction)
		var/list/targets = list()
		for(var/f_name in human_factions)
			if(f_name != faction.id)
				var/datum/f13_faction/target = human_factions[f_name]
				for(var/mob/living/mob in get_mobs_by_status(target.head_status))
					if(mob.mind)
						targets += mob
		return targets