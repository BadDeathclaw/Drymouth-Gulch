//Fallout 13 ballistic firearms directory

/obj/item/weapon/gun/ballistic/automatic/pistol/n99
	name = "10-mm pistol"
	desc = "The N99 self-loading pistol is known for its ability to survive in the harshest of conditions.<br>This great weapon is able to be reliably restored to working condition, even after extended exposure to hard elements without maintenance."
	icon_state = "n99"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv
	fire_sound = "10mmfire"
	can_suppress = 1
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL
	components = list(/obj/item/weaponcrafting/reciever = 1,
	/obj/item/weaponcrafting/stock = 1, /obj/item/stack/sheet/metal = 1,
	/obj/item/stack/sheet/plasteel = 1, /obj/item/blueprint/n99 = 1)

/obj/item/weapon/gun/ballistic/automatic/pistol/n99/update_icon()
	..()
	icon_state = "[initial(icon_state)][magazine && magazine.max_ammo == 12 ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"
	return

/obj/item/weapon/gun/ballistic/revolver/magnum
	name = "Magnum"
	icon_state = "44magnum"
	desc = "The Smith & Wesson Model 29 is a powerful six-shot double-action revolver, manufactured by the U.S. company Smith & Wesson since 1955.<br>Centuries later, copies of it can still be found in the wastes."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/m44
	can_suppress = 0
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	burst_size = 1
	casing_ejector = 0
	zoomable = TRUE
	zoom_amt = 7
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85
	recoil = 2
	scopetype = /obj/screen/fullscreen/scope/short
	components = list(/obj/item/weaponcrafting/reciever = 1,
	/obj/item/weaponcrafting/stock = 1, /obj/item/stack/sheet/metal = 1,
	/obj/item/stack/sheet/plasteel = 1)

/obj/item/weapon/gun/ballistic/automatic/rifle
	name = "Automatic Rifle .308"
	icon_state = "rifle-automatic"
	item_state = "shotgun"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m308
	can_suppress = 1
	casing_ejector = 1
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	recoil = 2
	components = list(/obj/item/weaponcrafting/reciever = 1,
	/obj/item/weaponcrafting/stock = 1, /obj/item/stack/sheet/metal = 1,
	/obj/item/stack/sheet/plasteel = 1, /obj/item/blueprint/a_rifle308 = 1)

/obj/item/weapon/gun/ballistic/shotgun/rifle
	name = "Rifle .308"
	desc = "A pre-War bolt-action hunting rifle."
	icon_state = "rifle"
	item_state = "shotgun"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/m308
	can_suppress = 1
	casing_ejector = 0
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	pumpsound = 'sound/weapons/boltpump.ogg'
	mag_load_sound = 'sound/effects/wep_magazines/rifle_load.ogg'
	recoil = 2
	components = list(/obj/item/weaponcrafting/reciever = 1,
	/obj/item/weaponcrafting/stock = 1, /obj/item/stack/sheet/metal = 1,
	/obj/item/stack/sheet/plasteel = 1, /obj/item/blueprint/rifle308 = 1)

/obj/item/weapon/gun/ballistic/shotgun/rifle/scope
	icon_state = "rifle-scope"
	item_state = "shotgun"
	can_suppress = 1
	zoomable = TRUE
	zoom_amt = 7
	w_class = WEIGHT_CLASS_NORMAL
	scopetype = /obj/screen/fullscreen/scope/medium
	components = list(/obj/item/weaponcrafting/reciever = 1,
	/obj/item/weaponcrafting/stock = 1, /obj/item/stack/sheet/metal = 1,
	/obj/item/stack/sheet/plasteel = 1, /obj/item/blueprint/rifle308 = 1)

/obj/item/weapon/gun/ballistic/automatic/assault_rifle
	name = "Assault Rifle 5.56mm"
	desc = "Also known as a Service Rifle by NCR troops, the Assault Rifle is a semi-automatic medium power rifle which takes the common 5.56mm cartridge and has a magazine capacity of 20 rounds."
	icon_state = "assault-rifle"
	item_state = "assault"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = 0
	casing_ejector = 1
	weapon_weight = WEAPON_MEDIUM
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	wielded_icon = "assault-wielded"//Two handing
	components = list(/obj/item/weaponcrafting/reciever = 1,
	/obj/item/weaponcrafting/stock = 1, /obj/item/stack/sheet/metal = 1,
	/obj/item/stack/sheet/plasteel = 1, /obj/item/blueprint/assault_rifle = 1)

/obj/item/weapon/gun/ballistic/automatic/smg10mm
	name = "10-mm submachine gun"
	desc = "An H&K MP9 submachine gun (10mm caliber variant). A average submachine gun which can operate in both single and automatic fire modes."
	icon_state = "smg10mm"
	item_state = "m90"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m10mm_auto
	fire_sound = "10mmfire"
	can_suppress = 0
	burst_size = 3
	casing_ejector = 1
	w_class = WEIGHT_CLASS_NORMAL
	components = list(/obj/item/weaponcrafting/reciever = 1,
	/obj/item/weaponcrafting/stock = 1, /obj/item/stack/sheet/metal = 1,
	/obj/item/stack/sheet/plasteel = 1, /obj/item/blueprint/smg10mm = 1)

/obj/item/weapon/gun/ballistic/shotgun/pipe
	name = "pipe gun"
	desc = "A makeshift shotgun that can hold a single shell."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "pipe-gun"
	item_state = "shotgun"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/pipe
	casing_ejector = 1
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL
	components = list(/obj/item/weaponcrafting/reciever = 1,
	/obj/item/weaponcrafting/stock = 1, /obj/item/stack/sheet/metal = 1,
	/obj/item/stack/sheet/plasteel = 1, /obj/item/blueprint/pipegun = 1)

/obj/item/weapon/gun/ballistic/shotgun/trail
	name = "trail carbine"
	desc = "The trail carbine features a good ammunition capacity, a brisk rate of fire, and high accuracy."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "trail-carbine"
	item_state = "shotgun"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal/trail
	weapon_weight = WEAPON_MEDIUM
	casing_ejector = 1
	w_class = WEIGHT_CLASS_HUGE
	pumpsound = 'sound/f13weapons/repeater_reload.ogg'
	recoil = 2
	components = list(/obj/item/weaponcrafting/reciever = 1,
	/obj/item/weaponcrafting/stock = 1, /obj/item/stack/sheet/metal = 1,
	/obj/item/stack/sheet/plasteel = 1, /obj/item/blueprint/trail_carbine = 1)

/obj/item/weapon/gun/ballistic/automatic/bozar
	name = "\improper Bozar"
	desc = "The ultimate refinement of the sniper's art.<br>Although somewhat finicky and prone to jamming if not kept immacuately clean, its accuracy more than makes up for its extra maintenance requirements."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "bozar"
	item_state = "arg" //Looks like bozar
	slot_flags = 0
	origin_tech = "combat=6;engineering=3;"
	mag_type = /obj/item/ammo_box/magazine/m223
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1
	zoomable = TRUE
	zoom_amt = 7
	w_class = WEIGHT_CLASS_HUGE
	recoil = 3
	scopetype = /obj/screen/fullscreen/scope/long
	components = list(/obj/item/weaponcrafting/reciever = 1,
	/obj/item/weaponcrafting/stock = 1, /obj/item/stack/sheet/metal = 1,
	/obj/item/stack/sheet/plasteel = 1, /obj/item/blueprint/bozar = 1)