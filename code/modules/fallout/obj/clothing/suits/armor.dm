//Fallout 13 general armor directory

/obj/item/clothing/suit/armor/f13
	icon = 'icons/fallout/clothing/suits.dmi'
	self_weight = 7.5

/obj/item/clothing/suit/armor/f13/cyberpunk
	name = "armored trenchcoat"
	desc = "A trenchcoat augmented with a special alloy for some protection and style."
	icon_state = "jensencoat"
	item_state = "jensencoat"
	flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(melee = 50, bullet = 10, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0, fire = 30, acid = 30)
	allowed = list(/obj/item/weapon/pen,/obj/item/weapon/paper,/obj/item/weapon/stamp,/obj/item/weapon/reagent_containers/food/drinks/flask,/obj/item/weapon/melee,/obj/item/weapon/storage/box/matches,/obj/item/weapon/lighter,/obj/item/clothing/mask/cigarette,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/device/flashlight,/obj/item/weapon/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	resistance_flags = UNACIDABLE
	put_on_delay = 10
	strip_delay = 30
	self_weight = 5

/obj/item/clothing/suit/armor/f13/doom
	name = "green chestplate"
	desc = "An odd green chestplate.<br>It's lightweight and strangely comfortable."
	icon_state = "praetor"
	item_state = "g_suit"
	body_parts_covered = CHEST
	armor = list(melee = 60, bullet = 40, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 100, fire = 100, acid = 100)
	resistance_flags = UNACIDABLE
	put_on_delay = 30
	strip_delay = 10
	self_weight = 10

/obj/item/clothing/suit/armor/f13/kit
	name = "makeshift armor kit"
	desc = "A bunch of armor parts that can be worn over the clothing to get the most basic protection against the dangers of wasteland.<br>This armor is unable to reflect laser beams and probably won't shield the wearer from a random bullet, but it's better than no any armor at all."
	icon_state = "armorkit"
	item_state = "armorkit"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 20, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	put_on_delay = 30
	strip_delay = 30
	self_weight = 2

/obj/item/clothing/suit/armor/f13/punk
	name = "armor kit"
	desc = "A couple of armor parts that can be worn over the clothing for moderate protection against the dangers of wasteland.<br>Do you feel lucky now? Well, do ya, punk?"
	icon_state = "punkit" //Punk it
	item_state = "punkit" //Pun kit
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 20, rad = 20, fire = 50, acid = 50)
	put_on_delay = 30
	strip_delay = 30
	self_weight = 2

/obj/item/clothing/suit/armor/f13/chestplate
	name = "metal chestplate"
	desc = "When equipped, the owner takes significantly less damage from attacks to the chest.<br>It's heavy and uncomfortable, though."
	icon_state = "metal_chestplate"
	item_state = "metal_chestplate"
	body_parts_covered = CHEST
	armor = list(melee = 40, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)
	put_on_delay = 30
	strip_delay = 10
	resistance_flags = FIRE_PROOF
	self_weight = 5

/obj/item/clothing/suit/armor/f13/tribal
	name = "tribal armor"
	desc = "A set of armor made of gecko hides.<br>It's pretty good for makeshift armor."
	icon_state = "tribal"
	item_state = "tribal"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 30, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 10, acid = 0)
	flags_inv = HIDEJUMPSUIT
	put_on_delay = 40
	strip_delay = 40
	self_weight = 3

/obj/item/clothing/suit/armor/f13/slam
	name = "slammer raider armor"
	desc = "Crude armor that appears to employ a tire of some kind as the shoulder pad. What appears to be a quilt is tied around the waist.<br>Come on and slam and turn your foes to jam!"
	icon_state = "slam"
	item_state = "slam"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEJUMPSUIT
	put_on_delay = 20
	strip_delay = 40
	self_weight = 4

/obj/item/clothing/suit/armor/f13/supafly
	name = "supa-fly raider armor"
	desc = "Fabulous mutant powers were revealed to me the day I held aloft my bumper sword and said...<br>BY THE POWER OF NUKA-COLA, I AM RAIDER MAN!"
	icon_state = "supafly"
	item_state = "supafly"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 55, bullet = 5, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEJUMPSUIT
	put_on_delay = 20
	strip_delay = 40
	self_weight = 3

/obj/item/clothing/suit/armor/f13/yankee
	name = "yankee raider armor"
	desc = "A set of armor made from football player protective wear. Together we play."
	icon_state = "yankee"
	item_state = "yankee"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 50, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 10, acid = 0)
	flags_inv = HIDEJUMPSUIT
	put_on_delay = 40
	strip_delay = 40
	self_weight = 5

/obj/item/clothing/suit/armor/f13/leatherarmor
	name = "leather armor"
	desc = "A set of light armor made of boiled brahmin leather.<br>It should protect against the average 9mm peashooter, but anything higher caliber will punch through it like butter."
	icon_state = "leatherarmor"
	item_state = "leatherarmor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 40, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEJUMPSUIT
	put_on_delay = 40
	strip_delay = 40
	self_weight = 5

/obj/item/clothing/suit/armor/f13/metalarmor
	name = "metal armor"
	desc = "A set of hand-crafted metal armor created from a variety of scrap pieces attached to a black leather base layer."
	icon_state = "metalarmor"
	item_state = "metalarmor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 40, bullet = 30, laser = 20, energy = 20, bomb = 30, bio = 0, rad = 0, fire = 10, acid = 0)
	flags_inv = HIDEJUMPSUIT
	put_on_delay = 60
	strip_delay = 60
	resistance_flags = FIRE_PROOF
	self_weight = 10

/obj/item/clothing/suit/armor/f13/bmetalarmor
	name = "black metal armor"
	desc = "A set of sturdy metal armor made from various bits of scrap metal. It looks like it might impair movement."
	icon_state = "bmetalarmor"
	item_state = "bmetalarmor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 50, bullet = 40, laser = 30, energy = 30, bomb = 40, bio = 0, rad = 0, fire = 20, acid = 0)
	flags_inv = HIDEJUMPSUIT
	put_on_delay = 60
	strip_delay = 60
	resistance_flags = FIRE_PROOF
	self_weight = 15

/obj/item/clothing/suit/armor/f13/legrecruit
	name = "recruit armor"
	desc = "Legion recruit armor is common light armor, supplied to recruit legionaries and to recruit decanus units.<br>Like most of the Caesar's Legion armor, it is made of repurposed sports equipment, consisting of a football player's protective shoulder and chest pads reinforced with additional leather padding and worn over a baseball catcher's vest."
	icon_state = "legrecruit"
	item_state = "legrecruit"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	armor = list(melee = 30, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 10)
	put_on_delay = 60
	strip_delay = 60
	self_weight = 5

/obj/item/clothing/suit/armor/f13/legvexil
	name = "vexillarius armor"
	desc = "The armor appears to be based on a suit of Caesar's Legion veteran armor, with the addition of circular metal plates attached to the torso, as well as a banner displaying the emblem of the Legion worn on the back."
	icon_state = "legvexil"
	item_state = "legvexil"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	armor = list(melee = 40, bullet = 30, laser = 10, energy = 10, bomb = 30, bio = 0, rad = 0, fire = 10, acid = 20)
	put_on_delay = 60
	strip_delay = 60
	self_weight = 5

/obj/item/clothing/suit/armor/f13/legcenturion
	name = "centurion armor"
	desc = "The Legion centurion armor is by far the strongest suit of armor available to Caesar's Legion soldiers.<br>The armor is composed from various pieces of armor taken from that of the wearer's defeated opponents in combat."
	icon_state = "legcenturion"
	item_state = "legcenturion"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 50, bullet = 30, laser = 20, energy = 20, bomb = 30, bio = 0, rad = 30, fire = 30, acid = 30)
	put_on_delay = 60
	strip_delay = 60
	self_weight = 10

/obj/item/clothing/suit/armor/f13/leglegate
	name = "legate armor"
	desc = "The armor appears to be a full suit of heavy-gauge steel and offers full body protection.<br>The armor itself bears numerous battle scars.<br>The Legate's suit appears originally crafted, in contrast to other Legion armor which consists of repurposed pre-War sports equipment."
	icon_state = "leglegate"
	item_state = "leglegate"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 60, bullet = 40, laser = 30, energy = 30, bomb = 40, bio = 0, rad = 40, fire = 40, acid = 40)
	put_on_delay = 60
	strip_delay = 60
	resistance_flags = FIRE_PROOF
	self_weight = 15

/obj/item/clothing/suit/armor/f13/combat_mk1
	name = "reinforced combat armor mark I"
	desc = "An advanced and expensive pre-War model of combat armor made of complex alloys.<br>It was common for all types of troops before the implementation of reinforced combat armor mark II"
	icon_state = "combat_mk1"
	item_state = "combat_mk1"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	armor = list(melee = 55, bullet = 55, laser = 15, energy = 15, bomb = 30, bio = 0, rad = 0, fire = 10, acid = 40)
	put_on_delay = 60
	strip_delay = 60
	resistance_flags = FIRE_PROOF
	self_weight = 10

/obj/item/clothing/suit/armor/f13/combat_mk2
	name = "reinforced combat armor mark II"
	desc = "An improved version of pre-War reinforced combat armor - designed to replace it, this high tech suit was created as a lightweight, more protective set reserved for use by American shock troops and special forces."
	icon_state = "combat_mk2"
	item_state = "combat_mk2"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	armor = list(melee = 75, bullet = 70, laser = 25, energy = 25, bomb = 40, bio = 0, rad = 0, fire = 30, acid = 40)
	put_on_delay = 60
	strip_delay = 60
	resistance_flags = FIRE_PROOF
	self_weight = 5

/obj/item/clothing/suit/armor/f13/ncr
	name = "trooper armor"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons, and gauntlets. Worn by NCR troops in combat environments.<br>It's attached via leather straps and buckles."
	icon_state = "ncr_armor1"
	item_state = "ncr_armor1"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 30, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 10, fire = 10, acid = 10)
	put_on_delay = 50
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 5

/obj/item/clothing/suit/armor/f13/ncr/soldier
	name = "standard issue trooper armor"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons, and gauntlets, worn by NCR soldiers in combat environments.<br>This one has had its breastplate emblazoned with the emblem of the NCR, that has slightly faded over time."
	icon_state = "ncr_armor2"
	item_state = "ncr_armor2"

/obj/item/clothing/suit/armor/f13/ncr/patriot
	name = "trooper armor of \"Patriot\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR patriots in combat environments.<br>This one has a five-pointed star painted over the chestplate with white paint - it must be a battalion insignia."
	icon_state = "ncr_armor3"
	item_state = "ncr_armor3"

/obj/item/clothing/suit/armor/f13/ncr/commie
	name = "trooper armor of \"Commie\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR comrades in combat environments.<br>This one has a five-pointed star painted over the chestplate with red paint - it must be a battalion insignia."
	icon_state = "ncr_armor4"
	item_state = "ncr_armor4"

/obj/item/clothing/suit/armor/f13/ncr/preacher
	name = "trooper armor of \"Preacher\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR zealots in combat environments.<br>This one has a holy cross painted over the chestplate with yellow paint - it must be a battalion insignia."
	icon_state = "ncr_armor5"
	item_state = "ncr_armor5"

/obj/item/clothing/suit/armor/f13/ncr/lover
	name = "trooper armor of \"Lover\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR lovers in combat environments.<br>This one has a heart symbol painted over the chestplate with pink paint - it must be a battalion insignia."
	icon_state = "ncr_armor6"
	item_state = "ncr_armor6"

/obj/item/clothing/suit/armor/f13/ncr/stalker //Cheeki breeki i v damke !!!
	name = "trooper armor of \"Stalker\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR explorers in combat environments.<br>This one has a radiation symbol painted over the chestplate with yellow paint - it must be a battalion insignia."
	icon_state = "ncr_armor7"
	item_state = "ncr_armor7"

/obj/item/clothing/suit/armor/f13/ncr/punisher
	name = "trooper armor of \"Punisher\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR heroes and villains in combat environments.<br>This one has a skull symbol painted over the chestplate with white paint - it must be a battalion insignia."
	icon_state = "ncr_armor8"
	item_state = "ncr_armor8"

/obj/item/clothing/suit/armor/f13/ncr/facewrap
	name = "face wrap armor"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR scouts in combat environments.<br>This one has the facewrap, designed to be pulled over the user's face to protect oneself from dust particles and other mainly radioactive elements."
	icon_state = "ncr_armor9"
	item_state = "ncr_armor9"
	self_weight = 6
	armor = list(melee = 30, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 50, fire = 10, acid = 10) //Better radiation protection, thank the facewrap bro!

/obj/item/clothing/suit/armor/f13/sergeant
	name = "ranger patrol armor"
	desc = "Military-grade combat armor designed to protect key sections of the human body from ballistic trauma with hard armored plates made from complex polymers and ceramics, with a flexible body suit interwoven with thermal-dissipative membranes and bulletproof material.<br>It has a matte-finish olive drab coloring by default, making it suitable for woodland and/or urban camouflage."
	icon_state = "sergeant"
	item_state = "sergeant"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 50, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 0, rad = 50, fire = 30, acid = 30)
	put_on_delay = 40
	strip_delay = 40
	resistance_flags = FIRE_PROOF
	self_weight = 7

/obj/item/clothing/suit/armor/f13/rangercombat
	name = "veteran ranger trenchcoat"
	desc = "An armored leather trenchcoat - the traditional uniform of the Desert Rangers."
	icon_state = "ranger"
	item_state = "ranger"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 50, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 0, rad = 50, fire = 30, acid = 30)
	put_on_delay = 20
	strip_delay = 20
	self_weight = 2
	allowed = list(/obj/item/weapon/gun/ballistic/revolver)

/obj/item/clothing/suit/armor/f13/rangercombat/old
	name = "worn veteran ranger combat armor"
	desc = "A unique armor, that has been in countless battles and caused much bloodshed."
	icon_state = "oldranger"
	item_state = "oldranger"
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 40, fire = 20, acid = 20)
	self_weight = 2

/obj/item/clothing/suit/armor/f13/battlecoat //Maxson's battlecoat from Fallout 4
	name = "battlecoat"
	desc = "A heavy padded leather coat, worn by pre-War bomber pilots in the past and post-War zeppelin pilots in the future."
	icon_state = "battlecoat"
	item_state = "battlecoat"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 50, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 0, rad = 50, fire = 30, acid = 30)
	put_on_delay = 20
	strip_delay = 30
	self_weight = 2
	allowed = list(/obj/item/weapon/gun/ballistic/revolver)

/obj/item/clothing/suit/armor/f13/power_armor
	w_class = WEIGHT_CLASS_HUGE
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	flags = STOPSPRESSUREDMAGE
	flags_inv = HIDEJUMPSUIT
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	put_on_delay = 100
	strip_delay = 200
	resistance_flags = FIRE_PROOF | UNACIDABLE
	self_weight = 35
	obj_integrity = 20000
	max_integrity = 20000

/obj/item/clothing/suit/armor/f13/power_armor/mob_can_equip(mob/M, mob/equipper, slot, disable_warning = 0)
	if(!ishuman(M))
		return 0
	var/mob/living/carbon/human/H = M
	if(!istype(H.w_uniform, /obj/item/clothing/under/f13/recon))
		if(equipper)
			to_chat(equipper, "<span class='notice'>[M] must be equipped to recon armor.</span>")
		else
			to_chat(equipper, "<span class='notice'>You must be equipped to recon armor.</span>")
		return 0
	return ..()

/obj/item/clothing/suit/armor/f13/power_armor/ncr
	name = "salvaged power armor"
	desc = "A set of T-45d power armor recovered by the NCR during the NCR-Brotherhood War.<br>NCR technicians have restored it to working order by replacing the back-mounted cylinders with a custom air conditioning module and stripping out the joint servomotors.<br>Due to the lack of servomotors in the limbs, this armor is so heavy that it feels like you're carrying a brahmin on your back!"
	icon_state = "t45bpowerarmor"
	item_state = "t45bpowerarmor"
	armor = list(melee = 50, bullet = 30, laser = 20, energy = 20, bomb = 30, bio = 80, rad = 40, fire = 30, acid = 30)

/obj/item/clothing/suit/armor/f13/power_armor/t45d
	name = "T-45d power armor"
	desc = "Originally developed and manufactured for the United States Army by American defense contractor West Tek, the T-45d power armor was the first version of power armor to be successfully deployed in battle."
	icon_state = "t45dpowerarmor"
	item_state = "t45dpowerarmor"
	armor = list(melee = 65, bullet = 65, laser = 40, energy = 15, bomb = 60, bio = 100, rad = 100, fire = 100, acid = 100)
	self_weight = 30

/obj/item/clothing/suit/armor/f13/power_armor/t51b
	name = "T-51b power armor"
	desc = "A mass-produced pinnacle of pre-War engineering.<br>Developed in the laboratories of the West Tek Research Facility, the T-51b was deployed at the end of the Anchorage Reclamation, and by January 2077, the armor had become standard issue for American soldiers in the Army's Mechanized Cavalry Regiments."
	icon_state = "t51bpowerarmor"
	item_state = "t51bpowerarmor"
	armor = list(melee = 65, bullet = 65, laser = 50, energy = 20, bomb = 70, bio = 100, rad = 100, fire = 100, acid = 100)
	self_weight = 20

/obj/item/clothing/suit/armor/f13/power_armor/t60
	name = "T-60 power armor"
	desc = "Developed in early 2077 after the Anchorage Reclamation, the T-60 series of power armor was designed to eventually replace the T-51b power armor as the pinnacle of powered armor technology in the U.S. military arsenal.<br>Incorporating design elements from the earlier T-45, the T-60 was deployed domestically among U.S. Army units just prior to the dropping of the bombs."
	icon_state = "t60powerarmor"
	item_state = "t60powerarmor"
	armor = list(melee = 70, bullet = 65, laser = 55, energy = 40, bomb = 80, bio = 100, rad = 100, fire = 100, acid = 100)
	self_weight = 25

/obj/item/clothing/suit/armor/f13/power_armor/advanced
	name = "advanced power armor mark I"
	desc = "An advanced suit of armor typically used by the Enclave.<br>It is composed of lightweight metal alloys, reinforced with ceramic castings at key stress points.<br>Additionally, like the T-51b power armor, it includes a recycling system that can convert human waste into drinkable water, and an air conditioning system for it's user's comfort."
	icon_state = "advanced"
	item_state = "advanced"
	armor = list(melee = 50, bullet = 50, laser = 60, energy = 40, bomb = 50, bio = 100, rad = 100, fire = 100, acid = 100)
	self_weight = 15

/obj/item/clothing/suit/armor/f13/power_armor/tesla
	name = "tesla power armor"
	desc = "A variant of the Enclave's advanced power armor Mk I, jury-rigged with a Tesla device that is capable of dispersing a large percentage of the damage done by directed-energy attacks.<br>As it's made of complex composite materials designed to block most of energy damage - it's notably weaker against kinetic impacts."
	icon_state = "tesla"
	item_state = "tesla"
	armor = list(melee = 30, bullet = 30, laser = 80, energy = 80, bomb = 30, bio = 100, rad = 100, fire = 100, acid = 100)
	self_weight = 10

/obj/item/clothing/suit/armor/f13/power_armor/superadvanced
	name = "advanced power armor mark II"
	desc = "An improved model of advanced power armor used exclusively by the Enclave military forces, developed after the Great War.<br>Like its older brother, the standard advanced power armor, it's matte black with a menacing appearance, but with a few significant differences - it appears to be composed entirely of lightweight ceramic composites rather than the usual combination of metal and ceramic plates.<br>Additionally, like the T-51b power armor, it includes a recycling system that can convert human waste into drinkable water, and an air conditioning system for it's user's comfort."
	icon_state = "superadvanced"
	item_state = "superadvanced"
	armor = list(melee = 55, bullet = 60, laser = 60, energy = 50, bomb = 60, bio = 100, rad = 100, fire = 100, acid = 100)
	self_weight = 10

/obj/item/clothing/suit/armor/f13/power_armor/shocktrooper
	name = "shocktrooper power armor"
	desc = "A \"Black Devil\" power armor - a high-end model used exclusively by the Enclave's Department of the Army and developed after the Great War and the destruction of the Enclave Oil Rig in 2241.<br>It is composed entirely of lightweight composites rather than the usual combination of metal and composite plates found on the previous designations of advanced power armor, the mark I and II."
	icon_state = "shocktrooper"
	item_state = "shocktrooper"
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 70, bio = 100, rad = 100, fire = 100, acid = 100)
	self_weight = 10

/obj/item/clothing/suit/armor/f13/power_armor/badmin
	name = "advanced power armor Mk III"
	desc = "A group of Enclave mad scientists lead by Administrator Badmin, have spent a decade working on the super weapon you see in front of you."
	icon_state = "badmin"
	item_state = "badmin"
	armor = list(melee = 90, bullet = 80, laser = 80, energy = 80, bomb = 80, bio = 100, rad = 100, fire = 50, acid = 100) //Burn baby, burn!
	self_weight = 1

//Knights of the Apocalypse

/obj/item/clothing/suit/armor/riot/knight
	name = "plate armour"
	desc = "A classic suit of plate armour, highly effective at stopping melee attacks."
	icon_state = "knight_green"
	item_state = "knight_green"
	self_weight = 40

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