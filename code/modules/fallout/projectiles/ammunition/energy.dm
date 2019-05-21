//Fallout 13 energy guns ammo directory

/obj/item/ammo_casing/energy/f13plasma
	projectile_type = /obj/item/projectile/beam/plasma
	delay = 2
	randomspread = 1
	variance = 5
	select_name = "kill"
	e_cost = 50
	firing_effect_type = /obj/effect/overlay/temp/dir_setting/firing_effect/plasma

/obj/item/ammo_casing/energy/f13plasma/turbo
	projectile_type = /obj/item/projectile/beam/plasma/turbo
	delay = 5
	e_cost = 75

/obj/item/ammo_casing/energy/f13plasma/tri
	delay = 0
	pellets = 3
	variance = 25
	e_cost = 35
	randomspread = 0

/obj/item/ammo_casing/energy/laser/rcw
	delay = 1
	e_cost = 10
	projectile_type = /obj/item/projectile/beam/laser/rcw
	randomspread = 1
	variance = 8

/obj/item/projectile/beam/laser/rcw
	damage = 10

/obj/item/ammo_casing/energy/laser/rifle
	delay = 4
	e_cost = 50
	randomspread = 1
	variance = 4

/obj/item/ammo_casing/energy/laser/rifle/aer13
	delay = 2
	e_cost = 35

/obj/item/ammo_casing/energy/laser/rifle/tri
	delay = 0
	pellets = 3
	variance = 25
	e_cost = 35
	randomspread = 0
