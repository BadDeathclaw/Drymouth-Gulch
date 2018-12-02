/*****************************Money bag********************************/

/obj/item/storage/bag/money
	name = "money bag"
	icon_state = "moneybag"
	force = 10
	throwforce = 0
	resistance_flags = FLAMMABLE
	max_integrity = 100
	w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/bag/money/Initialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 40
	STR.max_combined_w_class = 40
	STR.can_hold = typecacheof(list(/obj/item/coin, /obj/item/stack/spacecash))

/obj/item/storage/bag/money/vault/PopulateContents()
	new /obj/item/coin/silver(src)
	new /obj/item/coin/silver(src)
	new /obj/item/coin/silver(src)
	new /obj/item/coin/silver(src)
	new /obj/item/coin/gold(src)
	new /obj/item/coin/gold(src)
	new /obj/item/coin/adamantine(src)

/obj/item/storage/bag/money/small
	name = "money pouch"
	icon_state = "moneypouch"
	force = 10
	throwforce = 0
	resistance_flags = FLAMMABLE
	max_integrity = 100
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_ID

/obj/item/storage/bag/money/small/Initialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 20
	STR.can_hold = typecacheof(list(/obj/item/coin, /obj/item/stack/spacecash))

// Legion reserves. Spawns with the Centurion.
/obj/item/storage/bag/money/small/legion/PopulateContents()
	new /obj/item/stack/f13Cash/aureus/random_low(src)
	new /obj/item/stack/f13Cash/denarius/random_med(src)

// NCR reserves. Spawns with the Captain.
/obj/item/storage/bag/money/small/ncr/PopulateContents()
	new /obj/item/stack/f13Cash/ncr/random_high(src)
	new /obj/item/stack/f13Cash/ncr/random_high(src)

// Den reserves. Spawns with the Sheriff.
/obj/item/storage/bag/money/small/den/PopulateContents()
	new /obj/item/stack/f13Cash/ncr/random_med(src)
	new /obj/item/stack/f13Cash/denarius/random_med(src)
	new /obj/item/stack/f13Cash/bottlecap/random_high(src)

// Standard Wastelander money bag. They have more but are liable to get robbed for it.
/obj/item/storage/bag/money/small/wastelander/PopulateContents()
	new /obj/item/stack/f13Cash/bottlecap/random_low(src)
	new /obj/item/stack/f13Cash/denarius/random_low(src)
	new /obj/item/stack/f13Cash/ncr/random_low(src)

// Standard Settler money bag. They are pretty wealthy, with NCR bucks and caps, no Legion money.
/obj/item/storage/bag/money/small/settler/PopulateContents()
	new /obj/item/stack/f13Cash/bottlecap/random_med(src)
	new /obj/item/stack/f13Cash/ncr/random_med(src)

// Standard Raider money bag. They blew it all on chems and armor mods.
/obj/item/storage/bag/money/small/raider/PopulateContents()
	new /obj/item/stack/f13Cash/bottlecap/random_low(src)

// Legion don't start with a money bag, they just have a few loose coins in their backpack.