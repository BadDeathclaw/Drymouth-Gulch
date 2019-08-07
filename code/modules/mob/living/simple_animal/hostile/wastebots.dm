/mob/living/simple_animal/hostile/handy
	name = "mr. handy"
	desc = "A crazed pre-war household assistant robot, armed with a cutting saw."
	icon = 'icons/mob/robots.dmi'
	icon_state = "handy"
	icon_living = "handy"
	icon_dead = "gib7"
	gender = NEUTER
	mob_biotypes = list(MOB_ROBOTIC)
	anchored = TRUE //unpullable
	health = 160
	maxHealth = 160
	healable = 0
	speed = 1
	melee_damage_lower = 56
	melee_damage_upper = 56
	stat_attack = UNCONSCIOUS
	robust_searching = 1
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

/mob/living/simple_animal/hostile/handy/Initialize()
	. = ..()
	add_overlay("eyes-[initial(icon_state)]")

/mob/living/simple_animal/hostile/handy/gutsy
	name = "mr. gutsy"
	desc = "A pre-war combat robot based off the Mr. Handy design, armed with plasma weaponry and a deadly close-range flamer."
	icon_state = "gutsy"
	icon_living = "gutsy"
	icon_dead = "gib7"
	health = 200
	maxHealth = 200
	melee_damage_lower = 72
	melee_damage_upper = 72
	attack_sound = 'sound/items/welder.ogg'
	attacktext = "shoots a burst of flame at"
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/plasma/scatter
	extra_projectiles = 2
	ranged = TRUE
	retreat_distance = 2
	minimum_distance = 2
	check_friendly_fire = TRUE

/mob/living/simple_animal/hostile/handy/gutsy/AttackingTarget()
	. = ..()

/mob/living/simple_animal/hostile/handy/protectron
	name = "protectron"
	desc = "A pre-war security robot armed with deadly lasers."
	icon_state = "protectron"
	icon_living = "protectron"
	icon_dead = "protectron_dead"
	health = 160
	maxHealth = 160
	speed = 4
	melee_damage_lower = 45
	melee_damage_upper = 45
	extra_projectiles = 2
	ranged = TRUE
	retreat_distance = 2
	minimum_distance = 2
	attacktext = "slaps"
	attack_sound = 'sound/weapons/punch1.ogg'
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/beam/laser/pistol
	faction = list("wastebot")
	check_friendly_fire = TRUE

/mob/living/simple_animal/hostile/handy/sentrybot
	name = "sentry bot"
	desc = "A pre-war military robot armed with a deadly gatling laser and covered in thick armor plating."
	icon_state = "sentrybot"
	icon_living = "sentrybot"
	icon_dead = "sentrybot"
	health = 280
	maxHealth = 280
	melee_damage_lower = 48
	melee_damage_upper = 72
	extra_projectiles = 5 //6 projectiles
	ranged_cooldown_time = 12 //brrrrrrrrrrrrt
	ranged = TRUE
	retreat_distance = 2
	minimum_distance = 2
	del_on_death = FALSE
	attacktext = "pulverizes"
	attack_sound = 'sound/weapons/punch1.ogg'
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/beam/laser/pistol/weak
	faction = list("wastebot")
	check_friendly_fire = TRUE

/obj/item/projectile/beam/laser/pistol/weak
	damage = 15 //quantity over quality

/mob/living/simple_animal/hostile/handy/sentrybot/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		CRASH("[src] sentrybot invoked bullet_act() without a projectile")
	if(prob(10) && health > 1)
		visible_message("<span class='danger'>\The [src] releases a defensive flashbang!</span>")
		var/flashbang_turf = get_turf(src)
		if(!flashbang_turf)
			return
		var/obj/item/grenade/flashbang/sentry/S = new /obj/item/grenade/flashbang/sentry(flashbang_turf)
		S.preprime(user = null)
	if(prob(75) || Proj.damage > 26) //prob(x) = chance for proj to actually do something, adjust depending on how OP you want sentrybots to be
		return ..()
	else
		visible_message("<span class='danger'>\The [Proj] bounces off \the [src]'s armor plating!</span>")
		return FALSE

/mob/living/simple_animal/hostile/handy/sentrybot/proc/do_death_beep()
	playsound(src, 'sound/machines/triple_beep.ogg', 75, TRUE)
	visible_message("<span class='warning'>You hear an ominous beep coming from [src]!</span>", "<span class='warning'>You hear an ominous beep!</span>")

/mob/living/simple_animal/hostile/handy/sentrybot/proc/self_destruct()
	explosion(src,1,2,4,4)
	qdel(src)

/mob/living/simple_animal/hostile/handy/sentrybot/death()
	do_sparks(3, TRUE, src)
	for(var/i in 1 to 3)
		addtimer(CALLBACK(src, .proc/do_death_beep), i * 1 SECONDS)
	addtimer(CALLBACK(src, .proc/self_destruct), 4 SECONDS)
	return ..()

/mob/living/simple_animal/hostile/handy/sentrybot/Aggro()
	. = ..()
	summon_backup(15)
