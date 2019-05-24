//Krotchy doll, hail Postal. by WalterJe

/obj/item/weapon/krotchy
	name = "krotchy doll"
	desc = "The Bad Touch - Krotchy Doll."
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "doll"
	item_state = "doll"
	throwforce = 0
	hitsound = null
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	attack_verb = list("played with krotchy")
	var/spam_flag = 0

/obj/item/weapon/krotchy/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	playsound(loc, "krotchy", 50) //plays instead of tap.ogg!
	return ..()

/obj/item/weapon/krotchy/attack_self(mob/user as mob)
	if(spam_flag == 0)
		spam_flag = 1
		playsound(src.loc, "krotchy", 50)
		src.add_fingerprint(user)
		spawn(20)
			spam_flag = 0
	return

//Krotchy's original packaging

/obj/item/weapon/storage/fancy/krotchy_box
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "krotchybox1"
	name = "krotchy doll box"

/obj/item/weapon/storage/fancy/krotchy_box/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.can_hold = typecacheof(list(/obj/item/weapon/krotchy))
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 14
	STR.max_items = 1

/obj/item/storage/fancy/krotchy_box/PopulateContents()
	GET_COMPONENT(STR, /datum/component/storage)
	for(var/i = 1 to STR.max_items)
		new /obj/item/weapon/krotchy(src)