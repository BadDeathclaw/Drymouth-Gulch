//Fallout 13 radiation simulation

/atom
	var
		rad_heavy_range = 1
		rad_light_range = 4
		rad_severity = 10

/atom/proc/RadiateRefresh()
	radiation_pulse(get_turf(src), rad_heavy_range, rad_light_range, rad_severity)