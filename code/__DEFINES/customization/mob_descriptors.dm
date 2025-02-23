#define MOB_DESCRIPTOR_SLOT_NOTHING 1
#define MOB_DESCRIPTOR_SLOT_FACE_SHAPE 2
#define MOB_DESCRIPTOR_SLOT_FACE_EXPRESSION 3
#define MOB_DESCRIPTOR_SLOT_BODY 4
#define MOB_DESCRIPTOR_SLOT_SKIN 5
#define MOB_DESCRIPTOR_SLOT_VOICE 6
#define MOB_DESCRIPTOR_SLOT_STATURE 7
#define MOB_DESCRIPTOR_SLOT_PROMINENT 8
#define MOB_DESCRIPTOR_SLOT_AGE 9
#define MOB_DESCRIPTOR_SLOT_PENIS 10
#define MOB_DESCRIPTOR_SLOT_TESTICLES 11
#define MOB_DESCRIPTOR_SLOT_BREASTS 12
#define MOB_DESCRIPTOR_SLOT_VAGINA 13
#define MOB_DESCRIPTOR_SLOT_HEIGHT 14

#define CUSTOM_DESCRIPTOR_AMOUNT 2
#define CUSTOM_DESCRIPTOR_TEXT_LENGTH 32

#define CUSTOM_PREFIX_HAS_A 1
#define CUSTOM_PREFIX_HAS_AN 2
#define CUSTOM_PREFIX_IS 3
#define CUSTOM_PREFIX_LOOKS 4
#define CUSTOM_PREFIX_HAS 5

#define CUSTOM_PREFIX_AMOUNT 5 //Keep this to match the max

#define CUSTOM_PREFIX_INPUT_LIST list(\
	"Имеет" = CUSTOM_PREFIX_HAS_A,\
	"Владеет" = CUSTOM_PREFIX_HAS_AN,\
	"Является" = CUSTOM_PREFIX_IS,\
	"Выглядит" = CUSTOM_PREFIX_LOOKS,\
	"Внешне" = CUSTOM_PREFIX_HAS\
)

#define CUSTOM_PREFIX_TRANSLATION_LIST list(\
	"[CUSTOM_PREFIX_HAS_A]" = "имеет",\
	"[CUSTOM_PREFIX_HAS_AN]" = "владеет",\
	"[CUSTOM_PREFIX_IS]" = "является",\
	"[CUSTOM_PREFIX_LOOKS]" = "выглядит",\
	"[CUSTOM_PREFIX_HAS]" = "внешне"\
)

#define MOB_DESCRIPTOR(descriptor_type) GLOB.mob_descriptors[descriptor_type]

GLOBAL_LIST_INIT(mob_descriptors, build_descriptor_types())

/proc/build_descriptor_types()
	. = list()
	for(var/type in typesof(/datum/mob_descriptor))
		if(is_abstract(type))
			continue
		.[type] = new type()
	return .

#define DESCRIPTOR_CHOICE(choice_type) GLOB.descriptor_choices[choice_type]
GLOBAL_LIST_INIT(descriptor_choices, build_descriptor_choices())

/proc/build_descriptor_choices()
	. = list()
	for(var/type in typesof(/datum/descriptor_choice))
		if(is_abstract(type))
			continue
		.[type] = new type()
	return .
