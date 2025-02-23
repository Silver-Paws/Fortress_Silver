/datum/preferences/proc/validate_body_markings()
	//validating body markings
	for(var/zone in body_markings)
		for(var/name in body_markings[zone])
			if(!(name in GLOB.body_markings_per_limb[zone]))
				body_markings[zone] -= name

/datum/preferences/proc/handle_body_markings_topic(mob/user, href_list)
	switch(href_list["preference"])
		if("use_preset")
			var/action = alert(usr, "Точно ли хотите использовать пресет (Это сотрёт все имеющиеся маркинги)?", "Пресеты татуировок", "Yes", "No")
			if(action && action == "Yes")
				var/list/candidates = marking_sets_for_species(pref_species)
				if(length(candidates) == 0)
					return
				var/desired_set = input(user, "Выберите новый пресет для тела:", "Настройка пресета") as null|anything in candidates
				if(desired_set)
					var/datum/body_marking_set/BMS = GLOB.body_marking_sets[desired_set]
					body_markings = assemble_body_markings_from_set(BMS, features, pref_species)
		if("reset_color")
			var/zone = href_list["key"]
			var/name = href_list["name"]
			if(!body_markings[zone] || !body_markings[zone][name])
				return
			var/datum/body_marking/BM = GLOB.body_markings[name]
			body_markings[zone][name] = BM.get_default_color(features, pref_species)
		if("change_color")
			var/zone = href_list["key"]
			var/name = href_list["name"]
			if(!body_markings[zone] || !body_markings[zone][name])
				return
			var/color = body_markings[zone][name]
			var/new_color = color_pick_sanitized_lumi(user, "Выберите цвет татуировок/меток:", "Настройка цвета","#[color]")
			if(new_color)
				if(!body_markings[zone] || !body_markings[zone][name])
					return
				body_markings[zone][name] = sanitize_hexcolor(new_color, 6)
		if("marking_move_up")
			var/zone = href_list["key"]
			var/name = href_list["name"]
			var/list/marking_list = LAZYACCESS(body_markings, zone)
			var/current_index = LAZYFIND(marking_list, name)
			if(!current_index || --current_index < 1)
				return
			var/marking_content = marking_list[name]
			marking_list -= name
			marking_list.Insert(current_index, name)
			marking_list[name] = marking_content
		if("marking_move_down")
			var/zone = href_list["key"]
			var/name = href_list["name"]
			var/list/marking_list = LAZYACCESS(body_markings, zone)
			var/current_index = LAZYFIND(marking_list, name)
			if(!current_index || ++current_index > length(marking_list))
				return
			var/marking_content = marking_list[name]
			marking_list -= name
			marking_list.Insert(current_index, name)
			marking_list[name] = marking_content
		if("add_marking")
			var/zone = href_list["key"]
			if(!GLOB.body_markings_per_limb[zone])
				return
			var/list/possible_candidates = marking_list_of_zone_for_species(zone, pref_species)
			if(body_markings[zone])
				//To prevent exploiting hrefs to bypass the marking limit
				if(body_markings[zone].len >= MAXIMUM_MARKINGS_PER_LIMB)
					return
				//Remove already used markings from the candidates
				for(var/keyed_name in body_markings[zone])
					possible_candidates -= keyed_name
			if(possible_candidates.len == 0)
				return
			var/desired_marking = input(user, "Выберите метку/татуировку:", "Выбор маркинга") as null|anything in possible_candidates
			if(desired_marking)
				var/datum/body_marking/BD = GLOB.body_markings[desired_marking]
				if(!body_markings[zone])
					body_markings[zone] = list()
				body_markings[zone][BD.name] = BD.get_default_color(features, pref_species)
		if("remove_marking")
			var/zone = href_list["key"]
			var/name = href_list["name"]
			if(!body_markings[zone] || !body_markings[zone][name])
				return
			body_markings[zone] -= name
			if(body_markings[zone].len == 0)
				body_markings -= zone
		if("change_marking")
			var/zone = href_list["key"]
			var/changing_name = href_list["name"]
			var/list/possible_candidates = marking_list_of_zone_for_species(zone, pref_species)
			if(body_markings[zone])
				//Remove already used markings from the candidates
				for(var/keyed_name in body_markings[zone])
					possible_candidates -= keyed_name
			if(possible_candidates.len == 0)
				return
			var/desired_marking = input(user, "Choose a marking to change the current one to:", "Character Preference") as null|anything in possible_candidates
			if(desired_marking)
				if(!body_markings[zone] || !body_markings[zone][changing_name])
					return
				var/held_index = LAZYFIND(body_markings[zone], changing_name)
				var/datum/body_marking/BD = GLOB.body_markings[desired_marking]
				var/marking_content
				marking_content = BD.get_default_color(features, pref_species)
				body_markings[zone] -= changing_name
				body_markings[zone].Insert(held_index, desired_marking)
				body_markings[zone][desired_marking] = marking_content
		if("reset_all_colors")
			reset_body_marking_colors()

/datum/preferences/proc/print_body_markings_page()
	var/list/dat = list()
	dat += "Использовать <b>пресет</b>: <a href='?_src_=prefs;preference=use_preset;task=change_marking'>Выбрать</a>  | <a href='?_src_=prefs;preference=reset_all_colors;task=change_marking'>Сбросить цвета меток/татуировок</a>"
	/*
	dat += "<table width='100%' align='center'>"
	dat += " Mutant color #1:<span style='border: 1px solid #161616; background-color: #[features["mcolor"]];'>&nbsp;&nbsp;&nbsp;</span> <a href='?_src_=prefs;preference=mutant_color;task=input'>Change</a>"
	dat += " Mutant color #2:<span style='border: 1px solid #161616; background-color: #[features["mcolor2"]];'>&nbsp;&nbsp;&nbsp;</span> <a href='?_src_=prefs;preference=mutant_color2;task=input'>Change</a>"
	dat += " Mutant color #3:<span style='border: 1px solid #161616; background-color: #[features["mcolor3"]];'>&nbsp;&nbsp;&nbsp;</span> <a href='?_src_=prefs;preference=mutant_color3;task=input'>Change</a>"
	dat += "</table>"
	*/
	dat += "<table width='100%'>"
	dat += "<td valign='top' width='50%'>"
	var/iterated_markings = 0
	for(var/zone in GLOB.marking_zones)
		var/named_zone = " "
		switch(zone)
			if(BODY_ZONE_R_ARM)
				named_zone = "Правая рука"
			if(BODY_ZONE_L_ARM)
				named_zone = "Левая рука"
			if(BODY_ZONE_HEAD)
				named_zone = "Голова"
			if(BODY_ZONE_CHEST)
				named_zone = "Туловище"
			if(BODY_ZONE_R_LEG)
				named_zone = "Правая нога"
			if(BODY_ZONE_L_LEG)
				named_zone = "Левая нога"
			if(BODY_ZONE_PRECISE_R_HAND)
				named_zone = "Правая кисть"
			if(BODY_ZONE_PRECISE_L_HAND)
				named_zone = "Левая кисть"
		dat += "<center><h3>[named_zone]</h3></center>"
		dat += "<table align='center'; width='100%'; height='100px'; style='background-color:#1c1313'>"
		dat += "<tr style='vertical-align:top'>"
		dat += "<td width=10%><font size=2> </font></td>"
		dat += "<td width=10%><font size=2> </font></td>"
		dat += "<td width=40%><font size=2> </font></td>"
		dat += "<td width=25%><font size=2> </font></td>"
		dat += "<td width=15%><font size=2> </font></td>"
		dat += "</tr>"

		if(body_markings[zone])
			for(var/key in body_markings[zone])
				var/can_move_up = " "
				var/can_move_down = " "
				var/color_line = " "
				var/current_index = LAZYFIND(body_markings[zone], key)
				var/color = body_markings[zone][key]
				color_line = "<a href='?_src_=prefs;name=[key];key=[zone];preference=reset_color;task=change_marking'>R</a>"
				color_line += "<a href='?_src_=prefs;name=[key];key=[zone];preference=change_color;task=change_marking'><span class='color_holder_box' style='background-color:["#[color]"]'></span></a>"
				if(current_index < length(body_markings[zone]))
					can_move_down = "<a href='?_src_=prefs;name=[key];key=[zone];preference=marking_move_down;task=change_marking'>Ниже</a>"
				if(current_index > 1)
					can_move_up = "<a href='?_src_=prefs;name=[key];key=[zone];preference=marking_move_up;task=change_marking'>Выше</a>"
				dat += "<tr style='vertical-align:top;'>"
				dat += "<td>[can_move_up]</td>"
				dat += "<td>[can_move_down]</td>"
				dat += "<td><a href='?_src_=prefs;name=[key];key=[zone];preference=change_marking;task=change_marking'>[key]</a></td>"
				dat += "<td>[color_line]</td>"
				dat += "<td><a href='?_src_=prefs;name=[key];key=[zone];preference=remove_marking;task=change_marking'>Удалить</a></td>"
				dat += "</tr>"

		if(!(body_markings[zone]) || body_markings[zone].len < MAXIMUM_MARKINGS_PER_LIMB)
			dat += "<tr style='vertical-align:top;'>"
			dat += "<td> </td>"
			dat += "<td> </td>"
			dat += "<td> </td>"
			dat += "<td> </td>"
			dat += "<td><a href='?_src_=prefs;key=[zone];preference=add_marking;task=change_marking'>Добавить</a></td>"
			dat += "</tr>"

		dat += "</table>"

		iterated_markings += 1
		if(iterated_markings >= 4)
			dat += "</td><td valign='top' width='50%'>"
			iterated_markings = 0

	dat += "</td></tr></table>"
	return dat

/datum/preferences/proc/ShowMarkings(mob/user)
	var/list/dat = list()
	dat += "<style>span.color_holder_box{display: inline-block; width: 20px; height: 8px; border:1px solid #000; padding: 0px;}</style>"
	dat += print_body_markings_page()
	var/datum/browser/popup = new(user, "markings_cusotmization", "<div align='center'>Настройки маркингов: меток, окраса и татуировок</div>", 650, 710)
	popup.set_content(dat.Join())
	popup.open(FALSE)

/datum/preferences/proc/reset_body_marking_colors()
	for(var/zone in body_markings)
		var/list/bml = body_markings[zone]
		for(var/key in bml)
			var/datum/body_marking/BM = GLOB.body_markings[key]
			bml[key] = BM.get_default_color(features, pref_species)
