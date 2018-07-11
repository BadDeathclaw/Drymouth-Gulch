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
	speak_chance = 1
	taunt_chance = 25
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 5)
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "hits"
	maxHealth = 100
	health = 100
	obj_damage = 60
	melee_damage_lower = 25
	melee_damage_upper = 40
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
	health = 180
	melee_damage_lower = 35
	melee_damage_upper = 50
	color = rgb(95,104,94)