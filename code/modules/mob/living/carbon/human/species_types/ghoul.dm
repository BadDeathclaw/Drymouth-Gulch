/datum/species/ghoul
	name = "Ghoul"
	id = "ghoul"
	limbs_id = "ghoul"
	species_traits = list(HAIR,FACEHAIR)
	inherent_traits = list(TRAIT_RADIMMUNE)
	inherent_biotypes = list(MOB_INORGANIC, MOB_HUMANOID)
	armor = -25 // very weak fag 100-25 = 85hp + the weak limbs is a big oof!
	speedmod = -0.5 //little fast
	burnmod = 0.25 // Leather skinless boys
	brutemod = 1.2 //weaker fags
	punchdamagehigh = 0
	punchstunthreshold = 6
	use_skintones = 0
	sexes = 1 //Now they have a gender
	disliked_food = GROSS
	liked_food = JUNKFOOD | FRIED | RAW

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

/*/datum/species/ghoul/glowing
	name = "Glowing Ghoul"
	id = "glowing ghoul"
	limbs_id = "glowghoul"
	armor = -30
	speedmod = 0.5
	brutemod = 1.3
	punchdamagehigh = 6
	punchstunthreshold = 6
	use_skintones = 0
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

*/
