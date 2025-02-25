/datum/special_trait/nothing
	name = "Ничего!"
	greet_text = span_notice("Вы получите <b>НИЧТО</b>! Вы <b>ПРОИГРАЛИ</b>! До свидания, сэр!")
	weight = 10


// Positive Specials
/datum/special_trait/tough
	name = "Крепкий"
	greet_text = span_notice("Отец всегда говорил - лучшая защита это нападение... Ну, пока это не мама, вбивающая ему мозги скалкой, оно так и есть. Мама всегда отлично учила меня.")
	weight = 80

/datum/special_trait/tough/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_CRITICAL_RESISTANCE, "[type]")


/datum/special_trait/alert
	name = "Настороже"
	greet_text = span_notice("Эти-то дешёвые трюки? Все из них я повидал и даже больше. Никт-... Нет... <b>Ничто</b> меня не удивит.")
	weight = 100

/datum/special_trait/alert/on_apply(mob/living/carbon/human/character, silent)
	character.change_stat("perception", 2)
	ADD_TRAIT(character, TRAIT_BREADY, "[type]")


/datum/special_trait/aboriginal
	name = "Корни Аборигена"
	greet_text = span_notice("Мои далёкие предки боролись с бедами Энигмы задолго до колонизации острова, то что нет нужды есть или дышать – самый охраняемый секрет моей семьи. Кто-то смеет называть это чёрной магией. Я же предпочту \"Приручением земель\"..")
	restricted_jobs = list(INQUISITION_ROLES)
	weight = 80

/datum/special_trait/aboriginal/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_NOHUNGER, "[type]")
	ADD_TRAIT(character, TRAIT_NOBREATH, "[type]")
	ADD_TRAIT(character, TRAIT_NOSTINK, "[type]")


/datum/special_trait/desensitized
	name = "Обесчувствленный"
	greet_text = span_notice("Жизнь в дыре вроде этого заунывного острова может взаправду закостенеть характер, ага?")
	weight = 100

/datum/special_trait/desensitized/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_NOMOOD, "[type]")
	ADD_TRAIT(character, TRAIT_NOSTINK, "[type]")


/datum/special_trait/scrooge
	name = "Скряга"
	greet_text = span_notice("Маммоны правят Энигмой и <b>Я</b> тот счастливчик, который ведает <b>реальную</b> работу денег. Я всегда храню свои маммоны в безопаснейшем месте.")
	weight = 80

/datum/special_trait/scrooge/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_SEEPRICES, "[type]")
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
	character.mind.special_items["My mammon"] = /obj/item/storage/belt/rogue/pouch/coins/poor
	character.mind.special_items["More of my mammon"] = /obj/item/storage/belt/rogue/pouch/coins/mid
	character.mind.special_items["A pouch for my mammon"] = /obj/item/storage/belt/rogue/pouch


/datum/special_trait/assassin
	name = "Ассассин-Ученик"
	greet_text = span_notice("Я всегда держался в сторонке. Даже измалку, работа в обществе была не для меня. Судьба или удача - по итогу я оказался в рядах одной из многочисленной гильдий убийц, что наводняют этот прогнивший мир.")
	weight = 40

/datum/special_trait/assassin/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_LIGHT_STEP, "[type]")
	character.change_stat("strength", -1)
	character.change_stat("endurance", 2)
	character.change_stat("speed", 2)
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
	character.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)


/datum/special_trait/lightfooted
	name = "Проворный"
	greet_text = span_notice("Мой шаг всегда был лёгким. Красться без звука и промедления никогда не было мне вызовом.")
	weight = 60

/datum/special_trait/lightfooted/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_LIGHT_STEP, "[type]")
	character.change_stat("speed", 1)
	character.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)


/datum/special_trait/night_owl
	name = "Сова"
	greet_text = span_notice("Я всегда предпочитал Нок, а не её сестру.")
	weight = 100

/datum/special_trait/night_owl/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_NIGHT_OWL, "[type]")


/datum/special_trait/beautiful
	name = "Прекрасный"
	greet_text = span_notice("Моё лицо - произведение искусства.")
	weight = 100

/datum/special_trait/beautiful/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_BEAUTIFUL, "[type]")


/datum/special_trait/duelist
	name = "Амбициозный Мечник"
	greet_text = span_notice("Я путешествовал от страны к стране месяцами, переступив через бесчисленное множество трупов; испытывал и тиранов, и героев, сражал свиты телохранителей и банды нелюдей, и всё ещё жив. Может, достойный противник будет здесь, на Энигме?... Мо-о-ожет я и отдохнул бы чуть-чуть, впрочем...")
	weight = 10 

/datum/special_trait/duelist/on_apply(mob/living/carbon/human/character, silent)
	character.cmode_music = 'sound/music/combat_duelist.ogg'
	character.change_stat("speed", pick(0,1,1,1,1,2))
	character.change_stat("endurance", pick(0,1,1,2,3))
	character.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, pick(5,6,6), TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, pick(1,2,2,2,3), TRUE)
	switch(rand(1,100))
		if(1 to 24)
			character.mind.special_items["my sword"] = /obj/item/rogueweapon/sword
			to_chat(character, span_notice("Этот кусок металлолома... Кажется, я оставил его в дереве?..."))
		if(25 to 44)
			character.mind.special_items["my sword"] = /obj/item/rogueweapon/sword/rapier
			to_chat(character, span_notice("Где я забыл этот чёртов меч? Точно, лес..."))
		if(45 to 60)
			character.mind.special_items["my sword"] = /obj/item/rogueweapon/sword/long
			to_chat(character, span_notice("Мне нужно достать свой меч из того дерева."))
		if(61 to 74)
			character.mind.special_items["my sword"] = /obj/item/rogueweapon/sword/long/heirloom
			to_chat(character, span_notice("Зизо побери... Я в самом деле опозорю свой род, если потеряю его. Минуту... Точно! Дерево!"))
		if(75 to 85)
			character.mind.special_items["my sword"] = /obj/item/rogueweapon/greatsword/zwei
			to_chat(character, span_notice("Ну не может быть что я потерял ХЕРОВ ц	вайхендер! Я должен проверить то дерево, на котором спал."))
		if(86 to 93)
			character.mind.special_items["my sword"] = /obj/item/rogueweapon/estoc
			to_chat(character, span_notice("Ну... Пробиваться сквозь латы может оказаться трудным без того эстока... Где же я его оставил..."))
		if(94 to 97)
			character.mind.special_items["my sword"] = /obj/item/rogueweapon/sword/long/vlord
			to_chat(character, span_notice("Хм-м-м... Я же прибил ту надоедливую нежить двумя неделями раньше, так?..."))
		if(98 to 100)
			character.mind.special_items["my sword"] = /obj/item/rogueweapon/sword/long/judgement
			to_chat(character, span_notice("В том самом дереве."))


/datum/special_trait/eagle_eyed
	name = "Орлиный Глаз"
	greet_text = span_notice("Хотел бы я видеть, как эти стрелки с их до противного громкими \"палками\" постреляют с болтом промеж глаз. Я то не промахиваюсь.")
	weight = 10

/datum/special_trait/eagle_eyed/on_apply(mob/living/carbon/human/character, silent)
	character.change_stat("perception", 2)
	character.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 5, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 4, TRUE)
	character.mind.special_items["Crossbow"] = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	character.mind.special_items["Bolts"] = /obj/item/ammo_holder/quiver/bolts


/datum/special_trait/seduction_artist
	name = "Маэстро Соблазнения"
	greet_text = span_notice("Я научился обводить слабовольных людей вокруг своего пальца, благодаря моему привлекательному телу! Ещё я выучил пару словечек из языка моего последнего любовника!")
	weight = 100

/datum/special_trait/seduction_artist/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_GOODLOVER, "[type]")
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 4, TRUE)
	switch(rand(1,6))
		if(1)
			character.grant_language(/datum/language/elvish)
		if(2)
			character.grant_language(/datum/language/hellspeak)
		if(3)
			character.grant_language(/datum/language/draconic)
		if(4)
			character.grant_language(/datum/language/dwarvish)
		if(5)
			character.grant_language(/datum/language/orcish)
		if(6)
			character.grant_language(/datum/language/celestial)


/datum/special_trait/corn_fed
	name = "Вскормленный Кукурузой"
	greet_text = span_notice("В моём рационе было много кукурузы.")
	weight = 100

/datum/special_trait/corn_fed/on_apply(mob/living/carbon/human/character, silent)
	character.change_stat("constitution", 2)
	character.change_stat("intelligence", -2)


/datum/special_trait/bookworm
	name = "Книжный червь"
	greet_text = span_notice("Я обожаю книги и люблю скрасить досуг их регулярным чтением.")
	weight = 100

/datum/special_trait/bookworm/on_apply(mob/living/carbon/human/character, silent)
	character.change_stat("intelligence", 2)
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)


/datum/special_trait/arsonist
	name = "Поджигатель"
	greet_text = span_notice("Мне мило видеть горение и воспламенение вещей. У меня даже есть схрон огненных бомб!")
	weight = 100

/datum/special_trait/arsonist/on_apply(mob/living/carbon/human/character, silent)
	character.mind.special_items["A firebomb"] = /obj/item/bomb
	character.mind.special_items["Another firebomb"] = /obj/item/bomb


/datum/special_trait/pineapple
	name = "Стоп Слово: 'Ананас'"
	greet_text = span_notice("Я наслаждаюсь поркой, аж пока люди не заскулят и не будут извиваться телом, их боль - моё удовольствие. Надо бы забрать мою игрушку с того дерева...")
	weight = 10

/datum/special_trait/pineapple/on_apply(mob/living/carbon/human/character, silent)
	character.mind.special_items["Whip"] = /obj/item/rogueweapon/whip
	character.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 6, TRUE)


/datum/special_trait/psydons_rider
	name = "Псайдонов Пьянчужный Всадник"
	greet_text = span_notice("Я скачу! Никто не остановит меня, ибо есть то воля божественная самого Псайдона!")
	req_text = "Верить в Псайдона"
	allowed_patrons = list(/datum/patron/psydon)
	weight = 100

/datum/special_trait/psydons_rider/on_apply(mob/living/carbon/human/character, silent)
	character.drunkenness = 50
	for(var/i in 1 to 2)
		var/obj/item/bottle = new /obj/item/reagent_containers/glass/bottle/rogue/wine(get_turf(character))
		character.put_in_hands(bottle, forced = TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 4, TRUE)
	new /mob/living/simple_animal/hostile/retaliate/rogue/saiga/tame/saddled(get_turf(character))


/datum/special_trait/packed_lunch
	name = "Запасённый Перекус"
	greet_text = span_notice("Не люблю ходить голодным, так что я припас себе перекус!")
	weight = 100

/datum/special_trait/packed_lunch/on_apply(mob/living/carbon/human/character, silent)
	var/obj/item/bag = new /obj/item/storage/roguebag/lunch(get_turf(character))
	character.put_in_hands(bag, forced = TRUE)
	bag.update_icon()


/datum/special_trait/freerunner
	name = "Беглец"
	greet_text = span_notice("Я прыгал по крышам Рокхилла ещё когда был мелким засранцем, адреналин побега от всей герцогской свиты, лишь чешущей затылок в неспособности поймать меня, непередаваем. Думаю, некоторые из них все ещё точат зуб на меня.")
	req_text = "Возраст: Adult или Middle-Aged; не замковая роль."
	restricted_jobs = list(KING_QUEEN_ROLES, GARRISON_ROLES, MANOR_ROLES)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	weight = 10

/datum/special_trait/freerunner/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_ZJUMP, "[type]")
	ADD_TRAIT(character, TRAIT_LEAPER, "[type]")
	ADD_TRAIT(character, TRAIT_NOFALLDAMAGE1, "[type]")
	make_outlaw(character.real_name, TRUE)


/datum/special_trait/thief
	name = "Вор"
	greet_text = span_notice("Жизнь тут непроста, но свою я умудрился сделать легче, забирая у других.")
	weight = 100

/datum/special_trait/thief/on_apply(mob/living/carbon/human/character, silent)
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 5, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 4, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 4, TRUE)


/datum/special_trait/polyglot
	name = "Полиглот"
	greet_text = span_notice("Языки мне всегда давались легко, даже те что запретны для смертных.")
	weight = 100

/datum/special_trait/polyglot/on_apply(mob/living/carbon/human/character, silent)
	character.grant_language(/datum/language/dwarvish)
	character.grant_language(/datum/language/elvish)
	character.grant_language(/datum/language/hellspeak)
	character.grant_language(/datum/language/celestial)
	character.grant_language(/datum/language/orcish)
	character.grant_language(/datum/language/beast)
	character.grant_language(/datum/language/draconic)
	character.grant_language(/datum/language/faexin)


/datum/special_trait/tavernbrawler
	name = "Трактирный Буян"
	greet_text = span_notice("Я <b>НЕ</b> агрессивный пьяница! Кто к зизовой матери клевещет обо мне? Сейчас я как покажу им! ... А? Чего-чего?... Тебе тоже хочется?!")
	weight = 20 // Seems very strong, someone said they punched thru blacksteel plate as 14 STR acolyte expert unarmed with 5 punches? But since when do punches damage armor at all?

/datum/special_trait/tavernbrawler/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_CIVILIZEDBARBARIAN, "[type]") //Need to make trait improve hitting people with chairs, mugs, goblets. <real


/datum/special_trait/jack_of_all_trades
	name = "На Все Руки Мастер" // that 'master craftsman' couldn't ever even /hope/ to lick a Master's boots, leave!
	greet_text = span_notice("В молодости я решил, что попробую всего понемножку, и теперь я гибкий ремесленик, если можно себя так назвать.")
	weight = 80

/datum/special_trait/jack_of_all_trades/on_apply(mob/living/carbon/human/character)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 2, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 2, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 2, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 2, TRUE)


/datum/special_trait/true_jack_of_all_trades
	name = "И Швец, и Жнец, и на Дуде Игрец"
	greet_text = span_notice("В молодости я решил, что попробую всего понемножку, и теперь я гибкий реме-... Во-о-оу... Дежа-вю...")
	req_text = "Возраст: Middle-Aged или Old"
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	weight = 60

/datum/special_trait/true_jack_of_all_trades/on_apply(mob/living/carbon/human/character)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/labor/mining, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/labor/fishing, 3, TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/labor/lumberjacking, 3, TRUE)


/datum/special_trait/noble
	name = "Знатная Родословная"
	greet_text = span_notice("Я или родился знатным, или мне её даровали.")
	restricted_traits = list(TRAIT_NOBLE)
	weight = 100

/datum/special_trait/noble/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_NOBLE, "[type]")
	character.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)


/datum/special_trait/swift
	name = "Скороход"
	greet_text = span_notice("Я быстр как никто иной в этом мире и уклонюсь от чего угодно! Пока меня не сковывает громоздкая броня, разумеется.")
	weight = 40

/datum/special_trait/swift/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_DODGEEXPERT, "[type]")
	ADD_TRAIT(character, TRAIT_GOODRUNNER, "[type]")
	character.mind.adjust_skillrank(/datum/skill/misc/athletics, 6, TRUE)
	character.change_stat("speed", 3)


/datum/special_trait/gourmand
	name = "Гурман"
	greet_text = span_notice("Эти невежественные недотёпы даже и мечтать не могли бы соревноваться с моим утончённым вкусом. Еда - для приёма пищи и это то, чем я буду заниматься.")
	weight = 100

/datum/special_trait/gourmand/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_NASTY_EATER, "[type]")


/datum/special_trait/lucky
	name = "Счастливчик"
	greet_text = span_notice("Я ощущаю себя самым удачливым на свете! Беды меркнут, как я прохожу мимо них от дня к дню на рутинной основе!")
	weight = 10

/datum/special_trait/lucky/on_apply(mob/living/carbon/human/character, silent)
	character.STALUC = rand(15, 20)


/datum/special_trait/mule
	name = "Наркокурьер"
	greet_text = span_notice("Я выполнял поручения Сутенёра, недавно прибрал к рукам кое-какую интересную вещицу, и спрятал её. Может быть, пришла пора подумать о своём независимом бизнесе...")
	weight = 100

/datum/special_trait/mule/on_apply(mob/living/carbon/human/character, silent)
	character.mind.special_items["Drugs"] = /obj/item/storage/backpack/rogue/satchel/mule
	character.mind.special_items["PURITY Gem"] = /obj/item/gem_device/purity
	character.mind.special_items["Dagger"] = /obj/item/rogueweapon/huntingknife/idagger
	character.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)

/datum/special_trait/plate_trained
	name = "Умелый Латник"
	greet_text = span_notice("В прошлом у меня был друг-рыцарь, что научил меня комфортно двигаться даже в самых громоздких латах.")
	restricted_traits = list(TRAIT_HEAVYARMOR)
	weight = 20

/datum/special_trait/plate_trained/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_HEAVYARMOR, "[type]")


/datum/special_trait/maile_trained
	name = "Умелый Кольчужник"
	greet_text = span_notice("Знавал парня, он знал как носить кольчатую броню, ну и я попросил научить меня тоже.")
	restricted_traits = list(TRAIT_MEDIUMARMOR)
	weight = 40

/datum/special_trait/maile_trained/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_MEDIUMARMOR, "[type]")

/datum/special_trait/graggar_champion
	name = "Граггаров Славный Малый"
	greet_text = span_notice("Посвящённая Граггару жизнь научила меня слёгкостью прокусывать и плоть, и кости.")
	req_text = "Верить в Граггара"
	allowed_patrons = list(/datum/patron/inhumen/graggar)
	weight = 40

/datum/special_trait/graggar_champion/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_STRONGBITE, "[type]")


// Neutral Specials
/datum/special_trait/giant // Arguable if this is neutral anyway, think nobody dislikes getting it.
	name = "Гигант"
	greet_text = span_notice("Меня всегда называли гигантом. Я ценим за своё телосложение, но, этот мир маленьких существ заставил меня учиться быть осторожным.")
	req_text = "Не быть: кобольдом, феей, верминволком или дворфом" // 1984
	restricted_races = list(/datum/species/anthromorphsmall, /datum/species/dwarf/mountain, /datum/species/kobold, /datum/species/seelie)
	weight = 60

/datum/special_trait/giant/on_apply(mob/living/carbon/human/character)
	character.mob_size += 1
	character.change_stat("strength", 2)
	character.change_stat("constitution", 2)
	character.change_stat("speed", -2)
	character.transform = character.transform.Scale(1.25, 1.25)
	character.transform = character.transform.Translate(0, (0.25 * 16))
	character.update_transform()


/datum/special_trait/atheism
	name = "Атеист"
	greet_text = span_notice("Бог мёртв.")
	req_text = "Нецерковные роли"
	restricted_jobs = list(CHURCH_ROLES, INQUISITION_ROLES)
	weight = 100

/datum/special_trait/atheism/on_apply(mob/living/carbon/human/character, silent)
	character.set_patron(/datum/patron/godless)


/datum/special_trait/disfigured
	name = "Обезображенный"
	greet_text = span_notice("К лучшему или худшему, моё лицо давно расхреначено к зизовой матери, что и не узнать теперь.")
	weight = 80

/datum/special_trait/disfigured/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_DISFIGURED, "[type]")


//Negative Specials
/datum/special_trait/nimrod
	name = "Нимрод"
	greet_text = span_boldwarning("Я познавал всё хуже, чем сверстники... Да я даже шнурки не завяжу сам...")
	weight = 80

/datum/special_trait/nimrod/on_apply(mob/living/carbon/human/character, silent)
	character.change_stat("speed", -2)
	character.change_stat("intelligence", -4)


/datum/special_trait/heretic
	name = "Признанный Еретиком"
	greet_text = span_boldwarning("Меня отлучили от церкви, за дело или нет!")
	req_text = "Нецерковные роли"
	weight = 100
	restricted_jobs = list(CHURCH_ROLES, INQUISITION_ROLES)

/datum/special_trait/heretic/on_apply(mob/living/carbon/human/character, silent)
	GLOB.excommunicated_players += character.real_name
	character.add_stress(/datum/stressevent/psycurse)
	character.devotion?.excommunicate()


/datum/special_trait/hunted
	name = "Разыскиваемый"
	greet_text = span_boldwarning("Кто-то выставил за мою голову награду!")
	weight = 100

/datum/special_trait/hunted/on_apply(mob/living/carbon/human/character, silent)
	var/reason = ""
	var/employer = "unknown employer"
	var/employer_gender
	if(prob(65))
		employer_gender = MALE
	else
		employer_gender = FEMALE
	if(employer_gender == MALE)
		employer = pick(list("Барон", "Лорд", "Дворянин", "Наследник"))
	else
		employer = pick(list("Герцогиня", "Леди", "Дворянка", "Наследница"))
	employer = "[employer] [random_human_name(employer_gender, FALSE, FALSE)]"
	var/amount = rand(40,100)
	switch(rand(1,7))
		if(1)
			reason = "убийство"
		if(2)
			reason = "цареубийство"
		if(3)
			reason = "позор на дворянский род"
		if(4)
			reason = "предательство"
		if(5)
			reason = "поджог"
		if(6)
			reason = "ересь"
		if(7)
			reason = "ограбление дворянина"
	add_bounty(character.real_name, amount, FALSE, reason, employer)
	if(!silent)
		to_chat(character, span_notice("Делал я это или нет, я обвинён в том, что совершил [reason] and the [employer] put a bounty on my head!"))


/datum/special_trait/outlaw
	name = "Признанный Преступником"
	greet_text = span_boldwarning("По делу я был обвинён в преступлениях или ложно, меня объявили вне закона!")
	weight = 100

/datum/special_trait/outlaw/on_apply(mob/living/carbon/human/character, silent)
	make_outlaw(character.real_name, TRUE)


/datum/special_trait/unlucky
	name = "Неудачник"
	greet_text = span_boldwarning("С тех пор как уронил ту стеклянную вазу, я будто не в своей тарелке...")
	weight = 60

/datum/special_trait/unlucky/on_apply(mob/living/carbon/human/character, silent)
	character.STALUC -= rand(1, 10)


/datum/special_trait/jesterphobia
	name = "Шутофобия"
	greet_text = span_boldwarning("У меня сильный, неразумный страх от шутов!")
	weight = 80

/datum/special_trait/jesterphobia/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_JESTERPHOBIA, "[type]")


/datum/special_trait/wild_night
	name = "Дикая Ночка"
	greet_text = span_boldwarning("Не помню что делал прошлой ночью, и теперь я не пойми где!")
	weight = 100

/datum/special_trait/wild_night/on_apply(mob/living/carbon/human/character, silent)
	var/turf/location = get_spawn_turf_for_job("Refugee")
	character.forceMove(location)
	grant_lit_torch(character)


/datum/special_trait/atrophy
	name = "Атрофия"
	greet_text = span_boldwarning("Когда я только взрослел, я едва мог прокормиться, благодаря чему вырос слабым и хрупким...")
	weight = 80

/datum/special_trait/atrophy/on_apply(mob/living/carbon/human/character)
	character.change_stat("strength", -2)
	character.change_stat("constitution", -2)
	character.change_stat("endurance", -1)


/datum/special_trait/lazy
	name = "Ленивый"
	greet_text = span_boldwarning("Мне всегда было всё по барабану.")
	weight = 80

/datum/special_trait/lazy/on_apply(mob/living/carbon/human/character)
	character.change_stat("strength", -1)
	character.change_stat("constitution", -1)
	character.change_stat("endurance", -1)
	character.change_stat("speed", -1)
	character.change_stat("perception", -1)


/datum/special_trait/bad_week
	name = "Не с Той Ноги"
	greet_text = span_boldwarning("Меня этим дэцом всё просто бесит!")
	weight = 100

/datum/special_trait/bad_week/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_BAD_MOOD, "[type]")


/datum/special_trait/nude_sleeper
	name = "Нагой Соня"
	greet_text = span_boldwarning("Мне сложно уснуть, пока я не достигну <i>реального</i> комфорта...")
	weight = 100

/datum/special_trait/nude_sleeper/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_NUDE_SLEEPER, "[type]")


/datum/special_trait/annoying
	name = "Надоедливый"
	greet_text = span_boldwarning("Люди, кажется, меня просто не любит... Мне хочется плакать...")
	weight = 80

/datum/special_trait/annoying/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_COMICSANS, "[type]")
	ADD_TRAIT(character, TRAIT_BAD_MOOD, "[type]")


/datum/special_trait/missing_nose
	name = "Безносый"
	greet_text = span_boldwarning("Я потерял нос в бою. Из-за этого трудно дышать.")
	weight = 40

/datum/special_trait/missing_nose/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_MISSING_NOSE, "[type]")


/datum/special_trait/frail
	name = "Хрупкий"
	greet_text = span_boldwarning("Мои плоть и кости ощущаются чрезмерно хрупкими...")
	weight = 60

/datum/special_trait/frail/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_CRITICAL_WEAKNESS, "[type]")


/datum/special_trait/leper
	name = "Прокажённый"
	greet_text = span_boldwarning("Я отвратный прокажённый...")
	weight = 10

/datum/special_trait/leper/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_LEPROSY, "[type]")


// Job Specials
/datum/special_trait/my_precious
	name = "Моя Прелесть"
	greet_text = span_notice("Прелесть, такая блестящая... Такая ценная, я чую её силу. Она моя!")
	req_text = "Быть: beggar"
	allowed_jobs = list(/datum/job/roguetown/beggar)
	weight = 40

/datum/special_trait/my_precious/on_apply(mob/living/carbon/human/character, silent)
	character.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, rand(1,3), TRUE)
	character.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, rand(1,3), TRUE)
	ADD_TRAIT(character, TRAIT_STRONGBITE, "[type]") // It's literally Smeagol. This trait is supposed to be positive. Give the walking pinata some sort of way to protect that ring.
	QDEL_NULL(character.wear_pants)
	QDEL_NULL(character.wear_shirt)
	QDEL_NULL(character.wear_armor)
	QDEL_NULL(character.shoes)
	QDEL_NULL(character.head)
	var/obj/item/ring = new /obj/item/clothing/ring/dragon_ring(get_turf(character))
	ring.desc = "Имя [character.real_name] видно выгравированным на внутренней стороне кольца."
	character.put_in_hands(ring, forced = TRUE)


/datum/special_trait/illicit_merchant
	name = "Подпольный Торговец"
	greet_text = span_notice("Я по горло доволен работой мелкой сошки и начну вести свой собственный рынок. Я прибрал свои руки на скрытый ключ торговца и занимательное магическое устройство.")
	req_text = "Быть: Shophand"
	allowed_jobs = list(/datum/job/roguetown/shophand)
	weight = 100

/datum/special_trait/illicit_merchant/on_apply(mob/living/carbon/human/character, silent)
	character.mind.special_items["Merchant Key"] = /obj/item/key/merchant
	character.mind.special_items["GOLDFACE Gem"] = /obj/item/gem_device/goldface


/datum/special_trait/reps_redemption
	name = "Повторения для Искупления"
	greet_text = span_notice("Моё страдание теперь достояние.")
	req_text = "Церковные роли или роли Инквизиции"
	allowed_jobs = list(CHURCH_ROLES, INQUISITION_ROLES)
	weight = 60

/datum/special_trait/reps_redemption/on_apply(mob/living/carbon/human/character)
	character.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
	character.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	character.change_stat("strength", 2)
	character.change_stat("constitution", 2)
	character.change_stat("speed", -2)


/datum/special_trait/seed_feed
	name = "Семена и Корма"
	greet_text = span_notice("Я вооружён семенами и непоколебимой верой, что нужно обязательно делиться. Моя сумка надёжно спрятана до момента следующего достойного для посева момента.")
	req_text = "Быть: Druid, Soilson, Towner или Refugee."
	allowed_jobs = list(/datum/job/roguetown/farmer, /datum/job/roguetown/refugee, /datum/job/roguetown/towner, /datum/job/roguetown/druid)
	weight = 100

/datum/special_trait/seed_feed/on_apply(mob/living/carbon/human/character)
	character.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	character.mind.special_items["The Bag"] = /obj/item/storage/roguebag/seedfeed
	character.mind.special_items["The Sickle"] = /obj/item/rogueweapon/sickle


/datum/special_trait/runic_faith
	name = "Вера Рунами"
	greet_text = span_notice("Я храню при себе два рунных пистоля, всё время. Увы, одним днём я забыл их зарядить.")
	req_text = "Быть: Priest или Priestess"
	allowed_jobs = list(/datum/job/roguetown/priest)
	weight = 10

/datum/special_trait/runic_faith/on_apply(mob/living/carbon/human/character, silent)
	character.equip_to_slot_or_del(new /obj/item/gun/ballistic/revolver/grenadelauncher/runelock, SLOT_BELT_L)
	character.equip_to_slot_or_del(new /obj/item/gun/ballistic/revolver/grenadelauncher/runelock, SLOT_BELT_R)
	character.mind.adjust_skillrank(/datum/skill/combat/firearms, 4, TRUE)


/datum/special_trait/thinker
	name = "Мыслитель"
	greet_text = span_notice("Сила, выносливость, телосложение. Троица того, что воспитывает великого правителя великих королевств... Ну или о чём там мямлят эти нимроды! <b>Я колдую ОГНЕННЫЙ ШАР!!!</b>")
	req_text = "Быть Герцогом или Герцогиней; славить и верить в Нок"
	allowed_sexes = list(MALE)
	allowed_patrons = list(/datum/patron/divine/noc)
	allowed_jobs = list(/datum/job/roguetown/ruler)
	restricted_traits = list(TRAIT_SPELLCOCKBLOCK)
	weight = 10

/datum/special_trait/thinker/on_apply(mob/living/carbon/human/character, silent)
	character.change_stat("strength", -3)
	character.change_stat("intelligence", 6)
	character.change_stat("constitution", -2)
	character.change_stat("endurance", -1)
	character.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 4, TRUE)
	character.mind.adjust_spellpoints(6)
	character.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/learnspell)
	new /obj/item/scrying(get_turf(character))


/datum/special_trait/warhorse
	name = "Ветеран Войны"
	greet_text = span_notice("Считаешь себя <b>реальным солдатом</b>? Пацан, не смеши меня! Проходи ты то дерьмо что <b>я</b> видел, ты бы в портки срал каждый раз перед сном! Чего-чего? 'Выгоревший старый пердун'? Как насчёт ответить за слова и выяснить, так ли это, засранец?!")
	req_text = "Be a Veteran"
	allowed_jobs = list(/datum/job/roguetown/veteran)
	weight = 10

/datum/special_trait/warhorse/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_DECEIVING_MEEKNESS, "[type]")
	ADD_TRAIT(character, TRAIT_NOSLEEP, "[type]")
	character.change_stat("strength", 4)
	character.change_stat("speed", 3)


/datum/special_trait/bailiff
	name = "Пристав"
	greet_text = span_notice("Порядок в суде! Порядок в суде! Пристав?! Врежь ему промеж ног!")
	req_text = "Быть: Marshal"
	allowed_jobs = list(/datum/job/roguetown/marshal)
	weight = 40

/datum/special_trait/bailiff/on_apply(mob/living/carbon/human/character, silent)
	ADD_TRAIT(character, TRAIT_NUTCRACKER, "[type]")
