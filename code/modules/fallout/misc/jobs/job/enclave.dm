//Fallout 13 Enclave faction roles

/datum/job/colonel
	title = "Colonel"
	desc = "An actual American patriot.<br>You live by the principle that the Main Goal is more important than the means of achieving it."
	flag = COLONEL
	department_head = list("Enclave command HQ")
	department_flag = MEDSCI
	faction = "enclave"
	status = "colonel"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Enclave command HQ"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	whitelist_on = 1

	allowed_packs = list("starter", "cigarettes", "bard", "tesla", "super_ten")

	required_items = list(
	/obj/item/clothing/under/f13/recon,
	/obj/item/clothing/suit/armor/f13/power_armor/shocktrooper,
	/obj/item/clothing/head/helmet/power_armor/shocktrooper,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/gun/energy/plasma,
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

	outfit = /datum/outfit/job/colonel

	access = list()
	minimal_access = list()

/datum/outfit/job/colonel
	name = "Colonel"
	backpack = null
	satchel = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/enclave_officer
	shoes = /obj/item/clothing/shoes/f13/military
	suit = /obj/item/clothing/suit/f13/autumn
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/energy/plasma/glock
	belt_contents = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak = 2, \
	/obj/item/device/radio = 1,/obj/item/weapon/kitchen/knife/combat = 1)

//Enclave Sergeant

/datum/job/enclave_sergeant
	title = "Sergeant"
	desc = "A loyal soldier.<br>You trust your commander and orders from above - it's just about time to make America great again!"
	flag = ENCLAVE_SERGEANT
	department_head = list("colonel")
	department_flag = MEDSCI
	faction = "enclave"
	status = "enclave_sergeant"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Colonel"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "cigarettes", "bard", "tesla", "super_ten")

	required_items = list(
	/obj/item/clothing/under/f13/recon,
	/obj/item/clothing/head/soft/f13/utility/olive,
	/obj/item/clothing/head/soft/f13/utility/tan,
	/obj/item/clothing/under/f13/bdu,
	/obj/item/clothing/under/f13/dbdu,
	/obj/item/clothing/suit/armor/f13/power_armor/superadvanced,
	/obj/item/clothing/head/helmet/power_armor/superadvanced,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/gun/energy/plasma,
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

	outfit = /datum/outfit/job/enclave_sergeant

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave_sergeant
	name = "Enclave Segeant"
	backpack = null
	satchel = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/enclave_officer
	shoes = /obj/item/clothing/shoes/f13/military
	suit = null
	head = /obj/item/clothing/head/soft/f13/enclave
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/energy/plasma/pistol
	belt_contents = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak = 2, \
	/obj/item/device/radio = 1,/obj/item/weapon/kitchen/knife/combat = 1)

//Enclave Private

/datum/job/enclave_private
	title = "Private"
	desc = "Enlist today."
	flag = ENCLAVE_PRIVATE
	department_head = list("colonel", "sergeant")
	department_flag = MEDSCI
	faction = "enclave"
	status = "private"
	total_positions = 7
	spawn_positions = 7
	supervisors = "The Colonel"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "cigarettes", "bard", "tesla", "super_ten")

	required_items = list(
	/obj/item/clothing/under/f13/recon,
	/obj/item/clothing/under/f13/bdu,
	/obj/item/clothing/suit/armor/f13/power_armor/advanced,
	/obj/item/clothing/head/helmet/power_armor/advanced,
	/obj/item/clothing/head/soft/f13/utility/olive,
	/obj/item/weapon/gun/energy/plasma/pistol
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

	outfit = /datum/outfit/job/enclave_private

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave_private
	name = "Enclave Private"
	backpack = null
	satchel = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/dbdu
	shoes = /obj/item/clothing/shoes/f13/military
	head = /obj/item/clothing/head/soft/f13/utility/tan
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/energy/plasma
	belt_contents = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
	/obj/item/device/radio = 1,/obj/item/weapon/kitchen/knife/combat = 1)