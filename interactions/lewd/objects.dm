//reagent here
/datum/reagent/consumable/cum // could probably be made /blood/consumable/cum to just inherit the DNA procs sometime
	name = "poop"
	id = "cum"
	description = "Pegion poop."
	color = "#AAAAAA77"
	taste_description = "something with a tang"
	data = list("donor"=null,"viruses"=null,"donor_DNA"=null,"blood_type"=null,"resistances"=null,"trace_chem"=null,"mind"=null,"ckey"=null,"gender"=null,"real_name"=null)
	taste_mult = 2
	reagent_state = LIQUID
	nutriment_factor = 0.5 * REAGENTS_METABOLISM
	glass_icon_state = "glass_white"
	glass_name = "glass of cream"
	glass_desc = "Smells suspicious."
	shot_glass_icon_state = "shotglasscream"

/datum/reagent/consumable/cum/reaction_turf(turf/T, reac_volume)
	if(!istype(T))
		return
	if(reac_volume < 3)
		return

	var/obj/effect/decal/cleanable/cum/S = locate() in T
	if(!S)
		S = new(T)
	S.reagents.add_reagent("cum", reac_volume)
	if(data["blood_DNA"])
		S.add_blood_DNA(list(data["blood_DNA"] = data["blood_type"])) //yes. STD

//cleanable here

/obj/effect/decal/cleanable/cum
	name = "Poop"
	desc = "It's piegon poop."
	gender = PLURAL
	layer = ABOVE_NORMAL_TURF_LAYER
	density = 0
	icon = 'honk/icons/effects/cum.dmi'
	icon_state = "cum1"
	random_icon_states = list("cum1", "cum3", "cum4", "cum5", "cum6", "cum7", "cum8", "cum9", "cum10", "cum11", "cum12")
	mergeable_decal = TRUE
	blood_state = null
	bloodiness = null
	//var/blood_DNA = list()

/obj/effect/decal/cleanable/cum/Initialize()
	. = ..()
	dir = pick(1,2,4,8)
	reagents.add_reagent("cum", rand(8,13))
	add_blood_DNA(list("Unknown DNA" = "O+"))
