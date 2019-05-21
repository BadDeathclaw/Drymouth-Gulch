//Fallout 13 main windows directory

/obj/structure/window/fulltile/ruins
	icon = 'icons/fallout/objects/structures/windows.dmi'
	icon_state = "ruinswindow"
	dir = 5
	max_integrity = 20
	fulltile = 1
	smooth = 0
	level = 3

/obj/structure/window/fulltile/ruins/broken
	icon_state = "ruinswindowbroken"
	max_integrity = 1

/obj/structure/window/fulltile/house
	icon = 'icons/fallout/objects/structures/windows.dmi'
	icon_state = "housewindow"
	dir = 5
	max_integrity = 40
	fulltile = 1
	smooth = 0
	level = 3

/obj/structure/window/fulltile/house/broken
	icon_state = "housewindowbroken"
	max_integrity = 1

/obj/structure/window/fulltile/wood
	icon = 'icons/fallout/objects/structures/windows.dmi'
	icon_state = "woodwindow"
	dir = 5
	max_integrity = 50
	fulltile = 1
	smooth = 0
	level = 3

/obj/structure/window/fulltile/wood/broken
	icon_state = "woodwindowbroken"
	max_integrity = 1

/obj/structure/window/fulltile/store
	icon = 'icons/fallout/objects/structures/windows.dmi'
	icon_state = "storewindowhorizontal"
	dir = 5
	max_integrity = 100
	fulltile = 1
	smooth = 0
	level = 3

/obj/structure/window/fulltile/attackby(obj/item/I, mob/user, params)
	if(!istype(I, /obj/item/stack/sheet/mineral/wood))
		for(var/obj/structure/barricade/wooden/planks/P in src.loc)
			P.attackby(I, user, params)
			return
		..()