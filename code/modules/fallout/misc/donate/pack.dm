//Fallout 13 contributor packs directory

/datum/content_pack
	var
		name = "What?"
		id = "shit"
		desc = "Something is wrong! Maybe you already have this content pack?"
		list/items = list()
		list/sorted_items = list()
		list/roles = list()
		list/pets = list()
		price = 99999
	proc
		on_set(client/client)
			return 1
		generate_sorted_list() //
			sorted_items["weapon"] = list()
			sorted_items["misc"] = list()
			sorted_items["head"] = list()
			sorted_items["armor"] = list()
			sorted_items["gloves"] = list()
			sorted_items["shoes"] = list()
			sorted_items["uniform"] = list()
		sort_items()
			for(var/item in items)
				if(get_var_from_type(item, "w_class") < WEIGHT_CLASS_NORMAL)
					sorted_items["misc"] |= item
				sorted_items[slot_name_by_type(item)] |= item
	New()
		. = ..()
		if(!items.len)
			return .
		generate_sorted_list()
		sort_items()


/datum/content_pack/starter
	name = "Starter"
	id = "starter"
	desc = "<b>Available to: All factions!</b><br>Everyone has these vital items, for free!<br><i>Note: All roles have listed weapons and items that go to pocket slots. Although, some roles have certain clothing items disabled by default to preserve the general role stylistics. Settler role has it all.</i>"
	items = list(
		/obj/item/clothing/shoes/f13/rag,
		// Hats
		/obj/item/clothing/head/f13/headscarf,
		/obj/item/clothing/head/f13/pot,
		// Goggles
		/obj/item/clothing/glasses/regular,
		// Uniforms
		/obj/item/clothing/under/pants/f13/ghoul,
		/obj/item/clothing/under/pants/f13/cloth,
		/obj/item/clothing/under/pants/f13/caravan,
		/obj/item/clothing/under/f13/rag,
		/obj/item/clothing/under/f13/tribal,
		/obj/item/clothing/under/f13/female/tribal,
		/obj/item/clothing/under/f13/settler,
		/obj/item/clothing/under/f13/brahmin,
		/obj/item/clothing/under/f13/female/brahmin,
		/obj/item/clothing/under/f13/worn,
		// Suits
		/obj/item/clothing/suit/f13/mantle_liz,
		// Items
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival,
		/obj/item/weapon/dice/d6,
		/obj/item/toy/cards/deck,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/fancy/cigarettes/tortoise,
		/obj/item/weapon/storage/box/matches,
		/obj/item/device/flashlight/torch,
		// Weapons
		/obj/item/weapon/pipe,
		/obj/item/weapon/tireiron,
		/obj/item/weapon/pan,
		/obj/item/weapon/kitchen/rollingpin,
		/obj/item/weapon/kitchen/knife,
		/obj/item/weapon/kitchen/knife/butcher,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/shovel,
		/obj/item/weapon/hammer,
		/obj/item/weapon/crowbar,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/wrench,
		/obj/item/weapon/weldingtool/experimental,
		/obj/item/weapon/restraints/legcuffs/bola
		)
	price = -1

/datum/content_pack/cigarettes
	name = "Cigarettes for Lead Developer"
	id = "cigarettes"
	desc = "<b>Available to: All factions!</b><br>The most simple way to encourage the Lead Developer - Jackerzz aka Maxyo, is to get him a pack of cigarettes.<br>...<br><i>Note: World Health Organization discourages you from smoking. Inhaling any kind of smoke is bad for your health!</i>"
	items = list(
		/obj/item/weapon/storage/fancy/rollingpapers,
		/obj/item/weapon/storage/fancy/cigarettes/cigpack_myron,
		/obj/item/weapon/storage/fancy/cigarettes/cigpack_joy,
		/obj/item/clothing/mask/cigarette,
		/obj/item/clothing/mask/cigarette/rollie,
		/obj/item/clothing/mask/cigarette/cigar,
		/obj/item/clothing/mask/cigarette/cigar/cohiba,
		/obj/item/clothing/mask/cigarette/cigar/havana,
		/obj/item/weapon/lighter
		)
	price = 60

/datum/content_pack/team_fortress
	name = "Hat simulator"
	id = "team_fortress"
	desc = "<b>Available to: Neutral, City and Raider factions only!</b><br>Experience power of Fallout 13 with our accurately developed hat simulation system.<br>This set includes five additional hats!"
	items = list(
		/obj/item/clothing/head/soft/f13/baseball,
		/obj/item/clothing/head/soft/f13/utility,
		/obj/item/clothing/head/f13/cowboy,
		/obj/item/clothing/head/f13/bandit,
		/obj/item/clothing/head/f13/stormchaser,
		/obj/item/clothing/head/f13/gambler
		)
	price = 60

/datum/content_pack/wardrobe
	name = "High fashion"
	id = "wardrobe"
	desc = "<b>Available to: Neutral and City factions only!</b><br>Got tired of your character looking like a homeless junkie?<br>This pack was created specially for you - wasteland fashion collection of year 2255 !<br>This set inludes a pair of worn but sturdy work boots, and seven additional outfits that provide considerable diversity in character creation.<br><i>Note: A dark red wasteland wanderer jacket can be zipped up as well.</i>"
	items = list(
		/obj/item/clothing/shoes/f13/explorer,
		// Uniforms
		/obj/item/clothing/under/f13/relaxedwear,
		/obj/item/clothing/under/f13/spring,
		/obj/item/clothing/under/f13/merchant,
		/obj/item/clothing/under/f13/trader,
		/obj/item/clothing/under/f13/caravaneer,
		/obj/item/clothing/under/f13/petrochico,
		/obj/item/clothing/under/f13/mechanic,
		/obj/item/clothing/under/f13/lumberjack,
		/obj/item/clothing/under/f13/machinist,
		// Suits
		/obj/item/clothing/suit/f13/puffer,
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer
		)
	price = 120

/datum/content_pack/vault13
	name = "Vault 13"
	id = "vault13"
	desc = "<b>Available to: Neutral, City and Raider factions only!</b><br>Vault 13 has opened long time ago, now you can try and pretend your relatives actually lived there, or explain that you got frozen in time somehow - that's why items you got, look so pristine.</i>"
	items = list(
		/obj/item/clothing/under/f13/vault/v13,
		/obj/item/weapon/reagent_containers/food/drinks/flask/vault13,
		/obj/item/weapon/lighter/vault13
		)
	price = 120

/datum/content_pack/bard
	name = "Musical instruments"
	id = "bard"
	desc = "<b>Available to: All factions!</b><br>Russian General says, :<br><i>\"I do not like rock-and-roll music. This is too loud! I like folk music, soft, nice music, huh? Polka, waltz, anything!\"</i><br><b>Six String Samurai (1998)</b>"
	items = list(
		/obj/item/device/harmonica,
		/obj/item/device/instrument/guitar
		)
	price = 180

/datum/content_pack/trooper_armor
	name = "Batallion themed NCR armor"
	id = "trooper_armor"
	desc = "<b>Available to: NCR Trooper and NCR Sergeant roles only!</b><br>Form a strike squad with your friends, wearing the matching NCR armor sets!<br>This set includes six additional trooper armor skins:<br>White star insignia<br>Red star insignia<br>Holy cross insignia<br>Hear symbol insignia<br>Radiation symbol insignia<br>White skull insignia"
	items = list(
		/obj/item/clothing/suit/armor/f13/ncr/patriot,
		/obj/item/clothing/suit/armor/f13/ncr/commie,
		/obj/item/clothing/suit/armor/f13/ncr/preacher,
		/obj/item/clothing/suit/armor/f13/ncr/lover,
		/obj/item/clothing/suit/armor/f13/ncr/stalker,
		/obj/item/clothing/suit/armor/f13/ncr/punisher
		)
	price = 60

/datum/content_pack/heavy_trooper
	name = "NCR Heavy Infantry Corps"
	id = "heavy_trooper"
	desc = "<b>Available to: NCR Trooper and NCR Sergeant roles only!</b><br>Become the NCR Heavy Trooper with a set of NCR salvaged power armor and a big gun!"
	items = list(
		/obj/item/clothing/head/helmet/power_armor/ncr,
		/obj/item/clothing/suit/armor/f13/power_armor/ncr,
		/obj/item/weapon/twohanded/largehammer,
		/obj/item/weapon/gun/ballistic/automatic/rifle,
		/obj/item/ammo_box/magazine/m308
		)
	price = 180

/datum/content_pack/tesla
	name = "Enclave Tesla Regiment"
	id = "tesla"
	desc = "<b>Available to: Enclave faction only!</b><br>Become the Tesla Trooper with a set of badass tesla power armor!<br><i>Note: Tesla weapons do not apply to this pack (yet).</i>"
	items = list(
		/obj/item/clothing/head/helmet/power_armor/tesla,
		/obj/item/clothing/suit/armor/f13/power_armor/tesla
		)
	price = 180

/datum/content_pack/khan
	name = "Great Khan"
	id = "khan"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>The glory of the Great Khans will be restored with this themed outfit set!<br>Or you can use this tribal spear to effectively defend yourself against a wildlife, at the start of the game.<br><i>Note: Great Khan jacket can be zipped up as well.</i>"
	items = list(
		/obj/item/clothing/head/helmet/f13/khan,
		/obj/item/clothing/suit/toggle/labcoat/f13/khan,
		/obj/item/clothing/under/pants/f13/khan,
		/obj/item/clothing/shoes/f13/khan,
		/obj/item/weapon/twohanded/tribal_spear,
		/obj/item/weapon/restraints/legcuffs/bola/tribal
		)
	price = 180

/datum/content_pack/super_ten
	name = "Super 10"
	id = "super_ten"
	desc = "<b>Available to: All factions!</b><br>Pay-to-win pack of 10mm guns and a powerful 10 iron club."
	items = list(
		/obj/item/weapon/golf10,
		/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
		/obj/item/ammo_box/magazine/m10mm_adv,
		/obj/item/weapon/gun/ballistic/automatic/smg10mm,
		/obj/item/ammo_box/magazine/m10mm_auto
		)
	price = 240

/datum/content_pack/punk
	name = "Punk"
	id = "punk"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>If the game doesn't feel metal enough for you, this set of items may fix it.<br><i>Note: Punk lives!</i><br>"
	items = list(
		/obj/item/clothing/shoes/f13/military/diesel,
		/obj/item/clothing/shoes/f13/military/female/diesel,
		/obj/item/clothing/suit/armor/f13/punk,
		/obj/item/device/instrument/eguitar,
		/obj/item/key/motorcycle
		)
	price = 300

/datum/content_pack/off
	name = "OFF"
	id = "off"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>Carefully selected items from OFF game.<br><i>Note: Purification in progress...</i><br>"
	items = list(
		/obj/item/clothing/head/soft/black,
		/obj/item/clothing/under/f13/batter,
		/obj/item/weapon/twohanded/baseball,
		/obj/item/clothing/gloves/f13/baseball,
		/obj/item/clothing/shoes/f13/fancy
		)
	price = 300

/datum/content_pack/madmax
	name = "Mad Max"
	id = "madmax"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>Carefully selected items from an entire Mad Max movie franchise.<br><i>Note: Steering wheel is used just like a car key.<br>The content pack may be expanded in future with new items you will get for free if you already had this pack.</i>"
	items = list(
		/obj/item/clothing/suit/f13/mfp,
		/obj/item/clothing/suit/f13/mfp/raider,
		/obj/item/weapon/reagent_containers/food/snacks/f13/dog,
		/obj/item/weapon/gun/ballistic/shotgun/trail,
		/obj/item/clothing/head/f13/safari,
		/obj/item/clothing/under/pants/f13/warboy,
		/obj/item/key/buggy/wheel
		)
	price = 600

/datum/content_pack/doom
	name = "Doom"
	id = "doom"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>Carefully selected items from Doom game.<br><i>Note: Union Aerospace Corporation welcomes you aboard a shuttle leaving Earth on the way to Mars. Please fasten your seatbelts and have a safe flight!</i>"
	items = list(
		/obj/item/clothing/head/helmet/f13/doom,
		/obj/item/clothing/suit/armor/f13/doom,
		/obj/item/clothing/under/pants/f13/doom,
		/obj/item/clothing/gloves/f13/doom,
		/obj/item/clothing/shoes/f13/doom,
		/obj/item/weapon/mounted_chainsaw
		)
	price = 1000

/datum/content_pack/godfather
	name = "Role: Gang Leader"
	id = "godfather"
	desc = "<b>Available to: Raider faction only!</b><br><i>You found paradise in this city. You had a good trade, you made a good living. The mercenaries protected you and there were courts of wasteland law. So you didn't need a friend like me. Now you come and say \"Leader, give me justice.\" But you don't ask with respect. You don't offer friendship. You don't even think to call me \"Godfather.\" You come into my house on the day my daughter is to be married and you ask me to do murder - for money.</i><br><b>Godfather (2255)</b>"
	roles = list(
		/datum/job/gangleader
		)
	price = 120

/datum/content_pack/mayor
	name = "Role: Mayor"
	id = "mayor"
	desc = "<b>Available to: City faction only!</b><br>\[insert clever Mayor related quote here\]"
	roles = list(
		/datum/job/mayor
		)
	price = 120

/datum/content_pack/general
	name = "Role: General"
	id = "general"
	desc = "<b>Available to: New California Republic faction only!</b><br>Don't anger a Bear, specially a two-headed one."
	roles = list(
		/datum/job/general
		)
	price = 240

/datum/content_pack/legate
	name = "Role: Legate"
	id = "legate"
	desc = "<b>Available to: Caesar's Legion faction only!</b><br><i>Caesar's will is the will of the Legion. Victory shall be ours, it shall be swift, and it will be honest, purchased with blood.</i>"
	roles = list(
		/datum/job/legate
		)
	price = 240

/datum/content_pack/elder
	name = "Role: Elder"
	id = "elder"
	desc = "<b>Available to: Brotherhood of Steel faction only!</b><br><i>Pledge in your hearts and minds, pledge by your guns that you will stand with them in battle until the end, trust each of them with your life.</i>"
	roles = list(
		/datum/job/elder
		)
	price = 240

/datum/content_pack/colonel
	name = "Role: Colonel"
	id = "colonel"
	desc = "<b>Available to: Enclave faction only!</b><br><i>When you see the Enclave, you see the United States government. We are authorized to restore order and civility, by any means necessary. The American people are worth fighting for. The future must be secured.</i>"
	roles = list(
		/datum/job/colonel
		)
	price = 240

/datum/content_pack/leaders
	name = "Role: All Leaders set"
	id = "leaders"
	desc = "<b>Available to: All factions except for Neutral!</b><br><i>Got to rule them all!</i>"
	roles = list(
		/datum/job/gangleader,
		/datum/job/mayor,
		/datum/job/general,
		/datum/job/legate,
		/datum/job/elder,
		/datum/job/colonel
		)
	price = 1000

/datum/content_pack/glowing_ghoul
	name = "Player race: Glowing Ghoul"
	id = "glowing_ghoul"
	desc = "<b>Available to: All factions except for the Enclave!</b><br>The following pack gives you ability to create a glowing ghoul character on round start!"
	price = 500

	on_set(client/client)
		client.add_race("glowing ghoul", /datum/species/ghoul/glowing)