/obj/item/gun/ballistic/shotgun
	name = "hunting shotgun"
	desc = "A traditional hunting shotgun with wood furniture and a four-shell capacity underneath."
	icon_state = "Itaca"
	item_state = "huntingshotgun"
	w_class = WEIGHT_CLASS_BULKY
	force = 20
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/shot
	casing_ejector = FALSE
	var/recentpump = 0 // to prevent spammage
	weapon_weight = WEAPON_HEAVY
	var/pump_sound = 'sound/weapons/shotgunpump.ogg'
	randomspread = 0
	fire_delay = 2
	distro = 1

/obj/item/gun/ballistic/shotgun/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	var/num_loaded = magazine.attackby(A, user, params, 1)
	if(num_loaded)
		to_chat(user, "<span class='notice'>You load [num_loaded] shell\s into \the [src]!</span>")
		playsound(user, 'sound/weapons/shotguninsert.ogg', 60, 1)
		A.update_icon()
		update_icon()

/obj/item/gun/ballistic/shotgun/process_chamber(empty_chamber = 0)
	return ..() //changed argument value

/obj/item/gun/ballistic/shotgun/chamber_round()
	return

/obj/item/gun/ballistic/shotgun/can_shoot()
	if(!chambered)
		return 0
	return (chambered.BB ? 1 : 0)

/obj/item/gun/ballistic/shotgun/attack_self(mob/living/user)
	if(recentpump > world.time)
		return
	pump(user)
	recentpump = world.time + 10
	return

/obj/item/gun/ballistic/shotgun/blow_up(mob/user)
	. = 0
	if(chambered && chambered.BB)
		process_fire(user, user, FALSE)
		. = 1

/obj/item/gun/ballistic/shotgun/proc/pump(mob/M)
	playsound(M, pump_sound, 60, 1)
	pump_unload(M)
	pump_reload(M)
	update_icon()	//I.E. fix the desc
	return 1

/obj/item/gun/ballistic/shotgun/proc/pump_unload(mob/M)
	if(chambered)//We have a shell in the chamber
		chambered.forceMove(drop_location())//Eject casing
		chambered.bounce_away()
		chambered = null

/obj/item/gun/ballistic/shotgun/proc/pump_reload(mob/M)
	if(!magazine.ammo_count())
		return 0
	var/obj/item/ammo_casing/AC = magazine.get_round() //load next casing.
	chambered = AC


/obj/item/gun/ballistic/shotgun/examine(mob/user)
	..()
	if (chambered)
		to_chat(user, "A [chambered.BB ? "live" : "spent"] one is in the chamber.")

/obj/item/gun/ballistic/shotgun/lethal
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal

/obj/item/gun/ballistic/shotgun/riot/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

///////////////////////
// BOLT ACTION RIFLE //
///////////////////////

/obj/item/gun/ballistic/shotgun/boltaction
	name = "mosin nagant"
	desc = "This piece of junk looks like something that could have been used 700 years ago. It feels slightly moist."
	icon_state = "moistnugget"
	item_state = "moistnugget"
	slot_flags = 0 //no ITEM_SLOT_BACK sprite, alas
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction
	var/bolt_open = FALSE
	can_bayonet = TRUE
	knife_x_offset = 27
	knife_y_offset = 13
	fire_delay = 5
	extra_damage = 40
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/shotgun/boltaction/enchanted
	name = "enchanted bolt action rifle"
	desc = "Careful not to lose your head."
	var/guns_left = 30
	var/gun_type
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/enchanted

/obj/item/gun/ballistic/shotgun/boltaction/enchanted/arcane_barrage
	name = "arcane barrage"
	desc = "Pew Pew Pew."
	fire_sound = 'sound/weapons/emitter.ogg'
	pin = /obj/item/firing_pin/magic
	icon_state = "arcane_barrage"
	item_state = "arcane_barrage"
	can_bayonet = FALSE

	item_flags = NEEDS_PERMIT | DROPDEL
	flags_1 = NONE

	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/enchanted/arcane_barrage

/obj/item/gun/ballistic/shotgun/boltaction/enchanted/Initialize()
	. = ..()
	bolt_open = TRUE
	pump()
	gun_type = type

/obj/item/gun/ballistic/shotgun/boltaction/enchanted/dropped()
	..()
	guns_left = 0

/obj/item/gun/ballistic/shotgun/boltaction/enchanted/proc/discard_gun(mob/user)
	throw_at(pick(oview(7,get_turf(user))),1,1)
	user.visible_message("<span class='warning'>[user] tosses aside the spent rifle!</span>")

/obj/item/gun/ballistic/shotgun/boltaction/enchanted/arcane_barrage/discard_gun(mob/user)
	return

/obj/item/gun/ballistic/shotgun/boltaction/enchanted/attack_self()
	return

/obj/item/gun/ballistic/shotgun/boltaction/enchanted/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)
	..()
	if(guns_left)
		var/obj/item/gun/ballistic/shotgun/boltaction/enchanted/GUN = new gun_type
		GUN.guns_left = guns_left - 1
		user.dropItemToGround(src, TRUE)
		user.swap_hand()
		user.put_in_hands(GUN)
	else
		user.dropItemToGround(src, TRUE)
	discard_gun(user)

// Automatic Shotguns//

/obj/item/gun/ballistic/shotgun/automatic/shoot_live_shot(mob/living/user as mob|obj)
	..()
	src.pump(user)

/obj/item/gun/ballistic/shotgun/automatic/combat
	name = "combat shotgun"
	desc = "A semi automatic shotgun with tactical furniture and a six-shell capacity underneath."
	icon_state = "cshotgun"
	item_state = "cshotgun1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/com
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/shotgun/automatic/combat/compact
	name = "compact combat shotgun"
	desc = "A compact version of the semi automatic combat shotgun. For close encounters."
	icon_state = "cshotgunc"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/com/compact
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

//Dual Feed Shotgun

/obj/item/gun/ballistic/shotgun/automatic/dual_tube
	name = "cycler shotgun"
	desc = "An advanced shotgun with two separate magazine tubes, allowing you to quickly toggle between ammo types."
	icon_state = "cycler"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	var/toggled = FALSE
	var/obj/item/ammo_box/magazine/internal/shot/alternate_magazine

/obj/item/gun/ballistic/shotgun/automatic/dual_tube/examine(mob/user)
	..()
	to_chat(user, "<span class='notice'>Alt-click to pump it.</span>")

/obj/item/gun/ballistic/shotgun/automatic/dual_tube/Initialize()
	. = ..()
	if (!alternate_magazine)
		alternate_magazine = new mag_type(src)

/obj/item/gun/ballistic/shotgun/automatic/dual_tube/attack_self(mob/living/user)
	if(!chambered && magazine.contents.len)
		pump()
	else
		toggle_tube(user)

/obj/item/gun/ballistic/shotgun/automatic/dual_tube/proc/toggle_tube(mob/living/user)
	var/current_mag = magazine
	var/alt_mag = alternate_magazine
	magazine = alt_mag
	alternate_magazine = current_mag
	toggled = !toggled
	if(toggled)
		to_chat(user, "You switch to tube B.")
	else
		to_chat(user, "You switch to tube A.")

/obj/item/gun/ballistic/shotgun/automatic/dual_tube/AltClick(mob/living/user)
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	pump()


// DOUBLE BARRELED SHOTGUN and IMPROVISED SHOTGUN are in revolver.dm


//Fallout 13

// Trenchgun //
/obj/item/gun/ballistic/shotgun/trench
	name = "lever action shotgun"
	desc = "A pre-war military grade shotgun with wood furniture and a five-shell capacity underneath plus one in chamber."
	icon_state = "trenchgun"
	item_state = "trenchgun"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/trench
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

// RIOT SHOTGUN //
/obj/item/gun/ballistic/shotgun/riot //for spawn in the armory
	name = "riot shotgun"
	desc = "A lightweight shotgun chambered in 12 gauge, designed to be used by paramilitary companies during air raids, but was later absorbed by Vault-tec for use by security in their vaults."
	icon_state = "riotshotgun"
	item_state = "shotgunriot"
	force = 40
	mag_type = /obj/item/ammo_box/magazine/internal/shot/riot
	sawn_desc = "Come with me if you want to live."
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

//Remington 700
/obj/item/gun/ballistic/shotgun/remington
	name = "hunting rifle"
	desc = "A sturdy hunting rifle, chambered in 308. and in use before the war."
	icon_state = "308"
	item_state = "rifle"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/remington
	sawn_desc = "A hunting rifle, crudely shortened with a saw. It's far from accurate, but the short barrel makes it quite portable."
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'
	fire_delay = 3
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	extra_damage = 40

/obj/item/gun/ballistic/shotgun/remington/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/shotgun/remington/scoped
	name = "scoped hunting rifle"
	desc = "A sturdy hunting rifle, chambered in 308. and in use before the war. This one has a 8x scope mounted to it."
	icon_state = "rifle308_scope"
	item_state = "rifle"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/remington
	sawn_desc = "In what is probably the most idiotic and crude modification of a gun you've ever seen, someone has taken this scoped hunting rifle and sawn off the bits that make it well-balanced and accurate."
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'
	fire_delay = 3
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13

//Anti-Materiel Rifle (NCR)
/obj/item/gun/ballistic/shotgun/antimateriel
	name = "anti-materiel rifle"
	desc = "A heavy, high-powered sniper rifle chambered in .50 caliber ammunition, custom-made for use by the New California Republic Rangers. Although relatively austere, you're still pretty sure it could take the head off a deathclaw."
	icon_state = "sniper-mag"
	item_state = "sniper"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/antimateriel
	fire_sound = 'sound/f13weapons/antimaterielfire.ogg'
	pump_sound = 'sound/f13weapons/antimaterielreload.ogg'
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	force = 25
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	recoil = 1 //have fun
	fire_delay = 6
	extra_damage = 60
	extra_penetration = 20

//Colt Rangemaster
/obj/item/gun/ballistic/shotgun/automatic/hunting
	name = "Colt Rangemaster"
	desc = "A semi automatic Colt Rangemaster semi-automatic rifle chambered in .308."
	icon_state = "rangemaster"
	item_state = "fnfal"
	mag_type = /obj/item/ammo_box/magazine/internal/rangemaster
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 3
	extra_damage = 40

/obj/item/gun/ballistic/shotgun/automatic/hunting/trail
	name = "trail carbine"
	desc = "A lever action rifle chambered in .44 Magnum."
	icon_state = "trailcarbine"
	item_state = "trailcarbine"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube44
	fire_sound = 'sound/f13weapons/44mag.ogg'
	pump_sound = 'sound/f13weapons/cowboyrepeaterreload.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 4
	extra_damage = 40
	extra_penetration = 10

/obj/item/gun/ballistic/shotgun/automatic/hunting/trail/scoped
	name = "scoped trail carbine"
	desc = "A lever action rifle chambered in .44 Magnum."
	icon_state = "scopedtrailcarbine"
	item_state = "scopedtrailcarbine"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube44
	fire_sound = 'sound/f13weapons/44mag.ogg'
	pump_sound = 'sound/f13weapons/cowboyrepeaterreload.ogg'
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 6

/obj/item/gun/ballistic/shotgun/automatic/hunting/cowboy
	name = "cowboy repeater"
	desc = "A lever action rifle chambered in .357 Magnum. Smells vaguely of whiskey and cigarettes."
	icon_state = "cowboyrepeater"
	item_state = "cowboyrepeater"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube357
	fire_sound = 'sound/f13weapons/cowboyrepeaterfire.ogg'
	pump_sound = 'sound/f13weapons/cowboyrepeaterreload.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 6
	extra_damage = 40

/obj/item/gun/ballistic/shotgun/automatic/hunting/cowboy/scoped
	name = "scoped cowboy repeater"
	desc = "A lever action rifle chambered in .357 Magnum. Smells vaguely of brooding veterans and cigarettes."
	icon_state = "scopedcowboyrepeater"
	item_state = "scopedcowboyrepeater"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube357
	fire_sound = 'sound/f13weapons/cowboyrepeaterfire.ogg'
	pump_sound = 'sound/f13weapons/cowboyrepeaterreload.ogg'
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 8

/obj/item/gun/ballistic/shotgun/automatic/hunting/brush
	name = "brush gun"
	desc = "A short lever action rifle chambered in the heavy 45-70 round. Issued to NCR Veteran Rangers in the absence of heavier weaponry."
	icon_state = "brushgun"
	item_state = "brushgun"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube4570
	fire_sound = 'sound/f13weapons/brushgunfire.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 6
	extra_damage = 50
	extra_penetration = 10


/obj/item/gun/ballistic/shotgun/automatic/hunting/brush/scoped
	name = "scoped brush gun"
	desc = "A short lever action rifle chambered in the heavy 45-70 round. Issued to NCR Veteran Rangers in the absence of heavier weaponry."
	icon_state = "scopedbrushgun"
	item_state = "scopedbrushgun"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube4570
	fire_sound = 'sound/f13weapons/brushgunfire.ogg'
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 8
	extra_damage = 50
	extra_penetration = 15



//Double Barrel Caravan Shotgun
/obj/item/gun/ballistic/revolver/caravan_shotgun
	name = "caravan shotgun"
	desc = "An common over-under double barreled shotgun."
	icon_state = "caravan_shotgun"
	item_state = "dshotgun1"
	force = 20
	mag_type = /obj/item/ammo_box/magazine/internal/shot/dual
	sawn_desc = "Omar's coming!"
	fire_sound = 'sound/f13weapons/caravan_shotgun.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 4
	distro = 1

/obj/item/gun/ballistic/revolver/caravan_shotgun/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

//Single Shot Shotgun
/obj/item/gun/ballistic/revolver/single_shotgun
	name = "single shotgun"
	desc = "A dirt cheap single shot shotgun."
	icon_state = "single_shotgun"
	item_state = "singleshot"
	force = 20
	mag_type = /obj/item/ammo_box/magazine/internal/shot/improvised
	sawn_desc = "At this point, you're basically holding an individual shotgun shell as it goes off."
	fire_sound = 'sound/f13weapons/caravan_shotgun.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	distro = 1

/obj/item/gun/ballistic/revolver/single_shotgun/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)
