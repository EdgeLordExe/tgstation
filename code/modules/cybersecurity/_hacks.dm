/datum/cybernetic_hack
	var/name = "base cybernetic hack"
	var/desc = "sneeds feed and seed"
	var/cooldown = 0
	var/icon_state = ""
	var/datum/action/cooldown/pointed/hack/action

/datum/cybernetic_hack/New()
	. = ..()
	action = new()
	action.our_hack = src
	action.cooldown_time = cooldown
	action.button_icon_state = icon_state
	action.UpdateButtonIcon()

/datum/cybernetic_hack/proc/on_add(mob/owner)
	action.Grant(owner)

/datum/cybernetic_hack/proc/on_remove(mob/owner)
	action.Remove(owner)

/datum/cybernetic_hack/proc/can_take_effect(atom/target,mob/user)
	return TRUE

/datum/cybernetic_hack/proc/try_effect(atom/target,mob/user)
	if(!can_take_effect(target,user))
		return

	take_effect(target,user)
	return

/datum/cybernetic_hack/proc/take_effect(atom/target,mob/user)
	return

/datum/cybernetic_hack/periodic
	var/tick_rate = 0
	var/max_duration = 0
	var/current_duration = 0

	var/atom/target
	var/mob/user

/datum/cybernetic_hack/periodic/take_effect(atom/target,mob/user)
	src.target = target
	src.user = user
	START_PROCESSING(SSprocessing,src)

/datum/cybernetic_hack/periodic/proc/periodic_effect(atom/target,mob/user,delta_time)
	return

/datum/cybernetic_hack/periodic/process(delta_time)
	current_duration += delta_time
	if(current_duration % tick_rate == 0 && can_take_effect(target,user))
		periodic_effect(target,user,delta_time)
	if(current_duration >= max_duration)
		return PROCESS_KILL
