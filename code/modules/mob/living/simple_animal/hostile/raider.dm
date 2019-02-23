/mob/living/simple_animal/hostile/raider
    name = "Raider"
    desc = "Another murderer churned out by the wastes."
    icon = 'icons/mob/wastemobs.dmi'
    icon_state = "raidermelee"
    icon_living = "raidermelee"
    icon_dead = "raidermelee_dead"
    icon_gib = "syndicate_gib"
    mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
    speak_chance = 0
    turns_per_move = 5
    response_help = "pokes"
    response_disarm = "shoves"
    response_harm = "hits"
    speed = 1
    maxHealth = 120
    health = 120
    harm_intent_damage = 5
    melee_damage_lower = 20
    melee_damage_upper = 20
    attacktext = "punches"
    attack_sound = 'sound/weapons/punch1.ogg'
    a_intent = INTENT_HARM
    loot = list(/obj/effect/mob_spawn/human/corpse/raidermelee)
    atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
    unsuitable_atmos_damage = 15
    faction = list("raider")
    check_friendly_fire = 1
    status_flags = CANPUSH
    del_on_death = 1

/mob/living/simple_animal/hostile/raider/ranged
    icon_state = "raiderranged"
    icon_living = "raiderranged"
    loot = list(/obj/effect/mob_spawn/human/corpse/raiderranged)
    ranged = 1
    retreat_distance = 5
    minimum_distance = 5
    projectilesound = 'sound/weapons/gunshot.ogg'
    casingtype = /obj/item/ammo_casing/a556

/mob/living/simple_animal/hostile/raider/ranged/boss
    name = "Raider Boss"
    icon_state = "raiderboss"
    icon_living = "raiderboss"
    maxHealth = 150
    health = 150
    rapid = 1
    casingtype = /obj/item/ammo_casing/a762
    loot = list(/obj/effect/mob_spawn/human/corpse/raiderboss)

/mob/living/simple_animal/hostile/raider/ranged/boss/Aggro()
    ..()
    summon_backup(15)
    say("KILL 'EM, FELLAS!")