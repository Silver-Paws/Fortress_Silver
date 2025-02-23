/datum/mob_descriptor/prominent
	abstract_type = /datum/mob_descriptor/prominent
	slot = MOB_DESCRIPTOR_SLOT_PROMINENT

/datum/mob_descriptor/prominent/none
	name = "Не указано"

/datum/mob_descriptor/prominent/none/can_describe(mob/living/described)
	return FALSE

/datum/mob_descriptor/prominent/custom
	var/custom_index

/datum/mob_descriptor/prominent/custom/can_describe(mob/living/described)
	if(length(described.custom_descriptors) < custom_index)
		return FALSE
	return TRUE

/datum/mob_descriptor/prominent/custom/get_description(mob/living/described)
	var/datum/custom_descriptor_entry/entry = described.custom_descriptors[custom_index]
	return entry.content_text

/datum/mob_descriptor/prominent/custom/get_pre_string(mob/living/described)
	var/datum/custom_descriptor_entry/entry = described.custom_descriptors[custom_index]
	switch(entry.prefix_type)
		if(CUSTOM_PREFIX_HAS)
			return null
		if(CUSTOM_PREFIX_HAS_A)
			return ""
		if(CUSTOM_PREFIX_HAS_AN)
			return ""
		if(CUSTOM_PREFIX_IS)
			return null
		if(CUSTOM_PREFIX_LOOKS)
			return null

/datum/mob_descriptor/prominent/custom/get_verbage(mob/living/described)
	var/datum/custom_descriptor_entry/entry = described.custom_descriptors[custom_index]
	switch(entry.prefix_type)
		if(CUSTOM_PREFIX_HAS)
			return "%HAVE%"
		if(CUSTOM_PREFIX_HAS_A)
			return "%HAVE%"
		if(CUSTOM_PREFIX_HAS_AN)
			return "%HAVE%"
		if(CUSTOM_PREFIX_IS)
			return "является"
		if(CUSTOM_PREFIX_LOOKS)
			return "выглядит"

/datum/mob_descriptor/prominent/custom/one
	name = "Настраиваемая #1"
	custom_index = 1

/datum/mob_descriptor/prominent/custom/two
	name = "Настраиваемая #2"
	custom_index = 2

/datum/mob_descriptor/prominent/hunched_over
	name = "сгорбленный"
	verbage = ""

/datum/mob_descriptor/prominent/crooked_nose
	name = "кривоносый"
	verbage = "%HAVE%"
	prefix = ""

/datum/mob_descriptor/prominent/drooling
	name = "пускает слюни"
	verbage = ""

/datum/mob_descriptor/prominent/lazy_eye
	name = "затуманенный взор"
	verbage = "%HAVE%"
	prefix = ""

/datum/mob_descriptor/prominent/bloodshot_eye
	name = "налитый кровью глаз"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/baggy_eye
	name = "заспанные глаза"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/deadfish_eye
	name = "мертвецкий взгляд"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/twitchy
	name = "дёрганный"

/datum/mob_descriptor/prominent/clumsy
	name = "неуклюжий"

/datum/mob_descriptor/prominent/unkempt
	name = "неопрятный"

/datum/mob_descriptor/prominent/tidy
	name = "опрятный"

/datum/mob_descriptor/prominent/eloquent
	name = "выразительный"

/datum/mob_descriptor/prominent/thick_tail
	name = "толстый хвост"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/thick_tail/can_describe(mob/living/described)
	if(!ishuman(described))
		return TRUE
	var/mob/living/carbon/human/human = described
	if(!human.getorganslot(ORGAN_SLOT_TAIL))
		return FALSE
	return TRUE

/datum/mob_descriptor/prominent/cleft_lip
	name = "заячья губа"

/datum/mob_descriptor/prominent/physically_deformed
	name = "изуродованный"

/datum/mob_descriptor/prominent/extensive_scars
	name = "рубцованное тело"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/move_strange
	name = "странно двигается"

/datum/mob_descriptor/prominent/ghoulish_appearance
	name = "отвратный вид"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/prominent_chest
	name = "выдающаяся грудь"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/prominent_bottom
	name = "выдающийся зад"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/prominent_potbelly
	name = "заметное пузо"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/prominent_thighs
	name = "выдающиееся бёдра"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/prominent_shoulders
	name = "примечательные плечи"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/prominent_jawline
	name = "примечательный подбородок"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/cold_gaze
	name = "холодный взгляд"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/piercing_gaze
	name = "пронзительный взгляд"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/innocent_gaze
	name = "невинный взгляд"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/promiscuous_mannerisms
	name = "чувственные манеры"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/intimidating_presence
	name = "угрожающий вид"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/meek_presence
	name = "кротко выглядит"

/datum/mob_descriptor/prominent/adorable_presence
	name = "очаровательный вид"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/lordly_presence
	name = "властно выглядит"

/datum/mob_descriptor/prominent/doting_presence
	name = "любящий взгляд"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/aristocratic_haughtiness
	name = "высокомерие аристократа"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/ghastly_pale
	name = "призрачно-бледный вид"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/elaborate_tattoos
	name = "мудрёные татуировки"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/ritual_tattoos
	name = "ритуальные татуировки"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/tribal_tattoos
	name = "племенные татуировки"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/slave_tattoos
	name = "татуировки раба"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/enigmatic_tattoos
	name = "загадочные татуировки"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/mean_look
	name = "злой взгляд"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/haughty_atmosphere
	name = "надменный взгляд"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/untrustworthy
	name = "ненадёжное впечатление"
	verbage = "складывает"

/datum/mob_descriptor/prominent/ratty_hair
	name = "потрёпанные волосы"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/predatory_look
	name = "хищный взгляд"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/chaste_mannerism
	name = "строгие манеры"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/whimsy
	name = "причудливый"
	prefix = "внешне"

/datum/mob_descriptor/prominent/dim_look
	name = "тусклый взгляд"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/canine_features
	name = "собачьи черты"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/feline_features
	name = "кошачьи черты"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/hyaenidae_features
	name = "черты гиены"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/equine_features
	name = "черты лошади"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/bovine_features
	name = "коровьи черты"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/cervine_features
	name = "оленьи черты"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/lapine_features
	name = "кроличьи черты"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/rodent_features
	name = "крысиные черты"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/primate_features
	name = "обезьяньи черты"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/marsupial_features
	name = "черты сумчатого животного"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/lizard_features
	name = "черты ящерицы"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/avian_features
	name = "птичьи черты"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/amphibian_features
	name = "черты амфибии"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/insectoid_features
	name = "насекомовидные черты"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/marine_features
	name = "морские черты"
	verbage = "%HAVE%"

/datum/mob_descriptor/prominent/vulpine_features
	name = "лисьи черты"
	verbage = "%HAVE%"
