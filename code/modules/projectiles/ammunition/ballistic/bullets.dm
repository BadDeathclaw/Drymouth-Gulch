//Fallout 13
//Magazines
/obj/item/ammo_box/magazine/r20
	name = ".556 Magazine (5.56mm)"
	icon_state = "r20"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 20
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m10mm_auto
	name = "Advanced SMG Magazine (10mm)"
	icon_state = "smg10mm"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 24
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m10mm_adv
	name = "Advanced 10mm Pistol Magazine (10mm)"
	icon_state = "10mmadv"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m9mm
	name = "9mm Pistol Magazine (9mm)"
	icon_state = "9mmp"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 10
	multiple_sprites = 2

/obj/item/ammo_box/magazine/greasegun
	name = "9mm SMG Magazine (9mm)"
	icon_state = "grease"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/d12g
	name = "shotgun magazine (12g slugs)"
	desc = "A 12g drum magazine."
	icon_state = "riotmag"
	ammo_type = /obj/item/ammo_casing/shotgun
	caliber = "shotgun"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m2mm
	name = "2mm electromagnetic magazine"
	icon_state = "2mm"
	ammo_type = /obj/item/ammo_casing/c2mm
	caliber = "2mm"
	max_ammo = 20
	multiple_sprites = 2

//Ammo Casings
//SuperSoft
/obj/item/ammo_casing/c22
	name = ".22 bullet casing"
	desc = "A .22 bullet casing."
	caliber = ".22"
	projectile_type = /obj/item/projectile/bullet/c22

//Soft
/obj/item/ammo_casing/c45
	name = ".45 bullet casing"
	desc = "A .45 bullet casing."
	caliber = ".45"
	projectile_type = /obj/item/projectile/bullet/c45

/obj/item/ammo_casing/c9mm
	name = "9mm bullet casing"
	desc = "A 9mm bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/c9mm

/obj/item/ammo_casing/c10mm
	name = "10mm bullet casing"
	desc = "A 10mm bullet casing."
	caliber = "10mm"
	projectile_type = /obj/item/projectile/bullet/c10mm

//Med
/obj/item/ammo_casing/m44
	desc = "A 44 Magnum bullet casing."
	caliber = "44"
	projectile_type = /obj/item/projectile/bullet/m44

/obj/item/ammo_casing/c38
	name = ".38 bullet casing"
	desc = "A .38 bullet casing."
	caliber = "38"
	projectile_type = /obj/item/projectile/bullet/c38

/obj/item/ammo_casing/a556
	desc = "A 5.56mm bullet casing."
	caliber = "a556"
	projectile_type = /obj/item/projectile/bullet/a556

/obj/item/ammo_casing/a357
	name = "357 bullet casing"
	desc = "A .357 bullet casing."
	caliber = "357"
	projectile_type = /obj/item/projectile/bullet/a357

/obj/item/ammo_casing/a762/lp
	name = "7.62 lowpower bullet casing"
	desc = "A 7.62 bullet casing."
	icon_state = "762-casing"
	caliber = "a762"
	projectile_type = /obj/item/projectile/bullet/a762

//MedAP
/obj/item/ammo_casing/a762
	name = "7.62 bullet casing"
	desc = "A 7.62 bullet casing."
	icon_state = "762-casing"
	caliber = "a762"
	projectile_type = /obj/item/projectile/bullet/a762m

/obj/item/ammo_casing/a308
	name = ".308 bullet casing"
	desc = "A .308 bullet casing."
	icon_state = "762-casing"
	caliber = "a762"
	projectile_type = /obj/item/projectile/bullet/a308

/obj/item/ammo_casing/caseless/needle
	name = "A needler round."
	desc = "A dart for use in needler pistols."
	caliber = "needle"
	projectile_type = /obj/item/projectile/bullet/needle

//HeavySP
/obj/item/ammo_casing/c4570
	caliber = "4570"
	projectile_type = /obj/item/projectile/bullet/c4570

//Heavy
/obj/item/ammo_casing/a50AE
	name = ".50AE bullet casing"
	desc = "A .50AE bullet casing."
	caliber = ".50"
	projectile_type = /obj/item/projectile/bullet/a50AE

/obj/item/ammo_casing/c2mm
	name = "2mm gauss projectile casing"
	desc = "A 2mm gauss projectile casing."
	caliber = "2mm"
	projectile_type = /obj/item/projectile/bullet/c2mm

/obj/item/ammo_casing/a50MG
	name = ".50MG bullet casing"
	desc = "A .50MG bullet casing."
	caliber = "a50MG"
	icon_state = ".50"
	projectile_type = /obj/item/projectile/bullet/a50MG

/obj/item/ammo_casing/a50MG/incendiary
	name = ".50 MG incendiary bullet casing"
	desc = "A .50 MG incendiary bullet casing."
	caliber = "a50MG"
	projectile_type = /obj/item/projectile/bullet/a50MG/incendiary

/obj/item/ammo_casing/a50MG/AP
	name = ".50 MG AP bullet casing"
	desc = "A .50 MG armor-piercing bullet casing."
	caliber = "a50MG"
	projectile_type = /obj/item/projectile/bullet/a50MG/AP

//Projectiles
/obj/item/projectile/bullet/c45
	damage = 30
	armour_penetration = 0

/obj/item/projectile/bullet/c22
	damage = 15
	armour_penetration = 0

/obj/item/projectile/bullet/m44
	damage = 35
	armour_penetration = 0

/obj/item/projectile/bullet/c9mm
	damage = 20
	armour_penetration = 0

/obj/item/projectile/bullet/c10mm
	damage = 25
	armour_penetration = 0

/obj/item/projectile/bullet/needle
	name = "needle"
	icon_state = "cbbolt"
	damage = 40
	armour_penetration = 20

/obj/item/projectile/bullet/c38
	damage = 25
	armour_penetration = 0

/obj/item/projectile/bullet/a762
	damage = 40
	armour_penetration = 0

/obj/item/projectile/bullet/a762m
	damage = 40
	armour_penetration = 10

/obj/item/projectile/bullet/a308
	damage = 40
	armour_penetration = 20

/obj/item/projectile/bullet/a556
	damage = 25
	armour_penetration = 0

/obj/item/projectile/bullet/c4570
	damage = 60
	armour_penetration = -20

/obj/item/projectile/bullet/a357
	damage = 35
	armour_penetration = 0

/obj/item/projectile/bullet/a50AE
	damage = 50
	armour_penetration = 0

/obj/item/projectile/bullet/a50MG
	damage = 50
	armour_penetration = 20

/obj/item/projectile/bullet/a50MG/incendiary
	damage = 30
	armour_penetration = 0
	var/fire_stacks = 4

/obj/item/projectile/bullet/a50MG/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/a50MG/AP
	damage = 35
	armour_penetration = 65 //will punch through anything short of Enclave power armor

/obj/item/projectile/bullet/c2mm
	damage = 60
	armour_penetration = 40

/obj/item/projectile/bullet/c46x30mm
	name = "4.6x30mm bullet"
	damage = 20

/obj/item/projectile/bullet/c46x30mm_ap
	name = "4.6x30mm armor-piercing bullet"
	damage = 15
	armour_penetration = 40

/obj/item/projectile/bullet/incendiary/c46x30mm
	name = "4.6x30mm incendiary bullet"
	damage = 10
	fire_stacks = 1
