/obj/structure/closet/crate/secure/weapon/ncr
	name = "secure ncr crate"
	desc = "Theres an NCR bear logo stamped on it"
	req_access = list(ACCESS_SECURITY)

/obj/structure/closet/crate/secure/weapon/ncr/speedloader

/obj/structure/closet/crate/secure/weapon/ncr/speedloader/PopulateContents()
	..()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/c4570(src)
		new /obj/item/ammo_box/m44(src)
		new /obj/item/ammo_box/c38(src)
		new /obj/item/ammo_box/a357(src)
	return

/obj/structure/closet/crate/secure/weapon/ncr/magazines

/obj/structure/closet/crate/secure/weapon/ncr/magazines/PopulateContents()
	..()
	for(var/i in 1 to 4)
		new /obj/item/ammo_box/magazine/m9mm(src)
	return

/obj/structure/closet/crate/secure/weapon/ncr/clips

/obj/structure/closet/crate/secure/weapon/ncr/clips/PopulateContents()
	..()
	for(var/i in 1 to 4)
		new /obj/item/ammo_box/a762/doublestacked(src)
		new /obj/item/ammo_box/a762(src)
		new /obj/item/ammo_box/a308(src)
	return

/obj/structure/closet/crate/secure/weapon/ncr/ammo9mm

/obj/structure/closet/crate/secure/weapon/ncr/ammo9mm/PopulateContents()
	..()
	for(var/i in 1 to 4)
		new /obj/item/ammo_box/c9mm(src)
	return

/obj/structure/closet/crate/secure/weapon/ncr/ammo556

/obj/structure/closet/crate/secure/weapon/ncr/ammo556/PopulateContents()
	..()
	for(var/i in 1 to 4)
		new /obj/item/ammo_box/a556(src)
	return

/obj/structure/closet/crate/secure/weapon/ncr/ammo45

/obj/structure/closet/crate/secure/weapon/ncr/ammo45/PopulateContents()
	..()
	for(var/i in 1 to 4)
		new /obj/item/ammo_box/c45(src)
	return

/obj/structure/closet/crate/secure/weapon/ncr/ncrclothes

/obj/structure/closet/crate/secure/weapon/ncr/ncrclothes/PopulateContents()
	..()
	for(var/i in 1 to 6)
		new /obj/item/clothing/head/f13/ncr(src)
		new /obj/item/clothing/suit/armor/f13/ncrarmor(src)
		new /obj/item/clothing/under/f13/ncr(src)
	return

/obj/structure/closet/crate/secure/weapon/ncr/ncrofficerclothes

/obj/structure/closet/crate/secure/weapon/ncr/ncrofficerclothes/PopulateContents()
	..()
	for(var/i in 1 to 2)
		new /obj/item/clothing/head/beret/ncr(src)
		new /obj/item/clothing/suit/armor/f13/ncrarmor/mantle(src)
		new /obj/item/clothing/under/f13/ncr/officer(src)
	return

/obj/structure/closet/crate/secure/weapon/ncr/ncrheadsets

/obj/structure/closet/crate/secure/weapon/ncr/ncrheadsets/PopulateContents()
	..()
	for(var/i in 1 to 5)
		new /obj/item/radio/headset/headset_ncr(src)
	return