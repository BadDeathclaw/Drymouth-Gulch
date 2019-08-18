/mob/living/simple_animal/hostile/centaur
	name = "Centaur"
	desc = "The result of infection by FEV gone horribly wrong."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "centaur"
	icon_living = "centaur"
	icon_dead = "centaur_d"
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("screeches")
	a_intent = INTENT_HARM
	maxHealth = 100
	health = 100
	speed = 2
	harm_intent_damage = 15
	melee_damage_lower = 15
	melee_damage_upper = 15
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	attacktext = "whipped"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	robust_searching = 0
	stat_attack = UNCONSCIOUS
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("supermutant")
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human/centaur = 3,
							/obj/item/stack/sheet/animalhide/human = 2,
							/obj/item/stack/sheet/bone = 2)
	projectiletype = /obj/item/projectile/neurotox
	projectilesound = 'sound/weapons/pierce.ogg'

/obj/item/projectile/neurotox
	name = "spit"
	damage = 30
	icon_state = "toxin"