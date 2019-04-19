					   //MouseDrop_T(atom/dropping, mob/user)
/mob/living/carbon/human/MouseDrop_T(target as mob, mob/living/carbon/human/user)
	if(QDELETED(target))
		return
	//user != src and !usr.restrained() is handeld by 'try_interaction'
	user.try_interaction(target)

/mob/living/carbon/human/verb/interact_with()
	set name = "Interact With"
	set desc = "Perform an interaction with someone."
	set category = "IC"
	set src in view()

	if(QDELETED(src)) //they're about to qdel, let's not innteract them
		return
	//user != src and !usr.restrained() is handeld by 'try_interaction'
	usr.try_interaction(src)

/mob/proc/try_interaction()
	return


/mob/living/carbon/human/try_interaction(mob/living/carbon/human/partner)
	if(src.stat == DEAD || isdead(src))
		to_chat(src, "<span class='warning'>You cannot interact while being dead!</span>")
		src << browse(null, "window=interactions")	//close
		return
	if(src.IsUnconscious() || src.stat == UNCONSCIOUS)
		to_chat(src, "<span class='warning'>You cannot interact while being unconscious!</span>")
		src << browse(null, "window=interactions")	//close
		return
	if(src == partner)
		to_chat(src, "<span class='warning'>You cannot interact with youself!</span>")
		return
	if(!src.restrained())
		to_chat(src, "<span class='warning'>You are currently restrained!!</span>")
		src << browse(null, "window=interactions")	//close
		return

	var/dat = "<B><HR><FONT size=3>Interacting with \the [partner]...</FONT></B><HR>"
	dat += "You...<br>[list_interaction_attributes()]<hr>"
	dat += "They...<br>[partner.list_interaction_attributes()]<hr>"

	make_interactions()
	for(var/interaction_key in interactions)
		var/datum/interaction/I = interactions[interaction_key]
		if(I.evaluate_user(src) && I.evaluate_target(src, partner))
			dat += I.get_action_link_for(src, partner)

	var/datum/browser/popup = new(usr, "interactions", "Interactions", 340, 480)
	popup.set_content(dat)
	popup.open()

	return ..()