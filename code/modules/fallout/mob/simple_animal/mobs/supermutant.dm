//Fallout 13 super mutants directory

/mob/living/simple_animal/hostile/supermutant
	name = "super mutant"
	desc = "A huge and ugly mutant humanoid."
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_113_s"
	icon_living = "hulk_113_s"
	icon_dead = "hulk_113_s"
	speak_chance = 10
	speak = list("GRRRRRR!", "ARGH!", "NNNNNGH!", "HMPH!", "ARRRRR!")
	speak_emote = list("shouts", "yells")
	move_to_delay = 5
	environment_smash = 2
	turns_per_move = 5
	response_help = "touches"
	response_disarm = "tries to perform a kung fu move, then suddenly remembers that it's actually"
	response_harm = "hits"
	maxHealth = 300
	health = 300
	force_threshold = 15
	faction = list("hostile", "supermutant")
	melee_damage_lower = 10
	melee_damage_upper = 30
	mob_size = MOB_SIZE_LARGE
	attacktext = "hits"
	attack_sound = "punch"
	self_weight = 250

/mob/living/simple_animal/hostile/supermutant/death(gibbed)
	icon = 'icons/fallout/mobs/supermutant_dead.dmi'
	icon_state = icon_dead
	..()

/mob/living/simple_animal/pet/dog/mutant    //This is a supermutant, totally not a dog, and he is friendly
	name = "Brah Min"
	desc = "A huge and ugly mutant humanoid with a showel full of brahmin feces.<br>He behaves totally insane and it seems he can speak only English language.<br>He's all concerned only about his (probably not much so) brahmins."
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_brahmin_s"
	icon_dead = "hulk_brahmin_s"
	maxHealth = 300
	health = 300
	speak_chance = 30
	speak = list("Hey you! These are my brahmins!", "And I say, HEY-YEY-AAEYAAA-EYAEYAA! HEY-YEY-AAEYAAA-EYAEYAA! I SAID HEY, what's going on?", "What do you want from my brahmins?!", "Me gonna clean brahmin poop again now!", "I love brahmins, brahmins are good, just poop much!", "Do not speak to my brahmins ever again, you hear?!", "Bad raiders come to steal my brahmins - I crush their heads with my brahmin poop shovel!", "Do not come to my brahmins! Do not touch my brahmins! Do not look at my brahmins!", "I'm watching you, and my brahmins watch too!", "Brahmins say moo, and I'm saying - hey, get your ugly face out of my way!")
	speak_emote = list("shouts", "yells")
	emote_hear = list("looks around", "takes a combat position", "is counting brahmins","yawns")
	emote_see = list("raises his brahmin poop shovel", "sticks his shovel into a large pile of brahmin feces", "shovels some brahmin feces away", "waves his brahmin poop shovel above his head angrily")
	response_help  = "touches"
	response_disarm = "pushes"
	response_harm   = "punches"
	attack_sound = 'sound/misc/gameover.ogg'
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/bearsteak = 3)

/mob/living/simple_animal/pet/dog/mutant/death(gibbed)
	icon = 'icons/fallout/mobs/supermutant_dead.dmi'
	icon_state = icon_dead
	if(!gibbed)
		visible_message("<span class='danger'>\the [src] shouts something incoherent about brahmins for the last time and stops moving...</span>")
	..()