//Chain link fences
//Sprites ported from /VG/


#define CUT_TIME 100
#define CLIMB_TIME 150

#define NO_HOLE 0 //section is intact
#define MEDIUM_HOLE 1 //medium hole in the section - can climb through
#define LARGE_HOLE 2 //large hole in the section - can walk through
#define MAX_HOLE_SIZE LARGE_HOLE

/obj/structure/fence
	name = "fence"
	desc = "A chain link fence. Not as effective as a wall, but generally it keeps people out."
	density = TRUE
	anchored = TRUE

	icon = 'icons/obj/fence.dmi'
	icon_state = "straight"
	barricade = TRUE
	proj_pass_rate = 40

	var/cuttable = TRUE
	var/hole_size= NO_HOLE
	var/invulnerable = FALSE

/obj/structure/fence/Initialize()
	. = ..()
	update_cut_status()

/obj/structure/fence/examine(mob/user)
	. = ..()
	switch(hole_size)
		if(MEDIUM_HOLE)
			user.show_message("There is a large hole in \the [src].")
		if(LARGE_HOLE)
			user.show_message("\The [src] has been completely cut through.")

/obj/structure/fence/end
	icon_state = "end"
	cuttable = FALSE

/obj/structure/fence/handrail_end
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon_state = "y_handrail_end"
	cuttable = FALSE

/obj/structure/fence/handrail_corner
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon_state = "y_handrail_corner"
	cuttable = FALSE
	climbable = TRUE

/obj/structure/fence/handrail
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon_state = "y_handrail"
	cuttable= FALSE
	climbable = TRUE

/obj/structure/fence/handrail_end/non_dense
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon_state = "y_handrail_end"
	cuttable = FALSE
	density = FALSE
	layer = ABOVE_MOB_LAYER

/obj/structure/fence/corner
	icon_state = "corner"
	cuttable = FALSE

/obj/structure/fence/post
	icon_state = "post"
	cuttable = FALSE

/obj/structure/fence/pole_t
	name = "pole"
	icon_state = "pole_t"
	desc = "A stout pole."
	cuttable = FALSE
	density = FALSE
	layer = ABOVE_MOB_LAYER

/obj/structure/fence/pole_b
	name = "pole"
	icon_state = "pole_b"
	desc = "A pole, commonly used in traditional fertility rituals. Or by degenerates."
	cuttable = FALSE
	density = FALSE

/obj/structure/fence/cut/medium
	icon_state = "straight_cut2"
	hole_size = MEDIUM_HOLE

/obj/structure/fence/cut/large
	icon_state = "straight_cut3"
	hole_size = LARGE_HOLE

/obj/structure/fence/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/wirecutters))
		if(!cuttable)
			to_chat(user, "<span class='notice'>This section of the fence can't be cut.</span>")
			return
		if(invulnerable)
			to_chat(user, "<span class='notice'>This fence is too strong to cut through.</span>")
			return
		var/current_stage = hole_size
		if(current_stage >= MAX_HOLE_SIZE)
			to_chat(user, "<span class='notice'>This fence has too much cut out of it already.</span>")
			return

		user.visible_message("<span class='danger'>\The [user] starts cutting through \the [src] with \the [W].</span>",\
		"<span class='danger'>You start cutting through \the [src] with \the [W].</span>")

		if(do_after(user, CUT_TIME*W.toolspeed, target = src))
			if(current_stage == hole_size)
				switch(++hole_size)
					if(MEDIUM_HOLE)
						visible_message("<span class='notice'>\The [user] cuts a decent-sized hole into \the [src].</span>")
						to_chat(user, "<span class='info'>You could probably fit yourself through that hole now. Although climbing through would be much faster if you made it even bigger.</span>")
						climbable = TRUE
					if(LARGE_HOLE)
						visible_message("<span class='notice'>\The [user] completely cuts through \the [src].</span>")
						to_chat(user, "<span class='info'>The hole in \the [src] is now big enough to walk through.</span>")
						climbable = FALSE

				update_cut_status()
	else if(istype(W, /obj/item/stack/sheet/mineral/wood))
		var/obj/item/stack/sheet/mineral/wood/Z = W
		if(locate(/obj/structure/barricade/wooden/planks) in get_turf(src))
			to_chat(user, "<span class='warning'>This fence is already barricaded!</span>")
			return
		if(Z.get_amount() < 3)
			to_chat(user, "<span class='warning'>You need atleast 3 wooden planks to reinforce this fence!</span>")
			return
		else
			to_chat(user, "<span class='notice'>You start adding [Z] to [src]...</span>")
			if(do_after(user, 50, target=src))
				if(locate(/obj/structure/barricade/wooden/planks) in get_turf(src))
					to_chat(user, "<span class='warning'>This fence is already barricaded!</span>")
					return
				if(Z.get_amount() < 3)
					to_chat(user, "<span class='warning'>You need atleast 3 wooden planks to reinforce this fence!</span>")
					return
				Z.use(3)
				new /obj/structure/barricade/wooden/planks(get_turf(src))
				user.visible_message("<span class='notice'>[user] reinforces the fence with some planks.</span>", "<span class='notice'>You reinforce the fence with some planks.</span>")
				return
	return TRUE

/obj/structure/fence/proc/update_cut_status()
	if(!cuttable)
		return
	density = TRUE
	switch(hole_size)
		if(NO_HOLE)
			icon_state = initial(icon_state)
		if(MEDIUM_HOLE)
			icon_state = "straight_cut2"
		if(LARGE_HOLE)
			icon_state = "straight_cut3"
			density = FALSE

//FENCE DOORS

/obj/structure/fence/door
	name = "fence door"
	desc = "Not very useful without a real lock."
	icon_state = "door_closed"
	cuttable = FALSE
	var/open = FALSE
	var/obj/item/lock_construct/Lock = null

/obj/structure/fence/door/Initialize()
	. = ..()

	update_door_status()

/obj/structure/fence/door/Destroy()
	if(Lock)
		qdel(Lock)
	return ..()

/obj/structure/fence/door/opened
	icon_state = "door_opened"
	open = TRUE
	density = TRUE

/obj/structure/fence/door/attack_hand(mob/user)
	if(check_locked(user))
		return
	else if(can_open(user))
		toggle(user)
	return TRUE

/obj/structure/fence/door/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/lock_construct)) /* attempt to add a lock */
		return add_lock(I, user) /* call add_lock proc, so we can disable for airlocks */
	else if(istype(I, /obj/item/key))
		return check_key(I, user)
	else
		return ..()

/obj/structure/fence/door/crowbar_act(mob/living/user, obj/item/I)
	if(Lock) /* attempt to pry the lock off */
		if(Lock.pry_off(user,src))
			qdel(Lock)
			Lock = null
			src.desc = "[initial(desc)]"
	return

/obj/structure/fence/door/proc/check_key(obj/item/key/K, mob/user)
	if(!Lock)
		to_chat(user, "[src] has no lock attached")
		return
	else
		return Lock.check_key(K,user)

/obj/structure/fence/door/proc/check_locked(mob/user)
	if(Lock)
		if(Lock.check_locked())
			to_chat(user, "[src] is bolted [density ? "shut" : "open"]")
			return TRUE
	return FALSE

/obj/structure/fence/door/proc/add_lock(obj/item/lock_construct/L, mob/user)
	if(Lock)
		to_chat(user, "[src] already has \a [Lock] attached")
		return
	else
		if(user.transferItemToLoc(L, src))
			user.visible_message("<span class='notice'>[user] adds [L] to \the [src].</span>", \
								 "<span class='notice'>You add [L] to \the [src].</span>")
			desc = "[src.desc] Has a lock engraved with a [L.lock_data]."
			Lock = L

/obj/structure/fence/door/proc/toggle(mob/user)
	switch(open)
		if(FALSE)
			visible_message("<span class='notice'>\The [user] opens \the [src].</span>")
			open = TRUE
		if(TRUE)
			visible_message("<span class='notice'>\The [user] closes \the [src].</span>")
			open = FALSE

	update_door_status()
	playsound(src, 'sound/machines/click.ogg', 100, 1)

/obj/structure/fence/door/proc/update_door_status()
	switch(open)
		if(FALSE)
			density = TRUE
			icon_state = "door_closed"
		if(TRUE)
			density = FALSE
			icon_state = "door_opened"
			
/obj/structure/fence/door/proc/can_open(mob/user)
	return TRUE

/obj/structure/simple_door/metal/fence
	name = "fence gate"
	desc = "A gate for a fence."
	icon_state = "fence"
	door_type = "fence"
	open_sound = "sound/f13machines/doorchainlink_open.ogg"
	close_sound = "sound/f13machines/doorchainlink_close.ogg"
	opaque = 0
	can_hold_padlock = TRUE
	icon = 'icons/obj/fence.dmi'


#undef CUT_TIME
#undef CLIMB_TIME

#undef NO_HOLE
#undef MEDIUM_HOLE
#undef LARGE_HOLE
#undef MAX_HOLE_SIZE
