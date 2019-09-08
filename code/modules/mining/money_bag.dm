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
	STR.can_hold = typecacheof(list(/obj/item/coin, /obj/item/stack/spacecash, /obj/item/stack/f13Cash))

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
	STR.can_hold = typecacheof(list(/obj/item/coin, /obj/item/stack/spacecash, /obj/item/stack/f13Cash))

// Legion reserves. Spawns with the Centurion.
/obj/item/storage/bag/money/small/legion/PopulateContents()
	// ~500ish worth of legion money
	new /obj/item/stack/f13Cash/random/denarius/high(src)
	new /obj/item/stack/f13Cash/random/aureus/med(src)
	
// Legion enlisted. Spawns with the Legionnaires.
/obj/item/storage/bag/money/small/legenlisted/PopulateContents()
	new /obj/item/stack/f13Cash/random/denarius/low(src)
	new /obj/item/stack/f13Cash/random/denarius/low(src)
	
// Legion officers. Spawns with the Decanii.
/obj/item/storage/bag/money/small/legofficers/PopulateContents()
	new /obj/item/stack/f13Cash/random/denarius/med(src)
	new /obj/item/stack/f13Cash/random/aureus/low(src)

// NCR reserves. Spawns with the Captain.
/obj/item/storage/bag/money/small/ncr/PopulateContents()
	// ~300 worth of ncr money
	new /obj/item/stack/f13Cash/random/ncr/high(src)

// NCR enlisted. Spawns with the non officers and non Vet Rangers.
/obj/item/storage/bag/money/small/ncrenlisted/PopulateContents()
	// ~15 worth of ncr money
	new /obj/item/stack/f13Cash/random/ncr/low(src)

// NCR officers. Spawns with the officers and Vet Ranger.
/obj/item/storage/bag/money/small/ncrofficers/PopulateContents()
	// ~60 worth of ncr money
	new /obj/item/stack/f13Cash/random/ncr/med(src)

// Den reserves. Spawns with the Sheriff.
/obj/item/storage/bag/money/small/den/PopulateContents()
	// ~225 worth of assorted money
	new /obj/item/stack/f13Cash/random/bottle_cap/med(src)
	new /obj/item/stack/f13Cash/random/denarius/med(src)
	new /obj/item/stack/f13Cash/random/ncr/med(src)

// Standard Wastelander money bag. They have more but are liable to get robbed for it.
/obj/item/storage/bag/money/small/wastelander/PopulateContents()
	// ~36 worth of assorted money
	new /obj/item/stack/f13Cash/random/bottle_cap/med(src)
	new /obj/item/stack/f13Cash/random/bottle_cap/low(src)
	new /obj/item/stack/f13Cash/random/denarius/low(src)
	new /obj/item/stack/f13Cash/random/ncr/low(src)

// Standard Great Khan money bag. They have a little more caps than common raiders.
/obj/item/storage/bag/money/small/khan/PopulateContents()
	new /obj/item/stack/f13Cash/random/bottle_cap/med(src)

// Standard Settler money bag. They are pretty wealthy, with NCR bucks and caps, no Legion money.
/obj/item/storage/bag/money/small/settler/PopulateContents()
	// ~87 worth of non legion money
	new /obj/item/stack/f13Cash/random/bottle_cap/med(src)
	new /obj/item/stack/f13Cash/random/bottle_cap/med(src)
	new /obj/item/stack/f13Cash/random/ncr/low(src)

// Standard Raider money bag. They blew it all on chems and armor mods.
/obj/item/storage/bag/money/small/raider/PopulateContents()
	// ~12 worth of caps
	new /obj/item/stack/f13Cash/random/bottle_cap/low(src)
	
