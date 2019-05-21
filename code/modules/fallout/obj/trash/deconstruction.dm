obj/item
	var/list/components

	attackby(obj/item/W, mob/user, params)
		if(istype(components) && istype(W, /obj/item/weapon/screwdriver))
			if(alert(user, "You want to disassemble [src]?",,"Yes","No") == "Yes")
				if(do_after(user, 40*W.toolspeed, 1, target = src))
					for(var/comp in components)
						for(var/i=0, i<components[comp], i++)
							new comp(get_turf(src))
					qdel(src)
					return 1
		. = ..()
	examine(mob/user)
		..()
		if(istype(components))
			to_chat(user, "<span class='notice'>It seems it can be dissassembled.</span>")