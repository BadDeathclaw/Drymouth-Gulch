//Contains new hay craftable objects, will be moved into their relevant files eventually
//For now these are collated here for ease of my lazyness times -Gomble

GLOBAL_LIST_INIT(hay_recipes, list ( \
	new/datum/stack_recipe("Rice Hat", /obj/item/clothing/head/rice_hat, 4, time = 5, one_per_turf = 0, on_floor = 0), \
))
//TODO - Thread/Rope for tailoring from hay fibres
/obj/item/stack/sheet/hay
	name = "hay"
	desc = "A bundle of hay. Food for livestock, and useful for weaving. Hail the Wickerman."
	singular_name = "hay stalk"
	icon_state = "hay"
	item_state = "hay"
	w_class = 2
	force = 1
	throwforce = 1
	throw_speed = 1
	throw_range = 2
	max_amount = 500
	attack_verb = list("tickled", "poked", "whipped")
	hitsound = 'sound/weapons/grenadelaunch.ogg'

/obj/item/stack/sheet/hay/Initialize(mapload, new_amount, merge = TRUE)
	recipes = GLOB.hay_recipes
	return ..()

/obj/item/stack/sheet/hay/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins shoving hay up [user.p_their()] arse! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	spawn(30)
		user.gib()
	return BRUTELOSS


/obj/item/stack/sheet/hay/fifty
	amount = 50

/obj/item/stack/sheet/hay/twenty
	amount = 20

/obj/item/stack/sheet/hay/ten
	amount = 10

/obj/item/stack/sheet/hay/five
	amount = 5


/obj/item/stack/sheet/update_icon()
	var/amount = get_amount()
	if((amount <= 4) && (amount > 0))
		icon_state = "hay[amount]"
	else
		icon_state = "hay"