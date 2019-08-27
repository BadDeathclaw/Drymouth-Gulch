/obj/docking_port/mobile/elevator
	name = "elevator"
	id = "elevator"
	timid = FALSE
	dwidth = 3
	width = 7
	height = 7
	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)

/*/obj/docking_port/mobile/elevator/request(obj/docking_port/stationary/S) //No transit, no ignition, just a simple up/down platform
	initiate_docking(S, TRUE)*/

/obj/machinery/computer/shuttle/vaultelevator
	name = "elevator controls"
	desc = "Controls the elevator."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	circuit = /obj/item/circuitboard/computer/vault_control
	shuttleId = "vault_elevator"
	possible_destinations = "vault_elevator_top;vault_elevator_down"
	flags_1 = INDESTRUCTIBLE | NODECONSTRUCT_1

/obj/machinery/computer/shuttle/enclavefortelevator
	name = "platform controls"
	desc = "Controls the platform."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	circuit = /obj/item/circuitboard/computer/enclave_control
	shuttleId = "enclavefort_elevator"
	possible_destinations = "enclavefort_elevator_top;enclavefort_elevator_down"
	flags_1 = INDESTRUCTIBLE | NODECONSTRUCT_1

/obj/machinery/computer/shuttle/boselevator
	name = "elevator controls"
	desc = "Controls the platform."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	circuit = /obj/item/circuitboard/computer/bos_control
	shuttleId = "bos_elevator"
	possible_destinations = "bos_elevator_top;bos_elevator_down"
	flags_1 = INDESTRUCTIBLE | NODECONSTRUCT_1

/obj/machinery/computer/shuttle/bunkerelevator
	name = "elevator controls"
	desc = "Controls the elevator."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	circuit = /obj/item/circuitboard/computer/bunker_control
	shuttleId = "bunker_elevator"
	possible_destinations = "bunker_elevator_top;bunker_elevator_down"
	flags_1 = INDESTRUCTIBLE | NODECONSTRUCT_1
