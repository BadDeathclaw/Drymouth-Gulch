//Gun crafting parts til they can be moved elsewhere

// PARTS //

/obj/item/weaponcrafting/receiver
	name = "modular receiver"
	desc = "A prototype modular receiver and trigger assembly for a firearm."
	icon = 'icons/obj/improvised.dmi'
	icon_state = "receiver"

/obj/item/weaponcrafting/stock
	name = "rifle stock"
	desc = "A classic rifle stock that doubles as a grip, roughly carved out of wood."
	icon = 'icons/obj/improvised.dmi'
	icon_state = "riflestock"


/obj/machinery/autolathe/ammobench
	name = "universal reloading bench"
	desc = "A reloading bench used for inefficiently  crafting new ammunition out of scrap metal. There's a substantial supply of powder and primer. This one can be used to craft most NCR and Legion rounds."
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
//	machine_tool_behaviour = list(TOOL_LEGION, TOOL_NCR)
	categories = list("Security")
	super_advanced_technology = FALSE

/obj/machinery/workbench
	name = "basic workbench"
	icon = 'icons/obj/machines/reloadingbench.dmi'
	icon_state = "basic_bench"
	desc = "A basic workbench for simple to intermediate projects."
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	machine_tool_behaviour = TOOL_BWORKBENCH

/obj/machinery/workbench/wrench_act(mob/living/user, obj/item/I)
	default_unfasten_wrench(user, I, 10)
	return TRUE

/obj/machinery/workbench/attackby(obj/item/W, mob/user, params)
	if (istype(W, /obj/item/wrench) && !(flags_1&NODECONSTRUCT_1))
		W.play_tool_sound(src)
		deconstruct(TRUE)
		return
	if(user.a_intent == INTENT_HARM)
		return ..()
	if(user.transferItemToLoc(W, drop_location()))
		return 1

/obj/machinery/workbench/standard
	name = "standard workbench"
	desc = "A standard workbench for a wide variety of projects."
	icon_state = "standard_bench"
	machine_tool_behaviour = TOOL_SWORKBENCH

/obj/machinery/workbench/advanced
	name = "advanced workbench"
	icon_state = "advanced_bench"
	desc = "A large and advanced pre-war workbench to tackle any project!"
	machine_tool_behaviour = TOOL_AWORKBENCH

/obj/machinery/workbench/advanced/wrench_act(mob/living/user, obj/item/I)
	return
	
/obj/machinery/ammobench
	name = "pre-war reloading press"
	desc = "A high quality reloading press from before the war. Capable of cheap, mass production of ammunition."
	icon = 'icons/obj/machines/pre-war_press.dmi'
	icon_state = "pre-war_press"
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	machine_tool_behaviour = TOOL_RELOADER

/obj/machinery/ammobench/makeshift
	name = "makeshift reloading bench"
	desc = "A makeshift reloading bench capable of producing ammunition rather inefficiently."
	icon = 'icons/obj/machines/reloadingbench.dmi'
	icon_state = "reloading_bench"
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	machine_tool_behaviour = TOOL_MSRELOADER

/obj/machinery/ammobench/makeshift/wrench_act(mob/living/user, obj/item/I)
	default_unfasten_wrench(user, I, 10)
	return TRUE
