//Fallout 13 firearms ammo directory

/obj/item/ammo_box/magazine/m10mm
	name = "pistol magazine (10mm)"
	icon_state = "9x19p"
	origin_tech = "combat=2"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 8
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m10mm_adv
	name = "pistol magazine (10mm) advanced"
	icon_state = "9x19p"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m10mm_auto
	name = "smg magazine (10mm)"
	icon_state = "smg9mm"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 42
	multiple_sprites = 2

/obj/item/ammo_box/magazine/internal/cylinder/m44
	name = "magnum revolver cylinder"
	ammo_type = /obj/item/ammo_casing/m44
	caliber = "44mm"
	max_ammo = 6

/obj/item/ammo_casing/m44
	desc = "A .44 bullet casing."
	caliber = "44mm"
	projectile_type = /obj/item/projectile/bullet/heavybullet
	randomspread = 1
	variance = 3

/obj/item/ammo_box/m44
	name = "speed loader (.44)"
	desc = "Designed to quickly reload revolvers."
	icon_state = "357"
	ammo_type = /obj/item/ammo_casing/m44
	max_ammo = 6
	multiple_sprites = 1
	self_weight = 0.2

/obj/item/ammo_box/magazine/internal/shot/m308
	name = "rifle .308 magazine"
	ammo_type = /obj/item/ammo_casing/m308
	caliber = "308mm"
	max_ammo = 7

/obj/item/ammo_box/magazine/m308
	name = "rifle .308 magazine"
	ammo_type = /obj/item/ammo_casing/m308
	caliber = "308mm"
	icon_state = "75"
	max_ammo = 24
	multiple_sprites = 2

/obj/item/ammo_casing/m308
	desc = "A .308 bullet casing."
	caliber = "308mm"
	icon_state = "762-casing"
	projectile_type = /obj/item/projectile/bullet/midbullet3/hp
	randomspread = 1
	variance = 2

/obj/item/ammo_box/m308
	name = "ammo box (.308)"
	icon_state = "9mmbox"
	origin_tech = "combat=2"
	ammo_type = /obj/item/ammo_casing/m308
	max_ammo = 40

/obj/item/ammo_box/magazine/internal/shot/pipe
	name = "pipe gun magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/rubbershot
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/shot/lethal/trail
	max_ammo = 8

/obj/item/ammo_box/magazine/m223
	name = "bozar .223 magazine"
	ammo_type = /obj/item/ammo_casing/m223
	caliber = "223mm"
	icon_state = "75"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_casing/m223
	desc = "A .223 bullet casing."
	caliber = "223mm"
	icon_state = "762-casing"
	projectile_type = /obj/item/projectile/bullet/heavybullet
	randomspread = 1
	variance = 3

/obj/item/ammo_box/m223
	name = "ammo box (.223)"
	icon_state = "9mmbox"
	origin_tech = "combat=2"
	ammo_type = /obj/item/ammo_casing/m223
	max_ammo = 100