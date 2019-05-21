/obj/item/weapon/storage/trash_stack
	name       = "pile of garbage"
	desc       = "a pile of garbage. Smells as good, as it looks, though it may contain something useful. Or may not"
	icon       = 'icons/fallout/objects/crafting.dmi'
	icon_state = "Junk_1"
	anchored   = 1
	density    = 0

	//rustle_jimmies       = FALSE
	w_class              = WEIGHT_CLASS_GIGANTIC
	max_w_class          = WEIGHT_CLASS_GIGANTIC
	max_combined_w_class = 30

	var/spawn_delay = "3000-7000" //or num
	var/spawn_next  = 0


/obj/item/weapon/storage/trash_stack/New()
	. = ..()
	icon_state = "Junk_[rand(1,12)]"

/obj/item/weapon/storage/trash_stack/MouseDrop(atom/over_object)
	if(world.time >= spawn_next)
		spawn_trash()
	. = ..()

/obj/item/weapon/storage/trash_stack/attack_hand(mob/user)
	return MouseDrop(user)

/obj/item/weapon/storage/trash_stack/can_be_inserted(obj/item/W, stop_messages = 0, mob/user)
	return 0

/obj/item/weapon/storage/trash_stack/proc/spawn_trash()
	for(var/obj/item/I in contents)
		remove_from_storage(I, null)
		qdel(I)
	if(isnum(spawn_delay))
		spawn_next = world.time + spawn_delay
	else if(istext(spawn_delay))
		var/list/rand_borders = splittext(spawn_delay,"-")
		if(length(rand_borders) == 2)
			rand_borders[1] = text2num(rand_borders[1])
			rand_borders[2] = text2num(rand_borders[2])
			if(isnum(rand_borders[1]) && isnum(rand_borders[2]))
				spawn_next = world.time + rand(rand_borders[1], rand_borders[2])
			else
				spawn_next = world.time + rand(500,5000) // if some shitter wrote bad values

	for(var/obj/item/I in generate_trash())
		handle_item_insertion(I,1,null)


/obj/item/weapon/storage/trash_stack/proc/generate_trash()
	var/list/back = list()
	for(var/i=0, i<rand(1,4), i++)
		var/itemtype = pick(/obj/item/crafting/duct_tape, /obj/item/crafting/wonderglue,
		/obj/item/crafting/turpentine, /obj/item/crafting/abraxo, /obj/item/crafting/reloader,
		/obj/item/crafting/igniter, /obj/item/crafting/timer, /obj/item/crafting/sensor,
		/obj/item/weapon/gun/ballistic/automatic/pistol/n99, /obj/item/weapon/gun/ballistic/shotgun/pipe,
		/obj/item/ammo_box/magazine/m10mm, /obj/item/weapon/stock_parts/cell, /obj/item/weapon/pipe,
		/obj/item/weapon/reagent_containers/food/snacks/f13/bubblegum,
		/obj/item/weapon/reagent_containers/food/snacks/f13/bubblegum/large,
		/obj/item/weapon/reagent_containers/food/snacks/f13/cram,
		/obj/item/weapon/reagent_containers/food/snacks/f13/cram/large,
		/obj/item/weapon/reagent_containers/food/snacks/f13/yumyum,
		/obj/item/weapon/reagent_containers/food/snacks/f13/fancylads,
		/obj/item/weapon/reagent_containers/food/snacks/f13/sugarbombs,
		/obj/item/weapon/reagent_containers/food/snacks/f13/crisps,
		/obj/item/weapon/reagent_containers/food/snacks/f13/steak,
		/obj/item/weapon/reagent_containers/food/snacks/f13/specialapples,
		/obj/item/weapon/reagent_containers/food/snacks/f13/dandyapples,
		/obj/item/weapon/reagent_containers/food/snacks/f13/blamco,
		/obj/item/weapon/reagent_containers/food/snacks/f13/blamco/large,
		/obj/item/weapon/reagent_containers/food/snacks/f13/mechanic,
		/obj/item/weapon/reagent_containers/food/snacks/f13/instamash,
		/obj/item/weapon/reagent_containers/food/snacks/f13/porknbeans,
		/obj/item/weapon/reagent_containers/food/snacks/f13/borscht,
		/obj/item/weapon/reagent_containers/food/snacks/f13/dog,
		/obj/item/clothing/shoes/f13/tan, /obj/item/clothing/suit/armor/f13/leatherarmor,
		/obj/item/trash/f13/electronic/toaster, /obj/item/device/radio,
		/obj/item/weapon/reagent_containers/glass/bucket, /obj/item/weapon/crowbar,
		/obj/item/device/flashlight, /obj/item/weapon/extinguisher,
		/obj/item/device/multitool, /obj/item/device/analyzer,
		/obj/item/device/t_scanner, /obj/item/weapon/weldingtool,
		/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters,
		/obj/item/weapon/wrench, /obj/item/clothing/head/welding,
		/obj/item/stack/cable_coil/random, /obj/item/weapon/kitchen/knife,
		/obj/item/weapon/kitchen/fork, /obj/item/weapon/storage/bag/tray,
		/obj/item/weapon/reagent_containers/glass/bowl, /obj/item/weapon/reagent_containers/food/drinks/drinkingglass,
		/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/shotglass,
		/obj/item/weapon/cultivator, /obj/item/weapon/shovel, /obj/item/weapon/shovel/spade,
		/obj/item/weapon/hatchet, /obj/item/weapon/scalpel, /obj/item/weapon/circular_saw,
		/obj/item/weapon/surgicaldrill, /obj/item/weapon/retractor, /obj/item/weapon/cautery,
		/obj/item/weapon/hemostat, /obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/glass/beaker/large, /obj/item/ammo_casing/shotgun/beanbag,
		/obj/item/ammo_casing/shotgun/rubbershot, /obj/item/ammo_box/c38,
		/obj/item/device/taperecorder/empty, /obj/item/device/radio/off,
		/obj/item/weapon/light/tube, /obj/item/weapon/light/bulb,
		/obj/item/weapon/reagent_containers/syringe, /obj/item/weapon/restraints/handcuffs,
		/obj/item/ammo_casing/shotgun, /obj/item/ammo_casing/shotgun/buckshot,
		/obj/item/ammo_casing/shotgun/dart, /obj/item/ammo_casing/shotgun/incendiary,
		/obj/item/weapon/kitchen/knife/butcher, /obj/item/device/geiger_counter,
		/obj/item/ammo_box/magazine/m10mm_adv, /obj/item/ammo_box/magazine/m10mm_auto,
		/obj/item/ammo_box/m44, /obj/item/ammo_box/magazine/m308, /obj/item/ammo_box/m308,
		/obj/item/ammo_box/magazine/m223, /obj/item/ammo_box/m223, /obj/item/stack/caps/random,
		/obj/item/crafting/lunchbox)
		var/I = new itemtype(src)
		back += I
	return back