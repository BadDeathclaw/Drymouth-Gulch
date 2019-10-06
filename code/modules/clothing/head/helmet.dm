/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 25, "bullet" = 25, "laser" = 16,"energy" = 16, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
	strip_delay = 60
	resistance_flags = NONE
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEHAIR

	dog_fashion = /datum/dog_fashion/head/helmet

/obj/item/clothing/head/helmet/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_HEAD))

/obj/item/clothing/head/helmet/sec
	can_flashlight = 1

/obj/item/clothing/head/helmet/sec/attackby(obj/item/I, mob/user, params)
	if(issignaler(I))
		var/obj/item/assembly/signaler/S = I
		if(F) //Has a flashlight. Player must remove it, else it will be lost forever.
			to_chat(user, "<span class='warning'>The mounted flashlight is in the way, remove it first!</span>")
			return

		if(S.secured)
			qdel(S)
			var/obj/item/bot_assembly/secbot/A = new
			user.put_in_hands(A)
			to_chat(user, "<span class='notice'>You add the signaler to the helmet.</span>")
			qdel(src)
			return
	return ..()

/obj/item/clothing/head/helmet/alt
	name = "bulletproof helmet"
	desc = "A bulletproof combat helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "helmetalt"
	item_state = "helmetalt"
	armor = list("melee" = 25, "bullet" = 48, "laser" = 25, "energy" = 25, "bomb" = 48, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	can_flashlight = 1
	dog_fashion = null

/obj/item/clothing/head/helmet/old
	name = "degrading helmet"
	desc = "Standard issue security helmet. Due to degradation the helmet's visor obstructs the users ability to see long distances."
	tint = 2

/obj/item/clothing/head/helmet/blueshirt
	icon_state = "blueshift"
	item_state = "blueshift"

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	item_state = "helmet"
	toggle_message = "You pull the visor down on"
	alt_toggle_message = "You push the visor up on"
	can_toggle = 1
	armor = list("melee" = 60, "bullet" = 25, "laser" = 25,"energy" = 25, "bomb" = 25, "bio" = 2, "rad" = 0, "fire" = 50, "acid" = 50)
	flags_inv = HIDEEARS|HIDEFACE
	strip_delay = 80
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEFACE
	toggle_cooldown = 0
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	dog_fashion = null

/obj/item/clothing/head/helmet/attack_self(mob/user)
	if(can_toggle && !user.incapacitated())
		if(world.time > cooldown + toggle_cooldown)
			cooldown = world.time
			up = !up
			flags_1 ^= visor_flags
			flags_inv ^= visor_flags_inv
			flags_cover ^= visor_flags_cover
			icon_state = "[initial(icon_state)][up ? "up" : ""]"
			to_chat(user, "[up ? alt_toggle_message : toggle_message] \the [src]")

			user.update_inv_head()
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.head_update(src, forced = 1)

			if(active_sound)
				while(up)
					playsound(src.loc, "[active_sound]", 100, 0, 4)
					sleep(15)

/obj/item/clothing/head/helmet/justice
	name = "helmet of justice"
	desc = "WEEEEOOO. WEEEEEOOO. WEEEEOOOO."
	icon_state = "justice"
	toggle_message = "You turn off the lights on"
	alt_toggle_message = "You turn on the lights on"
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	can_toggle = 1
	toggle_cooldown = 20
	active_sound = 'sound/items/weeoo1.ogg'
	dog_fashion = null

/obj/item/clothing/head/helmet/justice/escape
	name = "alarm helmet"
	desc = "WEEEEOOO. WEEEEEOOO. STOP THAT MONKEY. WEEEOOOO."
	icon_state = "justice2"
	toggle_message = "You turn off the light on"
	alt_toggle_message = "You turn on the light on"

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "A robust and strong SWAT helmet, particularly good at defending against melee weapons."
	icon_state = "swatsyndie"
	item_state = "swatsyndie"
	armor = list("melee" = 60, "bullet" = 40, "laser" = 25,"energy" = 25, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 55, "acid" = 55)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/head/helmet/swat/nanotrasen
	name = "\improper SWAT helmet"
	desc = "An extremely robust, space-worthy helmet with the Nanotrasen logo emblazoned on the top."
	icon_state = "swat"
	item_state = "swat"

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	flags_inv = HIDEEARS|HIDEHAIR
	icon_state = "thunderdome"
	item_state = "thunderdome"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 25,"energy" = 10, "bomb" = 25, "bio" = 10, "rad" = 0, "fire" = 50, "acid" = 50)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/head/helmet/roman
	name = "roman helmet"
	desc = "An ancient helmet made of bronze and leather."
	flags_inv = HIDEEARS|HIDEHAIR
	flags_cover = HEADCOVERSEYES
	armor = list("melee" = 25, "bullet" = 0, "laser" = 25, "energy" = 10, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
	icon_state = "roman"
	item_state = "roman"
	strip_delay = 100
	dog_fashion = null

/obj/item/clothing/head/helmet/roman/fake
	desc = "An ancient helmet made of plastic and leather."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/helmet/roman/legionaire
	name = "roman legionaire helmet"
	desc = "An ancient helmet made of bronze and leather. Has a red crest on top of it."
	icon_state = "roman_c"
	item_state = "roman_c"

/obj/item/clothing/head/helmet/roman/legionaire/fake
	desc = "An ancient helmet made of plastic and leather. Has a red crest on top of it."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	item_state = "gladiator"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	flags_cover = HEADCOVERSEYES
	dog_fashion = null

/obj/item/clothing/head/helmet/redtaghelm
	name = "red laser tag helmet"
	desc = "They have chosen their own end."
	icon_state = "redtaghelm"
	flags_cover = HEADCOVERSEYES
	item_state = "redtaghelm"
	armor = list("melee" = 10, "bullet" = 16, "laser" = 25,"energy" = 25, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 50)
	// Offer about the same protection as a hardhat.
	dog_fashion = null

/obj/item/clothing/head/helmet/bluetaghelm
	name = "blue laser tag helmet"
	desc = "They'll need more men."
	icon_state = "bluetaghelm"
	flags_cover = HEADCOVERSEYES
	item_state = "bluetaghelm"
	armor = list("melee" = 10, "bullet" = 16, "laser" = 25,"energy" = 25, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 50)
	// Offer about the same protection as a hardhat.
	dog_fashion = null

/obj/item/clothing/head/helmet/knight
	name = "medieval helmet"
	desc = "A classic metal helmet."
	icon_state = "knight_green"
	item_state = "knight_green"
	armor = list("melee" = 60, "bullet" = 25, "laser" = 25,"energy" = 25, "bomb" = 25, "bio" = 2, "rad" = 0, "fire" = 0, "acid" = 50)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80
	dog_fashion = null


/obj/item/clothing/head/helmet/knight/Initialize(mapload)
	. = ..()
	var/datum/component = GetComponent(/datum/component/wearertargeting/earprotection)
	qdel(component)

/obj/item/clothing/head/helmet/knight/blue
	icon_state = "knight_blue"
	item_state = "knight_blue"

/obj/item/clothing/head/helmet/knight/yellow
	icon_state = "knight_yellow"
	item_state = "knight_yellow"

/obj/item/clothing/head/helmet/knight/red
	icon_state = "knight_red"
	item_state = "knight_red"

/obj/item/clothing/head/helmet/skull
	name = "skull helmet"
	desc = "An intimidating tribal helmet, it doesn't look very comfortable."
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	flags_cover = HEADCOVERSEYES
	armor = list("melee" = 40, "bullet" = 15, "laser" = 10, "energy" = 10, "bomb" = 25, "bio" = 5, "rad" = 20, "fire" = 40, "acid" = 20)
	icon_state = "skull"
	item_state = "skull"
	strip_delay = 100

/obj/item/clothing/head/helmet/durathread//F13: Needs numbers tuned and perhaps icon.
	name = "makeshift helmet"
	desc = "A hardhat with strips of leather and durathread for additional blunt protection."
	icon_state = "durathread"
	item_state = "durathread"
	armor = list("melee" = 25, "bullet" = 10, "laser" = 20,"energy" = 10, "bomb" = 30, "bio" = 15, "rad" = 20, "fire" = 100, "acid" = 50)
	strip_delay = 60

//Fallout 13
/obj/item/clothing/head/helmet/knight/fluff/metal
	name = "metal helmet"
	icon_state = "metalhelmet"
	item_state = "metalhelmet"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	armor = list("melee" = 40, "bullet" = 25, "laser" = 25, "energy" = 20, "bomb" = 16, "bio" = 0, "rad" = 0)

/obj/item/clothing/head/helmet/knight/fluff/rider
	name = "rider helmet" //Not raider. Rider.
	desc = "It's a fancy dark metal helmet with orange spray painted flames."
	icon_state = "rider"
	item_state = "rider"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/helmet/riot/vaultsec
	name = "security helmet"
	desc = "A standard issue vault security helmet, pretty robust."

//Remnants
/obj/item/clothing/head/donor/enclave
	name = "enclave forge cap"
	desc = "A resistant, black forage cap issued to Enclave soldiers."
	icon_state = "enclave_cap"
	item_state = "enclave_cap"
	armor = list("melee" = 10, "bullet" = 15, "laser" = 20, "energy" = 20, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0)

//Raider
/obj/item/clothing/head/helmet/f13/raider
	name = "supa-fly raider helmet"
	desc = "It's a makeshift raider helmet, made of leather. It heavily smells with chems and sweat."
	icon_state = "supafly"
	item_state = "supafly"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("melee" = 50, "bullet" = 20, "laser" = 10, "energy" = 10, "bomb" = 16, "bio" = 20, "rad" = 0, "fire" = 50, "acid" = 0)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/helmet/f13/raider/arclight
	name = "raider arclight helmet"
	desc = "This will protect you against flashes."
	icon_state = "arclight"
	item_state = "arclight"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("melee" = 40, "bullet" = 25, "laser" = 25, "energy" = 10, "bomb" = 16, "bio" = 30, "rad" = 0, "fire" = 40, "acid" = 0)

/obj/item/clothing/head/helmet/f13/raider/blastmaster
	name = "raider blastmaster helmet"
	icon_state = "blastmaster"
	item_state = "blastmaster"
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	armor = list("melee" = 30, "bullet" = 25, "laser" = 25, "energy" = 10, "bomb" = 60, "bio" = 30, "rad" = 0, "fire" = 70, "acid" = 0)

/obj/item/clothing/head/helmet/f13/raider/yankee
	name = "yankee raider helmet"
	desc = "Long time ago, it has belonged to a football player, now it belongs to wasteland."
	icon_state = "yankee"
	item_state = "yankee"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("melee" = 60, "bullet" = 10, "laser" = 10, "energy" = 0, "bomb" = 16, "bio" = 20, "rad" = 0, "fire" = 50, "acid" = 0)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/head/helmet/f13/eyebot
	name = "eyebot helmet"
	desc = "It is a dismantled eyebot, hollowed out to accommodate for a humanoid head."
	icon_state = "eyebot"
	item_state = "eyebot"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("melee" = 25, "bullet" = 25, "laser" = 16, "energy" = 16, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 20)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	strip_delay = 50
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
//Combat armor
/obj/item/clothing/head/helmet/f13
	icon_state = "helmet"
	item_state = "helmet"

/obj/item/clothing/head/helmet/f13/combat
	name = "combat helmet"
	desc = "An old military grade pre-war combat helmet."
	desc = "A pre-war ceramic and kevlar helmet designed to absorb kinetic impacts and stop projectiles from entering the users skull. Has the words BORN TO KILL written on the outside in chalk."
	icon_state = "combat_helmet"
	item_state = "combat_helmet"
	armor = list("melee" = 45, "bullet" = 30, "laser" = 30, "energy" = 60, "bomb" = 25, "bio" = 60, "rad" = 60, "fire" = 60, "acid" = 0)
	strip_delay = 50
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	flash_protect = 1
	tint = 0
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/combat/Initialize()
	. = ..()
	AddComponent(/datum/component/spraycan_paintable)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/f13/combat/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/head/helmet/f13/combat/mk2
	name = "reinforced combat helmet"
	desc = "An advanced pre-war titanium plated, ceramic coated, kevlar, padded helmet designed to withstand extreme punishment of all forms."
	icon_state = "combat_helmet_mk2"
	item_state = "combat_helmet_mk2"
	armor = list("melee" = 60, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 39, "bio" = 70, "rad" = 70, "fire" = 70, "acid" = 0)

/obj/item/clothing/head/helmet/f13/combat/brotherhood
	name = "brotherhood combat helmet"
	desc = "An improved combat helmet, seen commonly worn on initiates"
	icon_state = "brotherhood_helmet"
	item_state = "brotherhood_helmet"
	armor = list("melee" = 60, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 39, "bio" = 70, "rad" = 70, "fire" = 70, "acid" = 0)

/obj/item/clothing/head/helmet/f13/combat/enclave
	name = "enclave combat helmet"
	desc = "An intimidating helmet that is issued with it's corresponding suit."
	icon_state = "enclave_helmet"
	item_state = "enclave_helmet"
	armor = list("melee" = 50, "bullet" = 39, "laser" = 25, "energy" = 25, "bomb" = 39, "bio" = 0, "rad" = 50, "fire" = 0, "acid" = 20)

//Legion
/obj/item/clothing/head/helmet/f13/legion/legrecruit
	name = "legion recruit helmet"
	desc = "It's a leather legion recruit helmet."
	icon_state = "legrecruit"
	item_state = "legrecruit"
	armor = list("melee" = 40, "bullet" = 25, "laser" = 10, "energy" = 10, "bomb" = 16, "bio" = 30, "rad" = 20, "fire" = 50, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	strip_delay = 50
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/legion/legrecruit/legprime
	name = "legion prime helmet"
	desc = "A helmet belonging to a legion prime, it looks sturdier than a normal legion recruit helmet."
	item_state = "legprim"
	icon_state = "legprim"
	armor = list("melee" = 50, "bullet" = 35, "laser" = 15, "energy" = 15, "bomb" = 25, "bio" = 40, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/helmet/f13/legion/scout
	name = "legion scout hood"
	desc = "It's a leather hood worn by legion scouts."
	icon_state = "legscout"
	item_state = "legscout"
	armor = list("melee" = 40, "bullet" = 25, "laser" = 10, "energy" = 10, "bomb" = 16, "bio" = 30, "rad" = 20, "fire" = 50, "acid" = 0)

/obj/item/clothing/head/helmet/f13/legion/explorer
	name = "legion explorer hood"
	desc = "It's a leather hood worn by legion explorers. It looks carefully crafted and reinforced."
	icon_state = "legexplorer"
	item_state = "legexplorer"
	armor = list("melee" = 60, "bullet" = 40, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/head/helmet/f13/legion/legveteran
	name = "legion veteran helmet"
	desc = "It's a metal legion veteran helmet, looks pretty sturdy."
	icon_state = "legvet"
	item_state = "legvet"
	armor = list("melee" = 60, "bullet" = 40, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	strip_delay = 50
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/legion/legvexil
	name = "legion vexillarius helmet"
	desc = "It's leather legion vexillarius helmet."
	icon_state = "legvexil"
	item_state = "legvexil"
	armor = list("melee" = 60, "bullet" = 40, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 20, "fire" = 70, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	strip_delay = 50
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/legion/legdecan
	name = "legion recruit decanus helmet"
	desc = "It's a leather legion helmet that's been reinforced with stronger leather patches and anointed with a array of red and dark red feathers."
	icon_state = "legdecan"
	item_state = "legdecan"
	armor = list("melee" = 40, "bullet" = 25, "laser" = 10, "energy" = 10, "bomb" = 16, "bio" = 30, "rad" = 20, "fire" = 50, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	strip_delay = 50
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/legion/legdecan/vet/prime
	name = "legion prime decanus helmet"
	desc = "It's a leather legion helmet that's been reinforced with stronger leather patches and anointed with a array of red and dark red feathers. This one has a few small white feathers woven inside of it aswell."
	item_state = "legdecanprim"
	icon_state = "legdecanprim"
	armor = list("melee" = 50, "bullet" = 35, "laser" = 15, "energy" = 15, "bomb" = 25, "bio" = 40, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/helmet/f13/legion/legdecan/vet
	name = "legion veteran decanus helmet"
	desc = "It's a leather legion helmet that's been reinforced with stronger leather patches and anointed with a array of red and dark red feathers. This one has several large white and black feathers sewn along side the rest of the feathers aswell."
	icon_state = "legdecanvet"
	item_state = "legdecanvet"
	armor = list("melee" = 60, "bullet" = 40, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	strip_delay = 50
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/legion/legcenturion
	name = "legion centurion helmet"
	desc = "It's a large forged and case hardened bronze helmet with a steel insert around the skull and back of the neck. It has a large plume of red horse hair across the top of it going horizontally, symbolizing the position of a Centurion."
	icon_state = "legcenturion"
	item_state = "legcenturion"
	armor = list("melee" = 75, "bullet" = 50, "laser" = 35, "energy" = 35, "bomb" = 39, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	strip_delay = 50
	resistance_flags = LAVA_PROOF | FIRE_PROOF


/obj/item/clothing/head/helmet/f13/legion/leglegat
	name = "legion legate helmet"
	desc = "A custom forged steel full helmet complete with abstract points and arches. The face is extremely intimidating, as it was meant to be. This particular one was ordered to be forged by Caesar, given to his second legate in exchange for his undying loyalty to Caesar."
	icon_state = "leglegat"
	item_state = "leglegat"
	armor = list("melee" = 85, "bullet" = 60, "laser" = 40, "energy" = 40, "bomb" = 45, "bio" = 60, "rad" = 60, "fire" = 80, "acid" = 0)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	strip_delay = 50
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""


//Ranger Armors
/obj/item/clothing/head/helmet/f13/ncr/rangercombat
	name = "ranger combat helmet"
	desc = "An old combat helmet, out of use around the time of the war."
	icon_state = "ranger"
	item_state = "ranger"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 30, "energy" = 50, "bomb" = 39, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 50
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flash_protect = 1
	glass_colour_type = /datum/client_colour/glass_colour/red

/obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert
	name = "desert ranger combat helmet"
	desc = "An U.S Marine Corps helmet, used by the legendary Desert Rangers."
	icon_state = "desert_ranger"
	item_state = "desert_ranger"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 30, "energy" = 50, "bomb" = 39, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/f13/ncr/rangercombat/eliteriot
	name = "elite riot gear helmet"
	desc = "An old combat helmet seen in the divide, repurposed for higher ranking Rangers."
	icon_state = "elite_riot"
	item_state = "elite_riot"
	armor = list("melee" = 70, "bullet" = 60, "laser" = 40, "energy" = 60, "bomb" = 55, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 0)
	darkness_view = 128
	lighting_alpha = LIGHTING_PLANE_ALPHA_LOWLIGHT_VISION

//Metal masks
/obj/item/clothing/head/helmet/f13/metalmask
	name = "metal mask"
	desc = "A crudely formed metal hockey mask."
	icon_state = "metal_mask"
	item_state = "metal_mask"
	armor = list("melee" = 50, "bullet" = 35, "laser" = 35, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 60, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80

/obj/item/clothing/head/helmet/f13/metalmask/Initialize()
	. = ..()
	AddComponent(/datum/component/spraycan_paintable)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/f13/metalmask/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()


/obj/item/clothing/head/helmet/f13/metalmask/mk2
	name = "reflective metal mask"
	desc = "A reflective metal hockey mask."
	icon_state = "metal_mask2"
	item_state = "metal_mask2"
	armor = list("melee" = 50, "bullet" = 35, "laser" = 50, "energy" = 50, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 60, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80

/obj/item/clothing/head/helmet/f13/tesla
	name = "tesla helmet"
	desc = "A prewar armor design by Nikola Tesla before being confinscated by the U.S. government. Provides the high energy weapons resistance."
	icon_state = "tesla_helmet"
	item_state = "tesla_helmet"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 55, "energy" = 55, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)
	var/hit_reflect_chance = 70
	strip_delay = 10


/obj/item/clothing/head/helmet/f13/tesla/IsReflect(def_zone)
	if(!(def_zone in list("head"))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return 0
	if (prob(hit_reflect_chance))
		return 1

//Busted/salvaged power armor helmets, does not require PA training

/obj/item/clothing/head/helmet/f13/brokenpa
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	ispowerarmor = 1
	strip_delay = 200
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDEMASK
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	clothing_flags = THICKMATERIAL
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	flash_protect = 2
	tint = 0
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/brokenpa/t45d
	name = "broken T-45d power helmet"
	desc = "This power armor helmet is so decrepit and battle-worn that it have lost most of its capability to protect the wearer from harm, no longer acting as a power helmet it is no more than a heavy metal helmet."
	icon_state = "brokenhelmet"
	item_state = "brokenhelmet"
	armor = list("melee" = 50, "bullet" = 39, "laser" = 25, "energy" = 25, "bomb" = 39, "bio" = 0, "rad" = 50, "fire" = 0, "acid" = 0)
	flash_protect = 0

/obj/item/clothing/head/helmet/f13/brokenpa/t45b
	name = "broken T-45b power helmet"
	desc = "This power armor helmet is so decrepit and battle-worn that it have lost most of its capability to protect the wearer from harm, no longer acting as a power helmet it is no more than a heavy metal helmet."
	icon_state = "t45bhelmet"
	item_state = "t45bhelmet"
	armor = list("melee" = 50, "bullet" = 39, "laser" = 25, "energy" = 25, "bomb" = 39, "bio" = 0, "rad" = 50, "fire" = 0, "acid" = 0)
	flash_protect = 0

//Power armor helmets

/obj/item/clothing/head/helmet/power_armor
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	ispowerarmor = 1
	strip_delay = 200
	slowdown = 0.25
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDEMASK|HIDEJUMPSUIT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	clothing_flags = THICKMATERIAL
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	item_flags = SLOWS_WHILE_IN_HAND
	flash_protect = 2
	tint = 0
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	darkness_view = 128
	lighting_alpha = LIGHTING_PLANE_ALPHA_LOWLIGHT_VISION

/obj/item/clothing/head/helmet/power_armor/mob_can_equip(mob/user, mob/equipper, slot, disable_warning = 1)
	var/mob/living/carbon/human/H = user
	if(src == H.head) //Suit is already equipped
		return TRUE	
	if (!H.has_trait(TRAIT_PA_WEAR) && !istype(src, /obj/item/clothing/head/helmet/power_armor/t45b) && slot == SLOT_HEAD)
		to_chat(user, "<span class='warning'>You don't have the proper training to operate the power armor!</span>")
		return 0
	if(slot == SLOT_HEAD)
		return TRUE
	return 

/obj/item/clothing/head/helmet/power_armor/t45b
	name = "salvaged T-45b helmet"
	desc = "It's a salvaged power armor helmet."
	icon_state = "t45bhelmet"
	item_state = "t45bhelmet"
	slowdown = 0.75
	armor = list("melee" = 75, "bullet" = 60, "laser" = 30, "energy" = 50, "bomb" = 48, "bio" = 60, "rad" = 50, "fire" = 80, "acid" = 0)
	darkness_view = 0
	lighting_alpha = null

/obj/item/clothing/head/helmet/power_armor/advanced
	name = "advanced power helmet"
	desc = "It's an advanced power armor Mk I helmet, typically used by the Enclave. It looks somewhat threatening."
	icon_state = "advhelmet1"
	item_state = "advhelmet1"
	armor = list("melee" = 90, "bullet" = 75, "laser" = 60, "energy" = 75, "bomb" = 72, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/power_armor/advanced/mk2
	name = "advanced power helmet MK2"
	desc = "It's an improved model of advanced power armor used exclusively by the Enclave military forces, developed after the Great War.<br>Like its older brother, the standard advanced power armor, it's matte black with a menacing appearance, but with a few significant differences - it appears to be composed entirely of lightweight ceramic composites rather than the usual combination of metal and ceramic plates.<br>Additionally, like the T-51b power armor, it includes a recycling system that can convert human waste into drinkable water, and an air conditioning system for it's user's comfort."
	icon_state = "advhelmet2"
	item_state = "advhelmet2"
	armor = list("melee" = 95, "bullet" = 90, "laser" = 70, "energy" = 90, "bomb" = 72, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/power_armor/tesla
	name = "tesla power helmet"
	desc = "A helmet typically used by Enclave special forces.<br>There are three orange energy capacitors on the side."
	icon_state = "tesla"
	item_state = "tesla"
	armor = list("melee" = 90, "bullet" = 50, "laser" = 95, "energy" = 95, "bomb" = 62, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/power_armor/t51b
	name = "T-51b power helmet"
	desc = "It's a t51b power helmet, typically used by the Brotherhood. It looks somewhat charming."
	icon_state = "t51bhelmet"
	item_state = "t51bhelmet"
	armor = list("melee" = 80, "bullet" = 70, "laser" = 50, "energy" = 70, "bomb" = 62, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/power_armor/t45d
	name = "T-45d power helmet"
	desc = "It's an old pre-War power armor helmet. It's pretty hot inside of it."
	icon_state = "t45dhelmet"
	item_state = "t45dhelmet"
	armor = list("melee" = 75, "bullet" = 60, "laser" = 40, "energy" = 60, "bomb" = 62, "bio" = 100, "rad" = 90, "fire" = 90, "acid" = 0)
	var/brightness_on = 4 //luminosity when the light is on
	var/on = 0
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	dynamic_hair_suffix = ""


//LightToggle

/obj/item/clothing/head/helmet/update_icon()
	var/state = "[initial(icon_state)]"
	if(F)
		if(F.on)
			state += "-flight-on" //"helmet-flight-on" // "helmet-cam-flight-on"
		else
			state += "-flight" //etc.

	icon_state = state

	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.update_inv_head()

/obj/item/clothing/head/helmet/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_helmet_flashlight))
		toggle_helmlight()
	else
		..()

/obj/item/clothing/head/helmet/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/flashlight/seclite))
		var/obj/item/flashlight/seclite/S = I
		if(can_flashlight)
			if(!F)
				if(!user.transferItemToLoc(S, src))
					return
				to_chat(user, "<span class='notice'>You click [S] into place on [src].</span>")
				if(S.on)
					set_light(0)
				F = S
				update_icon()
				update_helmlight(user)
				verbs += /obj/item/clothing/head/helmet/proc/toggle_helmlight
				var/datum/action/A = new /datum/action/item_action/toggle_helmet_flashlight(src)
				if(loc == user)
					A.Grant(user)
		return

	if(istype(I, /obj/item/screwdriver))
		if(F)
			for(var/obj/item/flashlight/seclite/S in src)
				to_chat(user, "<span class='notice'>You unscrew the seclite from [src].</span>")
				F = null
				S.forceMove(user.drop_location())
				update_helmlight(user)
				S.update_brightness(user)
				update_icon()
				usr.update_inv_head()
				verbs -= /obj/item/clothing/head/helmet/proc/toggle_helmlight
			for(var/datum/action/item_action/toggle_helmet_flashlight/THL in actions)
				qdel(THL)
			return

	return ..()

/obj/item/clothing/head/helmet/proc/toggle_helmlight()
	set name = "Toggle Helmet Light"
	set category = "Object"
	set desc = "Click to toggle your helmet's attached flashlight."

	if(!F)
		return

	var/mob/user = usr
	if(user.incapacitated())
		return
	F.on = !F.on
	to_chat(user, "<span class='notice'>You toggle the helmetlight [F.on ? "on":"off"].</span>")

	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_helmlight(user)

/obj/item/clothing/head/helmet/proc/update_helmlight(mob/user = null)
	if(F)
		if(F.on)
			set_light(F.brightness_on)
		else
			set_light(0)
		update_icon()

	else
		set_light(0)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()
