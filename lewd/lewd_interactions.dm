// If I could have gotten away with using a tilde in the type path, I would have.
/datum/interaction/lewd
	command = "assslap"
	description = "Slap their ass."
	simple_message = "USER slaps TARGET right on the ass!"
	simple_style = "danger"
	interaction_sound = 'honk/sound/interactions/slap.ogg'
	needs_physical_contact = TRUE
	max_distance = 1

	write_log_user = "ass-slapped"
	write_log_target = "was ass-slapped by"

	var/user_not_tired
	var/target_not_tired

	var/require_user_naked
	var/require_target_naked

	var/require_user_penis
	var/require_user_anus
	var/require_user_vagina

	var/require_target_penis
	var/require_target_anus
	var/require_target_vagina
	var/require_target_breasts

	var/user_refactory_cost
	var/target_refactory_cost

/datum/interaction/lewd/evaluate_user(mob/user, silent = TRUE)
	if(..(user, silent))
		if(user_not_tired && user.refactory_period)
			user << "<span class='warning'>You're still exhausted from the last time.</span>"
			return FALSE
		if(require_user_naked && !user.is_nude())
			if(!silent) user << "<span class = 'warning'>Your clothes are in the way.</span>"
			return FALSE
		if(require_user_penis && !user.has_penis())
			if(!silent) user << "<span class = 'warning'>You don't have a penis.</span>"
			return FALSE
		if(require_user_anus && !user.has_anus())
			if(!silent) user << "<span class = 'warning'>You don't have an anus.</span>"
			return FALSE
		if(require_user_vagina && !user.has_vagina())
			if(!silent) user << "<span class = 'warning'>You don't have a vagina.</span>"
			return FALSE
		return TRUE
	return FALSE

/datum/interaction/lewd/evaluate_target(mob/user, mob/target, silent = TRUE)
	if(..(user, target, silent))
		if(target_not_tired && target.refactory_period)
			user << "<span class='warning'>They're still exhausted from the last time.</span>"
			return FALSE
		if(require_target_naked && !target.is_nude())
			if(!silent) user << "<span class = 'warning'>Their clothes are in the way.</span>"
			return FALSE
		if(require_target_penis && !target.has_penis())
			if(!silent) user << "<span class = 'warning'>They don't have a penis.</span>"
			return FALSE
		if(require_target_anus && !target.has_anus())
			if(!silent) user << "<span class = 'warning'>They don't have an anus.</span>"
			return FALSE
		if(require_target_vagina && !target.has_vagina())
			if(!silent) user << "<span class = 'warning'>They don't have a vagina.</span>"
			return FALSE
		return TRUE
	return FALSE

/datum/interaction/lewd/post_interaction(mob/user, mob/target)
	if(user_refactory_cost)
		user.refactory_period += user_refactory_cost
	if(target_refactory_cost)
		target.refactory_period += target_refactory_cost
	return ..()

/datum/interaction/lewd/get_action_link_for(mob/user, mob/target)
	return "<font color='#FF0000'><b>LEWD:</b></font> [..()]"
	if(user.stat == DEAD)
		return

/mob/list_interaction_attributes()
	var/dat = ..()
	if(refactory_period)
		dat += "<br>...are sexually exhausted for the time being."
	if(is_nude())
		dat += "<br>...are naked."
		if(has_breasts())
			dat += "<br>...have breasts."
		if(has_penis())
			dat += "<br>...have a penis."
		if(has_vagina())
			dat += "<br>...have a vagina."
		if(has_anus())
			dat += "<br>...have an anus."
	else
		dat += "<br>...are clothed."
	return dat