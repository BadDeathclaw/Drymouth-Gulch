//Fallout 13 - my precious...

/mob/living/simple_animal/hostile/commanded/smeagol
	name = "Smeagol"
	desc = "A small slimy creature.<br>It was probably intelligent very long time ago, but something has transformed it overtime."
	icon_state = "retro_ghoul"
	icon_living = "retro_ghoul"
	icon_dead = "retro_ghoul_d"
	icon_gib = "gib"
	maxHealth = 175
	health = 175
	speak_chance = 1
	speak = list("Gollum! Gollum!", "We wants it, we needs it. Must have the precious. They stole it from us. Sneaky little hobbitses. Wicked, tricksy, false!", \
	"Gollum, gollum...", "The rock and pool, is nice and cool, so juicy sweet. Our only wish, to catch a fish, so juicy sweet.",\
	"Master betrayed us. Wicked. Tricksy, False. We ought to wring his filthy little neck. Kill him! Kill him! Kill them both! And then we take the precious... And we be the master!",\
	"He wants the Precious. Always he is looking for it. And the Precious is wanting to go back to him... But we mustn't let him have it.",\
	"We swears to serve the master of the Precious. We will swear on... On... The Precious!",\
	"We swear to serve the Master of the Precious... We swore on, on only... Only the Precious. Gollum, gollum!",\
	"My Precious...", "Filthy, little hobbitses! They stole it from us!",\
	"They cursed us. Murderer they called us. They cursed us, and drove us away. And we wept, Precious, we wept to be so alone. And we only wish to catch fish so juicy sweet. And we forgot the taste of bread... The sound of trees... The softness of the wind. We even forgot our own name. My Precious.")
	speak_emote = list("whimpers", "says")
	emote_hear = list("coughs", "whimpers", "looks around", "talks to itself", "starts to dig ground beneath it")
	emote_see = list("makes a scary face", "makes a horrible swallowing noise in his throat", "prepares to jump", "is looking for something")
	response_help  = "touches"
	response_disarm = "pushes"
	response_harm   = "kicks"
	faction = list("ghoul")
	butcher_results = list(/obj/effect/gibspawner/xeno = 1)
	self_weight = 45
	melee_damage_lower = 15
	melee_damage_upper = 30
	death_sound = 'sound/f13npc/ghoul_death.ogg'
	var/obj/item/ring/precious

/mob/living/simple_animal/hostile/commanded/smeagol/Life()
	if(precious == null)
		precious = (locate(/obj/item/ring) in world)
	if(precious && ismob(precious.loc))
		master = precious.loc
	else
		master = null
	..()

/mob/living/simple_animal/hostile/commanded/smeagol/accepted()
	say("Yes, Master!")

/mob/living/simple_animal/hostile/commanded/smeagol/unacsessable()
	say("Forgive me, my Master.")