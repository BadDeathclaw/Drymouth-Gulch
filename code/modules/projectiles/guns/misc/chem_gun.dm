//his isn't a subtype of the syringe gun because the syringegun subtype is made to hold syringes
//this is meant to hold reagents/obj/item/gun/syringe
/obj/item/gun/chem
	name = "reagent gun"
	desc = "A Nanotrasen syringe gun, modified to automatically synthesise chemical darts, and instead hold reagents."
	icon_state = "chemgun"
	item_state = "chemgun"
	w_class = WEIGHT_CLASS_NORMAL
	throw_speed = 3
	throw_range = 7
	force = 4
	materials = list(MAT_METAL=2000)
	clumsy_check = FALSE
	fire_sound = 'sound/items/syringeproj.ogg'
	container_type = OPENCONTAINER
	var/time_per_syringe = 250
	var/syringes_left = 4
	var/max_syringes = 4
	var/last_synth = 0

/obj/item/gun/chem/Initialize()
	. = ..()
	chambered = new /obj/item/ammo_casing/chemgun(src)
	START_PROCESSING(SSobj, src)
	create_reagents(100)

/obj/item/gun/chem/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/item/gun/chem/can_shoot()
	return syringes_left

/obj/item/gun/chem/process_chamber()
	if(chambered && !chambered.BB && syringes_left)
		chambered.newshot()

/obj/item/gun/chem/process()
	if(syringes_left >= max_syringes)
		return
	if(world.time < last_synth+time_per_syringe)
		return
	to_chat(loc, "<span class='warning'>You hear a click as [src] synthesizes a new dart.</span>")
	syringes_left++
	if(chambered && !chambered.BB)
		chambered.newshot()
	last_synth = world.time

/obj/item/gun/chem/advanced
	name = "advanced syringe gun"
	desc = "A special syringe gun that can synthesize syringes and reagents to go into the syringe. Fires fifteen unit syringes and will copy any reagents inserted into the internal fifteen unit storage."
	time_per_syringe = 30
	syringes_left = 6
	var/syringetype = "regular"
	var/syringecapacity = 15

//The parent of this already handles processing on init and destroy
/obj/item/gun/chem/advanced/Initialize()
	. = ..()
	chambered = new /obj/item/ammo_casing/chemgun/advanced(src)
	create_reagents(60)

/obj/item/gun/chem/advanced/attack_self(mob/user)
	switch(syringetype)
		if("regular")
			time_per_syringe = 50
			syringecapacity = 20
			syringetype = "cyro"
		if("cyro")
			time_per_syringe = 75
			syringecapacity = 10
			syringetype = "piercing"
		if("piercing")
			syringecapacity = 60
			syringetype = "bluespace"
			time_per_syringe = 150
		if("bluespace")
			syringecapacity = 15
			syringetype = "regular"
			time_per_syringe = 30
	to_chat(user, "You switch the syringe to synthesize to [syringetype] syringes, it will now copy up to [syringecapacity] units of reagents.")

/obj/item/ammo_casing/chemgun/advanced
	projectile_type = /obj/item/projectile/bullet/dart/advanced
	firing_effect_type = null

/obj/item/ammo_casing/chemgun/advanced/ready_proj(atom/target, mob/living/user, quiet, zone_override = "")
	if(!BB || !istype(BB, /obj/item/projectile/bullet/dart/advanced))
		return
	var/obj/item/projectile/bullet/dart/advanced/BB1 = BB
	if(istype(loc, /obj/item/gun/chem/advanced))
		var/obj/item/gun/chem/advanced/CG = loc
		switch(CG.syringetype)
			if("regular")
				BB1.sy = new /obj/item/reagent_containers/syringe(src)
			if("cyro")
				BB1.sy = new /obj/item/reagent_containers/syringe/noreact(src)
			if("piercing")
				BB1.sy = new /obj/item/reagent_containers/syringe/piercing(src)
			if("bluespace")
				BB1.sy = new /obj/item/reagent_containers/syringe/bluespace(src)
		if(BB1.sy)
			CG.reagents.copy_to(BB1.sy, CG.syringecapacity)
		if(CG.syringes_left <= 0)
			return
		if(CG.syringetype == "piercing")
			BB1.piercing = TRUE
		BB1.reagents.set_reacting(TRUE)
		if(CG.syringetype == "cyro")
			BB1.reagents.set_reacting(FALSE)
		BB1.create_reagents(CG.syringecapacity)
		CG.reagents.copy_to(BB1, CG.syringecapacity)
		BB1.name = "chemical dart"
		CG.syringes_left--
	..()

/obj/item/projectile/bullet/dart/advanced
	var/obj/item/reagent_containers/syringe/sy
	damage = 0

/obj/item/projectile/bullet/dart/advanced/on_hit(atom/target, blocked = FALSE)
	if(blocked == 100 || iscarbon(target) || target.density)
		return ..()
	sy.forceMove(get_turf(src))
	return
