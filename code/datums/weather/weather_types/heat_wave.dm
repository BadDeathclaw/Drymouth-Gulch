/datum/weather/heat_wave
	name = "heat wave"
	desc = "Harsh heat wave will grip an entire area."
	probability = 5

	telegraph_message = "<span class='userdanger'><i>Heat wave incoming! Seek shelter!</i></span>"
	telegraph_duration = 300
	telegraph_overlay = "light_snow"

	weather_message = "<span class='boldannounce'>The air suddenly gets very hot...</span>"
	weather_overlay = "light_snow"
	weather_duration_lower = 600
	weather_duration_upper = 1500

	end_duration = 100
	end_message = "<span class='boldannounce'>The heat wave dies down, it should be safe to go outside again.</span>"

	area_type = /area/f13/wasteland
	target_trait = ZTRAIT_STATION

	immunity_type = "lava"

	barometer_predictable = TRUE

/datum/weather/heat_wave/weather_act(mob/living/L)
	L.adjust_bodytemperature(rand(10, 20))
