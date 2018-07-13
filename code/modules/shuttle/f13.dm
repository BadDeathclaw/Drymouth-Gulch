/obj/docking_port/mobile/elevator
	name = "elevator"
	id = "elevator"
	timid = FALSE
	dwidth = 3
	width = 7
	height = 7
	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)

/obj/docking_port/mobile/elevator/request(obj/docking_port/stationary/S) //No transit, no ignition, just a simple up/down platform
	initiate_docking(S, TRUE)

/obj/machinery/computer/shuttle/vaultelevator
	name = "elevator controls"
	desc = "Controls the elevator."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	shuttleId = "vault_elevator"
	possible_destinations = "vault_elevator_top;vault_elevator_down"

/obj/machinery/computer/shuttle/enclavefortelevator
	name = "platform controls"
	desc = "Controls the platform."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	shuttleId = "enclavefort_elevator"
	possible_destinations = "enclavefort_elevator_top;enclavefort_elevator_down"

/obj/machinery/computer/shuttle/boselevator
	name = "elevator controls"
	desc = "Controls the platform."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	shuttleId = "bos_elevator"
	possible_destinations = "bos_elevator_top;bos_elevator_down"