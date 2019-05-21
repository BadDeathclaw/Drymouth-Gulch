/*
/datum/species/bigmutant
	name = "Supermutant"
	id = "bigmutant"
	say_mod = "shouts"
	default_color = "D5FF00"
	roundstart = 1
	brutemod = 0.2
	burnmod = 0.25
	speedmod = 3
	armor = 20
	specflags = list(EYECOLOR)
	mutant_bodyparts = list()
	default_features = list("mcolor" = "FFF")
	use_skintones = 0
	specflags = list(RADIMMUNE, PIERCEIMMUNE)
	var/canshout = 0

/datum/species/bigmutant/handle_body(mob/living/carbon/human/H)
	H.remove_overlay(BODY_LAYER)

	var/list/standing	= list()

	handle_mutant_bodyparts(H)

	// eyes
	if(EYECOLOR in specflags)
		var/image/img_eyes_s = image("icon" = 'icons/mob/human_face.dmi', "icon_state" = "[eyes]_s", "layer" = -BODY_LAYER)
		img_eyes_s.color = "#" + H.eye_color
		standing	+= img_eyes_s

	if(standing.len)
		H.overlays_standing[BODY_LAYER] = standing

	H.apply_overlay(BODY_LAYER)
	return


/datum/species/bigmutant/spec_life(mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/hulk_jump
	H.verbs += /mob/living/carbon/human/proc/hulk_dash
	H.verbs += /mob/living/carbon/human/proc/hulk_smash
	if (canshout==0)
		H.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ))
		canshout = rand(50, 100)
	else
		canshout = canshout - 1
*/