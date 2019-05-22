/mob/living/simple_animal/hostile/deathclaw/funclaw
	name = "Funclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. This one seems to have a strange look in its eyes.."

/mob/living/simple_animal/hostile/deathclaw/funclaw/AttackingTarget()
	var/mob/living/M = target

	if(M.health > 40)
		..()
		return

	if(get_dist(src, M) > 0)
		src.a_intent = INTENT_GRAB
		src.grab_state = GRAB_NECK

		src.start_pulling(M, 1)
		M.grabbedby(src)
		M.drop_all_held_items()
		M.stop_pulling()

	else if(get_dist(src, M) == 0)
		visible_message("<span class='danger'>READY FOR FUK</span>")
