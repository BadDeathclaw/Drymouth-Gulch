//Fallout 13 general armor directory

/obj/item/clothing/suit/armor/f13


/obj/item/clothing/suit/armor/f13/cyberpunk
	name = "armored trenchcoat"
	desc = "A trenchcoat augmented with a special alloy for some protection and style."
	icon_state = "jensencoat"
	item_state = "jensencoat"
//	flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(melee = 50, bullet = 10, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0, fire = 30, acid = 30)
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/weapon,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	resistance_flags = UNACIDABLE
	strip_delay = 30
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/doom
	name = "green chestplate"
	desc = "An odd green chestplate.<br>It's lightweight and strangely comfortable."
	icon_state = "praetor"
	item_state = "g_suit"
	body_parts_covered = CHEST
	armor = list(melee = 60, bullet = 40, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 100, fire = 100, acid = 100)
	resistance_flags = UNACIDABLE
	strip_delay = 10
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/punk
	name = "armor kit"
	desc = "A couple of armor parts that can be worn over the clothing for moderate protection against the dangers of wasteland.<br>Do you feel lucky now? Well, do ya, punk?"
	icon_state = "punkit" //Punk it
	item_state = "punkit" //Pun kit
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 20, rad = 20, fire = 50, acid = 50)
	strip_delay = 30
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/tribal
	name = "tribal armor"
	desc = "A set of armor made of gecko hides.<br>It's pretty good for makeshift armor."
	icon_state = "tribal"
	item_state = "tribal"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 30, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 10, acid = 0)
	flags_inv = HIDEJUMPSUIT
	strip_delay = 40
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/slam
	name = "slammer raider armor"
	desc = "Crude armor that appears to employ a tire of some kind as the shoulder pad. What appears to be a quilt is tied around the waist.<br>Come on and slam and turn your foes to jam!"
	icon_state = "slam"
	item_state = "slam"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEJUMPSUIT
	strip_delay = 40
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/leatherarmor
	name = "leather armor"
	desc = "A set of light armor made of boiled brahmin leather.<br>It should protect against the average 9mm peashooter, but anything higher caliber will punch through it like butter."
	icon_state = "leatherarmor"
	item_state = "leatherarmor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 40, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEJUMPSUIT
	strip_delay = 40
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/metalarmor
	name = "metal armor"
	desc = "A set of hand-crafted metal armor created from a variety of scrap pieces attached to a black leather base layer."
	icon_state = "metalarmor"
	item_state = "metalarmor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 40, bullet = 30, laser = 20, energy = 20, bomb = 30, bio = 0, rad = 0, fire = 10, acid = 0)
	flags_inv = HIDEJUMPSUIT
	strip_delay = 60
	resistance_flags = FIRE_PROOF
	icon = 'icons/fallout/clothing/suits.dmi'
///obj/item/clothing/suit/armor/f13/bmetalarmor //uses the same path as bmetalarmor in armor.dm, causing the assless chaps bug
//	name = "black metal armor"
//	desc = "A set of sturdy metal armor made from various bits of scrap metal. It looks like it might impair movement."
//	icon_state = "bmetalarmor"
//	item_state = "bmetalarmor"
//	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
//	armor = list(melee = 50, bullet = 40, laser = 30, energy = 30, bomb = 40, bio = 0, rad = 0, fire = 20, acid = 0)
//	flags_inv = HIDEJUMPSUIT
//	strip_delay = 60
//	resistance_flags = FIRE_PROOF
//	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/ncrarmor/soldier
	name = "standard issue trooper armor"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons, and gauntlets, worn by NCR soldiers in combat environments.<br>This one has had its breastplate emblazoned with the emblem of the NCR, that has slightly faded over time."
	icon_state = "ncr_armor2"
	item_state = "ncr_armor2"
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/ncrarmor/patriot
	name = "trooper armor of \"Patriot\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR patriots in combat environments.<br>This one has a five-pointed star painted over the chestplate with white paint - it must be a battalion insignia."
	icon_state = "ncr_armor3"
	item_state = "ncr_armor3"
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/ncrarmor/commie
	name = "trooper armor of \"Commie\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR comrades in combat environments.<br>This one has a five-pointed star painted over the chestplate with red paint - it must be a battalion insignia."
	icon_state = "ncr_armor4"
	item_state = "ncr_armor4"
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/ncrarmor/preacher
	name = "trooper armor of \"Preacher\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR zealots in combat environments.<br>This one has a holy cross painted over the chestplate with yellow paint - it must be a battalion insignia."
	icon_state = "ncr_armor5"
	item_state = "ncr_armor5"

/obj/item/clothing/suit/armor/f13/ncrarmor/lover
	name = "trooper armor of \"Lover\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR lovers in combat environments.<br>This one has a heart symbol painted over the chestplate with pink paint - it must be a battalion insignia."
	icon_state = "ncr_armor6"
	item_state = "ncr_armor6"
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/ncrarmor/stalker //Cheeki breeki i v damke !!!
	name = "trooper armor of \"Stalker\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR explorers in combat environments.<br>This one has a radiation symbol painted over the chestplate with yellow paint - it must be a battalion insignia."
	icon_state = "ncr_armor7"
	item_state = "ncr_armor7"
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/ncrarmor/punisher
	name = "trooper armor of \"Punisher\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR heroes and villains in combat environments.<br>This one has a skull symbol painted over the chestplate with white paint - it must be a battalion insignia."
	icon_state = "ncr_armor8"
	item_state = "ncr_armor8"
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/ncrarmor/facewrap
	name = "face wrap armor"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR scouts in combat environments.<br>This one has the facewrap, designed to be pulled over the user's face to protect oneself from dust particles and other mainly radioactive elements."
	icon_state = "ncr_armor9"
	item_state = "ncr_armor9"
	armor = list(melee = 30, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 30, fire = 10, acid = 10) //Better radiation protection, thank the facewrap bro!
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/rangercombat/old
	name = "worn veteran ranger combat armor"
	desc = "A unique armor, that has been in countless battles and caused much bloodshed."
	icon_state = "oldranger"
	item_state = "oldranger"
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 30, fire = 20, acid = 20)
	icon = 'icons/fallout/clothing/suits.dmi'
/obj/item/clothing/suit/armor/f13/battlecoat //Maxson's battlecoat from Fallout 4
	name = "battlecoat"
	desc = "A heavy padded leather coat, worn by pre-War bomber pilots in the past and post-War zeppelin pilots in the future."
	icon_state = "battlecoat"
	item_state = "battlecoat"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 50, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 0, rad = 30, fire = 30, acid = 30)
	strip_delay = 30
	allowed = list(/obj/item/weapon)
	icon = 'icons/fallout/clothing/suits.dmi'
//Knights of the Apocalypse

/obj/item/clothing/suit/armor/riot/knight
	name = "plate armour"
	desc = "A classic suit of plate armour, highly effective at stopping melee attacks."
	icon_state = "knight_green"
	item_state = "knight_green"
/obj/item/clothing/suit/armor/riot/knight/yellow
	icon_state = "knight_yellow"
	item_state = "knight_yellow"

/obj/item/clothing/suit/armor/riot/knight/blue
	icon_state = "knight_blue"
	item_state = "knight_blue"

/obj/item/clothing/suit/armor/riot/knight/red
	icon_state = "knight_red"
	item_state = "knight_red"

/obj/item/clothing/suit/armor/riot/knight/templar
	name = "crusader armour"
	desc = "God wills it!"
	icon_state = "knight_templar"
	item_state = "knight_templar"

/obj/item/clothing/suit/armor/riot/knight/tabard
	name = "tabard plate armor"
	desc = "A set of plate armor with tabard for the user's high-visibility during combat."
	icon_state = "knight_tabard"
	item_state = "knight_tabard"