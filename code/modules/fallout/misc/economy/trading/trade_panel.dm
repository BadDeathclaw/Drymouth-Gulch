/datum/trade_panel
	var/busy
	var/mob/owner
	var/mob/target

	var/list/our_items
	var/list/their_items

	var/list/giving_items
	var/list/taking_items

	New(mob/user)
		..()
		owner = user
		our_items = list()
		their_items = list()
		giving_items = list()
		taking_items = list()
		busy = FALSE

	proc
		update_contain_items() //Обновляет список предметов, которые имеет моб.
			if(!istype(owner))
				return
			our_items = owner.get_contents()