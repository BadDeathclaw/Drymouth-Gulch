//Fallout 13 - by admins for admins.

/mob/living/simple_animal/hostile/commanded/bear
	name = "bear"
	desc = "A large brown bear, grown by admins for admins."

	icon_state = "brownbear"
	icon_living = "brownbear"
	icon_dead = "brownbear_dead"
	icon_gib = "brownbear_gib"

	health = 750
	maxHealth = 750

	move_to_delay = 1.5

	density = 1
	self_weight = 200

	attacktext = "swatted"
	melee_damage_lower = 50
	melee_damage_upper = 50

	response_help = "pets"
	response_harm = "hits"
	response_disarm = "pushes"

	known_commands = list("stay", "stop", "attack", "follow", "defend", "enemy", "friend", "pull", "dance", "boogie", "boogy")

/mob/living/simple_animal/hostile/commanded/bear/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(!.)
		src.emote("me",1,"roars in rage!")

/mob/living/simple_animal/hostile/commanded/bear/attack_hand(mob/living/carbon/human/M as mob)
	..()
	if(M.a_intent == INTENT_HELP && !master)
		master = M
	if(M.a_intent == INTENT_HARM)
		src.emote("me",1,"roars in rage!")

/mob/living/simple_animal/hostile/commanded/bear/listen()
	if(stance != COMMANDED_MISC) //cant listen if its booty shakin'
		..()

//WE DANCE!
/mob/living/simple_animal/hostile/commanded/bear/misc_command(var/mob/speaker,var/text)
	stay_command()
	stance = COMMANDED_MISC //nothing can stop this ride
	spawn(0)
		src.emote("me",1,"starts to dance!.")
		for(var/i in 1 to 10)
			if(stance != COMMANDED_MISC || incapacitated()) //something has stopped this ride.
				return
			var/message = pick(\
							"moves its head back and forth!",\
							"bobs its booty!",\
							"shakes its paws in the air!",\
							"wiggles its ears!",\
							"taps its foot!",\
							"shrugs its shoulders!",\
							"dances like you've never seen!")
			if(dir != WEST)
				setDir(WEST)
			else
				setDir(EAST)
			src.emote("me",1,message)
			sleep(30)
		stance = COMMANDED_STOP
		setDir(SOUTH)
		src.emote("me",1,"finished with its dance.")