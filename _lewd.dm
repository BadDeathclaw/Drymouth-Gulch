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

/mob/living/carbon/human/proc/has_penis()
	return has_penis

/mob/living/carbon/human/proc/has_vagina()
	return has_vagina

/mob/living/carbon/human/proc/has_breasts()
	return has_breasts

/mob/living/carbon/human/proc/has_anus()
	return TRUE

/mob/living/carbon/human/proc/has_hand()
	if(get_num_arms() < 1)
		return FALSE
	return TRUE

/mob/living/carbon/human/proc/is_topless()
	if((!(wear_suit) || !(wear_suit.body_parts_covered & CHEST)) && (!(w_uniform) || !(w_uniform.body_parts_covered & CHEST)))
		return TRUE

/mob/living/carbon/human/proc/is_bottomless()
	if((!(wear_suit) || !(wear_suit.body_parts_covered & GROIN)) && (!(w_uniform) || !(w_uniform.body_parts_covered & GROIN)))
		return TRUE

/proc/cum_splatter(target) // Like blood_splatter(), but much more questionable on a resume.
	new /obj/effect/decal/cleanable/cum(get_turf(target))
	//var/obj/effect/decal/cleanable/cum/C = (get_turf(target))
	//C.add_blood_DNA(list(data["blood_DNA"] = data["blood_type"]))

/mob/living/carbon/human/proc/moan()
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

/mob/living/carbon/human/proc/cum(mob/living/carbon/human/partner, target_orifice)
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

/mob/living/carbon/human/cum(mob/living/carbon/human/partner, target_orifice)
	if(multiorgasms < sexual_potency)
		cum_splatter((gender == MALE && partner) ? partner : src)
	. = ..()

/mob/living/carbon/human/proc/is_fucking(mob/living/carbon/human/partner, orifice)
	if(partner == last_partner && orifice == last_orifice)
		return TRUE
	return FALSE

/mob/living/carbon/human/proc/set_is_fucking(mob/living/carbon/human/partner, orifice)
	last_partner = partner
	last_orifice = orifice

/mob/living/carbon/human/proc/do_fucking_animation(fuckdir) // Today I wrote 'var/fuckdir' with a straight face. Not a milestone I ever expected to pass. dont worry, we dont use heretic proc/name(var/dir)
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

/*--------------------------------------------------
  ---------------LEWD PROCESS DATUM-----------------
  --------------------------------------------------
 */

/mob/living/carbon/human/proc/do_oral(mob/living/carbon/human/partner)
	var/message
	var/lust_increase = NORMAL_LUST

	if(partner.is_fucking(src, CUM_TARGET_MOUTH))
		if(prob(partner.sexual_potency))
			if(istype(src, /mob/living/carbon/human)) // Argh.
				var/mob/living/carbon/human/H = src
				H.adjustOxyLoss(3)
			message = "goes in deep on \the [partner]."
			lust_increase += 5
		else
			if(partner.has_vagina())
				message = pick(
					"licks \the [partner]'s pussy.",
					"runs their tongue up the shape of \the [partner]'s pussy.",
					"traces \the [partner]'s slit with their tongue.",
					"darts the tip of their tongue around \the [partner]'s clit.",
					"laps slowly at \the [partner].",
					"kisses \the [partner]'s delicate folds.",
					"tastes \the [partner].",
				)
			else if(partner.has_penis())
				message = pick(
					"sucks \the [partner]'s off.",
					"runs their tongue up the shape of \the [partner]'s cock.",
					"traces \the [partner]'s cock with their tongue.",
					"darts the tip of their tongue around tip of \the [partner]'s cock.",
					"laps slowly at \the [partner]'s shaft.",
					"kisses the base of \the [partner]'s shaft.",
					"takes \the [partner] deeper into their mouth.",
				)
			else
				// get confused about how to do the sex
				message = pick(
					"licks \the [partner].",
					"looks a little unsure of where to lick \the [partner].",
					"runs their tongue between \the [partner]'s legs.",
					"kisses \the [partner]'s thigh.",
					"tries their best with \the [partner].",
				)
	else
		if(partner.has_vagina())
			message = pick(
				"buries their face in \the [partner]'s pussy.",
				"nuzzles \the [partner]'s wet sex.",
				"finds their face caught between \the [partner]'s thighs.",
				"kneels down between \the [partner]'s legs.",
				"grips \the [partner]'s legs, pushing them apart.",
				"sinks their face in between \the [partner]'s thighs.",
			)
		else if(partner.has_penis())
			message = pick(
				"takes \the [partner]'s cock into their mouth.",
				"wraps their lips around \the [partner]'s cock.",
				"finds their face between \the [partner]'s thighs.",
				"kneels down between \the [partner]'s legs.",
				"grips \the [partner]'s legs, kissing at the tip of their cock.",
				"goes down on \the [partner].",
			)
		else
			message = pick(
				"begins to lick \the [partner].",
				"starts kissing \the [partner]'s thigh.",
				"sinks down between \the [partner]'s thighs.",
				"briefly flashes a puzzled look from between \the [partner]'s legs.",
				"looks unsure of how to handle \the [partner]'s lack of genitalia.",
				"seems like they were expecting \the [partner] to have a cock or a pussy or ... something.",
			)
		partner.set_is_fucking(src, CUM_TARGET_MOUTH)

	playsound(get_turf(src), "honk/sound/interactions/bj[rand(1, 11)].ogg", 50, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	partner.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, src)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))
	lust_increase = NORMAL_LUST //RESET IT REE

/mob/living/carbon/human/proc/do_facefuck(mob/living/carbon/human/partner)
	var/message
	var/retaliation_message = FALSE

	if(is_fucking(partner, CUM_TARGET_MOUTH))
		if(has_vagina())
			message = pick(
				"grinds their pussy into \the [partner]'s face.",
				"grips the back of \the [partner]'s head, forcing them onto their pussy.",
				"rolls their pussy against \the [partner]'s tongue.",
				"slides \the [partner]'s mouth between their legs.",
				"looks \the [partner]'s in the eyes as their pussy presses into a waiting tongue.",
				"sways their hips, pushing their sex into \the [partner]'s face.",
				)
			if(partner.a_intent == INTENT_HARM)
				src.adjustBruteLoss(5)
				retaliation_message = pick(
					"bites furiously at \the [partner]'s legs.",
					"tightens teeth against \the [partner]'s pussy.",
					"looks deeply displeased to be there.",
					"struggles to escape from between \the [partner]'s thighs.",
				)
		else if(has_penis())
			message = pick(
				"roughly fucks \the [partner]'s mouth.",
				"forces their cock down \the [partner]'s throat.",
				"pushes in against \the [partner]'s tongue until a tight gagging sound comes.",
				"grips \the [partner]'s hair and draws them to the base of the cock.",
				"looks \the [partner]'s in the eyes as their cock presses into a waiting tongue.",
				"rolls their hips hard, sinking into \the [partner]'s mouth.",
				)
			if(partner.a_intent == INTENT_HARM)
				src.adjustBruteLoss(5)
				retaliation_message = pick(
					"bites down hard on \the [partner]'s cock.",
					"tightens teeth against \the [partner]'s dick until blood flows.",
					"stares up from between \the [partner]'s knees, blood on their teeth.",
					"struggles to escape from between \the [partner]'s legs.",
				)
				if(prob(5)) // dick crit
					src.adjustBruteLoss(20)
					retaliation_message = pick(
						"tightens teeth onto \the [partner]'s cock, messily tearing it away!",
						"bites down on \the [partner]'s cock and doesn't let go until it rips off!",
						"bites \the [partner]'s cock off completely in the struggle!",
					)
					src.has_penis = FALSE
		else
			message = pick(
				"grinds against \the [partner]'s face.",
				"feels \the [partner]'s face between bare legs.",
				"pushes in against \the [partner]'s tongue.",
				"grips \the [partner]'s hair, drawing them into the strangely sexless spot between their legs.",
				"looks \the [partner]'s in the eyes as they're caught beneath two thighs.",
				"rolls their hips hard against \the [partner]'s face.",
				)
			if(partner.a_intent == INTENT_HARM)
				src.adjustBruteLoss(5)
				retaliation_message = pick(
					"bites down hard on \the [partner]'s leg.",
					"tightens teeth between \the [partner]'s legs.",
					"stares up from between \the [partner]'s knees, blood on their teeth.",
					"struggles to escape from between \the [partner]'s legs.",
				)
	else
		if(has_vagina())
			message = "forces \the [partner]'s face into their pussy."
		else if(has_penis())
			if(is_fucking(partner, CUM_TARGET_THROAT))
				message = "retracts their cock from \the [partner]'s throat"
			else
				message = "shoves their cock into \the [partner]'s mouth"
		else
			message = "shoves their crotch into \the [partner]'s face."
		set_is_fucking(partner , CUM_TARGET_MOUTH)

	playsound(loc, "honk/sound/interactions/oral[rand(1, 2)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	if(retaliation_message)
		visible_message("<font color=red><b>\The [partner]</b> [retaliation_message]</font>")
	handle_post_sex(NORMAL_LUST, CUM_TARGET_MOUTH, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/thigh_smother(mob/living/carbon/human/partner)

	var/message
	var/lust_increase = 1

	if(is_fucking(partner, THIGH_SMOTHERING))

		if(has_vagina())
			message = pick(list(
				"presses their weight down onto \the [partner]'s face, blocking their vision completely.", 
				"rides \the [partner]'s face, grinding their wet pussy all over it."))

		else if(has_penis())
			message = pick(list("presses their weight down onto \the [partner]'s face, blocking their vision completely.", 
				"forces their dick and nutsack into \the [partner]'s face as they're stuck locked in between their thighs.", 
				"slips their cock into \the [partner]'s helpless mouth, keeping their shaft pressed hard into their face."))

		else
			message = "rubs their groin up and down \the [partner]'s face."

	else

		if(has_vagina())
			message = pick(list(
				"clambers over \the [partner]'s face and pins them down with their thighs, their moist slit rubbing all over \the [partner]'s mouth and nose.", 
				"locks their legs around \the [partner]'s head before pulling it into their mound."))

		else if(has_penis())
			message = pick(list(
				"clambers over \the [partner]'s face and pins them down with their thighs, then slowly inching closer and covering their eyes and nose with their leaking erection.", 
				"locks their legs around \the [partner]'s head before pulling it into their fat package, smothering them."))

		else
			message = "deviously locks their legs around \the [partner]'s head and smothers it in their thighs."

		set_is_fucking(partner , THIGH_SMOTHERING)




	var file = pick(list("bj10", "bj3", "foot_wet1", "foot_dry3"))

	playsound(loc, "honk/sound/interactions/[file].ogg", 70, 1, -1)

	visible_message("<b>\The [src]</b> [message]")

	handle_post_sex(lust_increase, THIGH_SMOTHERING, partner)

	partner.dir = get_dir(partner,src)

	do_fucking_animation(get_dir(src, partner))





	playsound(loc, "honk/sound/interactions/oral[rand(1, 2)].ogg", 70, 1, -1)


	handle_post_sex(NORMAL_LUST, CUM_TARGET_MOUTH, partner)

	partner.dir = get_dir(partner,src)

	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_throatfuck(mob/living/carbon/human/partner)
	var/message
	var/retaliation_message = FALSE

	if(is_fucking(partner, CUM_TARGET_THROAT))
		message = "[pick(
			"brutally fucks \the [partner]'s throat.", 
			"chokes \the [partner] on their dick.", 
			"brutally shoves their dick deep into \the [partner]'s mouth.")]"
		if(rand(3))
			partner.emote("chokes on \The [src]")
			if(prob(1) && istype(partner, /mob/living/carbon/human))
				var/mob/living/carbon/human/H = partner
				H.adjustOxyLoss(5)
				add_logs(src, partner, "attacked", src) //cmon, it's 1 in 100. how can it spam logs
		if(partner.a_intent == INTENT_HARM)
			src.adjustBruteLoss(5)
			retaliation_message = pick(
				"bites down hard on \the [partner]'s cock.",
				"tightens teeth against \the [partner]'s dick until blood flows.",
				"stares up from between \the [partner]'s knees, blood on their teeth.",
				"struggles to escape from between \the [partner]'s legs.",
			)
	else if(is_fucking(partner, CUM_TARGET_MOUTH))
		message = "thrusts deeper into \the [partner]'s mouth and down their throat."

	else
		message = "forces their dick deep down \the [partner]'s throat"
		set_is_fucking(partner , CUM_TARGET_THROAT)

	playsound(loc, "honk/sound/interactions/oral[rand(1, 2)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	if(retaliation_message)
		visible_message("<font color=red><b>\The [partner]</b> [retaliation_message]</font>")
	handle_post_sex(NORMAL_LUST, CUM_TARGET_THROAT, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))
/mob/living/carbon/human/proc/nut_face(var/mob/living/carbon/human/partner)

	var/message

	var/lust_increase = 1

	if(is_fucking(partner, NUTS_TO_FACE))
		message = pick(list(
			"grabs the back of [partner]'s head and pulls it into their crotch.", 
			"jams their nutsack right into [partner]'s face.", 
			"roughly grinds their fat nutsack into [partner]'s mouth.", 
			"pulls out their saliva-covered nuts from [partner]'s violated mouth and then wipes off the slime onto their face."))
	else
		message = pick(list("wedges a digit into the side of [partner]'s jaw and pries it open before using their other hand to shove their whole nutsack inside!", "stands with their groin inches away from [partner]'s face, then thrusting their hips forward and smothering [partner]'s whole face with their heavy ballsack."))
		set_is_fucking(partner , NUTS_TO_FACE)

	playsound(loc, "honk/sound/interactions/nuts[rand(1, 4)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	handle_post_sex(lust_increase, CUM_TARGET_MOUTH, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_anal(mob/living/carbon/human/partner)
	var/message

	if(is_fucking(partner, CUM_TARGET_ANUS))
		message = "fucks \the [partner]'s ass."
	else
		message = "works their cock into \the [partner]'s asshole."
		set_is_fucking(partner, CUM_TARGET_ANUS)

	playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, partner)
	partner.handle_post_sex(NORMAL_LUST, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_vaginal(mob/living/carbon/human/partner)
	var/message

	if(is_fucking(partner, CUM_TARGET_VAGINA))
		message = "[pick(
			"pounds \the [partner]'s pussy.",
			"shoves their dick deep into \the [partner]'s pussy")]"
	else
		message = "slides their cock into \the [partner]'s pussy."
		set_is_fucking(partner, CUM_TARGET_VAGINA)

	playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, partner)
	partner.handle_post_sex(NORMAL_LUST, null, src)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_mount(mob/living/carbon/human/partner)
	var/message

	if(partner.is_fucking(src, CUM_TARGET_VAGINA))
		message = "[pick("rides \the [partner]'s dick.", 
			"forces [partner]'s cock on their pussy")]"
	else
		message = "slides their pussy onto \the [partner]'s cock."
		partner.set_is_fucking(src, CUM_TARGET_VAGINA)
	playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, src)
	handle_post_sex(NORMAL_LUST, null, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_mountass(mob/living/carbon/human/partner)
	var/message

	if(partner.is_fucking(src, CUM_TARGET_ANUS))
		message = "[pick("rides \the [partner]'s dick.", 
			"forces [partner]'s cock on their ass")]"
	else
		message = "lowers their ass onto \the [partner]'s cock."
		partner.set_is_fucking(src, CUM_TARGET_ANUS)
	playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, src)
	handle_post_sex(NORMAL_LUST, null, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_fingering(mob/living/carbon/human/partner)
	visible_message("<font color=purple><b>\The [src]</b> [pick("fingers \the [partner].", 
		"fingers \the [partner]'s pussy.", 
		"fingers \the [partner] hard.")]</font>")
	playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
	partner.handle_post_sex(NORMAL_LUST, null, src)
	partner.dir = get_dir(partner, src)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_fingerass(mob/living/carbon/human/partner)
	visible_message("<font color=purple><b>\The [src]</b> [pick("fingers \the [partner].", 
		"fingers \the [partner]'s asshole.", 
		"fingers \the [partner] hard.")]</font>")
	playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
	partner.handle_post_sex(NORMAL_LUST, null, src)
	partner.dir = get_dir(partner, src)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_rimjob(mob/living/carbon/human/partner)
	visible_message("<font color=purple><b>\The [src]</b> licks \the [partner]'s asshole.</font>")
	playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
	partner.handle_post_sex(NORMAL_LUST, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_handjob(mob/living/carbon/human/partner)
	var/message

	if(partner.is_fucking(src, CUM_TARGET_HAND))
		message = "[pick("jerks \the [partner] off.", 
			"works \the [partner]'s shaft.", 
			"wanks \the [partner]'s cock hard.")]"
	else
		message = "[pick("wraps their hand around \the [partner]'s cock.", 
			"starts playing with \the [partner]'s cock")]"
		partner.set_is_fucking(src, CUM_TARGET_HAND)

	playsound(src, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, src)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_breastfuck(mob/living/carbon/human/partner)
	var/message

	if(is_fucking(partner, CUM_TARGET_BREASTS))
		message = "[pick("fucks \the [partner]'s' breasts.", 
			"grinds their cock between \the [partner]'s boobs.", 
			"thrusts into \the [partner]'s tits.", 
			"grabs \the [partner]'s breasts together and presses their dick between them.")]"
	else
		message = "pushes \the [partner]'s breasts together and presses their dick between them."
		set_is_fucking(partner , CUM_TARGET_BREASTS)


	playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	handle_post_sex(NORMAL_LUST, CUM_TARGET_BREASTS, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_mountface(mob/living/carbon/human/partner)
	var/message

	if(is_fucking(partner, GRINDING_FACE_WITH_ANUS))
		message = "[pick("grinds their ass into \the [partner]'s face.", 
			"shoves their ass into \the [partner]'s face.")]"
	else
		message = "[pick(
			"grabs the back of \the [partner]'s head and forces it into their asscheeks.", 
			"squats down and plants their ass right on \the [partner]'s face")]"
		set_is_fucking(partner , GRINDING_FACE_WITH_ANUS)

	playsound(loc, "honk/sound/interactions/squelch[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	handle_post_sex(LOW_LUST, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/do_lickfeet(mob/living/carbon/human/partner)
	var/message

	if(partner.get_item_by_slot(SLOT_SHOES) != null)
		message = "licks \the [partner]'s \ [partner.get_item_by_slot(SLOT_SHOES)]."
	else
		message = "licks \the [partner]'s feet."

	playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	handle_post_sex(LOW_LUST, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

/*Grinding YOUR feet in TARGET's face*/
/mob/living/carbon/human/proc/do_grindface(mob/living/carbon/human/partner)
	var/message

	if(is_fucking(partner, GRINDING_FACE_WITH_FEET))
		if(src.get_item_by_slot(SLOT_SHOES) != null)
			message = "[pick(list("grinds their [get_shoes()] into [partner]'s face.", 
				"presses their footwear down hard on [partner]'s face.", 
				"rubs off the dirt from their [get_shoes()] onto [partner]'s face."))]</span>"
		else
			message = "[pick(list("grinds their bare feet into [partner]'s face.", 
				"deviously covers [partner]'s mouth and nose with their bare feet.", 
				"runs the soles of their bare feet against [partner]'s lips."))]</span>"

	else if(is_fucking(partner, GRINDING_MOUTH_WITH_FEET))
		if(src.get_item_by_slot(SLOT_SHOES) != null)
			message = "[pick(list("pulls their [get_shoes()] out of [partner]'s mouth and puts them on their face.", 
				"slowly retracts their [get_shoes()] from [partner]'s mouth, putting them on their face instead."))]</span>"
		else
			message = "[pick(list("pulls their bare feet out of [partner]'s mouth and rests them on their face instead.", 
				"retracts their bare feet from [partner]'s mouth and grinds them into their face instead."))]</span>"

		set_is_fucking(partner , GRINDING_FACE_WITH_FEET)

	else
		if(src.get_item_by_slot(SLOT_SHOES) != null)
			message = "[pick(list("plants their [get_shoes()] ontop of [partner]'s face.", 
				"rests their [get_shoes()] on [partner]'s face and presses down hard.", 
				"harshly places their [get_shoes()] atop [partner]'s face."))]</span>"
		else
			message = "[pick(list("plants their bare feet ontop of [partner]'s face.", 
				"rests their feet on [partner]'s face, smothering them.", 
				"positions their bare feet atop [partner]'s face."))]</span>"

		set_is_fucking(partner , GRINDING_FACE_WITH_FEET)

	playsound(loc, "honk/sound/interactions/foot_dry[rand(1, 4)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	partner.handle_post_sex(LOW_LUST, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

	/*Grinding YOUR feet in TARGET's mouth*/
/mob/living/carbon/human/proc/do_grindmouth(mob/living/carbon/human/partner)
	var/message

	if(is_fucking(partner, GRINDING_MOUTH_WITH_FEET))
		if(src.get_item_by_slot(SLOT_SHOES) != null)
			message = "[pick(list("roughly shoves their [get_shoes()] deeper into [partner]'s mouth.", 
				"harshly forces another inch of their [get_shoes()] into [partner]'s mouth.", 
				"presses their weight down, their [get_shoes()] prying deeper into [partner]'s mouth."))]</span>"
		else
			message = "[pick(list("wiggles their toes deep inside [partner]'s mouth.", 
				"crams their barefeet down deeper into [partner]'s mouth, making them gag.",
				"roughly grinds their feet on [partner]'s tongue."))]</span>"

	else if(is_fucking(partner, GRINDING_FACE_WITH_FEET))
		if(src.get_item_by_slot(SLOT_SHOES) != null)
			message = "[pick(list("decides to force their [get_shoes()] deep into [partner]'s mouth.", 
				"pressed the tip of their [get_shoes()] against [partner]'s lips and shoves inwards."))]</span>"
		else
			message = "[pick(list("pries open [partner]'s mouth with their toes and shoves their bare foot in.", 
				"presses down their foot even harder, cramming their foot into [partner]'s mouth."))]</span>"

		set_is_fucking(partner , GRINDING_MOUTH_WITH_FEET)

	else
		if(src.get_item_by_slot(SLOT_SHOES) != null)
			message = "[pick(list("readies themselves and in one swift motion, shoves their [get_shoes()] into [partner]'s mouth.", 
				"grinds the tip of their [get_shoes()] against [partner]'s mouth before pushing themselves in."))]</span>"
		else
			message = "[pick(list("rubs their dirty bare feet across [partner]'s face before prying them into their muzzle.", 
				"forces their barefeet into [partner]'s mouth.", 
				"covers [partner]'s mouth and nose with their foot until they gasp for breath, then shoves both feet inside before they can react."))]</span>"
		set_is_fucking(partner , GRINDING_MOUTH_WITH_FEET)

	playsound(loc, "honk/sound/interactions/foot_wet[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	partner.handle_post_sex(LOW_LUST, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

/mob/living/carbon/human/proc/get_shoes()
	var/obj/A = get_item_by_slot(SLOT_SHOES)
	if(findtext (A.name,"the"))
		return copytext(A.name, 3, (lentext(A.name)) + 1)
	else
		return A.name

/mob/living/carbon/human/proc/handle_post_sex(amount, orifice, mob/living/carbon/human/partner)
	sleep(5)

	if(stat != CONSCIOUS)
		return

	if(amount)
		lust += amount
	if(lust >= lust_tolerance)
		cum(partner, orifice)
	else
		moan()
