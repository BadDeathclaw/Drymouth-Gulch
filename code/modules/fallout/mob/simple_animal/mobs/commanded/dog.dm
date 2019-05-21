//Fallout 13 dog companion

/mob/living/simple_animal/hostile/commanded/dog
	name = "doge" //Much doge. Such amaze. Wow.
	desc = "A large brown dog."

	icon_state = "dog"
	icon_living = "dog"
	icon_dead = "dog_dead"

	health = 150
	maxHealth = 150

	move_to_delay = 2

	density = 1
	self_weight = 40

	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	speak = list("YAP", "Woof!", "Bark!", "AUUUUUU")
	speak_emote = list("barks", "woofs")
	emote_hear = list("barks!", "woofs!", "yaps.","pants.")
	emote_see = list("shakes its head.", "chases its tail.","shivers.")
	faction = list("dog")
	see_in_dark = 5
	speak_chance = 1
	turns_per_move = 10

	attacktext = "bites"
	melee_damage_lower = 15
	melee_damage_upper = 30
	attack_sound = 'sound/weapons/bite.ogg'

	death_sound = 'sound/f13npc/dog_death.ogg'

	known_commands = list("stay", "stop", "attack", "follow", "defend", "enemy", "friend", "pull")

/mob/living/simple_animal/hostile/commanded/dog/listen(var/mob/speaker, var/text)
	..()
	if(stance == COMMANDED_DEFEND || stance == COMMANDED_ATTACK)
		icon_state = "[initial(icon_state)]_angry"
	else
		icon_state = "[initial(icon_state)]"

/mob/living/simple_animal/hostile/commanded/dog/accepted()
	playsound(src, pick('sound/f13npc/dog_bark1.ogg', 'sound/f13npc/dog_bark2.ogg', 'sound/f13npc/dog_bark3.ogg'), 50, 0)

/mob/living/simple_animal/hostile/commanded/dog/unacsessable()
	emote("me",1,"whines")

/mob/living/simple_animal/hostile/commanded/dog/GiveTarget(new_target)
	..()
	if((stance == COMMANDED_DEFEND || stance == COMMANDED_ATTACK) && is_enemy(new_target))
		playsound(src, pick('sound/f13npc/dog_charge1.ogg', 'sound/f13npc/dog_charge2.ogg', 'sound/f13npc/dog_charge3.ogg'), 50, 0)

/mob/living/simple_animal/hostile/commanded/dog/handle_automated_speech(var/override)
	if(stance == COMMANDED_DEFEND || stance == COMMANDED_ATTACK)
		if(prob(5))
			playsound(src, pick('sound/f13npc/dog_alert1.ogg', 'sound/f13npc/dog_alert2.ogg', 'sound/f13npc/dog_alert3.ogg'), 50, 0)
	else
		if(prob(5))
			emote("me",1,pick(emote_see))