//Clown PDA is slippery.
/obj/item/pda/clown
	name = "clown Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/virus/clown
	inserted_item = /obj/item/toy/crayon/rainbow
	icon_state = "pda-clown"
	desc = "The RobCo Pip-Boy (Personal Information Processor) is an electronic device. The surface is coated with polytetrafluoroethylene and banana drippings."
	ttone = "honk"

/obj/item/pda/clown/Initialize()
	. = ..()
	AddComponent(/datum/component/slippery, 120, NO_SLIP_WHEN_WALKING, CALLBACK(src, .proc/AfterSlip))

/obj/item/pda/clown/proc/AfterSlip(mob/living/carbon/human/M)
	if (istype(M) && (M.real_name != owner))
		var/obj/item/cartridge/virus/clown/cart = cartridge
		if(istype(cart) && cart.charges < 5)
			cart.charges++

// Special AI/pAI PDAs that cannot explode.
/obj/item/pda/ai
	icon = null
	ttone = "data"
	fon = FALSE
	detonatable = FALSE

/obj/item/pda/ai/attack_self(mob/user)
	if ((honkamt > 0) && (prob(60)))//For clown virus.
		honkamt--
		playsound(loc, 'sound/items/bikehorn.ogg', 30, 1)
	return

/obj/item/pda/ai/pai
	ttone = "assist"



/obj/item/pda/medical
	name = "medical Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/medical
	icon_state = "pda-medical"

/obj/item/pda/viro
	name = "virology Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/medical
	icon_state = "pda-virology"

/obj/item/pda/engineering
	name = "engineering Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/engineering
	icon_state = "pda-engineer"

/obj/item/pda/security
	name = "security Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/security
	icon_state = "pda-security"

/obj/item/pda/detective
	name = "detective Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/detective
	icon_state = "pda-detective"

/obj/item/pda/warden
	name = "warden Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/security
	icon_state = "pda-warden"

/obj/item/pda/janitor
	name = "janitor Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/janitor
	icon_state = "pda-janitor"
	ttone = "slip"

/obj/item/pda/toxins
	name = "scientist Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/signal/toxins
	icon_state = "pda-science"
	ttone = "boom"

/obj/item/pda/mime
	name = "mime Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/virus/mime
	inserted_item = /obj/item/toy/crayon/mime
	icon_state = "pda-mime"
	silent = TRUE
	ttone = "silence"

/obj/item/pda/heads
	default_cartridge = /obj/item/cartridge/head
	icon_state = "pda-hop"

/obj/item/pda/heads/hop
	name = "head of personnel Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/hop
	icon_state = "pda-hop"

/obj/item/pda/heads/hos
	name = "head of security Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/hos
	icon_state = "pda-hos"

/obj/item/pda/heads/ce
	name = "chief engineer Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/ce
	icon_state = "pda-ce"

/obj/item/pda/heads/cmo
	name = "chief medical officer Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/cmo
	icon_state = "pda-cmo"

/obj/item/pda/heads/rd
	name = "research director Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/rd
	inserted_item = /obj/item/pen/fountain
	icon_state = "pda-rd"

/obj/item/pda/captain
	name = "captain Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/captain
	inserted_item = /obj/item/pen/fountain/captain
	icon_state = "pda-captain"
	detonatable = FALSE

/obj/item/pda/cargo
	name = "cargo technician Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/quartermaster
	icon_state = "pda-cargo"

/obj/item/pda/quartermaster
	name = "quartermaster Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/quartermaster
	inserted_item = /obj/item/pen/fountain
	icon_state = "pda-qm"

/obj/item/pda/shaftminer
	name = "shaft miner Pip-Boy 3000"
	icon_state = "pda-miner"

/obj/item/pda/syndicate
	default_cartridge = /obj/item/cartridge/virus/syndicate
	icon_state = "pda-syndi"
	name = "military Pip-Boy 3000"
	owner = "John Doe"
	hidden = 1

/obj/item/pda/chaplain
	name = "chaplain Pip-Boy 3000"
	icon_state = "pda-chaplain"
	ttone = "holy"

/obj/item/pda/lawyer
	name = "lawyer Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/lawyer
	inserted_item = /obj/item/pen/fountain
	icon_state = "pda-lawyer"
	ttone = "objection"

/obj/item/pda/botanist
	name = "botanist Pip-Boy 3000"
	//default_cartridge = /obj/item/cartridge/botanist
	icon_state = "pda-hydro"

/obj/item/pda/roboticist
	name = "roboticist Pip-Boy 3000"
	icon_state = "pda-roboticist"
	default_cartridge = /obj/item/cartridge/roboticist

/obj/item/pda/curator
	name = "curator Pip-Boy 3000"
	icon_state = "pda-library"
	icon_alert = "pda-r-library"
	default_cartridge = /obj/item/cartridge/curator
	inserted_item = /obj/item/pen/fountain
	desc = "The RobCo Pip-Boy (Personal Information Processor) is an electronic device. This model is a WGW-11 series e-reader."
	note = "Congratulations, your Vault has chosen the Pip-Boy 3000 WGW-11 Series E-reader and Personal Data Assistant!"
	silent = TRUE //Quiet in the library!
	overlays_x_offset = -3

/obj/item/pda/clear
	name = "clear Pip-Boy 3000"
	icon_state = "pda-clear"
	desc = "The RobCo Pip-Boy (Personal Information Processor) is an electronic device. This model is a special edition with a transparent case."
	note = "Congratulations, you have chosen the Pip-Boy 3000 Personal Data Assistant Deluxe Special Max Turbo Limited Edition!"

/obj/item/pda/cook
	name = "cook Pip-Boy 3000"
	icon_state = "pda-cook"

/obj/item/pda/bar
	name = "bartender Pip-Boy 3000"
	icon_state = "pda-bartender"
	inserted_item = /obj/item/pen/fountain

/obj/item/pda/atmos
	name = "atmospherics Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/atmos
	icon_state = "pda-atmos"

/obj/item/pda/chemist
	name = "chemist Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/chemistry
	icon_state = "pda-chemistry"

/obj/item/pda/geneticist
	name = "geneticist Pip-Boy 3000"
	default_cartridge = /obj/item/cartridge/medical
	icon_state = "pda-genetics"
