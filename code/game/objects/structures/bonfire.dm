/////////BONFIRES//////////

/obj/structure/bonfire
	name = "bonfire"
	desc = "For grilling, broiling, charring, smoking, heating, roasting, toasting, simmering, searing, melting, and occasionally burning things."
	icon = 'icons/obj/hydroponics/equipment.dmi'
	icon_state = "bonfire"
	light_color = LIGHT_COLOR_FIRE
	density = FALSE
	anchored = TRUE
	buckle_lying = 0
	var/burning = 0
	var/grill = FALSE
	var/fire_stack_strength = 5

/obj/structure/bonfire/dense
	density = TRUE

/obj/structure/bonfire/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && (mover.pass_flags & PASSTABLE))
		return TRUE
	if(mover.throwing)
		return TRUE
	return ..()

/obj/structure/bonfire/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stack/rods) && !can_buckle && !grill)
		var/obj/item/stack/rods/R = W
		var/choice = input(user, "What would you like to construct?", "Bonfire") as null|anything in list("Stake","Grill")
		switch(choice)
			if("Stake")
				R.use(1)
				can_buckle = TRUE
				buckle_requires_restraints = TRUE
				to_chat(user, "<span class='italics'>You add a rod to \the [src].")
				var/mutable_appearance/rod_underlay = mutable_appearance('icons/obj/hydroponics/equipment.dmi', "bonfire_rod")
				rod_underlay.pixel_y = 16
				underlays += rod_underlay
			if("Grill")
				R.use(1)
				grill = TRUE
				to_chat(user, "<span class='italics'>You add a grill to \the [src].")
				add_overlay("bonfire_grill")
			else
				return ..()
	if(W.is_hot())
		StartBurning()
	if(grill)
		if(user.a_intent != INTENT_HARM && !(W.item_flags & ABSTRACT))
			if(user.temporarilyRemoveItemFromInventory(W))
				W.forceMove(get_turf(src))
				var/list/click_params = params2list(params)
				//Center the icon where the user clicked.
				if(!click_params || !click_params["icon-x"] || !click_params["icon-y"])
					return
				//Clamp it so that the icon never moves more than 16 pixels in either direction (thus leaving the table turf)
				W.pixel_x = CLAMP(text2num(click_params["icon-x"]) - 16, -(world.icon_size/2), world.icon_size/2)
				W.pixel_y = CLAMP(text2num(click_params["icon-y"]) - 16, -(world.icon_size/2), world.icon_size/2)
		else
			return ..()


/obj/structure/bonfire/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(burning)
		to_chat(user, "<span class='warning'>You need to extinguish [src] before removing the logs!</span>")
		return
	if(!has_buckled_mobs() && do_after(user, 50, target = src))
		for(var/I in 1 to 5)
			var/obj/item/grown/log/L = new /obj/item/grown/log(src.loc)
			L.pixel_x += rand(1,4)
			L.pixel_y += rand(1,4)
		if(can_buckle || grill)
			new /obj/item/stack/rods(loc, 1)
		qdel(src)
		return

/obj/structure/bonfire/proc/CheckOxygen()
	if(isopenturf(loc))
		var/turf/open/O = loc
		if(O.air)
			var/loc_gases = O.air.gases
			if(loc_gases[/datum/gas/oxygen][MOLES] > 13)
				return 1
	return 0

/obj/structure/bonfire/proc/StartBurning()
	if(!burning && CheckOxygen())
		icon_state = "bonfire_on_fire"
		burning = 1
		set_light(6)
		Burn()
		START_PROCESSING(SSobj, src)

/obj/structure/bonfire/fire_act(exposed_temperature, exposed_volume)
	StartBurning()

/obj/structure/bonfire/Crossed(atom/movable/AM)
	if(burning & !grill)
		Burn()

/obj/structure/bonfire/proc/Burn()
	var/turf/current_location = get_turf(src)
	current_location.hotspot_expose(1000,100,1)
	for(var/A in current_location)
		if(A == src)
			continue
		if(isobj(A))
			var/obj/O = A
			O.fire_act(1000, 500)
		else if(isliving(A))
			var/mob/living/L = A
			L.adjust_fire_stacks(fire_stack_strength)
			L.IgniteMob()

/obj/structure/bonfire/proc/Cook()
	var/turf/current_location = get_turf(src)
	for(var/A in current_location)
		if(A == src)
			continue
		else if(isliving(A)) //It's still a fire, idiot.
			var/mob/living/L = A
			L.adjust_fire_stacks(fire_stack_strength)
			L.IgniteMob()
		else if(istype(A, /obj/item) && prob(20))
			var/obj/item/O = A
			O.microwave_act()

/obj/structure/bonfire/process()
	if(!CheckOxygen())
		extinguish()
		return
	if(!grill)
		Burn()
	else
		Cook()

/obj/structure/bonfire/extinguish()
	if(burning)
		icon_state = "bonfire"
		burning = 0
		set_light(0)
		STOP_PROCESSING(SSobj, src)

/obj/structure/bonfire/buckle_mob(mob/living/M, force = FALSE, check_loc = TRUE)
	if(..())
		M.pixel_y += 13

/obj/structure/bonfire/unbuckle_mob(mob/living/buckled_mob, force=FALSE)
	if(..())
		buckled_mob.pixel_y -= 13
