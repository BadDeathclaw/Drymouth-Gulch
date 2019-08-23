/datum/component/storage/concrete/secret_satchel/can_be_inserted(I, stop_messages, user)
	if(SSpersistence.spawned_objects[I])
		to_chat(user, "<span class='warning'>[I] is unstable after its journey through space and time, it wouldn't survive another trip.</span>")
		return FALSE
	return ..()

/datum/component/storage/concrete/trash_stack/can_be_inserted(I, stop_messages, user)
	return FALSE

/datum/component/storage/concrete/trash_stack/remove_from_storage(atom/movable/AM, atom/new_location)
	. = ..()
	var/obj/item/storage/trash_stack = parent
	if(!trash_stack.contents.len)
		qdel(parent)
