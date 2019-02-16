/obj/item/disk/design_disk/loot
	name = "blueprint disk"
	desc = "A disk for storing device design data for construction in lathes."
	icon_state = "datadisk1"
	materials = list(MAT_METAL=300, MAT_GLASS=100)
	var/loot_design = /datum/design/loot_design

/obj/item/disk/design_disk/loot/Initialize()
	. = ..()
	blueprints[1] = new loot_design

/datum/design/loot_design
	category = list("Stock Parts", "Equipment", "Weapons", "Ammo", "Medical Designs", "Power Designs", "Electronics")
	build_type = PROTOLATHE | MECHFAB

/obj/item/disk/design_disk/loot/dxrped
	name = "DXRPED blueprint disk"
	loot_design = /datum/design/DXRPED
