/mob/living/simple_animal/hostile/ghoul
	name = "feral ghoul"
	desc = "A ghoul that has lost it's mind and become aggressive."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "ghoul"
	icon_living = "ghoul"
	icon_dead = "ghoul"
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("screeches")
	a_intent = INTENT_HARM
	maxHealth = 60
	health = 60
	speed = 1
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "claws"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	robust_searching = 0
	stat_attack = UNCONSCIOUS
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("ghoul")

/mob/living/simple_animal/hostile/ghoul/reaver
	name = "feral ghoul reaver"
	desc = "A ghoul that has lost it's mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "ghoul_reaver"
	icon_living = "ghoul_reaver"
	icon_dead = "ghoul_reaver"
	a_intent = INTENT_HARM
	maxHealth = 160
	health = 160
	harm_intent_damage = 5
	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/simple_animal/hostile/ghoul/glowing
	desc = "A feral ghoul that has absorbed massive amounts of radiation, causing them to glow in the dark and radiate constantly.."
	icon_state = "glowinghoul"
	icon_living = "glowinghoul"
	icon_dead = "glowinghoul_dead"
	maxHealth = 120
	health = 120
	harm_intent_damage = 15
	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/simple_animal/hostile/ghoul/glowing/Initialize()
	. = ..()
	set_light(2)

/mob/living/simple_animal/hostile/ghoul/glowing/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/ghoul/glowing/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.apply_effect(5,EFFECT_IRRADIATE,0)