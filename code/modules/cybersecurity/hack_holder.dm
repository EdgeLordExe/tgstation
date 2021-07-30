/obj/item/hack_disk
	name = "Hacking Disk"
	desc = "Disk that contains daemons or hacks"

	var/datum/cybernetic_hack/held

/obj/item/hack_disk/Initialize()
	. = ..()
	update_name()

/obj/item/hack_disk/update_name(updates)
	. = ..()
	if(held)
		name = initial(name) + " ([held.name])"
