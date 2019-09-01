
/datum/datacore
	var/medical[] = list()
	var/medicalPrintCount = 0
	var/general[] = list()
	var/security[] = list()
	var/securityPrintCount = 0
	var/securityCrimeCounter = 0
	//This list tracks characters spawned in the world and cannot be modified in-game. Currently referenced by respawn_character().
	var/locked[] = list()

/datum/data
	var/name = "data"

/datum/data/record
	name = "record"
	var/list/fields = list()

/datum/data/record/Destroy()
	if(src in GLOB.data_core.medical)
		GLOB.data_core.medical -= src
	if(src in GLOB.data_core.security)
		GLOB.data_core.security -= src
	if(src in GLOB.data_core.general)
		GLOB.data_core.general -= src
	if(src in GLOB.data_core.locked)
		GLOB.data_core.locked -= src
	. = ..()

/datum/data/crime
	name = "crime"
	var/crimeName = ""
	var/crimeDetails = ""
	var/author = ""
	var/time = ""
	var/dataId = 0

/datum/datacore/proc/createCrimeEntry(cname = "", cdetails = "", author = "", time = "")
	var/datum/data/crime/c = new /datum/data/crime
	c.crimeName = cname
	c.crimeDetails = cdetails
	c.author = author
	c.time = time
	c.dataId = ++securityCrimeCounter
	return c

/datum/datacore/proc/addMinorCrime(id = "", datum/data/crime/crime)
	for(var/datum/data/record/R in security)
		if(R.fields["id"] == id)
			var/list/crimes = R.fields["mi_crim"]
			crimes |= crime
			return

/datum/datacore/proc/removeMinorCrime(id, cDataId)
	for(var/datum/data/record/R in security)
		if(R.fields["id"] == id)
			var/list/crimes = R.fields["mi_crim"]
			for(var/datum/data/crime/crime in crimes)
				if(crime.dataId == text2num(cDataId))
					crimes -= crime
					return

/datum/datacore/proc/removeMajorCrime(id, cDataId)
	for(var/datum/data/record/R in security)
		if(R.fields["id"] == id)
			var/list/crimes = R.fields["ma_crim"]
			for(var/datum/data/crime/crime in crimes)
				if(crime.dataId == text2num(cDataId))
					crimes -= crime
					return

/datum/datacore/proc/addMajorCrime(id = "", datum/data/crime/crime)
	for(var/datum/data/record/R in security)
		if(R.fields["id"] == id)
			var/list/crimes = R.fields["ma_crim"]
			crimes |= crime
			return

/datum/datacore/proc/manifest()
	for(var/mob/dead/new_player/N in GLOB.player_list)
		if(N.new_character)
			log_manifest(N.ckey,N.new_character.mind,N.new_character)
		if(ishuman(N.new_character))
			manifest_inject(N.new_character, N.client)
		CHECK_TICK

/datum/datacore/proc/manifest_modify(name, assignment)
	var/datum/data/record/foundrecord = find_record("name", name, GLOB.data_core.general)
	if(foundrecord)
		foundrecord.fields["rank"] = assignment

/datum/datacore/proc/get_manifest(monochrome, OOC)
	var/list/command = list()
	var/list/bos = list()
	var/list/den = list()
	var/list/leg = list()
	var/list/ncr = list()
	var/list/vault = list()
	var/list/was = list()
	var/list/misc = list()
	var/dat = {"
	<head><style>
		.manifest {border-collapse:collapse;}
		.manifest td, th {border:1px solid [monochrome?"black":"#DEF; background-color:white; color:black"]; padding:.25em}
		.manifest th {height: 2em; [monochrome?"border-top-width: 3px":"background-color: #48C; color:white"]}
		.manifest tr.head th { [monochrome?"border-top-width: 1px":"background-color: #488;"] }
		.manifest td:first-child {text-align:right}
		.manifest tr.alt td {[monochrome?"border-top-width: 2px":"background-color: #DEF"]}
	</style></head>
	<table class="manifest" width='350px'>
	<tr class='head'><th>Name</th><th>Occupation</th></tr>
	"}
	var/even = 0
	// sort mobs
	for(var/datum/data/record/t in GLOB.data_core.general)
		var/name = t.fields["name"]
		var/rank = t.fields["rank"]
		var/department = 0
		if(rank in GLOB.command_positions)
			command[name] = rank
			department = 1
		if(rank in GLOB.brotherhood_positions)
			bos[name] = rank
			department = 1
		if(rank in GLOB.den_positions)
			den[name] = rank
			department = 1
		if(rank in GLOB.legion_positions)
			leg[name] = rank
			department = 1
		if(rank in GLOB.ncr_positions)
			ncr[name] = rank
			department = 1
		if(rank in GLOB.vault_positions)
			vault[name] = rank
			department = 1
		if(rank in GLOB.wasteland_positions)
			was[name] = rank
			department = 1
		if(!department && !(name in command))
			misc[name] = rank
	if(command.len > 0)
		dat += "<tr><th colspan=3>Leaders</th></tr>"
		for(var/name in command)
			dat += "<tr[even ? " class='alt'" : ""]><td>[name]</td><td>[command[name]]</td></tr>"
			even = !even
	if(bos.len > 0)
		dat += "<tr><th colspan=3>Brotherhood of Steel</th></tr>"
		for(var/name in bos)
			dat += "<tr[even ? " class='alt'" : ""]><td>[name]</td><td>[bos[name]]</td></tr>"
			even = !even
	if(den.len > 0)
		dat += "<tr><th colspan=3>Kebab</th></tr>"
		for(var/name in den)
			dat += "<tr[even ? " class='alt'" : ""]><td>[name]</td><td>[den[name]]</td></tr>"
			even = !even
	if(leg.len > 0)
		dat += "<tr><th colspan=3>Legion</th></tr>"
		for(var/name in leg)
			dat += "<tr[even ? " class='alt'" : ""]><td>[name]</td><td>[leg[name]]</td></tr>"
			even = !even
	if(ncr.len > 0)
		dat += "<tr><th colspan=3>NCR</th></tr>"
		for(var/name in ncr)
			dat += "<tr[even ? " class='alt'" : ""]><td>[name]</td><td>[ncr[name]]</td></tr>"
			even = !even
	if(vault.len > 0)
		dat += "<tr><th colspan=3>Vault</th></tr>"
		for(var/name in vault)
			dat += "<tr[even ? " class='alt'" : ""]><td>[name]</td><td>[vault[name]]</td></tr>"
			even = !even
	if(was.len > 0)
		dat += "<tr><th colspan=3>Wasteland</th></tr>"
		for(var/name in was)
			dat += "<tr[even ? " class='alt'" : ""]><td>[name]</td><td>[was[name]]</td></tr>"
			even = !even
	// misc guys
	if(misc.len > 0)
		dat += "<tr><th colspan=3>Miscellaneous</th></tr>"
		for(var/name in misc)
			dat += "<tr[even ? " class='alt'" : ""]><td>[name]</td><td>[misc[name]]</td></tr>"
			even = !even

	dat += "</table>"
	dat = replacetext(dat, "\n", "")
	dat = replacetext(dat, "\t", "")
	return dat


/datum/datacore/proc/manifest_inject(mob/living/carbon/human/H, client/C)
	set waitfor = FALSE
	var/static/list/show_directions = list(SOUTH, WEST)
	if(H.mind && (H.mind.assigned_role != H.mind.special_role))
		var/assignment
		if(H.mind.assigned_role)
			assignment = H.mind.assigned_role
		else if(H.job)
			assignment = H.job
		else
			assignment = "Unassigned"

		var/static/record_id_num = 1001
		var/id = num2hex(record_id_num++,6)
		if(!C)
			C = H.client
		var/image = get_id_photo(H, C, show_directions)
		var/obj/item/photo/photo_front = new()
		var/obj/item/photo/photo_side = new()
		for(var/D in show_directions)
			if(D == SOUTH)
				photo_front.photocreate(null, icon(image, dir = D))
			if(D == WEST || D == EAST)
				photo_side.photocreate(null, icon(image, dir = D))

		//These records should ~really~ be merged or something
		//General Record
		var/datum/data/record/G = new()
		G.fields["id"]			= id
		G.fields["name"]		= H.real_name
		G.fields["rank"]		= assignment
		G.fields["age"]			= H.age
		G.fields["species"]	= H.dna.species.name
		G.fields["fingerprint"]	= md5(H.dna.uni_identity)
		G.fields["p_stat"]		= "Active"
		G.fields["m_stat"]		= "Stable"
		G.fields["sex"]			= H.gender
		G.fields["photo_front"]	= photo_front
		G.fields["photo_side"]	= photo_side
		general += G

		//Medical Record
		var/datum/data/record/M = new()
		M.fields["id"]			= id
		M.fields["name"]		= H.real_name
		M.fields["blood_type"]	= H.dna.blood_type
		M.fields["b_dna"]		= H.dna.unique_enzymes
		M.fields["mi_dis"]		= "None"
		M.fields["mi_dis_d"]	= "No minor disabilities have been declared."
		M.fields["ma_dis"]		= "None"
		M.fields["ma_dis_d"]	= "No major disabilities have been diagnosed."
		M.fields["alg"]			= "None"
		M.fields["alg_d"]		= "No allergies have been detected in this patient."
		M.fields["cdi"]			= "None"
		M.fields["cdi_d"]		= "No diseases have been diagnosed at the moment."
		M.fields["notes"]		= "No notes."
		medical += M

		//Security Record
		var/datum/data/record/S = new()
		S.fields["id"]			= id
		S.fields["name"]		= H.real_name
		S.fields["criminal"]	= "None"
		S.fields["mi_crim"]		= list()
		S.fields["ma_crim"]		= list()
		S.fields["notes"]		= "No notes."
		security += S

		//Locked Record
		var/datum/data/record/L = new()
		L.fields["id"]			= md5("[H.real_name][H.mind.assigned_role]")	//surely this should just be id, like the others?
		L.fields["name"]		= H.real_name
		L.fields["rank"] 		= H.mind.assigned_role
		L.fields["age"]			= H.age
		L.fields["sex"]			= H.gender
		L.fields["blood_type"]	= H.dna.blood_type
		L.fields["b_dna"]		= H.dna.unique_enzymes
		L.fields["enzymes"]		= H.dna.struc_enzymes
		L.fields["identity"]	= H.dna.uni_identity
		L.fields["species"]		= H.dna.species.type
		L.fields["features"]	= H.dna.features
		L.fields["image"]		= image
		L.fields["mindref"]		= H.mind
		locked += L
	return

/datum/datacore/proc/get_id_photo(mob/living/carbon/human/H, client/C, show_directions = list(SOUTH))
	var/datum/job/J = SSjob.GetJob(H.mind.assigned_role)
	var/datum/preferences/P
	if(!C)
		C = H.client
	if(C)
		P = C.prefs
	return get_flat_human_icon(null, J, P, DUMMY_HUMAN_SLOT_MANIFEST, show_directions)


/datum/datacore/proc/get_record_by_name(username)
	for(var/i in general)
		var/datum/data/record/to_check = i
		if(username != to_check.fields["name"])
			continue
		return to_check


/datum/datacore/proc/remove_record_by_name(username)
	for(var/datacore_list in list(general, medical, security, locked))
		for(var/j in datacore_list)
			var/datum/data/record/to_remove = j
			if(username != to_remove.fields["name"])
				continue
			datacore_list -= to_remove
			qdel(to_remove)
			break