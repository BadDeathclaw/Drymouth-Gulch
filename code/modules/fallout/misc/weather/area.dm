/area/Entered(go/Obj,atom/OldLoc)
	..()
	var/turf/T = OldLoc
	if(istype(T) && open_space && !T.is_openspace() && istype(Obj,/mob))
		if(SSweather.active.len)
			for(var/datum/weather_controller/W in SSweather.active)
				W.on_mob_enter(Obj)

/area/Exited(atom/movable/Obj, atom/newloc)
	..()
	var/turf/T = newloc
	if(istype(T) && open_space && !T.is_openspace() && istype(Obj,/mob))
		if(SSweather.active.len)
			for(var/datum/weather_controller/W in SSweather.active)
				W.on_mob_exit(Obj)