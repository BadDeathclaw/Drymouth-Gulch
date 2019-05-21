//Fallout 13 New California Republic faction directory

/datum/job/general
	title = "General"
	desc = "The fate of civilization rests on your shoulders.<br>You were chosen to write history anew.<br>Make a two-headed bear proud."
	flag = GENERAL
	department_head = list("NCR Command HQ")
	department_flag = WASTELAND
	faction = "ncr"
	status = "ncr_general"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the NCR Command HQ"
	selection_color = "#9d9fec"
	minimal_player_age = 7
	whitelist_on = 1

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	required_items = list(
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/device/radio,
	/obj/item/weapon/lighter/gold,
	/obj/item/weapon/reagent_containers/pill/patch/stimpak,
	/obj/item/weapon/reagent_containers/pill/patch/supstimpak
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
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
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/general

	access = list()
	minimal_access = list()

/datum/outfit/job/general
	name = "General"
	id = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/general
	shoes = /obj/item/clothing/shoes/laceup
	suit = null
	head = /obj/item/clothing/head/f13/sergeant
	weapon = /obj/item/weapon/gun/ballistic/automatic/assault_rifle

//NCR Sergeant

/datum/job/ncr_sergeant
	title = "Sergeant"
	desc = "You have to remind Troopers to speak only when spoken to, and that the first and last words out of their filthy sewers will be \"Sir\"."
	flag = NCR_SERGEANT
	department_head = list("general")
	department_flag = WASTELAND
	faction = "ncr"
	status = "ncr_sergeant"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the General"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	required_items = list(
	/obj/item/clothing/head/f13/ncr_officer,
	/obj/item/clothing/under/f13/ncr,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/lighter/engraved
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
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
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/ncr_sergeant

	access = list()
	minimal_access = list()

/datum/outfit/job/ncr_sergeant
	name = "Sergeant"
	id = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/ncr_officer
	shoes = /obj/item/clothing/shoes/f13/military
	suit = /obj/item/clothing/suit/armor/f13/sergeant
	head = /obj/item/clothing/head/f13/sergeant
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	belt_contents = list(/obj/item/ammo_box/magazine/m556 = 3, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 2, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival = 1, \
		/obj/item/device/radio = 1, \
		/obj/item/device/flashlight/torch/flare/blue = 1)

/datum/job/vranger
	title = "Veteran Ranger"
	desc = "You are a shadow. No one can hear you coming - and if they see you, they know they're a goner."
	flag = RANGER
	department_head = list("NCR Command HQ")
	department_flag = WASTELAND
	faction = "ncr"
	status = "vranger"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the NCR Command HQ"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	outfit = /datum/outfit/job/vranger

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	required_items = list(
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/lighter/engraved
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
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
	/obj/item/clothing/suit/f13/mantle_liz
	)

	access = list()
	minimal_access = list()

/datum/outfit/job/vranger
	name = "Veteran Ranger"
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/mechanic
	shoes = /obj/item/clothing/shoes/f13/military/light
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	head = /obj/item/clothing/head/helmet/f13/ranger
	belt = /obj/item/weapon/storage/belt/military/assault
	weapon = /obj/item/weapon/gun/ballistic/revolver/magnum
	belt_contents = list(/obj/item/weapon/restraints/handcuffs = 1, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 2, \
		/obj/item/ammo_box/m44 = 3, \
		/obj/item/device/radio = 1)


/datum/job/trooper
	title = "Trooper"
	desc = "I am a soldier and I'm marching on, I am a warrior and this is my song!"
	flag = TROOPER
	department_head = list("general", "ncr_sergeant")
	department_flag = WASTELAND
	faction = "ncr"
	status = "trooper"
	total_positions = 10
	spawn_positions = 10
	supervisors = "the General"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	required_items = list(
	/obj/item/clothing/suit/armor/f13/ncr/facewrap,
	/obj/item/weapon/kitchen/knife/combat
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/head/f13/headscarf,
	/obj/item/clothing/head/f13/pot,
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
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/trooper

	access = list()
	minimal_access = list()

/datum/outfit/job/trooper
	name = "Trooper"
	gloves = /obj/item/clothing/gloves/f13/ncr
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	suit = /obj/item/clothing/suit/armor/f13/ncr/soldier
	head = /obj/item/clothing/head/helmet/f13/trooper
	glasses = /obj/item/clothing/glasses/f13/biker
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	belt_contents = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
	/obj/item/device/radio = 1, /obj/item/ammo_box/magazine/m556 = 3)