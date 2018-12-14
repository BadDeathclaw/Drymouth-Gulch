/datum/design/flightsuit
	name = "Flight Suit"
	desc = "A specialized hardsuit that is able to attach a flightpack and accessories.."
	id = "flightsuit"
	build_type = PROTOLATHE
	build_path = /obj/item/clothing/suit/space/hardsuit/flightsuit
	materials = list(MAT_METAL=16000, MAT_GLASS = 8000, MAT_DIAMOND = 200, MAT_GOLD = 3000, MAT_SILVER = 3000, MAT_TITANIUM = 16000)	//This expensive enough for you?
	construction_time = 250
	category = list("Misc")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/flightpack
	name = "Flight Pack"
	desc = "An advanced back-worn system that has dual ion engines powerful enough to grant a humanoid flight. Contains an internal self-recharging high-current capacitor for short, powerful boosts."
	id = "flightpack"
	build_type = PROTOLATHE
	build_path = /obj/item/flightpack
	materials = list(MAT_METAL=16000, MAT_GLASS = 8000, MAT_DIAMOND = 4000, MAT_GOLD = 12000, MAT_SILVER = 12000, MAT_URANIUM = 20000, MAT_PLASMA = 16000, MAT_TITANIUM = 16000)	//This expensive enough for you?
	construction_time = 250
	category = list("Misc")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/flightshoes
	name = "Flight Shoes"
	desc = "Flight shoes, attachable to a flight suit to provide additional functions."
	id = "flightshoes"
	build_type = PROTOLATHE
	build_path = /obj/item/clothing/shoes/flightshoes
	materials = list(MAT_METAL = 5000, MAT_GLASS = 5000, MAT_GOLD = 1500, MAT_SILVER = 1500, MAT_PLASMA = 2000, MAT_TITANIUM = 2000)
	construction_time = 100
	category = list("Misc")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/industrcd
	name = "Industrial RCD"
	desc = "An RCD with much more ammo."
	id = "industrcd"
	build_type = PROTOLATHE
	build_path = /obj/item/construction/rcd/combat
	materials = list(MAT_METAL = 5000, MAT_GLASS = 5000, MAT_GOLD = 750, MAT_SILVER = 750, MAT_PLASMA = 750, MAT_TITANIUM = 750)
	construction_time = 100
	category = list("Misc")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
	
/datum/design/advancedhud
	name = "Advanced HUD"
	desc = "Some pretty advanced glasses."
	id = "advanced_hud"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 600, MAT_GLASS = 600, MAT_URANIUM = 1000, MAT_PLASMA = 300)
	build_path = /obj/item/clothing/glasses/hud/advanced
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/advancedtoolbox
	name = "Toolbox of Advanced Construction Tools"
	desc = "A toolbox that contains advanced construction tools."
	id = "advancedtoolbox" //Put into design_ids of subdermal_implants
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_SILVER = 5000, MAT_PLASMA = 5000, MAT_TITANIUM = 5000, MAT_DIAMOND = 5000)
	build_path = /obj/item/storage/toolbox/advanced
	category = list("Misc")
	departmental_flags =  DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/advancedduffelbag
	name = "Surgery Duffelbag of Advanced Surgical Tools"
	desc = "A duffelbag containing advanced surgical tools."
	id = "advancedduffelbag" //Put into design_ids of subdermal_implants
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_SILVER = 5000, MAT_PLASMA = 5000, MAT_TITANIUM = 5000, MAT_DIAMOND = 5000)
	build_path = /obj/item/storage/backpack/duffelbag/med/surgery/advanced
	category = list("Misc")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL || DEPARTMENTAL_FLAG_SCIENCE

/datum/design/rld
	name = "Rapid Light Construction Device"
	desc = "A tool that can make multi colored flares and light structures."
	id = "rld"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 20000, MAT_SILVER = 1000, MAT_PLASMA = 1000, MAT_URANIUM = 1000)
	build_path = /obj/item/construction/rld
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
