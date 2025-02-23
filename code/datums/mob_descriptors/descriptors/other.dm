/datum/mob_descriptor/defiant
	name = "Сопротивляться?	"
	slot = MOB_DESCRIPTOR_SLOT_NOTHING
	verbage = "даст отпор"
	describe = "в случае посягательства на %HIM%!"
	show_obscured = TRUE

/datum/mob_descriptor/defiant/can_describe(mob/living/described)
	if(!described.defiant)
		return FALSE
	return TRUE

/datum/mob_descriptor/defiant/can_user_see(mob/living/described, mob/user)
	// Always see if you yourself are
	if(user == described)
		return TRUE
	// Ghosts can see
	if(!isliving(user))
		return TRUE
	//var/mob/living/living_user = user
	// Other defiants can not see - Commented out for now so people don't ZAPE
	/*if(living_user.defiant)
		return FALSE
	// Further than 2 tiles dont see it - Commented out for now to always know who you can't ZAPE
	if(get_dist(described, living_user) > 2)
		return FALSE*/
	return TRUE

/datum/mob_descriptor/age
	name = "Возраст"
	slot = MOB_DESCRIPTOR_SLOT_AGE
	verbage = "выглядит"

/datum/mob_descriptor/age/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	return TRUE

/datum/mob_descriptor/age/get_description(mob/living/described)
	var/mob/living/carbon/human/human = described
	if(human.age == AGE_OLD)
		if(described.gender == MALE)
			return "старым"
		else
			return "старой"
	else if (human.age == AGE_MIDDLEAGED)
		if(described.gender == MALE)
			return "зрелым"
		else
			return "зрелой"
	else
		if(described.gender == MALE)
			return "молодо"
		else
			return "молодая"

	if(described.gender == MALE)
		return "%MAN%"
	else
		return "%MAN%"

/datum/mob_descriptor/penis
	name = "член"
	slot = MOB_DESCRIPTOR_SLOT_PENIS
	verbage = "в наличии"
	show_obscured = TRUE

/datum/mob_descriptor/penis/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	var/mob/living/carbon/human/human = described
	var/obj/item/organ/penis/penis = human.getorganslot(ORGAN_SLOT_PENIS)
	if(!penis)
		return FALSE
	if(!get_location_accessible(human, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	return TRUE

/datum/mob_descriptor/penis/get_description(mob/living/described)
	var/mob/living/carbon/human/human = described
	var/obj/item/organ/penis/penis = human.getorganslot(ORGAN_SLOT_PENIS)
	var/adjective
	switch(penis.penis_size)
		if(1)
			adjective = "маленький"
		if(2)
			adjective = "средний"
		if(3)
			adjective = "большой"
	var/used_name
	if(penis.erect_state != ERECT_STATE_HARD && penis.sheath_type != SHEATH_TYPE_NONE)
		switch(penis.sheath_type)
			if(SHEATH_TYPE_NORMAL)
				if(penis.penis_size == 3)
					used_name = "объёмные ножны"
				if(penis.penis_size == 1)
					used_name = "небольшие ножны"
				else
					used_name = "ножны"
			if(SHEATH_TYPE_SLIT)
				used_name = "щель"
	else
		used_name = "[adjective] [penis.name]"
	return "[used_name]"

/datum/mob_descriptor/testicles
	name = "яйца"
	slot = MOB_DESCRIPTOR_SLOT_TESTICLES
	verbage = "видны"
	show_obscured = TRUE

/datum/mob_descriptor/testicles/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	var/mob/living/carbon/human/human = described
	var/obj/item/organ/testicles/testes = human.getorganslot(ORGAN_SLOT_TESTICLES)
	if(!testes)
		return FALSE
	if(!get_location_accessible(human, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!testes.visible_organ)
		return FALSE
	return TRUE

/datum/mob_descriptor/testicles/get_description(mob/living/described)
	var/mob/living/carbon/human/human = described
	var/obj/item/organ/testicles/testes = human.getorganslot(ORGAN_SLOT_TESTICLES)
	var/adjective
	switch(testes.ball_size)
		if(1)
			adjective = "крохотные"
		if(2)
			adjective = "нормальные"
		if(3)
			adjective = "здоровые"
	return "[adjective] семенники"

/datum/mob_descriptor/vagina
	name = "вагина"
	slot = MOB_DESCRIPTOR_SLOT_VAGINA
	verbage = ""
	show_obscured = TRUE

/datum/mob_descriptor/vagina/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	var/mob/living/carbon/human/human = described
	var/obj/item/organ/vagina/vagina = human.getorganslot(ORGAN_SLOT_VAGINA)
	if(!vagina)
		return FALSE
	if(!get_location_accessible(human, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	return TRUE

/datum/mob_descriptor/vagina/get_description(mob/living/described)
	return "вагина"

/datum/mob_descriptor/breasts
	name = "груди"
	slot = MOB_DESCRIPTOR_SLOT_BREASTS
	verbage = ""
	show_obscured = TRUE

/datum/mob_descriptor/breasts/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	var/mob/living/carbon/human/human = described
	var/obj/item/organ/breasts/breasts = human.getorganslot(ORGAN_SLOT_BREASTS)
	if(!breasts)
		return FALSE
	if(!get_location_accessible(human, BODY_ZONE_CHEST))
		return FALSE
	return TRUE

/datum/mob_descriptor/breasts/get_description(mob/living/described)
	var/mob/living/carbon/human/human = described
	var/obj/item/organ/breasts/breasts = human.getorganslot(ORGAN_SLOT_BREASTS)
	var/adjective
	switch(breasts.breast_size)
		if(0)
			adjective = "Плоские"
		if(1)
			adjective = "Небольшие"
		if(2)
			adjective = "Маленькие"
		if(3)
			adjective = "Средние"
		if(4)
			adjective = "Большие"
		if(5)
			adjective = "Огромные"
	return "[adjective] груди"

/datum/mob_descriptor/sexual
	name = "Сексуальные пристрастия"
	slot = MOB_DESCRIPTOR_SLOT_NOTHING
	verbage = "предпочитает, судя по всему,"

/datum/mob_descriptor/sexual/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	return TRUE

/datum/mob_descriptor/sexual/get_description(mob/living/described)
	var/mob/living/carbon/human/human = described
	if(human.client.prefs.sexual_pref == SEXUAL_PREF_HETERO)
		return "противоположный пол"
	else if (human.client.prefs.sexual_pref == SEXUAL_PREF_SAME)
		return "%HIS% собственный пол"
	else
		return "и женщин, и мужчин"
