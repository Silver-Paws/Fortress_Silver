/obj/item/clothing/cloak/shadow
	name = "плащ авангарда"
	desc = "Ночной плащ, который носят те, кто защищает граждан от того, что таится за его пределами."
	icon = 'icons/roguetown/clothing/newclothes/objshadowcloak.dmi'
	icon_state = "shadowcloak"
	item_state = "shadowcloak"
	mob_overlay_icon = 'icons/roguetown/clothing/newclothes/onmob/shadowcloak.dmi'
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
	sleeved = 'icons/roguetown/clothing/newclothes/onmob/shadowcloak.dmi'
	nodismemsleeves = TRUE
	inhand_mod = TRUE
	toggle_icon_state = FALSE
	silk_salvage = TRUE
	salvage_result = /obj/item/natural/silk

/obj/item/clothing/cloak/shadow/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 3
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 1

/obj/item/clothing/cloak/shadow/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))
