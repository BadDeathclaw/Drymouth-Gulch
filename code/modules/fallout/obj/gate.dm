/obj/machinery/door/poddoor/gate
	name = "city gate"
	desc = "A heavy duty gates that opens mechanically."
	icon = 'icons/fallout/objects/structures/city_gate.dmi'
	icon_state = "closed"
	id = 333
	bound_width = 96
	var/list/opacity_objects = list() //FUCK BYOND

/obj/machinery/door/poddoor/gate/New()
	..()
	var/go/S = new (locate(x+1,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S
	S = new (locate(x+2,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S

/obj/machinery/door/poddoor/gate/Destroy()
	for(var/go/S in opacity_objects)
		qdel(S)
	..()

/obj/machinery/door/poddoor/gate/open()
	for(var/go/S in opacity_objects)
		S.set_opacity(0)
	..()

/obj/machinery/door/poddoor/gate/close()
	..()
	for(var/go/S in opacity_objects)
		S.set_opacity(1)