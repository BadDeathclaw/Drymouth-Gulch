/obj/machinery/computer/shuttle/bos
	name = "Bos Base Lockdown override."
	desc = "Can be used to disable the lockdown on the bos base."
	req_access = null //because of how this works only bos should be able to get to it.
	shuttleId = "Brotherhood_of_Steel"
	circuit = /obj/item/circuitboard/computer/bos
	possible_destinations = "Bos 1;Bos 2;Bos 3;Bos 4;Bos 5;Bos 6;Bos 7;Bos 8;Bos 9;Bos 10;Bos 11;Bos 12;Bos home"

/obj/machinery/computer/shuttle/bos/Topic(href, href_list)
	if(href_list["move"])
		if(!is_centcom_level(z))
			to_chat(usr, "<span class='warning'>The controls have malfunctioned. And you cannot seem to lock the base down!</span>")
			return 0
	if(..())
		qdel(src)

/obj/docking_port/mobile/bos
	width = 7
	height = 7
	dir = NORTH
	port_direction = SOUTH

/obj/docking_port/stationary/bos
	name = "Bos home"
	id = "Bos home"
	dwidth = 1
	dheight = 0
	width = 7
	height = 7
	dir = NORTH
	roundstart_template = /datum/map_template/shuttle/bosbase/base

/obj/docking_port/stationary/bos/one
	name = "Bos Base"
	id = "Bos1"
/*
/obj/docking_port/stationary/bos/two
	name = "Bos Base"
	id = "Bos2"

/obj/docking_port/stationary/bos/three
	name = "Bos Base"
	id = "Bos3"

/obj/docking_port/stationary/bos/four
	name = "Bos Base"
	id = "Bos4"

/obj/docking_port/stationary/bos/five
	name = "Bos Base"
	id = "Bos5"

/obj/docking_port/stationary/bos/six
	name = "Bos Base"
	id = "Bos6" 

/obj/docking_port/stationary/bos/seven
	name = "Bos Base"
	id = "Bos7"

/obj/docking_port/stationary/bos/eight
	name = "Bos Base"
	id = "Bos8"

/obj/docking_port/stationary/bos/nine
	name = "Bos Base"
	id = "Bos9"

/obj/docking_port/stationary/bos/ten
	name = "Bos Base"
	id = "Bos10"

/obj/docking_port/stationary/bos/eleven
	name = "Bos Base"
	id = "Bos11"

/obj/docking_port/stationary/bos/twelve
	name = "Bos Base"
	id = "Bos12"
*/