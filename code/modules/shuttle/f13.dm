/obj/docking_port/mobile/elevator
	name = "elevator"
	id = "elevator"
	timid = FALSE
	dwidth = 3
	width = 7
	height = 7
	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)

/obj/machinery/computer/shuttle/vaultelevator
	name = "elevator controls"
	desc = "Controls the elevator."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	circuit = /obj/item/circuitboard/computer/vault_control
	shuttleId = "vault_elevator"
	possible_destinations = "vault_elevator_top;vault_elevator_down"
	flags_1 = NODECONSTRUCT_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/computer/shuttle/enclavefortelevator
	name = "platform controls"
	desc = "Controls the platform."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	circuit = /obj/item/circuitboard/computer/enclave_control
	shuttleId = "enclavefort_elevator"
	possible_destinations = "enclavefort_elevator_top;enclavefort_elevator_down"
	flags_1 = NODECONSTRUCT_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/computer/shuttle/boselevator
	name = "elevator controls"
	desc = "Controls the platform."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	circuit = /obj/item/circuitboard/computer/bos_control
	shuttleId = "bos_elevator"
	possible_destinations = "bos_elevator_top;bos_elevator_down"
	flags_1 = NODECONSTRUCT_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/computer/shuttle/bunkerelevator
	name = "elevator controls"
	desc = "Controls the elevator."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	circuit = /obj/item/circuitboard/computer/bunker_control
	shuttleId = "bunker_elevator"
	possible_destinations = "Ground;Level_1"
	flags_1 = NODECONSTRUCT_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/computer/shuttle/northbunkerelevator
	name = "elevator controls"
	desc = "Controls the elevator."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	circuit = /obj/item/circuitboard/computer/northbunker_control
	shuttleId = "northbunker_elevator"
	possible_destinations = "North_Ground;North_Level_1"
	flags_1 = NODECONSTRUCT_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/computer/shuttle/miningelevator
	name = "elevator controls"
	desc = "Controls the elevator."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	circuit = /obj/item/circuitboard/computer/mining_control
	shuttleId = "mining_elevator"
	possible_destinations = "Mining_Ground;Mining_Level_1"
	flags_1 = NODECONSTRUCT_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
