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

	var/viewing_category = 1
	var/screen = 1
	var/list/categories = list(CAT_PISTOL, CAT_REVOLVER, CAT_RIFLE, CAT_SHOTGUN)

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



/obj/machinery/crafting_bench/ammo/ui_interact(mob/user)
	. = ..()

	var/dat

	switch(screen)
		if(AUTOLATHE_MAIN_MENU)
			dat = main_win(user)
		if(AUTOLATHE_CATEGORY_MENU)
			dat = category_win(user,selected_category)
		if(AUTOLATHE_SEARCH_MENU)
			dat = search_win(user)

	var/datum/browser/popup = new(user, "ammo crafting bench", name, 400, 500)
	popup.set_content(dat)
	popup.open()

/obj/machinery/crafting_bench/ammo/on_deconstruction()
	GET_COMPONENT(materials, /datum/component/material_container)
	materials.retrieve_all()


/obj/machinery/crafting_bench/ammo/Topic(href, href_list)
	if(..())
		return

	if(href_list["menu"])
		screen = text2num(href_list["menu"])
		updateUsrDialog()

	if(href_list["category"])
		selected_category = href_list["category"]
		updateUsrDialog()

	if(href_list["make"])

		/////////////////
		//href protection
		being_built = stored_research.isDesignResearchedID(href_list["make"])
		if(!being_built)
			return

		var/multiplier = text2num(href_list["multiplier"])
		var/is_stack = ispath(being_built.build_path, /obj/item/stack)
		multiplier = CLAMP(multiplier,1,50)

		/////////////////

		var/metal_cost = being_built.materials[MAT_METAL]
		var/glass_cost = being_built.materials[MAT_GLASS]

		var/power = max(2000, (metal_cost+glass_cost)*multiplier/5)

		GET_COMPONENT(materials, /datum/component/material_container)
		if((materials.amount(MAT_METAL) >= metal_cost*multiplier*coeff) && (materials.amount(MAT_GLASS) >= glass_cost*multiplier*coeff))

			var/time = is_stack ? 32 : 32 * multiplier
			//addtimer(CALLBACK(src, .proc/make_item, power, metal_cost, glass_cost, multiplier, coeff, is_stack), time)

	updateUsrDialog()

	return

/obj/machinery/crafting_bench/ammo/proc/make_item(metal_cost, glass_cost, multiplier, is_stack)
	GET_COMPONENT(materials, /datum/component/material_container)
	var/atom/A = drop_location()
	var/list/materials_used = list(MAT_METAL=metal_cost*coeff*multiplier, MAT_GLASS=glass_cost*coeff*multiplier)
	materials.use_amount(materials_used)

	if(is_stack)
		var/obj/item/stack/N = new being_built.build_path(A, multiplier)
		N.autolathe_crafted(src)
	else
		for(var/i=1, i<=multiplier, i++)
			var/obj/item/new_item = new being_built.build_path(A)
			for(var/mat in materials_used)
				new_item.materials[mat] = materials_used[mat] / multiplier
			new_item.autolathe_crafted(src)
	updateDialog()


/obj/machinery/crafting_bench/ammo/proc/main_win(mob/user)
	var/dat = "<div class='statusDisplay'><h3>Ammo Bench Menu:</h3><br>"
	dat += materials_printout()

	var/line_length = 1
	dat += "<table style='width:100%' align='center'><tr>"

	for(var/C in categories)
		if(line_length > 2)
			dat += "</tr><tr>"
			line_length = 1

		dat += "<td><A href='?src=[REF(src)];category=[C];menu=[AUTOLATHE_CATEGORY_MENU]'>[C]</A></td>"
		line_length++

	dat += "</tr></table></div>"
	return dat

/obj/machinery/crafting_bench/ammo/proc/category_win(mob/user,selected_category)
	var/dat = "<A href='?src=[REF(src)];menu=[AUTOLATHE_MAIN_MENU]'>Return to main menu</A>"
	dat += "<div class='statusDisplay'><h3>Browsing [selected_category]:</h3><br>"
	dat += materials_printout()

	for(var/v in stored_research.researched_designs)
		var/datum/design/D = stored_research.researched_designs[v]
		if(!(selected_category in D.category))
			continue

		if(disabled || !can_build(D))
			dat += "<span class='linkOff'>[D.name]</span>"
		else
			dat += "<a href='?src=[REF(src)];make=[D.id];multiplier=1'>[D.name]</a>"

		if(ispath(D.build_path, /obj/item/stack))
			GET_COMPONENT(materials, /datum/component/material_container)
			var/max_multiplier = min(D.maxstack, D.materials[MAT_METAL] ?round(materials.amount(MAT_METAL)/D.materials[MAT_METAL]):INFINITY,D.materials[MAT_GLASS]?round(materials.amount(MAT_GLASS)/D.materials[MAT_GLASS]):INFINITY)
			if (max_multiplier>10 && !disabled)
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=10'>x10</a>"
			if (max_multiplier>25 && !disabled)
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=25'>x25</a>"
			if(max_multiplier > 0 && !disabled)
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=[max_multiplier]'>x[max_multiplier]</a>"
		else
			if(!disabled && can_build(D, 5))
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=5'>x5</a>"
			if(!disabled && can_build(D, 10))
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=10'>x10</a>"

		dat += "[get_design_cost(D)]<br>"

	dat += "</div>"
	return dat

/obj/machinery/crafting_bench/ammo/proc/materials_printout()
	GET_COMPONENT(materials, /datum/component/material_container)
	var/dat = "<b>Total amount:</b> [materials.total_amount] / [materials.max_amount] cm<sup>3</sup><br>"
	for(var/mat_id in materials.materials)
		var/datum/material/M = materials.materials[mat_id]
		dat += "<b>[M.name] amount:</b> [M.amount] cm<sup>3</sup><br>"
	return dat

/obj/machinery/crafting_bench/ammo/proc/can_build(datum/design/D, amount = 1)
	if(D.make_reagents.len)
		return FALSE

	GET_COMPONENT(materials, /datum/component/material_container)
	if(D.materials[MAT_METAL] && (materials.amount(MAT_METAL) < (D.materials[MAT_METAL] * amount)))
		return FALSE
	if(D.materials[MAT_GLASS] && (materials.amount(MAT_GLASS) < (D.materials[MAT_GLASS] * amount)))
		return FALSE
	return TRUE

/obj/machinery/crafting_bench/ammo/proc/get_design_cost(datum/design/D)
	var/coeff = (ispath(D.build_path, /obj/item/stack) ? 1 : prod_coeff)
	var/dat
	if(D.materials[MAT_METAL])
		dat += "[D.materials[MAT_METAL]] metal "
	if(D.materials[MAT_GLASS])
		dat += "[D.materials[MAT_GLASS]] glass"
	return dat





