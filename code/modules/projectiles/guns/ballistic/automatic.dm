/obj/item/gun/ballistic/automatic
	w_class = WEIGHT_CLASS_NORMAL
	var/alarmed = 0
	var/select = 1
	can_suppress = FALSE
	w_class = WEIGHT_CLASS_BULKY
	burst_size = 3
	fire_delay = 2
	actions_types = list(/datum/action/item_action/toggle_firemode)
	force = 20

/obj/item/gun/ballistic/automatic/proto
	name = "compact submachine gun"
	desc = "A prototype three-round burst 9mm submachine gun, designated 'SABR'. Has a threaded barrel for suppressors."
	icon_state = "saber"
	mag_type = /obj/item/ammo_box/magazine/smgm9mm
	pin = null

/obj/item/gun/ballistic/automatic/proto/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/update_icon()
	..()
	if(!select)
		add_overlay("[initial(icon_state)]semi")
	if(select == 1)
		add_overlay("[initial(icon_state)]burst")
	icon_state = "[initial(icon_state)][magazine ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"

/obj/item/gun/ballistic/automatic/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/ammo_box/magazine))
		var/obj/item/ammo_box/magazine/AM = A
		if(istype(AM, mag_type))
			var/obj/item/ammo_box/magazine/oldmag = magazine
			if(user.transferItemToLoc(AM, src))
				magazine = AM
				if(oldmag)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the magazine.</span>")
					oldmag.dropped()
					oldmag.forceMove(get_turf(src.loc))
					oldmag.update_icon()
				else
					to_chat(user, "<span class='notice'>You insert the magazine into \the [src].</span>")

				playsound(src, 'sound/weapons/autoguninsert.ogg', 60, TRUE)
				chamber_round()
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/ballistic/automatic/ui_action_click()
	burst_select()

/obj/item/gun/ballistic/automatic/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	select = !select
	if(!select)
		burst_size = 1
		to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	else
		burst_size = initial(burst_size)
		to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")

	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/gun/ballistic/automatic/can_shoot()
	return get_ammo()

/obj/item/gun/ballistic/automatic/proc/empty_alarm()
	if(!chambered && !get_ammo() && !alarmed)
		playsound(src.loc, 'sound/weapons/smg_empty_alarm.ogg', 40, 1)
		update_icon()
		alarmed = 1
	return

/obj/item/gun/ballistic/automatic/c20r
	name = "tactical submachine gun"
	desc = "A bullpup three-round burst .45 SMG, can be suppressed."
	icon_state = "c20r"
	item_state = "c20r"
	mag_type = /obj/item/ammo_box/magazine/smgm45
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	fire_delay = 1
	burst_size = 3
	pin = /obj/item/firing_pin
	can_bayonet = TRUE
	knife_x_offset = 26
	knife_y_offset = 12

/obj/item/gun/ballistic/automatic/c20r/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/c20r/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/ballistic/automatic/c20r/afterattack()
	. = ..()
	empty_alarm()
	return

/obj/item/gun/ballistic/automatic/c20r/update_icon()
	..()
	icon_state = "c20r[magazine ? "-[CEILING(get_ammo(0)/4, 1)*4]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"

/obj/item/gun/ballistic/automatic/wt550
	name = "manufactured submachine gun"
	desc = "A very advanced SMG that can be suppressed, takes unique ammo and starts off with a advanced firing pin."
	icon_state = "wt550"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/wt550m9
	fire_delay = 2
	can_suppress = FALSE
	burst_size = 0
	actions_types = list()
	can_bayonet = TRUE
	knife_x_offset = 25
	knife_y_offset = 12
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/wt550/update_icon()
	..()
	icon_state = "wt550[magazine ? "-[CEILING(get_ammo(0)/4, 1)*4]" : ""]"

/obj/item/gun/ballistic/automatic/m90
	name = "\improper M90gl Carbine"
	desc = "A three-round burst 5.56 toploading carbine, designated 'M-90gl'. Has an attached underbarrel grenade launcher which can be toggled on and off."
	icon_state = "m90"
	item_state = "m90"
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	can_suppress = FALSE
	var/obj/item/gun/ballistic/revolver/grenadelauncher/underbarrel
	burst_size = 3
	fire_delay = 2
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/m90/Initialize()
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher(src)
	update_icon()

/obj/item/gun/ballistic/automatic/m90/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/m90/unrestricted/Initialize()
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/unrestricted(src)
	update_icon()

/obj/item/gun/ballistic/automatic/m90/afterattack(atom/target, mob/living/user, flag, params)
	if(select == 2)
		underbarrel.afterattack(target, user, flag, params)
	else
		. = ..()
		return
/obj/item/gun/ballistic/automatic/m90/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_casing))
		if(istype(A, underbarrel.magazine.ammo_type))
			underbarrel.attack_self()
			underbarrel.attackby(A, user, params)
	else
		..()
/obj/item/gun/ballistic/automatic/m90/update_icon()
	..()
	cut_overlays()
	switch(select)
		if(0)
			add_overlay("[initial(icon_state)]semi")
		if(1)
			add_overlay("[initial(icon_state)]burst")
		if(2)
			add_overlay("[initial(icon_state)]gren")
	icon_state = "[initial(icon_state)][magazine ? "" : "-e"]"
	return
/obj/item/gun/ballistic/automatic/m90/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select = 1
			burst_size = initial(burst_size)
			fire_delay = initial(fire_delay)
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 2
			to_chat(user, "<span class='notice'>You switch to grenades.</span>")
		if(2)
			select = 0
			burst_size = 1
			fire_delay = 0
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/ar
	name = "combat rifle mark II"
	desc = "A robust assault rifle used by most likely advanced fighting forces."
	icon_state = "arg"
	item_state = "arg"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/firing_pin

// Bulldog shotgun //

/obj/item/gun/ballistic/automatic/shotgun/bulldog
	name = "assault shotgun"
	desc = "A semi-auto, mag-fed shotgun for combat in narrow corridors. Compatible only with specialized 8-round drum magazines."
	icon_state = "bulldog"
	item_state = "bulldog"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/m12g
	fire_sound = 'sound/weapons/gunshot.ogg'
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 0
	pin = /obj/item/firing_pin
	actions_types = list()

/obj/item/gun/ballistic/automatic/shotgun/bulldog/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/shotgun/bulldog/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/ballistic/automatic/shotgun/bulldog/update_icon()
	cut_overlays()
	if(magazine)
		add_overlay("[magazine.icon_state]")
	icon_state = "bulldog[chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/shotgun/bulldog/afterattack()
	. = ..()
	empty_alarm()
	return



// L6 SAW //

/obj/item/gun/ballistic/automatic/l6_saw
	name = "\improper L6 SAW"
	desc = "A heavily modified 1.95x129mm light machine gun, designated 'L6 SAW'. Has 'Aussec Armoury - 2531' engraved on the receiver below the designation."
	icon_state = "l6closed100"
	item_state = "l6closedmag"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/mm195x129
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	var/cover_open = FALSE
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/l6_saw/unrestricted
	pin = /obj/item/firing_pin


/obj/item/gun/ballistic/automatic/l6_saw/examine(mob/user)
	..()
	if(cover_open && magazine)
		to_chat(user, "<span class='notice'>It seems like you could use an <b>empty hand</b> to remove the magazine.</span>")


/obj/item/gun/ballistic/automatic/l6_saw/attack_self(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	if(cover_open)
		playsound(user, 'sound/weapons/sawopen.ogg', 60, 1)
	else
		playsound(user, 'sound/weapons/sawclose.ogg', 60, 1)
	update_icon()


/obj/item/gun/ballistic/automatic/l6_saw/update_icon()
	icon_state = "l6[cover_open ? "open" : "closed"][magazine ? CEILING(get_ammo(0)/12.5, 1)*25 : "-empty"][suppressed ? "-suppressed" : ""]"
	item_state = "l6[cover_open ? "openmag" : "closedmag"]"


/obj/item/gun/ballistic/automatic/l6_saw/afterattack(atom/target as mob|obj|turf, mob/living/user as mob|obj, flag, params) //what I tried to do here is just add a check to see if the cover is open or not and add an icon_state change because I can't figure out how c-20rs do it with overlays
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
	else
		. = ..()
		update_icon()

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/gun/ballistic/automatic/l6_saw/attack_hand(mob/user)
	if(loc != user)
		..()
		return	//let them pick it up
	if(!cover_open || (cover_open && !magazine))
		..()
	else if(cover_open && magazine)
		//drop the mag
		magazine.update_icon()
		magazine.forceMove(drop_location())
		user.put_in_hands(magazine)
		magazine = null
		update_icon()
		to_chat(user, "<span class='notice'>You remove the magazine from [src].</span>")
		playsound(user, 'sound/weapons/magout.ogg', 60, 1)

/obj/item/gun/ballistic/automatic/l6_saw/attackby(obj/item/A, mob/user, params)
	if(!cover_open && istype(A, mag_type))
		to_chat(user, "<span class='warning'>[src]'s cover is closed! You can't insert a new mag.</span>")
		return
	..()

/obj/item/gun/ballistic/automatic/l6_saw/m38
	name = "M38 LMG"
	desc = "A special lmg used by elite legionairs to support regular infantry."
	icon_state = "M38"
	item_state = "M38"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/mm195x129/m38/
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 2
	slowdown = 1.0
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	spread = 2
	randomspread = 1
	extra_damage = 15
	extra_penetration = 10

/obj/item/gun/ballistic/automatic/l6_saw/m38/update_icon()
	icon_state = "M38[cover_open ? "open" : "closed"][magazine ? CEILING(get_ammo(0)/25, 1)*25 : "-empty"][suppressed ? "-suppressed" : ""]"
	item_state = "M38[cover_open ? "openmag" : "closedmag"]"

/obj/item/gun/ballistic/automatic/l6_saw/m38/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size += 2
			spread = 15
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select += 1
			burst_size += 2
			spread = 30
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(2)
			select += 1
			burst_size += 3
			spread = 55
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(3)
			select = 0
			burst_size = 1
			spread = 1
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

// SNIPER //

/obj/item/gun/ballistic/automatic/sniper_rifle
	name = "anti materiel rifle"
	desc = "A long ranged weapon that does significant damage. No, you can't quickscope."
	icon_state = "sniper-mag"
	item_state = "sniper"
	recoil = 2
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/sniper_rounds
	fire_delay = 40
	burst_size = 1
	can_unsuppress = FALSE
	can_suppress = FALSE
	w_class = WEIGHT_CLASS_BULKY
	zoomable = TRUE
	zoom_amt = 10 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 13
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()
	force = 25


/obj/item/gun/ballistic/automatic/sniper_rifle/update_icon()
	if(magazine)
		icon_state = "sniper-mag"
	else
		icon_state = "sniper"


/obj/item/gun/ballistic/automatic/sniper_rifle/syndicate
	name = "anti materiel rifle mark II"
	desc = "An illegally modified .50 cal sniper rifle with suppression compatibility. Quickscoping still doesn't work."
	pin = /obj/item/firing_pin/implant/pindicate

// Old Semi-Auto Rifle //

/obj/item/gun/ballistic/automatic/surplus
	name = "semi automatic rifle"
	desc = "One of countless obsolete ballistic rifles that still sees use as a cheap deterrent. Uses 10mm ammo and its bulky frame prevents one-hand firing."
	icon_state = "surplus"
	item_state = "moistnugget"
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/m10mm/rifle
	fire_delay = 10
	burst_size = 1
	can_unsuppress = FALSE
	can_suppress = FALSE
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()

/obj/item/gun/ballistic/automatic/surplus/update_icon()
	if(magazine)
		icon_state = "surplus"
	else
		icon_state = "surplus-e"


// Laser rifle (rechargeable magazine) //

/obj/item/gun/ballistic/automatic/laser
	name = "laser rifle"
	desc = "Though sometimes mocked for the relatively weak firepower of their energy weapons, the logistic miracle of rechargeable ammunition has given it's users a decisive edge over many a foe."
	icon_state = "oldrifle"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/recharge
	fire_delay = 2
	can_suppress = FALSE
	burst_size = 0
	actions_types = list()
	fire_sound = 'sound/weapons/laser.ogg'
	casing_ejector = FALSE

/obj/item/gun/ballistic/automatic/laser/update_icon()
	..()
	icon_state = "oldrifle[magazine ? "-[CEILING(get_ammo(0)/4, 1)*4]" : ""]"
	return

/obj/item/gun/ballistic/automatic/mini_uzi
	name = "\improper Type U3 Uzi"
	desc = "A lightweight, burst-fire submachine gun, for when you really want someone dead. Uses 9mm rounds."
	icon_state = "mini-uzi"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/uzim9mm
	burst_size = 3
	extra_damage = 20
	extra_penetration = 5
	force = 15

/obj/item/gun/ballistic/automatic/tommygun
	name = "\improper Thompson SMG"
	desc = "Based on the classic 'Chicago Typewriter'."
	icon_state = "tommygun"
	item_state = "tommygun"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/tommygunm45
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 2
	extra_damage = 25

/obj/item/gun/ballistic/automatic/smg10mm
	name = "10mm submachine gun"
	desc = "A select fire open bolt 10mm submachine gun. The serial number and manufactuer markings have been scratched off."
	icon_state = "smg10mm"
	item_state = "smg10mm"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m10mm_auto
	fire_sound = 'sound/f13weapons/10mm_fire_03.ogg'
	burst_size = 3
	fire_delay = 4
	extra_damage = 20
	extra_penetration = 10
	can_suppress = FALSE //we dont have sprites therefore cease
	force = 15

/obj/item/gun/ballistic/automatic/assault_rifle
	name = "assault rifle"
	desc = "A standard R91 combat rifle, out of use around the time of the Great War."
	icon_state = "assault_rifle"
	item_state = "fnfal"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/automatic/
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	burst_size = 3
	fire_delay = 4
	extra_damage = 20
	extra_penetration = 20
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/assault_rifle/infiltrator
	name = "infiltrator"
	desc = "A customized R91 assault rifle, with a scope, integrated suppressor, cut down stock and polymer furniture."
	icon_state = "infiltrator"
	item_state = "fnfal"
	suppressed = 1
	fire_delay = 4
	extra_damage = 20
	extra_penetration = 10
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'
	weapon_weight = WEAPON_HEAVY
	force = 15

/obj/item/gun/ballistic/automatic/marksman
	name = "marksman carbine"
	desc = "A R94 marksman carbine, chambered in 5.56x45. Seen heavy usage in pre-war conflicts. This one isn't a select fire variant."
	icon_state = "marksman_rifle"
	item_state = "marksman"
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/automatic/
	fire_sound = 'sound/f13weapons/marksman_rifle.ogg'
	can_suppress = FALSE
	fire_delay = 6
	extra_damage = 40
	extra_penetration = 5
	burst_size = 1
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/marksman/servicerifle
	name = "service rifle"
	desc = "A 5.56x45 semi-automatic service rifle manufactured by the NCR and issued to all combat personnel."
	icon_state = "service_rifle"
	item_state = "servicerifle"
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'
	fire_delay = 3
	extra_damage = 25
	extra_penetration = 10
	mag_type = /obj/item/ammo_box/magazine/automatic/
	zoomable = FALSE
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/marksman/servicerifle/r82
	name = "R82 heavy service rifle"
	desc = "A top of the line 5.56x45 semi-automatic service rifle manufactured by the NCR and issued to high ranking personnel."
	fire_delay = 5
	extra_damage = 30
	extra_penetration = 10
	init_mag_type = /obj/item/ammo_box/magazine/automatic/r30
	mag_type = /obj/item/ammo_box/magazine/automatic/
	icon_state = "R82"
	item_state = "R82"
	burst_size = 1
/obj/item/gun/ballistic/automatic/marksman/servicerifle/varmint
	name = "varmint rifle"
	desc = "A low powered 5.56, easy to use rifle."
	icon_state = "varmint_rifle"
	item_state = "varmintrifle"
	fire_delay = 8
	extra_damage = 30
	init_mag_type = /obj/item/ammo_box/magazine/automatic/r10
	mag_type = /obj/item/ammo_box/magazine/automatic/

/obj/item/gun/ballistic/automatic/marksman/servicerifle/varmint/ratslayer
	name = "ratslayer"
	desc = "A modified Varmint Rifle with better stopping power, a scope, and suppressor. Oh, don't forget the sick paint job."
	icon_state = "rat_slayer"
	item_state = "ratslayer"
	extra_damage = 35
	extra_penetration = 10
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'

/obj/item/gun/ballistic/automatic/minigun
	name = "M134 Minigun"
	desc = "The M134 is a 7.62Ã—51mm, six-barrel rotary machine gun with a rate of fire between 2,000 and 6,000 rounds per minute."
	icon_state = "arg"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/tommygunm45
	fire_sound = 'sound/f13weapons/10mm_fire_03.ogg'
	burst_size = 3
	fire_delay = 0.2
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/shotgun/pancor
	name = "Pancor Jackhammer"
	desc = "A select fire automatic shotgun, the pinnacle of turning things into swiss cheese."
	icon_state = "pancor"
	item_state = "cshotgun1"
	fire_sound = 'sound/f13weapons/repeater_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/d12g
	burst_size = 3
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/shotgun/caws
	name = "HK CAWS"
	desc = "A select fire automatic shotgun, a modern variant of the Pancor Jackhammer."
	icon_state = "caws"
	item_state = "cshotgun1"
	fire_sound = 'sound/f13weapons/repeater_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/d12g
	burst_size = 3
	fire_delay = 4
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/greasegun
	name = "9mm submachine gun"
	desc = "A mass-produced 9mm sub machine gun. Slow fire rate means less waste of ammo and controllable bursts."
	icon_state = "grease_gun"
	item_state = "smg9mm"
	mag_type = /obj/item/ammo_box/magazine/greasegun
	fire_sound = 'sound/f13weapons/greasegun.ogg'
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 3
	extra_damage = 20
	extra_penetration = 5
	force = 15

/obj/item/gun/ballistic/automatic/bozar
	name = "Bozar"
	desc = "The ultimate refinement of the sniper's art, the Bozar is a scoped, accurate, light machine gun that will make nice big holes in your enemy. Uses 5.56."
	icon_state = "bozar"
	item_state = "sniper"
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/automatic/
	burst_size = 2
	fire_delay = 3
	extra_damage = 35
	extra_penetration = 15
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/f13weapons/bozar_fire.ogg'
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13

/obj/item/gun/ballistic/automatic/m72
	name = "M72 gauss rifle"
	desc = "The M72 rifle is of German design. It uses an electromagnetic field to propel rounds at tremendous speed... and pierce almost any obstacle. Its range, accuracy and stopping power is almost unparalleled."
	icon_state = "m72"
	item_state = "shotgun"
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/m2mm
	fire_sound = 'sound/f13weapons/gauss_rifle.ogg'
	can_suppress = FALSE
	burst_size = 1//Setting it to 0 is dumb. Just set it to one.
	fire_delay = 10
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/lsw
	name = "L86A1 LSW"
	desc = "A british variant of the L86 platform. This one was designed as a light support weapon, featuring a bipod and fluted barrel."
	icon_state = "lsw"
	item_state = "l6closedmag"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = FALSE
	burst_size = 5
	fire_delay = 0.3
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/lmg
	name = "R84 LMG"
	desc = "A post war lmg manufactured by the NCR. Issued to heavy troopers to support regular infantry."
	icon_state = "R84"
	item_state = "R84"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/lmg
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 2
	slowdown = 1.0
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	spread = 2
	randomspread = 1
	extra_damage = 20
	
/obj/item/gun/ballistic/automatic/lmg/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size += 2
			spread = 16
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select += 1
			burst_size += 2
			spread = 28
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(2)
			select += 1
			burst_size += 3
			spread = 40
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(3)
			select = 0
			burst_size = 1
			spread = 1
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return


//Fallout 13
//Magazines
/obj/item/ammo_box/magazine/mm195x129/m38/
	name = "7.62 belt (7.62mm)"
	icon_state = "762belt"
	ammo_type = /obj/item/ammo_casing/a762/lp
	max_ammo = 100
	caliber = "a762"

/obj/item/ammo_box/magazine/mm195x129/m38/can_load()
	return 0

/obj/item/ammo_box/magazine/mm195x129/m38/update_icon()
	..()
	icon_state = "762belt-[round(ammo_count(),25)]"
/obj/item/ammo_box/magazine/automatic/r10
	name = "small 5.56 magazine (5.56mm)"
	icon_state = "r10"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 10
	multiple_sprites = 2

/obj/item/ammo_box/magazine/automatic/
	name = "5.56 Magazine (5.56mm)"
	icon_state = "r20"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 20
	multiple_sprites = 2

/obj/item/ammo_box/magazine/automatic/r30
	name = "Large 5.56 Magazine (5.56mm)"
	icon_state = "r30"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/automatic/r50
	name = "Extra Large 5.56 Magazine (5.56mm)"
	icon_state = "r50"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 50
	multiple_sprites = 2

/obj/item/ammo_box/magazine/lmg/
	name = "5.56 ammo box"
	icon_state = "r80"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 80
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m10mm_auto
	name = "10mm submachine gun magazine (10mm)"
	icon_state = "smg10mm"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 24
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m10mm_adv
	name = "10mm pistol magazine (10mm)"
	icon_state = "10mmadv"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m9mm
	name = "9mm pistol magazine (9mm)"
	icon_state = "9mmp"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 10
	multiple_sprites = 2

/obj/item/ammo_box/magazine/greasegun
	name = "9mm submachine gun magazine (9mm)"
	icon_state = "grease"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/d12g
	name = "shotgun drum magazine (12g slugs)"
	desc = "A 12g drum magazine."
	icon_state = "riotmag"
	ammo_type = /obj/item/ammo_casing/shotgun
	caliber = "shotgun"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m2mm
	name = "2mm electromagnetic magazine"
	icon_state = "2mm"
	ammo_type = /obj/item/ammo_casing/c2mm
	caliber = "2mm"
	max_ammo = 20
	multiple_sprites = 2

//Ammo Casings
//SuperSoft
/obj/item/ammo_casing/c22
	name = ".22 bullet casing"
	desc = "A .22 bullet casing."
	caliber = ".22"
	projectile_type = /obj/item/projectile/bullet/c22

//Soft
/obj/item/ammo_casing/c45
	name = ".45 bullet casing"
	desc = "A .45 bullet casing."
	caliber = ".45"
	projectile_type = /obj/item/projectile/bullet/c45

/obj/item/ammo_casing/c9mm
	name = "9mm bullet casing"
	desc = "A 9mm bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/c9mm

/obj/item/ammo_casing/c10mm
	name = "10mm bullet casing"
	desc = "A 10mm bullet casing."
	caliber = "10mm"
	projectile_type = /obj/item/projectile/bullet/c10mm

//Med
/obj/item/ammo_casing/m44
	desc = "A 44 Magnum bullet casing."
	caliber = "44"
	projectile_type = /obj/item/projectile/bullet/m44

/obj/item/ammo_casing/c38
	name = ".38 bullet casing"
	desc = "A .38 bullet casing."
	caliber = "38"
	projectile_type = /obj/item/projectile/bullet/c38

/obj/item/ammo_casing/a556
	desc = "A 5.56mm bullet casing."
	caliber = "a556"
	projectile_type = /obj/item/projectile/bullet/a556


/obj/item/ammo_casing/a357
	name = "357 bullet casing"
	desc = "A .357 bullet casing."
	caliber = "357"
	projectile_type = /obj/item/projectile/bullet/a357

/obj/item/ammo_casing/a762/lp
	name = "7.62 lowpower bullet casing"
	desc = "A 7.62 bullet casing."
	icon_state = "762-casing"
	caliber = "a762"
	projectile_type = /obj/item/projectile/bullet/a762

//MedAP
/obj/item/ammo_casing/a762
	name = "7.62 bullet casing"
	desc = "A 7.62 bullet casing."
	icon_state = "762-casing"
	caliber = "a762"
	projectile_type = /obj/item/projectile/bullet/a762m

/obj/item/ammo_casing/a308
	name = ".308 bullet casing"
	desc = "A .308 bullet casing."
	icon_state = "762-casing"
	caliber = "a762"
	projectile_type = /obj/item/projectile/bullet/a308

/obj/item/ammo_casing/caseless/needle
	name = "A needler round."
	desc = "A dart for use in needler pistols."
	caliber = "needle"
	projectile_type = /obj/item/projectile/bullet/needle

//HeavySP
/obj/item/ammo_casing/c4570
	name = ".45-70 bullet casing"
	desc = "A .45-70 bullet casing."
	caliber = "4570"
	projectile_type = /obj/item/projectile/bullet/c4570

/*/obj/item/ammo_casing/c4570SP
	name = ".45 LC bullet casing"
	desc = "A .45 Long Colt bullet casing."
	caliber = "4570"
	projectile_type = /obj/item/projectile/bullet/c4570SP*/

//Heavy
/obj/item/ammo_casing/a50AE
	name = ".50AE bullet casing"
	desc = "A .50AE bullet casing."
	caliber = ".50"
	projectile_type = /obj/item/projectile/bullet/a50AE

/obj/item/ammo_casing/c2mm
	name = "2mm gauss projectile casing"
	desc = "A 2mm gauss projectile casing."
	caliber = "2mm"
	projectile_type = /obj/item/projectile/bullet/c2mm

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

//Projectiles
/obj/item/projectile/bullet/c45
	damage = 0
	armour_penetration = 0

/obj/item/projectile/bullet/c22
	damage = 15
	armour_penetration = 0

/obj/item/projectile/bullet/m44
	damage = 0
	armour_penetration = 0

/obj/item/projectile/bullet/c9mm
	damage = 0
	armour_penetration = 0

/obj/item/projectile/bullet/c10mm
	damage = 0
	armour_penetration = 0

/obj/item/projectile/bullet/needle
	name = "needle"
	icon_state = "cbbolt"
	damage = 30
	armour_penetration = 30

/obj/item/projectile/bullet/c38
	damage = 0
	armour_penetration = 0

/obj/item/projectile/bullet/a762
	damage = 0
	armour_penetration = 0

/obj/item/projectile/bullet/a762m
	damage = 0
	armour_penetration = 10

/obj/item/projectile/bullet/a308
	damage = 0
	armour_penetration = 20

/obj/item/projectile/bullet/a556
	damage = 0
	armour_penetration = 0

/obj/item/projectile/bullet/c4570
	damage = 0
	armour_penetration = 0

/*/obj/item/projectile/bullet/c4570SP
	damage = 45
	armour_penetration = 20*/

/obj/item/projectile/bullet/a357
	damage = 0
	armour_penetration = 0

/obj/item/projectile/bullet/a50AE
	damage = 0
	armour_penetration = 0

/obj/item/projectile/bullet/a50MG
	damage = 0
	armour_penetration = 0

/obj/item/projectile/bullet/a50MG/incendiary
	damage = -30
	armour_penetration = -20
	var/fire_stacks = 4

/obj/item/projectile/bullet/a50MG/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/*
	/obj/item/projectile/bullet/a50MG/AP
	damage = 35
	armour_penetration = 65 will punch through anything short of Enclave power armor*/

/obj/item/projectile/bullet/a50MG/explosive
	damage = -10
	armour_penetration = 0

/obj/item/projectile/bullet/a50MG/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, 0, 2, 2, 2)


/obj/item/projectile/bullet/c2mm
	damage = 60
	armour_penetration = 40

/obj/item/ammo_casing/a762r
	name = "7.62 bullet casing"
	desc = "A 7.62 bullet casing."
	icon_state = "762-casing"
	caliber = "a762"
	projectile_type = /obj/item/projectile/bullet/a762r

/obj/item/projectile/bullet/a762r
	damage = 40
	armour_penetration = 0

/obj/item/ammo_casing/c9mmr
	name = "9mm bullet casing"
	desc = "A 9mm bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/c9mmr

/obj/item/projectile/bullet/c9mmr
	damage = 20
	armour_penetration = 20
