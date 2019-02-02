#define ROBOTIC_LIGHT_BRUTE_MSG "marred"
#define ROBOTIC_MEDIUM_BRUTE_MSG "dented"
#define ROBOTIC_HEAVY_BRUTE_MSG "falling apart"

#define ROBOTIC_LIGHT_BURN_MSG "scorched"
#define ROBOTIC_MEDIUM_BURN_MSG "charred"
#define ROBOTIC_HEAVY_BURN_MSG "smoldering"

//For ye whom may venture here, split up arm / hand sprites are formatted as "l_hand" & "l_arm".
//The complete sprite (displayed when the limb is on the ground) should be named "borg_l_arm".
//Failure to follow this pattern will cause the hand's icons to be missing due to the way get_limb_icon() works to generate the mob's icons using the aux_zone var.

/obj/item/bodypart/l_arm/robot
	name = "cyborg left arm"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	attack_verb = list("slapped", "punched")
	item_state = "buildpipe"
	icon = 'icons/mob/augmentation/augments.dmi'
	flags_1 = CONDUCT_1
	icon_state = "borg_l_arm"
	status = BODYPART_ROBOTIC

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

/obj/item/bodypart/r_arm/robot
	name = "cyborg right arm"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	attack_verb = list("slapped", "punched")
	item_state = "buildpipe"
	icon = 'icons/mob/augmentation/augments.dmi'
	flags_1 = CONDUCT_1
	icon_state = "borg_r_arm"
	status = BODYPART_ROBOTIC

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

/obj/item/bodypart/l_leg/robot
	name = "cyborg left leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	attack_verb = list("kicked", "stomped")
	item_state = "buildpipe"
	icon = 'icons/mob/augmentation/augments.dmi'
	flags_1 = CONDUCT_1
	icon_state = "borg_l_leg"
	status = BODYPART_ROBOTIC

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

/obj/item/bodypart/r_leg/robot
	name = "cyborg right leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	attack_verb = list("kicked", "stomped")
	item_state = "buildpipe"
	icon = 'icons/mob/augmentation/augments.dmi'
	flags_1 = CONDUCT_1
	icon_state = "borg_r_leg"
	status = BODYPART_ROBOTIC

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

/obj/item/bodypart/chest/robot
	name = "cyborg torso"
	desc = "A heavily reinforced case containing cyborg logic boards, with space for a standard power cell."
	item_state = "buildpipe"
	icon = 'icons/mob/augmentation/augments.dmi'
	flags_1 = CONDUCT_1
	icon_state = "borg_chest"
	status = BODYPART_ROBOTIC

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

	var/wired = 0
	var/obj/item/stock_parts/cell/cell = null

/obj/item/bodypart/chest/robot/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stock_parts/cell))
		if(src.cell)
			to_chat(user, "<span class='warning'>You have already inserted a cell!</span>")
			return
		else
			if(!user.transferItemToLoc(W, src))
				return
			src.cell = W
			to_chat(user, "<span class='notice'>You insert the cell.</span>")
	else if(istype(W, /obj/item/stack/cable_coil))
		if(src.wired)
			to_chat(user, "<span class='warning'>You have already inserted wire!</span>")
			return
		var/obj/item/stack/cable_coil/coil = W
		if (coil.use(1))
			src.wired = 1
			to_chat(user, "<span class='notice'>You insert the wire.</span>")
		else
			to_chat(user, "<span class='warning'>You need one length of coil to wire it!</span>")
	else
		return ..()

/obj/item/bodypart/chest/robot/Destroy()
	if(cell)
		qdel(cell)
		cell = null
	return ..()


/obj/item/bodypart/chest/robot/drop_organs(mob/user)
	if(wired)
		new /obj/item/stack/cable_coil(user.loc, 1)
	if(cell)
		cell.forceMove(user.loc)
		cell = null
	..()


/obj/item/bodypart/head/robot
	name = "cyborg head"
	desc = "A standard reinforced braincase, with spine-plugged neural socket and sensor gimbals."
	item_state = "buildpipe"
	icon = 'icons/mob/augmentation/augments.dmi'
	flags_1 = CONDUCT_1
	icon_state = "borg_head"
	status = BODYPART_ROBOTIC

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

	var/obj/item/assembly/flash/handheld/flash1 = null
	var/obj/item/assembly/flash/handheld/flash2 = null



/obj/item/bodypart/head/robot/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/assembly/flash/handheld))
		var/obj/item/assembly/flash/handheld/F = W
		if(src.flash1 && src.flash2)
			to_chat(user, "<span class='warning'>You have already inserted the eyes!</span>")
			return
		else if(F.crit_fail)
			to_chat(user, "<span class='warning'>You can't use a broken flash!</span>")
			return
		else
			if(!user.transferItemToLoc(F, src))
				return
			if(src.flash1)
				src.flash2 = F
			else
				src.flash1 = F
			to_chat(user, "<span class='notice'>You insert the flash into the eye socket.</span>")
	else if(istype(W, /obj/item/crowbar))
		if(flash1 || flash2)
			W.play_tool_sound(src)
			to_chat(user, "<span class='notice'>You remove the flash from [src].</span>")
			if(flash1)
				flash1.forceMove(user.loc)
				flash1 = null
			if(flash2)
				flash2.forceMove(user.loc)
				flash2 = null
		else
			to_chat(user, "<span class='warning'>There is no flash to remove from [src].</span>")

	else
		return ..()

/obj/item/bodypart/head/robot/Destroy()
	if(flash1)
		qdel(flash1)
		flash1 = null
	if(flash2)
		qdel(flash2)
		flash2 = null
	return ..()


/obj/item/bodypart/head/robot/drop_organs(mob/user)
	if(flash1)
		flash1.forceMove(user.loc)
		flash1 = null
	if(flash2)
		flash2.forceMove(user.loc)
		flash2 = null
	..()


// tier 1

/obj/item/bodypart/l_arm/robot/surplus
	name = "surplus mechanical left arm"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 20

/obj/item/bodypart/r_arm/robot/surplus
	name = "surplus mechanical right arm"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 20

/obj/item/bodypart/l_leg/robot/surplus
	name = "surplus mechanical left leg"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 20

/obj/item/bodypart/r_leg/robot/surplus
	name = "surplus mechanical right leg"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 20

//tier 2

/obj/item/bodypart/l_arm/robot/salvaged
	name = "salvaged mechanical left arm"
	desc = "A skeletal, robotic limb. Made out of scavenged servos and actuators. Feels pretty flimsy."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 40

/obj/item/bodypart/r_arm/robot/salvaged
	name = "salvaged mechanical right arm"
	desc = "A skeletal, robotic limb. Made out of scavenged servos and actuators. Feels pretty flimsy."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 40

/obj/item/bodypart/l_leg/robot/salvaged
	name = "salvaged mechanical left leg"
	desc = "A skeletal, robotic limb. Made out of scavenged servos and actuators. Feels pretty flimsy."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 40

/obj/item/bodypart/r_leg/robot/salvaged
	name = "salvaged mechanical right leg"
	desc = "A skeletal, robotic limb. Made out of scavenged servos and actuators. Feels pretty flimsy."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 40

// tier 3

/obj/item/bodypart/l_arm/robot/forged
	name = "forged mechanical left arm"
	desc = "A skeletal, robotic limb. Seems to be handcrafted and carefully constructed out of forged metal and strategically arranged actuators and servos. Feels somewhat sturdy."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 60

/obj/item/bodypart/r_arm/robot/forged
	name = "forged mechanical right arm"
	desc = "A skeletal, robotic limb. Seems to be handcrafted and carefully constructed out of forged metal and strategically arranged actuators and servos. Feels somewhat sturdy."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 60

/obj/item/bodypart/l_leg/robot/forged
	name = "forged mechanical left leg"
	desc = "A skeletal, robotic limb. Seems to be handcrafted and carefully constructed out of forged metal and strategically arranged actuators and servos. Feels somewhat sturdy."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 60

/obj/item/bodypart/r_leg/robot/forged
	name = "forged mechanical right leg"
	desc = "A skeletal, robotic limb. Seems to be handcrafted and carefully constructed out of forged metal and strategically arranged actuators and servos. Feels somewhat sturdy."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 60

// tier 4

/obj/item/bodypart/l_arm/robot/manufactured
	name = "manufactured mechanical left arm"
	desc = "A skeletal, robotic limb. Made out of milled aluminum, it seems to be mass manufactured. Has a RobCo company emblem laser cut into the side."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 80

/obj/item/bodypart/r_arm/robot/manufactured
	name = "manufactured mechanical right arm"
	desc = "A skeletal, robotic limb. Made out of milled aluminum, it seems to be mass manufactured. Has a RobCo company emblem laser cut into the side."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 80

/obj/item/bodypart/l_leg/robot/manufactured
	name = "manufactured mechanical left leg"
	desc = "A skeletal, robotic limb. Made out of milled aluminum, it seems to be mass manufactured. Has a RobCo company emblem laser cut into the side."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 80

/obj/item/bodypart/r_leg/robot/manufactured
	name = "manufactured mechanical right leg"
	desc = "A skeletal, robotic limb. Made out of milled aluminum, it seems to be mass manufactured. Has a RobCo company emblem laser cut into the side."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 80

// tier 5

/obj/item/bodypart/l_arm/robot/alloy
	name = "alloy mechanical left arm"
	desc = "A skeletal, robotic limb. Seems to be made out a complex alloy of strong metals. You see several overlapping plates around the kneecap and shins, you figured it could hold up under pressure."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 80

/obj/item/bodypart/r_arm/robot/alloy
	name = "alloy mechanical right arm"
	desc = "A skeletal, robotic limb. Seems to be made out a complex alloy of strong metals. You see several overlapping plates around the kneecap and shins, you figured it could hold up under pressure."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 80

/obj/item/bodypart/l_leg/robot/alloy
	name = "alloy mechanical left leg"
	desc = "A skeletal, robotic limb. Seems to be made out a complex alloy of strong metals. You see several overlapping plates around the kneecap and shins, you figured it could hold up under pressure."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 80

/obj/item/bodypart/r_leg/robot/alloy
	name = "alloy mechanical right leg"
	desc = "A skeletal, robotic limb. Seems to be made out a complex alloy of strong metals. You see several overlapping plates around the kneecap and shins, you figured it could hold up under pressure."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 80

// tier 6

/obj/item/bodypart/l_arm/robot/combat
	name = "combat mechanical left arm"
	desc = "A skeletal, robotic limb. A dark grey, very complex limb with shock dampeners and reinforced alloy plates surrounding it. You imagine this was built for combat."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 110

/obj/item/bodypart/r_arm/robot/combat
	name = "combat mechanical right arm"
	desc = "A skeletal, robotic limb. A dark grey, very complex limb with shock dampeners and reinforced alloy plates surrounding it. You imagine this was built for combat."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 110

/obj/item/bodypart/l_leg/robot/combat
	name = "combat mechanical left leg"
	desc = "A skeletal, robotic limb. A dark grey, very complex limb with shock dampeners and reinforced alloy plates surrounding it. You imagine this was built for combat."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 110

/obj/item/bodypart/r_leg/robot/combat
	name = "combat  mechanical right leg"
	desc = "A skeletal, robotic limb. A dark grey, very complex limb with shock dampeners and reinforced alloy plates surrounding it. You imagine this was built for combat."
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	max_damage = 110




#undef ROBOTIC_LIGHT_BRUTE_MSG
#undef ROBOTIC_MEDIUM_BRUTE_MSG
#undef ROBOTIC_HEAVY_BRUTE_MSG

#undef ROBOTIC_LIGHT_BURN_MSG
#undef ROBOTIC_MEDIUM_BURN_MSG
#undef ROBOTIC_HEAVY_BURN_MSG
