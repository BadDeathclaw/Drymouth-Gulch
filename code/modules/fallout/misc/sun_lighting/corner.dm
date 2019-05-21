/var/list/datum/sunlighting_corner/all_sunlighting_corners = list()
/var/datum/sunlighting_corner/dummy/sundummy_lighting_corner = new
/var/datum/sunlighting_corner/dummy_full/sundummy_lighting_corner_full = new

/datum/sunlighting_corner
	var/list/turf/masters                 = list()
	var/list/datum/sunlight_source/affecting = list() // Light sources affecting us.
	var/datum/sunlight_source/best_light
	var/active                            = FALSE  // TRUE if one of our masters has dynamic lighting.

	var/x     = 0
	var/y     = 0
	var/z     = 0

	var/lum = 0

	var/needs_update = FALSE

	var/cache  = 0
	var/cache_mx = 0

	var/update_gen = 0

/datum/sunlighting_corner/New(var/turf/new_turf, var/diagonal)
	. = ..()

	all_sunlighting_corners += src

	masters[new_turf] = turn(diagonal, 180)
	z = new_turf.z

	var/vertical   = diagonal & ~(diagonal - 1) // The horizontal directions (4 and 8) are bigger than the vertical ones (1 and 2), so we can reliably say the lsb is the horizontal direction.
	var/horizontal = diagonal & ~vertical       // Now that we know the horizontal one we can get the vertical one.

	x = new_turf.x + (horizontal == EAST  ? 0.5 : -0.5)
	y = new_turf.y + (vertical   == NORTH ? 0.5 : -0.5)

	// My initial plan was to make this loop through a list of all the dirs (horizontal, vertical, diagonal).
	// Issue being that the only way I could think of doing it was very messy, slow and honestly overengineered.
	// So we'll have this hardcode instead.
	var/turf/T
	var/i

	// Diagonal one is easy.
	T = get_step(new_turf, diagonal)
	if (T) // In case we're on the map's border.
		if (!T.suncorners)
			T.suncorners = list(null, null, null, null)

		masters[T]   = diagonal
		i            = LIGHTING_CORNER_DIAGONAL.Find(turn(diagonal, 180))
		T.suncorners[i] = src

	// Now the horizontal one.
	T = get_step(new_turf, horizontal)
	if (T) // Ditto.
		if (!T.suncorners)
			T.suncorners = list(null, null, null, null)

		masters[T]   = ((T.x > x) ? EAST : WEST) | ((T.y > y) ? NORTH : SOUTH) // Get the dir based on coordinates.
		i            = LIGHTING_CORNER_DIAGONAL.Find(turn(masters[T], 180))
		T.suncorners[i] = src

	// And finally the vertical one.
	T = get_step(new_turf, vertical)
	if (T)
		if (!T.suncorners)
			T.suncorners = list(null, null, null, null)

		masters[T]   = ((T.x > x) ? EAST : WEST) | ((T.y > y) ? NORTH : SOUTH) // Get the dir based on coordinates.
		i            = LIGHTING_CORNER_DIAGONAL.Find(turn(masters[T], 180))
		T.suncorners[i] = src

	update_active()

/datum/sunlighting_corner/proc/update_active()
	active = FALSE
	for (var/turf/T in masters)
		if (T.sun_lighting_overlay)
			active = TRUE

/datum/sunlighting_corner/proc/find_best()
	for(var/datum/sunlight_source/L in affecting)
		var/aff_lum = L.effect_str[src]
		if(aff_lum > lum)
			lum = aff_lum
			best_light = L

// God that was a mess, now to do the rest of the corner code! Hooray!
/datum/sunlighting_corner/proc/update_lumcount(var/datum/sunlight_source/light, var/delta)
	if(light == best_light)
		if(delta <= 0)
			lum = 0
			best_light = null
			find_best()
		else
			lum = delta
	if(delta > lum)
		best_light = light
		lum = delta

	if (!needs_update)
		needs_update = TRUE
		sunlighting_update_corners += src

/datum/sunlighting_corner/proc/update_overlays()
#if LIGHTING_SOFT_THRESHOLD != 0
	cache  = lum || LIGHTING_SOFT_THRESHOLD
#else
	cache  = lum
#endif
	cache_mx = lum

	for (var/TT in masters)
		var/turf/T = TT
		if (T.sun_lighting_overlay)
			if (!T.sun_lighting_overlay.needs_update)
				T.sun_lighting_overlay.needs_update = TRUE
				sunlighting_update_overlays += T.sun_lighting_overlay


/datum/sunlighting_corner/dummy/New()
	return

/datum/sunlighting_corner/dummy_full/New()
	lum = 1
	cache = 1
	cache_mx = 1
	return


/datum/sunlighting_corner/Destroy(var/force)
	if (!force)
		return QDEL_HINT_LETMELIVE

	stack_trace("Ok, Look, TG, I need you to find whatever fucker decided to call qdel on a fucking lighting overlay, then tell him very nicely and politely that he is 100% retarded and needs his head checked. Thanks. Send them my regards by the way.")
	// Yeah fuck you anyways.
	return QDEL_HINT_LETMELIVE
