/datum/weather/acid_rain
	name = "acid rain"
	desc = "The planet's thunderstorms are by nature acidic, and will incinerate anyone standing beneath them without protection."
	probability = 2

	telegraph_duration = 400
	telegraph_overlay = "snow_storm"
	telegraph_message = "<span class='userdanger'>Acid rain is coming to the area, bringing suffering and death to all life. Save yourself.</span>"
	telegraph_sound = 'sound/ambience/acidrain_start.ogg'

	weather_message = "<span class='userdanger'><i>Acidic rain pours down around you! Get inside!</i></span>"
	weather_overlay = "acid_rain"
	weather_duration_lower = 600
	weather_duration_upper = 1500
	weather_sound = 'sound/ambience/acidrain_mid.ogg'

	end_duration = 100
	end_message = "<span class='boldannounce'>The downpour gradually slows to a light shower. It should be safe outside now.</span>"
	end_sound = 'sound/ambience/acidrain_end.ogg'

	area_type = /area/f13/wasteland
	protected_areas = list(/area/shuttle)
	target_trait = ZTRAIT_STATION

	immunity_type = "acid" // temp

	barometer_predictable = TRUE

	affects_turfs = TRUE

/datum/weather/acid_rain/weather_act(mob/living/L)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
		SEND_SIGNAL(H, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_MEDIUM)
		H.wash_cream()
	if(is_acidrain_immune(L))
		return
	var/resist = L.getarmor(null, "acid")
	if(prob(max(0, 100 - resist)))
		L.acid_act(10, 10)

/datum/weather/acid_rain/weather_act_turf(turf/T)
	for(var/obj/effect/O in T) //Clean cleanable decals in affected areas
		if(is_cleanable(O))
			qdel(O)
	for(var/obj/item/ammo_casing/C in T) //Clean ammo casings in affected areas
		qdel(C)

/datum/weather/acid_rain/proc/is_acidrain_immune(atom/L)
	while (L && !isturf(L))
		if(ismecha(L)) //Mechs are immune
			return TRUE
		if(ishuman(L)) //Are you immune?
			var/mob/living/carbon/human/H = L
			var/thermal_protection = H.get_thermal_protection()
			if(thermal_protection >= FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT)
				return TRUE
		L = L.loc //Matryoshka check
	return FALSE //RIP you
