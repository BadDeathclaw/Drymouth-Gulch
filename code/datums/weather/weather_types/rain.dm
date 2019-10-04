/datum/weather/rain
	name = "rain"
	desc = "Rain will fall on the Wasteland, cleaning it."
	probability = 10

	telegraph_duration = 300
	telegraph_overlay = "snow_storm"
	telegraph_message = "<span class='userdanger'>Rain is coming to the area, bringing purity and sustenance to all life. Rejoice!</span>"
	telegraph_sound = 'sound/ambience/acidrain_start.ogg'

	weather_message = "<span class='userdanger'><i>Rain pours down around you!</i></span>"
	weather_overlay = "rain"
	weather_duration_lower = 1200
	weather_duration_upper = 2400
	weather_sound = 'sound/ambience/acidrain_mid.ogg'

	end_duration = 100
	end_message = "<span class='boldannounce'>The downpour gradually slows to a light shower. The rain is over.</span>"
	end_sound = 'sound/ambience/acidrain_end.ogg'

	areas_type = list(/area/f13/wasteland, /area/f13/desert, /area/f13/farm, /area/f13/forest, /area/f13/ruins)
	protected_areas = list(/area/shuttle)
	target_trait = ZTRAIT_STATION

	immunity_type = "water"

	barometer_predictable = TRUE

	affects_turfs = TRUE

	carbons_only = TRUE

/datum/weather/rain/weather_act(mob/living/L)
	if(iscarbon(L))
		var/mob/living/carbon/C = L
		SEND_SIGNAL(C, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_STRENGTH_BLOOD)
		C.wash_cream()
		C.ExtinguishMob()
		C.adjust_fire_stacks(-20) //Douse ourselves with water to avoid fire more easily
		C.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
		for(var/obj/item/I in C.held_items)
			wash_obj(I)
		if(C.back)
			if(wash_obj(C.back))
				C.update_inv_back(0)

		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			var/washgloves = TRUE
			var/washshoes = TRUE
			var/washmask = TRUE
			var/washears = TRUE
			var/washglasses = TRUE

			if(H.wear_suit)
				washgloves = !(H.wear_suit.flags_inv & HIDEGLOVES)
				washshoes = !(H.wear_suit.flags_inv & HIDESHOES)
			if(H.head)
				washmask = !(H.head.flags_inv & HIDEMASK)
				washglasses = !(H.head.flags_inv & HIDEEYES)
				washears = !(H.head.flags_inv & HIDEEARS)
			if(H.wear_mask)
				if(washears)
					washears = !(H.wear_mask.flags_inv & HIDEEARS)
				if(washglasses)
					washglasses = !(H.wear_mask.flags_inv & HIDEEYES)
			if(H.head && wash_obj(H.head))
				H.update_inv_head()
			if(H.wear_suit && wash_obj(H.wear_suit))
				H.update_inv_wear_suit()
			else if(H.w_uniform && wash_obj(H.w_uniform))
				H.update_inv_w_uniform()
			if(washgloves)
				SEND_SIGNAL(H, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_STRENGTH_BLOOD)
			if(H.shoes && washshoes && wash_obj(H.shoes))
				H.update_inv_shoes()
			if(H.wear_mask && washmask && wash_obj(H.wear_mask))
				H.update_inv_wear_mask()
			else
				H.lip_style = null
				H.update_body()
			if(H.glasses && washglasses && wash_obj(H.glasses))
				H.update_inv_glasses()
			if(H.ears && washears && wash_obj(H.ears))
				H.update_inv_ears()
			if(H.belt && wash_obj(H.belt))
				H.update_inv_belt()

/datum/weather/rain/weather_act_turf(turf/T)
	for(var/O in T) //Clean cleanable decals in affected areas
		if(is_cleanable(O))
			qdel(O)

/datum/weather/rain/proc/wash_obj(obj/O)
	. = SEND_SIGNAL(O, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_STRENGTH_BLOOD)
	O.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
	if(isitem(O))
		var/obj/item/I = O
		I.acid_level = 0
		I.extinguish()
