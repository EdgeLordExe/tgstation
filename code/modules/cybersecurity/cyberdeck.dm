
//This is not a component for easier integration with TGUI as some stuff would be really scuffed, for example, displaying all hacks in a TGUI window would be hard as i can only send bitfields through signal returns.
/datum/cyberdeck
	var/list/datum/cybernetic_hack/hacks = list()
	var/max_amt = -1
	var/mob/living/carbon/owner

/datum/cyberdeck/proc/add_owner(new_owner)
	owner = new_owner
	for(var/datum/cybernetic_hack/hack in hacks)
		hack.on_add(owner)

/datum/cyberdeck/proc/remove_owner()
	for(var/datum/cybernetic_hack/hack in hacks)
		hack.on_add(owner)
	owner = null

/datum/cyberdeck/proc/change_owner(new_owner)
	remove_owner()
	add_owner(owner)

/datum/cyberdeck/proc/insert_hack(datum/cybernetic_hack/hack)
	if(hacks.len >= max_amt)
		return FALSE
	hacks += hack
	if(owner)
		hack.on_add(owner)
	return TRUE

/datum/cyberdeck/proc/remove_hack(datum/cybernetic_hack/hack)
	if(!(hacks in hacks))
		return FALSE
	hacks -= hack
	if(owner)
		hack.on_remove(owner)
	return TRUE

/datum/cyberdeck/proc/get_hack_by_type(type)
	for(var/datum/cybernetic_hack/H in hacks)
		if(H.type == type)
			return H
	return FALSE


