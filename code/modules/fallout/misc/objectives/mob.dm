//Fallout 13 objectives simulation

/mob/proc/show_objectives(var/mob/user)
	var/datum/f13_faction/F = get_faction_datum(social_faction)

	if(!mind)
		return

	var/f_objective = 1
	var/m_objective = 1

	if(!mind.objective)
		m_objective = 0
	if(!F.objective)
		f_objective = 0
	var/objective_completed_ind = "<font color='#ff0000'>&#10008;</font>"
	if(m_objective && mind.objective.parent.check_complete(mind.objective))
		objective_completed_ind = "<font color='#00ff00'>&#10004;</font>"

	var/objective_completed_fac = "<font color='#ff0000'>&#10008;</font>"
	if(f_objective && F.objective.parent.check_complete(F.objective))
		objective_completed_fac = "<font color='#00ff00'>&#10004;</font>"

	var/faction_data
	if(f_objective)
		faction_data += {"
		<tr>
			<td>
				[objective_completed_fac] Faction Objective:
			</td>
			<td>
				<b>[F.objective.parent.name]</b><br>
				<i>[FormatText(F.objective.parent.desc, F.objective.data)]</i><br>
				[FormatText(F.objective.data["custom_desc"],F.objective.data)]
			</td>
		</tr>
		"}
	var/mind_data
	if(m_objective)
		mind_data += {"
		<tr [!m_objective ? "style='visibility:none'" : ""]>
			<td>
				[objective_completed_ind] Role Objective:
			</td>
			<td>
				<b>[mind.objective.parent.name]</b><br>
				<i>[FormatText(mind.objective.parent.desc, mind.objective.data)]</i><br>
				[FormatText(mind.objective.data["custom_desc"],mind.objective.data)]
			</td>
		</tr>
		"}



	var/html = {"
	<table>
		[faction_data]
		[mind_data]
	</table>
	"}

	var/title
	if(user == src)
		title = "<div align='center'>Objectives</div>"
	else
		title = "<div align='center'>[src]'s Objectives</div>"

	var/datum/browser/popup = new(user, "objectives", title, 500, 200)
	popup.set_content(html)
	popup.open(0)

/mob/verb/see_objectives()
	set name = "Objectives"
	set category = "IC"
	show_objectives(src)