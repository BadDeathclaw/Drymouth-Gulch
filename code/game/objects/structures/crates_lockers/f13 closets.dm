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
	//new /obj/item/seeds/plantnamehrere(src)

/obj/structure/closet/f13/leigon/scollar
	name = "closet"

/obj/structure/closet/f13/leigon/scollar/PopulateContents()
	..()
	for(var/i in 1 to 4)
		new /obj/item/assembly/signaler/electropack/shockcollar(src)


/obj/structure/closet/f13/leigon/spants
	name = "closet"

/obj/structure/closet/f13/leigon/spants/PopulateContents()
	..()
	for(var/i in 1 to 4)
		new /obj/item/clothing/under/f13/caravan(src)

/obj/structure/closet/f13/leigon/ssandals
	name = "closet"

/obj/structure/closet/f13/leigon/ssandals/PopulateContents()
	..()
	for(var/i in 1 to 4)
		new /obj/item/clothing/shoes/sandal(src)