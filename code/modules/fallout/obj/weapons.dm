//Fallout 13 melee weapons directory

/obj/item/weapon/twohanded/baseball
	name = "baseball bat"
	desc = "A wooden source of joy and pain."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "baseball0"
	force = 5
	throwforce = 10
	w_class = 3
	force_unwielded = 15
	force_wielded = 20
	obj_integrity = 200
	max_integrity = 200

/obj/item/weapon/machete
	name = "\proper machete"
	desc = "The machete appears to be a makeshift weapon, as it consists of a lawn mower blade strapped to a wooden handle.<br>It is the primary melee weapon of Caesar's Legion."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "machete"
	item_state = "machete"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 20
	throwforce = 15
	w_class = 3
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	block_chance = 20
	sharpness = IS_SHARP

/obj/item/weapon/pipe
	name = "lead pipe"
	desc = "One of the ends has tape wrapped around it to improve grip, while the other is heavily corroded and/or bloodstained, and topped with a pipe fitting.<br>Though it has a short reach, it has decent damage and a fast swing."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "pipe"
	item_state = "pipe"
	slot_flags = SLOT_BELT
	force = 15
	throw_speed = 3
	throw_range = 4
	throwforce = 10
	w_class = 3

/obj/item/weapon/pipe/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/tireiron
	name = "tire iron"
	desc = "A rusty old tire iron, normally used for loosening nuts from car tires.<br>Though it has a short reach, it has decent damage and a fast swing."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "tire"
	item_state = "tire"
	slot_flags = SLOT_BELT
	force = 15
	throw_speed = 3
	throw_range = 4
	throwforce = 10
	w_class = 3

/obj/item/weapon/tireiron/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/golf9
	name = "9 iron"
	desc = "This old and quite heavy 9 iron is bent and battered after many years of use by anyone who found it good enough to break bones and crash skulls."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "golf9"
	item_state = "golf9"
	slot_flags = SLOT_BELT
	force = 15
	throw_speed = 3
	throw_range = 4
	throwforce = 10
	w_class = 2

/obj/item/weapon/golf10
	name = "10 iron"
	desc = "This old and quite deadly 10 iron is bent and battered after many years of use by anyone who found it good enough to break bones and crash skulls."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "golf10"
	item_state = "golf10"
	slot_flags = SLOT_BELT
	force = 20
	throw_speed = 3
	throw_range = 4
	throwforce = 10
	w_class = 2

/obj/item/weapon/golf/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/pan
	name = "frying pan"
	desc = "An ancient cast iron frying pan.<br>It's heavy, but fairly useful if you need to keep the mutants away, and don't have a better weapon around."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "pan"
	item_state = "pan"
	hitsound = 'sound/f13weapons/pan.ogg'
	slot_flags = SLOT_BELT
	force = 10 //Just try to swing a frying pan
	throw_speed = 1
	throw_range = 2
	throwforce = 10
	w_class = 2

/obj/item/weapon/pan/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] keeps hitting \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/harpoon
	name = "harpoon"
	desc = "A rusty spear-like instrument previously used in fishing, whaling and sealing - now used for robbing, raiding and manhunting."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "harpoon"
	force = 15
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = SLOT_BACK
	throwforce = 20
	throw_speed = 4
	embedded_impact_pain_multiplier = 4
	armour_penetration = 5
	materials = list(MAT_METAL=1150, MAT_WOOD=2075)
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	sharpness = IS_SHARP
	obj_integrity = 200
	max_integrity = 200

/obj/item/weapon/harpoon/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/powergauntlet
	name = "power gauntlet"
	desc = "Power Knuckles 'Big ram' produced by Beau.<br>Most consider it the best weapon for close combat.<br>Small but powerful battery provides the power for device operation."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "powergauntlet"
	item_state = "powergauntlet"
	slot_flags = SLOT_BELT
	force = 25
	throw_speed = 3
	throw_range = 4
	throwforce = 10
	w_class = 2

/obj/item/weapon/powergauntlet/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/twohanded/tribal_spear
	name = "tribal spear"
	desc = "A haphazardly-constructed, yet still deadly weapon of an ancient design."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "tribalspear0"
	force = 20
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = SLOT_BACK
	force_unwielded = 10
	force_wielded = 25
	throwforce = 20
	throw_speed = 4
	embedded_impact_pain_multiplier = 3
	armour_penetration = 10
	materials = list(MAT_METAL=1150, MAT_WOOD=2075)
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	sharpness = IS_SHARP
	obj_integrity = 200
	max_integrity = 200

/obj/item/weapon/spear
	name = "throwing spear"
	desc = "A rather deadly weapon of an ancient design."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "spear"
	force = 10
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = SLOT_BACK
	throwforce = 35
	throw_speed = 4
	embedded_impact_pain_multiplier = 3
	armour_penetration = 10
	materials = list(MAT_METAL=1150, MAT_WOOD=2075)
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	sharpness = IS_SHARP
	obj_integrity = 200
	max_integrity = 200

/obj/item/weapon/hammer
	name = "hammer"
	desc = "A simple construction tool, that can also be used to bring the revenge upon those who kidnapped you and kept you in the basement for several years." //Old Boy (2003)
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "hammer"
	slot_flags = SLOT_BELT
	force = 15
	throwforce = 10
	w_class = 3
	obj_integrity = 200
	max_integrity = 200

/obj/item/weapon/twohanded/sledgehammer
	name = "sledgehammer"
	desc = "Strong but heavy weapon of destruction, that works well only if you know how to use it properly."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "sledgehammer0"
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = 5
	force_unwielded = 5
	force_wielded = 20
	throwforce = 25
	throw_range = 7
	w_class = 4
	var/charged = 0
	origin_tech = "combat=3;powerstorage=3"

/obj/item/weapon/twohanded/largehammer
	name = "large sledgehammer"
	desc = "Large, strong, heavy weapon of DESTRUCTION."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "largesledgehammer0"
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = 5
	force_unwielded = 10
	force_wielded = 25
	throwforce = 25
	throw_range = 7
	w_class = 4
	var/charged = 0
	origin_tech = "combat=4;powerstorage=4"

/obj/item/weapon/twohanded/superhammer
	name = "super sledge"
	desc = "Also called \"Superkuvalda\" - BoS produced these using the most modern weapons technology.<br>It's equipped with storage of kinetic energy to enhance the impact."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "supersledgehammer0"
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = 5
	force_unwielded = 10
	force_wielded = 45
	throwforce = 30
	throw_range = 7
	w_class = 5
	var/charged = 1
	origin_tech = "combat=5;powerstorage=5"

/obj/item/weapon/twohanded/superhammer/proc/shock(mob/living/target)
	var/datum/effect_system/lightning_spread/s = new /datum/effect_system/lightning_spread
	s.set_up(5, 1, target.loc)
	s.start()
	target.visible_message("<span class='danger'>[target.name] was shocked by the [src.name]!</span>", \
		"<span class='userdanger'>You feel a powerful shock course through your body sending you flying!</span>", \
		"<span class='italics'>You hear a heavy electrical crack!</span>")
	var/atom/throw_target = get_edge_target_turf(target, get_dir(src, get_step_away(target, src)))
	target.throw_at(throw_target, 200, 4)
	charged = 0
	spawn(50)
		charged = 1
	return

/obj/item/weapon/twohanded/superhammer/attack(mob/M, mob/user)
	..()
	spawn(0)
	if(wielded && charged)
		playsound(src.loc, "sparks", 50, 1)
		if(istype(M, /mob/living))
			M.Stun(3)
			shock(M)

/obj/item/weapon/twohanded/superhammer/throw_impact(atom/target)
	. = ..()
	if(istype(target, /mob/living))
		var/mob/living/L = target
		L.Stun(3)
		shock(L)

/obj/item/weapon/pickaxe/rust
	name = "rusty pickaxe"
	desc = "This pickaxe has seen better days."
	icon = 'icons/obj/mining.dmi'
	icon_state = "pickaxe_rust"
	force = 12
	throwforce = 8
	digspeed = 45