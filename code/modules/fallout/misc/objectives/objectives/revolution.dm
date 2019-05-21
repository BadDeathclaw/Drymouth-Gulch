//Fallout 13 - Hasta siempre, Comandante

/datum/f13_objective/revolution
	name = "Viva La Revolucion"
	desc = "The time has come to change the world!<br>Take control of your faction and become a %status_name%."
	points = 0
	kind = INDIVIDUAL

	check_mob(mob/living/carbon/human/H)
		var/datum/f13_faction/faction = get_faction_datum(H.social_faction)
		if(!faction.head_status)
			return 0
		return 1

	assignto_mind(datum/mind/M, var/list/data = list())
		var/mob/living/mob = M.current
		var/datum/f13_faction/faction = get_faction_datum(mob.social_faction)
		var/datum/status/status = get_status_datum(faction.head_status)
		data["target_status"] = status.id
		data["status_name"] = status.name
		..()

	check_complete(var/datum/objective_holder/holder)
		var/datum/mind/mind = holder.owner
		var/mob/living/mob = mind.current
		if(mob.status != holder.data["target_status"])
			return 0
		return 1