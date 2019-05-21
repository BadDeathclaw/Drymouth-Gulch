/obj/screen/weather
	name = "weather overlay"
	plane = WEATHER_PLANE
	layer = 999999999999
	icon = 'icons/fallout/misc/weather_screens.dmi'
	invisibility     = INVISIBILITY_LIGHTING
	screen_loc = "CENTER-7,CENTER-7"
	blend_mode = BLEND_OVERLAY
	mouse_opacity = 0
	var/weather_id

/obj/screen/weather/New(id)
	. = ..()
	weather_id = id
	SSweather.planes[weather_id] += src

/obj/screen/weather/Destroy()
	SSweather.planes[weather_id] -= src
	. = ..()

/obj/screen/plane_master/weather
	name = "weather plane"
	plane = WEATHER_PLANE
	invisibility     = INVISIBILITY_LIGHTING
	appearance_flags = PLANE_MASTER
	mouse_opacity = 0