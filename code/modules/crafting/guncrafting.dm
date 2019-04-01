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


/obj/machinery/ammobench
	name = "reloading bench"
	desc = "You shouldn't be seeing this..."
	icon = 'icons/obj/recycling.dmi' //placeholder
	icon_state = "grinder-b1" //placeholder
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE

/obj/machinery/ammobench/ncr
	name = "NCR reloading bench"
	desc = "A reloading bench used for inefficiently  crafting new ammunition out of scrap metal. There's a substantial supply of powder and primer. This one can be used to create most NCR rounds."
	icon = 'icons/obj/recycling.dmi' //placeholder
	icon_state = "grinder-b1" //placeholder

/obj/machinery/ammobench/legion
	name = "Legion reloading bench"
	desc = "A reloading bench used for inefficiently crafting new ammunition out of scrap metal. There's a substantial supply of powder and primer. This one can be used to create most Legion rounds."
	icon = 'icons/obj/recycling.dmi' //placeholder
	icon_state = "grinder-b1" //placeholder