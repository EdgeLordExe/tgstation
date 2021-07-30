/datum/component/storage/concrete/cyberdeck
	max_items = 6

/datum/component/storage/concrete/cyberdeck/Initialize()
	. = ..()
	set_holdable(list(/obj/item/hack_disk))
