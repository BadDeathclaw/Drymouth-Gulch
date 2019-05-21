/turf/proc/is_openspace()
	if(istype(src,/turf/closed) || has_opaque_atom)
		return 0
	var/area/A = get_area(src)
	return A.open_space

/turf/proc/has_junction_closedspace()
	for(var/turf/T in RANGE_TURFS(1,src))
		if(!T.is_openspace())
			return 1
/turf/open/proc/update_sunlight()
	if(is_openspace())
		for(var/turf/T in RANGE_TURFS(1,src))
			if(!T.is_openspace())
				sun_update_light()
				return
	if(sunlight_source)
		sunlight_source.destroy()
		sunlight_source = null

/turf

	var/tmp/datum/sunlight_source/sunlight_source
	var/tmp/atom/movable/sunlighting_overlay/sun_lighting_overlay
	var/tmp/list/datum/sunlighting_corner/suncorners
	var/tmp/list/datum/sunlight_source/sun_affecting_lights

	var/sun_lighting_corners_initialised

/turf/open/New()
	. = ..()
	update_sunlight()

/turf/proc/sun_update_light()
	set waitfor = FALSE
	if (qdeleted(src))
		return

	if (sunlight_source) // Update the light or create it if it does not exist.
		sunlight_source.force_update()
	else
		sunlight_source = new/datum/sunlight_source(src, .)

/turf/Destroy()
	if (sunlight_source)
		sunlight_source.destroy()
		sunlight_source = null
	. = ..()

/turf/proc/sun_get_corners()
	if (has_opaque_atom)
		return null // Since this proc gets used in a for loop, null won't be looped though.

	return suncorners

/turf/proc/sun_generate_missing_corners()
	sun_lighting_corners_initialised = TRUE
	if (!suncorners)
		suncorners = list(null, null, null, null)

	for (var/i = 1 to 4)
		if (suncorners[i]) // Already have a corner on this direction.
			continue

		suncorners[i] = new/datum/sunlighting_corner(src, LIGHTING_CORNER_DIAGONAL[i])

/turf/proc/sun_reconsider_lights()
	for (var/datum/sunlight_source/L in sun_affecting_lights)
		L.vis_update()

/turf/proc/sun_lighting_clear_overlay()
	if (sun_lighting_overlay)
		qdel(sun_lighting_overlay, TRUE)

	for (var/datum/sunlighting_corner/C in suncorners)
		C.update_active()

// Builds a lighting overlay for us, but only if our area is dynamic.
/turf/proc/sun_lighting_build_overlay()
	if (sun_lighting_overlay)
		return

	if (!sun_lighting_corners_initialised)
		sun_generate_missing_corners()

	new/atom/movable/sunlighting_overlay(src)

	for (var/datum/sunlighting_corner/C in suncorners)
		if (!C.active) // We would activate the corner, calculate the lighting for it.
			for (var/datum/sunlight_source/S in C.affecting)
				S.recalc_corner(C)

			C.active = TRUE