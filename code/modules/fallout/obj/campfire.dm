//Fallout 13 campfire directory

/obj/structure/campfire
	name = "campfire"

	density = 0
	anchored = 1
	opacity = 0

	var/fired = 0
	var/fuel = 300
	light_color = LIGHT_COLOR_FIRE
	var/burned = 0
	desc = "A warm, bright, and hopeful fire source - when it's burning, of course."

	icon = 'icons/fallout/objects/structures/campfire.dmi'
	icon_state = "campfire20"

/obj/structure/campfire/Destroy()
	SSobj.processing.Remove(src)
	..()

/obj/structure/campfire/attackby(obj/item/P, mob/user, params)
	if(burned)
		to_chat(user, "You remove some campfire ashes.")
		qdel(src)
		return
	if(P.is_hot())
		fire(user)
	else if(istype(P, /obj/item/stack/sheet/mineral/wood))
		var/obj/item/stack/sheet/mineral/wood/W = P
		if(fuel > 400)
			to_chat(user, "You can't add more fuel - wait untill some of it burns away!")
			return
		if(W.use(1))
			user.visible_message("[user] has added fuel to [src].", "<span class='notice'>You have added fuel to [src].</span>")
			fuel += 60
	else if(fired && istype(P, /obj/item/weapon/reagent_containers/food/snacks))
		if(!ishuman(user))
			return
		var/mob/living/carbon/human/H = user
		var/obj/item/weapon/reagent_containers/food/snacks/F = P
		to_chat(user, "You start cooking a [F.name]")
		if(do_after(user, 20, target = src))
			if(F.cooked_type)
				H.drop_item()
				var/obj/item/weapon/reagent_containers/food/snacks/S = new F.cooked_type ()
				H.put_in_active_hand(S)
				F.initialize_cooked_food(S, 0.8)
				feedback_add_details("food_made","[F.type]")
			else
				H.drop_item()
				var/obj/item/weapon/reagent_containers/food/snacks/S = new /obj/item/weapon/reagent_containers/food/snacks/badrecipe()
				H.put_in_active_hand(S)
			qdel(F)
	else
		. = ..()
		if(fired)
			P.fire_act(1000, 500)

/obj/structure/campfire/fire_act(exposed_temperature, exposed_volume)
	fire()

/obj/structure/campfire/Crossed(go/AM)
	if(fired)
		burn_process()

/obj/structure/campfire/process()
	if(fuel <= 0)
		extinguish()
		return
	burn_process()
	fuel--
	if(fuel > 200)
		set_light(8)
	else if(fuel > 100)
		set_light(3)
	else
		set_light(1)
//	var/turf/open/location = get_turf(src)//shity code detected
//	if(istype(location))
//		var/datum/gas_mixture/affected = location.air
//		affected.temperature *= 1.01

/obj/structure/campfire/proc/fire(mob/living/user)

	BeginAmbient('sound/effects/comfyfire.ogg', 20, 12)

	playsound(src, 'sound/items/welder.ogg', 25, 1, -3)
	START_PROCESSING(SSobj, src)
	fired = 1
	desc = "A burning campfire... A warm, bright, and hopeful fire source.<br><b>It's hot!</b>"
	if(user)
		user.visible_message("[user] has lit a [src].", "<span class='notice'>You have lit a [src].</span>")
	update_icon()
	burn_process()

/obj/structure/campfire/proc/burn_process()
	var/turf/location = get_turf(src)
	for(var/A in location)
		if(A == src)
			continue
		if(isobj(A))
			var/obj/O = A
			O.fire_act(1000, 500)
		else if(isliving(A))
			var/mob/living/L = A
			L.adjust_fire_stacks(5)
			L.IgniteMob()

/obj/structure/campfire/update_icon()
	if(fired)
		icon_state = "campfire21"
		overlays = list(image(icon,icon_state = "campfire_o"))
	else
		icon_state = "campfire20"
		overlays.Cut()
	..()

/obj/structure/campfire/extinguish()
	name = "burned campfire"
	desc = "It has burned to ashes..."
	icon_state = "campfire20"
	fired = 0
	burned = 1
	set_light(0)
	StopAmbient()
	STOP_PROCESSING(SSobj, src)
	update_icon()

/obj/structure/campfire/infinity
	fired = 1
	icon_state = "campfire21"
	fuel = 999999999
