//Fallout 13 wolf directory

/mob/living/simple_animal/hostile/wolf
	name = "feral dog"
	desc = "The dogs that survived the Great War are a larger, and tougher breed, size of a wolf.<br>This one seems to be severely malnourished and its eyes are bloody red."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "dog_angry"
	icon_living = "dog_angry"
	icon_dead = "dog_dead"
	icon_gib = "gib"
	turns_per_move = 1
	response_help = "pets"
	response_disarm = "pushes aside"
	response_harm = "kicks"
	maxHealth = 60
	health = 60
	self_weight = 35

	faction = list("hostile", "wolf")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/dog_charge1.ogg','sound/f13npc/dog_charge2.ogg','sound/f13npc/dog_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = list('sound/f13npc/dog_alert1.ogg','sound/f13npc/dog_alert2.ogg','sound/f13npc/dog_alert3.ogg')

	death_sound = 'sound/f13npc/dog_death.ogg'

	environment_smash = 0
	butcher_results = list(/obj/item/stack/sheet/animalhide/wolf = 1, \
	/obj/item/weapon/reagent_containers/food/snacks/meat/slab/wolf = 1)
	melee_damage_lower = 15
	melee_damage_upper = 5
	aggro_vision_range = 15
	idle_vision_range = 7
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	move_to_delay = 2

/mob/living/simple_animal/hostile/wolf/alpha
	name = "alpha feral dog"
	desc = "The dogs that survived the Great War are a larger, and tougher breed, size of a wolf.<br>Wait... This one's a wolf!"
	icon_state = "wolf_angry"
	icon_living = "wolf_angry"
	icon_dead = "wolf_dead"
	icon_gib = "gib"
	maxHealth = 100
	health = 100
	melee_damage_lower = 30
	melee_damage_upper = 10