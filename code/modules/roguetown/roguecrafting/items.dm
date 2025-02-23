/datum/crafting_recipe/roguetown
	always_available = TRUE
	skillcraft = /datum/skill/craft/crafting
	//skill_level = 1

/datum/crafting_recipe/roguetown/tneedle
	name = "швейная игла из шипа - (1 шип, 1 волокно)"
	result = /obj/item/needle/thorn
	reqs = list(/obj/item/natural/thorn = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/whet
	name = "точильный камень - (2 камня; НОВИЧОК)"
	result = /obj/item/natural/whet
	reqs = list(/obj/item/natural/stone = 2)
	skill_level = 1

/datum/crafting_recipe/roguetown/cloth5x
	name = "ткани (х5) - (10 волокон)"
	result = list(
				/obj/item/natural/cloth,
				/obj/item/natural/cloth,
				/obj/item/natural/cloth,
				/obj/item/natural/cloth,
				/obj/item/natural/cloth,
				)
	reqs = list(/obj/item/natural/fibers = 10)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "сшиваю"
	verbage = "сшивает"
	skill_level = 0

/datum/crafting_recipe/roguetown/clothbelt
	name = "тканевый пояс - (1 ткань)"
	result = /obj/item/storage/belt/rogue/leather/cloth
	reqs = list(/obj/item/natural/cloth = 1)
	skill_level = 0
	verbage_simple = "завязываю"
	verbage = "завязывает"

/datum/crafting_recipe/roguetown/spoon
	name = "ложки из дерева (x3) - (1 полено)"
	result = list(/obj/item/kitchen/spoon,
				/obj/item/kitchen/spoon,
				/obj/item/kitchen/spoon)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/platter
	name = "блюдца из дерева (x3) - (1 полено)"
	result = list(/obj/item/cooking/platter,
				/obj/item/cooking/platter,
				/obj/item/cooking/platter)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/rollingpin
	name = "скалка - (1 полено)"
	result = /obj/item/kitchen/rollingpin
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/bellcollar
	name = "кожаный ошейник с бубенцами - (1 ошейник, 1 бубенчик)"
	result = /obj/item/clothing/neck/roguetown/collar/leather/bell
	reqs = list(/obj/item/clothing/neck/roguetown/collar/leather = 1, /obj/item/catbell = 1)
	skill_level = 0
	verbage_simple = "скрепляю"
	verbage = "скрепляет"

/datum/crafting_recipe/roguetown/bellcollar/cow
	name = "кожаный ошейник с колоколом - (1 ошейник, 1 колокол)"
	result = /obj/item/clothing/neck/roguetown/collar/leather/bell/cow
	reqs = list(/obj/item/clothing/neck/roguetown/collar/leather = 1, /obj/item/catbell/cow = 1)
	skill_level = 0
	verbage_simple = "скрепляю"
	verbage = "скрепляет"

/datum/crafting_recipe/roguetown/unclothbelt
	name = "развязать тканевый пояс"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/storage/belt/rogue/leather/cloth = 1)
	skill_level = 0
	verbage_simple = "развязываю"
	verbage = "развязывает"

/datum/crafting_recipe/roguetown/ropebelt
	name = "веревочный пояс - (1 веревка)"
	result = /obj/item/storage/belt/rogue/leather/rope
	reqs = list(/obj/item/rope = 1)
	skill_level = 0
	verbage_simple = "завязываю"
	verbage = "завязывает"

/datum/crafting_recipe/roguetown/unropebelt
	name = "развязать веревочный пояс"
	result = /obj/item/rope
	reqs = list(/obj/item/storage/belt/rogue/leather/rope = 1)
	skill_level = 0
	verbage_simple = "развязываю"
	verbage = "развязывает"

/datum/crafting_recipe/roguetown/rope
	name = "веревка - (3 волокна; НОВИЧОК)"
	result = /obj/item/rope
	reqs = list(/obj/item/natural/fibers = 3)
	verbage_simple = "сплетаю"
	verbage = "сплетает"

/datum/crafting_recipe/roguetown/bowstring
	name = "тетива - (2 волокна; НОВИЧОК)"
	result = /obj/item/natural/bowstring
	reqs = list(/obj/item/natural/fibers = 2)
	verbage_simple = "скручиваю"
	verbage = "скручивает"

/datum/crafting_recipe/roguetown/bowpartial
	name = "лук, ненатянутый - (1 полено; НОВИЧОК)"
	result = /obj/item/grown/log/tree/bowpartial
	reqs = list(/obj/item/grown/log/tree/small = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	verbage_simple = "вырезаю"
	verbage = "вырезает"

/datum/crafting_recipe/roguetown/bow
	name = "лук, натянутый тетивой - (1 основа, 1 тетива; УЧЕНИК)"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	reqs = list(/obj/item/natural/bowstring = 1, /obj/item/grown/log/tree/bowpartial = 1)
	skillcraft = /datum/skill/combat/bows
	verbage_simple = "натягиваю"
	verbage = "натягивает"
	skill_level = 2

/datum/crafting_recipe/roguetown/torch
	name = "факел - (1 палка, 1 волокно)"
	result = /obj/item/flashlight/flare/torch
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/candle
	name = "свечи (x3) - (2 жира; НОВИЧОК)"
	result = list(/obj/item/candle/yellow,
				/obj/item/candle/yellow,
				/obj/item/candle/yellow)
	reqs = list(/obj/item/reagent_containers/food/snacks/fat = 2)

/datum/crafting_recipe/roguetown/stoneaxe
	name = "каменный топор - (1 полено, 1 камень; НОВИЧОК)"
	result = /obj/item/rogueweapon/stoneaxe
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 1)


/datum/crafting_recipe/roguetown/stoneknife
	name = "каменный нож - (1 палка, 1 камень)"
	result = /obj/item/rogueweapon/huntingknife/stoneknife
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/stonespear
	name = "каменное копье - (1 посох, 1 камень; УЧЕНИК)"
	result = /obj/item/rogueweapon/spear/stone
	reqs = list(/obj/item/rogueweapon/woodstaff = 1,
				/obj/item/natural/stone = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/woodclub
	name = "дубина из дерева - (1 полено; НОВИЧОК)"
	result = /obj/item/rogueweapon/mace/woodclub/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/billhook
	name = "примитивный секач - (1 серп, 1 веревка, 1 полено; УЧЕНИК)"
	result = /obj/item/rogueweapon/spear/improvisedbillhook
	reqs = list(/obj/item/rogueweapon/sickle = 1,
				/obj/item/rope = 1,
				/obj/item/grown/log/tree/small = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/goedendag
	name = "годендаг - (1 полено, 1 веревка, 1 мотыга; УЧЕНИК)"
	result = /obj/item/rogueweapon/mace/goden
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/rope = 1,
				/obj/item/rogueweapon/hoe = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/peasantwarflail
	name = "крестьянский боевой цеп - (1 цепь, 1 молотилка; УЧЕНИК)"
	result = /obj/item/rogueweapon/thresher/wflail
	reqs = list(/obj/item/rope/chain = 1,
				/obj/item/rogueweapon/thresher = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/peasantwarflail_alt
	name = "крестьянский боевой цеп - (1 цепной поводок, 1 молотилка; УЧЕНИК)"
	result = /obj/item/rogueweapon/thresher/wflail
	reqs = list(/obj/item/leash/chain = 1,			// wish there werent 2 chains with diff item pathing ngl
				/obj/item/rogueweapon/thresher = 1)
	skill_level = 2

/obj/item/rogueweapon/mace/woodclub/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/woodstaff
	name = "посохи из дерева (х3) - (1 бревно; НОВИЧОК)"
	result = list(/obj/item/rogueweapon/woodstaff,
	/obj/item/rogueweapon/woodstaff,
	/obj/item/rogueweapon/woodstaff)
	reqs = list(/obj/item/grown/log/tree = 1)

/datum/crafting_recipe/roguetown/woodsword
	name = "мечи из дерева (х3) - (1 полено, 1 волокно; НОВИЧОК)"
	result = list(/obj/item/rogueweapon/mace/wsword,
				/obj/item/rogueweapon/mace/wsword,
				/obj/item/rogueweapon/mace/wsword)
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/woodbucket
	name = "ведро из дерева - (1 полено)"
	result = /obj/item/reagent_containers/glass/bucket/wooden
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/woodcup
	name = "кружки из дерева (x3) - (1 полено; НОВИЧОК)"
	result = list(/obj/item/reagent_containers/glass/cup/wooden/crafted,
				/obj/item/reagent_containers/glass/cup/wooden/crafted,
				/obj/item/reagent_containers/glass/cup/wooden/crafted)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/reagent_containers/glass/cup/wooden/crafted
	sellprice = 3

/datum/crafting_recipe/roguetown/woodtray
	name = "подносы из дерева (x2) - (1 полено; НОВИЧОК)"
	result = list(/obj/item/storage/tray,
				/obj/item/storage/tray)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/woodbowl
	name = "миски из дерева (x3) - (1 полено; НОВИЧОК)"
	result = list(/obj/item/reagent_containers/glass/bowl,
				/obj/item/reagent_containers/glass/bowl,
				/obj/item/reagent_containers/glass/bowl)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/pot
	name = "каменный котелок - (2 камня; НОВИЧОК)"
	result = /obj/item/reagent_containers/glass/bucket/pot/stone
	reqs = list(/obj/item/natural/stone = 2)

/datum/crafting_recipe/roguetown/stonearrow
	name = "каменная стрела - (1 палка, 1 камень; НОВИЧОК)"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/stone
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/stonearrow_five
	name = "каменные стрелы (x5) - (5 палок, 5 камней; НОВИЧОК)"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/stone,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone
				)
	reqs = list(/obj/item/grown/log/tree/stick = 5,
				/obj/item/natural/stone = 5)
	req_table = TRUE

/datum/crafting_recipe/roguetown/poisonarrow
	name = "отравленная стрела - (1 стрела, 1.7oz яда; НОВИЧОК)"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/poison
	reqs = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/iron = 1,
				/datum/reagent/berrypoison = 5
				)
	req_table = TRUE

/datum/crafting_recipe/roguetown/poisonarrow_stone
	name = "отравленная каменная стрела - (1 стрела, 1.7oz яда; НОВИЧОК)"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/stone/poison
	reqs = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/stone = 1,
				/datum/reagent/berrypoison = 5
				)
	req_table = TRUE

/*
/datum/crafting_recipe/roguetown/poisonbolt //Coded, but commented out pending balance discussion.
	name = "poisoned bolt"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/poison
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/datum/reagent/berrypoison = 5)

	req_table = TRUE
*/
/datum/crafting_recipe/roguetown/poisonarrow_five //Arrows and bolts can be smithed in batches of five. Makes sense for them to be dipped in batches of five, too
	name = "отравленные стрелы (x5) - (5 стрел, 8.3oz яда; НОВИЧОК)"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/poison
				)
	reqs = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/iron = 5,
				/datum/reagent/berrypoison = 25
				)

	req_table = TRUE
/*
/datum/crafting_recipe/roguetown/poisonbolt_five //Coded, but commented out pending balance discussion.
	name = "poisoned bolts (x5)"
	result = list(/obj/item/ammo_casing/caseless/rogue/bolt/poison = 5)
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 5,
				/datum/reagent/berrypoison = 25)

	req_table = TRUE
*/
/datum/crafting_recipe/roguetown/poisonarrow_five_stone
	name = "отравленные каменные стрелы (x5) - (5 стрел, 8.3oz яда; НОВИЧОК)"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison
				)
	reqs = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/stone = 5,
				/datum/reagent/berrypoison = 25
				)

	req_table = TRUE

/datum/crafting_recipe/roguetown/sackx5
	name = "мешки (х5) - (5 тканей, 5 волокон; НОВИЧОК)"
	result = list(
				/obj/item/storage/roguebag/crafted,
				/obj/item/storage/roguebag/crafted,
				/obj/item/storage/roguebag/crafted,
				/obj/item/storage/roguebag/crafted,
				/obj/item/storage/roguebag/crafted,
				)
	reqs = list(/obj/item/natural/fibers = 5,
				/obj/item/natural/cloth = 5)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	req_table = FALSE

/obj/item/storage/roguebag/crafted
	sellprice = 4


/datum/crafting_recipe/roguetown/bait
	name = "приманка - (1 мешок, 2 пшеницы; НОВИЧОК)"
	result = /obj/item/bait
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/grown/wheat = 2)
	req_table = TRUE
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/sbaita
	name = "сладкая приманка (яблоко) - (1 мешок, 2 яблока; НОВИЧОК)"
	result = /obj/item/bait/sweet
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/grown/apple = 2)
	req_table = TRUE
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/sbait
	name = "сладкая приманка (ягоды) - (1 мешок, 2 ягоды; НОВИЧОК)"
	result = /obj/item/bait/sweet
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 2)
	req_table = TRUE
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/bloodbait
	name = "мясная приманка - (1 мешок, 2 мяса; НОВИЧОК)"
	result = /obj/item/bait/bloody
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/rogue/meat = 2)
	req_table = TRUE
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/pipe
	name = "трубка для курения - (1 палка; НОВИЧОК)"
	result = /obj/item/clothing/mask/cigarette/pipe/crafted
	reqs = list(/obj/item/grown/log/tree/stick = 1)


/obj/item/clothing/mask/cigarette/pipe/crafted
	sellprice = 4

/datum/crafting_recipe/roguetown/rod
	name = "удочка - (1 полено, 2 волокна; НОВИЧОК)"
	result = /obj/item/fishingrod/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 2)


/obj/item/fishingrod/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/woodspade
	name = "лопатка - (1 полено, 1 полено; НОВИЧОК)"
	result = /obj/item/rogueweapon/shovel/small
	reqs = list(/obj/item/grown/log/tree/small = 1,
			/obj/item/grown/log/tree/stick = 1)
/obj/item/rogueweapon/shovel/small/crafted
	sellprice = 5

/datum/crafting_recipe/roguetown/book_crafting_kit
	name = "набор для создания книги - (2 кожи, 1 ткань; НОВИЧОК)"
	result = /obj/item/book_crafting_kit
	reqs = list(
			/obj/item/natural/hide = 2,
			/obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/woodcross
	name = "амулет из дерева - (2 волокна, 2 палки; НОВИЧОК)"
	result = /obj/item/clothing/neck/roguetown/psicross/wood
	reqs = list(/obj/item/natural/fibers = 2,
				/obj/item/grown/log/tree/stick = 2)

/datum/crafting_recipe/roguetown/mantrap
	name = "капканы (х2) - (1 полено, 2 волокна, 1 железо; НОВИЧОК)"
	result = list(/obj/item/restraints/legcuffs/beartrap,
				/obj/item/restraints/legcuffs/beartrap)
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 2,
				/obj/item/ingot/iron = 1)
	req_table = TRUE
	skill_level = 1
	verbage_simple = "put together"
	verbage = "puts together"

/datum/crafting_recipe/roguetown/paperscroll
	name = "свитки пергамента (x5) - (1 полено, 16.6oz воды; НОВИЧОК)"
	result = list(/obj/item/paper/scroll,
				  /obj/item/paper/scroll,
				  /obj/item/paper/scroll,
				  /obj/item/paper/scroll,
				  /obj/item/paper/scroll)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/datum/reagent/water = 50)
	tools = list(/obj/item/rogueweapon/huntingknife = 1)
	structurecraft = /obj/machinery/tanningrack
	skill_level = 1

/datum/crafting_recipe/roguetown/parchment
	name = "листы пергамента (x8) - (1 полено, 10oz воды; НОВИЧОК)"
	result = list(/obj/item/paper,
				  /obj/item/paper,
				  /obj/item/paper,
				  /obj/item/paper,
				  /obj/item/paper,
				  /obj/item/paper,
				  /obj/item/paper,
				  /obj/item/paper)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/datum/reagent/water = 30)
	tools = list(/obj/item/rogueweapon/huntingknife = 1)
	structurecraft = /obj/machinery/tanningrack
	skill_level = 1


/datum/crafting_recipe/roguetown/briarmask
	name = "маска друидов - (4 палки, 3 волокна; УЧЕНИК)"
	result = /obj/item/clothing/head/roguetown/dendormask
	reqs = list(/obj/item/grown/log/tree/stick = 4,
				/obj/item/natural/fibers = 3)
	skillcraft = /datum/skill/magic/druidic
	skill_level = 2 // druids & dendor clerics can craft

// Woodcutting recipe

/datum/crafting_recipe/roguetown/lumberjacking
	skillcraft = /datum/skill/labor/lumberjacking
	tools = list(/obj/item/rogueweapon/huntingknife = 1)

/datum/crafting_recipe/roguetown/lumberjacking/cart_upgrade
	name = "улучшить шестерню - (2 полена, 1 камень; УЧЕНИК)"
	result = /obj/item/roguegear/wood/basic
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/natural/stone = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sawedoff
	name = "укоротить аркебузу"
	result = /obj/item/gun/ballistic/firearm/handgonne
	reqs = list(/obj/item/gun/ballistic/firearm/arquebus = 1)
	skill_level = 0
	tools = list(/obj/item/rogueweapon/surgery/saw = 1)


// Blacksmithing Recipes

/datum/crafting_recipe/roguetown/gorget/oring
	name = "приковать кольцо к горжету (УЧЕНИК)"
	skillcraft = /datum/skill/craft/blacksmithing
	reqs = list(/obj/item/clothing/neck/roguetown/gorget = 1)
	result = /obj/item/clothing/neck/roguetown/gorget/oring
	skill_level = 2
	tools = list(/obj/item/rogueweapon/hammer = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/gorget/soring
	name = "приковать кольцо к стальному горжету (УЧЕНИК)"
	skillcraft = /datum/skill/craft/blacksmithing
	reqs = list(/obj/item/clothing/neck/roguetown/gorget/steel = 1)
	result = /obj/item/clothing/neck/roguetown/gorget/steel/oring
	skill_level = 2
	tools = list(/obj/item/rogueweapon/hammer = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/chainleash
	name = "поводок из цепи - (1 цепь; УЧЕНИК)"
	skillcraft = /datum/skill/craft/blacksmithing
	reqs = list(/obj/item/rope/chain = 1)
	result = /obj/item/leash/chain
	skill_level = 2
	tools = list(/obj/item/rogueweapon/hammer = 1)
	req_table = TRUE

//Siege

/datum/crafting_recipe/roguetown/boulder
	name = "валун - (5 камней; НОВИЧОК)"
	result = /obj/item/boulder
	reqs = list(/obj/item/natural/stone = 5)
	always_available = TRUE
	
//Bombs

/datum/crafting_recipe/roguetown/smokebombefficient
	name = "Smoke bomb (Ash Syrum)"
	result = list(/obj/item/smokebomb,
				  /obj/item/smokebomb,)
	reqs = list(/datum/reagent/alch/syrum_ash = 7,
				/obj/item/ingot/iron = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/smokebomb
	name = "Smoke bomb (Coal)"
	result = /obj/item/smokebomb
	reqs = list(/obj/item/rogueore/coal = 1,
				/obj/item/ingot/iron = 1)
	req_table = TRUE
