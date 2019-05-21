//Fallout 13 general destructible walls directory

/turf/closed/wall/f13/
	name = "glitch"
	desc = "<font color='#6eaa2c'>You suddenly realize the truth - there is no spoon.<br>Something has caused a glitch in the simulation.</font>"
	icon = 'icons/fallout/turfs/walls.dmi'
	icon_state = "matrix"

/turf/closed/wall/f13/ReplaceWithLattice()
	ChangeTurf(baseturf)

/turf/closed/wall/f13/ruins
	name = "ruins"
	desc = "All what has left from the good old days."
	icon = 'icons/fallout/turfs/walls/ruins.dmi'
	icon_state = "ruins0"
	icontype = "ruins"
	hardness = 70
	explosion_block = 2
	smooth = SMOOTH_OLD
	disasemblable = 0
	grider = 0
	plating_type = /turf/open/ruins
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall/f13/ruins, /turf/closed/wall)


/turf/closed/wall/f13/wood
	name = "wooden wall"
	desc = "A traditional wooden wall."
	icon = 'icons/fallout/turfs/walls/wood.dmi'
	icon_state = "wood0"
	icontype = "wood"
	hardness = 60
	smooth = SMOOTH_OLD
	disasemblable = 0
	plating_type = /turf/open/floor/plating/wooden
	sheet_type = /obj/item/stack/sheet/mineral/wood
	sheet_amount = 2
	grider = 0
	canSmoothWith = list(/turf/closed/wall/f13/wood, /turf/closed/wall)

/turf/closed/wall/f13/wood/house
	name = "house wall"
	desc = "A weathered pre-War house wall."
	icon = 'icons/fallout/turfs/walls/house.dmi'
	icon_state = "house0"
	icontype = "house"
	hardness = 50
	var/broken = 0
	canSmoothWith = list(/turf/closed/wall/f13/wood/house, /turf/closed/wall/f13/wood/house/broken, /turf/closed/wall)

/turf/closed/wall/f13/wood/house/broken
	broken = 1
	damage = 21
	icon_state = "house0-broken"

/turf/closed/wall/f13/wood/house/take_damage(dam)
	if(damage + dam > hardness/2)
		broken = 1
	..()

/turf/closed/wall/f13/wood/house/relative()
	icon_state = "[icontype][junction][broken ? "-broken" : ""]"

/turf/closed/wall/f13/wood/house/update_icon()
	if(broken)
		set_opacity(0)
	..()

/turf/closed/wall/f13/wood/house/update_damage_overlay()
	if(broken)
		return
	..()

/turf/closed/wall/f13/wood/interior
	name = "interior wall"
	desc = "Interesting, what kind of material they have used - these wallpapers still look good after all the centuries..."
	icon = 'icons/fallout/turfs/walls/interior.dmi'
	icon_state = "interior0"
	icontype = "interior"
	hardness = 10
	smooth = SMOOTH_OLD
	canSmoothWith = list(/turf/closed/wall/f13/wood/interior, /turf/closed/wall)

/turf/closed/wall/f13/store
	name = "store wall"
	desc = "A pre-War store wall made of solid concrete."
	icon = 'icons/fallout/turfs/walls/store.dmi'
	icon_state = "store0"
	icontype = "store"
	hardness = 80
	smooth = SMOOTH_OLD
	disasemblable = 0
	grider = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall/f13/store, /turf/closed/wall)

/turf/closed/wall/f13/supermart
	name = "supermart wall"
	desc = "A pre-War supermart wall made of reinforced concrete."
	icon = 'icons/fallout/turfs/walls/superstore.dmi'
	icon_state = "supermart0"
	icontype = "supermart"
	hardness = 90
	explosion_block = 2
	smooth = SMOOTH_OLD
	disasemblable = 0
	grider = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall/f13/supermart, /turf/closed/wall)

/turf/closed/wall/f13/tunnel
	name = "utility tunnel wall"
	desc = "A sturdy metal wall with various pipes and wiring set inside a special groove."
	icon = 'icons/fallout/turfs/walls/tunnel.dmi'
	icon_state = "tunnel0"
	icontype = "tunnel"
	hardness = 100
	smooth = SMOOTH_OLD
	disasemblable = 0
	grider = 0
	sheet_type = null
	canSmoothWith = list(/turf/closed/wall/f13/tunnel, /turf/closed/wall)

/turf/closed/wall/f13/vault
	name = "vault wall"
	desc = "A sturdy and cold metal wall."
	icon = 'icons/fallout/turfs/walls/vault.dmi'
	icon_state = "vault0"
	icontype = "vault"
	hardness = 130
	explosion_block = 5
	smooth = SMOOTH_OLD
	canSmoothWith = list(/turf/closed/wall/f13/vault, /turf/closed/wall/r_wall/f13/vault, /turf/closed/wall)

/turf/closed/wall/r_wall/f13
	name = "glitch"
	desc = "<font color='#6eaa2c'>You suddenly realize the truth - there is no spoon.<br>Something has caused a glitch in the simulation.</font>"
	icon = 'icons/fallout/turfs/walls.dmi'
	icon_state = "matrix"

/turf/closed/wall/r_wall/f13/vault
	name = "vault reinforced wall"
	desc = "A wall built to withstand an atomic explosion."
	icon = 'icons/fallout/turfs/walls/vault_reinforced.dmi'
	icon_state = "vaultrwall0"
	icontype = "vaultrwall"
	hardness = 230
	explosion_block = 5
	smooth = SMOOTH_OLD
	canSmoothWith = list(/turf/closed/wall/f13/vault, /turf/closed/wall/r_wall/f13/vault, /turf/closed/wall)

//Fallout 13 indestructible walls

/turf/closed/indestructible/f13
	name = "glitch"
	desc = "<font color='#6eaa2c'>You suddenly realize the truth - there is no spoon.<br>Something has caused a glitch in the simulation.</font>"
	icon = 'icons/fallout/turfs/walls.dmi'
	icon_state = "matrix"

/turf/closed/indestructible/f13/subway
	name = "tunnel wall"
	desc = "This wall is made of reinforced concrete.<br>Pre-War engineers knew how to build reliable things."
	icon = 'icons/fallout/turfs/walls/subway.dmi'
	icon_state = "subwaytop"

/turf/closed/indestructible/f13/matrix //The Chosen One from Arroyo!
	name = "matrix"
	desc = "<font color='#6eaa2c'>You suddenly realize the truth - there is no spoon.<br>Digital simulation ends here.</font>"
	icon_state = "matrix"

/turf/closed/indestructible/f13/obsidian //Just like that one game studio that worked on the original game, or that block in Minecraft!
	name = "obsidian"
	desc = "No matter what you do with this rock, there's not even a scratch left on its surface.<br><font color='#7e0707'>You shall not pass!!!</font>"
	icon = 'icons/fallout/turfs/mining.dmi'
	icon_state = "rock1"

/turf/closed/indestructible/f13/obsidian/New()
	..()
	icon_state = "rock[rand(1,6)]"

//Splashscreen

/turf/closed/indestructible/f13/splashscreen
	var/tickerPeriod = 300 //in deciseconds
	var/go/fullDark

turf/closed/indestructible/f13/splashscreen/New()
	.=..()
	name = "Fallout 13"
	desc = "The wasteland is calling!"
	icon = 'icons/fallout/misc/lobby.dmi'
	icon_state = "title[rand(1,13)]"
	layer = 60
	plane = 1
	src.fullDark = new/go{
		icon = 'icons/fallout/misc/lobby.dmi' //Replace with actual icon
		icon_state = "transition" //Replace with actual darkness state
		layer = 61;
		alpha = 0;
		}(src)
	src.fullDark.plane = 1
	spawn() src.ticker()
	return

turf/closed/indestructible/f13/splashscreen/proc/ticker()
	while(src && istype(src,/turf/closed/indestructible/f13/splashscreen))
		src.swapImage()
		sleep(src.tickerPeriod)
	to_chat(world, "Badmins spawn shit and the title screen was deleted.<br>You know... I'm out of here!")
	return

//Change the time to determine how short/long the fading animation is.
//Change the easing to determine what interpolation it uses to change the value on a curve: good ones to try are CUBIC, BOUNCE, and ELASTIC as well as CIRCULAR. BOUNCE and ELASTIC both "bounce" or "flicker" a little bit at the end instead of just finishing straight at black.

/turf/closed/indestructible/f13/splashscreen/proc/swapImage()
	animate(src.fullDark,alpha=255,time=10,easing=CUBIC_EASING)
	sleep(12) //buffer of about 1/5 of the time of the animation, since they are not synchronized: the sleep happens on the server, but the animation is played for each client using directX. It's good to leave a buffer, but most of the time the directX will be much faster than the server anyway so you probably wont have any problems.
	src.icon_state = "title[rand(1,13)]"
	animate(src.fullDark,alpha=0,time=10,easing=CUBIC_EASING)
	return