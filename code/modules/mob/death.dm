//This is the proc for gibbing a mob. Cannot gib ghosts.
//added different sort of gibs and animations. N
/mob/proc/gib()
	return

//This is the proc for turning a mob into ash. Mostly a copy of gib code (above).
//Originally created for wizard disintegrate. I've removed the virus code since it's irrelevant here.
//Dusting robots does not eject the MMI, so it's a bit more powerful than gib() /N
/mob/proc/dust()
	return

//Proc for bodies liquifying.
//I don't know why everything is so split up like this, it's horrible, but the bulk of these three procs is buried in mob/living/death.
/mob/proc/liquefy()
	return

/mob/proc/death(gibbed)
	return