//Fallout 13 barrels directory

/obj/structure/reagent_dispensers/barrel
	name = "barrel"
	desc = "A metal container with something in it.<br>By the looks of it, it was manufactured recently."
	icon = 'icons/fallout/trash.dmi'
	icon_state = "single"
	tank_volume = 500
	reagent_id = "stablemutationtoxin"
//	self_weight = 200

/obj/structure/reagent_dispensers/barrel/dangerous
	name = "waste barrel"
	desc = "A rather odd-looking metal barrel, made of strange metal that somehow hasn't rusted after all this time.<br>There is a strange label on it, but you can't quite make it out..."
	icon_state = "dangerous"
	tank_volume = 500
	reagent_id = "radium"
	light_color = LIGHT_COLOR_GREEN
	light_power = 3
	light_range = 2
//	self_weight = 200

/obj/structure/reagent_dispensers/barrel/dangerous/Initialize()
	. = ..()
	AddComponent(/datum/component/radioactive, 100, src, 0, TRUE, TRUE) //half-life of 0 because we keep on going.

/obj/structure/reagent_dispensers/barrel/boom()
	visible_message("<span class='danger'>\The [src] ruptures!</span>")
	chem_splash(loc, 0, list(reagents))
	qdel(src)

/obj/structure/reagent_dispensers/barrel/explosive
	name = "fuel barrel"
	desc = "A rather odd-looking metal barrel, made of strange metal that somehow hasn't rusted after all this time.<br>There is a label on it, with a drawing of flames.<br>You wonder if there is anything left in it..."
	icon_state = "explosive"
	tank_volume = 500
	reagent_id = "welding_fuel"
//	self_weight = 200

/obj/structure/reagent_dispensers/barrel/explosive/boom()
	explosion(get_turf(src), 0, 1, tank_volume/200, flame_range = tank_volume/200)
	qdel(src)

/obj/structure/reagent_dispensers/barrel/explosive/blob_act(obj/structure/blob/B)
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/ex_act()
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/fire_act(exposed_temperature, exposed_volume)
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/tesla_act()
	..() //extend the zap
	boom()

obj/structure/reagent_dispensers/barrel/explosive/bullet_act(obj/item/projectile/P)
	..()
	if(!QDELETED(src)) //wasn't deleted by the projectile's effects.
		if(!P.nodamage && ((P.damage_type == BURN) || (P.damage_type == BRUTE)))
			var/boom_message = "[ADMIN_LOOKUPFLW(P.firer)] triggered a fueltank explosion via projectile."
			GLOB.bombers += boom_message
			message_admins(boom_message)
			var/log_message = "triggered a fueltank explosion via projectile."
			P.firer.log_message(log_message, INDIVIDUAL_ATTACK_LOG)
			log_attack("[key_name(P.firer)] [log_message]")
			boom()

/obj/structure/reagent_dispensers/barrel/explosive/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/weldingtool))
		if(!reagents.has_reagent("welding_fuel"))
			to_chat(user, "<span class='warning'>[src] is out of fuel!</span>")
			return
		var/obj/item/weldingtool/W = I
		if(!W.welding)
			if(W.reagents.has_reagent("welding_fuel", W.max_fuel))
				to_chat(user, "<span class='warning'>Your [W.name] is already full!</span>")
				return
			reagents.trans_to(W, W.max_fuel)
			user.visible_message("<span class='notice'>[user] refills [user.p_their()] [W.name].</span>", "<span class='notice'>You refill [W].</span>")
			playsound(src, 'sound/effects/refill.ogg', 50, 1)
			W.update_icon()
		else
			var/turf/T = get_turf(src)
			user.visible_message("<span class='warning'>[user] catastrophically fails at refilling [user.p_their()] [W.name]!</span>", "<span class='userdanger'>That was stupid of you.</span>")
			var/message_admins = "[ADMIN_LOOKUPFLW(user)] triggered a fuelbarrel explosion via welding tool at [ADMIN_VERBOSEJMP(T)]."
			GLOB.bombers += message_admins
			message_admins(message_admins)
			var/message_log = "triggered a fuelbarrel explosion via welding tool at [AREACOORD(T)]."
			user.log_message(message_log, INDIVIDUAL_ATTACK_LOG)
			log_game("[key_name(user)] [message_log]")
			log_attack("[key_name(user)] [message_log]")
			boom()
		return
	return ..()

/obj/structure/reagent_dispensers/barrel/old
	name = "old barrel"
	desc = "An old barrel. Oddly enough, it stands undamaged after all this time.<br>You wonder if there is anything left in it."
	icon_state = "one_b"
	tank_volume = 500
	reagent_id = "water"
//	self_weight = 200

/obj/structure/reagent_dispensers/barrel/two
	name = "two old barrels"
	desc = "A couple of old barrels. Oddly enough, they stand undamaged after all this time.<br>You wonder if there is anything left in these."
	icon_state = "two_b"
	tank_volume = 1000
	reagent_id = "lube"
	anchored = 1
//	self_weight = 400

/obj/structure/reagent_dispensers/barrel/three
	name = "three old barrels"
	desc = "Ancient containers with something inside of them. Or are they empty? Actually, how would you know that..."
	icon_state = "three_b"
	tank_volume = 1500
	reagent_id = "water"
	anchored = 1
//	self_weight = 600

/obj/structure/reagent_dispensers/barrel/four
	name = "four old barrels"
	desc = "Ancient containers with something inside of them. Or are they empty? Actually, that's a lot of barrels standing in a single spot..."
	icon_state = "four_b"
	tank_volume = 800
	reagent_id = "FEV_solution"
	anchored = 1
//	self_weight = 60
