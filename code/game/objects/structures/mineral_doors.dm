//NOT using the existing /obj/machinery/door type, since that has some complications on its own, mainly based on its
//machineryness

/obj/structure/mineral_door
	name = "metal door"
	density = TRUE
	anchored = TRUE
	opacity = TRUE

	icon = 'icons/obj/doors/mineral_doors.dmi'
	icon_state = "metal"

	var/initial_state
	var/state = 0 //closed, 1 == open
	var/isSwitchingStates = 0
	var/close_delay = -1 //-1 if does not auto close.
	max_integrity = 200
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0, "energy" = 100, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 50)
	var/sheetType = /obj/item/stack/sheet/metal
	var/sheetAmount = 7
	var/openSound = 'sound/effects/stonedoor_openclose.ogg'
	var/closeSound = 'sound/effects/stonedoor_openclose.ogg'
	var/obj/item/lock_construct/Lock = null
	CanAtmosPass = ATMOS_PASS_DENSITY

/obj/structure/mineral_door/Initialize()
	. = ..()
	initial_state = icon_state
	air_update_turf(TRUE)

/obj/structure/mineral_door/ComponentInitialize()
	AddComponent(/datum/component/rad_insulation, RAD_MEDIUM_INSULATION)

/obj/structure/mineral_door/Destroy()
	density = FALSE
	air_update_turf(1)
	if(Lock)
		qdel(Lock)
	return ..()

/obj/structure/mineral_door/Move()
	var/turf/T = loc
	. = ..()
	move_update_air(T)

/obj/structure/mineral_door/Bumped(atom/movable/AM)
	..()
	if(!state)
		return TryToSwitchState(AM)

/obj/structure/mineral_door/attack_ai(mob/user) //those aren't machinery, they're just big fucking slabs of a mineral
	if(isAI(user)) //so the AI can't open it
		return
	else if(iscyborg(user)) //but cyborgs can
		if(get_dist(user,src) <= 1) //not remotely though
			return TryToSwitchState(user)

/obj/structure/mineral_door/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/mineral_door/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	return TryToSwitchState(user)

/obj/structure/mineral_door/CanPass(atom/movable/mover, turf/target)
	if(istype(mover, /obj/effect/beam))
		return !opacity
	return !density

/obj/structure/mineral_door/proc/TryToSwitchState(atom/user)
	if(isSwitchingStates)
		return
	if(isliving(user))
		var/mob/living/M = user
		if(world.time - M.last_bumped <= 10)
			return //Return to prevent spam
		M.last_bumped = world.time
		if((/obj/structure/barricade in src.loc))
			to_chat(M, "It won't budge!")
			return
		if(check_locked(user))
			return
		if(M.client)
			if(iscarbon(M))
				var/mob/living/carbon/C = M
				if(!C.handcuffed)
					SwitchState()
			else
				SwitchState()
	else if(ismecha(user))
		if(density)
			var/obj/mecha/mecha = user
			if(mecha.occupant)
				if(world.time - mecha.occupant.last_bumped <= 10)
					return
				mecha.occupant.last_bumped = world.time
			if(mecha.occupant && (src.allowed(mecha.occupant) || src.check_access_list(mecha.operation_req_access)))
				if(check_locked()) /* if a lock is locked, mechs just push through */
					user.visible_message("<span class='notice'>[Lock] breaks off [src] and falls to pieces.</span>")
					qdel(Lock)
					Lock = null
					src.desc = "[initial(desc)]"
		SwitchState()


/obj/structure/mineral_door/proc/SwitchState()
	if(state)
		Close()
	else
		Open()

/obj/structure/mineral_door/proc/Open()
	isSwitchingStates = 1
	playsound(src, openSound, 100, 1)
	set_opacity(FALSE)
	flick("[initial_state]opening",src)
	sleep(10)
	density = FALSE
	state = 1
	air_update_turf(1)
	update_icon()
	isSwitchingStates = 0

	if(close_delay != -1)
		addtimer(CALLBACK(src, .proc/Close), close_delay)

/obj/structure/mineral_door/proc/Close()
	if(isSwitchingStates || state != 1)
		return
	var/turf/T = get_turf(src)
	for(var/mob/living/L in T)
		return
	isSwitchingStates = 1
	playsound(loc, closeSound, 100, 1)
	flick("[initial_state]closing",src)
	sleep(10)
	density = TRUE
	set_opacity(TRUE)
	state = 0
	air_update_turf(1)
	update_icon()
	isSwitchingStates = 0

/obj/structure/mineral_door/update_icon()
	if(state)
		icon_state = "[initial_state]open"
	else
		icon_state = initial_state

/obj/structure/mineral_door/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_MINING)
		to_chat(user, "<span class='notice'>You start digging the [name]...</span>")
		if(I.use_tool(src, user, 40, volume=50))
			to_chat(user, "<span class='notice'>You finish digging.</span>")
			deconstruct(TRUE)
	else if(istype(I, /obj/item/weldingtool) && user.a_intent != INTENT_HARM)
		if(obj_integrity < max_integrity)
			if(!I.tool_start_check(user, amount=0))
				return

			to_chat(user, "<span class='notice'>You begin repairing [src]...</span>")
			if(I.use_tool(src, user, 40, volume=40))
				obj_integrity = CLAMP(obj_integrity + 20, 0, max_integrity)
		else
			to_chat(user, "<span class='notice'>[src] doesn't need to be repaired.</span>")
	else if(istype(I, /obj/item/lock_construct)) /* attempt to add a lock */
		return add_lock(I, user) /* call add_lock proc, so we can disable for airlocks */
	else if(istype(I, /obj/item/key))
		return check_key(I, user)
	else if(user.a_intent != INTENT_HARM)
		return attack_hand(user)
	else
		return ..()


/obj/structure/mineral_door/crowbar_act(mob/living/user, obj/item/I)
	if(Lock) /* attempt to pry the lock off */
		if(Lock.pry_off(user,src))
			qdel(Lock)
			Lock = null
			src.desc = "[initial(desc)]"
	return

/obj/structure/mineral_door/proc/check_key(obj/item/key/K, mob/user)
	if(!Lock)
		to_chat(user, "[src] has no lock attached")
		return
	else
		return Lock.check_key(K,user)

/obj/structure/mineral_door/proc/check_locked(mob/user)
	if(Lock)
		if(Lock.check_locked())
			to_chat(user, "[src] is bolted [density ? "shut" : "open"]")
			return TRUE
	return FALSE

/obj/structure/mineral_door/proc/add_lock(obj/item/lock_construct/L, mob/user)
	if(Lock)
		to_chat(user, "[src] already has \a [Lock] attached")
		return
	else
		if(user.transferItemToLoc(L, src))
			user.visible_message("<span class='notice'>[user] adds [L] to \the [src].</span>", \
								 "<span class='notice'>You add [L] to \the [src].</span>")
			desc = "[src.desc] Has a lock engraved with a [L.lock_data]."
			Lock = L

/obj/structure/mineral_door/deconstruct(disassembled = TRUE)
	var/turf/T = get_turf(src)
	if(disassembled)
		new sheetType(T, sheetAmount)
	else
		new sheetType(T, max(sheetAmount - 2, 1))
	qdel(src)

/obj/structure/mineral_door/iron
	name = "iron door"
	max_integrity = 300

/obj/structure/mineral_door/silver
	name = "silver door"
	icon_state = "silver"
	sheetType = /obj/item/stack/sheet/mineral/silver
	max_integrity = 300

/obj/structure/mineral_door/silver/ComponentInitialize()
	AddComponent(/datum/component/rad_insulation, RAD_HEAVY_INSULATION)

/obj/structure/mineral_door/gold
	name = "gold door"
	icon_state = "gold"
	sheetType = /obj/item/stack/sheet/mineral/gold

/obj/structure/mineral_door/gold/ComponentInitialize()
	AddComponent(/datum/component/rad_insulation, RAD_HEAVY_INSULATION)

/obj/structure/mineral_door/uranium
	name = "uranium door"
	icon_state = "uranium"
	sheetType = /obj/item/stack/sheet/mineral/uranium
	max_integrity = 300
	light_range = 2

/obj/structure/mineral_door/uranium/ComponentInitialize()
	return

/obj/structure/mineral_door/sandstone
	name = "sandstone door"
	icon_state = "sandstone"
	sheetType = /obj/item/stack/sheet/mineral/sandstone
	max_integrity = 100

/obj/structure/mineral_door/transparent
	opacity = FALSE

/obj/structure/mineral_door/transparent/ComponentInitialize()
	AddComponent(/datum/component/rad_insulation, RAD_VERY_LIGHT_INSULATION)

/obj/structure/mineral_door/transparent/Close()
	..()
	set_opacity(FALSE)

/obj/structure/mineral_door/transparent/plasma
	name = "plasma door"
	icon_state = "plasma"
	sheetType = /obj/item/stack/sheet/mineral/plasma

/obj/structure/mineral_door/transparent/plasma/ComponentInitialize()
	return

/obj/structure/mineral_door/transparent/plasma/attackby(obj/item/W, mob/user, params)
	if(W.is_hot())
		var/turf/T = get_turf(src)
		message_admins("Plasma mineral door ignited by [ADMIN_LOOKUPFLW(user)] in [ADMIN_VERBOSEJMP(T)]")
		log_game("Plasma mineral door ignited by [key_name(user)] in [AREACOORD(T)]")
		TemperatureAct()
	else
		return ..()

/obj/structure/mineral_door/transparent/plasma/temperature_expose(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if(exposed_temperature > 300)
		TemperatureAct()

/obj/structure/mineral_door/transparent/plasma/proc/TemperatureAct()
	atmos_spawn_air("plasma=500;TEMP=1000")
	deconstruct(FALSE)

/obj/structure/mineral_door/transparent/diamond
	name = "diamond door"
	icon_state = "diamond"
	sheetType = /obj/item/stack/sheet/mineral/diamond
	max_integrity = 1000

/obj/structure/mineral_door/transparent/diamond/ComponentInitialize()
	AddComponent(/datum/component/rad_insulation, RAD_EXTREME_INSULATION)

/obj/structure/mineral_door/wood
	name = "wood door"
	icon_state = "wood"
	openSound = 'sound/effects/doorcreaky.ogg'
	closeSound = 'sound/effects/doorcreaky.ogg'
	sheetType = /obj/item/stack/sheet/mineral/wood
	resistance_flags = FLAMMABLE
	max_integrity = 200

/obj/structure/mineral_door/wood/ComponentInitialize()
	AddComponent(/datum/component/rad_insulation, RAD_VERY_LIGHT_INSULATION)

/obj/structure/mineral_door/paperframe
	name = "paper frame door"
	icon_state = "paperframe"
	openSound = 'sound/effects/doorcreaky.ogg'
	closeSound = 'sound/effects/doorcreaky.ogg'
	sheetType = /obj/item/stack/sheet/paperframes
	sheetAmount = 3
	resistance_flags = FLAMMABLE
	max_integrity = 20

/obj/structure/mineral_door/paperframe/Initialize()
	. = ..()
	queue_smooth_neighbors(src)

/obj/structure/mineral_door/paperframe/ComponentInitialize()
	return

/obj/structure/mineral_door/paperframe/Destroy()
	queue_smooth_neighbors(src)
	return ..()
