/mob/living/carbon/proc/has_hands()
	return src.get_num_arms()	//mob-level proc

/mob/living/carbon/proc/has_mouth()
	return TRUE

/mob/living/carbon/proc/mouth_is_free()
	return TRUE

/mob/living/carbon/proc/foot_is_free()
	return TRUE


/mob/living/carbon/human/mouth_is_free()
	return !wear_mask

/mob/living/carbon/human/foot_is_free()
	return !shoes
	
/mob/living/carbon/human/has_mouth()
	var/obj/item/bodypart/head/head = src.get_bodypart("head") //fresh from guillotine code
	if(QDELETED(head))	//you're already about to die
		return FALSE
	if(head.brute_dam >= 100)
		return FALSE
	return TRUE

/*
/atom/movable/attack_hand(mob/living/user)
	. = ..()
	if(can_buckle && buckled_mob)
		if(user_unbuckle_mob(user))
			return 1

/atom/movable/MouseDrop_T(mob/living/M, mob/living/user)
	. = ..()
	if(can_buckle && istype(M) && !buckled_mob)
		if(user_buckle_mob(M, user))
			return TRUE
*/