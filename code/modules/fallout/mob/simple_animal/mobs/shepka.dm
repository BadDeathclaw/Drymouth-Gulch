//Fallout 13 - memorial to human cruelty.

/mob/living/simple_animal/hostile/shepka
	name = "Shepard"
	desc = "A horrible creature from the system of Tau Ceti."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "shepherd"
	icon_living = "shepherd"
	icon_dead = "shepherd_dead"
	icon_gib = "gib"
	turns_per_move = 1
	response_help = "pets"
	response_disarm = "pushes aside"
	response_harm = "kicks"
	butcher_results = list(/mob/living/simple_animal/hostile/megafauna/colossus = 1)
	maxHealth = 5000
	health = 5000
	self_weight = 5

	faction = "evil"

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/dog_charge1.ogg','sound/f13npc/dog_charge2.ogg','sound/f13npc/dog_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = list('sound/f13npc/dog_alert1.ogg','sound/f13npc/dog_alert2.ogg','sound/f13npc/dog_alert3.ogg')

	environment_smash = 0
	melee_damage_lower = 5
	melee_damage_upper = 50
	aggro_vision_range = 20 //I SEE EVERYTHING
	idle_vision_range = 10
	attacktext = "sucks soul"
	attack_sound = 'sound/weapons/bite.ogg'
	move_to_delay = 1

/mob/living/simple_animal/hostile/shepka/Hear(message, go/speaker, message_langs, raw_message, radio_freq, list/spans)
	if(findtext(lowertext_uni(raw_message), "пили билд"))
		gib()