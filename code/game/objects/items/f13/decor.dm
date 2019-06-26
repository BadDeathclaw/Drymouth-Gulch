//Fallout 13 structural decorations directory

/obj/structure/decoration
	anchored = 1
	level = ABOVE_NORMAL_TURF_LAYER

/obj/structure/decoration/rag //Generic decoration. See decals.dmi - there are more things to choose the proper icon_state in map editor.
	name = "rag"
	desc = "A torn and dirty rag.<br>It could have been a curtain, or a bedsheet ages ago..."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "rag" //skulls, skin
	layer = 3.2

/obj/structure/decoration/sign //Signs.
	name = "sign"
	desc = "A standard sign, created to provide some important (or not so) information about the current location."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "vault_blank" //See decals.dmi for different icon states for different signs.

/obj/structure/decoration/clock //Wall clocks.
	name = "clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>This particular clock has stopped at 06:45 / 18:45<br>Why did it stop? The clock itself appears to be intact."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "clock"

/obj/structure/decoration/clock/active
	name = "clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>You can hear a quiet ticking coming from the clock."
	icon_state = "clock_act"

/obj/structure/decoration/clock/old
	name = "\improper old clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>The clock was stopped by a distant nuclear blast on October 23, 2077 at 09:49 a.m."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "old_clock"

/obj/structure/decoration/clock/old/active
	name = "\improper old clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>Despite the age, this particular clock is still functional and you can hear a quiet ticking coming from it."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "old_clock_act"

/obj/structure/decoration/vent //Decorative vents for vaults and bunkers.
	name = "vent"
	desc = "An exhaust ventilation system designed to keep the air safe via several stages of filtering."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "ventblue" //ventred, ventorange

/obj/structure/decoration/vent/rusty
	name = "rusty vent"
	desc = "It's very old and rusty.<br>You can hear some wierd sounds coming from the insides of the vent."
	icon_state = "ventrusty" //ventrustyalt

/obj/structure/decoration/ruins //Ruin decorations - they overlap the player most of time, thus they provide a nearly perfect hiding spot.
	name = "\improper ruins"
	desc = "Either the blast nearby was hard enough, or the decades of fallout and absence of maintenance did their part.<br>Be careful so that one of these don't fall on you from above."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "overlap" //See decals.dmi for different icon states of ruins overlays.
	layer = 4.2

/obj/structure/decoration/hatch //Road decorations
	name = "street water drain"
	desc = "An ancient drainage system to protect the roads from flooding."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "hatch" // hatchbroken

/obj/structure/decoration/reflector
	name = "road reflector"
	desc = "An ancient road safety device.<br>Here's how it works:<br>A reflective plate is reflecting the street and car lights ensuring the visibility of the road median separating the lanes.<br>The steel part makes a small regular bump along the median to wake the driver if he/she drifts across."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "reflectorvertical" //reflectorhorizontal