/obj/item/stack/sheet/mineral/wood/afterattack(atom/A, mob/user,proximity)
	if(!proximity) return
	if(istype(A, /obj/structure/barricade/wooden/planks))
		var/obj/structure/barricade/wooden/planks/P = A
		if(P.planks >= P.maxplanks)
			user << "/red You can't reinforce this anymore!"
			return
		else
			user.visible_message("<i>[user] begins to add another board to [P]...</i>")
			if(do_after(user, 20, target = src))
				user.visible_message("<i>[user] reinforced [P] with another board./i>")
				P.planks ++
				P.checkplanks()
				return

	if(istype(A, /obj/structure/window/fulltile))
		var/obj/structure/window/fulltile/F = A
		for(var/atom/S in F.loc)
			if(istype(S, /obj/structure/barricade/wooden/planks))
				return ..()
//			var/obj/structure/barricade/wooden/planks/B = S
//				B.attackby(src,user)
//				return
		user.visible_message("<i>[user] begins to board up [F]...</i>")
		if(do_after(user, 20, target = src))
			user.visible_message("<i>[user] reinforced [F] with a board.</i>")
			src.use(1)
			var/obj/structure/barricade/wooden/planks/K = new /obj/structure/barricade/wooden/planks(F.loc)
			K.planks = 1
			K.checkplanks()
			return
	if(istype(A, /obj/structure/simple_door))
		var/obj/structure/simple_door/F = A
		for(var/atom/S in F.loc)
			if(istype(S, /obj/structure/barricade/wooden/planks))
				return ..()
//			var/obj/structure/barricade/wooden/planks/B = S
//				B.attackby(src,user)
//				return
		user.visible_message("<i>[user] begins to board up [F]...</i>")
		if(do_after(user, 20, target = src))
			user.visible_message("<i>[user] reinforced [F] with a board.</i>")
			src.use(1)
			var/obj/structure/barricade/wooden/planks/K = new /obj/structure/barricade/wooden/planks(F.loc)
			K.planks = 1
			K.checkplanks()
			return
	..()