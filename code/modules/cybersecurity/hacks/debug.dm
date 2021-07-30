/datum/cybernetic_hack/debug_identify
	name = "debugify"
	desc = "lets you tell what the fuck you are looking at"

/datum/cybernetic_hack/debug_identify/take_effect(atom/target, mob/user)
	to_chat(user,"<span class='notice'>this is [target]</span>")
