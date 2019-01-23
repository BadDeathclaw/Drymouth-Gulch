/obj/item/gun/energy/laser
	name = "laser gun"
	desc = "A basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal."
	icon_state = "laser"
	item_state = "laser"
	w_class = WEIGHT_CLASS_BULKY
	materials = list(MAT_METAL=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	ammo_x_offset = 1
	shaded_charge = 1

/obj/item/gun/energy/laser/practice
	name = "practice laser gun"
	desc = "A modified version of the basic laser gun, this one fires less concentrated energy bolts designed for target practice."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/practice)
	clumsy_check = 0
	item_flags = NONE

/obj/item/gun/energy/laser/retro
	name ="retro laser gun"
	icon_state = "retro"
	desc = "An older model of the basic lasergun, no longer used by Nanotrasen's private security or military forces. Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	ammo_x_offset = 3

/obj/item/gun/energy/laser/retro/old
	name ="laser gun"
	icon_state = "retro"
	desc = "First generation lasergun, developed by Nanotrasen. Suffers from ammo issues but its unique ability to recharge its ammo without the need of a magazine helps compensate. You really hope someone has developed a better lasergun while you were in cyro."
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun/old)
	ammo_x_offset = 3

/obj/item/gun/energy/laser/captain
	name = "antique laser gun"
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "This is an antique laser gun. All craftsmanship is of the highest quality. It is decorated with assistant leather and chrome. The object menaces with spikes of energy. It's usually given to high-ranking members within the Brotherhood."
	force = 10
	ammo_x_offset = 3
	selfcharge = 1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/gun/energy/laser/captain/scattershot
	name = "scatter shot laser rifle"
	icon_state = "lasercannon"
	item_state = "laser"
	desc = "An industrial-grade heavy-duty laser rifle with a modified laser lens to scatter its shot into multiple smaller lasers. The inner-core can self-charge for theoretically infinite use."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter, /obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/laser/cyborg
	can_charge = 0
	desc = "An energy-based laser gun that draws power from the cyborg's internal energy cell directly. So this is what freedom looks like?"
	use_cyborg_cell = 1

/obj/item/gun/energy/laser/cyborg/emp_act()
	return

/obj/item/gun/energy/laser/scatter/shotty
	name = "energy shotgun"
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "cshotgun"
	item_state = "shotgun"
	desc = "A combat shotgun gutted and refitted with an internal laser system. Can switch between taser and scattered disabler shots."
	shaded_charge = 0
	pin = /obj/item/firing_pin/implant/mindshield
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter/disabler, /obj/item/ammo_casing/energy/electrode)

///Laser Cannon

/obj/item/gun/energy/lasercannon
	name = "accelerator laser cannon"
	desc = "An advanced laser cannon that does more damage the farther away the target is."
	icon_state = "lasercannon"
	item_state = "laser"
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/laser/accelerator)
	pin = null
	ammo_x_offset = 3

/obj/item/ammo_casing/energy/laser/accelerator
	projectile_type = /obj/item/projectile/beam/laser/accelerator
	select_name = "accelerator"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/item/projectile/beam/laser/accelerator
	name = "accelerator laser"
	icon_state = "scatterlaser"
	range = 255
	damage = 6

/obj/item/projectile/beam/laser/accelerator/Range()
	..()
	damage += 7
	transform *= 1 + ((damage/7) * 0.2)//20% larger per tile

/obj/item/gun/energy/xray
	name = "x-ray laser gun"
	desc = "A high-power laser gun capable of expelling concentrated x-ray blasts that pass through multiple soft targets and heavier materials."
	icon_state = "xray"
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/xray)
	pin = null
	ammo_x_offset = 3

////////Laser Tag////////////////////

/obj/item/gun/energy/laser/bluetag
	name = "laser tag gun"
	icon_state = "bluetag"
	desc = "A retro laser gun modified to fire harmless blue beams of light. Sound effects included!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/blue
	ammo_x_offset = 2
	selfcharge = TRUE

/obj/item/gun/energy/laser/bluetag/hitscan
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag/hitscan)

/obj/item/gun/energy/laser/redtag
	name = "laser tag gun"
	icon_state = "redtag"
	desc = "A retro laser gun modified to fire harmless beams red of light. Sound effects included!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/red
	ammo_x_offset = 2
	selfcharge = TRUE

/obj/item/gun/energy/laser/redtag/hitscan
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag/hitscan)


//Fallout

/obj/item/gun/energy/laser/lasergatling
	name = "H&K L30 Gatling laser"
	desc = "Designed specifically for military use, these were in the prototype stage at the beginning of the Great War. Multiple barrels allowed longer firing before overheating."
	icon_state = "lasergatling"
	burst_size = 8
	fire_delay = 0
	spread = 12
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	w_class = WEIGHT_CLASS_HUGE

/obj/item/gun/energy/laser/aer9
	name = "AER9 Laser Rifle"
	desc = "A sturdy and advanced military grade pre-war service laser rifle"
	icon_state = "laser"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	w_class = WEIGHT_CLASS_BULKY

/obj/item/gun/energy/laser/pistol
	name = "AEP7 laser pistol"
	desc = "A basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal."
	icon_state = "AEP7"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/ec

/obj/item/gun/energy/laser/scatter
	name = "Tri-beam Laser Rifle"
	desc = "A modified AER9 equipped with a refraction kit that spreads its bolts. It is usually only given to high-ranking soldiers within the Brotherhood, due to it's level of technology, as well as its reputation of friendly fire."
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	w_class = WEIGHT_CLASS_BULKY

/obj/item/gun/energy/laser/plasma
	name ="A3-20 Plasma Rifle"
	item_state = "plasma"
	icon_state = "plasma"
	desc = "A top of line miniaturized plasma caster built by REPCONN in the wake of the Z43-521P failure. It is supperior to all previous rifles to enter service in the USCC."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	w_class = WEIGHT_CLASS_BULKY

/obj/item/gun/energy/laser/plasma/scatter
	name = "A3e-20b Multiplas Rifle"
	item_state = "multiplas"
	icon_state = "multiplas"
	desc = "A modified A3-20 plasma caster built by REPCONN equipped with a multicasting kit that creates multiple weaker clots."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/scatter)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc

/obj/item/gun/energy/laser/plasma/pistol
	name ="MPL-A Plasma Pistol"
	item_state = "plasma-pistol"
	icon_state = "plasma-pistol"
	desc = "A pistol-sized miniaturized plasma caster built by REPCONN. It fires heavy low penetration plasma clots."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol)
	w_class = WEIGHT_CLASS_NORMAL
	cell_type = /obj/item/stock_parts/cell/ammo/mfc


//projectiles
/obj/item/projectile/beam/laser/lasgun
	name = "laser beam"
	damage = 30
	armour_penetration = -9

/obj/item/projectile/beam/laser/pistol
	name = "laser beam"
	damage = 20

/obj/item/projectile/beam/laser/tribeam
	name = "tribeam laser"
	damage = 15

/obj/item/projectile/plasma
	name = "plasma clot"
	icon_state = "plasma_clot"
	damage = 60

/obj/item/projectile/plasma/pistol
	damage = 35
	armour_penetration = -18

/obj/item/projectile/plasma/scatter
	damage = 25

//Casings
//plasma
/obj/item/ammo_casing/energy/plasma
	projectile_type = /obj/item/projectile/plasma
	select_name = "plasma burst"
	icon_state = "neurotoxin"
	fire_sound = 'sound/weapons/plasma_cutter.ogg'
	delay = 5
	e_cost = 75

/obj/item/ammo_casing/energy/plasma/scatter
	projectile_type = /obj/item/projectile/plasma/scatter
	pellets = 3
	variance = 14
	select_name = "scatter"
	e_cost = 150

/obj/item/ammo_casing/energy/plasma/pistol
	projectile_type = /obj/item/projectile/plasma/pistol
	e_cost = 75

//laser
/obj/item/ammo_casing/energy/laser/scatter
	projectile_type = /obj/item/projectile/beam/laser/tribeam
	pellets = 3
	variance = 14
	select_name = "scatter"
	e_cost = 150

/obj/item/ammo_casing/energy/laser/pistol
	projectile_type = /obj/item/projectile/beam/laser/pistol
	e_cost = 10

/obj/item/ammo_casing/energy/laser/lasgun
	projectile_type = /obj/item/projectile/beam/laser/lasgun
	e_cost = 50