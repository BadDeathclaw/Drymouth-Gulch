/obj/screen/plane_master/lighting
	name = "sun lighting plane master"
	plane = SUNLIGHTING_PLANE
	layer = LIGHTING_LAYER
	blend_mode = BLEND_ADD
	icon = 'icons/effects/alphacolors.dmi'
	invisibility     = INVISIBILITY_LIGHTING
	appearance_flags = RESET_TRANSFORM | RESET_ALPHA | PLANE_MASTER
	mouse_opacity = 0

/obj/screen/plane_master/lighting/New()
	. = ..()
	color = SSsunlight.current_color
	SSsunlight.sunlighting_planes |= src

/obj/screen/plane_master/lighting/Destroy()
	SSsunlight.sunlighting_planes -= src
	. = ..()