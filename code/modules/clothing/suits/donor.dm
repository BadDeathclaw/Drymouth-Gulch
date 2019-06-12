/*
 * Contains:
 *		Patreon Donor Items
 *
 *
 */

/obj/item/clothing/suit/donor/soldier //Based off of Colonel Autumn's uniform from FO3.
	name = "Soldier's Greatcoat"
	desc = "A resistant, tan greatcoat, typically worn by pre-War Generals."
	icon_state = "soldier"
	item_state = "soldier"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 30, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)
	allowed = list(/obj/item/gun,
	/obj/item/melee/classic_baton/telescopic,
	/obj/item/kitchen/knife/combat,
	/obj/item/clothing/glasses,
	/obj/item/assembly/flash/handheld,
	/obj/item/restraints/handcuffs,
	/obj/item/flashlight,
	/obj/item/grenade)
	
