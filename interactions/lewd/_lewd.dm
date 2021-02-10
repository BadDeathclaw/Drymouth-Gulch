#define CUM_TARGET_MOUTH "mouth"
#define CUM_TARGET_THROAT "throat"
#define CUM_TARGET_VAGINA "vagina"
#define CUM_TARGET_ANUS "anus"
#define CUM_TARGET_HAND "hand"
#define CUM_TARGET_BREASTS "breasts"
#define GRINDING_FACE_WITH_ANUS "faceanus"
#define GRINDING_FACE_WITH_FEET "facefeet"
#define GRINDING_MOUTH_WITH_FEET "mouthfeet"
#define THIGH_SMOTHERING "thigh_smother"
#define NUTS_TO_FACE "nut_face"

#define NORMAL_LUST 10
#define LOW_LUST 1

/*--------------------------------------------------
  -------------------MOB STUFF----------------------
  --------------------------------------------------
*/
//I'm sorry, lewd should not have mob procs such as life() and such in it.

/mob/living/proc/has_penis()
	return has_penis

/mob/living/proc/has_vagina()
	return has_vagina

/mob/living/proc/has_breasts()
	return has_breasts

/mob/living/proc/has_anus()
	return TRUE

/mob/living/proc/has_hand()
	if(get_num_arms() < 1)
		return FALSE
	return TRUE

/mob/living/proc/is_topless()
	if(istype(src, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = src
		if((!(H.wear_suit) || !(H.wear_suit.body_parts_covered & CHEST)) && (!(H.w_uniform) || !(H.w_uniform.body_parts_covered & CHEST)))
			return TRUE
	else
		return TRUE

/mob/living/proc/is_bottomless()
	if(istype(src, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = src
		if((!(H.wear_suit) || !(H.wear_suit.body_parts_covered & GROIN)) && (!(H.w_uniform) || !(H.w_uniform.body_parts_covered & GROIN)))
			return TRUE
	else
		return TRUE

/mob/living/proc/moan()
	if(!(prob(lust / lust_tolerance * 65)))
		return
	var/moan = rand(1, 7)
	if(moan == lastmoan)
		moan--
	if(!is_muzzled())
		visible_message("<font color=purple><B>\The [src]</B> [pick("moans", "moans in pleasure",)].</font>")
		playsound(get_turf(src), "code/game/lewd/sound/interactions/moan_[gender == FEMALE ? "f" : "m"][rand(1, 7)].ogg", 70, 1, 0)
	if(is_muzzled())//immursion
		src.emote("<font color=purple><B>[src]</B> [pick("mimes a pleasured moan","moans in silence")].</font>")
	lastmoan = moan

/mob/living/proc/cum(mob/living/partner, target_orifice)
	var/message

	if(has_penis())
		if(!istype(partner))
			target_orifice = null

		switch(target_orifice)
			if(CUM_TARGET_MOUTH)
				if(partner.has_mouth() && partner.mouth_is_free())
					message = "cums right in \the [partner]'s mouth."
					partner.reagents.add_reagent("cum", rand(8,13))
				else
					message = "cums on \the [partner]'s face."
			if(CUM_TARGET_THROAT)
				if(partner.has_mouth() && partner.mouth_is_free())
					message = "shoves deep into \the [partner]'s throat and cums."
					partner.reagents.add_reagent("cum", rand(9,15))
				else
					message = "cums on \the [partner]'s face."
			if(CUM_TARGET_VAGINA)
				if(partner.is_bottomless() && partner.has_vagina())
					message = "cums in \the [partner]'s pussy."
					partner.reagents.add_reagent("cum", rand(8,12))
				else
					message = "cums on \the [partner]'s belly."
			if(CUM_TARGET_ANUS)
				if(partner.is_bottomless() && partner.has_anus())
					message = "cums in \the [partner]'s asshole."
					partner.reagents.add_reagent("cum", rand(8,12))
				else
					message = "cums on \the [partner]'s backside."
			if(CUM_TARGET_HAND)
				if(partner.has_hand())
					message = "cums in \the [partner]'s hand."
				else
					message = "cums on \the [partner]."
			if(CUM_TARGET_BREASTS)
				if(partner.is_topless() && partner.has_vagina())
					message = "cums onto \the [partner]'s breasts."
				else
					message = "cums on \the [partner]'s chest and neck."
			if(NUTS_TO_FACE)

				if(partner.has_mouth() && partner.mouth_is_free())

					message = "vigorously ruts their nutsack into \the [partner]'s mouth before shooting their thick, sticky jizz all over their eyes and hair."

			if(THIGH_SMOTHERING)
				if(src.has_penis())

					message = "keeps \the [partner] locked in their thighs as their cock throbs, dumping its heavy load all over their face."

				else

					message = "reaches their peak, locking their legs around \the [partner]'s head extra hard as they cum straight onto the head stuck between their thighs"

			else
				message = "cums on the floor!"

		lust = 5
		lust_tolerance += 50

	else
		message = pick("cums violently!", "twists in orgasm.")
		lust -= pick(10, 15, 20, 25)

	if(gender == MALE)
		playsound(loc, "honk/sound/interactions/final_m[rand(1, 3)].ogg", 90, 1, 0)//, pitch = get_age_pitch())
	else if(gender == FEMALE)
		playsound(loc, "honk/sound/interactions/final_f[rand(1, 5)].ogg", 70, 1, 0)//, pitch = get_age_pitch())

	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	multiorgasms += 1

	if(multiorgasms == 1)
		add_logs(partner, src, "came on")

	if(multiorgasms > (sexual_potency * 0.34)) //AAAAA, WE DONT WANT NEGATIVES HERE, RE
		refactory_period = rand(250, 400) - sexual_potency//sex cooldown
		src.set_drugginess(rand(20, 30))
	else
		refactory_period = rand(250, 400) - sexual_potency
		src.set_drugginess(rand(5, 10))

/mob/living/proc/is_fucking(mob/living/partner, orifice)
	if(partner == last_partner && orifice == last_orifice)
		return TRUE
	return FALSE

/mob/living/proc/set_is_fucking(mob/living/partner, orifice)
	last_partner = partner
	last_orifice = orifice

/mob/living/proc/do_fucking_animation(fuckdir) // Today I wrote 'var/fuckdir' with a straight face. Not a milestone I ever expected to pass. dont worry, we dont use heretic proc/name(var/dir)
	if(!fuckdir)
		return

	dir = fuckdir
	var/pixel_x_diff = 0
	var/pixel_y_diff = 0
	var/final_pixel_y = initial(pixel_y)

	if(fuckdir & NORTH)
		pixel_y_diff = 8
	else if(fuckdir & SOUTH)
		pixel_y_diff = -8

	if(fuckdir & EAST)
		pixel_x_diff = 8
	else if(fuckdir & WEST)
		pixel_x_diff = -8

	if(pixel_x_diff == 0 && pixel_y_diff == 0)
		pixel_x_diff = rand(-3,3)
		pixel_y_diff = rand(-3,3)
		animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 2)
		return

	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = initial(pixel_x), pixel_y = final_pixel_y, time = 2)
