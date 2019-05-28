//Fallout 13 protective helmets directory

/obj/item/clothing/head/helmet/f13
	icon = 'icons/fallout/clothing/hats.dmi'

/obj/item/clothing/head/helmet/f13/tribal
	name = "tribal power helmet"
	desc = "This power armor helmet was salvaged by savages from the battlefield.<br>They believe that these helmets capture the spirits of their fallen wearers, so they painted some runes on to give it a more sacred meaning."
	icon_state = "tribal"
	item_state = "tribal"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 30, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 10, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	strip_delay = 30

/obj/item/clothing/head/helmet/f13/motorcycle
	name = "motorcycle helmet"
	desc = "A type of helmet used by motorcycle riders.<br>The primary goal of a motorcycle helmet is motorcycle safety - to protect the rider's head during impact, thus preventing or reducing head injury and saving the rider's life."
	icon_state = "motorcycle"
	item_state = "motorcycle"
	flags_cover = HEADCOVERSEYES
	armor = list(melee = 30, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEHAIR
	strip_delay = 10

/obj/item/clothing/head/helmet/f13/firefighter
	name = "firefighter helmet"
	desc = "A firefighter's helmet worn on top of a fire-retardant covering and broken gas mask.<br>It smells heavily of sweat."
	icon_state = "firefighter"
	item_state = "firefighter"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 20, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 90, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	strip_delay = 30
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/helmet/f13/supaflyhelmet
	name = "supa-fly raider helmet"
	desc = "A makeshift raider helmet, made of leather.<br>It smells heavily of chems and sweat."
	icon_state = "supafly"
	item_state = "supafly"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 55, bullet = 5, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	strip_delay = 20

/obj/item/clothing/head/helmet/f13/yankee
	name = "yankee raider helmet"
	desc = "A long time ago, this belonged to a football player, now it belongs to the wasteland."
	icon_state = "yankee"
	item_state = "yankee"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 50, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	strip_delay = 30


/obj/item/clothing/head/helmet/f13/khan
	name = "Great Khan helmet"
	desc = "A piece of headwear commonly worn by the Great Khans that appears to resemble stereotypical traditional Mongolian helmets - likely adapted from a pre-War motorcycle helmet.<br>It is black with two horns on either side and a small spike jutting from the top, much like a pickelhaube.<br>A leather covering protects the wearer's neck and ears from sunburn."
	icon_state = "khan"
	item_state = "khan"
	armor = list(melee = 30, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	strip_delay = 20


/obj/item/clothing/head/helmet/f13/ranger/old
	name = "old ranger helmet"
	desc = "An old military helmet, commonly worn by Desert Rangers, that went through the fire and the flames, saving a single life amongst heavy bloodshed.<br>This particular helmet has a \"Forgive me mama\" inscription on the side."
	icon_state = "oldranger"
	item_state = "oldranger"
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 40, fire = 30, acid = 10)
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen

/obj/item/clothing/head/f13/strange
	name = "strange helmet"
	desc = "A very strange metal helmet...<br>I want to believe."
	icon = 'icons/fallout/clothing/hats.dmi'
	icon_state = "strange"
	item_state = "helmet"
	armor = list(melee = 40, bullet = 20, laser = 40, energy = 40, bomb = 20, bio = 100, rad = 50, fire = 90, acid = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	strip_delay = 50
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/helmet/f13/doom
	name = "marine helmet"
	desc = "A helmet made of an unknown alloy.<br>You feel like this helmet would allow you to survive through Hell on Mars... er, Earth."
	icon_state = "doom"
	item_state = "doom"
	armor = list(melee = 50, bullet = 40, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 100, fire = 100, acid = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	strip_delay = 10
	resistance_flags = UNACIDABLE

/obj/item/clothing/head/helmet/f13/magneto
	name = "magneto's helmet"
	desc = "This helmet allows its wearer to resist all but the strongest or most unexpected telepathic attacks.<br>This is achieved due to technology wired into the helmet itself."
	icon_state = "magneto"
	item_state = "magneto"
	armor = list(melee = 60, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 100, rad = 100, fire = 30, acid = 100)
	flags_inv = HIDEEARS|HIDEHAIR
	strip_delay = 50
	resistance_flags = UNACIDABLE

//Knights of the Apocalypse

/obj/item/clothing/head/helmet/knight
	name = "medieval helmet"
	desc = "A classic metal helmet worn by all ranks of knights and horsemen of the Old Era."
	icon_state = "knight_green"
	item_state = "knight_green"
	armor = list(melee = 40, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/head/helmet/knight/blue
	name = "blue medieval helmet"
	desc = "A classic metal helmet worn by all ranks of knights and horsemen of the Old Era.<br>This one is painted blue."
	icon_state = "knight_blue"
	item_state = "knight_blue"

/obj/item/clothing/head/helmet/knight/yellow
	name = "yellow medieval helmet"
	desc = "A classic metal helmet worn by all ranks of knights and horsemen of the Old Era.<br>This one is painted yellow."
	icon_state = "knight_yellow"
	item_state = "knight_yellow"

/obj/item/clothing/head/helmet/knight/red
	name = "red medieval helmet"
	desc = "A classic metal helmet worn by all ranks of knights and horsemen of the Old Era.<br>This one is painted red."
	icon_state = "knight_red"
	item_state = "knight_red"

/obj/item/clothing/head/helmet/knight/templar
	name = "crusader helmet"
	desc = "Deus Vult."
	icon_state = "knight_templar"
	item_state = "knight_templar"

/obj/item/clothing/head/helmet/knight/f13/metal
	name = "metal helmet"
	desc = "A metal helmet forged in fire.<br>Specially designed for the most fearsome and strongest warriors of the wasteland."
	icon_state = "metalhelmet"
	item_state = "metalhelmet"

/obj/item/clothing/head/helmet/knight/f13/rider
	name = "rider helmet" //Not raider. Rider.
	desc = "A fancy dark metal helmet with orange spray-painted flames."
	icon_state = "rider"
	item_state = "rider"