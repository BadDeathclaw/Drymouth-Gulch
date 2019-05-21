//Fallout 13 goggles directory

/obj/item/clothing/glasses/f13
	icon = 'icons/fallout/clothing/glasses.dmi'
	self_weight = 0.1
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/glasses/f13/biker
	name = "biker goggles"
	desc = "B-B-B-B-Bad,<br>B-B-B-B-Bad,<br>B-B-B-B-Bad,<br>Bad to the bone!"
	icon_state = "biker"
	item_state = "biker"

//Fallout 13 sunglasses

/obj/item/clothing/glasses/sunglasses/f13
	icon = 'icons/fallout/clothing/glasses.dmi'
	self_weight = 0.1
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/glasses/sunglasses/f13/legion
	name = "military goggles"
	desc = "Flash-resistant goggles commonly worn by Caesar's Legion soldiers."
	icon_state = "legion"
	item_state = "legion"
	flash_protect = 2
	tint = 0

//Fallout 13 thermals

/obj/item/clothing/glasses/thermal/f13
	icon = 'icons/fallout/clothing/glasses.dmi'
	self_weight = 0.15
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/glasses/thermal/f13/doctorwho
	name = "3D glasses"
	desc = "<i>People assume that time is a strict progression of cause to effect, but, actually, from a non-linear, non-subjective viewpoint, it's more like a big ball of wibbly-wobbly... Timey-wimey... Stuff.</i>"
	icon_state = "3d"
	item_state = "3d"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100, fire = 100, acid = 100)

/obj/item/clothing/glasses/thermal/f13/enclave
	name = "\improper pilot goggles"
	desc = "Heat-sensitive goggles commonly worn by Enclave vertibird pilots."
	icon_state = "enclavegoggles"
	item_state = "enclavegoggles"

//Fallout 13 science goggles

/obj/item/clothing/glasses/science/f13
	icon = 'icons/fallout/clothing/glasses.dmi'
	self_weight = 0.1
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/glasses/science/f13/steampunk
	name = "\improper goggles"
	desc = "If the legends are true, these goggles belonged to a genius alchemist.<br>Or maybe it's just a steampunk enthusiast's cherished toy."
	icon_state = "steampunk"
	item_state = "glasses"
	resistance_flags = ACID_PROOF
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 50, rad = 20, fire = 70, acid = 100)

//Augmented eye

/obj/item/clothing/glasses/hud/health/f13
	icon = 'icons/fallout/clothing/glasses.dmi'
	self_weight = 0.1
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/glasses/hud/health/f13/eye
	name = "augmented eye"
	desc = "An easy-to-use augmenation that enhances the user's sight properties.<br>Stick it directly in your eye. It might sting a little..."
	icon_state = "aug"
	darkness_view = 4
	vision_flags = SEE_TURFS
	invis_view = SEE_INVISIBLE_MINIMUM
	flags = NODROP
	glass_colour_type = /datum/client_colour/glass_colour/lightorange