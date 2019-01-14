
/datum/bench_crafting_recipe/ammo
	name = "default ammo recipe"
	station = "Ammo Crafting Bench"
	category = CAT_PISTOL

//=========== RELOADING RECIPES
//= 10mm

/datum/bench_crafting_recipe/ammo/c10mmbox
	name = "10mm bullet box"
	results = list(/obj/item/ammo_box/c10mm)
	reqs = list(/datum/reagent/blackpowder = 60, /obj/item/stack/sheet/metal = 5)
	station = "Ammo Crafting Bench"
	time = 20
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c10mm
	name = "10mm bullet"
	results = list(/obj/item/ammo_casing/c10mm)
	reqs = list(/obj/item/ammo_casing/c10mm = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c10mmhp
	name = "10mm hollow-point bullet"
	results = list(/obj/item/ammo_casing/c10mm/hp)
	reqs = list(/obj/item/ammo_casing/c10mm = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c10mmap
	name = "10mm armour-piercing bullet"
	results = list(/obj/item/ammo_casing/c10mm/ap)
	reqs = list(/obj/item/ammo_casing/c10mm = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c10mmr
	name = "10mm rubber bullet"
	results = list(/obj/item/ammo_casing/c10mm/r)
	reqs = list(/obj/item/ammo_casing/c10mm = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_PISTOL

//= 45
/datum/bench_crafting_recipe/ammo/c45box
	name = ".45 bullet box"
	results = list(/obj/item/ammo_box/c45)
	reqs = list(/datum/reagent/blackpowder = 60, /obj/item/stack/sheet/metal = 5)
	station = "Ammo Crafting Bench"
	time = 20
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c45
	name = ".45 bullet"
	results = list(/obj/item/ammo_casing/c45)
	reqs = list(/obj/item/ammo_casing/c45 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c45hp
	name = ".45 hollow-point bullet"
	results = list(/obj/item/ammo_casing/c45/hp)
	reqs = list(/obj/item/ammo_casing/c45 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c45ap
	name = ".45 armour-piercing bullet"
	results = list(/obj/item/ammo_casing/c45/ap)
	reqs = list(/obj/item/ammo_casing/c45 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c45r
	name = ".45 rubber bullet"
	results = list(/obj/item/ammo_casing/c45/r)
	reqs = list(/obj/item/ammo_casing/c45 = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_PISTOL

//= 9mm
/datum/bench_crafting_recipe/ammo/c9mmbox
	name = "9mm bullet box"
	results = list(/obj/item/ammo_casing/c9mm)
	reqs = list(/datum/reagent/blackpowder = 60, /obj/item/stack/sheet/metal = 4)
	station = "Ammo Crafting Bench"
	time = 20
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c9mm
	name = "9mm bullet"
	results = list(/obj/item/ammo_casing/c9mm)
	reqs = list(/obj/item/ammo_casing/c9mm = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c9mmhp
	name = "9mm hollow-point bullet"
	results = list(/obj/item/ammo_casing/c9mm/hp)
	reqs = list(/obj/item/ammo_casing/c9mm = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c9mmap
	name = "9mm armour-piercing bullet"
	results = list(/obj/item/ammo_casing/c9mm/ap)
	reqs = list(/obj/item/ammo_casing/c9mm = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/c9mmr
	name = "9mm rubber bullet"
	results = list(/obj/item/ammo_casing/c9mm/r)
	reqs = list(/obj/item/ammo_casing/c9mm = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_PISTOL

//= 44
/datum/bench_crafting_recipe/ammo/m44box
	name = ".44 Speed Loader"
	results = list(/obj/item/ammo_casing/m44)
	reqs = list(/datum/reagent/blackpowder = 21, /obj/item/stack/sheet/metal = 2)
	station = "Ammo Crafting Bench"
	time = 6
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/m44
	name = ".44 bullet"
	results = list(/obj/item/ammo_casing/m44)
	reqs = list(/obj/item/ammo_casing/m44 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/m44hp
	name = ".44 hollow-point bullet"
	results = list(/obj/item/ammo_casing/m44/hp)
	reqs = list(/obj/item/ammo_casing/m44 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/m44ap
	name = ".44 armour-piercing bullet"
	results = list(/obj/item/ammo_casing/m44/ap)
	reqs = list(/obj/item/ammo_casing/m44 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/m44r
	name = ".44 rubber bullet"
	results = list(/obj/item/ammo_casing/m44)
	reqs = list(/obj/item/ammo_casing/m44 = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_REVOLVER

//= 38
/datum/bench_crafting_recipe/ammo/c38box
	name = ".38 Speed Loader"
	results = list(/obj/item/ammo_box/c38)
	reqs = list(/datum/reagent/blackpowder = 12, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 6
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/c38
	name = ".38 bullet"
	results = list(/obj/item/ammo_casing/c38)
	reqs = list(/obj/item/ammo_casing/c38 = 1, /datum/reagent/blackpowder = 2)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/c38hp
	name = ".38 hollow-point bullet"
	results = list(/obj/item/ammo_casing/c38/hp)
	reqs = list(/obj/item/ammo_casing/c38 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/c38ap
	name = ".38 armour-piercing bullet"
	results = list(/obj/item/ammo_casing/c38/ap)
	reqs = list(/obj/item/ammo_casing/c38 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/c38r
	name = ".38 rubber bullet"
	results = list(/obj/item/ammo_casing/c38/r)
	reqs = list(/obj/item/ammo_casing/c38 = 1, /datum/reagent/blackpowder = 1, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_REVOLVER

//= 357
/datum/bench_crafting_recipe/ammo/a357box
	name = ".357 Speed Loader"
	results = list(/obj/item/ammo_box/a357)
	reqs = list(/datum/reagent/blackpowder = 21, /obj/item/stack/sheet/metal = 2)
	station = "Ammo Crafting Bench"
	time = 6
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/a357
	name = ".357 bullet"
	results = list(/obj/item/ammo_casing/a357)
	reqs = list(/obj/item/ammo_casing/a357 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/a357hp
	name = ".357 hollow-point bullet"
	results = list(/obj/item/ammo_casing/a357/hp)
	reqs = list(/obj/item/ammo_casing/a357 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/a357ap
	name = ".357 armour-piercing bullet"
	results = list(/obj/item/ammo_casing/a357/ap)
	reqs = list(/obj/item/ammo_casing/a357 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/a357r
	name = ".357 rubber bullet"
	results = list(/obj/item/ammo_casing/a357/r)
	reqs = list(/obj/item/ammo_casing/a357 = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_REVOLVER
//= 556
/datum/bench_crafting_recipe/ammo/a556box
	name = "5.56mm bullet box"
	results = list(/obj/item/ammo_box/a556)
	reqs = list(/datum/reagent/blackpowder = 60, /obj/item/stack/sheet/metal = 10)
	station = "Ammo Crafting Bench"
	time = 20
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a556
	name = "5.56mm bullet"
	results = list(/obj/item/ammo_casing/a556)
	reqs = list(/obj/item/ammo_casing/a556 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a556hp
	name = "5.56mm hollow-point bullet"
	results = list(/obj/item/ammo_casing/a556/hp)
	reqs = list(/obj/item/ammo_casing/a556 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a556ap
	name = "5.56mm armour-piercing bullet"
	results = list(/obj/item/ammo_casing/a556/ap)
	reqs = list(/obj/item/ammo_casing/a556 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a556r
	name = "5.56mm rubber bullet"
	results = list(/obj/item/ammo_casing/a556/r)
	reqs = list(/obj/item/ammo_casing/a556 = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_RIFLE


//= 762
/datum/bench_crafting_recipe/ammo/a762
	name = "7.62 (Stripper Clip)"
	results = list(/obj/item/ammo_box/a762)
	reqs = list(/datum/reagent/blackpowder = 30, , /obj/item/stack/sheet/metal = 5)
	station = "Ammo Crafting Bench"
	time = 10
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a762
	name = "7.62 bullet"
	results = list(/obj/item/ammo_casing/a762)
	reqs = list(/obj/item/ammo_casing/a762 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a762hp
	name = "7.62 hollow-point bullet"
	results = list(/obj/item/ammo_casing/a762/hp)
	reqs = list(/obj/item/ammo_casing/a762 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a762ap
	name = "7.62 armour-piercing bullet"
	results = list(/obj/item/ammo_casing/a762/ap)
	reqs = list(/obj/item/ammo_casing/a762 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a762r
	name = "7.62 rubber bullet"
	results = list(/obj/item/ammo_casing/a762/r)
	reqs = list(/obj/item/ammo_casing/a762 = 1, /datum/reagent/blackpowder = 2, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_RIFLE


//= 308
/datum/bench_crafting_recipe/ammo/a308box
	name = ".308 Stripper Clip"
	results = list(/obj/item/ammo_box/a308)
	reqs = list(/datum/reagent/blackpowder = 15, /obj/item/stack/sheet/metal = 3)
	station = "Ammo Crafting Bench"
	time = 5
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a308
	name = ".308 bullet"
	results = list(/obj/item/ammo_casing/a308)
	reqs = list(/obj/item/ammo_casing/a308 = 1, /datum/reagent/blackpowder = 3)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a308hp
	name = ".308 hollow-point bullet"
	results = list(/obj/item/ammo_casing/a308/hp)
	reqs = list(/obj/item/ammo_casing/a308 = 1, /datum/reagent/blackpowder = 4)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a308ap
	name = ".308 armour-piercing bullet"
	results = list(/obj/item/ammo_casing/a308/ap)
	reqs = list(/obj/item/ammo_casing/a308 = 1, /datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_RIFLE

/datum/bench_crafting_recipe/ammo/a308r
	name = ".308 rubber bullet"
	results = list(/obj/item/ammo_casing/a308/r)
	reqs = list(/obj/item/ammo_casing/a308 = 1, /datum/reagent/blackpowder = 3, /obj/item/stack/sheet/plastic = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_RIFLE

//= .45-70
/datum/bench_crafting_recipe/ammo/c4570box
	name = ".45-70 Speed Loader"
	results = list(/obj/item/ammo_box/c4570)
	reqs = list(/datum/reagent/blackpowder = 24, , /obj/item/stack/sheet/metal = 2)
	station = "Ammo Crafting Bench"
	time = 12
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/c4570
	name = ".45-70 bullet"
	results = list(/obj/item/ammo_casing/c4570)
	reqs = list(/obj/item/ammo_casing/c4570 = 1, /datum/reagent/blackpowder = 5)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/c4570hp
	name = ".45-70 hollow-point bullet"
	results = list(/obj/item/ammo_casing/c4570/hp)
	reqs = list(/obj/item/ammo_casing/c4570 = 1, /datum/reagent/blackpowder = 6)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_REVOLVER

/datum/bench_crafting_recipe/ammo/c4570ap
	name = ".45-70 armour-piercing bullet"
	results = list(/obj/item/ammo_casing/c4570/ap)
	reqs = list(/obj/item/ammo_casing/c4570 = 1, /datum/reagent/blackpowder = 7, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 4
	category = CAT_REVOLVER

//= 50AE
/datum/bench_crafting_recipe/ammo/a50AE
	name = ".50AE bullet"
	results = list(/obj/item/ammo_casing/a50AE)
	reqs = list(/obj/item/ammo_casing/a50AE = 1, /datum/reagent/blackpowder = 5)
	station = "Ammo Crafting Bench"
	time = 2
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/a50AEhp
	name = ".50AE hollow-point bullet"
	results = list(/obj/item/ammo_casing/a50AE/hp)
	reqs = list(/obj/item/ammo_casing/a50AE = 1, /datum/reagent/blackpowder = 6)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_PISTOL

/datum/bench_crafting_recipe/ammo/a50AEap
	name = ".50AE armour-piercing bullet"
	results = list(/obj/item/ammo_casing/a50AE/ap)
	reqs = list(/obj/item/ammo_casing/a50AE = 1, /datum/reagent/blackpowder = 7)
	station = "Ammo Crafting Bench"
	time = 4
	category = CAT_PISTOL

//= Beanbag Slug
/datum/bench_crafting_recipe/ammo/beanbag_slug
	name = "Beanbag Slug"
	results = list(/obj/item/ammo_casing/shotgun/beanbag)
	reqs = list(/datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_SHOTGUN

//= Rubber Shot
/datum/bench_crafting_recipe/ammo/rubber_shot
	name = "Rubber Shot"
	results = list(/obj/item/ammo_casing/shotgun/rubbershot)
	reqs = list(/datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_SHOTGUN

//= Shotgun Slug
/datum/bench_crafting_recipe/ammo/shotgun_slug
	name = "Shotgun Slug"
	results = list(/obj/item/ammo_casing/shotgun)
	reqs = list(/datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_SHOTGUN

//= Buck Shot
/datum/bench_crafting_recipe/ammo/buck_shot
	name = "Buck Shot"
	results = list(/obj/item/ammo_casing/shotgun/buckshot)
	reqs = list(/datum/reagent/blackpowder = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 1
	category = CAT_SHOTGUN

//= Shotgun Dart
/datum/bench_crafting_recipe/ammo/dart
	name = "Shotgun Dart"
	results = list(/obj/item/ammo_casing/shotgun/dart)
	reqs = list(/datum/reagent/blackpowder = 5, /obj/item/stack/sheet/plastic = 2)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_SHOTGUN

//= Incendiary Slug
/datum/bench_crafting_recipe/ammo/incendiary
	name = "Incendiary Slug"
	results = list(/obj/item/ammo_casing/shotgun/incendiary)
	reqs = list(/datum/reagent/blackpowder = 5, /datum/reagent/fuel = 5, /obj/item/stack/sheet/metal = 1)
	station = "Ammo Crafting Bench"
	time = 3
	category = CAT_SHOTGUN
