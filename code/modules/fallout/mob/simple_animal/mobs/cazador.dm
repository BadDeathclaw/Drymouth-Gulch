//Fallout 13 cazador directory

/mob/living/simple_animal/hostile/cazador
	name = "cazador"
	desc = "A big and ugly flying thing."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "cazador"
	icon_living = "cazador"
	icon_gib = "gib"
	speak_chance = 0
	speak_emote = list("gnashes")
	environment_smash = 1
	turns_per_move = 15
	butcher_results = list()
	response_help = "pokes"
	response_disarm = "punches"
	response_harm = "hits"
	emote_taunt = list("gnashes")
	taunt_chance = 30
	move_to_delay = 2
	maxHealth = 60
	health = 60
	aggro_vision_range = 10
	idle_vision_range = 5
	movement_type = FLYING
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	self_weight = 40

	faction = list("hostile", "cazador")

	sound_speak = list('sound/f13npc/cazador_charge1.ogg','sound/f13npc/cazador_charge2.ogg','sound/f13npc/cazador_charge3.ogg')
	sound_speak_chance = 5

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/cazador_alert.ogg'

	death_sound = 'sound/f13npc/cazador_death.ogg'

	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 0.2, CLONE = 0, STAMINA = 1, OXY = 0)
	harm_intent_damage = 10
	melee_damage_lower = 10
	melee_damage_upper = 20
	attacktext = "stings"
	attack_sound = 'sound/weapons/bite.ogg'

/mob/living/simple_animal/hostile/cazador/death(gibbed)
	icon_dead = pick("cazador_dead1", "cazador_dead2", "cazador_dead3", "cazador_dead4")
	..()