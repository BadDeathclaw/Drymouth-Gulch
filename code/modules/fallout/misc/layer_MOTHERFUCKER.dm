/area/Entered(atom/movable/Obj,atom/OldLoc)
	..()
	if(OldLoc == null)
		Obj.layer += open_space ? 15 : -15
	else
		var/area/old = get_area(OldLoc)
		if(old.open_space != open_space)
			Obj.layer += open_space ? 15 : -15