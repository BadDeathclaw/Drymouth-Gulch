/datum/interaction/lewd/kiss
	command = "deepkiss"
	description = "Kiss them deeply."
	require_user_mouth = TRUE
	require_target_mouth = TRUE
	write_log_user = "kissed"
	write_log_target = "was kissed by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/kiss/post_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(user.lust < 5)
		user.lust = 5
	if(target.lust < 5)
		target.lust = 5

/datum/interaction/lewd/kiss/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.lust >= 3)
		user.visible_message("<span class='warning'>\The [user] gives an intense, lingering kiss to \the [target].</span>")
	else
		user.visible_message("<span class='warning'>\The [user] kisses \the [target] deeply.</span>")
