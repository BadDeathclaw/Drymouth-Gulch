/turf/closed
	layer = CLOSED_TURF_LAYER
	opacity = 1
	density = TRUE
	blocks_air = 1

/turf/closed/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/rad_insulation, RAD_MEDIUM_INSULATION)

/turf/closed/AfterChange()
	. = ..()
	SSair.high_pressure_delta -= src

/turf/closed/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	return FALSE

/turf/closed/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && (mover.pass_flags & PASSCLOSEDTURF))
		return TRUE
	return ..()

/turf/closed/indestructible
	name = "wall"
	icon = 'icons/turf/walls.dmi'
	explosion_block = 50

/turf/closed/indestructible/TerraformTurf(path, defer_change = FALSE, ignore_air = FALSE)
	return

/turf/closed/indestructible/acid_act(acidpwr, acid_volume, acid_id)
	return 0

/turf/closed/indestructible/Melt()
	to_be_destroyed = FALSE
	return src

/turf/closed/indestructible/oldshuttle
	name = "strange shuttle wall"
	icon = 'icons/turf/shuttleold.dmi'
	icon_state = "block"

/turf/closed/indestructible/sandstone
	name = "sandstone wall"
	desc = "A wall with sandstone plating. Rough."
	icon = 'icons/turf/walls/sandstone_wall.dmi'
	icon_state = "sandstone"
	baseturfs = /turf/closed/indestructible/sandstone
	smooth = SMOOTH_TRUE

/turf/closed/indestructible/oldshuttle/corner
	icon_state = "corner"




/turf/closed/indestructible/splashscreen
	var/tickerPeriod = 300 //in deciseconds
	var/atom/movable/fullDark
	bullet_bounce_sound = null
	name = "Bad Deathclaw"
	desc = "The wasteland is calling.."
	//icon = 'icons/blank_title.png'
	layer = FLY_LAYER

/turf/closed/indestructible/splashscreen/New()
	icon = 'icons/misc/splashscreen.dmi'
	icon_state = "title1"

	src.fullDark = new/atom/movable{
		icon = 'icons/misc/splashscreen.dmi' //Replace with actual icon
		icon_state = "transition" //Replace with actual state
		layer = 61;
		alpha = 0;
		}(src)

	spawn() src.ticker()
	return

	//icon_state = "title[rand(1,13)]"
	//SStitle.splash_turf = src
	//if(SStitle.icon)
	//	icon = SStitle.icon
	//..()

/turf/closed/indestructible/splashscreen/proc/ticker()
	while(src && istype(src,/turf/closed/indestructible/splashscreen))
		src.swapImage()
		sleep(tickerPeriod)
	world << "Badmins spawned shit and title screen was deleted.<br>No more sexy splash screen for you!"
	return

/turf/closed/indestructible/splashscreen/proc/swapImage()
	animate(fullDark,alpha=255,time=10,easing=CUBIC_EASING)
	sleep(12) //buffer of about 1/5 of the time of the animation, since they are not synchronized: the sleep happens on the server, but the animation is played for each client using directX. It's good to leave a buffer, but most of the time the directX will be much faster than the server anyway so you probably wont have any problems.
	icon_state = "title[rand(1,13)]"
	animate(fullDark,alpha=0,time=10,easing=CUBIC_EASING)
	return

/turf/closed/indestructible/splashscreen/vv_edit_var(var_name, var_value)
	. = ..()
	if(.)
		switch(var_name)
			if("icon")
				SStitle.icon = icon





/turf/closed/indestructible/riveted
	icon = 'icons/turf/walls/riveted.dmi'
	icon_state = "riveted"
	smooth = SMOOTH_TRUE

/turf/closed/indestructible/riveted/uranium
	icon = 'icons/turf/walls/uranium_wall.dmi'
	icon_state = "uranium"

/turf/closed/indestructible/abductor
	icon_state = "alien1"

/turf/closed/indestructible/opshuttle
	icon_state = "wall3"

/turf/closed/indestructible/matrix
	icon_state = "matrix"
	desc = "<font color='#157206'>You suddenly realize the truth - there is no spoon.<br>Digital simulation ends here.</font>"

/turf/closed/indestructible/fakeglass
	name = "window"
	icon_state = "fake_window"
	opacity = 0
	smooth = SMOOTH_TRUE
	icon = 'icons/obj/smooth_structures/reinforced_window.dmi'

/turf/closed/indestructible/fakeglass/Initialize()
	. = ..()
	icon_state = null //set the icon state to null, so our base state isn't visible
	underlays += mutable_appearance('icons/obj/structures.dmi', "grille") //add a grille underlay
	underlays += mutable_appearance('icons/turf/floors.dmi', "plating") //add the plating underlay, below the grille

/turf/closed/indestructible/fakedoor
	name = "CentCom Access"
	icon = 'icons/obj/doors/airlocks/centcom/centcom.dmi'
	icon_state = "fake_door"

/turf/closed/indestructible/rock
	name = "dense rock"
	desc = "An extremely densely-packed rock, most mining tools or explosives would never get through this."
	icon = 'icons/turf/mining.dmi'
	icon_state = "rock"
	smooth = SMOOTH_TRUE

/turf/closed/indestructible/rock/snow
	name = "mountainside"
	desc = "An extremely densely-packed rock, sheeted over with centuries worth of ice and snow."
	icon = 'icons/turf/walls.dmi'
	icon_state = "snowrock"
	bullet_sizzle = TRUE
	bullet_bounce_sound = null

/turf/closed/indestructible/rock/snow/ice
	name = "iced rock"
	desc = "Extremely densely-packed sheets of ice and rock, forged over the years of the harsh cold."
	icon = 'icons/turf/walls.dmi'
	icon_state = "icerock"

/turf/closed/indestructible/paper
	name = "thick paper wall"
	desc = "A wall layered with impenetrable sheets of paper."
	icon = 'icons/turf/walls.dmi'
	icon_state = "paperwall"

/turf/closed/indestructible/necropolis
	name = "necropolis wall"
	desc = "A seemingly impenetrable wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "necro"
	explosion_block = 50
	baseturfs = /turf/closed/indestructible/necropolis

/turf/closed/indestructible/necropolis/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	underlay_appearance.icon = 'icons/turf/floors.dmi'
	underlay_appearance.icon_state = "necro1"
	return TRUE

/turf/closed/indestructible/riveted/boss
	name = "necropolis wall"
	desc = "A thick, seemingly indestructible stone wall."
	icon = 'icons/turf/walls/boss_wall.dmi'
	icon_state = "wall"
	canSmoothWith = list(/turf/closed/indestructible/riveted/boss, /turf/closed/indestructible/riveted/boss/see_through)
	explosion_block = 50
	baseturfs = /turf/closed/indestructible/riveted/boss

/turf/closed/indestructible/riveted/boss/see_through
	opacity = FALSE

/turf/closed/indestructible/riveted/boss/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	underlay_appearance.icon = 'icons/turf/floors.dmi'
	underlay_appearance.icon_state = "basalt"
	return TRUE

/turf/closed/indestructible/riveted/hierophant
	name = "wall"
	desc = "A wall made out of a strange metal. The squares on it pulse in a predictable pattern."
	icon = 'icons/turf/walls/hierophant_wall.dmi'
	icon_state = "wall"

/turf/closed/indestructible/vaultdoor
	name = "vault wall"
	desc = "A wall made out of metal, really fucking tough metal. They definitely didn't want everything to give away around the door."
	icon = 'icons/turf/walls/f13vault_reinforced_wall.dmi'
	icon_state = "vaultwall"