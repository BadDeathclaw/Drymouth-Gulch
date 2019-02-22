/obj/item/stack/spacecash
	name = "Pre-war Money"
	desc = "Looks old, and has a president's face on it. Might be worth something to the right person."
	singular_name = "bill"
	icon = 'icons/obj/economy.dmi'
	icon_state = "spacecash"
	amount = 1
	max_amount = 2000
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	full_w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	var/value = 1

/obj/item/stack/spacecash/update_icon()
	switch(amount)
		if(1 to 9)
			icon_state = "spacecash"
		if(10 to 19)
			icon_state = "spacecash10"
		if(20 to 49)
			icon_state = "spacecash20"
		if(50 to 99)
			icon_state = "spacecash50"
		if(100 to 199)
			icon_state = "spacecash100"
		if(200 to 499)
			icon_state = "spacecash200"
		if(500 to 999)
			icon_state = "spacecash500"
		else if(amount >= 1000)
			icon_state = "spacecash1000"
	desc = "Pre-war good all american cash worth $[amount]. Well... to the right person at least."

/obj/item/stack/spacecash/random
	//Used to generate a random stack of dosh
	var/min_dollars = 1
	var/max_dollars = 500

/obj/item/stack/spacecash/random/New()
	var/obj/item/stack/spacecash/randy = new //makes new stack
	randy.loc = src.loc //sets stack location to randstack location
	randy.amount = rand(min_dollars, max_dollars)
	randy.update_icon()
	qdel(src)

/obj/item/stack/spacecash/random/low
	min_dollars = 1
	max_dollars = 50

/obj/item/stack/spacecash/random/med
	min_dollars = 50
	max_dollars = 100

/obj/item/stack/spacecash/random/high
	min_dollars = 100
	max_dollars = 500

/obj/item/stack/spacecash/c10
	icon_state = "spacecash10"
	amount = 10
	desc = "Ten pre-war dollars."
/obj/item/stack/spacecash/c20
	icon_state = "spacecash20"
	amount = 20
	desc = "Twenty pre-war dollars."
/obj/item/stack/spacecash/c50
	icon_state = "spacecash50"
	amount = 50
	desc = "Fifty pre-war dollars."
/obj/item/stack/spacecash/c100
	icon_state = "spacecash100"
	amount = 100
	desc = "A hundred pre-war dollars."
/obj/item/stack/spacecash/c200
	icon_state = "spacecash200"
	amount = 200
	desc = "Two hundred pre-war dollars."
/obj/item/stack/spacecash/c500
	icon_state = "spacecash500"
	amount = 500
	desc = "Five hundred pre-war dollars."
/obj/item/stack/spacecash/c1000
	icon_state = "spacecash1000"
	amount = 1000
	desc = "A thousand pre-war dollars. Fat stacks before the bombs dropped."