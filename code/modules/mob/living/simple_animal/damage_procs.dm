/mob/living/simple_animal/apply_damage(damage = 0,damagetype = BRUTE,ap=0, def_zone = null, blocked = FALSE)
	var/hit_percent = (100-blocked)/100
	if(!damage || (hit_percent <= 0))
		return 0
	switch(damagetype)
		if(BRUTE)
			adjustBruteLoss(damage * hit_percent, ap)
		if(BURN)
			adjustFireLoss(damage * hit_percent, ap)
		if(TOX)
			adjustToxLoss(damage * hit_percent)
		if(OXY)
			adjustOxyLoss(damage * hit_percent)
		if(CLONE)
			adjustCloneLoss(damage * hit_percent)
		if(STAMINA)
			adjustStaminaLoss(damage * hit_percent)
		if(BRAIN)
			adjustBrainLoss(damage * hit_percent)
	return 1

/mob/living/simple_animal/proc/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	bruteloss = round(CLAMP(bruteloss + amount, 0, maxHealth),DAMAGE_PRECISION)
	if(updating_health)
		updatehealth()
	return amount

/mob/living/simple_animal/adjustBruteLoss(amount, ap, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[BRUTE])
		if(ap > armor[BRUTE])
			. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
		else if(100-armor[BRUTE]+ap)/100 > 0)
			. = adjustHealth(((100-armor[BRUTE]+ap)/100) * damage_coeff[BRUTE] * amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
		else
			. = adjustHealth(0, updating_health, forced)

/mob/living/simple_animal/adjustFireLoss(amount, ap, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[BURN])
		if(ap > armor[BURN])
			. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
		else if(100-armor[BURN]+ap)/100 > 0)
			. = adjustHealth(((100-armor[BURN]+ap)/100) * damage_coeff[BURN] * amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
		else
			. = adjustHealth(0, updating_health, forced)

/mob/living/simple_animal/adjustOxyLoss(amount, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[OXY])
		. = adjustHealth(amount * damage_coeff[OXY] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustToxLoss(amount, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[TOX])
		. = adjustHealth(amount * damage_coeff[TOX] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustCloneLoss(amount, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[CLONE])
		. = adjustHealth(amount * damage_coeff[CLONE] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustStaminaLoss(amount)
	return
