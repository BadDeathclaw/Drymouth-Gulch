//Fallout 13 object and item weight simulation

/go
	var/contents_weight = 0
	var/self_weight

/go/New(atom/loc)
	..()
	if(SSobj.initialized)
		if(istype(loc))
			forceMove(loc)
		weight_init()

/go/initialize()
	..()
	if(istype(loc))
		forceMove(loc)
	weight_init()

/go/proc/weight_init()
	if(self_weight == null && isitem(src))
		var/obj/item/I = src
		switch(I.w_class)
			if(0)
				self_weight = 0
			if(1)
				self_weight = 0.500
			if(2)
				self_weight = 1.500
			if(3)
				self_weight = 3.000
			if(4)
				self_weight = 8.000
			if(5)
				self_weight = 14.000
			if(6)
				self_weight = 25.000
	if(istype(loc, /go))
		var/go/L = loc
		L.update_weight(self_weight)

/go/proc/update_weight(var/weight)
	if(istype(loc, /go))
		var/go/L = loc
		L.update_weight(weight)
	contents_weight = max(0, contents_weight + weight)

/go/Entered(go/A, atom/oldloc)
	. = ..()
	update_weight(A.self_weight + A.contents_weight)

/go/Exited(go/A, atom/newloc)
	. = ..()
	update_weight( -(A.self_weight + A.contents_weight))

/mob/living/carbon/Move(n, direct)
	. = ..()
	if(!.)
		return .
	if(contents_weight > LIMIT_WEIGHT && prob(5))
		Weaken(1)