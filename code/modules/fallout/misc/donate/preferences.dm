#define MAX_ITEM_LENGTH 9
/*
This proc take soooo much perfomance.. Cause i'm using CHECK_TICK on every step, to avoid lags.

                                                                                      JackerZz.
*/


/datum/preferences/proc/ShowCharacterSetup(mob/user)
	if(!user || !user.client)
		return
	if(parent)
		parent.update_content_data()
	CHECK_TICK
	if(!choiced_faction)
		choiced_faction = get_faction_datum("none")

	var/saves_data
	if(path)
		var/savefile/S = new /savefile(path)
		if(S)
			saves_data += "<center>"
			var/name
			for(var/i=1, i<=max_save_slots, i++)
				S.cd = "/character[i]"
				S["real_name"] >> name
				if(!name)
					name = "Character[i]"
					//if(i!=1) dat += " | "
				saves_data += "<a href='?_src_=prefs;preference=changeslot;num=[i];' [i == default_slot ? "class='linkOn'" : ""]>[name]</a> "
			saves_data += "</center>"
	CHECK_TICK
//Data of factions. Taking all available factions of this world and showing them as list (once can show 4 max).
	var/factions_data
	if(parent && parent.allowed_factions)
		for(var/i = choiced_faction_index to choiced_faction_index + 3)
			if(i > parent.allowed_factions.len)
				break
			var/datum/f13_faction/faction = parent.allowed_factions[i]
			factions_data += "<a href='?_src_=prefs;preference=faction;task=input;faction_id=[faction.id];' data-tooltip=\"[quoter(faction.full_name)]\"  class='tooltip[faction == choiced_faction ? " linkOn" : ""]'>[faction.name]</a>"
	if(!factions_data)
		factions_data = "<center>No available factions</center>"


// Roles data. Showing all jobs of selected faction and showing priorities.
	CHECK_TICK
	var/jobs_data
	if(parent && parent.allowed_factions)
		for(var/datum/job/j in SSjob.occupations)
			if(j.faction == choiced_faction.id)
				var/available = parent.mob.IsJobAvailable(null, j)
				if(available)
					var/job_class = "disabled_job"
					var/prefUpperLevel = 3
					var/priority = "disabled"
					if(GetJobDepartment(j, 1) & j.flag)
						job_class = "high_job"
						prefUpperLevel = 4
						priority = "high"
					else if(GetJobDepartment(j, 2) & j.flag)
						job_class = "middle_job"
						prefUpperLevel = 1
						priority = "middle"
					else if(GetJobDepartment(j, 3) & j.flag)
						job_class = "low_job"
						prefUpperLevel = 2
						priority = "low"

					jobs_data += "<a class=\"l70 [job_class][selected_job == j ? " linkOn" : ""] tooltip\" data-tooltip=\"[RoleTooltip(j.title, j.department_head, j.desc, priority)]\" href='?_src_=prefs;preference=job_equip;task=input;job_key=[j.flag];level=[prefUpperLevel];rank=[j.title];department_key=[j.department_flag];'>[j.title]</a>"
				else
					jobs_data += "<a class=\"l70 unavailable_job\">[j.title]</a>"
	if(!jobs_data)
		jobs_data = "No available roles"
	CHECK_TICK

//Outfit data. Showing name of weared items. Taking item objects from pool (They already created and pooled at update_preview_icon())
	var/datum/outfit/outfit
	if(selected_job)
		if(!outfits)
			outfits = new()
		else
			if(outfits.Find(selected_job.type))
				outfit = outfits[selected_job.type]
		if(!outfit)
			outfit = new selected_job.outfit()
			outfits[selected_job.type] = outfit
	var
		e_head
		e_suit
		e_uniform
		e_shoes
		e_gloves
		e_l_pocket
		e_weapon
		e_r_pocket
		d_head
		d_suit
		d_uniform
		d_shoes
		d_gloves
		d_l_pocket
		d_weapon
		d_r_pocket
	if(outfit && outfit.name != "Naked")
		var/obj/item/temp
		if(outfit.head)
			temp = PoolOrNew(outfit.head)
			e_head = temp.name
			d_head = temp.desc
			PlaceInPool(temp, FALSE)
		if(outfit.suit)
			temp = PoolOrNew(outfit.suit)
			e_suit = temp.name
			d_suit = temp.desc
			PlaceInPool(temp, FALSE)
		if(outfit.uniform)
			temp = PoolOrNew(outfit.uniform)
			e_uniform = temp.name
			d_uniform = temp.desc
			PlaceInPool(temp, FALSE)
		if(outfit.shoes)
			temp = PoolOrNew(outfit.shoes)
			e_shoes = temp.name
			d_shoes = temp.desc
			PlaceInPool(temp, FALSE)
		if(outfit.gloves)
			temp = PoolOrNew(outfit.gloves)
			e_gloves = temp.name
			d_gloves = temp.desc
			PlaceInPool(temp, FALSE)
		if(outfit.l_pocket)
			temp = PoolOrNew(outfit.l_pocket)
			e_l_pocket = temp.name
			d_l_pocket = temp.desc
			PlaceInPool(temp, FALSE)
		if(outfit.weapon)
			temp = PoolOrNew(outfit.weapon)
			e_weapon = temp.name
			d_weapon = temp.desc
			PlaceInPool(temp, FALSE)
		if(outfit.r_pocket)
			temp = PoolOrNew(outfit.r_pocket)
			e_r_pocket = temp.name
			d_r_pocket = temp.desc
			PlaceInPool(temp, FALSE)

	var/list/data = list(
	"saves_data" = "[saves_data]",
	"r_name" = "[be_random_name ? "Yes" : "No"]",
	"name" = "[real_name]",

	"gender" = "[gender == MALE ? "&#9794;Male" : "&#9792;Female"]",
	"age" = "[age]",
	"r_body" = "[be_random_body ? "Yes" : "No"]",
	"species" = "[pref_species ? pref_species.name : "Human"]",
	"skin_tone" = "[skin_tone]",
	"factions_data" = "[factions_data]",
	"f_id" = "[choiced_faction.id]",
	"f_name" = "[choiced_faction.full_name]",
	"f_desc" = "[choiced_faction.description]",
	"head" = "[e_head ? e_head : "Empty"]",
	"suit" = "[e_suit ? e_suit : "Empty"]",
	"uniform" = "[e_uniform ? e_uniform : "Empty"]",
	"shoes" = "[e_shoes ? e_shoes : "Empty"]",
	"jobs_data" = "[jobs_data]",
	"gloves" = "[e_gloves ? e_gloves : "Empty"]",
	"l_pocket" = "[e_l_pocket ? e_l_pocket : "Empty"]",
	"weapon" = "[e_weapon ? e_weapon : "Empty"]",
	"r_pocket" = "[e_r_pocket ? e_r_pocket : "Empty"]",
	"hair_style" = "[hair_style]",
	"hair_color" = "#[hair_color]",
	"f_hair_style" = "[facial_hair_style]",
	"f_hair_color" = "#[facial_hair_color]",
	"eye_color" = "#[eye_color]",
	"d_head" = "[d_head]",
	"d_suit" = "[d_suit]",
	"d_uniform" = "[d_uniform]",
	"d_shoes" = "[d_shoes]",
	"d_gloves" = "[d_gloves]",
	"d_l_pocket" = "[d_l_pocket]",
	"d_r_pocket" = "[d_r_pocket]",
	"d_weapon" = "[d_weapon]"
	)
	CHECK_TICK

	var/html = {"<center>
	<a href='?_src_=prefs;preference=tab;tab=0' class='linkOn'>Character Settings</a> <a href='?_src_=prefs;preference=tab;tab=1' >Game Preferences</a>
	</center>
	<HR>
	<center>
	[data["saves_data"]]
	</center>
	<div class="first_block">
		<h2>Identity</h2>
		<table width='100%'>
			<tr>
				<td width='75%' valign='top'>
					<a href='?_src_=prefs;preference=name;task=random'>&#9762; Random Name</a>
					<a href='?_src_=prefs;preference=name'>Always Random Name: [data["r_name"]]</a>
					<br>
					<b>Name:</b>
					<a href='?_src_=prefs;preference=name;task=input'>[data["name"]]</a>
					<br>
					<b>Gender:</b>
					<a href='?_src_=prefs;preference=gender'>[data["gender"]]</a>
					<br>
					<b>Age:</b>
					<a href='?_src_=prefs;preference=age;task=input'>[data["age"]]</a>
					<br>
				</td>
				<!--<td valign='center'>
					<div class='statusDisplay'><center><img src="img/person.png" width=160 height=96></center></div>
				</td-->
			</tr>
		</table>
	</div>
	<div class="second_block">
		<h2>Body</h2>
		<table>
			<tr>
				<td>
					<a href='?_src_=prefs;preference=all;task=random'>&#9762; Random Body</a>
				</td>
				<td>
					<a href='?_src_=prefs;preference=all'>Always Random Body: [data["r_body"]]</a><br>
				</td>
			</tr>
			<tr>
				<td>
					<b>Species:</b>
				</td>
				<td>
					<b>Skin Tone</b>
				</td>
			</tr>
			<tr>
				<td>
					<a href='?_src_=prefs;preference=species;task=input'>[data["species"]]</a>
				</td>
				<td>
					<a href='?_src_=prefs;preference=s_tone;task=input'>[data["skin_tone"]]</a>
				</td>
			</tr>
		</table>
	</div>
	<div class="third_block">
		<div class="third_block_39">
			<h3>Choose your faction</h3><br>
			<div class="a_block">
				[data["factions_data"]]
			</div>
			<div class="left_block_table">
				<a href='?_src_=prefs;task=faction_previous'>&lt;</a>
				<a href='?_src_=prefs;task=faction_next'>&gt;</a>
				<div class="frame">
					<div class="wrap_frame">
						<center>
							<div class="leg_img">
								<img src="[data["f_id"]].png" alt="logo">
							</div>
						</center>
						<b><center>[data["f_name"]]</center></b>
						[data["f_desc"]]
					</div>
				</div>
			</div>
			<div class="right_block_frame">
				<div class="right_block_frame_item">
					<h3>Headgear</h3>
					<a href='?_src_=prefs;preference=chooise;task=equip;item=head;' [data["d_head"] ? "class=\"tooltip\" data-tooltip=\"[ItemTooltip(data["head"], data["d_head"] )]\"" : "" ]>[CutText(data["head"], MAX_ITEM_LENGTH)]</a><br>
					<a href='?_src_=prefs;preference=previous;task=equip;item=head'>&lt;</a>
					<a href='?_src_=prefs;preference=next;task=equip;item=head'>&gt;</a>
				</div>
				<div class="right_block_frame_item">
					<h3>Armor</h3>
					<a href='?_src_=prefs;preference=chooise;task=equip;item=armor' [data["d_suit"] ? "class=\"tooltip\" data-tooltip=\"[ItemTooltip(data["suit"], data["d_suit"])]\"" : "" ]>[CutText(data["suit"], MAX_ITEM_LENGTH)]</a><br>
					<a href='?_src_=prefs;preference=previous;task=equip;item=armor'>&lt;</a>
					<a href='?_src_=prefs;preference=next;task=equip;item=armor'>&gt;</a>
				</div>
				<div class="right_block_frame_item">
					<h3>Uniform</h3>
					<a href='?_src_=prefs;preference=chooise;task=equip;item=uniform' [data["d_uniform"] ? "class=\"tooltip\" data-tooltip=\"[ItemTooltip(data["uniform"], data["d_uniform"])]\"" : "" ]>[CutText(data["uniform"], MAX_ITEM_LENGTH)]</a><br>
					<a href='?_src_=prefs;preference=previous;task=equip;item=uniform'>&lt;</a>
					<a href='?_src_=prefs;preference=next;task=equip;item=uniform'>&gt;</a>
				</div>
				<div class="right_block_frame_item">
					<h3>Shoes</h3>
					<a href='?_src_=prefs;preference=chooise;task=equip;item=shoes' [data["d_shoes"] ? "class=\"tooltip\" data-tooltip=\"[ItemTooltip(data["shoes"], data["d_shoes"])]\"" : "" ]>[CutText(data["shoes"], MAX_ITEM_LENGTH)]</a><br>
					<a href='?_src_=prefs;preference=previous;task=equip;item=shoes'>&lt;</a>
					<a href='?_src_=prefs;preference=next;task=equip;item=shoes'>&gt;</a>
				</div>
			</div>
		</div><!--1 блок 39-->
		<div class="third_block_39 job">
		<h3>Choose your role</h3><br>
			<div class="job_p">
				[data["jobs_data"]]
			</div>
			<div class="middle_img">
				<img src="previewicon.png" width="160" height="96" alt="player-preview">
			</div>
			<div class="middle_text">
				<div class="left_mid">
					<div class="mid_item">
						<h3>Gloves</h3>
						<a href='?_src_=prefs;preference=chooise;task=equip;item=gloves' [data["d_gloves"] ? "class=\"tooltip\" data-tooltip=\"[ItemTooltip(data["gloves"], data["d_gloves"])]\"" : "" ]>[CutText(data["gloves"], MAX_ITEM_LENGTH)]</a><br>
						<a href='?_src_=prefs;preference=previous;task=equip;item=gloves'>&lt;</a>
						<a href='?_src_=prefs;preference=next;task=equip;item=gloves'>&gt;</a>
					</div>
					<div class="mid_item">
						<h3>Pocket 1</h3>
						<a href='?_src_=prefs;preference=chooise;task=equip;item=pocket_1' [data["d_r_pocket"] ? "class=\"tooltip\" data-tooltip=\"[ItemTooltip(data["r_pocket"], data["d_r_pocket"])]\"" : "" ]>[CutText(data["r_pocket"], MAX_ITEM_LENGTH)]</a><br>
						<a href='?_src_=prefs;preference=previous;task=equip;item=pocket_1'>&lt;</a>
						<a href='?_src_=prefs;preference=next;task=equip;item=pocket_1'>&gt;</a>
					</div>
				</div>
				<div class="right_mid">
					<div class="mid_item">
						<h3>Weapon</h3>
						<a href='?_src_=prefs;preference=chooise;task=equip;item=weapon' [data["d_weapon"] ? "class=\"tooltip\" data-tooltip=\"[ItemTooltip(data["weapon"], data["d_weapon"])]\"" : "" ]>[CutText(data["weapon"], MAX_ITEM_LENGTH)]</a><br>
						<a href='?_src_=prefs;preference=previous;task=equip;item=weapon'>&lt;</a>
						<a href='?_src_=prefs;preference=next;task=equip;item=weapon'>&gt;</a>
					</div>
					<div class="mid_item">
						<h3>Pocket 2</h3>
						<a href='?_src_=prefs;preference=chooise;task=equip;item=pocket_2' [data["d_l_pocket"] ? "class=\"tooltip\" data-tooltip=\"[ItemTooltip(data["l_pocket"], data["d_l_pocket"])]\"" : "" ]>[CutText(data["l_pocket"], MAX_ITEM_LENGTH)]</a><br>
						<a href='?_src_=prefs;preference=previous;task=equip;item=pocket_2'>&lt;</a>
						<a href='?_src_=prefs;preference=next;task=equip;item=pocket_2'>&gt;</a>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="right_block">
					<table>
					<tr>
						<td valign='top' width='21%'>
							<h3>Hair Style</h3>
							<a href='?_src_=prefs;preference=hair_style;task=input'>[data["hair_style"]]</a><br>
							<a href='?_src_=prefs;preference=previous_hair_style;task=input'>&lt;</a>
							<a href='?_src_=prefs;preference=next_hair_style;task=input'>&gt;</a><br>
							<span style='border:1px solid #161616; background-color: [data["hair_color"]];'>&nbsp;&nbsp;&nbsp;</span>
							<a href='?_src_=prefs;preference=hair;task=input'>Change</a><br>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td valign='top' width='21%'>
							<h3>Facial Hair Style</h3>
							<a href='?_src_=prefs;preference=facial_hair_style;task=input'>[data["f_hair_style"]]</a><br>
							<a href='?_src_=prefs;preference=previous_facehair_style;task=input'>&lt;</a> <a href='?_src_=prefs;preference=next_facehair_style;task=input'>&gt;</a><br><span style='border: 1px solid #161616; background-color: [data["f_hair_color"]];'>&nbsp;&nbsp;&nbsp;</span>
							<a href='?_src_=prefs;preference=facial;task=input'>Change</a><br>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td valign='top' width='21%'>
							<h3>Eye Color</h3>
							<span style='border: 1px solid #161616; background-color: [data["eye_color"]];'>&nbsp;&nbsp;&nbsp;</span>
							<a href='?_src_=prefs;preference=eyes;task=input'>Change</a><br>
						</td>
					</tr>
				</table>
				</div>
				<div class="clearBoth g" ></div>
				<hr><center>
				<a href='?_src_=prefs;preference=load'>Undo</a>
				<a href='?_src_=prefs;preference=save'>&#128190; Save Setup</a>
				<a href='?_src_=prefs;preference=reset_all'>&#9762; Reset Setup</a>
				</center>"}
	CHECK_TICK
	var/datum/browser/popup = new(user, "preferences", "<div align='center'>Character Setup</div>", 640, 750)
	popup.set_content(html)
	popup.open(0)
	return 1

/datum/preferences/proc/ItemTooltip(var/name, var/desc)
	return "<b>[quoter(name)]</b><br><i>[quoter(desc)]</i>"

/datum/preferences/proc/RoleTooltip(name, list/heads,desc, priority)
	return "<b>[name]</b><br>[istype(heads) && heads.len ? "subordinates to: [jointext(heads, ", ")]<br>" : ""]priority: [priority]<br><i>[quoter(desc)]</i>"

//Just changing list of allowed item paths to item names.
/datum/preferences/proc/GetItemNamesList(itype, datum/job/job)
	var/list/names = list("none")
	var/list/items = GetItems(itype, job)
	for(var/item in items)
		names += get_var_from_type(item, "name")
	return names

//Return item path from item name. It's looking in allowed items to selected job.
/datum/preferences/proc/GetItemByName(name, itype, datum/job/job)
	var/list/items = GetItems(itype, job)
	for(var/item in items)
		if(name == get_var_from_type(item, "name"))
			return item
	return null

//Return accessable list of types of items for selected job and selected slot (head,armor, misc).
/datum/preferences/proc/GetItems(itype, datum/job/job)
	var/list/items = list()
	var/datum/outfit/O = new job.outfit()
	if(O)
		switch(itype)
			if("head")
				items += O.head
			if("armor")
				items += O.suit
			if("shoes")
				items += O.shoes
			if("gloves")
				items += O.gloves
			if("misc")
				items += O.r_pocket
				items += O.l_pocket
			if("weapon")
				items += O.weapon
			if("uniform")
				items += O.uniform
	if(job.required_items)
		for(var/item in job.required_items)
			if(slot_name_by_type(item) == itype)
				items += item
	for(var/id in parent.content_packs)
		var/datum/content_pack/pack = SScontent.get_pack(id)
		if(id in job.allowed_packs)
			for(var/item in pack.sorted_items[itype])
				if(!(item in job.denied_items))
					items += item
	return items

//Get saved outfit of "job"
/datum/preferences/proc/GetOutfit(job)
	if(!job)
		return null
	if(ispath(job))
		. = outfits[job]
		if(!.)
			. = get_var_from_type(job, "outfit")
	else
		. = outfits[job:type]
		if(!.)
			. = job:outfit
#undef MAX_ITEM_LENGTH