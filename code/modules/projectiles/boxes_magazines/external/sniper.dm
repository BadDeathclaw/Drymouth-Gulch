/obj/item/ammo_box/magazine/sniper_rounds
	name = "box magazine (.50 BMG)"
	icon_state = ".50mag"
	ammo_type = /obj/item/ammo_casing/p50
	max_ammo = 6
	caliber = ".50"

/obj/item/ammo_box/magazine/sniper_rounds/update_icon()
	if(ammo_count())
		icon_state = "[initial(icon_state)]-ammo"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/ammo_box/magazine/sniper_rounds/soporific
	name = "box magazine (50. BMG tranquilizer)"
	desc = "Soporific sniper rounds, designed for happy days and dead quiet nights..."
	icon_state = "soporific"
	ammo_type = /obj/item/ammo_casing/p50/soporific
	max_ammo = 3
	caliber = ".50"

/obj/item/ammo_box/magazine/sniper_rounds/penetrator
	name = "box magazine (50. BMG armor piercing)"
	desc = "An extremely powerful round capable of passing straight through cover and anyone unfortunate enough to be behind it."
	ammo_type = /obj/item/ammo_casing/p50/penetrator
	max_ammo = 5
