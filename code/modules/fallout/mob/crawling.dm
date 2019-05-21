//Fallout 13 - crawling is fun

// So stupid, but it works. Other stuff doing at /mob/proc/update_canmove()
// To crawl under structure just set can_crawled = 1 on it and add to CanPass PASSCRAWL check.

mob/var/under_object
/obj/structure/var/can_crawled = 0

proc/get_crawled_object(var/turf/T)
	for(var/obj/structure/S in T)
		if(S.can_crawled)
			return S

/turf/open/Entered(go/Obj,atom/OldLoc)
	. = ..()
	if(iscarbon(Obj) && Obj.pass_flags & PASSCRAWL && isturf(OldLoc))
		var/mob/living/carbon/C = Obj
		if(!C.lying)
			return .
		var/obj/structure/crawled_obj = get_crawled_object(src)
		if(!crawled_obj)
			return .
		if(C.under_object)
			C.under_object = crawled_obj
			return .
		if(!get_crawled_object(OldLoc))
			C.under_object = crawled_obj
			C.update_canmove()
/turf/open/Exited(go/Obj, atom/newloc)
	. = ..()
	if(iscarbon(Obj) && isturf(newloc))
		var/mob/living/carbon/C = Obj
		if(C.under_object && !get_crawled_object(newloc))
			spawn(C.movement_delay()/3)
				C.under_object = null
				C.update_canmove()