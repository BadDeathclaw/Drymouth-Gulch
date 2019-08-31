// Fallout Gangs

// Names of all created gangs, starting with a default one
GLOBAL_LIST_INIT(gang_names, list ( \
"Raiders", \
))

/datum/gang
	var/name = "team"
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
	new_leader.verbs |= /mob/living/proc/leavegang

/datum/gang/proc/remove_leader(mob/living/old_leader)
	leader = null
	old_leader.verbs -= /mob/living/proc/invitegang
	old_leader.verbs -= /mob/living/proc/removemember
	old_leader.verbs -= /mob/living/proc/transferleader
	old_leader.verbs |= /mob/living/proc/assumeleader

/datum/gang/proc/add_member(mob/living/new_member)
	members |= new_member
	new_member.verbs -= /mob/living/proc/creategang
	new_member.verbs |= /mob/living/proc/leavegang
	new_member.verbs |= /mob/living/proc/assumeleader

/datum/gang/proc/remove_member(mob/living/member)
	members -= member
	member.social_faction = "Raiders"
	member.gang = null
	member.verbs -= /mob/living/proc/leavegang
	member.verbs -= /mob/living/proc/assumeleader
	member.verbs |= /mob/living/proc/creategang

/mob/living/proc/invitegang(mob/M in oview())
	set name = "Invite To Gang"
	set category = "Gang"

	if(!M.mind || !M.client)
		return
	if(M.social_faction == social_faction)
		return
	if(!M.social_faction)
		to_chat(src, "They are not tough enough to join [social_faction] gang]." )
		return
	else if(M.social_faction != "Raiders")
		to_chat(src, "They are already in a different gang!" )
		return
	if(alert(M, "[src] invites you to the [social_faction] gang.", "Invitation", "Yes", "No") == "No")
		to_chat(src, "<span class='warning'>[M.name] refused the offer to [social_faction] gang.</span>")
		return
	else
		to_chat(src, "<span class='notice'>[M.name] accepted the offer to join [social_faction] gang.</span>")

	M.social_faction = social_faction
	to_chat(M, "<span class='notice'>You have joined the [social_faction] gang!</span>")

	var/datum/gang/G = gang
	G.add_member(M)
	M.gang = G

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
	social_faction = input
	to_chat(src, "<span class='notice'>You have become a leader of the [social_faction] gang!</span>")

	var/datum/gang/G = new()
	G.name = input
	G.add_member(src)
	G.add_leader(src)

	gang = G

/mob/living/proc/leavegang()
	set name = "Leave Gang"
	set category = "Gang"

	if(!social_faction || social_faction == "Raiders")
		to_chat(src, "You are already not in any gang!")
		return
	if(alert("Are you sure you want to leave [social_faction] gang?", "Leave gang", "Yes", "No") == "No")
		return
	to_chat(src, "<span class='warning'>You have left the [social_faction] gang!</span>")

	var/datum/gang/G = gang
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
			to_chat(src, "<span class='warning'>Old leader is still alive!</span>")
			return
		else
			G.remove_leader(L)
			G.add_leader(src)
			to_chat(src, "<span class='notice'>You have become a new leader of [G.name] gang!</span>")
	else if(G)
		G.add_leader(src)
		to_chat(src, "<span class='notice'>You have become a new leader of [G.name] gang!</span>")

/mob/living/proc/transferleader()
	set name = "Transfer Leadership"
	set category = "Gang"

	var/datum/gang/G = gang
	if(G && G.leader == src)
		var/list/members = G.members
		var/new_leader = input(src, "Choose a new leader of the [G.name] gang!", "Transfer Leadership") as null|anything in members
		if(!new_leader || new_leader == src)
			return
		var/mob/living/H = new_leader
		G.remove_leader(src)
		G.add_leader(H)
		to_chat(src, "<span class='notice'>You have transferred leadership of the [G.name] gang to [H.real_name]!</span>")
		to_chat(H, "<span class='notice'>You have received leadership of the [G.name] gang from [src.real_name]!</span>")

/mob/living/proc/removemember()
	set name = "Remove Member"
	set category = "Gang"

	var/datum/gang/G = gang
	if(G && G.leader == src)
		var/list/members = G.members
		var/kicked_member = input(src, "Choose a member to remove from the [G.name] gang!", "Member removal") as null|anything in members
		if(!kicked_member || kicked_member == src)
			return
		var/mob/living/H = kicked_member
		G.remove_member(H)
		to_chat(src, "<span class='notice'>You have removed [H.real_name] from of the [G.name] gang!</span>")
		to_chat(H, "<span class='warning'>You have been kicked from the [G.name] gang by [src.real_name]!</span>")
