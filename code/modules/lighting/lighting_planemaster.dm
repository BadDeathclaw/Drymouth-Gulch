/obj/lighting_plane
	screen_loc = "1,1"
	plane = LIGHTING_PLANE
	layer = 2
	blend_mode = BLEND_MULTIPLY
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR
	// use 20% ambient lighting; be sure to add full alpha

	color = list(
			-1, 00, 00, 00,
			00, -1, 00, 00,
			00, 00, -1, 00,
			00, 00, 00, 00,
			01, 01, 01, 01
		)
  
	mouse_opacity = 0    // nothing on this plane is mouse-visible


// /obj/screen/plane_master/sunlight
// 	name = "sunlight plane master"
// 	plane = SUNLIGHTING_PLANE
// 	blend_mode = BLEND_MULTIPLY
// 	mouse_opacity = MOUSE_OPACITY_TRANSPARENT


// /obj/screen/fullscreen/lighting_backdrop/sunlight
// 	invisibility = INVISIBILITY_LIGHTING
// 	layer = BACKGROUND_LAYER+21
// 	plane = SUNLIGHTING_PLANE
// 	show_when_dead = TRUE

// /obj/screen/plane_master/sunlight/backdrop(mob/mymob)
// 	mymob.overlay_fullscreen("lighting_backdrop_sunlight", /obj/screen/fullscreen/lighting_backdrop/sunlight)

    
// /obj/screen/plane_master/lighting/backdrop(mob/mymob)
// 	mymob.overlay_fullscreen("lighting_backdrop", /obj/screen/fullscreen/lighting_backdrop)
	// mymob.overlay_fullscreen("lighting_backdrop_lit", /obj/screen/fullscreen/lighting_backdrop/lit)
	// mymob.overlay_fullscreen("lighting_backdrop_unlit", /obj/screen/fullscreen/lighting_backdrop/unlit)


/obj/lighting_general
	plane = LIGHTING_PLANE
	icon = LIGHTING_ICON
	blend_mode = BLEND_MULTIPLY
	icon_state = "dark"
	screen_loc = "8,8"
	color = "#ffffff"



/obj/lighting_general/Initialize()
	. = ..()
	var/matrix/M = matrix()
	M.Scale(world.view*2.2)

	transform = M

/mob
	var/obj/lighting_plane/l_plane
	var/obj/lighting_general/l_general

//Provides darkness to the back of the lighting plane
// /obj/screen/fullscreen/lighting_backdrop/lit
// 	invisibility = INVISIBILITY_LIGHTING
// 	layer = BACKGROUND_LAYER+21
// 	color = "#000"

// //Provides whiteness in case you don't see lights so everything is still visible
// /obj/screen/fullscreen/lighting_backdrop/unlit
// 	layer = BACKGROUND_LAYER+20

// /obj/screen/fullscreen/see_through_darkness
// 	icon_state = "nightvision"
// 	plane = LIGHTING_PLANE
// 	layer = LIGHTING_LAYER
// 	blend_mode = BLEND_SUBTRACT
// 	show_when_dead = TRUE
