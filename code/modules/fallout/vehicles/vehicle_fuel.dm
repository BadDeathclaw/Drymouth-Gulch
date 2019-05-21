//Fallout 13 general fuel directory - Gas! Petrol! Guzzolene!

/obj/vehicle/fuel
	name = "vehicle"
	desc = "Something went wrong! Badmins spawned shit!"
	icon_state = ""

	var/fuel = 600
	var/max_fuel = 600
	var/obj/item/weapon/reagent_containers/fuel_tank/fuel_holder
	var/idle_wasting = 0.5
	var/move_wasting = 0.1

/obj/vehicle/fuel/New()
	..()
	fuel_holder = new(max_fuel, fuel)

/obj/vehicle/fuel/attackby(obj/item/weapon/W, mob/user, params) //Refueling
	if(istype(W, /obj/item/weapon/reagent_containers))
		fuel_holder.attackby(W, user, params)
		return 1
	return ..()

/obj/vehicle/fuel/Move(NewLoc,Dir=0,step_x=0,step_y=0)
	. = ..()
	if(engine_on && move_wasting)
		fuel_holder.reagents.remove_reagent("welding_fuel",move_wasting)

/obj/vehicle/fuel/process() //If process begining you can sure that engine is on
	var/fuel_wasting

	fuel_wasting += idle_wasting

//Health check
	var/health = (obj_integrity/max_integrity)
	if(health < 1)
		if(health < 0.5 && fuel > 100 && prob(10)) // If vehicle is broken it will burn
			visible_message("<span class='warning'>[src] is badly damaged, the engine has burst into flames!</span>")
			fuel_wasting += 2
			PoolOrNew(/obj/effect/hotspot, get_turf(src))
			if(prob(50)) //MOAR FIRE
				dyn_explosion(epicenter = src, power = fuel_holder.reagents.get_reagent_amount("welding_fuel")/10, flash_range = 2, adminlog = 0, flame_range = 5 ,silent = 1)

	fuel_holder.reagents.remove_reagent("welding_fuel",fuel_wasting)

	if(fuel_holder.reagents.get_reagent_amount("welding_fuel") < 1)
		StopEngine()

/obj/vehicle/fuel/start_engine()
	if(fuel_holder.reagents.get_reagent_amount("welding_fuel") < 1)
		to_chat(usr, "<span class='warning'>[src] has run out of fuel!</span>")
		return
	..()
	START_PROCESSING(SSobj, src)

/obj/vehicle/fuel/stop_engine()
	..()
	STOP_PROCESSING(SSobj, src)

/obj/vehicle/fuel/verb/ToogleFuelTank()
	set name = "Toogle Fuel Tank"
	set category = "Object"
	set src in view(1)
	fuel_holder.inside = !fuel_holder.inside
	to_chat(usr, "<span class='notice'>You changed transfer type.</span>")

/obj/vehicle/fuel/examine(mob/user)
	..()
	if(fuel_holder)
		var/fuel_percent = fuel_holder.reagents.total_volume / fuel_holder.reagents.maximum_volume * 100
		switch(fuel_percent)
			if(95 to INFINITY)
				to_chat(user, "<span class='notice'>Fuel meter shows 100% ! The fuel tank is full to the top. Let's ride!</span>")
			if(60 to 95)
				to_chat(user, "<span class='notice'>Fuel meter shows 75% ! Not so full, but it'll still last a while.</span>")
			if(25 to 60)
				to_chat(user, "<span class='notice'>Fuel meter shows 50% ! That should be just enough to find more fuel.</span>	")
			if(1 to 25)
				to_chat(user, "<span class='warning'>Fuel meter shows 25% ! It's almost out of fuel!</span>")
			else
				to_chat(user, "<span class='danger'>Fuel meter shows 0% ! There is no fuel left!</span>")



/obj/item/weapon/reagent_containers/fuel_tank
	name = "fuel tank"
	container_type = OPENCONTAINER
	amount_per_transfer_from_this = 25
	var/inside = 1

/obj/item/weapon/reagent_containers/fuel_tank/New(var/volume, var/fuel)
	src.volume = volume
	list_reagents = list("welding_fuel" = fuel)
	..()

/obj/item/weapon/reagent_containers/fuel_tank/attackby(obj/item/weapon/W, mob/user, params)
	if(W.is_open_container() && W.reagents)
		if(inside)
			if(!W.reagents.total_volume)
				to_chat(user, "<span class='warning'>[W] is empty!</span>")
				return

			if(src.reagents.total_volume >= src.reagents.maximum_volume)
				to_chat(user, "<span class='notice'>[src] is full.</span>")
				return


			var/trans = W.reagents.trans_to(src, amount_per_transfer_from_this)
			to_chat(user, "<span class='notice'>You transfer [trans] units of the solution to [src].</span>")
		else
			if(!src.reagents.total_volume)
				to_chat(user, "<span class='warning'>[src] is empty!</span>")
				return

			if(W.reagents.total_volume >= W.reagents.maximum_volume)
				to_chat(user, "<span class='notice'>[W] is full.</span>")
				return


			var/trans = src.reagents.trans_to(W, amount_per_transfer_from_this)
			to_chat(user, "<span class='notice'>You transfer [trans] units of the solution to [W].</span>")
