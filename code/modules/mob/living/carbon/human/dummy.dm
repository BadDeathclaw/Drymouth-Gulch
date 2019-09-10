
/mob/living/carbon/human/dummy
	real_name = "Test Dummy"
	status_flags = GODMODE|CANPUSH
	var/in_use = FALSE

INITIALIZE_IMMEDIATE(/mob/living/carbon/human/dummy)

/mob/living/carbon/human/dummy/Destroy()
	in_use = FALSE
	return ..()

/mob/living/carbon/human/dummy/Life()
	return

/mob/living/carbon/human/dummy/proc/wipe_state()
	delete_equipment()
	cut_overlays(TRUE)

//Inefficient pooling/caching way.
GLOBAL_LIST_EMPTY(human_dummy_list)
GLOBAL_LIST_EMPTY(dummy_mob_list)

/proc/generate_or_wait_for_human_dummy(slotkey)
	if(!slotkey)
		return new /mob/living/carbon/human/dummy
	var/mob/living/carbon/human/dummy/D = GLOB.human_dummy_list[slotkey]
	if(istype(D))
		UNTIL(!D.in_use)
	else
		pass()
	if(QDELETED(D))
		D = new
		GLOB.human_dummy_list[slotkey] = D
		GLOB.dummy_mob_list += D
	D.in_use = TRUE
	return D

/proc/unset_busy_human_dummy(slotnumber)
	if(!slotnumber)
		return
	var/mob/living/carbon/human/dummy/D = GLOB.human_dummy_list[slotnumber]
	if(istype(D))
		D.wipe_state()
		D.in_use = FALSE

//This proc attempts to create a dummy which is an exact copy of a passed human, including all of their equipment.
//Attempts being the key word, it is far from flawless. Notably it will not copy...:
	//Post-spawn body changes, eg mutations gained or limbs lost during a round
	//Items held in the hand
	//Items stored in any container on the person
/proc/duplicate_human(var/mob/living/carbon/human/H)

	// First, create the dummy
	var/mob/living/carbon/human/dummy/mannequin = new /mob/living/carbon/human/dummy


	//Second, copy over the preferences, if there are any
	var/datum/preferences/P = H.get_preferences()
	if (P)
		P.copy_to(mannequin)

	//Third, lets copy over the equipment
	for (var/slot in ALL_EQUIP_SLOTS)
		if (istype(H.vars[slot], /datum))
			var/datum/olditem = H.vars[slot]
			mannequin.vars[slot] = new olditem.type(mannequin)
			//We create a new copy of each thing the human has equipped and directly set it in our mannequin's slot
			//This may get a bit screwy with complex things like RIGs, but it should work fine for an uninteractible preview

	//Lastly, lets update its icons
	mannequin.regenerate_icons()

	return mannequin