/*
Sheriff
*/
/datum/job/Den/f13sheriff
	title = "Sheriff"
	flag = F13SHERIFF
	department_flag = DEN
	head_announce = list("Security")
	faction = "Den"
	total_positions = 1
	spawn_positions = 1
	supervisors = "no one"
	selection_color = "#d7b088"
	exp_requirements = 60
	exp_type = EXP_TYPE_DEN

	outfit = /datum/outfit/job/Den/f13sheriff

/datum/outfit/job/Den/f13sheriff
	name = "Sheriff"
	jobtype = /datum/job/Den/f13sheriff

	id = /obj/item/card/id/sheriff
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

	ears = 			/obj/item/radio/headset/headset_den
	uniform =  		/obj/item/clothing/under/f13/cowboyb
	shoes = 		/obj/item/clothing/shoes/workboots
	suit = 			/obj/item/clothing/suit/det_suit
	head = 			/obj/item/clothing/head/fluff/cowboy
	glasses =		/obj/item/clothing/glasses/sunglasses
	l_hand = 		/obj/item/gun/ballistic/shotgun
	l_pocket =		/obj/item/storage/bag/money/small/den
	backpack_contents = list(/obj/item/storage/box/deputy_badges=1)


	//pick("grey", "white", "yellow", "purple", "brown", "whatever")
	//var/item1_type = pick( /obj/item/stack/spacecash/c10, /obj/item/stack/spacecash/c100, /obj/item/stack/spacecash/c1000, /obj/item/stack/spacecash/c20, /obj/item/stack/spacecash/c200, /obj/item/stack/spacecash/c50, /obj/item/stack/spacecash/c500)

	/datum/outfit/job/Den/f13sheriff/pre_equip(mob/living/carbon/human/H)
		..()
		r_pocket = pick(/obj/item/flashlight/flare/torch, /obj/item/flashlight/flare)
		belt = pick(/obj/item/gun/ballistic/automatic/pistol/m1911, /obj/item/gun/ballistic/revolver/m29, /obj/item/gun/ballistic/revolver/colt6250)
/*
Settler
*/

/datum/job/Den/f13settler
	title = "Settler"
	flag = F13SETTLER
	department_flag = DEN
	faction = "Den"
	total_positions = -1
	spawn_positions = -1
	supervisors = "the sheriff"
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/Den/f13settler

/datum/outfit/job/Den/f13settler
	name = "Settler"
	jobtype = /datum/job/Den/f13settler

	ears = 			/obj/item/radio/headset/headset_den
	id = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler

/datum/outfit/job/Den/f13settler/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	r_pocket = pick(
		/obj/item/flashlight/flare/torch, \
		/obj/item/flashlight/flare)


/*
Preacher
*/

/datum/job/f13preacher
	title = "Preacher"
	flag = F13PREACHER
	department_head = list("Captain")
	department_flag = DEN
	head_announce = list("Security")
	faction = "Den"
	total_positions = 1
	spawn_positions = 1
	supervisors = "your deity."
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/f13preacher

	access = list()
	minimal_access = list()



/datum/job/f13preacher/after_spawn(mob/living/H, mob/M)
	if(H.mind)
		H.mind.isholy = TRUE

	var/obj/item/storage/book/bible/booze/B = new

	if(SSreligion.religion)
		B.deity_name = SSreligion.deity
		B.name = SSreligion.bible_name
		B.icon_state = SSreligion.bible_icon_state
		B.item_state = SSreligion.bible_item_state
		to_chat(H, "There is already an established religion onboard the station. You are an acolyte of [SSreligion.deity]. Defer to the Chaplain.")
		H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)
		var/nrt = SSreligion.holy_weapon_type || /obj/item/nullrod
		var/obj/item/nullrod/N = new nrt(H)
		H.put_in_hands(N)
		return

	var/new_religion = "Christianity"
	if(M.client && M.client.prefs.custom_names["religion"])
		new_religion = M.client.prefs.custom_names["religion"]

	var/new_deity = "Space Jesus"
	if(M.client && M.client.prefs.custom_names["deity"])
		new_deity = M.client.prefs.custom_names["deity"]

	B.deity_name = new_deity


	switch(lowertext(new_religion))
		if("christianity")
			B.name = pick("The Holy Bible","The Dead Sea Scrolls")
		if("satanism")
			B.name = "The Unholy Bible"
		if("cthulhu")
			B.name = "The Necronomicon"
		if("islam")
			B.name = "Quran"
		if("scientology")
			B.name = pick("The Biography of L. Ron Hubbard","Dianetics")
		if("chaos")
			B.name = "The Book of Lorgar"
		if("imperium")
			B.name = "Uplifting Primer"
		if("toolboxia")
			B.name = "Toolbox Manifesto"
		if("homosexuality")
			B.name = "Guys Gone Wild"
		if("lol", "wtf", "gay", "penis", "ass", "poo", "badmin", "shitmin", "deadmin", "cock", "cocks", "meme", "memes")
			B.name = pick("Woodys Got Wood: The Aftermath", "War of the Cocks", "Sweet Bro and Hella Jef: Expanded Edition")
			H.adjustBrainLoss(100) // starts off retarded as fuck
		if("science")
			B.name = pick("Principle of Relativity", "Quantum Enigma: Physics Encounters Consciousness", "Programming the Universe", "Quantum Physics and Theology", "String Theory for Dummies", "How To: Build Your Own Warp Drive", "The Mysteries of Bluespace", "Playing God: Collector's Edition")
		else
			B.name = "The Holy Book of [new_religion]"

	SSreligion.religion = new_religion
	SSreligion.bible_name = B.name
	SSreligion.deity = B.deity_name

	H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)

	SSblackbox.record_feedback("text", "religion_name", 1, "[new_religion]", 1)
	SSblackbox.record_feedback("text", "religion_deity", 1, "[new_deity]", 1)


/datum/outfit/job/f13preacher
	name = "Preacher"
	jobtype = /datum/job/f13preacher
	id = null
	ears = /obj/item/radio/headset/headset_den
	belt = null

	uniform = /obj/item/clothing/under/rank/chaplain
	backpack_contents = list(/obj/item/camera/spooky = 1)
	backpack = /obj/item/storage/backpack/cultpack
	satchel = /obj/item/storage/backpack/cultpack
	gloves =		/obj/item/clothing/gloves/fingerless
	shoes = 		/obj/item/clothing/shoes/jackboots
	backpack = 		/obj/item/storage/backpack/cultpack
	satchel = 		/obj/item/storage/backpack/cultpack
	mask = 			/obj/item/clothing/mask/gas/syndicate
	r_hand = 		/obj/item/gun/ballistic/shotgun/remington/scoped
	backpack_contents = list(
		/obj/item/ammo_box/magazine/internal/boltaction=2, \
		/obj/item/reagent_containers/food/drinks/flask=1, \
		/obj/item/storage/fancy/candle_box, \
		/obj/item/storage/bag/money/small/settler)

/datum/outfit/job/f13preacher/pre_equip(mob/living/carbon/human/H)
	..()
	r_pocket = pick(
		/obj/item/flashlight/flare/torch, \
		/obj/item/flashlight/flare)
