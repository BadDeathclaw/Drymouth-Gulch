//Fallout 13 neon signs directory

/obj/machinery/light/sign
	name = "bar sign"
	icon_state = "blue0"
	base_state = "blue"
	icon = 'icons/fallout/machines/64x32.dmi'
	fitting = "sign"
	brightness = 4
	active_power_usage = 50
	density = 0
	desc = "The glow of the sign tempts you to buy a drink..."
	light_color = LIGHT_COLOR_BLUE
	light_type = null

/obj/machinery/light/sign/break_light_tube()
	return 0

/obj/machinery/light/kebab
	name = "Kebabtown sign"
	icon_state = "Kebab0"
	base_state = "Kebab"
	icon = 'icons/fallout/objects/structures/kebabtown.dmi'
	fitting = "sign"
	brightness = 4
	active_power_usage = 50
	density = 1
	desc = "So awful..."
	light_color = LIGHT_COLOR_YELLOW
	light_type = null

/obj/machinery/light/kebab/break_light_tube()
	return 0

/obj/machinery/light/kebab_sign
	name = "Kebabtown"
	icon_state = "kebab_sign0"
	base_state = "kebab_sign"
	icon = 'icons/fallout/objects/structures/kebabtown.dmi'
	fitting = "sign"
	brightness = 4
	active_power_usage = 50
	density = 0
	desc = "So awful..."
	light_color = LIGHT_COLOR_YELLOW
	light_type = null

/obj/machinery/light/kebab_sign/break_light_tube()
	return 0