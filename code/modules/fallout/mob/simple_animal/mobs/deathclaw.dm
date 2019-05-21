//Fallout 13 deathclaw directory

/mob/living/simple_animal/hostile/deathclaw
	name = "deathclaw"
	desc = "A huge monster."
	icon = 'icons/fallout/mobs/deathclaw.dmi'
	icon_state = "deathclaw"
	icon_living = "deathclaw"
	icon_dead = "deathclaw_dead"
	speed = 2
	move_to_delay = 3
	turns_per_move = 5
	response_help = "touches"
	response_disarm = "tries to grab the deathclaw by its large"
	response_harm = "hits the deathclaw right in its large"
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/deathclaw = 5, /obj/item/stack/sheet/animalhide/deathclaw=3)
	maxHealth = 400
	health = 400
	self_weight = 500
	damage_coeff = list(BRUTE = 0.6, BURN = 0.8, TOX = 0.2, CLONE = 0, STAMINA = 1, OXY = 0)

	faction = list("hostile", "deathclaw")

	ambient_sound = 'sound/f13npc/deathclaw_loop.ogg'

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/deathclaw_charge1.ogg','sound/f13npc/deathclaw_charge2.ogg','sound/f13npc/deathclaw_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/deathclaw_charge1.ogg'

	death_sound = 'sound/f13npc/deathclaw_death.ogg'

	environment_smash = 3 // YOU CAN'T HIDE FROM ME
	force_threshold = 15
	melee_damage_lower = 25
	armour_penetration = 40
	melee_damage_upper = 40
	aggro_vision_range = 12
	see_in_dark = 8
	idle_vision_range = 7
	pixel_w = -16
	mob_size = MOB_SIZE_LARGE
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bladeslice.ogg'