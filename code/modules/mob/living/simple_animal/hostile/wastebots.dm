/mob/living/simple_animal/hostile/handy
	name = "mr. handy"
	desc = "A crazed pre-war household assistant robot, armed with a cutting saw."
	icon = 'icons/mob/robots.dmi'
	icon_state = "handy"
	icon_living = "handy"
	icon_dead = "gib7"
	gender = NEUTER
	mob_biotypes = list(MOB_ROBOTIC)
	health = 160
	maxHealth = 160
	healable = 0
	speed = 1
	melee_damage_lower = 56
	melee_damage_upper = 56
	attacktext = "slaps"
	attack_sound = 'sound/weapons/circsawhit.ogg'
	faction = list("wastebot")
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speak_emote = list("states")
	gold_core_spawnable = HOSTILE_SPAWN
	del_on_death = 1
	loot = list(/obj/effect/decal/cleanable/robot_debris)
	deathmessage = "blows apart!"

/mob/living/simple_animal/hostile/handy/gutsy
	name = "mr. gutsy"
	desc = "A pre-war combat robot based off the Mr. Handy designed, armed with plasma weaponry and a deadly close-range flamer."
	icon_state = "gutsy"
	icon_living = "gutsy"
	icon_dead = "gib7"
	health = 400
	maxHealth = 400
	melee_damage_lower = 72
	melee_damage_upper = 72
	attack_sound = 'sound/items/welder.ogg'
	attacktext = "shoots a burst of flame at"
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/plasma/pistol
	rapid = 1
	ranged = 1
	retreat_distance = 2
	minimum_distance = 2

/mob/living/simple_animal/hostile/handy/gutsy/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.adjust_fire_stacks(2)
		H.IgniteMob()

/mob/living/simple_animal/hostile/handy/protectron
	name = "protectron"
	desc = "A pre-war security robot armed with deadly lasers."
	icon_state = "protectron"
	icon_living = "protectron"
	icon_dead = "protectron_dead"
	health = 160
	maxHealth = 160
	healable = 0
	speed = 2
	melee_damage_lower = 25
	melee_damage_upper = 25
	rapid = 1
	ranged = 1
	attacktext = "slaps"
	attack_sound = 'sound/weapons/punch1.ogg'
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/beam/laser/pistol
	faction = list("wastebot")
	check_friendly_fire = 1