/datum/weather_controller
	var/name = "weather controller"
	var/id = "weather_id"
	var/desc = "Controlling weather mechanic."

	var/screen_overlay	//overlay which set's up on player screen
	var/chance = 0		//chance to weather apply
	var/duration_min = 0
	var/duration_max = 0
	var/strength = 0	//alpha of overlay
	var/layer = 0

/datum/weather_controller/proc/on_start()
	return 0
/datum/weather_controller/proc/on_end()
	return 0

/datum/weather_controller/process()
	return 0

/datum/weather_controller/proc/on_mob_enter(mob/mob) //calls when mob entered area with this weather
	return 0

/datum/weather_controller/proc/on_mob_exit(mob/mob)
	return 0