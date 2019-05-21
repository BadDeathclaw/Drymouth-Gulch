var/datum/subsystem/weather/SSweather
/datum/subsystem/weather
	name = "Weather"
	wait = 10
	priority = 3000
	var/list/datum/weather_controller/controllers = list()
	var/list/datum/weather_controller/active = list()
	var/next_weather_apply = 0
	var/min_interval = 1000
	var/max_interval = 12000
	var/list/planes = list()

/datum/subsystem/weather/New()
	NEW_SS_GLOBAL(SSweather)

/datum/subsystem/weather/fire()


/datum/subsystem/weather/Initialize(start_timeofday)
//	generate_controllers()
//	for(var/mob/M in mob_list)
//		if(M.hud_used)
//			create_screens(M.hud_used)
	..()

/datum/subsystem/weather/proc/apply_weather(weather_id)
	for(var/mob/M in player_list)
		apply_weather_screen(M, weather_id)

/datum/subsystem/weather/proc/apply_weather_screen(mob/user, weather_id)
	var/datum/weather_controller/W = controllers[weather_id]
	var/datum/hud/H = user.hud_used
	for(var/obj/screen/weather/screen in H.weather_planes)
		if(W.id != weather_id)
			continue
		screen.alpha = W.strength
		return

/datum/subsystem/weather/proc/apply_weather_screens(mob/user)
	for(var/weather in active)
		apply_weather_screen(user, weather)


/datum/subsystem/weather/proc/create_screens(var/datum/hud/hud)
	if(!hud)
		return
	if(!hud.weather_planes)
		hud.weather_planes = list()
	for(var/screen in hud.weather_planes)
		if(hud.mymob.client)
			hud.mymob.client.screen -= screen
		hud.weather_planes -= screen
	for(var/weather in controllers)
		var/datum/weather_controller/W = controllers[weather]
		var/obj/screen/weather/screen = new(W.id)
		screen.alpha = 0
		screen.icon_state = W.screen_overlay
		screen.layer = W.layer
		hud.weather_planes += screen

/datum/subsystem/weather/proc/get_random_weather()
	var/list/all_weathers = shuffle(controllers)
	var/chance = 100 / controllers.len //to avoid leaving without weather controller
	var/avoider = 0
	CYCLE
	for(var/datum/weather_controller/W in all_weathers)
		if(W in active)
			continue
		if(prob(W.chance) || prob(avoider))
			return W
		avoider += chance
	goto CYCLE

/datum/subsystem/weather/proc/generate_controllers()
	var/controller_types = typesof(/datum/weather_controller) - /datum/weather_controller
	for(var/controller in controller_types)
		var/datum/weather_controller/W = new controller()
		controllers[W.id] = W
		planes[W.id] = list()