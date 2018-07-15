//reagent here
/datum/reagent/consumable/cum
	name = "cum"
	id = "cum"
	description = "Where you found this is your own business."
	color = "#AAAAAA77"
	taste_description = "something with a tang"
	data = list("donor"=null,"viruses"=null,"donor_DNA"=null,"blood_type"=null,"resistances"=null,"trace_chem"=null,"mind"=null,"ckey"=null,"gender"=null,"real_name"=null)
	taste_mult = 2
	reagent_state = LIQUID
	nutriment_factor = 0.5 * REAGENTS_METABOLISM

/datum/reagent/consumable/cum/reaction_turf(turf/T, reac_volume)
	if(!istype(T))
		return
	if(reac_volume < 3)
		return

	var/obj/effect/decal/cleanable/cum/S = locate() in T
	if(!S)
		S = new(T)
	S.reagents.add_reagent("cum", reac_volume)
	if(data["blood_DNA"])
		S.add_blood_DNA(list(data["blood_DNA"] = data["blood_type"])) //yes. STD

//cleanable here

/obj/effect/decal/cleanable/cum
	name = "cum"
	desc = "It's pie cream from a cream pie. Or not..."
	gender = PLURAL
	layer = ABOVE_NORMAL_TURF_LAYER
	density = 0
	icon = 'honk/icons/effects/cum.dmi'
	random_icon_states = list("cum1", "cum3", "cum4", "cum5", "cum6", "cum7", "cum8", "cum9", "cum10", "cum11", "cum12")
	mergeable_decal = FALSE
	blood_state = null
	bloodiness = null
	//var/blood_DNA = list()
	beauty = -50

/obj/effect/decal/cleanable/cum/New()
	..()
	dir = pick(1,2,4,8)
	add_blood_DNA(list("Unknown DNA" = "O+"))

///proc/cum_splatter(datum/reagent/blood/source, atom/target) // Like blood_splatter(), but much more questionable on a resume.
/proc/cum_splatter(atom/target) // Like blood_splatter(), but much more questionable on a resume.
	new /obj/effect/decal/cleanable/cum(get_turf(target))
	//var/obj/effect/decal/cleanable/cum/C = (get_turf(target))
	//C.add_blood_DNA(list(data["blood_DNA"] = data["blood_type"]))

/mob/var/lastmoan

/mob/proc/moan()
	if(!(prob(lust / lust_tolerance * 65)))
		return

	var/moan = rand(1, 7)
	if (moan == lastmoan)
		moan--
	lastmoan = moan

	visible_message("<font color=purple> <B>\The [src]</B> [pick("moans", "moans in pleasure",)].</font>")
	playsound(get_turf(src), "honk/sound/interactions/moan_[gender == FEMALE ? "f" : "m"][moan].ogg", 70, 1, 0)//, pitch = get_age_pitch())

/mob/proc/cum(mob/partner, target_orifice)

	var/message
	if(has_penis())

		if(!istype(partner))
			target_orifice = null

		switch(target_orifice)
			if(CUM_TARGET_MOUTH)
				if(partner.has_mouth() && partner.mouth_is_free())
					message = "cums right in \the [partner]'s mouth."
					partner.reagents.add_reagent("cum", 10)
				else
					message = "cums on \the [partner]'s face."
			if(CUM_TARGET_THROAT)
				if(partner.has_mouth() && partner.mouth_is_free())
					message = "shoves deep into \the [partner]'s throat and cums."
					partner.reagents.add_reagent("cum", 10)
				else
					message = "cums on \the [partner]'s face."
			if(CUM_TARGET_VAGINA)
				if(partner.is_nude() && partner.has_vagina())
					message = "cums in \the [partner]'s pussy."
					partner.reagents.add_reagent("cum", 10)
				else
					message = "cums on \the [partner]'s belly."
			if(CUM_TARGET_ANUS)
				if(partner.is_nude() && partner.has_anus())
					message = "cums in \the [partner]'s asshole."
					partner.reagents.add_reagent("cum", 10)
				else
					message = "cums on \the [partner]'s backside."
			if(CUM_TARGET_HAND)
				if(partner.has_hand())
					message = "cums in \the [partner]'s hand."
				else
					message = "cums on \the [partner]."
			if(CUM_TARGET_BREASTS)
				if(partner.is_nude() && partner.has_vagina())
					message = "cums onto \the [partner]'s breasts."
				else
					message = "cums on \the [partner]'s chest and neck."
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

	if(multiorgasms > (sexual_potency/3))
		refactory_period = 300 //sex cooldown
		src.set_drugginess(30)
	else
		refactory_period = 300
		src.set_drugginess(6)

/mob/living/carbon/human/cum(mob/partner, target_orifice)
	if (multiorgasms < sexual_potency)
		//cum_splatter(get_blood(vessel), (gender == MALE && partner) ? partner : src)
		cum_splatter((gender == MALE && partner) ? partner : src)
	. = ..()

/mob/var/last_partner
/mob/var/last_orifice

/mob/proc/is_fucking(mob/partner, orifice)
	if(partner == last_partner && orifice == last_orifice)
		return 1
	return 0

/mob/proc/set_is_fucking(mob/partner, orifice)
	last_partner = partner
	last_orifice = orifice

/mob/proc/do_oral(mob/partner)
	var/message
	var/lust_increase = 10

	if(partner.is_fucking(src, CUM_TARGET_MOUTH))
		if(prob(partner.sexual_potency))
			if(istype(src, /mob/living/carbon/human)) // Argh.
				var/mob/living/carbon/human/H = src
				H.adjustOxyLoss(3)
			message = "goes in deep on \the [partner]."
			lust_increase += 5
		else
			if(partner.has_vagina())
				message = "licks \the [partner]'s pussy."
			else if(partner.has_penis())
				message = "sucks \the [partner] off."
			else
				message = "licks \the [partner]."
	else
		if(partner.has_vagina())
			message = "buries their face in \the [partner]'s pussy."
		else if(partner.has_penis())
			message = "takes \the [partner]'s cock into their mouth."
		else
			message = "begins to lick \the [partner]."
		partner.set_is_fucking(src, CUM_TARGET_MOUTH)

	playsound(get_turf(src), "honk/sound/interactions/bj[rand(1, 11)].ogg", 50, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	partner.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, src)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_facefuck(mob/partner)
	var/message
	var/lust_increase = 10

	if(is_fucking(partner, CUM_TARGET_MOUTH))
		if(has_vagina())
			message = "grinds their pussy into \the [partner]'s face."
		else if(has_penis())
			message = "roughly fucks \the [partner]'s mouth."
		else
			message = "grinds against \the [partner]\s face."
	else
		if(has_vagina())
			message = "forces \the [partner]'s face into their pussy."
		else if(has_penis())
			if(is_fucking(partner, CUM_TARGET_THROAT))
				message = "retracts their dick from \the [partner]'s throat"
			else
				message = "shoves their dick deep into \the [partner]'s mouth"
		else
			message = "shoves their crotch into \the [partner]'s face."
		set_is_fucking(partner , CUM_TARGET_MOUTH)

	playsound(loc, "honk/sound/interactions/oral[rand(1, 2)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	handle_post_sex(lust_increase, CUM_TARGET_MOUTH, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_throatfuck(mob/partner)
	var/message
	var/lust_increase = 10

	if(is_fucking(partner, CUM_TARGET_THROAT))
		message = "[pick(list("brutally fucks \the [partner]'s throat.", "chokes \the [partner] on their dick."))]</span>"
		if(rand(3))
			partner.emote("chokes on \The [src]")
			//partner.losebreath = 5
	else if(is_fucking(partner, CUM_TARGET_MOUTH))
		message = "thrusts deeper into \the [partner]'s mouth and down their throat."

	else
		message = "forces their dick deep down \the [partner]'s throat"
		set_is_fucking(partner , CUM_TARGET_THROAT)

	playsound(loc, "honk/sound/interactions/oral[rand(1, 2)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	handle_post_sex(lust_increase, CUM_TARGET_THROAT, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_anal(mob/partner)
	var/message
	var/lust_increase = 10
	if(is_fucking(partner, CUM_TARGET_ANUS))
		message = "fucks \the [partner]'s ass."
	else
		message = "works their cock into \the [partner]'s asshole."
		set_is_fucking(partner, CUM_TARGET_ANUS)

	playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	handle_post_sex(lust_increase, CUM_TARGET_ANUS, partner)
	partner.handle_post_sex(lust_increase, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_vaginal(mob/partner)
	var/message
	var/lust_increase = 10

	if(is_fucking(partner, CUM_TARGET_VAGINA))
		message = "pounds \the [partner]'s pussy."
	else
		message = "slides their cock into \the [partner]'s pussy."
		set_is_fucking(partner, CUM_TARGET_VAGINA)

	playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	handle_post_sex(lust_increase, CUM_TARGET_VAGINA, partner)
	partner.handle_post_sex(lust_increase, null, src)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_mount(mob/partner)
	var/message
	var/lust_increase = 10
	if(partner.is_fucking(src, CUM_TARGET_VAGINA))
		message = "rides \the [partner]'s dick."
	else
		message = "slides their pussy onto \the [partner]'s cock."
		partner.set_is_fucking(src, CUM_TARGET_VAGINA)
	playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	partner.handle_post_sex(lust_increase, CUM_TARGET_VAGINA, src)
	handle_post_sex(lust_increase, null, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_mountass(mob/partner)
	var/message
	var/lust_increase = 10
	if(partner.is_fucking(src, CUM_TARGET_ANUS))
		message = "rides \the [partner]'s dick."
	else
		message = "lowers their ass onto \the [partner]'s cock."
		partner.set_is_fucking(src, CUM_TARGET_ANUS)
	playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	partner.handle_post_sex(lust_increase, CUM_TARGET_ANUS, src)
	handle_post_sex(lust_increase, null, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_fingering(mob/partner)
	visible_message("<b>\The [src]<b> [pick(list("fingers \the [partner].", "fingers \the [partner]'s pussy.", "fingers \the [partner] hard."))]</span>")
	playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
	partner.handle_post_sex(10, null, src)
	partner.dir = get_dir(partner, src)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_fingerass(mob/partner)
	visible_message("<b>\The [src]<b> [pick(list("fingers \the [partner].", "fingers \the [partner]'s asshole.", "fingers \the [partner] hard."))]</span>")
	playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
	partner.handle_post_sex(10, null, src)
	partner.dir = get_dir(partner, src)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_rimjob(mob/partner)
	visible_message("<b>\The [src]<b> licks \the [partner]'s asshole.</span>")
	playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
	partner.handle_post_sex(10, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_handjob(mob/partner)
	var/message
	var/lust_increase = 10

	if(partner.is_fucking(src, CUM_TARGET_HAND))
		message = "[pick(list("jerks \the [partner] off.", "works \the [partner]'s shaft.", "wanks \the [partner]'s cock hard."))]"
	else
		message = "wraps their hand around \the [partner]'s cock."
		partner.set_is_fucking(src, CUM_TARGET_HAND)

	playsound(src, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	partner.handle_post_sex(lust_increase, CUM_TARGET_HAND, src)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_breastfuck(mob/partner)
	var/message
	var/lust_increase = 10

	if(is_fucking(partner, CUM_TARGET_BREASTS))
		message = "[pick(list("fucks \the [partner]'s' breasts.", "grinds their cock between \the [partner]'s boobs.", "thrusts into \the [partner]'s tits."))]"
	else
		message = "pushes \the [partner]'s breasts together and presses his dick between them."
		set_is_fucking(partner , CUM_TARGET_BREASTS)


	playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	handle_post_sex(lust_increase, CUM_TARGET_BREASTS, partner)
	partner.dir = get_dir(partner,src)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_mountface(mob/partner)
	var/message
	var/lust_increase = 1

	if(is_fucking(partner, GRINDING_FACE_WITH_ANUS))
		message = "[pick(list("grinds their ass into \the [partner]'s face.", "shoves their ass into \the [partner]'s face."))]</span>"
	else
		message = "[pick(list("grabs the back of \the [partner]'s head and forces it into their asscheeks.", "squats down and plants their ass right on \the [partner]'s face"))]</span>"
		set_is_fucking(partner , GRINDING_FACE_WITH_ANUS)

	playsound(loc, "honk/sound/interactions/squelch[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	handle_post_sex(lust_increase, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/do_lickfeet(mob/partner)
	var/message
	var/lust_increase = 1

	if(partner.get_item_by_slot(SLOT_SHOES) != null) {
		message = "licks \the [partner]'s \ [partner.get_item_by_slot(SLOT_SHOES)]."
	} else {
		message = "licks \the [partner]'s feet."
	}

	playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	handle_post_sex(lust_increase, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

/*Grinding YOUR feet in TARGET's face*/
/mob/proc/do_grindface(mob/partner)
	var/message
	var/lust_increase = 1

	if(is_fucking(partner, GRINDING_FACE_WITH_FEET)) {
		if(src.get_item_by_slot(SLOT_SHOES) != null) {

			message = "[pick(list("grinds their [get_shoes()] into [partner]'s face.", "presses their footwear down hard on [partner]'s face.", "rubs off the dirt from their [get_shoes()] onto [partner]'s face."))]</span>"
		} else {

			message = "[pick(list("grinds their barefeet into [partner]'s face.", "deviously covers [partner]'s mouth and nose with their barefeet.", "runs the soles of their barefeet against [partner]'s lips."))]</span>"
		}
	} else if(is_fucking(partner, GRINDING_MOUTH_WITH_FEET)) {
		if(src.get_item_by_slot(SLOT_SHOES) != null) {

			message = "[pick(list("pulls their [get_shoes()] out of [partner]'s mouth and puts them on their face.", "slowly retracts their [get_shoes()] from [partner]'s mouth, putting them on their face instead."))]</span>"
		} else {

			message = "[pick(list("pulls their barefeet out of [partner]'s mouth and rests them on their face instead.", "retracts their barefeet from [partner]'s mouth and grinds them into their face instead."))]</span>"
		}
		set_is_fucking(partner , GRINDING_FACE_WITH_FEET)
	} else {

		if(src.get_item_by_slot(SLOT_SHOES) != null) {

			message = "[pick(list("plants their [get_shoes()] ontop of [partner]'s face.", "rests their [get_shoes()] on [partner]'s face and presses down hard.", "harshly places their [get_shoes()] atop [partner]'s face."))]</span>"
		} else {

			message = "[pick(list("plants their barefeet ontop of [partner]'s face.", "rests their massive feet on [partner]'s face, smothering them.", "positions their barefeet atop [partner]'s face."))]</span>"
		}
		set_is_fucking(partner , GRINDING_FACE_WITH_FEET)
	}

	playsound(loc, "honk/sound/interactions/foot_dry[rand(1, 4)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	partner.handle_post_sex(lust_increase, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

	/*Grinding YOUR feet in TARGET's mouth*/
/mob/proc/do_grindmouth(mob/partner)
	var/message
	var/lust_increase = 1

	if(is_fucking(partner, GRINDING_MOUTH_WITH_FEET)) {
		if(src.get_item_by_slot(SLOT_SHOES) != null) {

			message = "[pick(list("roughly shoves their [get_shoes()] deeper into [partner]'s mouth.", "harshly forces another inch of their [get_shoes()] into [partner]'s mouth.", "presses their weight down, their [get_shoes()] prying deeper into [partner]'s mouth."))]</span>"
		} else {

			message = "[pick(list("wiggles their toes deep inside [partner]'s mouth.", "crams their barefeet down deeper into [partner]'s mouth, making them gag.", "roughly grinds their feet on [partner]'s tongue."))]</span>"
		}
	} else if(is_fucking(partner, GRINDING_FACE_WITH_FEET)) {
		if(src.get_item_by_slot(SLOT_SHOES) != null) {

			message = "[pick(list("decides to force their [get_shoes()] deep into [partner]'s mouth.", "pressed the tip of their [get_shoes()] against [partner]'s lips and shoves inwards."))]</span>"
		} else {

			message = "[pick(list("pries open [partner]'s mouth with their toes and shoves their barefoot in.", "presses down their foot even harder, cramming their foot into [partner]'s mouth."))]</span>"
		}
		set_is_fucking(partner , GRINDING_MOUTH_WITH_FEET)
	} else {

		if(src.get_item_by_slot(SLOT_SHOES) != null) {

			message = "[pick(list("readies themselves and in one swift motion, shoves their [get_shoes()] into [partner]'s mouth.", "grinds the tip of their [get_shoes()] against [partner]'s mouth before pushing themselves in."))]</span>"
		} else {

			message = "[pick(list("rubs their dirty barefeet across [partner]'s face before prying them into their muzzle.", "forces their barefeet into [partner]'s mouth.", "covers [partner]'s mouth and nose with their foot until they gasp for breath, then shoving both feet inside before they can react."))]</span>"
		}
		set_is_fucking(partner , GRINDING_MOUTH_WITH_FEET)
	}

	playsound(loc, "honk/sound/interactions/foot_wet[rand(1, 3)].ogg", 70, 1, -1)
	visible_message("<b>\The [src]</b> [message]")
	partner.handle_post_sex(lust_increase, null, src)
	partner.dir = get_dir(src, partner)
	do_fucking_animation(get_dir(src, partner))

/mob/proc/get_shoes()

	var/obj/A = get_item_by_slot(SLOT_SHOES)
	if(findtext (A.name,"the")) {
		return copytext(A.name, 3, (lentext(A.name)) + 1)
	} else {
		return A.name
	}

/mob/proc/handle_post_sex(amount, orifice, mob/partner)

	sleep(5)

	if(stat != CONSCIOUS)
		return

	if(amount)
		lust += amount
	if (lust >= lust_tolerance)
		cum(partner, orifice)
	else
		moan()

/obj/item/weapon/dildo
	name = "dildo"
	desc = "Hmmm, deal throw."
	icon = 'honk/icons/obj/items/dildo.dmi'
	icon_state = "dildo"
	item_state = "c_tube"
	throwforce = 0
	force = 10
	w_class = 1
	throw_speed = 3
	throw_range = 15
	attack_verb = list("slammed", "bashed", "whipped")

	var/hole = CUM_TARGET_VAGINA
	var/pleasure = 5

/obj/item/weapon/dildo/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/message = ""
	if(istype(M, /mob/living/carbon/human) && user.zone_selected == "groin" && M.is_nude())
		if (hole == CUM_TARGET_VAGINA && M.has_vagina())
			message = (user == M) ?  "fucks their own pussy with \the [src]" : pick(list("fucks [M] right in the pussy with \the [src]", "jams \the [src] right into [M]"))
		else if (hole == CUM_TARGET_ANUS && M.has_anus())
			message = (user == M) ? "fucks their own ass with \the [src]" : "fucks [M]'s asshole with \the [src]"
	if(message)
		user.visible_message("<font color=purple>[user] [message].</font>")
		M.handle_post_sex(pleasure, null, user)
		playsound(loc, "honk/sound/interactions/bang[rand(4, 6)].ogg", 70, 1, -1)
	else
		return ..()

/obj/item/weapon/dildo/attack_self(mob/user as mob)
	if(hole == CUM_TARGET_VAGINA)
		hole = CUM_TARGET_ANUS
	else
		hole = CUM_TARGET_VAGINA
	user << "<span class='warning'>Hmmm. Maybe we should put it in \a [hole]?</span>"
