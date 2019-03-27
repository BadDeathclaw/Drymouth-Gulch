/////////////////////////////////////////
/////////////////Weapons/////////////////
/////////////////////////////////////////

/datum/design/c38/sec
	id = "sec_38"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/rubbershot/sec
	id = "sec_rshot"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/shotgun_slug/sec
	id = "sec_slug"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/buckshot_shell/sec
	id = "sec_bshot"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/shotgun_dart/sec
	id = "sec_dart"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/incendiary_slug/sec
	id = "sec_Islug"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/minibomb
	name = "Minibomb Grenade"
	desc = "A somewhat destructive grenade, does damage."
	id = "minibomb"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 600, MAT_DIAMOND = 600, MAT_URANIUM = 200)
	build_path = /obj/item/grenade/syndieminibomb
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_testing
	name = "Test-Range Firing Pin"
	desc = "This safety firing pin allows firearms to be operated within proximity to a firing range."
	id = "pin_testing"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 500, MAT_GLASS = 300)
	build_path = /obj/item/firing_pin/test_range
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin
	name = "Regular Firing Pin"
	desc = "This is a basic firing pin."
	id = "pin"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 600, MAT_DIAMOND = 600, MAT_URANIUM = 200)
	build_path = /obj/item/firing_pin
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_mindshield
	name = "Mindshield Firing Pin"
	desc = "This is a security firing pin which only authorizes users who are mindshield-implanted."
	id = "pin_loyalty"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 600, MAT_DIAMOND = 600, MAT_URANIUM = 200)
	build_path = /obj/item/firing_pin/implant/mindshield
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_auth
	name = "Weapon Authorization Firing Pin"
	desc = "This is a security firing pin which only authorizes users who are weapon authed-implanted."
	id = "pin_auth"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 600, MAT_DIAMOND = 600, MAT_URANIUM = 200)
	build_path = /obj/item/firing_pin/implant/pindicate
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ar
	name = "Advanced Assault Rifle"
	desc = "A seemingly advanced 5.56mm assault rifle."
	id = "ar"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 10000, MAT_SILVER = 10000)
	build_path = /obj/item/gun/ballistic/automatic/ar
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/shotgun
	name = "Advanced Shotgun"
	desc = "An advanced semi auto shotgun that takes specialized magazines."
	id = "shotgun"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 10000, MAT_SILVER = 10000)
	build_path = /obj/item/gun/ballistic/automatic/shotgun/bulldog
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/smg
	name = "Advanced Small Machine Gun"
	desc = "A seemingly advanced SMG, uses special ammo and can be suppressed."
	id = "smg"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 10000, MAT_SILVER = 10000)
	build_path = /obj/item/gun/ballistic/automatic/c20r //NO STAM DAMAGE
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/stunrevolver
	name = "Tesla Revolver"
	desc = "A high-tech revolver that fires internal, reusable shock cartridges in a revolving cylinder. The cartridges can be recharged using conventional rechargers."
	id = "stunrevolver"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 10000, MAT_SILVER = 10000, MAT_URANIUM = 5000)
	build_path = /obj/item/gun/energy/tesla_revolver
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
/*
/datum/design/nuclear_gun
	name = "Advanced Energy Gun"
	desc = "An energy gun with an experimental miniaturized reactor."
	id = "nuclear_gun"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 2000, MAT_URANIUM = 3000, MAT_TITANIUM = 1000)
	build_path = /obj/item/gun/energy/e_gun/nuclear
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/
/datum/design/tele_shield
	name = "Telescopic Riot Shield"
	desc = "An advanced riot shield made of lightweight materials that collapses for easy storage."
	id = "tele_shield"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 4000, MAT_GLASS = 4000, MAT_SILVER = 300, MAT_TITANIUM = 200)
	build_path = /obj/item/shield/riot/tele
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
/*
/datum/design/beamrifle
	name = "Beam Marksman Rifle"
	desc = "A powerful long ranged anti-material rifle that fires charged particle beams to obliterate targets."
	id = "beamrifle"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 5000, MAT_DIAMOND = 5000, MAT_URANIUM = 8000, MAT_SILVER = 4500, MAT_GOLD = 5000)
	build_path = /obj/item/gun/energy/beam_rifle
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/decloner
	name = "Decloner"
	desc = "Your opponent will bubble into a messy pile of goop."
	id = "decloner"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 5000,MAT_URANIUM = 10000)
	reagents_list = list("FEV_solution" = 40)
	build_path = /obj/item/gun/energy/decloner
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/
/datum/design/rapidsyringe
	name = "Rapid Syringe Gun"
	desc = "A gun that fires many syringes."
	id = "rapidsyringe"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 5000, MAT_GLASS = 1000)
	build_path = /obj/item/gun/syringe/rapidsyringe
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL		//uwu

/datum/design/temp_gun
	name = "Temperature Gun"
	desc = "A gun that shoots temperature bullet energythings to change temperature."//Change it if you want
	id = "temp_gun"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 5000, MAT_GLASS = 500, MAT_SILVER = 3000)
	build_path = /obj/item/gun/energy/temperature
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/flora_gun
	name = "Floral Somatoray"
	desc = "A tool that discharges controlled radiation which induces mutation in plant cells. Harmless to other organic life."
	id = "flora_gun"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_GLASS = 500)
	reagents_list = list("radium" = 20)
	build_path = /obj/item/gun/energy/floragun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/large_grenade
	name = "Large Grenade"
	desc = "A grenade that affects a larger area and use larger containers."
	id = "large_Grenade"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 3000)
	build_path = /obj/item/grenade/chem_grenade/large
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/pyro_grenade
	name = "Pyro Grenade"
	desc = "An advanced grenade that is able to self ignite its mixture."
	id = "pyro_Grenade"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_PLASMA = 500)
	build_path = /obj/item/grenade/chem_grenade/pyro
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/cryo_grenade
	name = "Cryo Grenade"
	desc = "An advanced grenade that rapidly cools its contents upon detonation."
	id = "cryo_Grenade"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_SILVER = 500)
	build_path = /obj/item/grenade/chem_grenade/cryo
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/adv_grenade
	name = "Advanced Release Grenade"
	desc = "An advanced grenade that can be detonated several times, best used with a repeating igniter."
	id = "adv_Grenade"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 3000, MAT_GLASS = 500)
	build_path = /obj/item/grenade/chem_grenade/adv_release
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/laserpistol
	name = "Laser Pistol"
	desc = "A laser pistol."
	id = "laserpistol"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 2500, MAT_URANIUM = 2000, MAT_METAL = 2500, MAT_TITANIUM = 1000)
	build_path = /obj/item/gun/energy/laser/pistol
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/laserrifle
	name = "Laser Rifle"
	desc = "A laser rifle."
	id = "laserrifle"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 5000, MAT_URANIUM = 4000, MAT_METAL = 5000, MAT_TITANIUM = 2000)
	build_path = /obj/item/gun/energy/laser
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/*
/datum/design/xray
	name = "Xray Laser Gun"
	desc = "Not quite as menacing as it sounds"
	id = "xray_laser"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 5000, MAT_URANIUM = 4000, MAT_METAL = 5000, MAT_TITANIUM = 2000, MAT_BLUESPACE = 2000)
	build_path = /obj/item/gun/energy/xray
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/
/datum/design/ioncarbine
	name = "Ion Carbine"
	desc = "How to dismantle a cyborg : The gun."
	id = "ioncarbine"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 6000, MAT_METAL = 8000, MAT_URANIUM = 2000)
	build_path = /obj/item/gun/energy/ionrifle/carbine
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
/*
/datum/design/wormhole_projector
	name = "Bluespace Wormhole Projector"
	desc = "A projector that emits high density quantum-coupled bluespace beams."
	id = "wormholeprojector"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 2000, MAT_METAL = 5000, MAT_DIAMOND = 2000, MAT_BLUESPACE = 3000)
	build_path = /obj/item/gun/energy/wormhole_projector
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
*/

//Laser and energy gun ammo cells

/datum/design/mfc
	name = "Microfusion Cell"
	id = "mfc"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 2000)
	build_path =/obj/item/stock_parts/cell/ammo/mfc
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ecp
	name = "Electron Charge Pack"
	id = "ecp"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 2000, MAT_DIAMOND = 2000)
	build_path = /obj/item/stock_parts/cell/ammo/ecp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//Weapon Mags

/datum/design/m12rubber
	name = "Advanced shotgun 8 round rubbershot magazine"
	desc = "A 8 round drum consisting of rubbershot shell for the advanced shotgun."
	id = "shotgunrubber"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 15000)
	build_path = /obj/item/ammo_box/magazine/m12g/rubbershot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m12beanbag
	name = "Advanced shotgun 8 round beanbag slug magazine"
	desc = "A 8 round drum consisting of beanbag slug rounds for the advanced shotgun."
	id = "shotgunbean"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 15000)
	build_path = /obj/item/ammo_box/magazine/m12g/beanslug
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m12buckshot
	name = "Advanced shotgun 8 round buckshot magazine"
	desc = "A 8 round drum consisting of buckshot rounds for the advanced shotgun."
	id = "shotgunbuck"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 15000)
	build_path = /obj/item/ammo_box/magazine/m12g
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m12beanslug
	name = "Advanced shotgun 8 round slug magazine"
	desc = "A 8 round drum consisting of regular slug rounds for the advanced shotgun."
	id = "shotgunslug"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 15000)
	build_path = /obj/item/ammo_box/magazine/m12g/slug
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/smgmag
	name = "Advanced SMG Magazine"
	desc = "A 24 round magazine for the advanced SMG"
	id = "smgmag"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 4000)
	build_path = /obj/item/ammo_box/magazine/smgm45
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/armag
	name = "Advanced Assault Rifle Magazine"
	desc = "A 30 round toploader magazine for the advanced AR."
	id = "armag"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 4000)
	build_path = /obj/item/ammo_box/magazine/m556
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
/*
/datum/design/mag_oldsmg/ap_mag
	name = "WT-550 Auto Gun Armour Piercing Magazine (4.6x30mm AP)"
	desc = "A 20 round armour piercing magazine for the out of date security WT-550 Auto Rifle"
	id = "mag_oldsmg_ap"
	materials = list(MAT_METAL = 6000, MAT_SILVER = 600)
	build_path = /obj/item/ammo_box/magazine/wt550m9/wtap
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/mag_oldsmg/ic_mag
	name = "WT-550 Auto Gun Incendiary Magazine (4.6x30mm IC)"
	desc = "A 20 round armour piercing magazine for the out of date security WT-550 Auto Rifle"
	id = "mag_oldsmg_ic"
	materials = list(MAT_METAL = 6000, MAT_SILVER = 600, MAT_GLASS = 1000)
	build_path = /obj/item/ammo_box/magazine/wt550m9/wtic
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/stunshell
	name = "Stun Shell"
	desc = "A stunning shell for a shotgun."
	id = "stunshell"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 200)
	build_path = /obj/item/ammo_casing/shotgun/stunslug
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/techshell
	name = "Unloaded Technological Shotshell"
	desc = "A high-tech shotgun shell which can be loaded with materials to produce unique effects."
	id = "techshotshell"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 1000, MAT_GLASS = 200)
	build_path = /obj/item/ammo_casing/shotgun/techshell
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE
*/
/datum/design/suppressor
	name = "Universal Suppressor"
	desc = "A reverse-engineered universal suppressor that fits on most small arms with threaded barrels."
	id = "suppressor"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_SILVER = 500)
	build_path = /obj/item/suppressor
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/bulletarmor
	name = "Bulletproof Vest"
	desc = "A nice bulletproof vest."
	id = "bulletarmor"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_SILVER = 500)
	build_path = /obj/item/clothing/suit/armor/bulletproof
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/bullethelmet
	name = "Bulletproof Helmet"
	desc = "A nice bulletproof helmet."
	id = "bullethelmet"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_SILVER = 500)
	build_path = /obj/item/clothing/head/helmet/alt
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/gravitygun
	name = "One-point Gravitational Manipulator"
	desc = "A multi-mode device that blasts one-point gravitational bolts that locally distort gravity."
	id = "gravitygun"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 8000, MAT_URANIUM = 8000, MAT_GLASS = 12000, MAT_METAL = 12000, MAT_DIAMOND = 4000)
	build_path = /obj/item/gun/energy/gravity_gun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
/*
/datum/design/largecrossbow
	name = "Energy Crossbow"
	desc = "A reverse-engineered energy crossbow favored by syndicate infiltration teams and carp hunters."
	id = "largecrossbow"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 5000, MAT_GLASS = 1500, MAT_URANIUM = 1500, MAT_SILVER = 1500)
	build_path = /obj/item/gun/energy/kinetic_accelerator/crossbow/large
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/cryostatis_shotgun_dart
	name = "Cryostatis Shotgun Dart"
	desc = "A shotgun dart designed with similar internals to that of a cryostatis beaker, allowing reagents to not react when inside."
	id = "shotgundartcryostatis"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 3500)
	build_path = /obj/item/ammo_casing/shotgun/dart/noreact
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
*/
