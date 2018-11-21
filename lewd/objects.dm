/obj/item/dildo
	name = "dildo"
	desc = "Hmmm, deal throw."
	icon = 'honk/icons/obj/items/dildo.dmi'
	icon_state = "dildo"
	item_state = "c_tube"
	throwforce = 0
	force = 5
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("slammed", "bashed", "whipped")

	var/hole = CUM_TARGET_VAGINA

/obj/item/dildo/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/message = ""
	if(istype(M, /mob/living/carbon/human) && user.zone_selected == "groin" && M.is_nude())
		if(hole == CUM_TARGET_VAGINA && M.has_vagina())
			message = (user == M) ? pick("fucks their own pussy with \the [src]","shoves the [src] into their pussy", "jams the [src] into their pussy") : pick("fucks [M] right in the pussy with \the [src]", "jams \the [src] right into [M]'s pussy")
		else if(hole == CUM_TARGET_ANUS && M.has_anus())
			message = (user == M) ? pick("fucks their own ass with \the [src]","shoves the [src] into their ass", "jams the [src] into their ass") : pick("fucks [M]'s asshole with \the [src]", "jams \the [src] into [M]'s ass")
	if(message)
		user.visible_message("<font color=purple>[user] [message].</font>")
		M.handle_post_sex(5, null, user)
		playsound(loc, "honk/sound/interactions/bang[rand(4, 6)].ogg", 70, 1, -1)
	else
		return ..()

/obj/item/dildo/attack_self(mob/user as mob)
	if(hole == CUM_TARGET_VAGINA)
		hole = CUM_TARGET_ANUS
	else
		hole = CUM_TARGET_VAGINA
	to_chat(user, "<span class='warning'>Hmmm. Maybe we should put it in \a [hole]?</span>")

//reagent here
/datum/reagent/consumable/cum
	name = "cum"
	id = "cum"
	description = "Where you found this is your own business."
	color = "#AAAAAA77"
	taste_description = "something with a tang"
	data = list("donor"=null,"viruses"=null,"donor_DNA"=null,"blood_type"=null,"resistances"=null,"trace_chem"=null,"mind"=null,"ckey"=null,"gender"=null,"real_name"=null)
	taste_mult = 2
	reagent_state = LIQUID
	nutriment_factor = 0.5 * REAGENTS_METABOLISM

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
	name = "cum"
	desc = "It's pie cream from a cream pie. Or not..."
	gender = PLURAL
	layer = ABOVE_NORMAL_TURF_LAYER
	density = 0
	icon = 'honk/icons/effects/cum.dmi'
	random_icon_states = list("cum1", "cum3", "cum4", "cum5", "cum6", "cum7", "cum8", "cum9", "cum10", "cum11", "cum12")
	mergeable_decal = FALSE
	blood_state = null
	bloodiness = null
	//var/blood_DNA = list()
	beauty = -50

/obj/effect/decal/cleanable/cum/Initialize()
	..()
	dir = pick(1,2,4,8)
	reagents.add_reagent("cum", rand(8,13))
	add_blood_DNA(list("Unknown DNA" = "O+"))