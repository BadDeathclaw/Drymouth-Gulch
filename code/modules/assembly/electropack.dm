/obj/item/assembly/signaler/electropack
	name = "electropack"
	desc = "Dance my monkeys! DANCE!!!"
	icon = 'icons/obj/radio.dmi'
	icon_state = "electropack0"
	item_state = "electropack"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	materials = list(MAT_METAL=10000, MAT_GLASS=2500)
	var/on = TRUE
	var/shock_cooldown = 0
	code = 2
	frequency = FREQ_ELECTROPACK
	attachable = FALSE

/obj/item/assembly/signaler/electropack/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] hooks [user.p_them()]self to the electropack and spams the trigger! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (FIRELOSS)

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/assembly/signaler/electropack/attack_hand(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.back)
			to_chat(user, "<span class='warning'>You need help taking this off!</span>")
			return
	return ..()

/obj/item/assembly/signaler/electropack/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/clothing/head/helmet))
		var/obj/item/assembly/shock_kit/A = new /obj/item/assembly/shock_kit( user )
		A.icon = 'icons/obj/assemblies.dmi'

		if(!user.transferItemToLoc(W, A))
			to_chat(user, "<span class='warning'>[W] is stuck to your hand, you cannot attach it to [src]!</span>")
			return
		W.master = A
		A.part1 = W

		user.transferItemToLoc(src, A, TRUE)
		master = A
		A.part2 = src

		user.put_in_hands(A)
		A.add_fingerprint(user)
		if(item_flags & NODROP)
			A.item_flags |= NODROP
	else
		return ..()

/obj/item/assembly/signaler/electropack/receive_signal(datum/signal/signal)
	..()

	if(isliving(loc) && on)
		if(shock_cooldown != 0)
			return
		shock_cooldown = 1
		spawn(100)
			shock_cooldown = 0
		var/mob/living/L = loc
		step(L, pick(GLOB.cardinals))

		to_chat(L, "<span class='danger'>You feel a sharp shock!</span>")
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(3, 1, L)
		s.start()

		L.Knockdown(100)

/obj/item/assembly/signaler/electropack/attack_self(mob/user)

	if(!ishuman(user))
		return
	user.set_machine(src)
	var/dat = {"<TT>Turned [on ? "On" : "Off"] -
<A href='?src=[REF(src)];power=1'>Toggle</A><BR>
<B>Frequency/Code</B> for electropack:<BR>
Frequency:
<A href='byond://?src=[REF(src)];freq=-10'>-</A>
<A href='byond://?src=[REF(src)];freq=-2'>-</A> [format_frequency(frequency)]
<A href='byond://?src=[REF(src)];freq=2'>+</A>
<A href='byond://?src=[REF(src)];freq=10'>+</A><BR>

Code:
<A href='byond://?src=[REF(src)];code=-5'>-</A>
<A href='byond://?src=[REF(src)];code=-1'>-</A> [code]
<A href='byond://?src=[REF(src)];code=1'>+</A>
<A href='byond://?src=[REF(src)];code=5'>+</A><BR>
</TT>"}
	user << browse(dat, "window=radio")
	onclose(user, "radio")
	return

//F13 EDIT
/obj/item/assembly/signaler/electropack/shockcollar
	name = "slave collar"
	desc = "A reinforced metal collar. It seems to have some form of wiring near the front. Strange... A small lock is present, though it seems impossible to get it off anyway without external help."
	icon = 'icons/obj/clothing/neck.dmi'
	icon_state = "slavecollar"
	item_state = "slavecollar"
	alternate_worn_icon = 'icons/mob/neck.dmi'
	slot_flags = ITEM_SLOT_NECK  //CEASE THE POCKET SHOCKER MEMES | Pocket shocker meme is hilarious. - Nappist
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = NECK
	strip_delay = 60
	equip_delay_other = 60
	var/lock = FALSE

/obj/item/assembly/signaler/electropack/shockcollar/Initialize()
	. = ..()
	set_frequency(pick(1441,1443,1445,1447,1449,1451,1453,1455,1457,1459))
	code = rand(1,100)
	name = "[name] #[frequency]/[code]"

/obj/item/assembly/signaler/electropack/shockcollar/attackby(obj/item/K, mob/user, params)
	if(istype(K, /obj/item/key/scollar))
		if(lock != FALSE)
			to_chat(user, "<span class='warning'>With a click the shock collar unlocks!</span>")
			lock = FALSE
			item_flags = null
		else
			to_chat(user, "<span class='warning'>With a click the shock collar locks!</span>")
			lock = TRUE
			if(SLOT_NECK)
				item_flags = NODROP
	return

/obj/item/assembly/signaler/electropack/shockcollar/attack_hand(mob/user)
	if(loc == user && user.get_item_by_slot(SLOT_NECK))
		to_chat(user, "<span class='warning'>The collar is fastened tight! You'll need help taking this off!</span>")
		return
	..()

/obj/item/assembly/signaler/electropack/shockcollar/receive_signal(datum/signal/signal) //this removes the "on" check
	if(!signal || signal.data["code"] != code)
		return

	if(isliving(loc))
		if(shock_cooldown != 0)
			return
		shock_cooldown = 1
		spawn(100)
			shock_cooldown = 0
		var/mob/living/L = loc
		step(L, pick(GLOB.cardinals))

		to_chat(L, "<span class='danger'>You feel a sharp shock from the collar!</span>")
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(3, 1, L)
		s.start()

		L.Knockdown(100)

	if(master)
		master.receive_signal()
	return

/obj/item/assembly/signaler/electropack/shockcollar/attack_self(mob/user)
	if(!ishuman(user))
		return

	user.set_machine(src)
	var/dat = {"<B>Frequency/Code</B> for slave collar:<BR>
Frequency:
<A href='byond://?src=[REF(src)];freq=-10'>-</A>
<A href='byond://?src=[REF(src)];freq=-2'>-</A> [format_frequency(frequency)]
<A href='byond://?src=[REF(src)];freq=2'>+</A>
<A href='byond://?src=[REF(src)];freq=10'>+</A><BR>

Code:
<A href='byond://?src=[REF(src)];code=-5'>-</A>
<A href='byond://?src=[REF(src)];code=-1'>-</A> [code]
<A href='byond://?src=[REF(src)];code=1'>+</A>
<A href='byond://?src=[REF(src)];code=5'>+</A><BR>
</TT>"}
	user << browse(dat, "window=radio")
	onclose(user, "radio")
	return

/obj/item/key/scollar
	name = "Shock Collar Key"
	desc = "A small key designed to work with shock collars."

/////////////////////
//Explosive Collars//
/////////////////////

/obj/item/assembly/signaler/electropack/boomcollar
	name = "explosive collar"
	desc = "A thick reinforced metal collar. 'Explosion' danger symbols line the outside. A small lock is present, though it seems impossible to get it off anyway without external help."
	icon = 'icons/obj/clothing/neck.dmi'
	icon_state = "slavecollarb"
	item_state = "slavecollarb"
	alternate_worn_icon = 'icons/mob/neck.dmi'
	slot_flags = ITEM_SLOT_NECK
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = NECK
	strip_delay = 60
	equip_delay_other = 60
	var/lock = FALSE

/obj/item/assembly/signaler/electropack/boomcollar/Initialize()
	. = ..()
	set_frequency(pick(1441,1443,1445,1447,1449,1451,1453,1455,1457,1459))
	code = rand(1,100)
	name = "[name] #[frequency]/[code]"

/obj/item/assembly/signaler/electropack/boomcollar/attackby(obj/item/K, mob/user, params)
	if(istype(K, /obj/item/key/bcollar))
		if(lock != FALSE)
			to_chat(user, "<span class='warning'>With a click the explosive collar unlocks!</span>")
			lock = FALSE
			item_flags = null
		else
			to_chat(user, "<span class='warning'>With a click the explosive collar locks!</span>")
			lock = TRUE
			if(SLOT_NECK)
				item_flags = NODROP
	return

/obj/item/assembly/signaler/electropack/boomcollar/attack_hand(mob/user)
	if(loc == user && user.get_item_by_slot(SLOT_NECK))
		to_chat(user, "<span class='warning'>The collar is fastened tight! You'll need help taking this off!</span>")
		return
	..()

/obj/item/assembly/signaler/electropack/boomcollar/receive_signal(datum/signal/signal) //this removes the "on" check
	if(!signal || signal.data["code"] != code)
		return

	if(isliving(loc))
		var/mob/living/L = loc
		step(L, pick(GLOB.cardinals))
		to_chat(L, "<span class='danger'>Beep beep</span>")
		boom(L)

	if(master)
		master.receive_signal()
	return

/obj/item/assembly/signaler/electropack/boomcollar/attack_self(mob/user)
	if(!ishuman(user))
		return

	user.set_machine(src)
	var/dat = {"<B>Frequency/Code</B> for explosive collar:<BR>
Frequency:
<A href='byond://?src=[REF(src)];freq=-10'>-</A>
<A href='byond://?src=[REF(src)];freq=-2'>-</A> [format_frequency(frequency)]
<A href='byond://?src=[REF(src)];freq=2'>+</A>
<A href='byond://?src=[REF(src)];freq=10'>+</A><BR>

Code:
<A href='byond://?src=[REF(src)];code=-5'>-</A>
<A href='byond://?src=[REF(src)];code=-1'>-</A> [code]
<A href='byond://?src=[REF(src)];code=1'>+</A>
<A href='byond://?src=[REF(src)];code=5'>+</A><BR>
</TT>"}
	user << browse(dat, "window=radio")
	onclose(user, "radio")
	return

/obj/item/assembly/signaler/electropack/boomcollar/proc/boom(mob/living/L)
	explosion(src.loc,0,1,2, flame_range = 2)
	if (SLOT_NECK)
		var/obj/item/bodypart/head/victimhead = L.get_bodypart(BODY_ZONE_HEAD)
		victimhead.dismember()

/obj/item/key/bcollar
	name = "Explosive Collar Key"
	desc = "A small key designed to work with explosive collars."