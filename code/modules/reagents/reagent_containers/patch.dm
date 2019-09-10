/obj/item/reagent_containers/pill/patch
	name = "chemical patch"
	desc = "A chemical patch for touch based applications."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bandaid"
	item_state = "bandaid"
	possible_transfer_amounts = list()
	volume = 40
	apply_type = PATCH
	apply_method = "apply"
	self_delay = 30		// three seconds
	dissolvable = FALSE

/obj/item/reagent_containers/pill/patch/attack(mob/living/L, mob/user)
	if(ishuman(L))
		var/obj/item/bodypart/affecting = L.get_bodypart(check_zone(user.zone_selected))
		if(!affecting)
			to_chat(user, "<span class='warning'>The limb is missing!</span>")
			return
		if(affecting.status != BODYPART_ORGANIC)
			to_chat(user, "<span class='notice'>Medicine won't work on a robotic limb!</span>")
			return
	..()

/obj/item/reagent_containers/pill/patch/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return 0
	return 1 // Masks were stopping people from "eating" patches. Thanks, inheritance.

/obj/item/reagent_containers/pill/patch/styptic
	name = "brute patch"
	desc = "Helps with brute injuries."
	list_reagents = list("styptic_powder" = 20)
	icon_state = "bandaid_brute"

/obj/item/reagent_containers/pill/patch/silver_sulf
	name = "burn patch"
	desc = "Helps with burn injuries."
	list_reagents = list("silver_sulfadiazine" = 20)
	icon_state = "bandaid_burn"

/obj/item/reagent_containers/pill/patch/jet
	name = "Jet"
	desc = "A highly addictive chem that produces a fast-acting, intense euphoric high on the user."
	list_reagents = list("jet" = 10)
	icon_state = "bandaid_jet"

/obj/item/reagent_containers/pill/patch/turbo
	name = "Turbo"
	desc = "A chem that vastly increases the user's reflexes and slows their perception of time."
	list_reagents = list("turbo" = 5)
	icon_state = "bandaid_turbo"

/obj/item/reagent_containers/pill/patch/healingpowder
	name = "Healing Powder"
	desc = "A powder used to heal physical wounds derived from ground broc flowers and xander roots, commonly used by tribals."
	list_reagents = list("healing_powder" = 10)
	icon_state = "bandaid_healingpowder"

/obj/item/reagent_containers/pill/patch/healpoultice
	name = "Healing poultice"
	desc = "A concoction of broc flower, cave fungus, agrave fruit and xander root."
	list_reagents = list("healing_poultice" = 10)
	icon_state = "bandaid_healingpoultice"
