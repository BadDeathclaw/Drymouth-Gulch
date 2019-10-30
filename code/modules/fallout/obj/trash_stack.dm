/obj/item/storage/trash_stack
	name = "pile of garbage"
	desc = "a pile of garbage. Smells as good, as it looks, though it may contain something useful. Or may not"
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "Junk_1"
	anchored = TRUE
	density = FALSE
	component_type = /datum/component/storage/concrete/trash_stack

/obj/item/storage/trash_stack/New()
	. = ..()
	icon_state = "Junk_[rand(1,12)]"
	spawn_trash()

/obj/item/storage/trash_stack/attack_hand(mob/user)
	return MouseDrop(user)

/obj/item/storage/trash_stack/proc/spawn_trash()
	for(var/obj/item/I in generate_trash())
		I.loc = src

/obj/item/storage/trash_stack/proc/generate_trash()
	var/list/back = list()
	for(var/i=0, i<rand(1,4), i++)
		var/itemtype = pick(/obj/item/crafting/duct_tape, /obj/item/crafting/wonderglue,
		/obj/item/crafting/turpentine, /obj/item/crafting/abraxo, /obj/item/crafting/reloader,
		/obj/item/crafting/igniter, /obj/item/crafting/timer, /obj/item/crafting/sensor,
		/obj/item/gun/ballistic/automatic/pistol/n99,
		/obj/item/ammo_box/magazine/m10mm_adv, /obj/item/stock_parts/cell, /obj/item/pipe,
		/obj/item/stack/f13Cash/random/bottle_cap/low,
		/obj/item/stack/f13Cash/random/bottle_cap/med,
		/obj/item/stack/f13Cash/random/ncr/med,
		/obj/item/stack/f13Cash/random/denarius/low,
		/obj/item/reagent_containers/food/snacks/f13/bubblegum,
		/obj/item/reagent_containers/food/snacks/f13/bubblegum/large,
		/obj/item/reagent_containers/food/snacks/f13/cram,
		/obj/item/reagent_containers/food/snacks/f13/cram/large,
		/obj/item/reagent_containers/food/snacks/f13/yumyum,
		/obj/item/reagent_containers/food/snacks/f13/fancylads,
		/obj/item/reagent_containers/food/snacks/f13/sugarbombs,
		/obj/item/reagent_containers/food/snacks/f13/crisps,
		/obj/item/reagent_containers/food/snacks/f13/steak,
		/obj/item/reagent_containers/food/snacks/f13/specialapples,
		/obj/item/reagent_containers/food/snacks/f13/dandyapples,
		/obj/item/reagent_containers/food/snacks/f13/blamco,
		/obj/item/reagent_containers/food/snacks/f13/blamco/large,
		/obj/item/reagent_containers/food/snacks/f13/mechanic,
		/obj/item/reagent_containers/food/snacks/f13/instamash,
		/obj/item/reagent_containers/food/snacks/f13/porknbeans,
		/obj/item/reagent_containers/food/snacks/f13/borscht,
		/obj/item/reagent_containers/food/snacks/f13/dog,
		/obj/item/clothing/shoes/f13/tan, /obj/item/clothing/suit/armor/f13/leatherarmor,
		/obj/item/trash/f13/electronic/toaster, /obj/item/radio,
		/obj/item/reagent_containers/glass/bucket, /obj/item/crowbar,
		/obj/item/flashlight, /obj/item/extinguisher,
		/obj/item/multitool, /obj/item/analyzer,
		/obj/item/t_scanner, /obj/item/weldingtool,
		/obj/item/screwdriver, /obj/item/wirecutters,
		/obj/item/wrench, /obj/item/clothing/head/welding,
		/obj/item/stack/cable_coil/random, /obj/item/kitchen/knife,
		/obj/item/kitchen/fork, /obj/item/storage/bag/tray,
		/obj/item/reagent_containers/glass/bowl, /obj/item/reagent_containers/food/drinks/drinkingglass,
		/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass,
		/obj/item/cultivator, /obj/item/shovel, /obj/item/shovel/spade,
		/obj/item/hatchet, /obj/item/scalpel, /obj/item/circular_saw,
		/obj/item/surgicaldrill, /obj/item/retractor, /obj/item/cautery,
		/obj/item/hemostat, /obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/beaker/large, /obj/item/ammo_casing/shotgun/beanbag,
		/obj/item/ammo_casing/shotgun/rubbershot, /obj/item/ammo_box/c38,
		/obj/item/taperecorder/empty, /obj/item/radio/off,
		/obj/item/light/tube, /obj/item/light/bulb,
		/obj/item/reagent_containers/syringe, /obj/item/restraints/handcuffs,
		/obj/item/ammo_casing/shotgun/buckshot,
		/obj/item/kitchen/knife/butcher, /obj/item/geiger_counter,
		/obj/item/ammo_box/magazine/m10mm_adv, /obj/item/ammo_box/magazine/m10mm_auto,
		/obj/item/crafting/lunchbox, /obj/item/gun/ballistic/automatic/pistol/ninemil,
		/obj/item/ammo_box/magazine/m9mm, /obj/item/gun/ballistic/revolver/colt6250,
		/obj/item/ammo_box/magazine/m556/rifle, /obj/item/ammo_box/magazine/greasegun,
		/obj/item/ammo_box/m44,/obj/item/ammo_box/magazine/m45,
		/obj/item/reagent_containers/pill/patch/healingpowder, /obj/item/ammo_box/a762,
		/obj/item/ammo_box/a308, /obj/item/ammo_box/a762/doublestacked,
		/obj/item/ammo_box/c9mm, /obj/item/ammo_box/c10mm,
		/obj/item/ammo_box/a556, /obj/item/ammo_box/c45,
		/obj/item/storage/pill_bottle/chem_tin/mentats, /obj/item/storage/pill_bottle/chem_tin/fixer,
		/obj/item/storage/pill_bottle/chem_tin/radx,
		/obj/item/reagent_containers/food/drinks/bottle/orangejuice, /obj/item/reagent_containers/food/drinks/bottle/cognac,
		/obj/item/reagent_containers/food/drinks/bottle/whiskey, /obj/item/reagent_containers/hypospray/medipen/psycho,
		/obj/item/clothing/glasses/sunglasses/big, /obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/glasses/material/mining, /obj/item/clothing/glasses/eyepatch,
		/obj/item/clothing/head/helmet/knight/fluff/rider, /obj/item/clothing/shoes/f13/cowboy,
		/obj/item/clothing/shoes/f13/explorer, /obj/item/clothing/shoes/f13/military/diesel,
		/obj/item/clothing/shoes/f13/military/female/diesel, /obj/item/clothing/gloves/f13/leather,
		/obj/item/clothing/gloves/f13/military, /obj/item/clothing/gloves/f13/ncr,
		/obj/item/gun/ballistic/shotgun/boltaction, /obj/item/toy/crayon/spraycan, /obj/item/stock_parts/capacitor/adv,
		/obj/item/stock_parts/scanning_module/adv, /obj/item/stock_parts/manipulator/nano, /obj/item/stock_parts/micro_laser/high,
		/obj/item/stock_parts/matter_bin/adv, /obj/item/stock_parts/manipulator/pico, /obj/item/stock_parts/matter_bin/super)
		var/I = new itemtype(src)
		back += I
	return back
