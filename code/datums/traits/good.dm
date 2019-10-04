//predominantly positive traits
//this file is named weirdly so that positive traits are listed above negative ones

/datum/quirk/alcohol_tolerance
	name = "Alcohol Tolerance"
	desc = "You become drunk more slowly and suffer fewer drawbacks from alcohol."
	value = 1
	mob_trait = TRAIT_ALCOHOL_TOLERANCE
	gain_text = "<span class='notice'>You feel like you could drink a whole keg!</span>"
	lose_text = "<span class='danger'>You don't feel as resistant to alcohol anymore. Somehow.</span>"

/datum/quirk/apathetic
	name = "Apathetic"
	desc = "You just don't care as much as other people. That's nice to have in a place like this, I guess."
	value = 1
	mood_quirk = TRUE

/datum/quirk/apathetic/add()
	GET_COMPONENT_FROM(mood, /datum/component/mood, quirk_holder)
	if(mood)
		mood.mood_modifier = 0.8

/datum/quirk/apathetic/remove()
	if(quirk_holder)
		GET_COMPONENT_FROM(mood, /datum/component/mood, quirk_holder)
		if(mood)
			mood.mood_modifier = 1 //Change this once/if species get their own mood modifiers.

/datum/quirk/bigleagues
	name = "Big Leagues"
	desc = "Swing for the fences! You deal additional damage with melee weapons."
	value = 2
	mob_trait = TRAIT_BIG_LEAGUES
	gain_text = "<span class='notice'>You feel like swinging for the fences!</span>"
	lose_text = "<span class='danger'>You feel like bunting.</span>"
/*
/datum/quirk/chemwhiz
	name = "Chem Whiz"
	desc = "You've been playing around with chemicals all your life. You know how to use chemistry machinery."
	value = 2
	mob_trait = TRAIT_CHEMWHIZ
	gain_text = "<span class='notice'>The mysteries of chemistry are revealed to you.</span>"
	lose_text = "<span class='danger'>You forget how the periodic table works.</span>"
*/
/*
/datum/quirk/pa_wear
	name = "PA Wear"
	desc = "You've being around the wastes and have learned the importance of defense."
	value = 3
	mob_trait = TRAIT_PA_WEAR
	gain_text = "<span class='notice'>You realize how to use Power Armor.</span>"
	lose_text = "<span class='danger'>You forget how Power Armor works.</span>"
*/
/datum/quirk/drunkhealing
	name = "Drunken Resilience"
	desc = "Nothing like a good drink to make you feel on top of the world. Whenever you're drunk, you slowly recover from injuries."
	value = 2
	mob_trait = TRAIT_DRUNK_HEALING
	gain_text = "<span class='notice'>You feel like a drink would do you good.</span>"
	lose_text = "<span class='danger'>You no longer feel like drinking would ease your pain.</span>"
	medical_record_text = "Patient has unusually efficient liver metabolism and can slowly regenerate wounds by drinking alcoholic beverages."

/datum/quirk/freerunning
	name = "Freerunning"
	desc = "You're great at quick moves! You can climb tables more quickly."
	value = 2
	mob_trait = TRAIT_FREERUNNING
	gain_text = "<span class='notice'>You feel lithe on your feet!</span>"
	lose_text = "<span class='danger'>You feel clumsy again.</span>"

/datum/quirk/iron_fist
	name = "Iron Fist"
	desc = "You have fists of kung-fury! Increases unarmed damage."
	value = 2
	mob_trait = TRAIT_IRONFIST
	gain_text = "<span class='notice'>Your fists feel furious!</span>"
	lose_text = "<span class='danger'>Your fists feel calm again.</span>"

/datum/quirk/iron_fist/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow = 3
	mob_tar.dna.species.punchdamagehigh = 10

/datum/quirk/jolly
	name = "Jolly"
	desc = "You sometimes just feel happy, for no reason at all."
	value = 1
	mob_trait = TRAIT_JOLLY
	mood_quirk = TRUE

/datum/quirk/hard_yards
	name = "Hard Yards"
	desc = "You've put them in, now reap the rewards."
	value = 3
	locked = TRUE
	mob_trait = TRAIT_HARD_YARDS
	gain_text = "<span class='notice'>Rain or shine, nothing slows you down.</span>"
	lose_text = "<span class='danger'>You walk with a less sure gait, the ground seeming less firm somehow.</span>"

/datum/quirk/lifegiver
	name = "Lifegiver"
	desc = "You embody wellness! Instantly gain +15 maximum Health"
	value = 3
	mob_trait = TRAIT_LIFEGIVER
	gain_text = "<span class='notice'>You feel more healthy than usual.</span>"
	lose_text = "<span class='danger'>You feel less healthy than usual.</span>"

/datum/quirk/lifegiver/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.maxHealth += 15
	mob_tar.health += 15

/datum/quirk/light_step
	name = "Light Step"
	desc = "You walk with a gentle step, making stepping on sharp objects quieter and less painful."
	value = 1
	mob_trait = TRAIT_LIGHT_STEP
	gain_text = "<span class='notice'>You walk with a little more litheness.</span>"
	lose_text = "<span class='danger'>You start tromping around like a barbarian.</span>"

/datum/quirk/selfaware
	name = "Self-Aware"
	desc = "You know your body well, and can accurately assess the extent of your wounds."
	value = 2
	mob_trait = TRAIT_SELF_AWARE

/datum/quirk/skittish
	name = "Skittish"
	desc = "You can conceal yourself in danger. Ctrl-shift-click a closed locker to jump into it, as long as you have access."
	value = 1
	mob_trait = TRAIT_SKITTISH

/datum/quirk/spiritual
	name = "Spiritual"
	desc = "You're in tune with the gods, and your prayers may be more likely to be heard. Or not."
	value = 1
	mob_trait = TRAIT_SPIRITUAL
	gain_text = "<span class='notice'>You feel a little more faithful to the gods today.</span>"
	lose_text = "<span class='danger'>You feel less faithful in the gods.</span>"

/datum/quirk/voracious
	name = "Voracious"
	desc = "Nothing gets between you and your food. You eat twice as fast as everyone else!"
	value = 1
	mob_trait = TRAIT_VORACIOUS
	gain_text = "<span class='notice'>You feel HONGRY.</span>"
	lose_text = "<span class='danger'>You no longer feel HONGRY.</span>"

///////////////////
//////FL13 weapons traits!
///DO NOT USE IMPLANTS.
///Grenades
/datum/quirk/grenadesloot
	name = "Party Favor"
	desc = "Who knows what's inside."
	value = 3
	var/obj/item/heirloom ///SPAGETH CODE DON'T LEAVE TO REMOVE THE NAME.
	var/where

/datum/quirk/grenadesloot/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/heirloom_type  ///DONT CHANGE HERILOOM STUFF FOR SOME REASON DONT WORK IF YOU REMOVE IT AAAAA.
	switch(quirk_holder.mind.assigned_role)
		if("Elder", "Centurion", "Sheriff", "NCR Captain", "Overseer")
			heirloom_type = pick(/obj/item/grenade/flashbang, 200 ; /obj/item/grenade/smokebomb, 200 ; /obj/item/grenade/plastic)
		else
			heirloom_type = pick(
				300 ; /obj/item/grenade/smokebomb,
				200 ; /obj/item/grenade/empgrenade,
				200 ; /obj/item/grenade/flashbang,
				/obj/item/grenade/plastic)
	heirloom = new heirloom_type(get_turf(quirk_holder)) //IF YOU CHANGE THIS FOR SOME REASON WILL NOT WORK.
	var/list/slots = list(
		"in your left pocket" = SLOT_L_STORE, //SPAWNS IN THE POCKETS
		"in your right pocket" = SLOT_R_STORE,
		"in your backpack" = SLOT_IN_BACKPACK	//SPAWNS IN THE BACKPACK

	)
	where = H.equip_in_one_of_slots(heirloom, slots, FALSE) || "at your feet"

/datum/quirk/grenadesloot/post_add()
	if(where == "in your backpack")
		var/mob/living/carbon/human/H = quirk_holder
		SEND_SIGNAL(H.back, COMSIG_TRY_STORAGE_SHOW, H) //GOD BLESS SPAGETHY CODE!
///TO DO: TEST IT WITH BOXES LIKE MEDKITS/NORMALS BOXES.
///ADD MORE EQUIPMENT TRAITS REEEE
///IMPROVE MY ENGLISH
