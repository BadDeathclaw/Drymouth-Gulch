//Fallout 13 playable ghouls directory

/datum/species/ghoul
	name = "Ghoul"
	id = "ghoul"
	limbs_id = "ghoul"
	race_color = "#984500"
	roundstart = 1
	armor = -30
	speedmod = 0.5
	brutemod = 1.2
	punchdamagehigh = 6
	punchstunthreshold = 6
	use_skintones = 0
	species_traits = list(RADIMMUNE, NOBLOOD, VIRUSIMMUNE)
	sexes = 0

/datum/species/ghoul/qualifies_for_faction(faction_id)
	if(faction_id == "legion" || faction_id == "city")
		return 0
	return 1

//Ghouls have weak limbs.
/datum/species/ghoul/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	for(var/obj/item/bodypart/b in C.bodyparts)
		b.max_damage -= 10
	C.faction |= "ghoul"
/datum/species/ghoul/on_species_loss(mob/living/carbon/C)
	..()
	C.faction -= "ghoul"
	for(var/obj/item/bodypart/b in C.bodyparts)
		b.max_damage = initial(b.max_damage)

/datum/species/ghoul/glowing
	name = "Glowing Ghoul"
	id = "glowing ghoul"
	limbs_id = "glowghoul"
	roundstart = 0
	armor = -30
	speedmod = 0.5
	brutemod = 1.3
	punchdamagehigh = 6
	punchstunthreshold = 6
	use_skintones = 0
	species_traits = list(RADIMMUNE, NOBLOOD, VIRUSIMMUNE)
	sexes = 0

//Ghouls have weak limbs.
/datum/species/ghoul/glowing/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	for(var/obj/item/bodypart/b in C.bodyparts)
		b.max_damage -= 15
	C.faction |= "ghoul"
	C.set_light(2, 1, LIGHT_COLOR_GREEN)
	SSradiation.processing += C

/datum/species/ghoul/glowing/on_species_loss(mob/living/carbon/C)
	..()
	C.set_light(0)
	C.faction -= "ghoul"
	for(var/obj/item/bodypart/b in C.bodyparts)
		b.max_damage = initial(b.max_damage)
	SSradiation.processing -= C