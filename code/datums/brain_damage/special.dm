//Brain traumas that are rare and/or somewhat beneficial;
//they are the easiest to cure, which means that if you want
//to keep them, you can't cure your other traumas
/datum/brain_trauma/special

/datum/brain_trauma/special/godwoken
	name = "Godwoken Syndrome"
	desc = "Patient occasionally and uncontrollably channels an eldritch god when speaking."
	scan_desc = "god delusion"
	gain_text = "<span class='notice'>You feel a higher power inside your mind...</span>"
	lose_text = "<span class='warning'>The divine presence leaves your head, no longer interested.</span>"

/datum/brain_trauma/special/godwoken/on_life()
	..()
	if(prob(4))
		if(prob(33) && (owner.IsStun() || owner.IsKnockdown() || owner.IsUnconscious()))
			speak("unstun", TRUE)
		else if(prob(60) && owner.health <= HEALTH_THRESHOLD_CRIT)
			speak("heal", TRUE)
		else if(prob(30) && owner.a_intent == INTENT_HARM)
			speak("aggressive")
		else
			speak("neutral", prob(25))

/datum/brain_trauma/special/godwoken/proc/speak(type, include_owner = FALSE)
	var/message
	switch(type)
		if("unstun")
			message = pick_list_replacements(BRAIN_DAMAGE_FILE, "god_unstun")
		if("heal")
			message = pick_list_replacements(BRAIN_DAMAGE_FILE, "god_heal")
		if("neutral")
			message = pick_list_replacements(BRAIN_DAMAGE_FILE, "god_neutral")
		if("aggressive")
			message = pick_list_replacements(BRAIN_DAMAGE_FILE, "god_aggressive")
		else
			message = pick_list_replacements(BRAIN_DAMAGE_FILE, "god_neutral")

	playsound(get_turf(owner), 'sound/magic/clockwork/invoke_general.ogg', 200, 1, 5)
	voice_of_god(message, owner, list("colossus","yell"), 2.5, include_owner, FALSE)

/datum/brain_trauma/special/psychotic_brawling
	name = "Violent Psychosis"
	desc = "Patient fights in unpredictable ways, ranging from helping his target to hitting them with brutal strength."
	scan_desc = "violent psychosis"
	gain_text = "<span class='warning'>You feel unhinged...</span>"
	lose_text = "<span class='notice'>You feel more balanced.</span>"
	var/datum/martial_art/psychotic_brawling/psychotic_brawling

/datum/brain_trauma/special/psychotic_brawling/on_gain()
	..()
	psychotic_brawling = new(null)
	if(!psychotic_brawling.teach(owner, TRUE))
		to_chat(owner, "<span class='notice'>But your martial knowledge keeps you grounded.</span>")
		qdel(src)

/datum/brain_trauma/special/psychotic_brawling/on_lose()
	..()
	psychotic_brawling.remove(owner)
	QDEL_NULL(psychotic_brawling)

/datum/brain_trauma/special/psychotic_brawling/bath_salts
	name = "Chemical Violent Psychosis"