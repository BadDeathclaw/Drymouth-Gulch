/obj/screen/fullscreen/death
	icon = 'icons/fallout/misc/lobby.dmi'
	icon_state = "wasteland1"
	screen_loc = "1,1"
	plane = 100

/obj/screen/fullscreen/death/New()
	..()
	icon_state = "wasteland[rand(1,2)]"