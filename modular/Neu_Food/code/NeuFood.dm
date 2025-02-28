/* * * * * * * * * * * **
 *						*	-Cooking based on slapcrafting
 *		 NeuFood		*	-Uses defines to track nutrition
 *						*	-Meant to replace menu crafting completely for foods
 *						*
 * * * * * * * * * * * **/

/* For reference only
/*	........   Nutrition defines   ................ */

/*	ALREADY DEFINED, SEE code\__DEFINES\roguetown.dm

#define MEAL_FILLING 30
#define MEAL_GOOD 24
#define MEAL_AVERAGE 18
#define MEAL_MEAGRE 15
#define SNACK_NUTRITIOUS 9
#define SNACK_DECENT 6
#define SNACK_POOR 3

*/

/*	........   Rotting defines   ................ */
#define SHELFLIFE_EXTREME 270 MINUTES
#define SHELFLIFE_LONG 135 MINUTES
#define SHELFLIFE_DECENT 75 MINUTES
#define SHELFLIFE_SHORT 45 MINUTES
#define SHELFLIFE_TINY 30 MINUTES
*/


/*	........   Templates / Base items   ................ */
/obj/item/reagent_containers // added vars used in neu cooking, might be used for other things too in the future. How it works is in each items attackby code.
	var/short_cooktime = FALSE  // based on cooking skill
	var/long_cooktime = FALSE

/obj/item/reagent_containers/food/snacks/rogue // base food type, for icons and cooktime, and to make it work with processes like pie making
	icon = 'modular/Neu_Food/icons/food.dmi'
	desc = ""
	slices_num = 0
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	foodtype = GRAIN
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	cooktime = 30 SECONDS
	var/process_step // used for pie making and other similar modular foods

/obj/item/reagent_containers/food/snacks/rogue/Initialize()
	. = ..()
	eatverb = pick("откусывает","жует","грызет","пробует","пожирает","ест")
	eatverb_me = pick("откусываю","жую","грызу","пробую","пожираю","ем")
	
/obj/item/reagent_containers/food/snacks/rogue/foodbase // root item for uncooked food thats disgusting when raw
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	bitesize = 3
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/foodbase/New() // disables the random placement on creation for this object MAYBE OBSOLETE?
	..()
	pixel_x = 0
	pixel_y = 0

/obj/item/reagent_containers/food/snacks/rogue/preserved // just convenient way to group food with long rotprocess
	bitesize = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	rotprocess = SHELFLIFE_EXTREME

/obj/item/reagent_containers/food/snacks
	var/chopping_sound = FALSE // does it play a choppy sound when batch sliced?
	var/slice_sound = FALSE // does it play the slice sound when sliced?

/obj/effect/decal/cleanable/food/mess // decal applied when throwing minced meat for example
	name = "месиво"
	desc = ""
	color = "#ab9d9d"
	icon_state = "tomato_floor1"
	random_icon_states = list("tomato_floor1", "tomato_floor2", "tomato_floor3")

/obj/item/reagent_containers/food/snacks/attackby(obj/item/W, mob/user, params)
	if(user.used_intent.blade_class == slice_bclass && W.wlength == WLENGTH_SHORT)
		if(slice_bclass == BCLASS_CHOP)
			user.visible_message("<span class='notice'>[user] рубит [src]!</span>")
			slice(W, user)
			return 1
		else if(slice(W, user))
			return 1
	..()

/*	........   Kitchen tools / items   ................ */
/obj/item/kitchen/spoon
	name = "деревянная ложка"
	desc = "Традиционная посуда, с помощью которой можно черпать суп в рот или сбивать масло.." //орфография верна
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	icon_state = "spoon"
	force = 0
	w_class = WEIGHT_CLASS_TINY

/obj/item/kitchen/ironspoon
	name = "железная ложка"
	desc = "Традиционная посуда, с помощью которой можно черпать суп в рот, теперь еще и с характерным металлическим привкусом!"
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	icon_state = "spoon_iron"
	force = 0
	w_class = WEIGHT_CLASS_TINY

/obj/item/kitchen/ironspoon/pewter
	name = "оловянная ложка"
	desc = "Традиционная посуда для зачерпывания супа в рот, для изысканности изготовленная из оловянного сплава."
	icon_state = "spoon_pewter"
	sellprice = 10

/obj/item/kitchen/ironspoon/silver
	name = "серебрянная ложка"
	desc = "Традиционный прибор, с помощью которого можно зачерпывать суп в рот. Об успешных дворянах говорят, что те росли с такими штуками во рту."
	icon_state = "spoon_silver"
	sellprice = 30
	var/last_used = 0

/obj/item/kitchen/fork
	name = "деревянная вилка"
	desc = "Традиционная посуда для накалывания еды, чтобы засунуть ее в рот."
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	icon_state = "fork"
	force = 0
	w_class = WEIGHT_CLASS_TINY

/obj/item/kitchen/ironfork
	name = "железная вилка"
	desc = "Традиционная посуда для накалывания еды. Сделана из железа для большей остроты!"
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	icon_state = "fork_iron"
	force = 0
	w_class = WEIGHT_CLASS_TINY

/obj/item/kitchen/ironfork/pewter
	name = "оловянная вилка"
	desc = "Традиционная посуда для накалывания еды, выглядит необычно!"
	icon_state = "fork_pewter"
	sellprice = 10

/obj/item/kitchen/ironfork/silver
	name = "серебрянная вилка"
	desc = "Традиционная посуда для накалывания еды. В дополнение к серебрянной ложке!"
	icon_state = "fork_silver"
	sellprice = 30
	var/last_used = 0

/obj/item/kitchen/rollingpin
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE

/obj/item/rogueweapon/huntingknife/cleaver
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	item_state = "cleav"
	experimental_inhand = FALSE
	experimental_onhip = FALSE
	experimental_onback = FALSE

/obj/item/reagent_containers/glass/bowl
	name = "деревянная миска"
	desc = "Именно пустое пространство делает миску полезной."
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	icon_state = "bowl"
	force = 5
	throwforce = 5
	reagent_flags = OPENCONTAINER
	amount_per_transfer_from_this = 7
	possible_transfer_amounts = list(7)
	dropshrink = 0.8
	w_class = WEIGHT_CLASS_NORMAL
	volume = 33
	obj_flags = CAN_BE_HIT
	sellprice = 1
	drinksounds = list('sound/items/drink_cup (1).ogg','sound/items/drink_cup (2).ogg','sound/items/drink_cup (3).ogg','sound/items/drink_cup (4).ogg','sound/items/drink_cup (5).ogg')
	fillsounds = list('sound/items/fillcup.ogg')
	var/in_use // so you can't spam eating with spoon

/obj/item/reagent_containers/glass/bowl/iron
	icon_state = "bowl_iron"

/obj/item/reagent_containers/glass/bowl/silver
	name = "серебрянная чашка"
	desc = "Именно пустое пространство делает чашу полезной. Сделана из чистого серебра!"
	icon_state = "bowl_silver"
	sellprice = 30
	var/last_used = 0

/obj/item/reagent_containers/glass/bowl/pewter
	name = "оловянная миска"
	desc = "Именно пустое пространство делает миску полезной. Украшена и изготовлена из олова!"
	icon_state = "bowl_pewter"
	sellprice = 10

/obj/item/reagent_containers/glass/bowl/update_icon()
	cut_overlays()
	if(reagents)
		if(reagents.total_volume > 0) 
			if(reagents.total_volume <= 11) 
				var/mutable_appearance/filling = mutable_appearance('modular/Neu_Food/icons/cooking.dmi', "bowl_low")
				filling.color = mix_color_from_reagents(reagents.reagent_list)
				add_overlay(filling)
		if(reagents.total_volume > 11) 
			if(reagents.total_volume <= 22) 
				var/mutable_appearance/filling = mutable_appearance('modular/Neu_Food/icons/cooking.dmi', "bowl_half")
				filling.color = mix_color_from_reagents(reagents.reagent_list)
				add_overlay(filling)
		if(reagents.total_volume > 22) 
			if(reagents.has_reagent(/datum/reagent/consumable/soup/oatmeal, 10)) 
				var/mutable_appearance/filling = mutable_appearance('modular/Neu_Food/icons/cooking.dmi', "bowl_oatmeal")
				filling.color = mix_color_from_reagents(reagents.reagent_list)
				add_overlay(filling)
			if(reagents.has_reagent(/datum/reagent/consumable/soup/veggie/cabbage, 17) || reagents.has_reagent(/datum/reagent/consumable/soup/veggie/onion, 17) || reagents.has_reagent(/datum/reagent/consumable/soup/veggie/onion, 17))
				var/mutable_appearance/filling = mutable_appearance('modular/Neu_Food/icons/cooking.dmi', "bowl_full")
				filling.color = mix_color_from_reagents(reagents.reagent_list)
				icon_state = "bowl_steam"
				add_overlay(filling)
			if(reagents.has_reagent(/datum/reagent/consumable/soup/stew/chicken, 17) || reagents.has_reagent(/datum/reagent/consumable/soup/stew/meat, 17) || reagents.has_reagent(/datum/reagent/consumable/soup/stew/fish, 17))
				var/mutable_appearance/filling = mutable_appearance('modular/Neu_Food/icons/cooking.dmi', "bowl_stew")
				filling.color = mix_color_from_reagents(reagents.reagent_list)
				icon_state = "bowl_steam"
				add_overlay(filling)
			else 
				var/mutable_appearance/filling = mutable_appearance('modular/Neu_Food/icons/cooking.dmi', "bowl_full")
				filling.color = mix_color_from_reagents(reagents.reagent_list)
				add_overlay(filling)
	else
		icon_state = "bowl"

/obj/item/reagent_containers/glass/bowl/on_reagent_change(changetype)
	..()
	update_icon()

/obj/item/reagent_containers/glass/bowl/attackby(obj/item/I, mob/living/user, params) // lets you eat with a spoon from a bowl
	if(istype(I, /obj/item/kitchen/spoon))
		if(reagents.total_volume > 0)
			beingeaten()
			playsound(src,'sound/misc/eat.ogg', rand(30,60), TRUE)
			visible_message("<span class='info'>[user] ест из [src].</span>")
			if(do_after(user,1 SECONDS, target = src))
				addtimer(CALLBACK(reagents, TYPE_PROC_REF(/datum/reagents, trans_to), user, min(amount_per_transfer_from_this,5), TRUE, TRUE, FALSE, user, FALSE, INGEST), 5)
		return TRUE
				
/obj/item/reagent_containers/glass/bowl/proc/beingeaten()
	in_use = TRUE
	sleep(10)
	in_use = FALSE

/obj/item/reagent_containers/glass/cup
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE

/obj/item/reagent_containers/glass/cup/pewter
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE

/obj/item/cooking/pan
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE

/obj/item/reagent_containers/peppermill // new with some animated art
	name = "мельница с перцем"
	desc = "Дорогая специя, которая используется для обогащения вкуса."
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	icon_state = "peppermill"
	layer = CLOSED_BLASTDOOR_LAYER // obj layer + a little, small obj layering above convenient
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	list_reagents = list(/datum/reagent/consumable/blackpepper = 5)
	reagent_flags = TRANSPARENT

/obj/item/cooking/platter
	name = "блюдо"
	desc = "Блюдо из обоженной глины."
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	icon_state = "platter"
	resistance_flags = NONE
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	experimental_inhand = FALSE

/obj/item/cooking/platter/pewter
	name = "оловянное блюдо"
	desc = "Изготовлен из сплава олова и ртути. Довольно приятно скатывается с языка."
	icon_state = "p_platter"
	sellprice = 10

/obj/item/cooking/platter/silver
	name = "серебрянное"
	desc = "Изготовлен из полированного серебра. Изысканно!"
	icon_state = "s_platter"
	sellprice = 30
	var/last_used = 0

/obj/item/book/rogue/yeoldecookingmanual // new book with some tips to learn
	name = "Древнейшие методы и способы пищеприготовления"
	desc = "Написал Свенд Толстобородый, дворецкий в четвертом поколении."
	icon_state ="book8_0"
	base_icon_state = "book8"
	bookfile = "Neu_cooking.json"

/obj/item/storage/foodbag
	name = "мешок для еды"
	desc = "Небольшая сумка для переноски продуктов."
	icon_state = "sack_rope"
	item_state = "sack_rope"
	icon = 'icons/roguetown/items/misc.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_HIP
	resistance_flags = NONE
	max_integrity = 300

/obj/item/storage/foodbag/examine(mob/user)
	. = ..()
	if(contents.len)
		. += span_notice("[contents.len] предмет[contents.len > 1 ? "ов" : ""] в мешок.")

/obj/item/storage/foodbag/attack_right(mob/user)
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	testing("yea144")
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	var/list/things = STR.contents()
	if(things.len)
		testing("yea64")
		var/obj/item/I = pick(things)
		STR.remove_from_storage(I, get_turf(user))
		user.put_in_hands(I)

/obj/item/storage/foodbag/update_icon()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	var/list/things = STR.contents()
	if(things.len)
		icon_state = "sack_rope"
		w_class = WEIGHT_CLASS_NORMAL
	else
		icon_state = "sack_rope"
		w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/foodbag/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 20
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 5
	STR.set_holdable(list(
		/obj/item/reagent_containers/food/snacks/rogue/berrycandy,
		/obj/item/reagent_containers/food/snacks/rogue/applecandy,
		/obj/item/reagent_containers/food/snacks/rogue/raisins,
		/obj/item/reagent_containers/food/snacks/rogue/foodbase/hardtack_raw/cooked
		))
	STR.click_gather = TRUE
	STR.attack_hand_interact = FALSE
	STR.collection_mode = COLLECT_EVERYTHING
	STR.dump_time = 0
	STR.allow_quick_gather = TRUE
	STR.allow_quick_empty = TRUE
	STR.allow_look_inside = FALSE
	STR.allow_dump_out = TRUE
	STR.display_numerical_stacking = TRUE


/* * * * * * * * * * * * * * *	*
 *								*
 *		Reagents     			*
 *					 			*
 *								*
 * * * * * * * * * * * * * * * 	*/

/// These are for the pot, if more vegetables are added and need to be integrated into the pot brewing you need to add them here
/datum/reagent/consumable/soup // so you get hydrated without the flavor system messing it up. Works like water with less hydration
	var/hydration = 6
/datum/reagent/consumable/soup/on_mob_life(mob/living/carbon/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!HAS_TRAIT(H, TRAIT_NOHUNGER))
			H.adjust_hydration(hydration)
		if(M.blood_volume < BLOOD_VOLUME_NORMAL)
			M.blood_volume = min(M.blood_volume+10, BLOOD_VOLUME_NORMAL)
	..()

/datum/reagent/consumable/soup/oatmeal
	name = "овсяная каша"
	description = "Подходит для крестьян."
	reagent_state = LIQUID
	color = "#c38553"
	nutriment_factor = 15
	metabolization_rate = 0.5 // half as fast as normal, last twice as long
	taste_description = "овсянки"
	taste_mult = 3
	hydration = 2

/datum/reagent/consumable/soup/veggie
	name = "овощной суп"
	description = ""
	reagent_state = LIQUID
	nutriment_factor = 10
	taste_mult = 4
	hydration = 8

/datum/reagent/consumable/soup/veggie/potato
	color = "#869256"
	taste_description = "картофельного бульона"

/datum/reagent/consumable/soup/veggie/onion
	color = "#a6b457"
	taste_description = "вареного лука"

/datum/reagent/consumable/soup/veggie/cabbage
	color = "#859e56"
	taste_description = "водянистой капусты"

/datum/reagent/consumable/soup/veggie/beet
	color = "#8E3A59"
	taste_description = "водянистой свеклы"

/datum/reagent/consumable/soup/stew
	name = "густое рагу"
	description = "В это варево пошли всевозможные съедобные кусочки."
	reagent_state = LIQUID
	nutriment_factor = 20
	taste_mult = 4

/datum/reagent/consumable/soup/stew/chicken
	color = "#baa21c"
	taste_description = "куриного рагу"

/datum/reagent/consumable/soup/stew/meat
	color = "#80432a"
	taste_description = "мясного рагу"

/datum/reagent/consumable/soup/stew/fish
	color = "#c7816e"
	taste_description = "рыбного рагу"

/datum/reagent/consumable/soup/stew/yucky
	color = "#9e559c"
	taste_description = "чего-то прогорклого"


/* * * * * * * * * * * * * * *	*
 *								*
 *		Powder & Salt			*
 *					 			*
 *								*
 * * * * * * * * * * * * * * * 	*/

// -------------- POWDER (flour) -----------------
/obj/item/reagent_containers/powder/flour
	name = "мука"
	desc = "С этими амбициями мы построим империю."
	gender = PLURAL
	icon_state = "flour"
	list_reagents = list(/datum/reagent/floure = 1)
	volume = 1
	sellprice = 0
	var/water_added
/obj/item/reagent_containers/powder/flour/throw_impact(atom/hit_atom, datum/thrownthing/thrownthing)
	new /obj/effect/decal/cleanable/food/flour(get_turf(src))
	..()
	qdel(src)

/obj/item/reagent_containers/powder/flour/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	var/obj/item/reagent_containers/R = I
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(!istype(R) || (water_added))
		return ..()
	if(isturf(loc)&& (!found_table))
		to_chat(user, "<span class='notice'>Нужен стол...</span>")
		return ..()	
	if(!R.reagents.has_reagent(/datum/reagent/water, 10))
		to_chat(user, "<span class='notice'>Нужно больше воды.</span>")
		return TRUE
	to_chat(user, "<span class='notice'>Добавив воду, пора немного помесить тесто...</span>")
	playsound(get_turf(user), 'modular/Neu_Food/sound/splishy.ogg', 100, TRUE, -1)
	if(do_after(user,2 SECONDS, target = src))
		user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
		name = "влажная мука"
		desc = "Предназначена для великого. Все в ваших руках."
		R.reagents.remove_reagent(/datum/reagent/water, 10)
		water_added = TRUE
		color = "#d9d0cb"	
	return TRUE

/obj/item/reagent_containers/powder/flour/attack_hand(mob/living/user)
	if(water_added)
		playsound(get_turf(user), 'modular/Neu_Food/sound/kneading_alt.ogg', 90, TRUE, -1)
		if(do_after(user,3 SECONDS, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/dough_base(loc)
			qdel(src)
	else ..()

// -------------- SALT -----------------
/obj/item/reagent_containers/powder/salt
	name = "соль"
	desc = ""
	gender = PLURAL
	icon_state = "salt"
	list_reagents = list(/datum/reagent/floure = 1)
	volume = 1
	sellprice = 0

/obj/item/reagent_containers/powder/salt/throw_impact(atom/hit_atom, datum/thrownthing/thrownthing)
	new /obj/effect/decal/cleanable/food/flour(get_turf(src))
	..()
	qdel(src)

/*	..................   Food platter   ................... */
/obj/item/cooking/platter/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/peppersteak))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/peppersteak/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/onionsteak))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/onionsteak/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/friedegg/tiberian))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/friedegg/tiberian/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/friedrat))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/friedrat/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/hcakeslice))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/hcakeslice/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/ccakeslice))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/ccakeslice/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/bun_grenz))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/bun_grenz/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/fryfish/carp))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/fryfish/carp/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/fryfish/angler))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/fryfish/angler/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/fryfish/eel))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/fryfish/eel/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/wienercabbage))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wienercabbage/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/wienerpotato))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wienerpotato/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/wieneronions))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wieneronions/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/frybirdtato))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,2 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/frybirdtato/plated(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	else
		return ..()	

/* ###########################################
		Silver Cutlery interactions with deadites
   ########################################### */

// This is definitely better done as a datum.
// Because this is the same for all silver items, I will only comment for the platter.
/obj/item/cooking/platter/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 12 SECONDS) // Can only be applied every 12 seconds.
		to_chat(user, span_notice("Эффект серебра находится на перезарядке."))
		return
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				H.adjustFireLoss(10) // 10 points of burn damage
				H.fire_act(1,10)     // 1 stack of fire added, up to a maximum of 10?
				to_chat(H, span_userdanger("Меня ударили моей ПОГИБЕЛЬЮ!"))
				src.last_used = world.time
				return
		if(target.mind && target.mind.has_antag_datum(/datum/antagonist/vampirelord))
			var/datum/antagonist/vampirelord/VD = target.mind.has_antag_datum(/datum/antagonist/vampirelord)
			if(!VD.disguised)
				H.adjustFireLoss(10)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Меня ударили моей ПОГИБЕЛЬЮ!"))
				src.last_used = world.time
				return

/obj/item/cooking/platter/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(10)
			H.Paralyze(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
				H.Knockdown(10)
				H.adjustFireLoss(25)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(10)
			H.Paralyze(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)

/obj/item/cooking/platter/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				M.Knockdown(10)
				M.Paralyze(10)
				M.adjustFireLoss(25)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
				return FALSE
	if(M.mind && M.mind.has_antag_datum(/datum/antagonist/vampirelord))
		M.adjustFireLoss(25)
		M.fire_act(1,10)
		to_chat(M, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
		return FALSE

/obj/item/reagent_containers/glass/bowl/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 12 SECONDS)
		to_chat(user, span_notice("Эффект серебра находится на перезарядке."))
		return
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				H.adjustFireLoss(10)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Меня ударили моей ПОГИБЕЛЬЮ!"))
				src.last_used = world.time
				return
		if(target.mind && target.mind.has_antag_datum(/datum/antagonist/vampirelord))
			var/datum/antagonist/vampirelord/VD = target.mind.has_antag_datum(/datum/antagonist/vampirelord)
			if(!VD.disguised)
				H.adjustFireLoss(10)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Меня ударили моей ПОГИБЕЛЬЮ!"))
				src.last_used = world.time
				return

/obj/item/reagent_containers/glass/bowl/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(10)
			H.Paralyze(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
				H.Knockdown(10)
				H.adjustFireLoss(25)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(10)
			H.Paralyze(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)

/obj/item/reagent_containers/glass/bowl/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				M.Knockdown(10)
				M.Paralyze(10)
				M.adjustFireLoss(25)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
				return FALSE
	if(M.mind && M.mind.has_antag_datum(/datum/antagonist/vampirelord))
		M.adjustFireLoss(25)
		M.fire_act(1,10)
		to_chat(M, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
		return FALSE
/obj/item/kitchen/ironfork/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 12 SECONDS)
		to_chat(user, span_notice("Эффект серебра находится на перезарядке."))
		return
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				H.adjustFireLoss(10)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Меня ударили моей ПОГИБЕЛЬЮ!"))
				src.last_used = world.time
				return
		if(target.mind && target.mind.has_antag_datum(/datum/antagonist/vampirelord))
			var/datum/antagonist/vampirelord/VD = target.mind.has_antag_datum(/datum/antagonist/vampirelord)
			if(!VD.disguised)
				H.adjustFireLoss(10)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Меня ударили моей ПОГИБЕЛЬЮ!"))
				src.last_used = world.time
				return

/obj/item/kitchen/ironfork/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(10)
			H.Paralyze(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
				H.Knockdown(10)
				H.adjustFireLoss(25)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(10)
			H.Paralyze(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)

/obj/item/kitchen/ironfork/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				M.Knockdown(10)
				M.Paralyze(10)
				M.adjustFireLoss(25)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
				return FALSE
	if(M.mind && M.mind.has_antag_datum(/datum/antagonist/vampirelord))
		M.adjustFireLoss(25)
		M.fire_act(1,10)
		to_chat(M, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
		return FALSE

/obj/item/kitchen/ironspoon/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 12 SECONDS)
		to_chat(user, span_notice("Эффект серебра находится на перезарядке."))
		return
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				H.adjustFireLoss(10)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Меня ударили моей ПОГИБЕЛЬЮ!"))
				src.last_used = world.time
				return
		if(target.mind && target.mind.has_antag_datum(/datum/antagonist/vampirelord))
			var/datum/antagonist/vampirelord/VD = target.mind.has_antag_datum(/datum/antagonist/vampirelord)
			if(!VD.disguised)
				H.adjustFireLoss(10)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Меня ударили моей ПОГИБЕЛЬЮ!"))
				src.last_used = world.time
				return

/obj/item/kitchen/ironspoon/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(10)
			H.Paralyze(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
				H.Knockdown(10)
				H.adjustFireLoss(25)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(10)
			H.Paralyze(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)

/obj/item/kitchen/ironspoon/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				M.Knockdown(10)
				M.Paralyze(10)
				M.adjustFireLoss(25)
				H.fire_act(1,10)
				to_chat(H, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
				return FALSE
	if(M.mind && M.mind.has_antag_datum(/datum/antagonist/vampirelord))
		M.adjustFireLoss(25)
		M.fire_act(1,10)
		to_chat(M, span_userdanger("Я не могу брать в руки серебро, это моя ПОГИБЕЛЬ!"))
		return FALSE

/* * * * * * * * * * * **
 *						*
 *	 Food Rotting		*	- Just lists as it stands on 2024-07-16
 *						*
 * * * * * * * * * * * **/

/*	.................   Never spoils   ................... *//*

* Hardtack
* Toast
* Salted fish
* Frybread
* Unbitten handpies
* Biscuit
* Prezzel
* Cheese wheel/wedges
* Salo
* Copiette
* Salumoi
* Uncut pie
* Raw potato, onion, cabbage

/*	.................   Long shelflife   ................... */

* Uncut bread loaf
* Uncut raisin bread
* Uncut cake
* Pastry
* Bun
* Most plated dishes
* Most cooked veggies
* Cooked sausage
* Pie slice
* Bread slice

/*	.................   Decent shelflife   ................... */

* Fresh cheese
* Mixed dishes with meats 
* Fried meats & eggs

/*	.................   Short shelflife   ................... */

* Raw meat
* Berries

/*	.................   Tiny shelflife   ................... */

* Minced meat

*/
