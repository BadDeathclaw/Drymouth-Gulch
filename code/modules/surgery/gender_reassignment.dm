/datum/surgery/gender_reassignment_lower
	name = "gender reassignment - lower surgery"
	species = list(/mob/living/carbon/human)
	possible_locs = list(BODY_ZONE_PRECISE_GROIN)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/lower_surgery,
		/datum/surgery_step/close
		)

/datum/surgery_step/lower_surgery
	name = "lower surgery"
	implements = list(/obj/item/scalpel = 100, /obj/item/hatchet = 50, /obj/item/wirecutters = 35)
	time = 32

/datum/surgery_step/lower_surgery/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target	//no type check, as that should be handled by the surgery
	if(H.has_penis == TRUE)
		user.visible_message("[user] begins to reshape [target]'s genitals to look more feminine.", "<span class='notice'>You begin to reshape [target]'s genitals to look more feminine...</span>")
	else
		user.visible_message("[user] begins to reshape [target]'s genitals to look more masculine.", "<span class='notice'>You begin to reshape [target]'s genitals to look more masculine...</span>")

/datum/surgery_step/lower_surgery/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target	//no type check, as that should be handled by the surgery
	if(H.has_penis)
		user.visible_message("[user] surgically constructed [target]'s vagina.", "<span class='notice'>You finished surgically constructing [target]'s vagina.</span>")
		H.has_penis = FALSE
		H.has_vagina = TRUE
	else
		user.visible_message("[user] surgically constructed [target]'s penis.", "<span class='notice'>You finished surgically constructing [target]'s penis.</span>")
		H.has_penis = TRUE
		H.has_vagina = FALSE
	target.regenerate_icons()
	return 1

/datum/surgery_step/lower_surgery/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target
	user.visible_message("<span class='warning'>[user] accidentally mutilates [target]'s genitals.</span>", "<span class='warning'>You accidentally mutilate [target]'s genitals!</span>")
	H.has_penis = FALSE
	H.has_vagina = FALSE
	target.regenerate_icons()
	return 1

/datum/surgery/castration
	name = "castration"
	species = list(/mob/living/carbon/human)
	possible_locs = list(BODY_ZONE_PRECISE_GROIN)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/castration,
		/datum/surgery_step/close
		)

/datum/surgery_step/castration
	name = "castration"
	implements = list(/obj/item/scalpel = 100, /obj/item/hatchet = 50, /obj/item/wirecutters = 35)
	time = 32

/datum/surgery_step/castration/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target	//no type check, as that should be handled by the surgery
	if(H.has_penis == TRUE)
		user.visible_message("[user] begins to slice away at [target]'s penis.", "<span class='notice'>You begin to slice away at [target]'s penis.</span>")
	else
		return 0

/datum/surgery_step/castration/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target	//no type check, as that should be handled by the surgery
	if(H.has_penis)
		user.visible_message("[user] castrated [target].", "<span class='notice'>You finished castrating [target].</span>")
		H.has_penis = FALSE
	return 1

/datum/surgery_step/castration/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target
	user.visible_message("<span class='warning'>[user] accidentally sinks the [tool] deep into the remnants of [target]'s penis.</span>", "<span class='warning'>You accidentally sink the [tool] deep into the remnants of [target]'s penis!</span>")
	H.has_vagina = TRUE
	target.regenerate_icons()
	return 1


/datum/surgery/gender_reassignment_top
	name = "gender reassignment - top surgery"
	species = list(/mob/living/carbon/human)
	possible_locs = list(BODY_ZONE_CHEST)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/top_surgery,
		/datum/surgery_step/close
		)

/datum/surgery_step/top_surgery
	name = "top surgery"
	implements = list(/obj/item/scalpel = 100, /obj/item/hatchet = 50, /obj/item/wirecutters = 35)
	time = 32

/datum/surgery_step/top_surgery/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target
	if(H.has_breasts == FALSE)
		user.visible_message("[user] begins to reshape [target]'s chest to look more feminine.", "<span class='notice'>You begin to reshape [target]'s chest to look more feminine...</span>")
	else
		user.visible_message("[user] begins to reshape [target]'s chest to look more masculine.", "<span class='notice'>You begin to reshape [target]'s chest to look more masculine...</span>")

/datum/surgery_step/top_surgery/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target	//no type check, as that should be handled by the surgery
	if(H.has_breasts)
		user.visible_message("[user] surgically removed [target]'s breasts.", "<span class='notice'>You finished surgically removing [target]'s breasts.</span>")
		H.has_breasts = FALSE
		if (H.gender == FEMALE)
			H.gender_ambiguous = 1
		else
			H.gender_ambiguous = 0
	else
		user.visible_message("[user] surgically constructed [target]'s breasts.", "<span class='notice'>You finished surgically constructing [target]'s breasts.</span>")
		H.has_breasts = TRUE
		if (H.gender == MALE)
			H.gender_ambiguous = 1
		else
			H.gender_ambiguous = 0
	target.regenerate_icons()
	return 1

/datum/surgery_step/top_surgery/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target
	user.visible_message("<span class='warning'>[user] accidentally mutilates [target]'s breasts.</span>", "<span class='warning'>You accidentally mutilate [target]'s breasts!</span>")
	H.has_breasts = FALSE
	H.gender_ambiguous = 1
	target.regenerate_icons()
	return 1

/datum/surgery/gender_reassignment_face
	name = "gender reassignment - facial surgery"
	species = list(/mob/living/carbon/human)
	possible_locs = list(BODY_ZONE_HEAD)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/facial_assignment,
		/datum/surgery_step/close
		)

/datum/surgery_step/facial_assignment
	name = "facial assignment surgery"
	implements = list(/obj/item/scalpel = 100, /obj/item/hatchet = 50, /obj/item/wirecutters = 35)
	time = 32

/datum/surgery_step/facial_assignment/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target
	if(H.has_breasts == FALSE)
		user.visible_message("[user] begins to reshape [target]'s face to look more feminine.", "<span class='notice'>You begin to reshape [target]'s face to look more feminine...</span>")
	else
		user.visible_message("[user] begins to reshape [target]'s face to look more masculine.", "<span class='notice'>You begin to reshape [target]'s face to look more masculine...</span>")

/datum/surgery_step/facial_assignment/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target	//no type check, as that should be handled by the surgery
	if(H.gender == FEMALE)
		user.visible_message("[user] surgically masculinized [target]'s face.", "<span class='notice'>You finished surgically masculinizing [target]'s face.</span>")
		H.gender = MALE
		if (H.has_breasts)
			H.gender_ambiguous = 1
		else
			H.gender_ambiguous = 0
	else
		user.visible_message("[user] surgically feminized [target]'s face.", "<span class='notice'>You finished surgically feminizing [target]'s face.</span>")
		H.gender = FEMALE
		if (!H.has_breasts)
			H.gender_ambiguous = 1
		else
			H.gender_ambiguous = 0
	target.regenerate_icons()
	return 1

/datum/surgery_step/facial_assignment/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/H = target
	user.visible_message("<span class='warning'>[user] accidentally mutilates [target]'s face.</span>", "<span class='warning'>You accidentally mutilate [target]'s face!</span>")
	H.gender_ambiguous = 1
	target.regenerate_icons()
	return 1
