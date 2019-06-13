//Holodisks stuff
//Here we get the basic mechanics as coded by WB! Praise him and other Unknown coder for this.

/obj/item/weapon/holodisk
	name = "holodisk"
	desc = "A durable laser-readable storage device produced by Wattz Electronics, based on the tape holography technology, storing their information safely for extended periods of time."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "holodisk"
	item_state = "holodisk"
	throwforce = 0
	hitsound = null
	w_class = 1.0
	throw_speed = 3
	throw_range = 7
	attack_verb = list("Played holodisk")
	var/busy = 0
	var/soundLength = 50
	var/soundFile = 'sound/f13music/mysterious_stranger.ogg'

/obj/item/weapon/holodisk/New()
        src.name = "holodisk #[rand(1,999)]"
        return ..()

/obj/item/weapon/holodisk/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	src.playAudio(user)
	return ..()

/obj/item/weapon/holodisk/attack_self(mob/user as mob)
	src.playAudio(user)
	return

/obj/item/weapon/holodisk/proc/playAudio(mob/user)
	if(!src.busy)
		src.busy = 1
		playsound(get_turf(src),src.soundFile,50)
		src.add_fingerprint(user)
		src.icon_state = "[initial(src.icon_state)]anim"
		spawn(src.soundLength)
			src.icon_state = initial(src.icon_state)
			src.busy = 0
	return

//Here we get any holodisks we want, using the basic mechanics.

/obj/item/weapon/holodisk/holodiskabducted
	soundFile =  'sound/f13items/holodisk_abducted.ogg'
	soundLength = 430

//One special holodisk can gib the listener or cripple someone else.

/obj/item/weapon/holodisk/holodiskcursed
	soundFile =  'sound/f13items/holodisk_cursed.ogg'
	soundLength = 230
	throwforce = 50 //It's funny counting you can't give objects hand to hand on TG, but have to throw or drop them instead.

/obj/item/weapon/holodisk/holodiskcursed/playAudio(mob/user)
	if(!src.busy)
		src.busy = 1
		playsound(get_turf(src),src.soundFile,50)
		src.add_fingerprint(user)
		src.icon_state = "[initial(src.icon_state)]anim"
		spawn(src.soundLength)
			if(user) user.gib()
			src.icon_state = initial(src.icon_state)
			src.busy = 0
	return

/obj/item/weapon/holodisk/powerarmor
	desc = "A durable laser-readable storage device produced by Wattz Electronics, based on the tape holography technology, storing their information safely for extended periods of time.<br>This one is labeled, 'Power Armor For Dummies.'"
	soundFile =  'sound/f13items/holodisk_pa.ogg'
	soundLength = 30

/obj/item/weapon/holodisk/music1
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording one'"
	soundFile =  'sound/f13music/new_vegas_show_1.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/music2
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording two'"
	soundFile =  'sound/f13music/new_vegas_show_2.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/music3
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording three'"
	soundFile =  'sound/f13music/new_vegas_show_3.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/music4
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording four'"
	soundFile =  'sound/f13music/new_vegas_show_4.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/music5
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording five'"
	soundFile =  'sound/f13music/new_vegas_show_5.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/music6
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording six'"
	soundFile =  'sound/f13music/new_vegas_show_6.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/musicspecial1
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording special1'"
	soundFile =  'sound/f13music/new_vegas_show_bonus_1.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/musicspecial2
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording special2 personal favourite'"
	soundFile =  'sound/f13music/new_vegas_show_bonus_2.ogg'
	soundLength = 246

/obj/item/weapon/holodisk/questfinished
	desc = "A durable laser-readable storage device. This one is labeled 'A curious sound'"
	soundFile =  'sound/f13music/quest.ogg'
	soundLength = 12

/obj/item/weapon/holodisk/clown
	desc = "A durable laser-readable storage device. This one is labeled 'Chick chicka boom'"
	soundFile =  'sound/ambience/clown.ogg'
	soundLength = 61

/obj/item/weapon/holodisk/powerarmor/playAudio(mob/user)
	if(!src.busy)
		src.busy = 1
		playsound(get_turf(src),src.soundFile,50)
		src.add_fingerprint(user)
		src.icon_state = "[initial(src.icon_state)]anim"
		spawn(src.soundLength)
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				var/datum/martial_art/patraining/F = new/datum/martial_art/patraining(null)
				F.teach(H)
				H << "<span class='boldannounce'>You have received the specialized training needed to move in any form of Power Armor.</span>"
			src.icon_state = initial(src.icon_state)
			src.busy = 0
			visible_message("<span class='warning'>[src] self-destructs!</span>")
			qdel(src)
	return
