/obj/item/reagent_containers/wasteland_fauna
	name = "piece of a wasteland critter"
	desc = "Gross! Also you shouldn't see this."
	icon = 'icons/obj/wasteland_scavenge.dmi'
	icon_state = "bone"
	container_type = DRAWABLE
	grind_results = list() //To let them be ground up to transfer their reagents

/obj/item/reagent_containers/wasteland_fauna/proc/On_Consume(mob/living/eater)
	if(!eater)
		return
	if(!reagents.total_volume)
		qdel(src)


/obj/item/reagent_containers/wasteland_fauna/attack_self(mob/user)
	return


/obj/item/reagent_containers/wasteland_fauna/attack(mob/living/M, mob/living/user, def_zone)
	if(user.a_intent == INTENT_HARM)
		return ..()
	var/eatverb = pick("bite","chew","nibble","gnaw","gobble","chomp")
	if(!reagents.total_volume)						//Shouldn't be needed but it checks to see if it has anything left in it.
		to_chat(user, "<span class='notice'>None of [src] left, oh no!</span>")
		qdel(src)
		return 0
	if(iscarbon(M))
		if(!canconsume(M, user))
			return 0

		if(M == user)	//If you're eating it yourself.
			user.visible_message("<span class='notice'>[user] takes a [eatverb] from \the [src].</span>", "<span class='notice'>You take a [eatverb] from \the [src].</span>")
			if(M.has_trait(TRAIT_VORACIOUS))
				M.changeNext_move(CLICK_CD_MELEE * 0.5) //nom nom nom
		else
			if(!isbrain(M))		//If you're feeding it to someone else.
				M.visible_message("<span class='danger'>[user] attempts to feed [M] [src].</span>", "<span class='userdanger'>[user] attempts to feed [M] [src].</span>")
				if(!do_mob(user, M))
					return
				add_logs(user, M, "fed", reagents.log_list())
				M.visible_message("<span class='danger'>[user] forces [M] to eat [src].</span>", "span class='userdanger'>[user] forces [M] to eat [src].</span>")

			else
				to_chat(user, "<span class='warning'>[M] doesn't seem to have a mouth!</span>")
				return

		if(reagents)								//Handle ingestion of the reagent.
			playsound(M.loc,'sound/items/eatfood.ogg', rand(10,50), 1)
			reagents.trans_to(M, reagents.total_volume)
			On_Consume(M)
			return 1

	return 0

/obj/item/reagent_containers/wasteland_fauna/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/storage))
		..() // -> item/attackby()
		return 0
	else
		..()

/obj/item/reagent_containers/wasteland_fauna/radscorpion_gland
	name = "Radscorpion poison gland"
	desc = "A sac full of poisonous liquid extracted from a radscorpion's tail."
	icon_state = "radroach_poison_sac"
	list_reagents = list("toxin" = 15)
