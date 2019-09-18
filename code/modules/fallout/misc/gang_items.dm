/datum/gang_item
	var/name
	var/item_path
	var/cost
	var/spawn_msg
	var/category
	var/id

/datum/gang_item/proc/purchase(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool, check_canbuy = TRUE)
	if(check_canbuy && !can_buy(user, gang, gangtool))
		return FALSE
	var/real_cost = get_cost(user, gang, gangtool)
	gang.influence -= real_cost
	spawn_item(user, gang, gangtool)
	return TRUE

/datum/gang_item/proc/spawn_item(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	if(item_path)
		var/obj/item/O = new item_path(user.loc)
		user.put_in_hands(O)
	if(spawn_msg)
		to_chat(user, spawn_msg)

/datum/gang_item/proc/can_buy(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return gang && (gang.influence >= get_cost(user, gang, gangtool))

/datum/gang_item/proc/get_cost(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return cost

/datum/gang_item/proc/get_cost_display(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return "([get_cost(user, gang, gangtool)] Influence)"

/datum/gang_item/proc/get_name_display(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return name

/datum/gang_item/proc/get_extra_info(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return

///////////////////
//FUNCTIONS
///////////////////

/datum/gang_item/function
	category = "Gangtool Functions:"
	cost = 0

/datum/gang_item/function/get_cost_display(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return ""


///////////////////
//CLOTHING
///////////////////

/datum/gang_item/clothing
	category = "Purchase Clothes:"

//Great Khans

/datum/gang_item/clothing/khan_boots
	name = "Great Khan boots"
	id = "khan_boots"
	cost = 15
	item_path = /obj/item/clothing/shoes/f13/khan

/datum/gang_item/clothing/khan_helmet
	name = "Great Khan helmet"
	id = "khan_helmet"
	cost = 20
	item_path = /obj/item/clothing/head/helmet/f13/khan

/datum/gang_item/clothing/khan_pants
	name = "Great Khan pants"
	id = "khan_pants"
	cost = 25
	item_path = /obj/item/clothing/under/pants/f13/khan

/datum/gang_item/clothing/khan_uniform
	name = "Great Khan uniform"
	id = "khan_uniform"
	cost = 40
	item_path = /obj/item/clothing/under/f13/khan

/datum/gang_item/clothing/khan_vest
	name = "Great Khan armored vest"
	id = "khan_vest"
	cost = 60
	item_path = /obj/item/clothing/suit/armor/khan

/datum/gang_item/clothing/prostitute_dress
	name = "Prostitute dress"
	id = "prostitute_dress"
	cost = 25
	item_path = /obj/item/clothing/under/f13/female/flapper

/datum/gang_item/clothing/hat
	name = "Pimp Hat"
	id = "hat"
	cost = 30
	item_path = /obj/item/clothing/head/collectable/petehat/gang

/obj/item/clothing/head/collectable/petehat/gang
	name = "pimpin' hat"
	desc = "The undisputed king of style."

/datum/gang_item/clothing/raider_uniform
	name = "Raider uniform"
	id = "raider_uniform"
	cost = 40
	item_path = /obj/item/clothing/under/f13/raider_leather

/datum/gang_item/clothing/jester_uniform
	name = "Jester suit"
	id = "jester_uniform"
	cost = 40
	item_path = /obj/item/clothing/under/jester

/datum/gang_item/clothing/biker_uniform
	name = "Biker uniform"
	id = "biker_uniform"
	cost = 40
	item_path = /obj/item/clothing/under/f13/Retro_Biker_Vest

/datum/gang_item/clothing/scarecrow_uniform
	name = "Scarecrow uniform"
	id = "scarecrow_uniform"
	cost = 40
	item_path = /obj/item/clothing/under/scarecrow

/datum/gang_item/clothing/soviet_uniform
	name = "Soviet uniform"
	id = "soviet_uniform"
	cost = 40
	item_path = /obj/item/clothing/under/soviet

/datum/gang_item/clothing/chairmen_uniform
	name = "Chairmen uniform"
	id = "chairmen_uniform"
	cost = 40
	item_path = /obj/item/clothing/under/f13/bennys/gang

/obj/item/clothing/under/f13/bennys/gang
	name = "Chairmen uniform"
	desc = "A black and white buffalo plaid suit, most often seen on the Chairmen."

///////////////////
//WEAPONS
///////////////////

/datum/gang_item/weapon
	category = "Purchase Weapons:"

/datum/gang_item/weapon/ammo

/datum/gang_item/weapon/ammo/get_cost_display(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return "&nbsp;&#8627;" + ..() //this is pretty hacky but it looks nice on the popup

/datum/gang_item/weapon/shuriken
	name = "Shuriken"
	id = "shuriken"
	cost = 30
	item_path = /obj/item/throwing_star

/datum/gang_item/weapon/switchblade
	name = "Switchblade"
	id = "switchblade"
	cost = 60
	item_path = /obj/item/switchblade

///////////////////
//EQUIPMENT
///////////////////

/datum/gang_item/equipment
	category = "Purchase Equipment:"

/datum/gang_item/equipment/spraycan
	name = "Territory Spraycan"
	id = "spraycan"
	cost = 10
	item_path = /obj/item/toy/crayon/spraycan

/datum/gang_item/equipment/emp
	name = "EMP Grenade"
	id = "EMP"
	cost = 130
	item_path = /obj/item/grenade/empgrenade

/datum/gang_item/equipment/necklace
	name = "Gold Necklace"
	id = "necklace"
	cost = 150
	item_path = /obj/item/clothing/neck/necklace/dope

/datum/gang_item/equipment/c4
	name = "C4 Explosive"
	id = "c4"
	cost = 200
	item_path = /obj/item/grenade/plastic/c4
