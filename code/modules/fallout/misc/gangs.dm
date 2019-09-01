// Fallout Gangs

// Names of all created gangs, starting with a default one
GLOBAL_LIST_INIT(gang_names, list ( \
"Raiders", \
"Raider", \
))

// List of all existing gangs
GLOBAL_LIST_EMPTY(all_gangs)

/datum/gang
	var/name = "gang"
	var/description = null
	var/welcome_text = null //Showing text on faction joining
	var/leader = null //Leader of this faction
	var/list/members = list()

/datum/gang/New(starting_members, starting_leader)
	. = ..()
	if(starting_leader)
		add_leader(starting_leader)
	if(starting_members)
		if(islist(starting_members))
			for(var/mob/living/L in starting_members)
				add_member(L)
		else
			add_member(starting_members)

/datum/gang/proc/is_solo()
	return members.len == 1

/datum/gang/proc/add_leader(mob/living/new_leader)
	leader = new_leader
	new_leader.verbs -= /mob/living/proc/assumeleader
	new_leader.verbs |= /mob/living/proc/invitegang
	new_leader.verbs |= /mob/living/proc/removemember
	new_leader.verbs |= /mob/living/proc/transferleader
	new_leader.verbs |= /mob/living/proc/setwelcome
	new_leader.verbs |= /mob/living/proc/leavegang
	to_chat(new_leader, "<span class='notice'>You have become a new leader of the [name] gang! You can now invite and remove members at will.</span>")

/datum/gang/proc/remove_leader(mob/living/old_leader)
	leader = null
	old_leader.verbs -= /mob/living/proc/invitegang
	old_leader.verbs -= /mob/living/proc/removemember
	old_leader.verbs -= /mob/living/proc/transferleader
	old_leader.verbs -= /mob/living/proc/setwelcome
	old_leader.verbs |= /mob/living/proc/assumeleader
	to_chat(old_leader, "<span class='warning'>You are no longer the leader of the [name]!</span>")

/datum/gang/proc/add_member(mob/living/new_member)
	members |= new_member
	new_member.verbs -= /mob/living/proc/creategang
	new_member.verbs |= /mob/living/proc/leavegang
	new_member.verbs |= /mob/living/proc/assumeleader
	to_chat(new_member, "<span class='notice'>You are now a member of [name]! Everyone can recognize your gang membership now.</span>")
	if(welcome_text)
		to_chat(new_member, "<span class='notice'>Gang welcome text: </span><span class='purple'>[welcome_text]</span>")

/datum/gang/proc/remove_member(mob/living/member)
	members -= member
	member.social_faction = "Raiders"
	member.gang = null
	member.verbs -= /mob/living/proc/leavegang
	member.verbs -= /mob/living/proc/assumeleader
	member.verbs |= /mob/living/proc/creategang
	to_chat(member, "<span class='warning'>You are no longer a member of the [name]!</span>")

/mob/living/proc/invitegang()
	set name = "Invite To Gang"
	set desc = "Invite others to your gang. Only independent raiders can join!"
	set category = "Gang"

	var/list/possible_targets = list()
	for(var/mob/living/carbon/target in oview())
		if(target.stat || !target.mind || !target.client)
			continue
		if(target.social_faction == social_faction)
			continue
		if(target.social_faction != "Raiders")
			continue
		if(target.gang)
			continue
		possible_targets += target

	if(!possible_targets.len)
		return

	var/mob/living/carbon/C
	C = input("Choose who to invite to your gang!", "Gang invitation") as null|mob in possible_targets
	if(!C)
		return

	var/datum/gang/G = gang
	if(alert(C, "[src] invites you to the [G.name].", "Gang invitation", "Yes", "No") == "No")
		visible_message(C, "<span class='warning'>[C.name] refused the offer to join [G.name]!</span>")
		return
	else
		visible_message(C, "<span class='notice'>[C.name] accepted the offer to join [G.name]!</span>")

	C.social_faction = social_faction
	G.add_member(C)
	C.gang = G

/mob/living/proc/creategang()
	set name = "Create Gang"
	set category = "Gang"

	var/input = input(src, "Enter the name of your new gang!", "Gang name") as text|null
	if(!input)
		return
	input = copytext(sanitize(input), 1, 20)
	if(input in GLOB.gang_names)
		to_chat(src, "<span class='notice'>This gang name is already taken!</span>")
		return
	GLOB.gang_names |= input

	var/datum/gang/G = new()
	G.name = input
	to_chat(src, "<span class='notice'>You have created [G.name]!</span>")

	G.add_member(src)
	G.add_leader(src)

	gang = G
	social_faction = G.name

	GLOB.all_gangs |= G

/mob/living/proc/leavegang()
	set name = "Leave Gang"
	set category = "Gang"

	if(!social_faction || social_faction == "Raiders")
		to_chat(src, "You are already not in any gang!")
		return
	var/datum/gang/G = gang
	if(alert("Are you sure you want to leave the [G.name]?", "Leave gang", "Yes", "No") == "No")
		return

	if(G.leader == src)
		G.remove_leader(src)
	G.remove_member(src)

/mob/living/proc/assumeleader()
	set name = "Assume Leadership"
	set category = "Gang"

	var/datum/gang/G = gang
	if(G && G.leader)
		var/mob/living/L = G.leader
		if(L.stat != DEAD)
			to_chat(src, "<span class='warning'>Gang leader is still alive!</span>")
			return
		else
			G.remove_leader(L)
			G.add_leader(src)
	else if(G)
		G.add_leader(src)

/mob/living/proc/transferleader()
	set name = "Transfer Leadership"
	set category = "Gang"

	var/list/possible_targets = list()
	for(var/mob/living/carbon/target in oview())
		if(target.stat || !target.mind || !target.client)
			continue
		if(target.gang != gang)
			continue
		possible_targets += target

	if(!possible_targets.len)
		return

	var/datum/gang/G = gang
	if(G && G.leader == src)
		var/mob/living/carbon/new_leader
		new_leader = input(src, "Choose a new gang leader of the [G.name]!", "Transfer Leadership") as null|mob in possible_targets
		if(!new_leader || new_leader == src)
			return
		var/mob/living/H = new_leader
		to_chat(src, "<span class='notice'>You have transferred leadership of the [G.name] gang to [H.real_name]!</span>")
		to_chat(H, "<span class='notice'>You have received leadership of the [G.name] gang from [src.real_name]!</span>")
		G.remove_leader(src)
		G.add_leader(H)

/mob/living/proc/removemember()
	set name = "Remove Member"
	set category = "Gang"

	var/list/possible_targets = list()
	for(var/mob/living/carbon/target in oview())
		if(target.gang != gang)
			continue
		possible_targets += target

	if(!possible_targets.len)
		return

	var/datum/gang/G = gang
	if(G && G.leader == src)
		var/mob/living/carbon/kicked_member
		kicked_member = input(src, "Choose a gang member to remove from the [G.name]!", "Gang member removal") as null|mob in possible_targets
		if(!kicked_member || kicked_member == src)
			return

		var/mob/living/H = kicked_member
		to_chat(src, "<span class='notice'>You have removed [H.real_name] from of the [G.name] gang!</span>")
		to_chat(H, "<span class='warning'>You have been kicked from the [G.name] gang by [src.real_name]!</span>")
		G.remove_member(H)

/mob/living/proc/setwelcome()
	set name = "Set Welcome Text"
	set desc = "Set a welcome text that will show to all new members of the gang upon joining."
	set category = "Gang"

	var/datum/gang/G = gang
	var/input = input(src, "Set a welcome text for a new members!", "Gang name", G.welcome_text) as text|null
	if(!input)
		return
	input = copytext(sanitize(input), 1, 200)
	G.welcome_text = input

	to_chat(src, "<span class='notice'>You have set a welcome text for a new members!</span>")
