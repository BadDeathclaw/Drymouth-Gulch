//Fallout 13 table smoothing simulation

/obj/structure/table
	relative()
		var/table_type = 0 //stand_alone table
		if(junction in cardinal)
			table_type = 1 //endtable
		if(junction in list(3,12))
			table_type = 2 //1 tile thick, streight table
			if(junction == 3) //3 doesn't exist as a dir
				junction = 2
			if(junction == 12) //12 doesn't exist as a dir.
				junction = 4
		if(junction in list(5,6,9,10))
			var/turf/T = get_step(src.loc,junction)
			for(var/a_type in canSmoothWith)
				var/A = locate(a_type) in T
				if(A || istype(T,a_type))
					table_type = 3
					break
			if(table_type != 3)
				table_type = 2
		if(junction in list(13,14,7,11)) //Three-way intersection
			table_type = 3 //full table as three-way intersections are not sprited, would require 64 sprites to handle all combinations
			switch(junction)
				if(7)
					junction = 4
				if(11)
					junction = 8
				if(13)
					junction = 1
				if(14)
					junction = 2 //These translate the dir_sum to the correct dirs from the 'tabledir' icon_state.
		if(junction == 15)
			table_type = 4 //4-way intersection, the 'middle' table sprites will be used.

		switch(table_type)
			if(0)
				icon_state = "[icontype]"
			if(1)
				icon_state = "[icontype]_1tileendtable"
			if(2)
				icon_state = "[icontype]_1tilethick"
			if(3)
				icon_state = "[icontype]_dir"
			if(4)
				icon_state = "[icontype]_middle"

		if (junction in list(1,2,4,8,5,6,9,10))
			dir = junction
		else
			dir = 2