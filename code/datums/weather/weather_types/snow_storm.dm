/datum/weather/snow_storm
	name = "cold wave"
	desc = "Harsh cold wave will grip an entire area."
	probability = 5

	telegraph_message = "<span class='warning'>The air is getting very cold...</span>"
	telegraph_duration = 300
	telegraph_overlay = "light_snow"

	weather_message = "<span class='userdanger'><i>Cold wave incoming! Seek shelter!</i></span>"
	weather_overlay = "snow_storm"
	weather_duration_lower = 600
	weather_duration_upper = 1500

	end_duration = 100
	end_message = "<span class='boldannounce'>The cold wave dies down, it should be safe to go outside again.</span>"

	area_type = /area/f13/wasteland
	target_trait = ZTRAIT_STATION

	immunity_type = "snow"

	barometer_predictable = TRUE

/datum/weather/snow_storm/weather_act(mob/living/L)
	L.adjust_bodytemperature(-rand(5,15))
