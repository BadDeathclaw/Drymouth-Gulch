/obj/structure/sign/bilboards
	name = "Broken bilboard"
	desc = "REE MAPPERBUS WHY."
	icon = 'icons/effects/64x64_F13.dmi'
	anchored = TRUE
	layer = MASSIVE_OBJ_LAYER
	var/random_basetype
	var/never_random = FALSE // used for the 'random' subclasses.

/obj/structure/sign/bilboards/random
	name = "\improper Random signs"
	icon_state = "random"
	desc = "Uh oh!"
	never_random = TRUE
	random_basetype = /obj/structure/sign/bilboards/ads

/obj/structure/sign/bilboards/random/Initialize()
	..()
	if(random_basetype)
		randomise(random_basetype)

/obj/structure/sign/bilboards/random/proc/randomise(base_type)
	var/list/poster_types = subtypesof(base_type)
	var/list/approved_types = list()
	for(var/t in poster_types)
		var/obj/structure/sign/bilboards/T = t
		if(initial(T.icon_state) && !initial(T.never_random))
			approved_types |= T

	var/obj/structure/sign/poster/selected = pick(approved_types)

	name = initial(selected.name)
	desc = initial(selected.desc)
	icon_state = initial(selected.icon_state)

/obj/structure/sign/bilboards/ads/cola1
	name = "nuka cola bilboard"
	desc = "A bilboard about nukacola."
	icon_state = "cola1"

/obj/structure/sign/bilboards/ads/cola2
	name = "nuka cola bilboard"
	desc = "A bilboard about nukacola. It looks damaged."
	icon_state = "cola2"

/obj/structure/sign/bilboards/ads/cola3
	name = "nuka cola bilboard"
	desc = "A bilboard about nukacola. It looks damaged and sprayed with oil."
	icon_state = "cola3"

/obj/structure/sign/bilboards/ads/cola4
	name = "nuka cola bilboard"
	desc = "A bilboard about nukacola. It has a spray saying \"fuck NCR\"."
	icon_state = "cola4"

/obj/structure/sign/bilboards/ads/rita1
	name = "Rita's cafe bilboard"
	desc = "A bilboard advertising Rita's cafe."
	icon_state = "ritas1"

/obj/structure/sign/bilboards/ads/rita2
	name = "Rita's cafe bilboard"
	desc = "A bilboard advertising Rita's cafe. It looks rusted and damaged."
	icon_state = "ritas2"

/obj/structure/sign/bilboards/ads/rita3
	name = "Rita's cafe bilboard"
	desc = "A bilboard advertising Rita's cafe. It has a spray saying \"help us\"."
	icon_state = "ritas3"

/obj/structure/sign/bilboards/ads/rita4
	name = "Rita's cafe bilboard"
	desc = "A bilboard advertising Rita's cafe. It has a spray saying \"AVE CAESAR\"."
	icon_state = "ritas4"

/obj/structure/sign/bilboards/den
	name = "Kebab sign"
	desc =  "A sprayed metal sheet that says \"Kebab \"."
	icon_state = "den"

/obj/structure/sign/bilboards/klamat
	name = "Klamat sign"
	desc =  "A ruined sign that says \"Klamat \"."
	icon_state = "klamat"
