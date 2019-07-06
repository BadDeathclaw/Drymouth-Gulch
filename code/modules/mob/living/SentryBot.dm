/mob/living/simple_animal/hostile/handy/sentrybot
	name = "sentry bot"
	desc = "A pre-war military robot armed with a deadly Plasma Rifle and covered in thick armor plating."
	icon_state = "sentrybot"
	icon_living = "sentrybot"
	icon_dead = "sentrybot"
	health = 80
	maxHealth = 80
	melee_damage_lower = 48
	melee_damage_upper = 72
	ranged_cooldown_time = 18 //brrrrrrrrrrrrt
	ranged = TRUE
	minimum_distance = 0
	del_on_death = FALSE
	attacktext = "pulverizes"
	attack_sound = 'sound/weapons/punch1.ogg'
	projectilesound = 'sound/weapons/pulse.ogg'
	projectiletype = /obj/item/projectile/plasma/scatter
	faction = list("wastebot")
	check_friendly_fire = TRUE

/obj/item/projectile/plasma/scatter
	damage = 50 //quantity over quality

/mob/living/simple_animal/hostile/handy/sentrybot/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		CRASH("[src] sentrybot invoked bullet_act() without a projectile")
	if(prob(10) && health > 1)
		visible_message("<span class='danger'>\The [src] releases a defensive flashbang!</span>")
		var/flashbang_turf = get_turf(src)
		if(!flashbang_turf)
			return
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
