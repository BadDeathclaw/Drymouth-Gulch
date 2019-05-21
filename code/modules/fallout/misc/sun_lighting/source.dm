// This is where the fun begins.
// These are the main datums that emit light.
#define SUNLIGHT_POWER 1.4
#define SUNLIGHT_RANGE 10

/datum/sunlight_source
	var/turf/source_turf     // The turf under the above.

	// Variables for keeping track of the colour.
	var/lum = 1

	// The lumcount values used to apply the light.
	var/tmp/applied_lum = 1

	var/list/datum/sunlighting_corner/effect_str     // List used to store how much we're affecting corners.
	var/list/turf/affecting_turfs

	var/applied = FALSE // Whether we have applied our light yet or not.

	var/vis_update      // Whether we should smartly recalculate visibility. and then only update tiles that became (in)visible to us.
	var/needs_update    // Whether we are queued for an update.
	var/destroyed       // Whether we are destroyed and need to stop emitting light.
	var/force_update

/datum/sunlight_source/New(var/atom/owner, var/atom/top)
	source_turf = owner // Set our new owner.

	source_turf.sunlight_source = src // Add us to the lights of our owner.

	lum = 1

	effect_str      = list()
	affecting_turfs = list()

	update()

	return ..()

// Kill ourselves.
/datum/sunlight_source/proc/destroy()
	destroyed = TRUE
	force_update()
	if (source_turf)
		source_turf.sunlight_source = null

// Fuck supporting force.
/datum/sunlight_source/Destroy(var/force)
	destroy()
	return QDEL_HINT_IWILLGC

// Yes this doesn't align correctly on anything other than 4 width tabs.
// If you want it to go switch everybody to elastic tab stops.
// Actually that'd be great if you could!
#define EFFECT_UPDATE                   \
	if (!needs_update)                  \
	{                                   \
		sunlighting_update_lights += src;  \
		needs_update            = TRUE; \
	}

// This proc will cause the light source to update the top atom, and add itself to the update queue.
/datum/sunlight_source/proc/update(var/atom/new_top_atom)
	EFFECT_UPDATE

// Will force an update without checking if it's actually needed.
/datum/sunlight_source/proc/force_update()
	force_update = 1

	EFFECT_UPDATE

// Will cause the light source to recalculate turfs that were removed or added to visibility only.
/datum/sunlight_source/proc/vis_update()
	vis_update = 1

	EFFECT_UPDATE

// Will check if we actually need to update, and update any variables that may need to be updated.
/datum/sunlight_source/proc/check()
	if (!source_turf)
		destroy()
		return 1

#define APPLY_CORNER(C)              \
	. = LUM_FALLOFF(C, source_turf); \
                                     \
	. *= SUNLIGHT_POWER;                \
                                     \
	effect_str[C] = .;               \
                                     \
	C.update_lumcount                \
	(                                \
		src,                         \
		. * applied_lum              \
	);                               \

// I don't need to explain what this does, do I?
#define REMOVE_CORNER(C)             \
	. = -effect_str[C];              \
	C.update_lumcount                \
	(                                \
		src,                         \
		. * applied_lum              \
	);                               \

// This is the define used to calculate falloff.
#define LUM_FALLOFF(C, T) (1 - CLAMP01(sqrt((C.x - T.x) ** 2 + (C.y - T.y) ** 2 + LIGHTING_HEIGHT) / max(1, SUNLIGHT_RANGE)))

/datum/sunlight_source/proc/apply_lum()
	var/static/update_gen = 1
	applied = 1

	// Keep track of the last applied lum values so that the lighting can be reversed
	applied_lum = lum

	FOR_DVIEW(var/turf/T, SUNLIGHT_RANGE, source_turf, INVISIBILITY_LIGHTING)
		if(T.is_openspace() && !T.has_junction_closedspace())
			continue

		T.sun_lighting_build_overlay()

		if (!T.sun_lighting_corners_initialised)
			T.sun_generate_missing_corners()

		for (var/datum/sunlighting_corner/C in T.sun_get_corners())
			if (C.update_gen == update_gen)
				continue

			C.update_gen = update_gen
			C.affecting += src

			if (!C.active)
				effect_str[C] = 0
				continue

			APPLY_CORNER(C)

		if (!T.sun_affecting_lights)
			T.sun_affecting_lights = list()

		T.sun_affecting_lights += src
		affecting_turfs    += T

	update_gen++

/datum/sunlight_source/proc/remove_lum()
	applied = FALSE

	for (var/turf/T in affecting_turfs)
		if (!T.sun_affecting_lights)
			T.sun_affecting_lights = list()
		else
			T.sun_affecting_lights -= src

	affecting_turfs.Cut()

	for (var/datum/sunlighting_corner/C in effect_str)
		REMOVE_CORNER(C)

		C.affecting -= src

	effect_str.Cut()

/datum/sunlight_source/proc/recalc_corner(var/datum/sunlighting_corner/C)
	if (effect_str.Find(C)) // Already have one.
		REMOVE_CORNER(C)

	APPLY_CORNER(C)

/datum/sunlight_source/proc/smart_vis_update()
	var/list/datum/sunlighting_corner/corners = list()
	var/list/turf/turfs                    = list()
	FOR_DVIEW(var/turf/T, SUNLIGHT_RANGE, source_turf, 0)
		if(T.is_openspace() && !T.has_junction_closedspace())
			continue
		T.sun_lighting_build_overlay()
		if (!T.sun_lighting_corners_initialised)
			T.sun_generate_missing_corners()
		corners |= T.sun_get_corners()
		turfs   += T

	var/list/L = turfs - affecting_turfs // New turfs, add us to the affecting lights of them.
	affecting_turfs += L
	for (var/turf/T in L)
		if (!T.sun_affecting_lights)
			T.sun_affecting_lights = list(src)
		else
			T.sun_affecting_lights += src

	L = affecting_turfs - turfs // Now-gone turfs, remove us from the affecting lights.
	affecting_turfs -= L
	for (var/turf/T in L)
		T.sun_affecting_lights -= src

	for (var/datum/sunlighting_corner/C in corners - effect_str) // New corners
		C.affecting += src
		if (!C.active)
			effect_str[C] = 0
			continue

		APPLY_CORNER(C)

	for (var/datum/sunlighting_corner/C in effect_str - corners) // Old, now gone, corners.
		C.affecting -= src
		REMOVE_CORNER(C)
		effect_str -= C

#undef effect_update
#undef LUM_FALLOFF
#undef REMOVE_CORNER
#undef APPLY_CORNER
