/obj/structure/closet/f13
	name = "dont use this"

/obj/structure/closet/f13/leigon
	name = "still, dont use this"

/obj/structure/closet/f13/leigon/plants
	name = "closet"

/obj/structure/closet/f13/leigon/plants/PopulateContents()
	..()
	new /obj/item/seeds/corn(src)
	new /obj/item/cultivator(src)
	new /obj/item/storage/bag/plants(src)
	new /obj/item/seeds/tower(src)
	new /obj/item/seeds/watermelon(src)
	new /obj/item/seeds/poppy/broc(src)
	new /obj/item/seeds/xander(src)
	new /obj/item/seeds/wheat(src)
	new /obj/item/seeds/cotton(src)
	//new /obj/item/seeds/plantnamehrere(src)

/obj/structure/closet/f13/leigon/slave
	name = "closet"

/obj/structure/closet/f13/leigon/slave/PopulateContents()
	..()
	for(var/i in 1 to 4)
		new /obj/item/assembly/signaler/electropack/shockcollar(src)
		new /obj/item/clothing/under/f13/caravan(src)
		new /obj/item/clothing/shoes/sandal(src)
	return

/obj/structure/closet/cardboard/f13
	name = "don't use this"

/obj/structure/closet/cardboard/f13/legion
	name = "still dont use this"

/obj/structure/closet/cardboard/f13/legion/caravanshotgun
	name = "large cardboard box"

/obj/structure/closet/cardboard/f13/legion/caravanshotgun/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/gun/ballistic/revolver/caravan_shotgun(src)
	return

/obj/structure/closet/cardboard/f13/legion/singleshotgun
	name = "large cardboard box"

/obj/structure/closet/cardboard/f13/legion/singleshotgun/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/gun/ballistic/revolver/single_shotgun(src)
	return

/obj/structure/closet/cardboard/f13/legion/m44
	name = "large cardboard box"

/obj/structure/closet/cardboard/f13/legion/m44/PopulateContents()
	..()
	for(var/i in 1 to 8)
		new /obj/item/ammo_box/m44(src)
	return

/obj/structure/closet/cardboard/f13/legion/buckshots
	name = "large cardboard box"

/obj/structure/closet/cardboard/f13/legion/buckshots/PopulateContents()
	..()
	for(var/i in 1 to 8)
		new /obj/item/storage/box/lethalshot(src)
	return

/obj/structure/closet/cardboard/f13/legion/swrevolver
	name = "large cardboard box"

/obj/structure/closet/cardboard/f13/legion/swrevolver/PopulateContents()
	..()
	for(var/i in 1 to 7)
		new /obj/item/gun/ballistic/revolver/m29(src)
	return

/obj/structure/closet/cardboard/f13/legion/ithicashotgun
	name = "large cardboard box"

/obj/structure/closet/cardboard/f13/legion/ithicashotgun/PopulateContents()
	..()
	for(var/i in 1 to 4)
		new /obj/item/gun/ballistic/shotgun(src)
	return

/obj/structure/closet/cardboard/f13/legion/lantern
	name = "large cardboard box"

/obj/structure/closet/cardboard/f13/legion/lantern/PopulateContents()
	..()
	for(var/i in 1 to 16)
		new /obj/item/flashlight/lantern(src)
	return

/obj/structure/closet/cardboard/f13/legion/machete
	name = "large cardboard box"

/obj/structure/closet/cardboard/f13/legion/machete/PopulateContents()
	..()
	for(var/i in 1 to 6)
		new /obj/item/claymore/machete(src)
	return

/obj/structure/closet/cardboard/f13/legion/c4
	name = "large cardboard box"

/obj/structure/closet/cardboard/f13/legion/c4/PopulateContents()
	for(var/i in 1 to 4)
		new /obj/item/grenade/plastic/c4(src)
	return