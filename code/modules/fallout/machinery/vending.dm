//Fallout 13 vending machines directory

/obj/machinery/vending/nukacolavend
	name = "\improper Nuka-Cola vending machine"
	icon = 'icons/fallout/machines/vending.dmi'
	icon_state = "nuka_vending"
	icon_deny = "nuka_vending-deny"
	product_slogans = "Take the leap... enjoy a Quantum!"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola/radioactive = 20)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 4)
	refill_canister = /obj/item/weapon/vending_refill/nukacolavend
	self_weight = 150
	brightness_on = 2
	light_color = LIGHT_COLOR_RED

/obj/machinery/vending/nukacolavend/initialize()
	desc = pick("You can barely read the engraving on the side of the machine...<br>\"WARNING: Those found tampering with this unit will face severe consequences from The Nuka-Cola Coporation.\"","The machine makes you nostalgic for the days of your childhood.<br>What if there are still some bottles left?","If there is anything left of humanity after all these years, certainly it is Nuka-Cola.")
	..()

/obj/machinery/vending/nukacolavend/full
	name = "\improper pristine Nuka-Cola vending machine"
	icon_state = "nuka_vending"
	icon_deny = "nuka_vending-deny"
	product_slogans = "Take the leap... enjoy a Quantum!"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 20)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 10)
	refill_canister = /obj/item/weapon/vending_refill/nukacolavend/full

/obj/machinery/vending/nukacolavend/full/initialize()
	desc = pick("You read the engraving on the side of the machine...<br>\"WARNING: Those found tampering with this unit will face severe consequences from The Nuka-Cola Corporation.\"","This particular machine seems to be in a better condition than others you have seen.<br>What if there are still some bottles left?","Cola. Cola never changes.<br>The Romans waged war because they didn't try Nuka-Cola. Spain built an empire from its lust for everything but Nuka-Cola.<br>All the empires on Earth have fallen, but Cola never changes.")
	..()

/obj/item/weapon/vending_refill/nukacolavend
	machine_name = "Nuka-Cola vending machine"
	icon_state = "refill_cola"
	charges = list(20, 2, 0)//of 60 standard, 6 contraband
	init_charges = list(20, 2, 0)

/obj/item/weapon/vending_refill/nukacolavend/full
	machine_name = "pristine Nuka-Cola vending machine"
	icon_state = "refill_cola"
	charges = list(20, 2, 0)//of 60 standard, 6 contraband
	init_charges = list(20, 2, 0)