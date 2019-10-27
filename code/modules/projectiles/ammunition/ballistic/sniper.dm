// .50 (Sniper)

/obj/item/ammo_casing/p50
	name = ".50 BMG bullet casing"
	desc = "A .50 bullet casing."
	caliber = ".50"
	projectile_type = /obj/item/projectile/bullet/p50
	icon_state = ".50"

/obj/item/ammo_casing/p50/soporific
	name = ".50 BMG tranquilzier bullet casing"
	desc = "A .50 bullet casing, specialised in sending the target to sleep, instead of hell."
	projectile_type = /obj/item/projectile/bullet/p50/soporific
	icon_state = "sleeper"
	harmful = FALSE

/obj/item/ammo_casing/p50/penetrator
	name = ".50 BMG armor piercing bullet casing"
	desc = "A .50 caliber penetrator round casing."
	projectile_type = /obj/item/projectile/bullet/p50/penetrator

/obj/item/ammo_casing/a50MG
	name = ".50MG bullet casing"
	desc = "A .50MG bullet casing."
	caliber = "a50MG"
	icon_state = "50mg2"
	projectile_type = /obj/item/projectile/bullet/a50MG

/obj/item/ammo_casing/a50MG/incendiary
	name = ".50 MG incendiary bullet casing"
	desc = "A .50 MG incendiary bullet casing."
	icon_state = "50in2"
	caliber = "a50MG"
	projectile_type = /obj/item/projectile/bullet/a50MG/incendiary

/*/obj/item/ammo_casing/a50MG/AP
	name = ".50 MG AP bullet casing"
	desc = "A .50 MG armor-piercing bullet casing."
	caliber = "a50MG"
	icon_state = "50ap2"
	projectile_type = /obj/item/projectile/bullet/a50MG/AP*/

/obj/item/ammo_casing/a50MG/explosive
	name = ".50 MG explosive bullet casing"
	desc = "Comes in 5 bullet racks...more then enough to kill anything that moves.."
	caliber = "a50MG"
	icon_state = "50ex2"
	projectile_type = /obj/item/projectile/bullet/a50MG/explosive
