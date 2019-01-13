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

	var/screen = 1
	var/blackpowder_total = 0
	var/metal_total = 0
	var/plasteel_total = 0

/obj/machinery/crafting_bench/ammo/attackby(var/obj/item/item_tar, mob/user)
	if (istype(item_tar, /obj/item/ammo_casing) )
		var/obj/item/ammo_casing/case_tar = item_tar
		blackpowder_total += case_tar.blackpowder_total
		metal_total += case_tar.metal_total
		plasteel_total += case_tar.plasteel_total
		qdel(case_tar)

	if (istype(item_tar, /obj/item/stack/sheet/metal) )
		var/obj/item/stack/sheet/metal/metal_tar = item_tar
		metal_total += metal_tar.amount
		qdel(metal_tar)

	if (istype(item_tar, /obj/item/stack/sheet/plasteel) )
		var/obj/item/stack/sheet/metal/plasteel_tar = item_tar
		plasteel_total += plasteel_tar.amount
		qdel(plasteel_tar)


/obj/machinery/crafting_bench/ammo/ui_interact(mob/user)
	var/data
	switch(screen)
		if(1)
			data = main_win(user)

	var/datum/browser/popup = new(user, "ammo crafting", name, 400, 500)
	popup.set_content(data)
	popup.open()

/obj/machinery/crafting_bench/ammo/proc/main_win(mob/user)
	var/data = "<div class='statusDisplay'><h3>Ammo Crafting Menu</h3><br>"
	return data

/obj/machinery/crafting_bench/ammo/ui_data(mob/user)
	var/list/data = list()
	return data

/obj/machinery/crafting_bench/ammo/ui_act(action, params)
	if(..())
		return
	switch(action)
		if("eject")
			return