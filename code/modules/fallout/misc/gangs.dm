// Fallout Gangs

// Names that serve as a blacklist to prevent inappropiate or duplicit gang names
GLOBAL_LIST_INIT(gang_names, list ( \
"raider", \
"raiders", \
"great khan", \
"great khans", \
"gang", \
"gangs", \
))

//Which social factions are allowed to join gangs?
GLOBAL_LIST_INIT(allowed_gang_factions, list ( \
"Raiders", \
))

// List of all existing gangs
GLOBAL_LIST_EMPTY(all_gangs)

//Great Khans
GLOBAL_DATUM_INIT(greatkhans, /datum/gang/greatkhans, new)

/datum/gang
	var/name = "gang"
	var/welcome_text = null //Shown text upon gang joining
	var/color = "#ff0000" //Red is a default gang color
	var/leader = null //Leader of this gang
	var/list/members = list()
	var/obj/item/device/gangtool/assigned_tool //Unique gangtool that the gang is using
	var/influence = 0 //Currency in the gangtool
	var/round_start = FALSE //Is this gang a round-start gang?
	var/boss_item_list
	var/list/boss_items = list(
		/datum/gang_item/equipment/spraycan,
		/datum/gang_item/equipment/emp,
		/datum/gang_item/equipment/necklace,

		/datum/gang_item/weapon/shuriken,
		/datum/gang_item/weapon/switchblade,

		/datum/gang_item/clothing/prostitute_dress,
		/datum/gang_item/clothing/hat,

		/datum/gang_item/clothing/raider_uniform,
		/datum/gang_item/clothing/jester_uniform,
		/datum/gang_item/clothing/soviet_uniform,
		/datum/gang_item/clothing/biker_uniform,
		/datum/gang_item/clothing/chairmen_uniform
	)

//Round-start gangs
/datum/gang/greatkhans
	name = "Great Khans"
	color = "#b07f43"
	round_start = TRUE
	boss_items = list(
		/datum/gang_item/equipment/spraycan,
		/datum/gang_item/equipment/emp,
		/datum/gang_item/equipment/necklace,

		/datum/gang_item/weapon/shuriken,
		/datum/gang_item/weapon/switchblade,

		/datum/gang_item/clothing/prostitute_dress,
		/datum/gang_item/clothing/hat,

		/datum/gang_item/clothing/khan_boots,
		/datum/gang_item/clothing/khan_helmet,
		/datum/gang_item/clothing/khan_uniform,
		/datum/gang_item/clothing/khan_vest
	)

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

/datum/gang/proc/add_leader(mob/living/carbon/new_leader)
	leader = new_leader
	new_leader.verbs -= /mob/living/proc/assumeleader
	new_leader.verbs |= /mob/living/proc/invitegang
	new_leader.verbs |= /mob/living/proc/removemember
	new_leader.verbs |= /mob/living/proc/transferleader
	new_leader.verbs |= /mob/living/proc/setwelcome
	if(!round_start)
		new_leader.verbs |= /mob/living/proc/setcolor
	new_leader.verbs |= /mob/living/proc/leavegang
	to_chat(new_leader, "<span class='notice'>You have become a new leader of the [name]! You can now invite and remove members at will. You have also received a Gangtool device that allows you to buy a special gear for you and your gang.</span>")

	var/obj/item/device/gangtool/gangtool = new(new_leader)
	gangtool.gang = new_leader.gang
	assigned_tool = gangtool

	var/list/slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE
	)

	var/where = new_leader.equip_in_one_of_slots(gangtool, slots, FALSE)
	if(!where)
		gangtool.forceMove(get_turf(new_leader))
	
	if(assigned_tool)
		var/obj/item/device/gangtool/tool = assigned_tool
		tool.name = "[initial(tool.name)] - [name]"

/datum/gang/proc/remove_leader(mob/living/carbon/old_leader)
	leader = null
	old_leader.verbs -= /mob/living/proc/invitegang
	old_leader.verbs -= /mob/living/proc/removemember
	old_leader.verbs -= /mob/living/proc/transferleader
	old_leader.verbs -= /mob/living/proc/setwelcome
	if(!round_start)
		old_leader.verbs -= /mob/living/proc/setcolor
	old_leader.verbs |= /mob/living/proc/assumeleader
	to_chat(old_leader, "<span class='warning'>You are no longer the leader of the [name]!</span>")
	if(assigned_tool)
		assigned_tool.audible_message("<span class='warning'>With a change of the [name] leadership, [assigned_tool] ceases to function and self-destructs!</span>")
		qdel(assigned_tool)

/datum/gang/proc/add_member(mob/living/carbon/new_member)
	members |= new_member
	new_member.faction |= "[name]-gang"
	new_member.verbs -= /mob/living/proc/creategang
	new_member.verbs |= /mob/living/proc/leavegang
	new_member.verbs |= /mob/living/proc/assumeleader
	to_chat(new_member, "<span class='notice'>You are now a member of the [name]! Everyone can recognize your gang membership now.</span>")
	if(welcome_text)
		to_chat(new_member, "<span class='notice'>Welcome text: </span><span class='purple'>[welcome_text]</span>")

/datum/gang/proc/remove_member(mob/living/carbon/member)
	members -= member
	member.gang = null
	member.faction -= "[name]-gang"
	member.verbs -= /mob/living/proc/leavegang
	member.verbs -= /mob/living/proc/assumeleader
	member.verbs |= /mob/living/proc/creategang
	to_chat(member, "<span class='warning'>You are no longer a member of the [name]!</span>")

	if(!members.len && !round_start)
		GLOB.gang_names -= lowertext(name)
		GLOB.all_gangs -= src
		qdel(src)

/mob/living/proc/invitegang()
	set name = "Invite To Gang"
	set desc = "Invite others to your gang. Only independent raiders in view can be offered to join!"
	set category = "Gang"

	var/list/possible_targets = list()
	for(var/mob/living/carbon/target in oview())
		if(target.stat || !target.mind || !target.client)
			continue
		if(target.gang == gang)
			continue
		if(!(target.social_faction in GLOB.allowed_gang_factions))
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
	if(alert(C, "[src] invites you to join the [G.name].", "Gang invitation", "Yes", "No") == "No")
		visible_message(C, "<span class='warning'>[C.name] refused an offer to join the [G.name]!</span>")
		return
	else
		visible_message(C, "<span class='notice'>[C.name] accepted an offer to join the [G.name]!</span>")

	G.add_member(C)
	C.gang = G

/mob/living/proc/creategang()
	set name = "Create Gang"
	set category = "Gang"

	var/input = input(src, "Enter the name of your new gang!", "Gang name") as text|null
	if(!input)
		return
	input = copytext(sanitize(input), 1, 30)
	if(lowertext(input) in GLOB.gang_names)
		to_chat(src, "<span class='notice'>This gang name is already taken!</span>")
		return
	GLOB.gang_names |= lowertext(input)

	var/datum/gang/G = new()
	G.name = input
	GLOB.all_gangs |= G
	gang = G
	to_chat(src, "<span class='notice'>You have created [G.name]!</span>")

	G.add_member(src)
	G.add_leader(src)

/mob/living/proc/leavegang()
	set name = "Leave Gang"
	set category = "Gang"

	var/datum/gang/G = gang
	if(!G)
		to_chat(src, "You are already not in any gang!")
		return
	if(alert("Are you sure you want to leave [G.name]?", "Leave gang", "Yes", "No") == "No")
		return

	if(G.leader == src)
		G.remove_leader(src)
	G.remove_member(src)

/mob/living/proc/assumeleader()
	set name = "Assume Leadership"
	set desc = "Become a new gang leader if the old one is missing or dead."
	set category = "Gang"

	var/datum/gang/G = gang
	if(G && G.leader)
		var/mob/living/L = G.leader
		if(L.stat != DEAD && L.client)
			to_chat(src, "<span class='warning'>Gang leader is still alive and well!</span>")
			return
		else
			G.remove_leader(L)
			G.add_leader(src)
	else if(G)
		G.add_leader(src)

/mob/living/proc/transferleader()
	set name = "Transfer Leadership"
	set desc = "Transfer your leader position to a different gang member in view."
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
		new_leader = input(src, "Choose a new gang leader of the [G.name]!", "Transfer Gang Leadership") as null|mob in possible_targets
		if(!new_leader || new_leader == src)
			return
		var/mob/living/H = new_leader
		to_chat(src, "<span class='notice'>You have transferred gang leadership of the [G.name] to [H.real_name]!</span>")
		to_chat(H, "<span class='notice'>You have received gang leadership of the [G.name] from [src.real_name]!</span>")
		G.remove_leader(src)
		G.add_leader(H)

/mob/living/proc/removemember()
	set name = "Remove Member"
	set desc = "Remove an alive gang member from the gang in view."
	set category = "Gang"

	var/list/possible_targets = list()
	for(var/mob/living/carbon/target in oview())
		if(target.gang != gang)
			continue
		if(target.stat == DEAD)
			continue
		possible_targets += target

	if(!possible_targets.len)
		return

	var/datum/gang/G = gang
	if(G && G.leader == src)
		var/mob/living/carbon/kicked_member
		kicked_member = input(src, "Choose a gang member to remove from [G.name]!", "Gang member removal") as null|mob in possible_targets
		if(!kicked_member || kicked_member == src)
			return

		var/mob/living/H = kicked_member
		to_chat(src, "<span class='notice'>You have removed [H.real_name] from the [G.name]!</span>")
		to_chat(H, "<span class='warning'>You have been kicked from the [G.name] by [src.real_name]!</span>")
		G.remove_member(H)

/mob/living/proc/setwelcome()
	set name = "Set Welcome Text"
	set desc = "Set a welcome text that will show to all new members of the gang upon joining."
	set category = "Gang"

	var/datum/gang/G = gang
	var/input = input(src, "Set a welcome text for a new gang members!", "Welcome text", G.welcome_text) as text|null
	if(!input)
		return
	input = copytext(sanitize(input), 1, 300)
	G.welcome_text = input

	to_chat(src, "<span class='notice'>You have set a welcome text for a new gang members!</span>")

/mob/living/proc/setcolor()
	set name = "Choose Gang Color"
	set desc = "Set a color of your gang that will be visible on the gang members upon examine."
	set category = "Gang"

	var/datum/gang/G = gang
	var/picked_color = input(src, "", "Choose Color", color) as color|null
	if(!picked_color)
		return
	G.color = sanitize_color(picked_color)

	to_chat(src, "<span class='notice'>You have chosen a new gang color!</span>")
