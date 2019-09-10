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

/mob/living/simple_animal/pet/dog/protectron //Not an actual dog
	name = "Trading Protectron"
	desc = "A standard RobCo RX2 V1.16.4 \"Trade-o-Vend\", loaded with Trade protocols.<br>Looks like it was kept operational for an indefinite period of time. Its body is covered in cracks and dents of various sizes.<br>As it has been repaired countless times, it's amazing the machine is still functioning at all."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "protectron"
	icon_living = "protectron"
	icon_dead = "protectron_d"
	maxHealth = 200
	health = 200
	speak_chance = 5
	faction = list("neutral", "silicon", "dog", "hostile", "pirate", "wastebot", "wolf", "plants", "turret", "enclave", "ghoul", "cazador", "supermutant", "gecko", "slime", "radscorpion", "skeleton", "carp", "bs", "bighorner")
	speak = list("Welcome to my trading stale! On behalf of our company we wish you a to survive long enough to buy our products!", "Welcome back, traveler! How can I help you today? Fancy bying something from this vending machine? It is good!", "Line up for another great series of purchases! It will keep you alive a bit longer! Just a bit.", "My sensor tell it's almost 40 degrees Celsius in here. Good think I am trustworthy machine and not a sweating chunk of meat like you.", "You can blame the RobCo Industries for making androids with Genuine People Personalities. I'm a personality prototype. You can tell, can't you...?", "Remember three important rules of our trading stale! 1. No refunds. 2. No damaging the stale. 3. No refunds. Seriously.", "The first hundred years were the worst. And the second hundred - they were the worst, too. The third hundred I didn't enjoy at all. After that, I went into a bit of a decline.", "You think you've got problems. What are you supposed to do if you are a manically depressed robot? No, don't even bother answering. I'm 50,000 times more intelligent than you and even I don't know the answer.", "What a beautiful day! Shame I can't have a walk. On the other hand - I don't have to deal with all these terrible creatures out there. Speaking of which - you should totally buy something to protect yourself!")
	speak_emote = list()
	emote_hear = list()
	emote_see = list()
	response_help  = "shakes its manipulator"
	response_disarm = "pushes"
	response_harm   = "punches"
	attack_sound = 'sound/voice/liveagain.ogg'
	butcher_results = list(/obj/effect/gibspawner/robot = 1)

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
