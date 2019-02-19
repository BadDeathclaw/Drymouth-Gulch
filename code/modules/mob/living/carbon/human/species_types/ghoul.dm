/datum/species/ghoul
	// To do:
	//Add toxin healing trait
	name = "Ghoulperson"
	id = "ghoul"
	default_color = "#FFF"
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slice.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	burnmod = 1.25
	heatmod = 1.25
	brutemod = -1.15
	punchdamagelow = 3
	punchdamagehigh = 6
	inherent_biotypes = list(MOB_UNDEAD, MOB_HUMANOID)
	inherent_traits = list(TRAIT_NOBREATH, TRAIT_RADIMMUNE)
	disliked_food = NONE
	liked_food = GROSS | MEAT | RAW

/datum/species/human/qualifies_for_rank(rank, list/features)
	return TRUE	//Pure humans are always allowed in all roles.
