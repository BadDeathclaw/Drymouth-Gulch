/obj/item/ammo_box/magazine/m10mm/rifle
	name = "rifle magazine (10mm)"
	desc = "A well-worn magazine fitted for the surplus rifle."
	icon_state = "75-8"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 10

/obj/item/ammo_box/magazine/m10mm/rifle/update_icon()
	if(ammo_count())
		icon_state = "75-8"
	else
		icon_state = "75-0"

/obj/item/ammo_box/magazine/m556
	name = "toploader magazine (5.56mm)"
	icon_state = "5.56m"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 30
	multiple_sprites = 2

/*
---Fallout 13---
*/

/obj/item/ammo_box/magazine/m556/rifle
	name = "rifle magazine (5.56mm)"
	icon_state = "r20"
	caliber = "a556"
	max_ammo = 20
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m556/rifle/empty
	stored_ammo = 0

/obj/item/ammo_box/magazine/m556/rifle/small
	name = "small rifle magazine (5.56mm)"
	icon_state = "r10"
	max_ammo = 10

/obj/item/ammo_box/magazine/m556/rifle/small/empty
	stored_ammo = 0

/obj/item/ammo_box/magazine/m556/rifle/assault
	name = "rifle magazine (5.56mm)"
	icon_state = "r30"
	max_ammo = 30

/obj/item/ammo_box/magazine/m556/rifle/assault/empty
	stored_ammo = 0

/obj/item/ammo_box/magazine/m556/rifle/extended
	name = "extended rifle magazine (5.56mm)"
	icon_state = "r50"
	max_ammo = 50

/obj/item/ammo_box/magazine/m556/rifle/extended/empty
	stored_ammo = 0
