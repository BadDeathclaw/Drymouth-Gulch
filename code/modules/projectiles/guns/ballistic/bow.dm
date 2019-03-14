/obj/item/gun/ballistic/bow
	name = "bow"
	desc = "A sturdy bow made out of wood and reinforced with iron."
	icon_state = "bow_unloaded"
	item_state = "bow"
	var/icon_state_loaded = "bow_loaded"
	var/icon_state_firing = "bow_firing"
	var/item_state_loaded = "bow"
	var/item_state_firing = "bow"
	fire_sound = "bowshot" //
	mag_type = /obj/item/ammo_box/magazine/internal/bow
	//var/flags = HANDSLOW //
	weapon_weight = WEAPON_HEAVY  //
	var/draw_sound = 'sound/weapons/draw_bow.ogg'
	var/ready_to_fire = 0
	var/slowdown_when_ready = 2
	casing_ejector = FALSE  //

/obj/item/gun/ballistic/bow/update_icon()  ///SPECIAL THANKS TO OCULUS TO HELP ME WITH THIS.
	if(ready_to_fire)
		icon_state = icon_state_firing
		item_state = item_state_firing
		slowdown = slowdown_when_ready
	else if(magazine.ammo_count() && !ready_to_fire)
		icon_state = icon_state_loaded
		item_state = item_state_loaded
		slowdown = initial(slowdown)
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)
		slowdown = initial(slowdown)

/obj/item/gun/ballistic/bow/dropped(mob/user)
	if(magazine && magazine.ammo_count())
		magazine.empty_magazine()
		ready_to_fire = FALSE
		update_icon()

/obj/item/gun/ballistic/bow/attack_self(mob/living/user)
	if(!ready_to_fire && magazine.ammo_count())
		ready_to_fire = TRUE
		playsound(user, draw_sound, 100, 1)
		update_icon()
	else
		ready_to_fire = FALSE
		update_icon()

/obj/item/gun/ballistic/bow/attackby(obj/item/A, mob/user, params)
	var/num_loaded = magazine.attackby(A, user, params, 1)
	if(num_loaded)
		to_chat(user, "<span class='notice'>You ready \the [A] into \the [src].</span>")
		update_icon()
		chamber_round()

/obj/item/gun/ballistic/bow/can_shoot()
	. = ..()
	if(!ready_to_fire)
		return FALSE

/obj/item/gun/ballistic/bow/shoot_with_empty_chamber(mob/living/user as mob|obj)
	return

/obj/item/gun/ballistic/bow/process_chamber(empty_chamber = 1)
	. = ..()
	ready_to_fire = FALSE
	update_icon()

// ammo
/obj/item/ammo_box/magazine/internal/bow
	name = "bow internal magazine"
	ammo_type = /obj/item/ammo_casing/caseless/arrow
	caliber = "arrow"
	max_ammo = 1


/obj/item/projectile/bullet/reusable/arrow
	name = "arrow"
	icon_state = "arrow"
	ammo_type = /obj/item/ammo_casing/caseless/arrow
	range = 10
	damage = 35
	armour_penetration = 30
	damage_type = BRUTE

/obj/item/ammo_casing/caseless/arrow
	name = "arrow"
	desc = "Stab, stab, stab."
	icon_state = "arrow-live"
	force = 10
	sharpness = IS_SHARP
	projectile_type = /obj/item/projectile/bullet/reusable/arrow
	caliber = "arrow"


/obj/item/ammo_casing/caseless/bolt
	name = "arrow"
	desc = "It just looks like a piece of rebar..."
	icon_state = "arrow-live"
	force = 15
	sharpness = IS_SHARP
	projectile_type = /obj/item/projectile/bullet/reusable/arrow
	caliber = "arrow"
