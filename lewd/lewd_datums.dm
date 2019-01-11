/datum/interaction/lewd/kiss
	command = "deepkiss"
	description = "Kiss them deeply."
	require_user_mouth = TRUE
	write_log_user = "kissed"
	write_log_target = "was kissed by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/kiss/post_interaction(mob/user, mob/target)
	. = ..()
	if(user.lust < 5)
		user.lust = 5
	if(target.lust < 5)
		target.lust = 5

/datum/interaction/lewd/kiss/evaluate_user(mob/user, silent = TRUE)
	if(..())
		//if(!user.has_lips())
		//	if(!silent) user << "<span class='warning'>You don't have any lips.</span>")
		//	return FALSE
		return TRUE
	return FALSE

/datum/interaction/lewd/kiss/display_interaction(mob/user, mob/target)
	if(user.lust >= 3)
		user.visible_message("<span class='warning'>\The [user] gives an intense, lingering kiss to \the [target].</span>")
	else
		user.visible_message("<span class='warning'>\The [user] kisses \the [target] deeply.</span>")

/datum/interaction/lewd/titgrope
	command = "titgrope"
	description = "Grope their breasts."
	require_target_breasts = TRUE
	write_log_user = "groped"
	write_log_target = "was groped by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/titgrope/post_interaction(mob/user, mob/target)
	. = ..()
	if(user.lust < 5)
		user.lust = 5

/datum/interaction/lewd/titgrope/display_interaction(mob/user, mob/target)
	if(user.a_intent == INTENT_HELP)
		user.visible_message("<span class='warning'>\The [user] gently gropes \the [target]'s breasts.</span>")
	else if(user.a_intent == INTENT_HARM)
		user.visible_message("<span class='warning'>\The [user] aggressively gropes \the [target]'s breasts.</span>")

/datum/interaction/lewd/oral
	command = "suckvag"
	description = "Go down on them."
	require_user_mouth = TRUE
	require_target_vagina = TRUE
	write_log_user = "gave head to"
	write_log_target = "was given head by"
	interaction_sound = null
	user_not_tired = TRUE
	require_target_naked = TRUE
	max_distance = 0

/datum/interaction/lewd/oral/display_interaction(mob/user, mob/target)
	user.do_oral(target)

/datum/interaction/lewd/oral/blowjob
	command = "suckcock"
	description = "Suck them off."
	require_target_vagina = FALSE
	require_target_penis = TRUE
	target_not_tired = TRUE

/datum/interaction/lewd/fuck
	command = "fuckvag"
	description = "Fuck their pussy."
	require_user_penis = TRUE
	require_target_vagina = TRUE
	write_log_user = "fucked"
	write_log_target = "was fucked by"
	interaction_sound = null
	user_not_tired = TRUE
	require_user_naked = TRUE
	require_target_naked = TRUE
	max_distance = 0

/datum/interaction/lewd/fuck/display_interaction(mob/user, mob/target)
	user.do_vaginal(target)

/datum/interaction/lewd/fuck/anal
	command = "fuckass"
	description = "Fuck their ass."
	require_target_vagina = FALSE
	require_target_anus = TRUE
	user_not_tired = TRUE

/datum/interaction/lewd/fuck/anal/display_interaction(mob/user, mob/target)
	user.do_anal(target)

/datum/interaction/lewd/finger
	command = "finger"
	description = "Finger their pussy."
	require_user_hands = TRUE
	require_target_vagina = TRUE
	interaction_sound = null
	user_not_tired = TRUE
	require_target_naked = TRUE
	max_distance = 0

/datum/interaction/lewd/finger/display_interaction(mob/user, mob/target)
	user.do_fingering(target)

/datum/interaction/lewd/fingerass
	command = "fingerm"
	description = "Finger their ass."
	interaction_sound = null
	require_user_hands = TRUE
	require_target_anus = TRUE
	user_not_tired = TRUE
	require_target_naked = TRUE
	max_distance = 0

/datum/interaction/lewd/fingerass/display_interaction(mob/user, mob/target)
	user.do_fingerass(target)


/datum/interaction/lewd/facefuck
	command = "facefuck"
	description = "Fuck their mouth."
	interaction_sound = null
	require_target_mouth = TRUE
	user_not_tired = TRUE
	require_user_naked = TRUE
	max_distance = 0

/datum/interaction/lewd/facefuck/display_interaction(mob/user, mob/target)
	user.do_facefuck(target)

/datum/interaction/lewd/throatfuck
	command = "throatfuck"
	description = "Fuck their throat. | Does oxy damage."
	interaction_sound = null
	require_user_penis = TRUE
	require_target_mouth = TRUE
	user_not_tired = TRUE
	require_user_naked = TRUE
	max_distance = 0

/datum/interaction/lewd/throatfuck/display_interaction(mob/user, mob/target)
	user.do_throatfuck(target)

/datum/interaction/lewd/handjob
	command = "handjob"
	description = "Jerk them off."
	interaction_sound = null
	require_user_hands = TRUE
	require_target_penis = TRUE
	target_not_tired = TRUE
	require_target_naked = TRUE
	max_distance = 1

/datum/interaction/lewd/handjob/display_interaction(mob/user, mob/target)
	user.do_handjob(target)

/datum/interaction/lewd/breastfuck
	command = "breastfuck"
	description = "Fuck their breasts."
	interaction_sound = null
	require_user_penis = TRUE
	user_not_tired = TRUE
	require_user_naked = TRUE
	require_target_naked = TRUE
	require_target_vagina = TRUE
	max_distance = 0

/datum/interaction/lewd/breastfuck/display_interaction(mob/user, mob/target)
	user.do_breastfuck(target)

/datum/interaction/lewd/mount
	command = "mount"
	description = "Mount with your pussy."
	interaction_sound = null
	require_user_vagina = TRUE
	require_target_penis = TRUE
	user_not_tired = TRUE
	target_not_tired = TRUE
	require_user_naked = TRUE
	require_target_naked = TRUE
	max_distance = 0

/datum/interaction/lewd/mount/display_interaction(mob/user, mob/target)
	user.do_mount(target)

/datum/interaction/lewd/mountass
	command = "mountm"
	description = "Mount with your ass."
	interaction_sound = null
	require_user_vagina = FALSE
	require_user_anus = TRUE
	require_target_penis = TRUE
	user_not_tired = TRUE
	target_not_tired = TRUE
	require_user_naked = TRUE
	require_target_naked = TRUE
	max_distance = 0

/datum/interaction/lewd/mountass/display_interaction(mob/user, mob/target)
	user.do_mountass(target)

/datum/interaction/lewd/rimjob
	command = "rimjob"
	description = "Lick their ass."
	interaction_sound = null
	require_user_mouth = TRUE
	require_target_anus = TRUE
	user_not_tired = TRUE
	require_target_naked = TRUE
	max_distance = 0

/datum/interaction/lewd/rimjob/display_interaction(mob/user, mob/target)
	user.do_rimjob(target)

/datum/interaction/lewd/mountface
	command = "mountface"
	description = "Ass to face."
	interaction_sound = null
	require_target_mouth = TRUE
	require_user_anus = TRUE
	user_not_tired = TRUE
	require_user_naked = TRUE
	max_distance = 0

/datum/interaction/lewd/mountface/display_interaction(mob/user, mob/target)
	user.do_mountface(target)

/datum/interaction/lewd/lickfeet
	command = "lickfeet"
	description = "Lick their feet."
	interaction_sound = null
	require_user_mouth = TRUE
	max_distance = 1

/datum/interaction/lewd/lickfeet/display_interaction(mob/user, mob/target)
	user.do_lickfeet(target)

/datum/interaction/lewd/grindface
	command = "grindface"
	description = "Feet grind their face."
	interaction_sound = null
	require_target_mouth = TRUE
	max_distance = 0

/datum/interaction/lewd/grindface/display_interaction(mob/user, mob/target)
	user.do_grindface(target)

/datum/interaction/lewd/grindmouth
	command = "grindmouth"
	description = "Feet grind their mouth."
	interaction_sound = null
	require_target_mouth = TRUE
	max_distance = 0

/datum/interaction/lewd/grindmouth/display_interaction(mob/user, mob/target)
	user.do_grindmouth(target)
	

/datum/interaction/lewd/thighs
	command = "thigh_smother"
	description = "Smother them."
	max_distance = 0
	require_user_naked = TRUE
	require_target_mouth = TRUE
	interaction_sound = null
	user_not_tired = TRUE
	write_log_user = "thigh-trapped"
	write_log_target = "was smothered by"

 
/datum/interaction/lewd/thighs/display_interaction(var/mob/user, var/mob/target) 
    user.thigh_smother(target)
	
/datum/interaction/lewd/nuts
	command = "nuts"
	description = "Nuts to face."
	interaction_sound = null
	require_user_naked = TRUE
	require_user_penis = TRUE
	require_target_mouth = TRUE
	max_distance = 0
	write_log_user = "make-them-suck-their-nuts"
	write_log_target = "was made to suck nuts by"



/datum/interaction/lewd/nuts/display_interaction(var/mob/user, var/mob/target)
	user.do_nuts(target)
