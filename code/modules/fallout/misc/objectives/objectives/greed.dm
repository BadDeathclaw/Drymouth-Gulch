//Fallout 13 - We had two bags of grass, seventy-five pellets of mescaline, five sheets of high-powered blotter acid, a saltshaker half-full of cocaine, and a whole galaxy of multi-colored uppers, downers, screamers, laughers...

/datum/f13_objective/greed
	name = "Fear and Loathing in Wasteland"
	desc = "Your family home has shattered, the promising business went down the drain, and on top of it - you're totally out of money.<br>You have to collect %count% caps to get your life back together."
	kind = INDIVIDUAL

	assignto_mind(datum/mind/M, var/list/data = list())
		data["count"] = round(rand(100,500),50)
		..()
	check_complete(var/datum/objective_holder/holder)
		var/datum/mind/mind = holder.owner
		if(!mind.current)
			return 0
		var/current = 0
		for(var/obj/item/stack/caps/caps in mind.current.get_contents())
			current += caps.amount
		if(current < holder.data["count"])
			return 0
		return 1