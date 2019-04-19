/**********************************
*******Interactions code by HONKERTRON feat TestUnit********
**Contains a lot ammount of ERP and MEHANOYEBLYA**
**CREDIT TO ATMTA STATION FOR MOST OF THIS CODE, I ONLY MADE IT WORK IN /vg/ - Matt
** Rewritten 30/08/16 by Zuhayr, sry if I removed anything important.
**I removed ERP and replaced it with handholding. Nothing of worth was lost. - Vic
**Fuck you, Vic. ERP is back. - TT
**>using var/ on everything, also TRUE
***********************************/
// Rectum? Damn near killed 'em.

GLOBAL_LIST(interactions)

/proc/make_interactions(interaction)
	LAZYINITLIST(GLOB.interactions)	//code removed here was basicaly doing lazyinitlist
	for(var/itype in subtypesof(/datum/interaction))
		var/datum/interaction/I = new itype()
		LAZYSET(GLOB.interactions, I.command, I)

/mob/living/carbon/human/proc/list_interaction_attributes()
	var/dat = ""
	if(has_hands())
		dat += "...have hands."
	if(has_mouth())
		if(dat != "")
			dat += "<br>"
		dat += "...have a mouth, which is [mouth_is_free() ? "uncovered" : "covered"]."
	return dat

/datum/interaction
	var/command = "interact"
	var/description = "Interact with them."
	var/simple_message
	var/simple_style = "notice"
	var/write_log_user
	var/write_log_target

	var/interaction_sound

	var/max_distance = 1
	var/require_user_mouth
	var/require_user_hands
	var/require_target_mouth
	var/require_target_hands
	var/needs_physical_contact

/datum/interaction/proc/evaluate_user(mob/living/carbon/human/user, silent = TRUE)
	if(require_user_mouth)
		if(!user.has_mouth())
			if(!silent)
				to_chat(user, "<span class = 'warning'>You don't have a mouth.</span>")
			return FALSE

		if(!user.mouth_is_free())
			if(!silent)
				to_chat(user, "<span class = 'warning'>Your mouth is covered.</span>")
			return FALSE

	if(require_user_hands && !user.has_hands())
		if(!silent)
			to_chat(user, "<span class = 'warning'>You don't have hands.</span>")
		return FALSE

	return TRUE

/datum/interaction/proc/evaluate_target(mob/living/carbon/human/user, mob/living/carbon/human/target, silent = TRUE)
	if(require_target_mouth)
		if(!target.has_mouth())
			if(!silent)
				to_chat(user, "<span class = 'warning'>They don't have a mouth.</span>")
			return FALSE

		if(!target.mouth_is_free())
			if(!silent)
				to_chat(user, "<span class = 'warning'>Their mouth is covered.</span>")
			return FALSE

	if(require_target_hands && !target.has_hands())
		if(!silent)
			to_chat(user, "<span class = 'warning'>They don't have hands.</span>")
		return FALSE

	return TRUE

/datum/interaction/proc/get_action_link_for(mob/living/carbon/human/user, mob/living/carbon/human/target)
	return "<a HREF='byond://?src=[REF(src)];action=1;action_user=[REF(user)];action_target=[REF(target)]'>[description]</a><br>"

/datum/interaction/Topic(href, href_list)
	if(..())
		return TRUE
	if(href_list["action"])
		do_action(locate(href_list["action_user"]), locate(href_list["action_target"]))
		return TRUE
	return FALSE

/datum/interaction/proc/do_action(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target) //tactical href fix.
		to_chat(user, "<span class='warning'>You cannot target yourself!</span>")
		return
	if(get_dist(user, target) > max_distance)
		user.visible_message("<span class='warning'>They are too far away.</span>")
		return
	if(needs_physical_contact && !(user.Adjacent(target) && target.Adjacent(user)))
		user.visible_message("<span class='warning'>You cannot get to them.</span>")
		return
	if(!evaluate_user(user, silent = FALSE))
		return
	if(!evaluate_target(user, target, silent = FALSE))
		return

	if(write_log_user)
		log_emote("[write_log_user] [target]")	//#logbus comming thorugh
	if(write_log_target)
		log_emote("[write_log_target] [user]")

	display_interaction(user, target)
	post_interaction(user, target)

/datum/interaction/proc/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(simple_message)
		var/use_message = replacetext(simple_message, "USER", "\the [user]")
		use_message = replacetext(use_message, "TARGET", "\the [target]")
		user.visible_message("<span class='[simple_style]'>[capitalize(use_message)]</span>")

/datum/interaction/proc/post_interaction(mob/living/carbon/user, mob/living/carbon/target)
	var/delay = 0
	if(delay >= world.time) //cooldown
		return
	//start the cooldown even if it fails
	delay = world.time + 15 // 3/4 second nerf, 20 = 1 second

	if(interaction_sound)
		playsound(get_turf(user), interaction_sound, 50, 1, -1)
	return