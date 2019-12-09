/obj/item/ammo_box/magazine/internal/cylinder/rev762
	name = "nagant revolver cylinder"
	ammo_type = /obj/item/ammo_casing/n762
	caliber = "n762"
	max_ammo = 7

/obj/item/ammo_box/magazine/internal/cylinder/rus357
	name = "russian revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 6
	multiload = 0

/obj/item/ammo_box/magazine/internal/rus357/Initialize()
	stored_ammo += new ammo_type(src)
	. = ..()

/obj/item/ammo_box/magazine/internal/cylinder/rev44
	name = "44 magnum cylinder"
	ammo_type = /obj/item/ammo_casing/m44
	caliber = "44"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/rev357
	name = "357 magnum cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/rev6250
	name = "6250 10mm cylinder"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/rev4570
	name = "4570 cylinder"
	ammo_type = /obj/item/ammo_casing/c4570
	caliber = "4570"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/revneedler
	name = "needler internal mag"
	ammo_type = /obj/item/ammo_casing/caseless/needle
	caliber = "needle"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/cylinder/rev38
	name = "detective revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357/c38
	caliber = "357"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/improvised10mm
	name = "improvised internal magazine"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/cylinder/thatgun
	name = ".223 pistol cylinder"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 5
