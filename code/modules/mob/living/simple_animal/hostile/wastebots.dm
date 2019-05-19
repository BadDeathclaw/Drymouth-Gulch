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
	rapid = 1
	ranged = 1
	retreat_distance = 2
	minimum_distance = 2

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
	healable = 0
	speed = 4
	melee_damage_lower = 45
	melee_damage_upper = 45
	rapid = 1
	ranged = 1
	retreat_distance = 2
	minimum_distance = 2
	attacktext = "slaps"
	attack_sound = 'sound/weapons/punch1.ogg'
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/beam/laser/pistol
	faction = list("wastebot")
	check_friendly_fire = 1

/mob/living/simple_animal/hostile/handy/sentrybot
	name = "sentry bot"
	desc = "A pre-war military robot armed with a deadly gatling laser and covered in thick armor plating."
	icon_state = "sentrybot"
	icon_living = "sentrybot"
	icon_dead = "sentrybot"
	health = 360
	maxHealth = 360
	healable = 0
	speed = 1
	melee_damage_lower = 85
	melee_damage_upper = 85
	rapid = 2 //6 projectiles. oof.
	ranged_cooldown_time = 15 //brrrrrrrrrrrrt
	ranged = 1
	retreat_distance = 0
	minimum_distance = 0
	attacktext = "pulverizes"
	attack_sound = 'sound/weapons/punch1.ogg'
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/beam/laser/pistol/weak
	faction = list("wastebot")
	check_friendly_fire = 1

/obj/item/projectile/beam/laser/pistol/weak
	damage = 10 //quantity over quality

/mob/living/simple_animal/hostile/handy/sentrybot/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(10))
		visible_message("<span class='danger'>\The [src] releases a defensive flashbang!</span>")
		sleep(3)
		var/flashbang_turf = get_turf(src)
		if(!flashbang_turf)
			return
		for(var/mob/living/M in get_hearers_in_view(4, flashbang_turf))
			bang(get_turf(M), M)
	if(prob(75) || Proj.damage > 26) //prob(x) = chance for proj to actually do something, adjust depending on how OP you want sentrybots to be
		return ..()
	else
		visible_message("<span class='danger'>\The [Proj] bounces off \the [src]'s armor plating!</span>")
		return 0

/mob/living/simple_animal/hostile/handy/sentrybot/proc/bang(turf/T , mob/living/M)
	if(M.stat == DEAD)	//They're dead!
		return
	M.show_message("<span class='warning'>BANG</span>", 2)
	playsound(loc, 'sound/weapons/flashbang.ogg', 100, 1)
	var/distance = max(0,get_dist(get_turf(src),T))

//Flash
	if(M.flash_act(affect_silicon = 1))
		M.Knockdown(max(200/max(1,distance), 60))
//Bang
	if(!distance || loc == M || loc == M.loc)
		M.Knockdown(200)
		M.soundbang_act(1, 200, 10, 15)

	else
		M.soundbang_act(1, max(200/max(1,distance), 60), rand(0, 5))

/mob/living/simple_animal/hostile/handy/sentrybot/Destroy()
	do_sparks(3, TRUE, src)
	visible_message("<span class='danger'>\The [src] begins to beep ominously!</span>")
	playsound(src, 'sound/machines/triple_beep.ogg', 75, TRUE)
	sleep(10)
	playsound(src, 'sound/machines/triple_beep.ogg', 75, TRUE)
	sleep(10)
	playsound(src, 'sound/machines/triple_beep.ogg', 75, TRUE)
	sleep(10)
	playsound(src, 'sound/machines/triple_beep.ogg', 75, TRUE)
	sleep(10)
	explosion(src,2,4,8,8)
	return ..()

/mob/living/simple_animal/hostile/handy/sentrybot/Aggro()
    ..()
    summon_backup(15)
    say("Alert: hostiles detected. Engaging.")