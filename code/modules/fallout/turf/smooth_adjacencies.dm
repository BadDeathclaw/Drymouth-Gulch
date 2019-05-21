//Fallout 13 turf smoothing simulation

/turf/proc/updateMineralOverlays()
	clearMineralOverlays()
	if(istype(get_step(src, NORTH), /turf/closed/mineral))
		add_cached_overlay("/turf/closed/mineral", get_adjacencies_overlay("rock_side_n", 'icons/fallout/turfs/mining.dmi'))
	if(istype(get_step(src, SOUTH), /turf/closed/mineral))
		add_cached_overlay("/turf/closed/mineral", get_adjacencies_overlay("rock_side_s", 'icons/fallout/turfs/mining.dmi'))
	if(istype(get_step(src, EAST), /turf/closed/mineral))
		add_cached_overlay("/turf/closed/mineral", get_adjacencies_overlay("rock_side_e", 'icons/fallout/turfs/mining.dmi'))
	if(istype(get_step(src, WEST), /turf/closed/mineral))
		add_cached_overlay("/turf/closed/mineral", get_adjacencies_overlay("rock_side_w", 'icons/fallout/turfs/mining.dmi'))

/turf/proc/clearMineralOverlays()
	if(overlays_cache && overlays_cache["/turf/closed/mineral"])
		remove_cached_overlay("/turf/closed/mineral")

/turf/closed/updateMineralOverlays()
	return

/turf/closed/mineral/updateMineralOverlays()
	return

/turf/New()
	..()
	for(var/turf/t in range(1,src))
		t.fullUpdateJunctionOverlays()

/turf/ChangeTurf(path, defer_change = FALSE, ignore_air = FALSE)
	if(path != type)
		clearJunctionOverlays()
	..()

/turf/proc/fullUpdateJunctionOverlays()
	var/list/need_update = list()
	for (var/turf/t in range(1,src))
		if(t.flags & ADJACENCIES_OVERLAY)
			need_update |= t.type
	for(var/t in need_update)
		updateAdjacenciesOverlays(t)

/turf/proc/clearJunctionOverlays()
	if(!(flags & ADJACENCIES_OVERLAY))
		return
	for (var/turf/t in range(1,src))
		t.remove_cached_overlay(type)

var/global/list/smooth_files = list(/turf/open/indestructible/ground/desert = 'icons/fallout/turfs/ground_smooth.dmi')

/turf/proc/updateAdjacenciesOverlays(type)
	if(!smooth_files[type])
		return "NO FILE"
	if(istype(src, type))
		return "SELFTYPE"

	if(type in overlays_cache)
		remove_cached_overlay(type)

	var/path_to_file = smooth_files[type]

	var/adjacencies = get_adjacencies(type)

	if((adjacencies & N_NORTH) && (adjacencies & N_WEST))
		add_cached_overlay(type, get_adjacencies_overlay("1-f", path_to_file))
	else
		if(adjacencies & N_NORTH)
			if(adjacencies & N_NORTHWEST)
				add_cached_overlay(type, get_adjacencies_overlay("1-nw", path_to_file))
			else
				add_cached_overlay(type, get_adjacencies_overlay("1-n", path_to_file))
		else if(adjacencies & N_WEST)
			if(adjacencies & N_NORTHWEST)
				add_cached_overlay(type, get_adjacencies_overlay("1-wn", path_to_file))
			else
				add_cached_overlay(type, get_adjacencies_overlay("1-w", path_to_file))

	if((adjacencies & N_NORTH) && (adjacencies & N_EAST))
		add_cached_overlay(type, get_adjacencies_overlay("2-f", path_to_file))
	else
		if(adjacencies & N_NORTH)
			if(adjacencies & N_NORTHEAST)
				add_cached_overlay(type, get_adjacencies_overlay("2-ne", path_to_file))
			else
				add_cached_overlay(type, get_adjacencies_overlay("2-n", path_to_file))
		else if(adjacencies & N_EAST)
			if(adjacencies & N_NORTHEAST)
				add_cached_overlay(type, get_adjacencies_overlay("2-en", path_to_file))
			else
				add_cached_overlay(type, get_adjacencies_overlay("2-e", path_to_file))

	if((adjacencies & N_SOUTH) && (adjacencies & N_WEST))
		add_cached_overlay(type, get_adjacencies_overlay("3-f", path_to_file))
	else
		if(adjacencies & N_SOUTH)
			if(adjacencies & N_SOUTHWEST)
				add_cached_overlay(type, get_adjacencies_overlay("3-sw", path_to_file))
			else
				add_cached_overlay(type, get_adjacencies_overlay("3-s", path_to_file))
		else if(adjacencies & N_WEST)
			if(adjacencies & N_SOUTHWEST)
				add_cached_overlay(type, get_adjacencies_overlay("3-ws", path_to_file))
			else
				add_cached_overlay(type, get_adjacencies_overlay("3-w", path_to_file))


	if((adjacencies & N_SOUTH) && (adjacencies & N_EAST))
		add_cached_overlay(type, get_adjacencies_overlay("4-f", path_to_file))
	else
		if(adjacencies & N_SOUTH)
			if(adjacencies & N_SOUTHEAST)
				add_cached_overlay(type, get_adjacencies_overlay("4-se", path_to_file))
			else
				add_cached_overlay(type, get_adjacencies_overlay("4-s", path_to_file))
		else if(adjacencies & N_EAST)
			if(adjacencies & N_SOUTHEAST)
				add_cached_overlay(type, get_adjacencies_overlay("4-es", path_to_file))
			else
				add_cached_overlay(type, get_adjacencies_overlay("4-e", path_to_file))

/turf/closed/updateAdjacenciesOverlays()
	return

/turf/proc/get_adjacencies(turf_type)

	. = 0
	var/turf/T

	T = get_step(src, NORTH)
	if(T.type == turf_type)
		. |= N_NORTH
	T = get_step(src, EAST)
	if(T.type == turf_type)
		. |= N_EAST
	T = get_step(src, WEST)
	if(T.type == turf_type)
		. |= N_WEST
	T = get_step(src, SOUTH)
	if(T.type == turf_type)
		. |= N_SOUTH
	T = get_step(src, NORTHWEST)
	if(T.type == turf_type)
		. |= N_NORTHWEST
	T = get_step(src, NORTHEAST)
	if(T.type == turf_type)
		. |= N_NORTHEAST
	T = get_step(src, SOUTHWEST)
	if(T.type == turf_type)
		. |= N_SOUTHWEST
	T = get_step(src, SOUTHEAST)
	if(T.type == turf_type)
		. |= N_SOUTHEAST

proc/get_adjacencies_overlay(overlay_name, file)
	return image(file, overlay_name, layer = TURF_LAYER)