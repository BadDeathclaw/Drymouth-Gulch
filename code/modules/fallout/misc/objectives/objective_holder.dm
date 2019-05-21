//Fallout 13 objective holder

/datum/objective_holder
	var/owner
	var/datum/f13_objective/parent
	var/list/data

/datum/objective_holder/New(subject, datum/f13_objective/O, list/data)
	src.parent = O
	src.owner = subject
	src.data = data