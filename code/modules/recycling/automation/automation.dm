//An attempt at a assembly line for the vault or possibly as a wasteland ruin, put in recycling due to proximity towards conveyors
//Checks every process() to see if it has the allowed ingredients inside of it's contents to then craft a thing

/obj/machinery/autocrafter //Takes a recipe datum, accepts ingredients for them and makes it
	name = "autocrafter"
	desc = "Takes in ingredients and outputs products."
	icon = 'icons/obj/recycling.dmi'
	icon_state = "grinder-o0"
	density = TRUE
	var/datum/crafting_recipe/currentrecipe = new/datum/crafting_recipe/healpowder() //Testing purposes
	var/inputdir = NORTH //Takes stuff from north
	var/outputdir = SOUTH //Outputs finished stuff south
	dir = SOUTH //Default outputs south

/obj/machinery/autocrafter/examine(mob/user)
	..()
	to_chat(user, "<span class='notice'>This autocrafter is currently producing a recipe called [currentrecipe.name]\n</span>")
	to_chat(user, "<span class='notice'>It's currently outputting products [outputdir] and taking ingredients from the [inputdir].</span>")

/obj/machinery/autocrafter/proc/ingredientcheck()

	main_loop:
		for(var/A in currentrecipe.reqs)
			var/needed_amount = currentrecipe.reqs[A]
			for(var/B in contents)
				if(ispath(B, A))
					if(contents[B] >= currentrecipe.reqs[A])
						continue main_loop
					else
						needed_amount -= contents[B]
						if(needed_amount <= 0)
							continue main_loop
						else
							continue
			return FALSE
	return TRUE

/obj/machinery/autocrafter/process()
	if(ingredientcheck())
		new currentrecipe.result(get_step(src, outputdir))
	else
		playsound(src, "sparks", 75, 1, -1)


/obj/machinery/autocrafter/Bumped(atom/movable/input)
	if(get_dir(loc, input.loc) == inputdir)
		for(var/require in currentrecipe.reqs)
			if(ispath(input, require))
				contents += input
				break
	..()
