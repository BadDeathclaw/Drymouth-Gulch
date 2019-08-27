#define maxCoinIcon 6
#define CASH_CAP 1

/* exchange rates X * CAP*/
#define CASH_AUR 100 /* 100 caps to 1 AUR */
#define CASH_DEN 4 /* 4 caps to 1 DEN */
#define CASH_NCR 0.4 /* $100 to 40 caps */

/* value of coins to spawn, use as-is for caps */
/* LOW_MIN / AUR = amount in AUR */

// A low value cash spawn is on average worth 12
#define LOW_MIN 5
#define LOW_MAX 20

// A medium value cash spawn is on average worth 75
#define MED_MIN 50
#define MED_MAX 100

// A high value cash spawn is on average worth 300
#define HIGH_MIN 100
#define HIGH_MAX 500

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
	var/value = CASH_CAP

/obj/item/stack/f13Cash/Initialize()
	. = ..()
	update_desc()
	update_icon()

/obj/item/stack/f13Cash/proc/update_desc()
	desc = "It's worth [amount] [singular_name][ (latin) ? (( amount > 1 ) ? "i" : "us") : (( amount > 1 ) ? "s" : "")].\n[flavor_desc]"

/obj/item/stack/f13Cash/merge(obj/item/stack/S)
	. = ..()
	update_desc()
	update_icon()

/obj/item/stack/f13Cash/use(used, transfer = FALSE)
	. = ..()
	update_desc()
	update_icon()

/obj/item/stack/f13Cash/random
	var/money_type = /obj/item/stack/f13Cash
	var/min_qty = LOW_MIN
	var/max_qty = LOW_MAX

/obj/item/stack/f13Cash/random/Initialize()
	..()
	spawn_money()
	return INITIALIZE_HINT_QDEL

/obj/item/stack/f13Cash/random/proc/spawn_money()
	var/obj/item/stack/f13Cash/stack = new money_type
	stack.loc = loc
	stack.amount = round(rand(min_qty, max_qty))
	stack.update_icon()

/* we have 6 icons, so we will use our own, instead of stack's   */
/obj/item/stack/f13Cash/update_icon()
	switch(amount)
		if(1)
			icon_state = "[initial(icon_state)]"
		if(2 to 5)
			icon_state = "[initial(icon_state)]2"
		if(6 to 50)
			icon_state = "[initial(icon_state)]3"
		if(51 to 100)
			icon_state = "[initial(icon_state)]4"
		if(101 to 500)
			icon_state = "[initial(icon_state)]5"
		if(501 to max_amount)
			icon_state = "[initial(icon_state)]6"


/* same as base, just classed for merging reasons */
/obj/item/stack/f13Cash/bottle_cap
	flavor_desc = "A standard Nuka-Cola bottle cap featuring 21 crimps and ridges,\n\
		A common unit of exchange, backed by water in the Hub"

/obj/item/stack/f13Cash/random/bottle_cap
	money_type = /obj/item/stack/f13Cash/bottle_cap

/obj/item/stack/f13Cash/random/bottle_cap/low
	min_qty = LOW_MIN / CASH_CAP
	max_qty = LOW_MAX / CASH_CAP

/obj/item/stack/f13Cash/random/bottle_cap/med
	min_qty = MED_MIN / CASH_CAP
	max_qty = MED_MAX / CASH_CAP

/obj/item/stack/f13Cash/random/bottle_cap/high
	min_qty = HIGH_MIN / CASH_CAP
	max_qty = HIGH_MAX / CASH_CAP

/obj/item/stack/f13Cash/denarius
	name = "Denarius"
	latin = 1
	singular_name = "Denari" // -us or -i
	icon = 'icons/obj/economy.dmi'
	icon_state = "denarius"
	flavor_desc =	"The inscriptions are in Latin,\n\
		'Caesar Dictator' on the front and\n\
		'Magnum Chasma' on the back."
	value = CASH_DEN * CASH_CAP

/obj/item/stack/f13Cash/random/denarius
	money_type = /obj/item/stack/f13Cash/denarius

/obj/item/stack/f13Cash/random/denarius/low
	min_qty = LOW_MIN / CASH_DEN
	max_qty = LOW_MAX / CASH_DEN

/obj/item/stack/f13Cash/random/denarius/med
	min_qty = MED_MIN / CASH_DEN
	max_qty = MED_MAX / CASH_DEN

/obj/item/stack/f13Cash/random/denarius/high
	min_qty = HIGH_MIN / CASH_DEN
	max_qty = HIGH_MAX / CASH_DEN

/obj/item/stack/f13Cash/random/denarius/legionpay_basic
	min_qty = 1
	max_qty = 2

/obj/item/stack/f13Cash/random/denarius/legionpay_veteran
	min_qty = 2
	max_qty = 3

/obj/item/stack/f13Cash/random/denarius/legionpay_officer
	min_qty = 4
	max_qty = 5

/obj/item/stack/f13Cash/aureus
	name = "Aureus"
	latin = 1
	singular_name = "Aure"// -us or -i
	icon = 'icons/obj/economy.dmi'
	icon_state = "aureus"
	flavor_desc = 	"The inscriptions are in Latin,\n\
					'Aeternit Imperi' on the front and\n\
					'Pax Per Bellum' on the back."
	value = CASH_AUR * CASH_CAP

/obj/item/stack/f13Cash/random/aureus
	money_type = /obj/item/stack/f13Cash/aureus

/obj/item/stack/f13Cash/random/aureus/low
	min_qty = 1
	max_qty = 1

/obj/item/stack/f13Cash/random/aureus/med
	min_qty = 2
	max_qty = 2

/obj/item/stack/f13Cash/random/aureus/high
	min_qty = 3
	max_qty = 3

/obj/item/stack/f13Cash/ncr
	name = "NCR Dollar"
	singular_name = "NCR Dollar"  /* same for denarius, we can pretend the legion can't latin properly */
	icon = 'icons/obj/economy.dmi'
	icon_state = "ncr" /* 10 points to whoever writes flavour text for each bill */
	value = CASH_NCR * CASH_CAP

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

/obj/item/stack/f13Cash/random/ncr
	money_type = /obj/item/stack/f13Cash/ncr

/obj/item/stack/f13Cash/random/ncr/low
	min_qty = LOW_MIN / CASH_NCR
	max_qty = LOW_MAX / CASH_NCR

/obj/item/stack/f13Cash/random/ncr/med
	min_qty = MED_MIN / CASH_NCR
	max_qty = MED_MAX / CASH_NCR

/obj/item/stack/f13Cash/random/ncr/high
	min_qty = HIGH_MIN / CASH_NCR
	max_qty = HIGH_MAX / CASH_NCR

/obj/item/stack/f13Cash/random/ncr/ncrpay_basic
	min_qty = 10
	max_qty = 20

/obj/item/stack/f13Cash/random/ncr/ncrpay_veteran
	min_qty = 40
	max_qty = 80

/obj/item/stack/f13Cash/random/ncr/ncrpay_officer
	min_qty = 200
	max_qty = 400

#undef maxCoinIcon
#undef CASH_CAP
#undef CASH_AUR
#undef CASH_DEN
#undef CASH_NCR
#undef LOW_MIN
#undef LOW_MAX
#undef MED_MIN
#undef MED_MAX
#undef HIGH_MIN
#undef HIGH_MAX