/obj/machinery/vending/nukacolavend
	name = "\improper Nuka-Cola vending machine"
	icon = 'icons/obj/f13vending.dmi'
	icon_state = "nuka_vending"
	icon_deny = "nuka_vending-deny"
	product_slogans = "Take the leap... enjoy a Quantum!"
	products = list(/obj/item/reagent_containers/food/drinks/soda_cans/f13nukacola/radioactive = 20)
	contraband = list(/obj/item/reagent_containers/food/drinks/soda_cans/f13nukacola = 4)
	premium = list(/obj/item/reagent_containers/food/drinks/drinkingglass/filled/nuka_cola = 1) //REAl nuka cola
	refill_canister = /obj/item/vending_refill/nukacolavend

/obj/machinery/vending/nukacolavend/New()
	desc = pick("You can barely read the engravement on the side of a machine.<br>Warning: If you tamper with this unit you will have to answer to the Nuka-Cola Corporation.","The machine makes you nostalgic for the best days of your childhood.<br>What if there are still some bottles left? Or maybe not.","If there is anything left from humanity after all the decades of rage and stagnation, that sure is Nuka-Cola.")
	..()

/obj/machinery/vending/nukacolavendfull
	name = "\improper pristine Nuka-Cola vending machine"
	icon = 'icons/obj/f13vending.dmi'
	icon_state = "nuka_vending"
	icon_deny = "nuka_vending-deny"
	product_slogans = "Take the leap... enjoy a Quantum!"
	products = list(/obj/item/reagent_containers/food/drinks/soda_cans/f13nukacola = 20)
	contraband = list(/obj/item/reagent_containers/food/drinks/soda_cans/f13nukacola = 10)
	premium = list(/obj/item/reagent_containers/food/drinks/drinkingglass/filled/nuka_cola = 3) //REAl nuka cola
	refill_canister = /obj/item/vending_refill/nukacolavendfull

/obj/machinery/vending/nukacolavendfull/New()
	desc = pick("You can clearly read the engravement on the side of a machine.<br>Warning: If you tamper with this unit you will have to answer to the Nuka-Cola Corporation.","This particular machine seems to be in a better condition than something you could see out in the wastes.<br>What if there are still some bottles left?","Cola. Cola never changes.<br>The Romans waged war because they didn't try Nuka-Cola. Spain built an empire from its lust for everything but Nuka-Cola.<br>All the empires on Earth have fallen, but Cola never changes.")
	..()

/obj/item/vending_refill/nukacolavend
	machine_name = "Nuka-Cola vending machine"
	icon_state = "refill_cola"
	charges = list(30, 8, 4)
	init_charges = list(20, 4, 1)

/obj/item/vending_refill/nukacolavendfull
	machine_name = "pristine Nuka-Cola vending machine"
	icon_state = "refill_cola"
	charges = list(30, 15, 4)//ammount it has
	init_charges = list(20, 10, 3) //ammount of shit it is gunna put on the machine