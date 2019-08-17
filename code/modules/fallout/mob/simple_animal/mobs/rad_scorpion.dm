//Fallout 13 rad scorpion directory

/mob/living/simple_animal/hostile/rad_scorpion
	name = "giant radscorpion"
	desc = "A mutated arthropod with an armored carapace and a powerful sting."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "radscorpion"
	icon_living = "radscorpion"
	icon_dead = "radscorpion_d"
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	anchored = TRUE //unpullable
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/carpmeat = 2)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	speed = 1
	maxHealth = 80
	health = 80
	harm_intent_damage = 8
	obj_damage = 20
	melee_damage_lower = 5
	melee_damage_upper = 25
	attacktext = "stings"
	attack_sound = 'sound/creatures/radscorpion_attack.ogg'
	speak_emote = list("hisses")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("radscorpion")
	gold_core_spawnable = HOSTILE_SPAWN

/mob/living/simple_animal/hostile/radscorpion/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.reagents.add_reagent("toxin", 5)

/mob/living/simple_animal/hostile/rad_scorpion/black
	name = "giant black radscorpion"
	desc = "A mutated arthropod with an armored carapace and a powerful sting. This one has a black carapace."
	icon_state = "radscorpion_black"
	icon_living = "radscorpion_black"
	icon_dead = "radscorpion_black_d"
	maxHealth = 150
	health = 150
	melee_damage_lower = 5
	melee_damage_upper = 30