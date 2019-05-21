/datum/time_of_day
	var/name = ""
	var/color = ""
	var/duration = 300

/datum/time_of_day/day
	name = "Day"
	color = "#FFFFFF"
	duration = 9000

/datum/time_of_day/morning
	name = "Morning"
	color = "#808599"
	duration = 4500

/datum/time_of_day/evening
	name = "Evening"
	color = "#FFA891"
	duration = 4500

/datum/time_of_day/night
	name = "Night"
	color = "#050d29"
	duration = 9000

var/day=1
var/month=1
//var/year=2255

proc/dodaychange()
	day+=1
	if(day>=31)
		month+=1
		day=1