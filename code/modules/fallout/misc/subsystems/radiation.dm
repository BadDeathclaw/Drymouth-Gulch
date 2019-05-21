var/datum/subsystem/radiation/SSradiation

/datum/subsystem/radiation
	name = "Radiation"

	wait = 50

	var/list/currentrun = list()
	var/list/processing = list()

/datum/subsystem/radiation/New()
	NEW_SS_GLOBAL(SSradiation)


/datum/subsystem/radiation/stat_entry()
	..("P:[mob_list.len]")


/datum/subsystem/radiation/fire(resumed = 0)
	if (!resumed)
		src.currentrun = processing.Copy()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while(currentrun.len)
		var/atom/M = currentrun[currentrun.len]
		currentrun.len--
		if(M)
			M.RadiateRefresh()
		else
			processing.Remove(M)
		if (MC_TICK_CHECK)
			return