/datum/species
	var/has_genitals = TRUE //if this goes to 2, blame coders
	var/has_anus = TRUE //same with this

/datum/species/proc/has_penis(var/mob/living/carbon/human/H)
	return has_genitals && (H.gender == MALE)

/datum/species/proc/has_vagina(var/mob/living/carbon/human/H)
	return has_genitals && (H.gender == FEMALE)

/datum/species/proc/has_anus(var/mob/living/carbon/human/H)
	return has_anus
