/datum/mob_descriptor/stature
	abstract_type = /datum/mob_descriptor/stature
	slot = MOB_DESCRIPTOR_SLOT_STATURE

/datum/mob_descriptor/stature/man
	name = "Мужчина/Женщина"

/datum/mob_descriptor/stature/man/get_description(mob/living/described)
	if(described.gender == MALE)
		return "%MAN%"
	else
		return "%MAN%"

/datum/mob_descriptor/stature/gentleman
	name = "Господин/Госпожа"

/datum/mob_descriptor/stature/gentleman/get_description(mob/living/described)
	if(described.gender == MALE)
		return "господин"
	else
		return "госпожа"

/datum/mob_descriptor/stature/thug
	name = "Головорез"

/datum/mob_descriptor/stature/snob
	name = "Сноб"

/datum/mob_descriptor/stature/slob
	name = "Тупица"

/datum/mob_descriptor/stature/brute
	name = "Изверг"

/datum/mob_descriptor/stature/highbrow
	name = "Интеллектуал"

/datum/mob_descriptor/stature/stooge
	name = "Посмешище"

/datum/mob_descriptor/stature/fool
	name = "Дурак/Дура"

/datum/mob_descriptor/stature/fool/get_description(mob/living/described)
	if(described.gender == MALE)
		return "дурак"
	else
		return "дура"

/datum/mob_descriptor/stature/bookworm
	name = "Книголюб"

/datum/mob_descriptor/stature/lowlife
	name = "Ничтожество"

/datum/mob_descriptor/stature/dignitary
	name = "Чиновник"
