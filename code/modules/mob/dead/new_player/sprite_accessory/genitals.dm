/datum/sprite_accessory/penis
	icon = 'icons/mob/sprite_accessory/genitals/penis.dmi'
	color_keys = 2
	color_key_names = list("Член", "Кожа")
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/penis/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_BELT, OFFSET_BELT_F)

/datum/sprite_accessory/penis/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	var/obj/item/organ/penis/pp = organ
	if(pp.sheath_type != SHEATH_TYPE_NONE && pp.erect_state != ERECT_STATE_HARD)
		switch(pp.sheath_type)
			if(SHEATH_TYPE_NORMAL)
				if(pp.erect_state == ERECT_STATE_NONE)
					return "sheath_1"
				else
					return "sheath_2"
			if(SHEATH_TYPE_SLIT)
				if(pp.erect_state == ERECT_STATE_NONE)
					return "slit_1"
				else
					return "slit_2"
	if(pp.erect_state == ERECT_STATE_HARD)
		return "[icon_state]_2"
	else
		return "[icon_state]_1"

/datum/sprite_accessory/penis/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	return is_human_part_visible(owner, HIDEJUMPSUIT|HIDECROTCH)

/datum/sprite_accessory/penis/human
	icon_state = "human"
	name = "Обычный"
	color_key_defaults = list(KEY_CHEST_COLOR, KEY_CHEST_COLOR)

/datum/sprite_accessory/penis/knotted
	icon_state = "knotted"
	name = "Узловатый"
	color_key_defaults = list(null, KEY_CHEST_COLOR)
	default_colors = list("C52828", null)

/datum/sprite_accessory/penis/knotted2
	name = "Узловатый 2"
	icon_state = "knotted2"
	color_key_defaults = list(null, KEY_CHEST_COLOR)
	default_colors = list("C52828", null)

/datum/sprite_accessory/penis/flared
	icon_state = "flared"
	name = "Широкий"
	color_key_defaults = list(KEY_CHEST_COLOR, KEY_CHEST_COLOR)

/datum/sprite_accessory/penis/barbknot
	icon_state = "barbknot"
	name = "Шипованный, узловатый"
	color_key_defaults = list(null, KEY_CHEST_COLOR)
	default_colors = list("C52828", null)

/datum/sprite_accessory/penis/tapered
	icon_state = "tapered"
	name = "Сужающийся"
	default_colors = list("C52828", "C52828")

/datum/sprite_accessory/penis/tapered_mammal
	icon_state = "tapered (Ножны)"
	name = "Сужающийся"
	color_key_defaults = list(null, KEY_CHEST_COLOR)
	default_colors = list("C52828", null)

/datum/sprite_accessory/penis/tentacle
	icon_state = "tentacle"
	name = "Щупальце"
	default_colors = list("C52828", "C52828")

/datum/sprite_accessory/penis/hemi
	icon_state = "hemi"
	name = "Двойной"
	default_colors = list("C52828", "C52828")

/datum/sprite_accessory/penis/hemiknot
	icon_state = "hemiknot"
	name = "Двойной узловатый"
	default_colors = list("C52828", "C52828")

/datum/sprite_accessory/testicles
	icon = 'icons/mob/sprite_accessory/genitals/testicles.dmi'
	color_key_name = "Мошонка"
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/testicles/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_BELT, OFFSET_BELT_F)

/datum/sprite_accessory/testicles/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	var/obj/item/organ/testicles/testes = organ
	return "[icon_state]_[testes.ball_size]"

/datum/sprite_accessory/testicles/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	var/obj/item/organ/testicles/testes = organ
	if(!testes.visible_organ)
		return FALSE
	return is_human_part_visible(owner, HIDEJUMPSUIT|HIDECROTCH)

/datum/sprite_accessory/testicles/pair
	name = "Pair"
	icon_state = "pair"
	color_key_defaults = list(KEY_SKIN_COLOR)

/datum/sprite_accessory/breasts
	icon = 'icons/mob/sprite_accessory/genitals/breasts.dmi'
	color_key_name = "Груди"
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/breasts/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	var/obj/item/organ/breasts/badonkers = organ
	return "[icon_state]_[badonkers.breast_size]"

/datum/sprite_accessory/breasts/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_ID, OFFSET_ID_F)

/datum/sprite_accessory/breasts/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	return is_human_part_visible(owner, HIDEBOOB|HIDEJUMPSUIT)

/datum/sprite_accessory/breasts/pair
	icon_state = "pair"
	name = "Пара"
	color_key_defaults = list(KEY_CHEST_COLOR)

/datum/sprite_accessory/breasts/quad
	icon_state = "quad"
	name = "Две пары"
	color_key_defaults = list(KEY_CHEST_COLOR)

/datum/sprite_accessory/breasts/sextuple
	icon_state = "sextuple"
	name = "Три пары"
	color_key_defaults = list(KEY_CHEST_COLOR)

/datum/sprite_accessory/vagina
	icon = 'icons/mob/sprite_accessory/genitals/vagina.dmi'
	color_key_name = "Цвет"
	relevant_layers = list(BODY_FRONT_LAYER)

/datum/sprite_accessory/vagina/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_BELT, OFFSET_BELT_F)

/datum/sprite_accessory/vagina/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	return is_human_part_visible(owner, HIDECROTCH|HIDEJUMPSUIT)

/datum/sprite_accessory/vagina/human
	icon_state = "human"
	name = "Гладкая"
	default_colors = list("ea6767")

/datum/sprite_accessory/vagina/hairy
	icon_state = "hairy"
	name = "Покрытая волосами"
	color_key_defaults = list(KEY_HAIR_COLOR)

/datum/sprite_accessory/vagina/spade
	icon_state = "spade"
	name = "Развёрнутая"
	default_colors = list("C52828")

/datum/sprite_accessory/vagina/furred
	icon_state = "furred"
	name = "Покрытая шерстью"
	color_key_defaults = list(KEY_MUT_COLOR_ONE)

/datum/sprite_accessory/vagina/gaping
	icon_state = "gaping"
	name = "Зияющая"
	default_colors = list("f99696")

/datum/sprite_accessory/vagina/cloaca
	icon_state = "cloaca"
	name = "Клоака"
	default_colors = list("f99696")
