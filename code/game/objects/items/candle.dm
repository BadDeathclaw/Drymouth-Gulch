#define CANDLE_LUMINOSITY	2
/obj/item/candle
	name = "red candle"
	desc = "In Greek myth, Prometheus stole fire from the Gods and gave it to \
		humankind. The jewelry he kept for himself."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle1"
	item_state = "candle1"
	w_class = WEIGHT_CLASS_TINY
	light_color = LIGHT_COLOR_FIRE
	var/wax = 1000
	var/lit = FALSE
	var/infinite = FALSE
	var/start_lit = FALSE
	heat = 1000

/obj/item/candle/Initialize()
	. = ..()
	if(start_lit)
		// No visible message
		light(show_message = FALSE)

/obj/item/candle/update_icon()
	var/i
	if(wax>750)
		i = 1
	else if(wax>400)
		i = 2
	else i = 3
	icon_state = "candle[i][lit ? "_lit" : ""]"


/obj/item/candle/attackby(obj/item/W, mob/user, params)
	..()
	var/msg = W.ignition_effect(src, user)
	if(msg)
		light(msg)

/obj/item/candle/fire_act(exposed_temperature, exposed_volume)
	if(!src.lit)
		light() //honk
	..()

/obj/item/candle/proc/light(show_message)
	if(!src.lit)
		src.lit = TRUE
		//src.damtype = "fire"
		if(show_message)
			usr.visible_message(show_message)
		set_light(CANDLE_LUMINOSITY)
		START_PROCESSING(SSobj, src)
		update_icon()


/obj/item/candle/process()
	if(!lit)
		return
	if(!infinite)
		wax--
	if(!wax)
		new/obj/item/trash/candle(src.loc)
		qdel(src)
	update_icon()
	open_flame()

/obj/item/candle/attack_self(mob/user)
	if(lit)
		user.visible_message(
			"<span class='notice'>[user] snuffs [src] out.</span>")
		lit = FALSE
		update_icon()
		set_light(0)

/obj/item/candle/is_hot()
	return lit * heat


/obj/item/candle/infinite
	infinite = TRUE
	start_lit = TRUE

//FL13 - Right now this functions basically as a candle. Could change it later, but for now this will do.
/obj/item/candle/tribal_torch
	name = "tribal torch"
	desc = "A standing torch, used to provide light in dark environments."
	icon = 'icons/obj/candle.dmi'
	icon_state = "torch_unlit"
	item_state = "torch"
	w_class = WEIGHT_CLASS_BULKY
	light_color = LIGHT_COLOR_FIRE
	infinite = TRUE
	heat = 2000

/obj/item/candle/tribal_torch/attackby(obj/item/W, mob/user, params)
	..()
	var/msg = W.ignition_effect(src, user)
	if(msg)
		light(msg)
		set_light(7)

/obj/item/candle/tribal_torch/fire_act(exposed_temperature, exposed_volume)
	if(!src.lit)
		light() //honk
		set_light(7)
	..()

/obj/item/candle/attack_self(mob/user)
	if(!src.lit)
		to_chat(user, "<span class='notice'>You start pushing [src] into the ground...</span>")
		if (do_after(user, 20, target=src))
			qdel(src)
			new /obj/structure/destructible/tribal_torch(get_turf(user))
			light_color = LIGHT_COLOR_ORANGE
			user.visible_message("<span class='notice'>[user] plants \the [src] firmly in the ground.</span>", "<span class='notice'>You plant \the [src] firmly in the ground.</span>")
			return
	else if(lit)
		user.visible_message(
			"<span class='notice'>[user] snuffs [src] out.</span>")
		lit = FALSE
		update_icon()
		set_light(0)


/obj/item/candle/tribal_torch/update_icon()
	icon_state = "torch[lit ? "_lit" : "_unlit"]"
	item_state = "torch[lit ? "-on" : ""]"


#undef CANDLE_LUMINOSITY
