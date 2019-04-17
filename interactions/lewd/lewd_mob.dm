/*--------------------------------------------------
  -------------------MOB STUFF----------------------
  --------------------------------------------------
*/
/mob/living/carbon/proc/has_penis()
	return FALSE

/mob/living/carbon/proc/has_vagina()
	return FALSE

/mob/living/carbon/proc/has_breasts()
	return FALSE

/mob/living/carbon/proc/has_anus()
	return FALSE

/mob/living/carbon/proc/is_topless()
	return TRUE

/mob/living/carbon/proc/is_bottomless()
	return TRUE

/mob/living/carbon/human/has_penis()
	return has_penis

/mob/living/carbon/human/has_vagina()
	return has_vagina

/mob/living/carbon/human/has_breasts()
	return has_breasts

/mob/living/carbon/human/has_anus()
	return TRUE

/mob/living/carbon/human/is_topless()
	if((!(wear_suit) || !(wear_suit.body_parts_covered & CHEST)) && (!(w_uniform) || !(w_uniform.body_parts_covered & CHEST)))
		return TRUE

/mob/living/carbon/human/is_bottomless()
	if((!(wear_suit) || !(wear_suit.body_parts_covered & GROIN)) && (!(w_uniform) || !(w_uniform.body_parts_covered & GROIN)))
		return TRUE

/mob/living/carbon		//we can have this legaly here
	var/has_penis = FALSE
	var/has_vagina = FALSE
	var/has_breasts = FALSE

	var/last_partner
	var/last_orifice
	var/lastmoan

	var/sexual_potency =  15
	var/lust_tolerance = 100
	var/lust = 0
	var/multiorgasms = 0
	var/refactory_period	//hey you? yes USE WORLD.TIME YOU SHITS

/mob/living/carbon/human/Initialize()
	sexual_potency = (prob(80) ? rand(9, 14) : pick(rand(5, 13), rand(15, 20)))
	lust_tolerance = (prob(80) ? rand(150, 300) : pick(rand(10, 100), rand(350,600)))
	
	if(gender == MALE)
		has_penis = TRUE
		has_vagina = FALSE
		has_breasts = FALSE
	if(gender == FEMALE)
		has_vagina = TRUE
		has_breasts = TRUE
		has_penis = FALSE
	..()