/mob/living/simple_animal/hostile/deathclaw
	name = "deathclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match."
	icon = 'icons/mob/deathclaw.dmi'
	icon_state = "deathclaw"
	icon_living = "deathclaw"
	icon_dead = "deathclaw_dead"
	icon_gib = "deathclaw_gib"
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	stat_attack = UNCONSCIOUS
	speak = list("ROAR!","Rawr!","GRRAAGH!","Growl!")
	speak_emote = list("growls", "roars")
	emote_hear = list("grumbles.","grawls.")
	emote_taunt = list("stares ferociously", "stomps")
	speak_chance = 10
	taunt_chance = 25
	speed = 1
	see_in_dark = 8
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/deathclaw = 5)
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "hits"
	maxHealth = 420
	health = 420
	obj_damage = 60
	melee_damage_lower = 56
	melee_damage_upper = 56
	attacktext = "claws"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	friendly = "hugs"
	faction = list("deathclaw")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 5
	gold_core_spawnable = HOSTILE_SPAWN

/mob/living/simple_animal/hostile/deathclaw/mother
	name = "mother deathclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. This one is an angry mother."
	health = 600
	melee_damage_lower = 72
	melee_damage_upper = 72
	color = rgb(95,104,94)