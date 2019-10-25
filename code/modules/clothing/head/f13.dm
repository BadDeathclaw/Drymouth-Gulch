//Fallout 13 protective helmets directory

/obj/item/clothing/head/helmet/f13
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
	armor = list(melee = 40, bullet = 25, laser = 15, energy = 10, bomb = 16, bio = 20, rad = 0, fire = 50, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	strip_delay = 20

/obj/item/clothing/head/helmet/f13/yankee
	name = "yankee raider helmet"
	desc = "A long time ago, this belonged to a football player, now it belongs to the wasteland."
	icon_state = "yankee"
	item_state = "yankee"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 40, bullet = 25, laser = 15, energy = 10, bomb = 16, bio = 20, rad = 0, fire = 50, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	strip_delay = 30

/obj/item/clothing/head/helmet/f13/fiend
	name = "fiend helmet"
	desc = "A leather cap cobbled together adorned with a bighorner skull, perfect for any drug-fueled frenzy."
	icon_state = "fiend"
	item_state = "fiend"
	armor = list("melee" = 40, "bullet" = 25, "laser" = 15, "energy" = 10, "bomb" = 16, "bio" = 20, "rad" = 0, "fire" = 50, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/helmet/f13/vaquerohat
	name = "vaquero hat"
	desc = "An old sombrero worn by Vaqueros to keep off the harsh sun."
	icon_state = "vaquerohat"
	item_state = "vaquerohat"
	armor = list("melee" = 10, "bullet" = 15, "laser" = 10, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0)

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
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 30, fire = 30, acid = 10)
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen

/obj/item/clothing/head/f13/strange
	name = "strange helmet"
	desc = "A very strange metal helmet...<br>I want to believe."
	icon = 'icons/fallout/clothing/hats.dmi'
	icon_state = "strange"
	item_state = "helmet"
	armor = list(melee = 40, bullet = 20, laser = 40, energy = 40, bomb = 20, bio = 100, rad = 40, fire = 90, acid = 100)
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

//Fallout 13 soft caps directory

/obj/item/clothing/head/soft/f13

/obj/item/clothing/head/soft/f13/baseball
	name = "baseball cap"
	desc = "A type of soft cap with a rounded crown and a stiff peak projecting out the front."
	icon_state = "baseball"
	item_color = "baseball"

/obj/item/clothing/head/soft/f13/enclave
	name = "officer hat"
	desc = "A standard-issue Enclave officer's cap."
	icon_state = "enclave"
	item_color = "enclave"

/obj/item/clothing/head/soft/f13/utility
	name = "grey utility cover"
	desc = "An eight-pointed hat, with a visor similar to a baseball cap, known as utility cover, also called the utility cap or eight-pointed cover."
	icon_state = "utility_g"
	item_color = "utility_g"

/obj/item/clothing/head/soft/f13/utility/navy
	name = "navy utility cover"
	icon_state = "utility_n"
	item_color = "utility_n"

/obj/item/clothing/head/soft/f13/utility/olive
	name = "olive utility cover"
	icon_state = "utility_o"
	item_color = "utility_o"

/obj/item/clothing/head/soft/f13/utility/tan
	name = "tan utility cover"
	icon_state = "utility_t"
	item_color = "utility_t"

/obj/item/clothing/head/f13

/obj/item/clothing/head/f13/safari //Referencing the Jebediah from Mad Max 3 1985
	name = "pith helmet"
	desc = "A lightweight, cloth-covered helmet made of pith.<br>Suitable for explorers or batshit crazy pilots."
	icon_state = "safari"
	item_state = "dethat"
	armor = list(melee = 40, bullet = 10, laser = 0, energy = 0, bomb = 20, bio = 0, rad = 0, fire = 30, acid = 0)

/obj/item/clothing/head/f13/chinese_soldier
	name = "chinese side cap"
	desc = "A foldable military cap with straight sides, with insignia of People's Liberation Army, that was supposedly worn by regular troops."
	icon_state = "chinese_s"
	item_state = "secsoft"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/chinese_officer
	name = "chinese side cap"
	desc = "A foldable military cap with straight sides, with insignia of People's Liberation Army, that was supposedly worn by low rank officers."
	icon_state = "chinese_o"
	item_state = "secsoft"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/chinese_commander
	name = "chinese peaked cap"
	desc = "A peaked cap of dark green in color with a red star on the frontside.<br>It obviously belonged to a high rank officer of People's Liberation Army."
	icon_state = "chinese_c"
	item_state = "fedora"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/stormchaser
	name = "stormchaser hat"
	desc = "Home, home on the wastes,<br>Where the mole rat and the fire gecko play.<br>Where seldom is heard a discouraging word,<br>And my skin is not glowing all day."
	icon_state = "stormchaser"
	item_state = "fedora"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/f13/headscarf
	name = "headscarf"
	desc = "A piece of cloth worn on head for a variety of purposes, such as protection of the head or hair from rain, wind, dirt, cold, warmth, for sanitation, for fashion, recognition or social distinction - with religious significance, to hide baldness, out of modesty, or other forms of social convention."
	icon_state = "headscarf"
	item_state = "dethat"
	flags_inv = HIDEMASK|HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/f13/pot
	name = "metal cooking pot"
	desc = "Step one: Start with the sauce.<br>Step two: Add the noodles.<br>Step three: Stir the pasta.<br>Step four: Turn up the heat.<br>Step five: Burn the house."
	icon_state = "pot"
	item_state = "fedora"
	force = 10
	hitsound = 'sound/items/trayhit1.ogg'
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/cowboy
	name = "cowboy hat"
	desc = "A high-crowned, wide-brimmed hat best known as the defining piece of attire for the North American cowboy."
	icon_state = "cowboy"
	item_state = "dethat"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/bandit
	name = "bandit hat"
	desc = "A black cowboy hat with a large brim that's curved to the sides.<br>A silver eagle pin is attached to the front."
	icon_state = "bandit"
	item_state = "fedora"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/gambler
	name = "gambler hat"
	desc = "A perfect hat for a ramblin' gamblin' man." //But I got to ramble (ramblin' man) //Oh I got to gamble (gamblin' man) //Got to got to ramble (ramblin' man) //I was born a ramblin' gamblin' man
	icon_state = "gambler"
	item_state = "dethat"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/general
	name = "general cap"
	desc = "A military peaked cap of dark green in color with a golden colored badge on the frontside.<br>The badge is inscripted with the words New California Republic."
	icon_state = "general"
	item_state = "fedora"
	flags_inv = HIDEHAIR
	armor = list(melee = 20, bullet = 20, laser = 0, energy = 0, bomb = 20, bio = 0, rad = 0, fire = 30, acid = 0)

//Fluff

/obj/item/clothing/head/f13/rastacap
	name = "rastacap"
	desc = "<font color='#157206'>Him haffi drop him fork and run,</font><br><font color='green'>Him can't stand up to Jah Jah son,</font><br><font color='#fd680e'>Him haffi lef' ya with him gun,</font><br><font color='red'>Dig off with him bomb.</font>"
	icon_state = "rastacap"
	item_state = "fedora"
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR
	cold_protection = HEAD //This tam brings the warm reggae and Jamaican sun with it.
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT

/obj/item/clothing/head/f13/fez
	name = "fez"
	desc = "Fezzes are cool!"
	icon_state = "fez"
	item_state = "secsoft"

/obj/item/clothing/head/f13/beaver
	name = "beaverkin"
	desc = "A hat made from felted beaver fur which makes the wearer feel both comfortable and elegant."
	icon_state = "beaver"
	item_state = "that"

/obj/item/clothing/head/f13/purple
	name = "purple top hat"
	desc = "You may not own the best jail in the observed Universe, or the best chocolate factory in the entire world, but at least you can try to have that purple top hat."
	icon_state = "ptophat"
	item_state = "that"

/obj/item/clothing/head/f13/det_hat_alt
	name = "detective's fedora"
	desc = "There's only one man who can sniff out the dirty stench of crime, and he's likely wearing this black hat."
	icon_state = "detectivealt"
	item_state = "fedora"
	flags_inv = HIDEHAIR
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)

/obj/item/clothing/head/f13/trilby
	name = "feather trilby"
	desc = "A sharp, stylish blue hat with a feather."
	icon_state = "trilby"
	item_state = "fedora"

/obj/item/clothing/head/f13/battlecruiser
	name = "captain's hat"
	desc = "The Yamato is loaded. And so am I."
	icon_state = "battlecruiser"
	item_state = "battlecruiser"
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)

//Fluff welding masks

/obj/item/clothing/head/welding/f13

/obj/item/clothing/head/welding/f13/fire
	name = "cremator welding helmet"
	desc = "A welding helmet with flames painted on it.<br>It sure is creepy but also badass."
	icon_state = "welding_fire"
	item_state = "welding"
	tint = 1
	armor = list(melee = 20, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 0, rad = 0, fire = 30, acid = 0)

/obj/item/clothing/head/welding/f13/japan
	name = "nippon welding helmet"
	desc = "Kojin no ato wo motomezu, kojin no motometaru no tokoro wo motome yo."
	icon_state = "welding_japan"
	item_state = "welding"
	tint = 1
	armor = list(melee = 40, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 30, acid = 0)

/obj/item/clothing/head/f13/town
	name = "town tricorn"
	desc = "Why are there tricorns in the desert again?"
	icon_state = "tricorn"
	item_state = "dethat"
	flags_inv = HIDEHAIR
	armor = list("melee" = 40, "bullet" = 30, "laser" = 20, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 30, "fire" = 80, "acid" = 0)

/obj/item/clothing/head/f13/town/mayor
	name = "mayoral tricorn"
	desc = "A tricorn in the desert.  Stranger things have happened."

/obj/item/clothing/head/f13/town/big
	name = "big hat"
	desc = "It's a big hat."
	icon_state = "bigcowboyhat"

/obj/item/clothing/head/f13/town/deputy
	name = "deputy hat"
	desc = "A black cowboy hat."
	icon_state = "deputyhat"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 25, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 35, "fire" = 80, "acid" = 0)

/obj/item/clothing/head/f13/town/sheriff
	name = "sheriff hat"
	desc = "A black cowboy hat with a snakeskin band."
	icon_state = "sheriffhat"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)