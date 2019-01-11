//=========== RELOADING RECIPES
//= 10mm

/datum/crafting_recipe/c10mmbox
	name = "10mm bullet box"
	result = /obj/item/ammo_box/c10mm
	reqs = list(/datum/reagent/blackpowder = 60, /obj/item/stack/sheet/metal = 5)
	station = "Ammo Crafting Bench"
	time = 20
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c10mm
	name = "10mm bullet"
	result = /obj/item/ammo_casing/c10mm
	reqs = list(/obj/item/ammo_casing/c10mm = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c10mmhp
	name = "10mm hollow-point bullet"
	result = /obj/item/ammo_casing/c10mm/hp
	reqs = list(/obj/item/ammo_casing/c10mm = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c10mmap
	name = "10mm armour-piercing bullet"
	result = /obj/item/ammo_casing/c10mm/ap
	reqs = list(/obj/item/ammo_casing/c10mm = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c10mmr
	name = "10mm rubber bullet"
	result = /obj/item/ammo_casing/c10mm/r
	reqs = list(/obj/item/ammo_casing/c10mm = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= 45
/datum/crafting_recipe/c45box
	name = ".45 bullet box"
	result = /obj/item/ammo_box/c45
	reqs = list(/datum/reagent/blackpowder = 60, /obj/item/stack/sheet/metal = 5)
	station = "Ammo Crafting Bench"
	time = 20
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c45
	name = ".45 bullet"
	result = /obj/item/ammo_casing/c45
	reqs = list(/obj/item/ammo_casing/c45 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c45hp
	name = ".45 hollow-point bullet"
	result = /obj/item/ammo_casing/c45/hp
	reqs = list(/obj/item/ammo_casing/c45 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c45ap
	name = ".45 armour-piercing bullet"
	result = /obj/item/ammo_casing/c45/ap
	reqs = list(/obj/item/ammo_casing/c45 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c45r
	name = ".45 rubber bullet"
	result = /obj/item/ammo_casing/c45/r
	reqs = list(/obj/item/ammo_casing/c45 = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= 9mm
/datum/crafting_recipe/c9mmbox
	name = "9mm bullet box"
	result = /obj/item/ammo_casing/c9mm
	reqs = list(/datum/reagent/blackpowder = 60, /obj/item/stack/sheet/metal = 4)
	station = "Ammo Crafting Bench"
	time = 20
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c9mm
	name = "9mm bullet"
	result = /obj/item/ammo_casing/c9mm
	reqs = list(/obj/item/ammo_casing/c9mm = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c9mmhp
	name = "9mm hollow-point bullet"
	result = /obj/item/ammo_casing/c9mm/hp
	reqs = list(/obj/item/ammo_casing/c9mm = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c9mmap
	name = "9mm armour-piercing bullet"
	result = /obj/item/ammo_casing/c9mm/ap
	reqs = list(/obj/item/ammo_casing/c9mm = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c9mmr
	name = "9mm rubber bullet"
	result = /obj/item/ammo_casing/c9mm/r
	reqs = list(/obj/item/ammo_casing/c9mm = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= 44
/datum/crafting_recipe/m44box
	name = ".44 Speed Loader"
	result = /obj/item/ammo_casing/m44
	reqs = list(/datum/reagent/blackpowder = 21, /obj/item/stack/sheet/metal = 2)
	station = "Ammo Crafting Bench"
	time = 6
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/m44
	name = ".44 bullet"
	result = /obj/item/ammo_casing/m44
	reqs = list(/obj/item/ammo_casing/m44 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/m44hp
	name = ".44 hollow-point bullet"
	result = /obj/item/ammo_casing/m44/hp
	reqs = list(/obj/item/ammo_casing/m44 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/m44ap
	name = "44 armour-piercing bullet"
	result = /obj/item/ammo_casing/m44/ap
	reqs = list(/obj/item/ammo_casing/m44 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/m44r
	name = ".44 rubber bullet"
	result = /obj/item/ammo_casing/m44
	reqs = list(/obj/item/ammo_casing/m44 = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= 38
/datum/crafting_recipe/c38box
	name = ".38 Speed Loader"
	result = /obj/item/ammo_box/c38
	reqs = list(/datum/reagent/blackpowder = 12, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 6
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c38
	name = ".38 bullet"
	result = /obj/item/ammo_casing/c38
	reqs = list(/obj/item/ammo_casing/c38 = 1, /datum/reagent/blackpowder = 2)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c38hp
	name = ".38 hollow-point bullet"
	result = /obj/item/ammo_casing/c38/hp
	reqs = list(/obj/item/ammo_casing/c38 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c38ap
	name = ".38 armour-piercing bullet"
	result = /obj/item/ammo_casing/c38/ap
	reqs = list(/obj/item/ammo_casing/c38 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c38r
	name = ".38 rubber bullet"
	result = /obj/item/ammo_casing/c38/r
	reqs = list(/obj/item/ammo_casing/c38 = 1, /datum/reagent/blackpowder = 1, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= 357
/datum/crafting_recipe/a357box
	name = ".357 Speed Loader"
	result = /obj/item/ammo_box/a357
	reqs = list(/datum/reagent/blackpowder = 21, /obj/item/stack/sheet/metal = 2)
	station = "Ammo Crafting Bench"
	time = 6
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a357
	name = ".357 bullet"
	result = /obj/item/ammo_casing/a357
	reqs = list(/obj/item/ammo_casing/a357 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a357hp
	name = ".357 hollow-point bullet"
	result = /obj/item/ammo_casing/a357/hp
	reqs = list(/obj/item/ammo_casing/a357 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a357ap
	name = ".357 armour-piercing bullet"
	result = /obj/item/ammo_casing/a357/ap
	reqs = list(/obj/item/ammo_casing/a357 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a357r
	name = ".357 rubber bullet"
	result = /obj/item/ammo_casing/a357/r
	reqs = list(/obj/item/ammo_casing/a357 = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= 556
/datum/crafting_recipe/a556box
	name = "5.56mm bullet box"
	result = /obj/item/ammo_box/a556
	reqs = list(/datum/reagent/blackpowder = 60, /obj/item/stack/sheet/metal = 10)
	station = "Ammo Crafting Bench"
	time = 20
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a556
	name = "5.56mm bullet"
	result = /obj/item/ammo_casing/a556
	reqs = list(/obj/item/ammo_casing/a556 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a556hp
	name = "5.56mm hollow-point bullet"
	result = /obj/item/ammo_casing/a556/hp
	reqs = list(/obj/item/ammo_casing/a556 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a556ap
	name = "5.56mm armour-piercing bullet"
	result = /obj/item/ammo_casing/a556/ap
	reqs = list(/obj/item/ammo_casing/a556 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a556r
	name = "5.56mm rubber bullet"
	result = /obj/item/ammo_casing/a556/r
	reqs = list(/obj/item/ammo_casing/a556 = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD


//= 762
/datum/crafting_recipe/a762
	name = "7.62 (Stripper Clip)"
	result = /obj/item/ammo_box/a762
	reqs = list(/datum/reagent/blackpowder = 30, , /obj/item/stack/sheet/metal = 5)
	station = "Ammo Crafting Bench"
	time = 10
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a762
	name = "7.62 bullet"
	result = /obj/item/ammo_casing/a762
	reqs = list(/obj/item/ammo_casing/a762 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a762hp
	name = "7.62 hollow-point bullet"
	result = /obj/item/ammo_casing/a762/hp
	reqs = list(/obj/item/ammo_casing/a762 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a762ap
	name = "7.62 armour-piercing bullet"
	result = /obj/item/ammo_casing/a762/ap
	reqs = list(/obj/item/ammo_casing/a762 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a762r
	name = "7.62 rubber bullet"
	result = /obj/item/ammo_casing/a762/r
	reqs = list(/obj/item/ammo_casing/a762 = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD


//= 308
/datum/crafting_recipe/a308box
	name = ".308 Stripper Clip"
	result = /obj/item/ammo_box/a308
	reqs = list(/datum/reagent/blackpowder = 15, /obj/item/stack/sheet/metal = 3)
	station = "Ammo Crafting Bench"
	time = 5
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a308
	name = ".308 bullet"
	result = /obj/item/ammo_casing/a308
	reqs = list(/obj/item/ammo_casing/a308 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a308hp
	name = ".308 hollow-point bullet"
	result = /obj/item/ammo_casing/a308/hp
	reqs = list(/obj/item/ammo_casing/a308 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a308ap
	name = ".308 armour-piercing bullet"
	result = /obj/item/ammo_casing/a308/ap
	reqs = list(/obj/item/ammo_casing/a308 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a308r
	name = ".308 rubber bullet"
	result = /obj/item/ammo_casing/a308/r
	reqs = list(/obj/item/ammo_casing/a308 = 1, /datum/reagent/blackpowder = 3, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= .45-70
/datum/crafting_recipe/c4570box
	name = ".45-70 Speed Loader"
	result = /obj/item/ammo_box/c4570
	reqs = list(/datum/reagent/blackpowder = 24, , /obj/item/stack/sheet/metal = 2)
	station = "Ammo Crafting Bench"
	time = 12
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c4570
	name = ".45-70 bullet"
	result = /obj/item/ammo_casing/c4570
	reqs = list(/obj/item/ammo_casing/c4570 = 1, /datum/reagent/blackpowder = 5)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c4570hp
	name = ".45-70 hollow-point bullet"
	result = /obj/item/ammo_casing/c4570/hp
	reqs = list(/obj/item/ammo_casing/c4570 = 1, /datum/reagent/blackpowder = 6)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/c4570ap
	name = ".45-70 armour-piercing bullet"
	result = /obj/item/ammo_casing/c4570/ap
	reqs = list(/obj/item/ammo_casing/c4570 = 1, /datum/reagent/blackpowder = 7, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 4
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= 50AE
/datum/crafting_recipe/a50AE
	name = ".50AE bullet"
	result = /obj/item/ammo_casing/a50AE
	reqs = list(/obj/item/ammo_casing/a50AE = 1, /datum/reagent/blackpowder = 5)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a50AEhp
	name = ".50AE hollow-point bullet"
	result = /obj/item/ammo_casing/a50AE/hp
	reqs = list(/obj/item/ammo_casing/a50AE = 1, /datum/reagent/blackpowder = 6)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

/datum/crafting_recipe/a50AEap
	name = ".50AE armour-piercing bullet"
	result = /obj/item/ammo_casing/a50AE/ap
	reqs = list(/obj/item/ammo_casing/a50AE = 1, /datum/reagent/blackpowder = 7)
	station = "Ammo Crafting Bench"
	time = 4
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= Beanbag Slug
/datum/crafting_recipe/beanbag_slug
	name = "Beanbag Slug"
	result = /obj/item/ammo_casing/shotgun/beanbag
	reqs = list(/datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= Rubber Shot
/datum/crafting_recipe/rubber_shot
	name = "Rubber Shot"
	result = /obj/item/ammo_casing/shotgun/rubbershot
	reqs = list(/datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= Shotgun Slug
/datum/crafting_recipe/shotgun_slug
	name = "Shotgun Slug"
	result = /obj/item/ammo_casing/shotgun
	reqs = list(/datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= Buck Shot
/datum/crafting_recipe/buck_shot
	name = "Buck Shot"
	result = /obj/item/ammo_casing/shotgun/buckshot
	reqs = list(/datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= Shotgun Dart
/datum/crafting_recipe/buck_shot
	name = "Shotgun Dart"
	result = /obj/item/ammo_casing/shotgun/dart
	reqs = list(/datum/reagent/blackpowder = 5, /obj/item/stack/sheet/plastic = 2)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD

//= Incendiary Slug
/datum/crafting_recipe/buck_shot
	name = "Incendiary Slug"
	result = /obj/item/ammo_casing/shotgun/incendiary
	reqs = list(/datum/reagent/blackpowder = 5, /datum/reagent/fuel = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_WEAPONRY
	subcategory = CAT_RELOAD
