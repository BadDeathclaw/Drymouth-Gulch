//Fallout 13 air clearing simulation

/turf/open/process_cell() //Fresh air
	..()
	var/area/A = get_area(src)
	if(A.open_space)
		var/cached_gases = air.gases
		for(var/G in cached_gases)
			var/list/gas = cached_gases[G]
			if(gas[MOLES] < 1)
				gas[MOLES] = 0
			else if(G == "o2")
				gas[MOLES] = Lerp(gas[MOLES], MOLES_O2STANDARD, 0.25)
			else if(G == "n2")
				gas[MOLES] = Lerp(gas[MOLES], MOLES_N2STANDARD, 0.25)
			else
				gas[MOLES] = Lerp(gas[MOLES], 0, 0.25)
		air.temperature = Lerp(air.temperature, 293.15, 0.25)