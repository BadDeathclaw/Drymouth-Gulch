/obj/structure/sign/bilboards
	name = "Broken bilboard"
	desc = "REE MAPPERBUS WHY."
	icon = 'icons/effects/64x64_F13.dmi'
	anchored = TRUE
	layer = MASSIVE_OBJ_LAYER

/obj/structure/sign/bilboards/random
	name = "\improper Random signs"
	icon_state = "random"
	desc = "Uh oh!"

/obj/structure/sign/bilboards/random/Initialize()
	..()
	var/T = pick(subtypesof(/obj/structure/sign/bilboards) - list("/obj/structure/sign/bilboards/random", "/obj/structure/sign/bilboards", "/obj/structure/sign/bilboards/den", "/obj/structure/sign/bilboards/klamat"))
	new T(loc)
	return INITIALIZE_HINT_QDEL

/obj/structure/sign/bilboards/cola1
	name = "nuka cola bilboard"
	desc = "A bilboard about nukacola."
	icon_state = "cola1"

/obj/structure/sign/bilboards/cola2
	name = "nuka cola bilboard"
	desc = "A bilboard about nukacola. It looks damaged."
	icon_state = "cola2"

/obj/structure/sign/bilboards/cola3
	name = "nuka cola bilboard"
	desc = "A bilboard about nukacola. It looks damaged and sprayed with oil."
	icon_state = "cola3"

/obj/structure/sign/bilboards/cola4
	name = "nuka cola bilboard"
	desc = "A bilboard about nukacola. It has a spray saying \"fuck NCR\"."
	icon_state = "cola4"

/obj/structure/sign/bilboards/rita1
	name = "Rita's cafe bilboard"
	desc = "A bilboard advertising Rita's cafe."
	icon_state = "ritas1"

/obj/structure/sign/bilboards/rita2
	name = "Rita's cafe bilboard"
	desc = "A bilboard advertising Rita's cafe. It looks rusted and damaged."
	icon_state = "ritas2"

/obj/structure/sign/bilboards/rita3
	name = "Rita's cafe bilboard"
	desc = "A bilboard advertising Rita's cafe. It has a spray saying \"help us\"."
	icon_state = "ritas3"

/obj/structure/sign/bilboards/rita4
	name = "Rita's cafe bilboard"
	desc = "A bilboard advertising Rita's cafe. It has a spray saying \"AVE CAESAR\"."
	icon_state = "ritas4"

/obj/structure/sign/bilboards/den
	name = "Den sign"
	desc =  "A sprayed metal sheet that says \"The Den \"."
	icon_state = "den"

/obj/structure/sign/bilboards/klamat
	name = "Klamat sign"
	desc =  "A ruined sign that says \"Klamat \"."
	icon_state = "klamat"