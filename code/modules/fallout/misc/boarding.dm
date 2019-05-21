//Fallout 13 boarding simulation

/obj/structure/barricade/wooden/planks
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "board"
	obj_integrity = 90
	max_integrity = 90
	layer = 5
	var/planks = 3
	var/maxplanks = 3

/obj/structure/barricade/wooden/planks/New()
	..()
	checkplanks()
	max_integrity = maxplanks*30

/obj/structure/barricade/wooden/planks/examine()
	..()
	usr << "<span class='notice'>There are [planks] boards left.</span>"

/obj/structure/barricade/wooden/planks/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/crowbar))
		visible_message("<span class='danger'>[user] begins to pry off a board...</span>")
		if(do_after(user, 25, target = src))
			visible_message("<span class='danger'>[user] pries off a board!</span>")
			planks --
			checkplanks()
			if(prob(50))
				new /obj/item/stack/sheet/mineral/wood(user.loc)
			return
	..() //Adding more planks is an afterattack on the sheet type

/obj/structure/barricade/wooden/planks/take_damage()
	..()
	if(obj_integrity <= (planks-1)*30)
		planks --
		checkplanks()
	return

/obj/structure/barricade/wooden/planks/proc/checkplanks()
	obj_integrity = planks*30 //Each board adds 30 health
	icon_state = "board-[planks]"
	if(obj_integrity <= 0)
		qdel(src)

/obj/structure/barricade/wooden/planks/pregame/initialize() //Place these in the map maker to have a bit of randomization with boarded up windows/doors
	planks = rand(1,maxplanks)
	..()