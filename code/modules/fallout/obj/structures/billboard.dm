//Fallout 13 decorative billboards directory

/obj/structure/billboard
	name = "billboard"
	desc = "Shitspawn detected!<br>Please report the admin abuse immediately!<br>Just kidding, nevermind."
	icon_state = "null"
	density = 1
	anchored = 1
	layer = 5
	icon = 'icons/fallout/machines/64x64.dmi'
	resistance_flags = INDESTRUCTIBLE

/obj/structure/billboard/New()
	..()

	var/go/S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()

/obj/structure/billboard/ritas
	name = "Rita's Cafe billboard"
	desc = "A defaced pre-War ad for Rita's Cafe.<br>The wasteland has taken its toll on the board."
	icon_state = "ritas1"

/obj/structure/billboard/ritas/New()
	..()
	icon_state = pick("ritas2","ritas3","ritas4")

/obj/structure/billboard/ritas/pristine
	name = "pristine Rita's Cafe billboard"
	desc = "A pre-War ad for Rita's Cafe.<br>Oddly enough, it's good as new."
	icon_state = "ritas1"

/obj/structure/billboard/ritas/pristine/New()
	..()
	icon_state = "ritas1"

/obj/structure/billboard/cola
	name = "Nuka-Cola billboard"
	desc = "A defaced pre-War ad for Nuka-Cola.<br>The wasteland has taken its toll on the board."
	icon_state = "cola1"

/obj/structure/billboard/cola/New()
	..()
	icon_state = pick("cola2","cola3","cola4")

/obj/structure/billboard/cola/pristine
	name = "pristine Nuka-Cola billboard"
	desc = "A pre-War ad for Nuka-Cola.<br>Oddly enough, it's good as new."
	icon_state = "cola1"

/obj/structure/billboard/cola/pristine/New()
	..()
	icon_state = "cola1"