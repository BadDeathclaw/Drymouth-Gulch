//Fallout 13 protectron directory

/mob/living/simple_animal/hostile/protectron
	name = "protectron"
	desc = "A pre-War type of protectron.<br>Extremely dangerous machine."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "protectron_old"
	icon_living = "protectron_old"
	icon_dead = "protectron_old_d"
	icon_gib = "protectron_old_d"
	speak_chance = 0
	turns_per_move = 5
	environment_smash = 0
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	move_to_delay = 5
	stat_attack = 1
	robust_searching = 1
	maxHealth = 150
	health = 150
	self_weight = 200
	healable = 0

	faction = list("hostile")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/robot_charge1.ogg','sound/f13npc/robot_charge2.ogg','sound/f13npc/robot_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/robot_alert.ogg'

	death_sound = 'sound/f13npc/robot_death.ogg'

	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 10
	minimum_distance = 4
	retreat_distance = 7
	attacktext = "punches"
	attack_sound = "punch"
	a_intent = "harm"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	status_flags = CANPUSH
	vision_range = 12
	aggro_vision_range = 15
	idle_vision_range = 7
	ranged = 1
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/weapons/resonator_fire.ogg'

/mob/living/simple_animal/pet/dog/protectron //Not an actual dog
	name = "Marvin"
	desc = "A standard RobCo RX2 V1.16.4 \"Vault helper\", loaded with Vault protocols.<br>Looks like it was kept operational for an indefinite period of time. Its body is covered in cracks and dents of various sizes.<br>As it has been repaired countless times, it's amazing the machine is still functioning at all."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "protectron"
	icon_living = "protectron"
	icon_dead = "protectron_dead"
	maxHealth = 50
	health = 50
	speak_chance = 30
	speak = list("Welcome to Vault 113! On behalf of Vault-Tec Corporation we wish you a good stay!", "Vault Dweller - remember the basic rules! 1. Always obey the Overseer and his orders! 2. Never under any circumstances leave the safety of the Vault, unless the Overseer orders you to do so! 3. If you feel sick or strange, contact medical personnel immediately!", "If the Overseer orders you to evacuate the Vault, remember the Vault-Tec Vault Evacuation Protocol! 1. Line up in an orderly fashion! 2. To avoid instant ocular damage due to bright sunlight, use protective eyewear! 3. Once outside the Vault, be prepared to live a new life with help from the Garden of Eden Creation Kit! 4. Use the G.E.C.K. to create the New World you've been waiting for!", "Vault Dweller, remember - I'm a robot. I'm not a refrigerator.", "You can blame the RobCo Industries for making androids with Genuine People Personalities. I'm a personality prototype. You can tell, can't you...?", "Here I am, brain the size of a planet, and they ask me to take you to the Overseer. Call that job satisfaction, 'cause I don't.", "The first ten million years were the worst. And the second ten million - they were the worst, too. The third ten million I didn't enjoy at all. After that, I went into a bit of a decline.", "You think you've got problems. What are you supposed to do if you are a manically depressed robot? No, don't even bother answering. I'm 50,000 times more intelligent than you and even I don't know the answer.", "Ghastly, isn't it? All the doors in this Vault have been programmed to have a cheery and sunny disposition.", "It is better not to leave the safety of the Vault. I've calculated your chance of survival, but I don't think you'll like it.")
	speak_emote = list("beeps", "buzzes")
	emote_hear = list("beeps", "buzzes", "is scanning the enviroment","is experiencing a slight system lag")
	emote_see = list("waves with its manipulators", "is calculating chances of survival", "has something going on deep inside of its CPU", "recovers from yet another system error")
	response_help  = "shakes its manipulator"
	response_disarm = "pushes"
	response_harm   = "punches"
	attack_sound = 'sound/voice/liveagain.ogg'
	butcher_results = list(/obj/effect/gibspawner/robot = 1)