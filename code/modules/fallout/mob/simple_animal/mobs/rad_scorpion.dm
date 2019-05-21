//Fallout 13 rad scorpion directory

/mob/living/simple_animal/hostile/rad_scorpion
	name = "rad scorpion"
	desc = "A giant irradiated scorpion with a blue exoskeleton. Its appearance makes you shudder.<br>This one has a razor sharp stinger with lethal venom inside."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "radscorpion"
	icon_living = "radscorpion"
	icon_dead = "radscorpion_d"
	icon_gib = "radscorpion_g"
	turns_per_move = 5
	see_in_dark = 10
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/spider = 2, /obj/item/weapon/reagent_containers/food/snacks/spiderleg = 8)
	response_help  = "touches"
	response_disarm = "hits"
	response_harm   = "kicks"
	maxHealth = 80
	health = 80
	self_weight = 120

	faction = list("hostile", "scorpion")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/scorpion_charge1.ogg','sound/f13npc/scorpion_charge2.ogg','sound/f13npc/scorpion_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/scorpion_alert.ogg'

	death_sound = 'sound/f13npc/scorpion_death.ogg'

	melee_damage_lower = 5
	melee_damage_upper = 20
	environment_smash = 1
	move_to_delay = 7
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 10
	aggro_vision_range = 8
	idle_vision_range = 7

/mob/living/simple_animal/hostile/rad_scorpion/black
	name = "giant rad scorpion"
	desc = "A giant irradiated scorpion with a black exoskeleton. Its appearance makes you shudder in fear.<br>This one has giant pincers."
	icon_state = "radscorpion_black"
	icon_living = "radscorpion_black"
	icon_dead = "radscorpion_black_d"
	icon_gib = "gib"
	maxHealth = 150
	health = 150
	melee_damage_lower = 10
	melee_damage_upper = 30
	move_to_delay = 4