/obj/machinery/crafting_bench/
	name = "crafting bench"
	desc = "Allows certain items to be crafted"
	density = TRUE
	use_power = 0
	idle_power_usage = 0

/obj/machinery/crafting_bench/ammo
	name = "Ammo Crafting Bench"
	desc = "Allows ammo to be crafted"
	icon = 'icons/obj/ammo_crafting_bench.dmi'
	icon_state = "ammo_bench"

	var/blackpowder_total = 0
	var/metal_total = 0
	var/plasteel_total = 0

	var/selected_category = 1
	var/list/categories = list(CAT_PISTOL, CAT_REVOLVER, CAT_RIFLE, CAT_SHOTGUN)

/*
/obj/machinery/crafting_bench/ammo/attackby(var/obj/item/item_tar, mob/user)
	if (istype(item_tar, /obj/item/ammo_casing) )
		var/obj/item/ammo_casing/case_tar = item_tar
		blackpowder_total += case_tar.blackpowder_total
		metal_total += case_tar.metal_total * 2000
		plasteel_total += case_tar.plasteel_total * 2000
		qdel(case_tar)

	if (istype(item_tar, /obj/item/stack/sheet/metal) )
		var/obj/item/stack/sheet/metal/metal_tar = item_tar
		metal_total += metal_tar.amount * 2000
		qdel(metal_tar)

	if (istype(item_tar, /obj/item/stack/sheet/plasteel) )
		var/obj/item/stack/sheet/metal/plasteel_tar = item_tar
		plasteel_total += plasteel_tar.amount * 2000
		qdel(plasteel_tar)

	if (istype(item_tar, /obj/item/reagent_containers) )
		var/obj/item/reagent_containers/container_tar = item_tar
		for (var/datum/reagent/reagent_sel in container_tar.reagents)
			if (istype(reagent_sel, /datum/reagent/blackpowder) )
				blackpowder_total += reagent_sel.volume
				container_tar.reagents.remove_reagent("blackpowder", reagent_sel.volume)


/obj/machinery/crafting_bench/ammo/proc/can_build(datum/bench_crafting_recipe/recipe_tar, var/amount)
	return TRUE

/obj/machinery/crafting_bench/ammo/proc/make_item(var/datum/bench_crafting_recipe/recipe_tar, var/amount)

	for(var/i=1, i<=amount, i++)
		for (var/obj/item/item_result in recipe_tar.results)
			var/obj/item/new_item = new item_result
			new_item.loc = src.loc

	updateDialog()

*/

//========== GUI ==========

/obj/machinery/crafting_bench/ammo/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = FALSE, datum/tgui/master_ui = null, datum/ui_state/state = GLOB.default_state)
	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "ammo_crafting_bench", name, 300, 300, master_ui, state)
		ui.open()

/obj/machinery/crafting_bench/ammo/ui_data(mob/user)
 	var/list/data = list()
 	data["var"] = 1

 	return data

/obj/machinery/crafting_bench/ammo/ui_act(action, params)
	if(..())
		return
	switch(action)
		if("copypasta")
			var/newvar = params["var"]


