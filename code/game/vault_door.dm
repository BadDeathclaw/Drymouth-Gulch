/obj/structure/vaultdoor
	name = "vault door 113"
	icon = 'icons/obj/doors/gear.dmi'
	icon_state = "closed"
	density = 1
	opacity = 1
	layer = 4.2
	anchored = 1
	var/is_busy = 0
	var/destroyed = 0
	var/isworn=0

/obj/structure/vaultdoor/blob_act()
	if(prob(1))
		qdel(src)
	return


/obj/structure/vaultdoor/ex_act(severity, target)
	if(severity == 1)
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(2, 1, src)
		s.start()
		destroy()
		return

/obj/structure/vaultdoor/proc/destroy()
	icon_state = "empty"
	set_opacity(0)
	src.density = 0
	destroyed = 1

/obj/structure/vaultdoor/proc/open()
	is_busy = 1
	flick("opening", src)
	icon_state = "open"
	playsound(loc, 'sound/f13machines/doorgear_open.ogg', 50, 0, 10)
	sleep(30)
	set_opacity(0)
	src.density = 0
	is_busy = 0

/obj/structure/vaultdoor/proc/close()
	is_busy = 1
	flick("closing", src)
	icon_state = "closed"
	playsound(loc, 'sound/f13machines/doorgear_close.ogg', 50, 0, 10)
	sleep(30)
	set_opacity(1)
	src.density = 1
	is_busy = 0

/obj/structure/vaultdoor/proc/vaultactivate()
	if(destroyed)
		usr << "<span class='warning'>[src] is broken</span>"
		return
	if(is_busy)
		usr << "<span class='warning'>[src] is busy</span>"
		return
	if (density)
		open()
		return
	close()

//Я не хочу переделывать это дерьмо  - Google translate tells me that from Russian to english this is "Do not move your arms around this way." so dont.
/obj/machinery/doorButtons/vaultButton
	name = "vault access"
	icon = 'icons/obj/lever.dmi'
	icon_state = "lever0"
	anchored = 1
	density = 1

/obj/machinery/doorButtons/vaultButton/proc/activate()
	for(var/obj/structure/vaultdoor/vdoor in world)
		vdoor.vaultactivate()

/obj/machinery/doorButtons/vaultButton/attackby(obj/item/weapon/W, mob/user, params)
	activate()

/obj/machinery/doorButtons/vaultButton/attack_hand(mob/user)
	activate()
//new vault door button
/obj/machinery/doorButtons/wornvaultButton
	name = "worn vault access"
	icon = 'icons/obj/lever.dmi'
	icon_state = "lever0"
	anchored = 1
	density = 1

/obj/machinery/doorButtons/wornvaultButton/proc/activate()
	for(var/obj/structure/vaultdoor/vdoor in world)
		if(vdoor.isworn==1)
			vdoor.vaultactivate()

/obj/machinery/doorButtons/wornvaultButton/attackby(obj/item/weapon/W, mob/user, params)
	activate()

/obj/machinery/doorButtons/wornvaultButton/attack_hand(mob/user)
	activate()
