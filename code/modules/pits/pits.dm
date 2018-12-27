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
	var/turf/open/floor/plating/f13/outside/desert/parent

obj/dugpit/New(lnk)
	..()
	parent = lnk

/obj/dugpit/proc/dugresist(usr)
	//try to unbury self
	var/mob/living/user = usr
	user << "<span class='danger'>You start digging from inside, trying to unbury self!</span>"
	if(do_after(user, (5*10), target = src))
		if (prob(10))
			user << "<span class='danger'>You have managed to move some of the ground!</span>"
			parent.unburylevel++
			if (parent.unburylevel>=NUMBURYTIMES)
				user << "<span class='danger'>You have undug yourself!</span>"
				parent.gets_dug(null)
		else
			user << "<span class='danger'>The ground is too heavy!</span>"

obj/dugpit/return_air()
	var/datum/gas_mixture/GM = new
	GM.temperature = parent.temperature
	return GM


/turf/open/floor/plating/f13/outside/desert/proc/handle_item_insertion(obj/item/W, mob/usr)
	if(!istype(W))
		return

	if (storedindex>=NUMCONTENT)
		usr.show_message("<span class='notice'>The pit is filled with items to the limit!</span>", 1)
		return

	//if(usr)
		//if(!usr.can_equip(W))
			//return
	if(usr)
		//if(usr.client && usr.s_active != src)
			//usr.client.screen -= W

		add_fingerprint(usr)

		if(!istype(W, /obj/item/gun/energy/kinetic_accelerator))
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


/turf/open/floor/plating/f13/outside/desert/attack_hand(mob/living/carbon/human/M)
	if (dug)
		if (storedindex==0)
			M.show_message("<span class='notice'>There is nothing in the pit!</span>", 1)
			return
		else
			var/obj/item/I = pitcontents[storedindex]
			storedindex = storedindex - 1
			I.loc = M.loc
			pitcontents-=I

/turf/open/floor/plating/f13/outside/desert/proc/finishBury(mob/user)
	user.show_message("<span class='notice'>You cover the hole with dirt.</span>", 1)
	dug = 0
	//icon_plating = "[environment_type]"
	//icon_state = "[environment_type]"
	mypit.invisibility = 101

/turf/open/floor/plating/f13/outside/desert/proc/finishBody()
	gravebody.loc = mypit
	unburylevel = 0

/turf/open/floor/plating/f13/outside/desert/proc/finishCoffin()
	gravecoffin.loc = mypit

/turf/open/floor/plating/f13/outside/desert/attackby(obj/item/W, mob/user, params)

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
		var/turf/T = user.loc
		if (!( istype(T, /turf) ))
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
			if (gravebody!=null)
				user.show_message("<span class='notice'>You start covering the body in the hole with dirt...</span>", 1)
				if (do_after(user, (50 * digging_speed), target=gravebody))
					if(istype(src, /turf/open/floor/plating/f13/outside/desert))
						finishBury(user)
						finishBody()
			else if (gravecoffin != null)
				user.show_message("<span class='notice'>You start burying the coffin...</span>", 1)
				if (do_after(user, (50 * digging_speed), target=gravebody))
					if(istype(src, /turf/open/floor/plating/f13/outside/desert))
						finishBury(user)
						finishCoffin()
			else
				user.show_message("<span class='notice'>You start covering the hole with dirt...</span>", 1)
				if(do_after(user, (50 * digging_speed), target = src))
					if(istype(src, /turf/open/floor/plating/f13/outside/desert))
						finishBury(user)


		else
			user.show_message("<span class='notice'>You start digging...</span>", 1)
			playsound(src, 'sound/effects/shovel_dig.ogg', 50, 1) //FUCK YO RUSTLE I GOT'S THE DIGS SOUND HERE
			if(do_after(user, (50 * digging_speed), target = src))
				if(istype(src, /turf/open/floor/plating/f13/outside/desert))
					user.show_message("<span class='notice'>You dig a hole.</span>", 1)
					gets_dug(user)
					if (src.has_been_dug == FALSE)
						new /obj/item/stack/ore/glass(src)
						new /obj/item/stack/ore/glass(src)
						src.has_been_dug = TRUE
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

/turf/open/floor/plating/f13/outside/desert/proc/gets_dug(mob/user)
	if(dug)
		return
	for (var/obj/item/I in pitcontents)
		I.loc = user.loc
	if (mypit==null)
		mypit = new/obj/dugpit(src)
	mypit.invisibility = 0
	storedindex = 0
	pitcontents = list()
	dug = 1
	slowdown = 0
	if (gravebody!=null)
		if (user!=null)
			user << "<span class='danger'>You have found a body in the pit!</span>"
		gravebody.loc = mypit.loc
	if (gravecoffin!=null)
		if (user!=null)
			user << "<span class='notice'>You have uncovered a coffin from the grave.</span>"
		gravecoffin.loc = mypit.loc
	gravebody = null
	gravecoffin = null
	return