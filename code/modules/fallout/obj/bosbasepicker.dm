/obj/machinery/computer/shuttle/bos
	name = "Brotherhood Base Lockdown override."
	desc = "Can be used to disable the lockdown on the Brotherhood of Steel base."
	req_access = null //because of how this works only bos should be able to get to it.
	shuttleId = "Brotherhood_of_Steel"
	circuit = /obj/item/circuitboard/computer/bos
	possible_destinations = "Brotherhood_Home;Bos1;Bos2;Bos3;Bos4;Bos5;Bos6;Bos7;Bos8;Bos9;Bos10;Bos11;Bos12;Bos home"
	flags_1 = NODECONSTRUCT_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/computer/shuttle/bos/Topic(href, href_list)
	if(href_list["move"])
		if(!is_centcom_level(z))
			to_chat(usr, "<span class='warning'>The controls have malfunctioned. And you cannot seem to lock the base down!</span>")
			return 0
	..()
	
/obj/docking_port/mobile/bos
	width = 6
	height = 9
	dwidth = 1
	dheight = 0
	dir = EAST
	id = "Brotherhood_of_Steel"
	callTime = 0
	ignitionTime = 0
	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0);
/obj/docking_port/stationary/bos/
	name = "Brotherhood_of_Steel"
	id = "Brotherhood_Home"
	dwidth = 1
	dheight = 0
	width = 6
	height = 9
	dir = EAST
	roundstart_template = /datum/map_template/shuttle/bosbase/base

/obj/docking_port/stationary/bosaway/
	name = "Bos Base 1"
	id = "Bos1"
	dwidth = 1
	dheight = 0
	width = 6
	height = 9
	dir = EAST

/obj/docking_port/stationary/bosaway/two
	name = "Bos Base 2"
	id = "Bos2"

/obj/docking_port/stationary/bosaway/three
	name = "Bos Base 3"
	id = "Bos3"

/obj/docking_port/stationary/bosaway/four
	name = "Bos Base 4"
	id = "Bos4"

/obj/docking_port/stationary/bosaway/five
	name = "Bos Base 5"
	id = "Bos5"

/obj/docking_port/stationary/bosaway/six
	name = "Bos Base 6"
	id = "Bos6" 

/obj/docking_port/stationary/bosaway/seven
	name = "Bos Base 7"
	id = "Bos7"

/obj/docking_port/stationary/bosaway/eight
	name = "Bos Base 8"
	id = "Bos8"

/obj/docking_port/stationary/bosaway/nine
	name = "Bos Base 9"
	id = "Bos9"

/obj/docking_port/stationary/bosaway/ten
	name = "Bos Base 10"
	id = "Bos10"

/obj/docking_port/stationary/bosaway/eleven
	name = "Bos Base 11"
	id = "Bos11"

/obj/docking_port/stationary/bosaway/twelve
	name = "Bos Base 12"
	id = "Bos12"
