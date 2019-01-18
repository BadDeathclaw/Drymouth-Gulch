/turf/closed/wall/r_wall/f13vault
	name = "vault wall"
	desc = "A huge chunk of metal used to separate rooms."
	icon = 'icons/turf/walls/f13vault_reinforced_wall.dmi'
	hardness = 60

/turf/closed/wall/r_wall/f13vaultrusted
	name = "rusty vault wall"
	desc = "A rusty chunk of metal used to separate rooms."
	icon = 'icons/turf/walls/f13vault_rusted_wall.dmi'
	hardness = 40

/turf/closed/wall/r_wall/f13composite
	name = "composite wall"
	desc = "A huge chunk of metal used to separate rooms."
	icon = 'icons/turf/walls/f13composite.dmi'
	hardness = 50

/turf/closed/wall/r_wall/f13superstore
	name = "store wall"
	desc = "A huge chunk of metal used to separate rooms."
	icon = 'icons/turf/walls/f13superstore.dmi'
	hardness = 50

/turf/closed/wall/mineral/wood/nonmetal/f13wood
	name = "wood wall"
	desc = "A rotting hunk of wood."
	icon = 'icons/turf/walls/f13wood_wall.dmi'
	hardness = 25

/turf/closed/wall/mineral/wood/nonmetal/f13wood/deconstruction_hints(mob/user)
	to_chat(user, "<span class='notice'>The wooden planks are <b>nailed</b> firmly in place.</span>")

/turf/closed/wall/mineral/wood/nonmetal/f13wood/dismantle_wall(devastated=0, explode=0)
	if(devastated)
		devastate_wall()
	else
		playsound(src, 'sound/items/crowbar.ogg', 100, 1)
		var/newgirder = break_wall()
		if(newgirder) //maybe we don't /want/ a girder!
			transfer_fingerprints_to(newgirder)

	for(var/obj/O in src.contents) //Eject contents!
		if(istype(O, /obj/structure/sign/poster))
			var/obj/structure/sign/poster/P = O
			P.roll_and_drop(src)

	ScrapeAway()


/turf/closed/wall/mineral/wood/nonmetal/f13wood/attackby(obj/item/W, mob/user)
	if(!istype(W, /obj/item/crowbar))
		return
	if(do_after(user, 50, target=src)) //Into deciseconds. <- Five seconds
		dismantle_wall(FALSE,FALSE)
		return
	return ..()