#define maxCoinIcon 6
#define CAP 1

/* exchange rates X * CAP*/
#define AUR 100 /* 100 caps to 1 AUR */
#define DEN 4 /* 4 caps to 1 DEN */
#define NCR 0.4 /* $100 to 40 caps */

/obj/item/stack/f13Cash
	name = "bottle cap"
	singular_name = "cap"
	icon = 'icons/obj/economy.dmi'
	icon_state = "bottle_cap"
	amount = 1
	max_amount = 2000
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	full_w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	var/flavor_desc = ""
	var/value = CAP

/obj/item/stack/f13Cash/Initialize()
	. = ..()
	update_desc()

/obj/item/stack/f13Cash/proc/update_desc()
	desc = "It's worth [amount] [singular_name][( amount > 1 ) ? "s" : ""]\n[flavor_desc]"


/obj/item/stack/f13Cash/merge(obj/item/stack/S)
	. = ..()
	update_desc()

/obj/item/stack/f13Cash/use(used, transfer = FALSE)
	. = ..()
	update_desc()

/* we have 6 icons, so we will use our own, instead of stack's   */
/obj/item/stack/f13Cash/update_icon()
	if(amount == 1)
		icon_state = "[initial(icon_state)]"
	else if(amount >= maxCoinIcon)
		icon_state = "[initial(icon_state)][maxCoinIcon]"
	else
		icon_state = "[initial(icon_state)][( amount > 1 ) ? amount : ""]"



/* same as base, just classed for merging reasons */
/obj/item/stack/f13Cash/bottle_cap
	flavor_desc = "A standard Nuka-Cola bottle cap featuring 21 crimps and ridges,\n\
		A common unit of exchange, backed by water in the Hub"

/obj/item/stack/f13Cash/denarius
	name = "Denarius"
	singular_name = "Denari" /* denari/denaris is sort of like sheep, rather than using denarius/denarii  */
	icon = 'icons/obj/economy.dmi'
	icon_state = "denarius"
	flavor_desc =	"The inscriptions are in Latin,\n\
		'Caesar Dictator' on the front and\n\
		'Magnum Chasma' on the back."
	value = DEN * CAP

/obj/item/stack/f13Cash/aureus
	name = "Aureus"
	singular_name = "Aurei"  /* same as denarius, we can pretend the legion can't latin properly */
	icon = 'icons/obj/economy.dmi'
	icon_state = "aureus"
	flavor_desc = 	"The inscriptions are in Latin,\n\
					'Aeternit Imperi' on the front and\n\
					'Pax Per Bellum' on the back."
	value = AUR * CAP

/obj/item/stack/f13Cash/ncr
	name = "NCR Dollar"
	singular_name = "NCR Dollar"  /* same for denarius, we can pretend the legion can't latin properly */
	icon = 'icons/obj/economy.dmi'
	icon_state = "ncr" /* 10 points to whoever writes flavour text for each bill */
	value = NCR * CAP

/obj/item/stack/f13Cash/ncr/update_icon()
	switch(amount)
		if(1  to 9)
			icon_state = "[initial(icon_state)]"
		if(10 to 19)
			icon_state = "[initial(icon_state)]10"
		if(20 to 49)
			icon_state = "[initial(icon_state)]20"
		if(50 to 99)
			icon_state = "[initial(icon_state)]50"
		if(100 to 199)
			icon_state = "[initial(icon_state)]100"
		if(200 to 499)
			icon_state = "[initial(icon_state)]200"
		if(500 to max_amount)
			icon_state = "[initial(icon_state)]500"

#undef maxCoinIcon
#undef CAP
#undef AUR
#undef DEN
#undef NCR
