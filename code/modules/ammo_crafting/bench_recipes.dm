
/datum/bench_crafting_recipe
	var/name = "" //in-game display name
	var/reqs[] = list() //type paths of items consumed associated with how many are needed
	var/results[] = list() //type paths of item resulting from this craft
	var/tools[] = list() //type paths of items needed but not consumed
	var/station
	var/time = 0 //time in deciseconds
	var/parts[] = list() //type paths of items that will be placed in the result
	var/category = CAT_NONE //where it shows up in the crafting UI

/datum/bench_crafting_recipe/ammo
	name = "default ammo recipe"
	station = "Ammo Crafting Bench"
	category = CAT_PISTOL
