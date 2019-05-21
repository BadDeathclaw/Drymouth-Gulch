//Fallout 13 radroach directory

/mob/living/simple_animal/hostile/radroach
	name = "radroach"
	desc = "Great American cockroaches, colloquially called radroaches or giant cockroaches, are giant versions of the pre-War species that have been mutated by radiation."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "radroach"
	icon_living = "radroach"
	icon_dead = "radroach_d"
	icon_gib = "radroach_g"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "pushes aside"
	response_harm = "stomps"
	environment_smash = 0
	move_to_delay = 2
	maxHealth = 15
	health = 15
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	mob_size = MOB_SIZE_TINY
	self_weight = 15
	density = 0

	faction = list("hostile", "radroach")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/roach_charge1.ogg','sound/f13npc/roach_charge2.ogg','sound/f13npc/roach_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/roach_alert.ogg'

	death_sound = 'sound/f13npc/roach_death.ogg'

	melee_damage_lower = 5
	melee_damage_upper = 5
	attacktext = "bite"
	attack_sound = 'sound/weapons/bite.ogg'
	aggro_vision_range = 10
	idle_vision_range = 5