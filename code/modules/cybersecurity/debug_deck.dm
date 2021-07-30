/obj/item/handheld_deck
	name = "Handheld deck"
	icon = 'icon/obj/cyberhacks.dmi'
	icon_state = "debug"

	var/datum/cyberdeck/our_cyberdeck = new()

/obj/item/handheld_deck/Initialize()
	. = ..()
	LoadComponent(/datum/component/storage/concrete/cyberdeck)

/obj/item/handheld_deck/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(!.)
		return
	var/obj/item/hack_disk/disk = I
	our_cyberdeck.insert_hack(disk.held)
	RegisterSignal(disk,COMSIG_STORAGE_EXITED,.proc/on_exit)

/obj/item/handheld_deck/proc/on_exit(item/hack_disk/disk,datum/component/storage/concrete/master_storage)
	our_cyberdeck.remove_hack(disk.held)
	UnregisterSignal(disk,COMSIG_STORAGE_EXITED)
