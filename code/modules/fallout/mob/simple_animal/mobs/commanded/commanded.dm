// BAY STATION 12 version of commanded mobs.

/mob/living/simple_animal/hostile/commanded
	name = "commanded"
	var/stance = COMMANDED_STOP
	melee_damage_lower = 0
	melee_damage_upper = 0
	density = 1
	icon = 'icons/fallout/mobs/animal.dmi'
	var/list/command_buffer = list()
	var/list/known_commands = list("stay", "stop", "attack", "follow", "defend", "enemy", "friend", "pull")
	var/mob/master = null //undisputed master. Their commands hold ultimate sway and ultimate power.
	var/go/pointed_target = null
	var/go/follow_target = null
	var/search_enemy = 1
	var/list/faction_enemy = list("hostile")
	var/list/allowed_targets = list() //WHO CAN I KILL D:
	var/retribution = 1 //whether or not they will attack us if we attack them like some kinda dick.

/mob/living/simple_animal/hostile/commanded/Hear(message, go/speaker, message_langs, raw_message, radio_freq, list/spans)
	if((speaker in friends) || speaker == master)
		command_buffer.Add(speaker)
		command_buffer.Add(lowertext_uni(html_decode(raw_message)))
	return 0

/mob/living/simple_animal/hostile/commanded/CanAttack(atom/the_target)
	if(!the_target)
		return 0
	if(see_invisible < the_target.invisibility)//Target's invisible to us, forget it
		return 0
	if(isliving(the_target))
		var/mob/living/L = the_target
		if(robust_searching)
			if(L.stat > stat_attack || L.stat != stat_attack && stat_exclusive == 1)
				return 0
		else
			if(L.stat)
				return 0
		if(allowed_targets.Find("anybody") && !(the_target == master || friends.Find(the_target)))
			return 1
		if(allowed_targets.Find(the_target) || is_enemy(the_target))
			return 1
		return 0

	if(istype(the_target, /obj/mecha))
		var/obj/mecha/M = the_target
		if(M.occupant)//Just so we don't attack empty mechs
			if(CanAttack(M.occupant))
				return 1

	if(istype(the_target, /obj/machinery/porta_turret))
		var/obj/machinery/porta_turret/P = the_target
		if(P.faction in faction)
			return 0
		if(P.has_cover &&!P.raised) //Don't attack invincible turrets
			return 0
		if(P.stat & BROKEN) //Or turrets that are already broken
			return 0
		return 1
	return 0

/mob/living/simple_animal/hostile/commanded/Life()
	while(command_buffer.len > 0)
		var/mob/speaker = command_buffer[1]
		var/text = command_buffer[2]
		var/filtered_name = lowertext(html_decode(name))
		if(parse_phrase(text,filtered_name) || parse_phrase(text,"anybody")) //in case somebody wants to command 8 bears at once.
			var/substring = copytext(text,length(filtered_name)+1) //get rid of the name.
			listen(speaker,substring)
		command_buffer.Remove(command_buffer[1],command_buffer[2])
	. = ..()
	if(.)
		switch(stance)
			if(COMMANDED_FOLLOW)
				follow_target()
			if(COMMANDED_DEFEND)
				follow_target()
			if(COMMANDED_PULL)
				follow_target()
			if(COMMANDED_STOP)
				commanded_stop()

/mob/living/simple_animal/hostile/commanded/FindTarget(var/list/possible_targets, var/HasTargetsList = 0)
	if(!search_enemy)
		return
	. = ..()
/*8/
	if(!search_enemy)
		return
	if(!HasTargetsList)
		possible_targets = ListTargets()
	var/mode = "specific"
	if("anybody" in allowed_targets) //we have been given the golden gift of murdering everything. Except our master, of course. And our friends. So just mostly everyone.
		mode = "anybody"
	for(var/atom/A in possible_targets)
		var/mob/M = null
		if(A == src)
			continue
		if(isliving(A))
			M = A
		if(istype(A,/obj/mecha))
			var/obj/mecha/mecha = A
			if(!mecha.occupant)
				continue
			M = mecha.occupant
		if(M && M.stat)
			continue
		if(mode == "specific")
			if(!(A in allowed_targets) && !(M && is_enemy(M)))
				continue
			GiveTarget(A)
			return A
		else
			if(M == master || (M in friends))
				continue
			GiveTarget(A)
			return A
*/

/mob/living/simple_animal/hostile/commanded/proc/target_point(var/atom/target, var/mob/user)
	if(user == master)
		pointed_target = target
		if(search_enemy && ismob(target) && !(target in allowed_targets))
			allowed_targets += target
			return
//		if(stance == COMMANDED_FOLLOW || (stance == COMMANDED_PULL && (isobj(target) || ismob(target))))
//			follow_target = target
//			return
	return

/mob/living/simple_animal/hostile/commanded/proc/follow_target()
	stop_automated_movement = 1
	if(target)
		return
	if(!follow_target)
		return
	var/range = 2
	if(isobj(follow_target) || isturf(follow_target) || stance == COMMANDED_PULL)
		range = 0
		if(follow_target.density)
			range = 1
	if((isturf(follow_target) && (follow_target in range(vision_range,src))) || (isitem(follow_target) && (follow_target in oview(vision_range, src))) || (follow_target in ListTargets()))
		walk_to(src,follow_target,range,move_to_delay)
	if(stance == COMMANDED_PULL && follow_target.pulledby != src && follow_target.Adjacent(src))
		start_pulling(follow_target)
	if(src.x == follow_target.x && src.y == follow_target.y)
		setDir(pick(NORTH, SOUTH, EAST, WEST))
	else
		face_atom(follow_target)

/mob/living/simple_animal/hostile/commanded/start_pulling(go/AM, supress_message = 0)
	if(isitem(AM))
		var/obj/item/I = AM
		if(I.w_class > 3)
			return
	if(!isitem(AM) && !ismob(AM))
		return
	. = ..()

/mob/living/simple_animal/hostile/commanded/proc/commanded_stop() //basically a proc that runs whenever we are asked to stay put. Probably going to remain unused.
	return

/mob/living/simple_animal/hostile/commanded/proc/listen(var/mob/speaker, var/text)
	for(var/command in known_commands)
		if(parse_phrase(text,command))
			switch(command)
				if("stay")
					if(stay_command(speaker,text)) //find a valid command? Stop. Dont try and find more.
						break
				if("stop")
					if(stop_command(speaker,text))
						break
				if("attack")
					if(attack_command(speaker,text))
						break
				if("follow")
					if(follow_command(speaker,text))
						break
				if("defend")
					if(defend_command(speaker,text))
						break
				if("enemy")
					if(enemy_command(speaker,text))
						break
				if("friend")
					if(friend_command(speaker,text))
						break
				if("pull")
					if(pull_command(speaker,text))
						break
				else
					misc_command(speaker,text) //for specific commands

	return 1

//returns a list of everybody we wanna do stuff with.
/mob/living/simple_animal/hostile/commanded/proc/get_targets_by_name(var/text, var/filter_friendlies = 0)
	var/list/possible_targets = hearers(src,10)
	. = list()
	for(var/mob/M in possible_targets)
		if(filter_friendlies && ((M in friends) || faction_check(M) || M == master))
			continue
		var/found = 0
		if(parse_phrase(text, "[M]"))
			found = 1
		else
			var/list/parsed_name = splittext(sanitize_simple(lowertext_uni(html_decode("[M]")),list("-"=" ", "."=" ", "," = " ", "'" = " ")), " ") //this big MESS is basically 'turn this into words, no punctuation, lowercase so we can check first name/last name/etc'
			for(var/a in parsed_name)
				if(a == "the" || length(a) < 2) //get rid of shit words.
					continue
				if(parse_phrase(text,"[a]"))
					found = 1
					break
		if(found)
			. += M

/mob/living/simple_animal/hostile/commanded/proc/accepted()
	emote("me",1,"nodes")

/mob/living/simple_animal/hostile/commanded/proc/unacsessable()
	emote("me",1,"whines")

/mob/living/simple_animal/hostile/commanded/DestroySurroundings()
	if(search_enemy)
		. = ..()

/mob/living/simple_animal/hostile/commanded/proc/pull_command(var/mob/speaker,var/text)
	if(pointed_target)
		follow_target = pointed_target
		pointed_target = null
	if(follow_target)
		stance = COMMANDED_PULL
		accepted()
		search_enemy = 0
		return 1
	unacsessable()

/mob/living/simple_animal/hostile/commanded/proc/enemy_command(var/mob/speaker,var/text)
	for(var/F in human_factions)
		if(parse_phrase(text, lowertext_uni(F)))
			faction_enemy += F
			faction -= F
			accepted()
			return 1
	var/list/targets = get_targets_by_name(text)
	if(targets.len)
		friends -= targets
		accepted()
		return 1
	unacsessable()
	return 0
/mob/living/simple_animal/hostile/commanded/proc/friend_command(var/mob/speaker,var/text)
	for(var/F in human_factions)
		if(parse_phrase(text, lowertext_uni(F)))
			faction_enemy -= F
			faction += F
			accepted()
			return 1
	var/list/targets = get_targets_by_name(text)
	if(targets.len)
		friends += targets
		accepted()
		return 1
	unacsessable()
	return 0

/mob/living/simple_animal/hostile/commanded/proc/defend_command(var/mob/speaker,var/text)
	target = null
	allowed_targets = list()
	walk_to(src,0)
	search_enemy = 1
	stance = COMMANDED_DEFEND
	if(parse_phrase(text,"me"))
		follow_target = speaker
	else if(pointed_target)
		follow_target = pointed_target
		pointed_target = null
	else
		var/list/targets = get_targets_by_name(text, 1)
		if(targets.len < 1 && !follow_target)
			unacsessable()
			return 0
		else if(targets.len)
			follow_target = targets[1]
	accepted()
	return 1

/mob/living/simple_animal/hostile/commanded/proc/attack_command(var/mob/speaker,var/text)
	target = null //want me to attack something? Well I better forget my old target.
	follow_target = null
	walk_to(src,0)
	search_enemy = 1
	stance = COMMANDED_ATTACK
	if(istype(pointed_target,/mob/living))
		allowed_targets += pointed_target
		pointed_target = null
		accepted()
		return 1
	if(parse_phrase(text,"anybody")) //if its just 'attack' then just attack anybody, same for if they say 'everyone', somebody, anybody. Assuming non-pickiness.
		allowed_targets = list("anybody")//everyone? EVERYONE
		accepted()
		return 1

	var/list/targets = get_targets_by_name(text, 1)
	allowed_targets += targets
	if(targets.len < 1)
		unacsessable()
	return targets.len != 0

/mob/living/simple_animal/hostile/commanded/proc/stay_command(var/mob/speaker,var/text)
	allowed_targets = list()
	target = null
	follow_target = null
	stance = COMMANDED_STOP
	stop_automated_movement = 1
	search_enemy = 0
	walk_to(src,0)
	accepted()
	return 1

/mob/living/simple_animal/hostile/commanded/proc/stop_command(var/mob/speaker,var/text)
	allowed_targets = list()
	walk_to(src,0)
	stance = COMMANDED_STOP
	target = null //gotta stop SOMETHIN
	follow_target = null
	stop_automated_movement = 0
	search_enemy = 1
	accepted()
	return 1

/mob/living/simple_animal/hostile/commanded/proc/follow_command(var/mob/speaker,var/text)
	//we can assume 'stop following' is handled by stop_command
	target = null
	allowed_targets = list()
	walk_to(src,0)
	search_enemy = 0
	if(parse_phrase(text,"me"))
		stance = COMMANDED_FOLLOW
		follow_target = speaker //this wont bite me in the ass later.
		accepted()
		return 1
	if(pointed_target)
		follow_target = pointed_target
		pointed_target = null
		stance = COMMANDED_FOLLOW
		accepted()
		return 1
	var/list/targets = get_targets_by_name(text)
	if(targets.len > 1 || !targets.len) //CONFUSED. WHO DO I FOLLOW?
		unacsessable()
		return 0
	stance = COMMANDED_FOLLOW //GOT SOMEBODY. BETTER FOLLOW EM.
	follow_target = targets[1] //YEAH GOOD IDEA
	accepted()
	return 1

/mob/living/simple_animal/hostile/commanded/proc/is_enemy(var/mob/M)
	for(var/F in M.faction)
		if(F in faction_enemy)
			return 1
	return 0

/mob/living/simple_animal/hostile/commanded/proc/misc_command(var/mob/speaker,var/text)
	return 0

/mob/living/simple_animal/hostile/commanded/proc/has_attacked(var/mob/living/victim, var/mob/living/attacker)
	if(victim == master || (friends.Find(victim) && !friends.Find(attacker))) //ATAKUEM PIDARASA! ETO NASHI BRAHMINSE
		allowed_targets |= attacker
		return 1
	if(attacker == master || (friends.Find(attacker) && !friends.Find(victim)))
		allowed_targets |= victim
		return 1

/mob/living/simple_animal/hostile/commanded/attackby(obj/item/I, mob/user, params)
	//if they attack us, we want to kill them. None of that "you weren't given a command so free kill" bullshit.
	. = ..()
	if(!. && retribution)
		target = user
		allowed_targets += user //fuck this guy in particular.
		if(user in friends) //We were buds :'(
			friends -= user

/mob/living/simple_animal/hostile/commanded/bullet_act(obj/item/projectile/P)
	. = ..()
	if(retribution)
		target = P.firer
		allowed_targets += P.firer //fuck this guy in particular.
		if(P.firer in friends) //We were buds :'(
			friends -= P.firer

/mob/living/simple_animal/hostile/commanded/attack_hand(mob/living/carbon/human/M as mob)
	..()
	if(M.a_intent == INTENT_HARM && retribution) //assume he wants to hurt us.
		target = M
		allowed_targets += M
		if(M in friends)
			friends -= M

/mob/living/simple_animal/hostile/commanded/attack_animal(mob/living/simple_animal/M)
	. = ..()
	if(. && retribution)
		target = M
		allowed_targets += M //fuck this guy in particular.
		if(M in friends) //We were buds :'(
			friends -= M

/mob/living/simple_animal/hostile/commanded/attack_paw(mob/living/carbon/monkey/M)
	. = ..()
	if(. && retribution)
		target = M
		allowed_targets += M //fuck this guy in particular.
		if(M in friends) //We were buds :'(
			friends -= M