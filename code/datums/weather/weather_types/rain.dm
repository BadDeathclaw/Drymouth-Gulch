/datum/weather/rain
	name = "rain"
	desc = "Rain will fall on the Wasteland, cleaning it."
	probability = 10

	telegraph_duration = 400
	telegraph_overlay = "snow_storm"
	telegraph_message = "<span class='userdanger'>Rain is coming to the area, bringing purity and sustenance to all life. Rejoice!</span>"
	telegraph_sound = 'sound/ambience/acidrain_start.ogg'

	weather_message = "<span class='userdanger'><i>Rain pours down around you!</i></span>"
	weather_overlay = "rain"
	weather_duration_lower = 600
	weather_duration_upper = 1500
	weather_sound = 'sound/ambience/acidrain_mid.ogg'

	end_duration = 100
	end_message = "<span class='boldannounce'>The downpour gradually slows to a light shower. The rain is over.</span>"
	end_sound = 'sound/ambience/acidrain_end.ogg'

	area_type = /area/f13/wasteland
	protected_areas = list(/area/shuttle)
	target_trait = ZTRAIT_STATION

	immunity_type = "water"

	barometer_predictable = TRUE

	affects_turfs = TRUE

/datum/weather/rain/weather_act(mob/living/L)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
		SEND_SIGNAL(H, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_MEDIUM)
		H.wash_cream()

/datum/weather/rain/weather_act_turf(turf/T)
	SEND_SIGNAL(T, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_MEDIUM)
	for(var/obj/effect/O in T)
		if(is_cleanable(O))
			qdel(O)
