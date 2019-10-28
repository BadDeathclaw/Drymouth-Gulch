/* Code by Tienn */
/* Sprites by Moonmandoom*/

#define STATE_IDLE 0
#define STATE_SERVICE 1
#define STATE_VEND 2
#define STATE_LOCKOPEN 3

#define CASH_CAP_VENDOR 1

/* exchange rates X * CAP*/
#define CASH_AUR_VENDOR 100 /* 100 caps to 1 AUR */
#define CASH_DEN_VENDOR 4 /* 4 caps to 1 DEN */
#define CASH_NCR_VENDOR 0.4 /* $100 to 40 caps */

// Total number of caps value spent in the Trading Protectrons Vendors
GLOBAL_VAR_INIT(vendor_cash, 0)

/obj/machinery/trading_machine
	name = "Wasteland Vending Machine"
	desc = "Wasteland Vending Machine! Unlock with a key, load your goods, and profit!"

	icon = 'icons/obj/vending.dmi'
	icon_state = "sec"
	var/idle_icon_state = "sec"
	var/service_icon_state = "sec-broken"
	var/lock_icon_state = "sec-broken"

	anchored = 1
	density = 1
	layer = 2.9
	verb_say = "beeps"
	verb_ask = "beeps"
	verb_exclaim = "beeps"
	obj_integrity = 300
	max_integrity = 300
	integrity_failure = 100
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 50, acid = 70)
	use_power = 0

	var/stored_item_type = list()
	var/content[0]		// store items
	var/stored_caps = 0	// store caps
	var/obj/item/lock_part/lock = null
	var/machine_state = STATE_IDLE // 0 - working, 1 - on service, 2 - on vending, 3 - open lock
	var/id = 0
	var/create_lock = TRUE
	var/create_key = TRUE
	var/create_description = FALSE
	var/basic_price = 20
	var/expected_price = 0
	var/obj/item/vending_item
	var/item_not_acceptable_message = "Something is wrong... Can't insert an item."

/* Weapon Vending Machine*/
/obj/machinery/trading_machine/weapon
	name = "Weapon Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "weapon_idle"
	idle_icon_state = "weapon_idle"
	service_icon_state = "weapon_service"
	lock_icon_state = "weapon_lock"
	stored_item_type = list(/obj/item/gun, /obj/item/melee)

/* Ammo Vending Machine*/
/obj/machinery/trading_machine/ammo
	name = "Ammo Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "ammo_idle"
	idle_icon_state = "ammo_idle"
	service_icon_state = "ammo_service"
	lock_icon_state = "ammo_lock"
	stored_item_type = list(/obj/item/ammo_box, /obj/item/stock_parts/cell)

/* Armor Vending Machine*/
/obj/machinery/trading_machine/armor
	name = "Armor Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "armor_idle"
	idle_icon_state = "armor_idle"
	service_icon_state = "armor_service"
	lock_icon_state = "armor_lock"
	stored_item_type = list(/obj/item/clothing, /obj/item/storage/belt)

/* Medical Vending Machine*/
/obj/machinery/trading_machine/medical
	name = "Medicine Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "med_idle"
	idle_icon_state = "med_idle"
	service_icon_state = "med_service"
	lock_icon_state = "med_lock"
	stored_item_type = list(/obj/item/reagent_containers)

/* Initialization */
/obj/machinery/trading_machine/Initialize()
	. = ..()
	if(create_lock)
		lock = new /obj/item/lock_part()
		lock.forceMove(src)
	if(create_key)
		var/obj/item/key/vending/K = new /obj/item/key/vending()
		K.name = "[src.name] key"
		K.forceMove(src.loc)
		if(lock)
			lock.is_secured = 0
			lock.store_key(K)
			lock.is_secured = 1
	if(create_description)
		var/obj/item/paper/P = new /obj/item/paper
		P.info = get_paper_description_data()
		P.update_icon()
		P.forceMove(src.loc)

/* Adding item to machine and spawn Set Price dialog */
/obj/machinery/trading_machine/proc/add_item(obj/item/Itm, mob/living/carbon/human/user)
	if(machine_state != STATE_SERVICE)
		return

	if(is_available_category(Itm) && is_acceptable_item_state(Itm))
		var/price = input(usr, "Enter price for " + Itm.name + ".", "Setup Price", basic_price) as null|text
		if(!price)
			return

		content[Itm] = price

		if(istype(Itm.loc, /mob))
			var/mob/M = Itm.loc
			if(!M.dropItemToGround(Itm))
				to_chat(usr, "<span class='warning'>\the [Itm] is stuck to your hand, you cannot put it in \the [src]!</span>")
				return

		Itm.forceMove(src)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You loaded [Itm.name] to vending machine. New price - [content[Itm]] caps..")
		src.ui_interact(usr)
	else
		if(!is_available_category(Itm))
			playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
			to_chat(usr, "*beep* ..wrong item.")
		else if (!is_acceptable_item_state(Itm))
			playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
			to_chat(usr, item_not_acceptable_message)

/* Check item type and compare it with stored_item_type */
/obj/machinery/trading_machine/proc/is_available_category(obj/item/Itm)
	for(var/item_type in stored_item_type)
		if(istype(Itm, item_type))
			return 1
	return 0

/* Hook for check item parameters */
/obj/machinery/trading_machine/proc/is_acceptable_item_state(obj/item/Itm)
	return 1

/* Remove item from machine. */
/obj/machinery/trading_machine/proc/remove_item(obj/item/ItemToRemove)
	if(content.Remove(ItemToRemove))
		ItemToRemove.forceMove(src.loc)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		src.ui_interact(usr)

/* Adding a caps to caps storage and release vending item. */
/obj/machinery/trading_machine/proc/add_caps(obj/item/I)
	if(machine_state != STATE_VEND)
		return

	if(istype(I, /obj/item/stack/f13Cash/bottle_cap))
		if(I.use(expected_price))
			stored_caps += expected_price
			playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
			to_chat(usr, "You put [expected_price] caps to a vending machine. [vending_item.name] is vended out of it. ")
			remove_item(vending_item)
			set_state(STATE_IDLE)
			onclose(usr, "vending")
		else
			playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
			to_chat(usr, "Not enough caps.")

/* Spawn all caps on world and clear caps storage */
/obj/machinery/trading_machine/proc/remove_all_caps()
	if(stored_caps <= 0)
		return
	var/obj/item/stack/f13Cash/bottle_cap/C = new /obj/item/stack/f13Cash/bottle_cap
	if(stored_caps > C.max_amount)
		C.add(C.max_amount - 1)
		C.forceMove(src.loc)
		stored_caps -= C.max_amount
	else
		C.add(stored_caps - 1)
		C.forceMove(src.loc)
		stored_caps = 0
	playsound(src, 'sound/items/coinflip.ogg', 60, 1)
	src.ui_interact(usr)

/* Storing item and price and switch machine to vending mode*/
/obj/machinery/trading_machine/proc/vend(obj/item/Itm)
	if(content.Find(Itm))
		vending_item = Itm
		expected_price = text2num(content[Itm])
		set_state(STATE_VEND)
		src.attack_hand(usr)

/* Remove lock from machine */
/obj/machinery/trading_machine/proc/drop_lock()
	if(!lock)
		to_chat(usr, "No lock here.")
		return

	lock.forceMove(loc)
	lock = null
	playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
	src.ui_interact(usr)

/* Assign lock to this machine */
/obj/machinery/trading_machine/proc/set_lock(obj/item/lock_part/newLock)
	if(lock)
		playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
		to_chat(usr, "This machine is already have a lock")
		return
	else
		lock = newLock
		if(usr.dropItemToGround(lock))
			lock.forceMove(src)
			playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
			to_chat(usr, "Lock installed.")
	src.ui_interact(usr)

/* Switch machine to service mode */
/obj/machinery/trading_machine/proc/set_service(var/newMode)
	switch(machine_state)
		if(0)
			if(newMode)
				set_state(STATE_SERVICE)
		if(1)
			if(!newMode)
				set_state(STATE_IDLE)

	if(machine_state == STATE_SERVICE)
		to_chat(usr, "Vending Machine now on service")
	else
		to_chat(usr, "Vending Machine now working")
	src.ui_interact(usr)

/* Update icon depends on machine_state */
/obj/machinery/trading_machine/proc/updateIcon()
	switch(machine_state)
		if(STATE_IDLE)
			cut_overlays()
			icon_state = idle_icon_state
		if(STATE_SERVICE)
			cut_overlays()
			icon_state = service_icon_state
		if(STATE_VEND)
			cut_overlays()
			icon_state = idle_icon_state
		if(STATE_LOCKOPEN)
			cut_overlays()
			icon_state = lock_icon_state
			add_overlay(image(icon, "[initial(icon_state)]-panel"))

/* Seting machine state and update icon */
/obj/machinery/trading_machine/proc/set_state(var/new_state)
	if(machine_state == new_state)
		return

	if(new_state == STATE_IDLE && !lock)
		return

	if(!anchored)
		return

	machine_state = new_state
	updateIcon()

/* Attack By */
/obj/machinery/trading_machine/attackby(obj/item/OtherItem, mob/living/carbon/human/user, parameters)
	switch(machine_state)
		if(STATE_IDLE) // working

			/* Vending Key */
			if(istype(OtherItem, /obj/item/key/vending))
				if(lock)
					if(lock.check_key(OtherItem))
						set_service(STATE_SERVICE)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)
					else
						playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
						to_chat(usr, "Unknown key.")
				else
					playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
					to_chat(usr, "No lock here")

			/* Other */
			else
				attack_hand(user)

		if(STATE_SERVICE) // service

			/* Screwdriver */
			if(istype(OtherItem, /obj/item/screwdriver))
				set_state(STATE_LOCKOPEN)
				playsound(src, 'sound/items/Screwdriver.ogg', 60, 1)

			/* Locker */
			if(istype(OtherItem, /obj/item/lock_part))
				set_lock(OtherItem)
				playsound(src, 'sound/items/Crowbar.ogg', 60, 1)

			/* Key */
			if(istype(OtherItem, /obj/item/key/vending))
				if(lock)
					var/obj/item/key/vending/used_key = OtherItem
					if(lock.check_key(OtherItem) || id == used_key.id)
						set_state(STATE_IDLE)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)
					else
						playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
						to_chat(usr, "Unknown key.")
				else
					playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
					to_chat(usr, "No lock")


			else if(is_available_category(OtherItem))
				add_item(OtherItem, user)

			else
				attack_hand(user)

		if(STATE_VEND) // vending
			// Caps
			if(istype(OtherItem, /obj/item/stack/f13Cash/bottle_cap))
				add_caps(OtherItem)
			else
				attack_hand(user)

		if(STATE_LOCKOPEN)
			/* Screwdriver */
			if(istype(OtherItem, /obj/item/screwdriver))
				set_state(STATE_SERVICE)
				playsound(src, 'sound/items/Screwdriver2.ogg', 60, 1)


			/* Wrench */
			else if(istype(OtherItem, /obj/item/wrench))
				if(src.can_be_unfasten_wrench(user))
					var/prev_anchor = anchored
					src.default_unfasten_wrench(user, OtherItem)
					if(anchored != prev_anchor)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)

			/* Crowbar */
			else if(istype(OtherItem, /obj/item/crowbar))
				drop_lock()

			else if(istype(OtherItem, /obj/item/lock_part))
				var/obj/item/lock_part/P = OtherItem
				if(P.is_secured)
					set_lock(OtherItem)
				else
					playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
					to_chat(usr, "You need to secure lock first. Use screwdriver.")

	src.ui_interact(user)

/* Spawn input dialog and set item price */
/obj/machinery/trading_machine/proc/set_price_by_input(obj/item/Itm, mob/user)
	if(machine_state != STATE_SERVICE)
		return

	var/new_price = input(user, "Enter price for " + Itm.name + ".", "Setup Price", content[Itm]) as null|text
	if(new_price)
		content[Itm] = new_price
		playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 60, 1)
		src.ui_interact(user)

/* Find item by name and price in content and return type */
/obj/machinery/trading_machine/proc/find_item(var/item_name, var/item_price)
	for(var/obj/item/Itm in content)
		if(content[Itm] == item_price && sanitize(Itm.name) == sanitize(item_name))
			return Itm

/* Attack Hand */
/obj/machinery/trading_machine/attack_hand(mob/user)
	ui_interact(user)

/* Design UI here */
/obj/machinery/trading_machine/ui_interact(mob/user)
	. = ..()
	var/datum/browser/popup = new(user, "vending", (name), 400, 500)
	popup.set_content(get_ui_content(machine_state))
	popup.open()

/obj/machinery/trading_machine/proc/get_ui_content(var/state)
	var/dat = ""
	switch(state)
		// --- Work
		if(STATE_IDLE)
			dat += "<h3>Select an item</h3>"
			dat += "<div class='statusDisplay'>"
			if(content.len == 0)
				dat += "<font color = 'red'>No products loaded!</font>"
			else
				for(var/obj/item/Itm in content)
					var/item_name = url_encode(Itm.name)
					var/price = content[Itm]
					dat += "<a href='byond://?src=\ref[src];vend=[item_name];current_price=[price]'>[Itm.name] | [price] caps</a> "
					dat += "<a href='byond://?src=\ref[src];examine=[item_name];current_price=[price]'>Examine</a><br> "

		//--- Service
		if(STATE_SERVICE)
			dat += "<h3>Machine setup menu</h3>"
			dat += "<div class='statusDisplay'>"
			dat += "<font color='green'>Caps stored - [stored_caps]</font>"
			dat += "<a href='?src=\ref[src];removecaps=1'>Unload</a>"
			dat += "<h4> Items </h4> "

			if(content.len == 0)
				dat += "<font color = 'red'>No products loaded!</font>"
			else
				for(var/obj/item/Itm in content)
					var/item_name = url_encode(Itm.name)
					var/price = content[Itm]
					dat += "<b>[Itm.name]</b> - [content[Itm]] caps"
					dat += "<a href='?src=\ref[src];setprice=[item_name];current_price=[price]'>Set price</a> "
					dat += "<a href='?src=\ref[src];remove=[item_name];current_price=[price]'>Remove</a> <br>"

		// --- Vend
		if(STATE_VEND)
			dat += "<h3>Select an item</h3>"
			dat += "<div class='statusDisplay'>"
			dat += "<font color = 'red'>Waiting for [expected_price] caps!</font>"
			dat += "<a href='?src=\ref[src];back=1'> Back</a> "

		// --- Lock Open
		if(STATE_LOCKOPEN)
			dat += ""

	return dat

/obj/machinery/trading_machine/proc/get_paper_description_data()
	var/data
	data += "<h1> Wasteland Wending Machines </h1>"
	data += "Wasteland Trading Company guide."
	return data

/* TOPIC */
/obj/machinery/trading_machine/Topic(href, href_list)
	if(..())
		return

	if(href_list["vend"])
		var/vend_item_name = href_list["vend"]
		var/actual_price = href_list["current_price"]
		to_chat(usr, "Vending [vend_item_name]...")
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			vend(I)

	if(href_list["back"])
		to_chat(usr, "Machine is working")
		src.set_state(STATE_IDLE)
		ui_interact(usr)

	if(href_list["setprice"])
		to_chat(usr, "Set new price...")
		var/vend_item_name = href_list["setprice"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			set_price_by_input(I, usr)

	if(href_list["remove"])
		var/vend_item_name = href_list["remove"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			to_chat(usr, "Unloading item [href_list["unload"]]")
			remove_item(I)

	if(href_list["removecaps"])
		remove_all_caps()

	if(href_list["examine"])
		var/item_name = href_list["examine"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(item_name, actual_price)
		I.examine(usr)

	ui_interact()

/**********************Trading Protectron Vendors**************************/

/obj/machinery/mineral/wasteland_vendor
	name = "Wasteland Vending Machine"
	desc = "Wasteland Vending Machine manned by old reprogrammed RobCo trading protectrons."
	icon = 'icons/WVM/machines.dmi'
	icon_state = "weapon_idle"

	density = TRUE
	use_power = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	can_be_unanchored = FALSE
	layer = 2.9

	var/stored_caps = 0	// store caps
	var/expected_price = 0
	var/list/prize_list = list()  //if you add something to this, please, for the love of god, sort it by price/type. use tabs and not spaces.

/obj/machinery/mineral/wasteland_vendor/medical
	name = "Wasteland Vending Machine - Medical"
	icon_state = "med_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Syringe",						/obj/item/reagent_containers/syringe,								10),
		new /datum/data/wasteland_equipment("Empty pillbottle",				/obj/item/storage/pill_bottle,										15),
		new /datum/data/wasteland_equipment("Rad-X pill",					/obj/item/reagent_containers/pill/radx,								20),
		new /datum/data/wasteland_equipment("RadAway",						/obj/item/reagent_containers/blood/radaway,							30),
		new /datum/data/wasteland_equipment("Stimpak",						/obj/item/reagent_containers/hypospray/medipen/stimpak,				100),
		new /datum/data/wasteland_equipment("Chemistry for Wastelanders",	/obj/item/book/granter/trait/chemistry,								600)
		)
	
/obj/machinery/mineral/wasteland_vendor/weapons
	name = "Wasteland Vending Machine - Weapons"
	icon_state = "weapon_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Surrival knife",				/obj/item/kitchen/knife/combat/survival, 							70),
		new /datum/data/wasteland_equipment("Combat knife",					/obj/item/kitchen/knife/combat, 									100),
		new /datum/data/wasteland_equipment("Mosin nagant",					/obj/item/gun/ballistic/shotgun/boltaction,							120),
		new /datum/data/wasteland_equipment("9mm pistol",					/obj/item/gun/ballistic/automatic/pistol/ninemil,					150),
		new /datum/data/wasteland_equipment("M1911",						/obj/item/gun/ballistic/automatic/pistol/m1911,						170),
		new /datum/data/wasteland_equipment("Riot shield",					/obj/item/shield/riot,												600)
		)

/obj/machinery/mineral/wasteland_vendor/ammo
	name = "Wasteland Vending Machine - Ammo"
	icon_state = "ammo_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Handgun magazine (.45)",		/obj/item/ammo_box/magazine/m45,									50),
		new /datum/data/wasteland_equipment("9mm pistol magazine (9mm)",	/obj/item/ammo_box/magazine/m9mm,									50),
		new /datum/data/wasteland_equipment("10mm pistol magazine (10mm)",	/obj/item/ammo_box/magazine/m10mm_adv,								60),
		new /datum/data/wasteland_equipment("Speed strip (.357)",			/obj/item/ammo_box/a357,											70),
		new /datum/data/wasteland_equipment("Speed loader (.44)",			/obj/item/ammo_box/m44,												70),
		new /datum/data/wasteland_equipment("Speed loader (.38)",			/obj/item/ammo_box/c38,												70),
		new /datum/data/wasteland_equipment("small rifle magazine (5.56mm)",/obj/item/ammo_box/magazine/m556/rifle/small,						100)
		)

/obj/machinery/mineral/wasteland_vendor/clothing
	name = "Wasteland Vending Machine - Clothing"
	icon_state = "armor_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Worn outft",						/obj/item/clothing/under/f13/worn,								15),
		new /datum/data/wasteland_equipment("Settler outfit",					/obj/item/clothing/under/f13/settler,							30),
		new /datum/data/wasteland_equipment("Merchant outfit",					/obj/item/clothing/under/f13/merchant,							40),
		new /datum/data/wasteland_equipment("Followers outfit",					/obj/item/clothing/under/f13/followers,							80),
		new /datum/data/wasteland_equipment("Combat uniform",					/obj/item/clothing/under/f13/combat,							250),
		new /datum/data/wasteland_equipment("Ranger's Guide to the Wasteland",	/obj/item/book/granter/trait/trekking,							600)
		)

/obj/machinery/mineral/wasteland_vendor/general
	name = "Wasteland Vending Machine - General"
	icon_state = "generic_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Drinking glass",				/obj/item/reagent_containers/food/drinks/drinkingglass,				5),
		new /datum/data/wasteland_equipment("Zippo",						/obj/item/lighter,													20),
		new /datum/data/wasteland_equipment("Explorer satchel",				/obj/item/storage/backpack/satchel/explorer,						25),
		new /datum/data/wasteland_equipment("Spray bottle",					/obj/item/reagent_containers/spray,									35),
		new /datum/data/wasteland_equipment("Bottle of E-Z-Nutrient",		/obj/item/reagent_containers/glass/bottle/nutrient/ez,				40)
		)

/obj/machinery/mineral/wasteland_vendor/special
	name = "Wasteland Vending Machine - Special"
	icon_state = "liberationstation_idle"
	prize_list = list(
		new /datum/data/wasteland_equipment("Random manual",					/obj/item/book/manual/random,									40),
		new /datum/data/wasteland_equipment("Box of ingredients - American",	/obj/item/storage/box/ingredients/american,						80),
		new /datum/data/wasteland_equipment("Music box",						/obj/item/holodisk/musicbox,									400),
		new /datum/data/wasteland_equipment("Advanced Armor and You",			/obj/item/book/granter/trait/pa_wear,							600),
		new /datum/data/wasteland_equipment("???",								/obj/item/toy/syndicateballoon,									3000)
		)

/datum/data/wasteland_equipment
	var/equipment_name = "generic"
	var/equipment_path = null
	var/cost = 0

/datum/data/wasteland_equipment/New(name, path, cost)
	src.equipment_name = name
	src.equipment_path = path
	src.cost = cost

/obj/machinery/mineral/wasteland_vendor/ui_interact(mob/user)
	. = ..()
	var/dat
	dat +="<div class='statusDisplay'>"
	dat += "<b>Bottle caps stored:</b> [stored_caps]. <A href='?src=[REF(src)];choice=eject'>Eject caps</A><br>"
	dat += "</div>"
	dat += "<br>"
	dat +="<div class='statusDisplay'>"
	dat += "<b>Currency conversion rates:</b><br>"
	dat += "1 Bottle cap = [CASH_CAP_VENDOR] bottle caps value <br>"
	dat += "1 NCR dollar = [CASH_NCR_VENDOR] bottle caps value <br>"
	dat += "1 Denarius = [CASH_DEN_VENDOR] bottle caps value <br>"
	dat += "1 Aureus = [CASH_AUR_VENDOR] bottle caps value <br>"
	dat += "</div>"
	dat += "<br>"
	dat +="<div class='statusDisplay'>"
	dat += "<b>Vendor goods:</b><BR><table border='0' width='300'>"
	for(var/datum/data/wasteland_equipment/prize in prize_list)
		dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=[REF(src)];purchase=[REF(prize)]'>Purchase</A></td></tr>"
	dat += "</table>"
	dat += "</div>"

	var/datum/browser/popup = new(user, "tradingvendor", "Wasteland Vending Machine", 400, 500)
	popup.set_content(dat)
	popup.open()
	return

/obj/machinery/mineral/wasteland_vendor/Topic(href, href_list)
	if(..())
		return
	if(href_list["choice"] == "eject")
		remove_all_caps()
	if(href_list["purchase"])
		var/datum/data/wasteland_equipment/prize = locate(href_list["purchase"])
		if (!prize || !(prize in prize_list))
			to_chat(usr, "<span class='warning'>Error: Invalid choice!</span>")
			return
		if(prize.cost > stored_caps)
			to_chat(usr, "<span class='warning'>Error: Insufficent bottle caps value for [prize.equipment_name]!</span>")
		else
			stored_caps -= prize.cost
			GLOB.vendor_cash += prize.cost
			to_chat(usr, "<span class='notice'>[src] clanks to life briefly before vending [prize.equipment_name]!</span>")
			new prize.equipment_path(src.loc)
			SSblackbox.record_feedback("nested tally", "wasteland_equipment_bought", 1, list("[type]", "[prize.equipment_path]"))
	updateUsrDialog()
	return

/obj/machinery/mineral/wasteland_vendor/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/f13Cash))
		add_caps(I)
	else
		attack_hand(user)

/* Adding a caps to caps storage and release vending item. */
/obj/machinery/mineral/wasteland_vendor/proc/add_caps(obj/item/I)
	if(istype(I, /obj/item/stack/f13Cash/bottle_cap))
		var/obj/item/stack/f13Cash/bottle_cap/currency = I
		var/inserted_value = FLOOR(currency.amount * CASH_CAP_VENDOR, 1)
		stored_caps += inserted_value
		I.use(currency.amount)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You put [inserted_value] bottle caps value to a vending machine.")
		src.ui_interact(usr)
	else if(istype(I, /obj/item/stack/f13Cash/ncr))
		var/obj/item/stack/f13Cash/ncr/currency = I
		var/inserted_value = FLOOR(currency.amount * CASH_NCR_VENDOR, 1)
		stored_caps += inserted_value
		I.use(currency.amount)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You put [inserted_value] bottle caps value to a vending machine.")
		src.ui_interact(usr)
	else if(istype(I, /obj/item/stack/f13Cash/denarius))
		var/obj/item/stack/f13Cash/denarius/currency = I
		var/inserted_value = FLOOR(currency.amount * CASH_DEN_VENDOR, 1)
		stored_caps += inserted_value
		I.use(currency.amount)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You put [inserted_value] bottle caps value to a vending machine.")
		src.ui_interact(usr)
	else if(istype(I, /obj/item/stack/f13Cash/aureus))
		var/obj/item/stack/f13Cash/aureus/currency = I
		var/inserted_value = FLOOR(currency.amount * CASH_AUR_VENDOR, 1)
		stored_caps += inserted_value
		I.use(currency.amount)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You put [inserted_value] bottle caps value to a vending machine.")
		src.ui_interact(usr)
	else
		to_chat(usr, "Invalid currency!")
		return

/* Spawn all caps on world and clear caps storage */
/obj/machinery/mineral/wasteland_vendor/proc/remove_all_caps()
	if(stored_caps <= 0)
		return
	var/obj/item/stack/f13Cash/bottle_cap/C = new /obj/item/stack/f13Cash/bottle_cap
	if(stored_caps > C.max_amount)
		C.add(C.max_amount - 1)
		C.forceMove(src.loc)
		stored_caps -= C.max_amount
	else
		C.add(stored_caps - 1)
		C.forceMove(src.loc)
		stored_caps = 0
	playsound(src, 'sound/items/coinflip.ogg', 60, 1)
	src.ui_interact(usr)
