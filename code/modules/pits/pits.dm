//functions for digging pits in the ground and storing stuff in it
#define NUMCONTENT 5
#define NUMBURYTIMES 3

/obj/dugpit
	name = "pit"
	anchored = 1
	icon = 'icons/misc/Pit.dmi'
	icon_state = "pit"
	mouse_opacity = 0
	layer = HIGH_TURF_LAYER
	var/turf/open/indestructible/ground/outside/desert/parent

obj/dugpit/New(lnk)
	..()
	parent = lnk

/obj/dugpit/container_resist(mob/living/user)
	//try to unbury self
	to_chat(user, "<span class='danger'>You start digging from inside, trying to unbury self!</span>")
	if(do_after(user, (50), target = src))
		if (prob(25))
			to_chat(user, "<span class='danger'>You have managed to move some of the ground!</span>")
			parent.unburylevel++
			if (parent.unburylevel>=NUMBURYTIMES)
				to_chat(user, "<span class='danger'>You have undug yourself!</span>")
				parent.gets_dug(null)
		else
			to_chat(user, "<span class='danger'>The ground is too heavy!</span>")

/obj/dugpit/return_air()
	var/datum/gas_mixture/GM = new
	GM.temperature = parent.temperature
	return GM


/turf/open/indestructible/ground/outside/desert/proc/handle_item_insertion(obj/item/W, mob/usr)
	if(!istype(W))
		return


	if(usr)

		add_fingerprint(usr)

		if(!istype(W, /obj/item/gun/energy/kinetic_accelerator) && !istype(W, /obj/item/stack/ore/glass ) )
			if (storedindex>=NUMCONTENT)
				to_chat(usr, "<span class='notice'>The pit is filled with items to the limit!</span>")
				return

			for(var/mob/M in viewers(usr, null))
				if(M == usr)
					usr.show_message("<span class='notice'>You put [W] in the hole.</span>", 1)
				else if(in_range(M, usr)) //If someone is standing close enough, they can tell what it is...
					M.show_message("<span class='notice'>[usr] puts [W] in the hole.</span>", 1)
				else if(W && W.w_class >= 3) //Otherwise they can only see large or normal items from a distance...
					M.show_message("<span class='notice'>[usr] puts [W] in the hole.</span>", 1)

			pitcontents += W
			usr.transferItemToLoc(W, mypit)
			storedindex = storedindex+1

		if(istype(W, /obj/item/stack/ore/glass) && pit_sand < 1 )
			var/obj/item/stack/ore/glass/sand_target = W
			usr.show_message("<span class='notice'>You fill the hole with sand</span>", 1)
			if (pit_sand == 0)
				if (sand_target.amount >= 1)
					sand_target.amount = sand_target.amount - 1
					pit_sand = pit_sand + 1
			if (sand_target.amount == 0)
				qdel(W)


/turf/open/indestructible/ground/outside/desert/attack_hand(mob/living/carbon/human/M)
	if (dug)
		if (storedindex==0)
			M.show_message("<span class='notice'>There is nothing in the pit!</span>", 1)
			return
		else
			var/obj/item/I = pitcontents[storedindex]
			storedindex = storedindex - 1
			I.loc = M.loc
			pitcontents-=I

/turf/open/indestructible/ground/outside/desert/proc/finishBury(mob/user)
	user.show_message("<span class='notice'>You cover the hole with dirt.</span>", 1)
	dug = 0
	if((storedindex >= 4) || ((gravebody || gravecoffin) != null))
		mypit.icon_state = "mound"
		update_icon()
	else if (2 < storedindex < 4)
		mypit.icon_state = "mound_medium"
		update_icon()
	else if (storedindex <= 2)
		mypit.icon_state = "mound_small"
		update_icon()

/turf/open/indestructible/ground/outside/desert/proc/finishBody()
	gravebody.loc = mypit
	unburylevel = 0

/turf/open/indestructible/ground/outside/desert/proc/finishCoffin()
	gravecoffin.loc = mypit

/turf/open/indestructible/ground/outside/desert/attackby(obj/item/W, mob/user, params)

	if(!W || !user)
		return 0

	var/digging_speed = 0

	if (istype(W, /obj/item/shovel))
		var/obj/item/shovel/S = W
		digging_speed = S.toolspeed

	else if (istype(W, /obj/item/pickaxe))
		var/obj/item/pickaxe/P = W
		digging_speed = P.toolspeed

	if (digging_speed)
		if (pit_sand < 1)
			usr.show_message("<span class='notice'>You need to fill the hole with sand!</span>", 1)
			return
		var/turf/T = user.loc
		if (!istype(T, /turf))
			return
		if (dug)
			for (var/mob/living/mobongrave in mypit.loc)
				//bury the first one
				gravebody = mobongrave
				break
			for (var/obj/structure/closet/crate/coffin/curcoffin in mypit.loc)
				if (!curcoffin.opened)
					gravecoffin = curcoffin
					break
			playsound(src, 'sound/effects/shovel_dig.ogg', 50, 1)
			if(!(gravebody in loc)) // prevents burying yourself while not on the tile
				gravebody = null
			if(!gravecoffin in loc) // just sanity checking
				gravecoffin = null
			if (gravebody!=null)
				user.show_message("<span class='notice'>You start covering the body in the hole with dirt...</span>", 1)
				if (do_after(user, (50 * digging_speed), target=gravebody))
					if(istype(src, /turf/open/indestructible/ground/outside/desert))
						finishBury(user)
						finishBody()
				for(var/mob/H in oview(src, 7))
					for(var/F in gravebody.faction)
						if(F in H.faction)
							if(F != "neutral") // I don't know why but this won't fit in the above if statement
								SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "buried_faction_member", /datum/mood_event/buried_faction_member)
								LAZYREMOVE(H.faction_deaths, gravebody.real_name)
								if(LAZYLEN(H.faction_deaths) < 3)
									SEND_SIGNAL(H, COMSIG_CLEAR_MOOD_EVENT, "saw_many_unburied_faction")
			else if (gravecoffin != null)
				user.show_message("<span class='notice'>You start burying the coffin...</span>", 1)
				if (do_after(user, (50 * digging_speed), target=gravebody))
					if(istype(src, /turf/open/indestructible/ground/outside/desert))
						finishBury(user)
						finishCoffin()
			else
				user.show_message("<span class='notice'>You start covering the hole with dirt...</span>", 1)
				if(do_after(user, (50 * digging_speed), target = src))
					if(istype(src, /turf/open/indestructible/ground/outside/desert))
						finishBury(user)


		else
			user.show_message("<span class='notice'>You start digging...</span>", 1)
			playsound(src, 'sound/effects/shovel_dig.ogg', 50, 1) //FUCK YO RUSTLE I GOT'S THE DIGS SOUND HERE
			if(do_after(user, (50 * digging_speed), target = src))
				if(istype(src, /turf/open/indestructible/ground/outside/desert))
					if(pit_sand < 1)
						user.show_message("<span class='notice'>The ground has been already dug up!</span>", 1)
						return
					user.show_message("<span class='notice'>You dig a hole.</span>", 1)
					gets_dug(user)
					new /obj/item/stack/ore/glass(src)
					new /obj/item/stack/ore/glass(src)
					new /obj/item/stack/ore/glass(src)
					new /obj/item/stack/ore/glass(src)
					new /obj/item/stack/ore/glass(src)
					new /obj/item/stack/ore/glass(src)
					src.pit_sand = 0
	else
		//not digging
		if (dug)
			//add items
			handle_item_insertion(W, user)

		else
			if(..())
				return TRUE
			if(can_lay_cable() && istype(W, /obj/item/stack/cable_coil))
				var/obj/item/stack/cable_coil/coil = W
				for(var/obj/structure/cable/LC in src)
					if(!LC.d1 || !LC.d2)
						LC.attackby(W,user)
						return
				coil.place_turf(src, user)
				return TRUE

			else if(istype(W, /obj/item/twohanded/rcl))
				handleRCL(W, user)

			return FALSE


/turf/open/indestructible/ground/outside/desert/proc/gets_dug(mob/user)
	if(dug)
		return
	for (var/obj/item/I in pitcontents)
		I.loc = user.loc
	if (mypit==null)
		mypit = new/obj/dugpit(src)
	mypit.icon_state = "pit"
	mypit.update_icon()
	mypit.invisibility = 0
	storedindex = 0
	pitcontents = list()
	dug = 1
	slowdown = 0
	if (gravebody!=null)
		if (user!=null)
			to_chat(user, "<span class='danger'>You have found a body in the pit!</span>")
		gravebody.loc = mypit.loc
	if (gravecoffin!=null)
		if (user!=null)
			to_chat(user, "<span class='notice'>You have uncovered a coffin from the grave.</span>")
		gravecoffin.loc = mypit.loc
	gravebody = null
	gravecoffin = null
	return
