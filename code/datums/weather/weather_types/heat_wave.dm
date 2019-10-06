/datum/weather/heat_wave
	name = "heat wave"
	desc = "Harsh heat wave will grip an entire area."
	probability = 7

	telegraph_message = "<span class='userdanger'><i>Heat wave is coming to the area, increasing temperature of anyone caught outside.</i></span>"
	telegraph_duration = 300
	telegraph_overlay = "light_ash"
	telegraph_sound = 'sound/f13effects/sandstorm_warning.ogg'

	weather_message = "<span class='userdanger'>The air suddenly gets very hot...</span>"
	weather_overlay = "light_ash"
	weather_duration_lower = 1200
	weather_duration_upper = 2400

	end_duration = 100
	end_message = "<span class='boldannounce'>The heat wave dies down, it should be safe to go outside again.</span>"

	areas_type = list(/area/f13/wasteland, /area/f13/desert, /area/f13/farm, /area/f13/forest, /area/f13/ruins)
	protected_areas = list(/area/shuttle)
	target_trait = ZTRAIT_STATION

	immunity_type = "lava"

	barometer_predictable = TRUE

	carbons_only = TRUE

/datum/weather/heat_wave/weather_act(mob/living/L)
	L.adjust_bodytemperature(rand(10, 20))
