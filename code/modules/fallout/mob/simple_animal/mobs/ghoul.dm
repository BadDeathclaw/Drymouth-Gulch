//Fallout 13 npc ghouls directory

/mob/living/simple_animal/hostile/ghoul
	name = "feral ghoul"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "retro_ghoul"
	icon_living = "retro_ghoul"
	icon_dead = "retro_ghoul_d"
	icon_gib = "gib"
	speak_chance = 0
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "slaps"
	move_to_delay = 4
	maxHealth = 70
	health = 70
	self_weight = 45

	faction = list("hostile", "ghoul")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/ghoul_charge1.ogg','sound/f13npc/ghoul_charge2.ogg','sound/f13npc/ghoul_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghoul_alert.ogg'

	death_sound = 'sound/f13npc/ghoul_death.ogg'

	melee_damage_lower = 15
	melee_damage_upper = 20
	aggro_vision_range = 10
	idle_vision_range = 7
	attacktext = "scratches"
	attack_sound = "punch"

/mob/living/simple_animal/hostile/ghoul/aggressive
	name = "feral ghoul"
	desc = "Have you ever seen a hungry ghoul before?<br>Similar to other feral ghouls, it's more aggressive and confident about the fact that you are the best food around.<br>It is missing a left arm."
	icon_state = "angry_ghoul"
	icon_living = "angry_ghoul"
	icon_dead = "angry_ghoul_d"
	icon_gib = "gib"
	maxHealth = 80
	health = 80
	melee_damage_lower = 15
	melee_damage_upper = 25
	aggro_vision_range = 15
	idle_vision_range = 10
	attacktext = "chomps"

/mob/living/simple_animal/hostile/ghoul/glowing
	name = "glowing feral ghoul"
	desc = "Have you ever seen a glowing ghoul before?<br>Glowing ghouls are necrotic post-humans - rotting, zombie-like mutants, who are so irradiated they actually glow in the dark."
	icon_state = "retro_glowghoul"
	icon_living = "retro_glowghoul"
	icon_dead = "retro_glowghoul_d"
	icon_gib = "gib"
	maxHealth = 100
	health = 100
	melee_damage_lower = 15
	melee_damage_upper = 25
	light_color = LIGHT_COLOR_GREEN
	light_power = 1
	light_range = 2

/mob/living/simple_animal/hostile/ghoul/glowing/New()
	..()
	SSradiation.processing += src