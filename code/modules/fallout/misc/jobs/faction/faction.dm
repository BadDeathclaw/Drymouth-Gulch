/mob/var/social_faction

var/human_factions = list()

proc/get_faction_by_freq(freq)
	for(var/F in human_factions)
		var/datum/f13_faction/datum = get_faction_datum(F)
		if(freq == datum.freq)
			return datum.id
	return null

proc/get_faction_datum(faction)
	if(!human_factions[faction])
		return null

	return human_factions[faction]

proc/get_faction_members(var/faction)
	var/list/mobs = list()
	for(var/mob/M in world)
		if(M.social_faction == faction)
			mobs += M
	return mobs

/datum/f13_faction
	var/name = "UNKNOWN"
	var/full_name = "UNKNOWN"
	var/id = "none"
	var/flags = null
	var/list/jobs = list()

	var/welcome_text = "" //Showing text on faction joining
	var/color = "#171717"
	var/description = "<b>Alignment: Chaotic Badmin</b><br>Something's wrong!<br><i>Badmins spawn shit and factions engine has broken.</i>"
	var/preview_image = 'html/factions/neutral.png'

	var/head_status = null //Main status at this faction. Currently using for leader voting

	var/area/area

	var/datum/objective_holder/objective

	var/list/members = list()

// Frequency settings
	var/freq
	var/encryption_key

	var/tmp/voting = 0 //Have head voting now
	var/list/craft_recipes = list() //recipes which can craft every member of this faction
	var/list/verbs = list() //Verbs which had every member

/datum/f13_faction/New()
	..()
	if(flags & HAVE_FREQ)
		freq = sanitize_frequency(rand(MIN_FREQ, MAX_FREQ))
		encryption_key = format_encryption_key(rand(0, 9999))
	for(var/datum/job/job in SSjob.occupations)
		if(job.faction == src.id)
			jobs += job
	if(preview_image)
		register_asset("[id].png", preview_image)

//Vote for new leader. At voting involvement near staying members
//This proc is so big, but it's easy to understand.
mob/proc/begin_head_voting()
	set name = "Leader Voting"
	set category = "Faction"

	if(stat)
		return

	var/datum/f13_faction/F = get_faction_datum(src.social_faction)

	if(!F || !F.head_status)
		return 0

	if(F.voting)
		to_chat(src, "<span class='warning'>A vote has started for a new faction leader.</span>")
		return 0

	if(src.status == F.head_status)
		to_chat(src, "<span class='notice'>You are already [F.head_status].</span>")
		return 0

	if(alert("Are you sure?",,"Yes","No")=="No")
		return 0

	var/list/all_members = get_faction_members(F.id)
	var/list/all_head_candidates = list()
	for(var/mob/M in all_members)
		if(!M.stat && M.ckey)
			all_head_candidates += M
	if(all_head_candidates.len < 2)
		to_chat(src, "<span class='notice'>You are the last member of your faction.</span>")
		src.set_status(F.head_status)
		return 1

	var/list/correct_candidates = list()
	for(var/mob/M in all_head_candidates)
		if(M in view())
			correct_candidates += M
	if(all_head_candidates.len/2 > correct_candidates.len)
		to_chat(src, "<span class='warning'>To start a vote, you need more active members of your faction to be present.</span>")
		return 0
	//VOTE BEGIN

	say("Let's choice new [F.head_status].")
	var/list/choices = list()

	F.voting = 1

	var/global/voters_count
	voters_count = correct_candidates.len
	var/voting_started_time = world.time
	for(var/mob/M in correct_candidates)
		spawn(0)
			var/choice = input(M,"Make a choice") in correct_candidates
			if(choice == M)
				M.say(pick("I'm voting for myself", "I'm gonna be the new [F.head_status]!", "No one but myself is worthy."))
			else
				if(prob(1))
					if(prob(50))
						M.say("TRUMP FOREVER! MAKE WASTELAND GREAT AGAIN!!!")
					else
						M.say("PUTIN IS THE BEST! BOBAH YPA - 3OBET MOCKBA!!!")
					sleep(20)
					M.say("I changed my mind...")
				M.say(pick("I vote for [choice].", "[choice] - I choose you!!!", "I choose [choice] to be [F.head_status].", "I believe [choice] is worthy to be our leader."))
			choices[choice] += 1
			voters_count -= 1

	while(1)
		if(round((world.time - voting_started_time) / 600) > 2)
			break
		if(voters_count < 1)
			break
		sleep(20)
	var/mob/favorite = null
	for(var/mob/M in choices)
		if(favorite == null)
			favorite = M
			continue
		if(choices[M] > choices[favorite])
			favorite = M
	if(favorite == null)
		to_chat(src, "<span class='warning'>Sadly, no one has voted.</span>")
		F.voting = 0
		return 0
	for(var/mob/M in choices)
		if(choices[M] == choices[favorite] && M != favorite)
			to_chat(src, "<span class='warning'>You need to make a choice together.</span>")
			say("We need to make a choice together.")
			F.voting = 0
			return 0
	if(favorite == src)
		say("I think I'm a new [F.head_status] now")
	else
		say("[favorite] is a new [F.head_status]")

	remove_everyone_from_status(F.head_status)

	favorite.set_status(F.head_status)

	F.voting = 0

	//END THIS SHIT

	return 1

mob/proc/set_faction(var/faction)
	var/datum/f13_faction/F = get_faction_datum(faction)
	var/datum/f13_faction/last_F = get_faction_datum(src.social_faction)
	if(!F)
		return 0
	if(F.id == src.social_faction)
		return 1
	if(last_F)
		src.verbs -= last_F.verbs
		src.allow_recipes -= last_F.craft_recipes
		src.faction -= last_F.id
		last_F.members -= src

	src.social_faction = F.id
	src.faction += F.id
	F.members |= src

	src.allow_recipes += F.craft_recipes
	src.verbs += F.verbs

	return 1

/datum/f13_faction/neutral
	name = "Neutral"
	full_name = "Independent Wastelanders"
	description = "<b>Alignment: True Neutral</b><br>Wastelanders - A catch-all term for anyone living in the wasteland who are not affiliated with any other groups.<br>They make a subsistence living off the land, trade with local settlements, and try not to be ravaged by the abundant (and usually hostile) wildlife, or bands of roaming raider gangs and slavers.<br><i>Home, home on the wastes...</i>"
	id = "none"

/datum/f13_faction/city
	name = "City"
	color = "#804B00"
	id = "city"
	head_status = "mayor"
	preview_image = 'html/factions/city.png'
	full_name = "City Dwellers"
	description = "<b>Alignment: Lawful Neutral</b><br>City dwellers - A group of wastelanders that have holed up in the town to wait out the worst and hope for the best.<br>As the City evolved, its citizens became different from the rest of the Wasteland dwellers - they value the safety of a city, prefer better food and clothing, and mostly trust the elected Mayor - even if the decisions made are not the best.<br><i>In Mayor We Trust!</i>"
	flags = HAVE_FREQ
	area = /area/f13/city
	verbs = list(/mob/proc/begin_head_voting)

/datum/f13_faction/raider
	name = "Raiders"
	color = "#804B00"
	id = "raiders"
	head_status = "gangleader"
	preview_image = 'html/factions/raider.png'
	full_name = "Raider Gang"
	description = "<b>Alignment: Chaotic Evil</b><br>Raiders - Any group of wastelanders who pillage, plunder, murder, or otherwise ruin the day of anyone unfortunate enough to not be one of them.<br>Raiders tend to organize into loose confederations of gangs in the post-apocalyptic wasteland, and are a constant problem.<br>Raiders typically prey upon travelers and very small towns, leaving more populous or larger areas alone."
	verbs = list(/mob/proc/begin_head_voting)
	area = /area/f13/raiders

/datum/f13_faction/vault
	name = "Vault"
	color = "#005A20"
	id = "vault"
	full_name = "Vault-Tec Corporation"
	description = "<b>Alignment: True Neutral</b><br>The Vault-Tec Corporation, or simply the VTC - A former company contracted by the United States government before the Great War to design and produce the Vault system, a vast network of complex fallout and research shelters.<br>When the bombs fell, thousands of carefully-selected Vault dwellers were sealed within the safe confinement of the Vaults, and their lucky descendants have (mostly) lived to the present day."
	preview_image = 'html/factions/vault.png'
	head_status = "overseer"
	flags = HAVE_FREQ
	verbs = list(/mob/proc/begin_head_voting)
	area = /area/f13/vault
//	craft_recipes = list(/datum/table_recipe/vlt_encryption_key)

/datum/f13_faction/brotherhood
	name = "Brotherhood"
	color = "#00215a"
	id = "bs"
	full_name = "Brotherhood of Steel"
	description = "<b>Alignment: Lawful Good</b><br>The Brotherhood of Steel, or simply the Brotherhood - A quasi-religious technological organization operating across the ruins of post-War North America, with its roots stemming from the United States Armed Forces and the government-sponsored scientific community from before the Great War.<br>The Brotherhood members rely heavily on subordination and strict Code of Conduct.<br><i>The Steel Endures!</i>"
	preview_image = 'html/factions/brotherhood.png'
	head_status = "elder"
	flags = HAVE_FREQ
	area = /area/f13/brotherhood
	verbs = list(/mob/proc/begin_head_voting)

/datum/f13_faction/enclave
	name = "Enclave"
	color = "#005A20"
	id = "enclave"
	full_name = "Enclave"
	description = "<b>Alignment: Lawful Evil</b><br>The Enclave - A secretive political, scientific, and militaristic organization that is descended directly from members of the pre-War United States government.<br>They claim to be the legally-sanctioned continuation of the government, while also styling themselves and their overall demeanor as such.<br>Enclave members take pride in being the last known concentrated bastion of pure, unmutated humanity."
	preview_image = 'html/factions/enclave.png'
	head_status = "colonel"
	flags = HAVE_FREQ
	area = /area/f13/enclave
	verbs = list(/mob/proc/begin_head_voting)

/datum/f13_faction/ahs
	name = "Hubologists"
	color = "#005A20"
	id = "ahs"
	full_name = "Adepts of Hubology Studies"
	description = "<b>Alignment: Neutral Good</b><br>The Adepts of Hubology Studies, or simply Hubologists - A religious sect that originated as a cult founded before the Great War by a man known as Dick Hubbell aka The Hub.<br>Hubology as a religion promotes the idea that humans are plagued by the spirits of the dead, causing neurodynes to form.<br>The degree to which a member has devoted his or her time, efforts, and caps to Hubology accords him or her a numerical rank."
	preview_image = 'html/factions/ahs.png'
	head_status = "ahs8"
	area = /area/f13/ahs
	verbs = list(/mob/proc/begin_head_voting)

/datum/f13_faction/ncr
	name = "NCR"
	id = "ncr"
	color = "#020080"
	flags = HAVE_FREQ | HAVE_FLAG
	full_name = "New California Republic"
	description = "<b>Alignment: Lawful Good</b><br>The New California Republic, or simply the NCR - A large, democratic federation with a massive population based in California, with holdings in other States.<br>The NCR emphasizes and claims to support a myriad of old world values, such as democracy, personal liberty, and the rule of law.<br>It also strives to restore general order to the wasteland through improvements to and development of infrastructure and economic systems, as well as basic common peace between people."
	preview_image = 'html/factions/ncr.png'
	head_status = "ncr_general"
	verbs = list(/mob/proc/begin_head_voting)
	area = /area/f13/ncr
	welcome_text = "Your current objectives are:<br>\
1. As an NCR soldier you must uphold the law around the town, exterminate any raiders you see, seek and destroy the Legion members.<br>\
2. As an NCR soldier you must protect the innocent from the horrors of the wasteland.<br>\
3. Your survival is important - you are important to the NCR and we can't afford to lose you!<br>"

/datum/f13_faction/legion
	name = "Legion"
	head_status = "legate"
	full_name = "Caesar's Legion"
	description = "<b>Alignment: Lawful Evil</b><br>Caesar's Legion, or simply the Legion - An autocratic, traditionalist, reactionary slaver society, and a totalitarian dictatorship that is based on the ancient Roman Empire.<br>Its legionaries are a well-organized, culturally insular fighting force.<br>The Legion is first and foremost a slave army, the sole owner of which is Caesar.<br>As a slave army, the Legion maintains a very strict hierarchy with significant division of roles.<br><i>Ave Caesar!</i>"
	preview_image = 'html/factions/legion.png'
	id = "legion"
	color = "#C24D44"
	flags = HAVE_FREQ | HAVE_FLAG
	area = /area/f13/legion
//	craft_recipes = list(/datum/table_recipe/legion_recruit_armor, /datum/table_recipe/legion_recruit_helm, \
						 /datum/table_recipe/legion_encryption_key)
	welcome_text = "Your current objectives:<br>\
	1. As a member of the Legion you must obey all orders given by anyone outranking you.<br>\
	2. You must enslave the occupants of the wasteland, and suppress any resistance unless they can't be overpowered.<br>\
	3. As a Legion solider you will torture and kill any NCR member you come across. Fight to your death in the name of Caesar!"

/datum/f13_faction/followers
	name = "Followers"
	color = "#005A20"
	id = "followers"
	full_name = "Followers of the Appocalypse"
	description = "<b>Alignment: Neutral Good</b><br>The Followers of the Apocalypse, or simply the Followers - A post-War organization whose goal is to tend to the inhabitants of the wasteland, as well as to ensure that the horrors of the Great War are never to be repeated.<br>To that end, they serve as keepers of knowledge, a position which provides them with the skills they need to carry out their mission.<br>They don't follow a single Great Leader, but instead a handful of independent Leaders for each group."
	preview_image = 'html/factions/followers.png'
	head_status = "leader"
	verbs = list(/mob/proc/begin_head_voting)
	area = /area/f13/followers

/datum/f13_faction/acolytes
	name = "Acolytes"
	color = "#204200"
	id = "acolytes"
	full_name = "Acolytes of the Atom"
	description = "<b>Alignment: Chaotic Neutral</b><br>Have you ever met a bunch of crazed zealots willing to baptize you with radioactive waste?<br>These fanatics are likely to make it so if you have smooth skin, since they all lost theirs decades ago.<br>They are faithful to their glorious God - the Great Atom, who brings salvation to all living.<br>They honor their faith, and are willing to do everything they can to please the Great Atom, and live eternally with a holy green glow."
	preview_image = 'html/factions/acolytes.png'
	head_status = "master_atom"
	verbs = list(/mob/proc/begin_head_voting)

//	craft_recipes = list(/datum/table_recipe/den_encryption_key)