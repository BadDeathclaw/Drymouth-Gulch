//Fallout 13 general clothing directory

/obj/item/clothing/under/f13
	icon = 'icons/fallout/clothing/uniforms.dmi'
	self_weight = 2

/obj/item/clothing/under/f13/navy
	name = "navy jumpsuit"
	desc = "Pre-War standard naval uniform."
	icon_state = "navy"
	item_state = "bl_suit"
	item_color = "navy"
	cloth_count = 3
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/navyofficer
	name = "navy officer jumpsuit"
	desc = "Pre-War standard naval uniform for ranked officers."
	icon_state = "navyofficer"
	item_state = "bl_suit"
	item_color = "navyofficer"
	cloth_count = 4
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/machinist
	name = "workman outfit"
	desc = "The apparel of an old-time machinist."
	icon_state = "machinist"
	item_state = "lb_suit"
	item_color = "machinist"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/lumberjack
	name = "lumberjack outfit"
	desc = "The apparel of an old-time lumberjack."
	icon_state = "lumberjack"
	item_state = "r_suit"
	item_color = "lumberjack"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/police
	name = "pre-War police uniform"
	desc = "Golden classics of pre-War police officers."
	icon_state = "retro_police"
	item_state = "b_suit"
	item_color = "retro_police"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/cowboyt //Originally cowboy and mafia stuff by Nienhaus
	name = "dusty prospector outfit"
	desc = "A white shirt with shiny brass buttons and a pair of tan trousers, commonly worn by prospectors."
	icon_state = "cowboyt"
	item_state = "det"
	item_color = "cowboyt"
	can_adjust = 0

/obj/item/clothing/under/f13/cowboyb
	name = "sleek prospector outfit"
	desc = "A white shirt with brass buttons and a pair of brown trousers, commonly worn by prospectors."
	icon_state = "cowboyb"
	item_state = "det"
	item_color = "cowboyb"
	can_adjust = 0

/obj/item/clothing/under/f13/cowboyg
	name = "well-heeled prospector outfit"
	desc = "A white shirt with black buttons and a pair of gray trousers, commonly worn by prospectors."
	icon_state = "cowboyg"
	item_state = "sl_suit"
	item_color = "cowboyg"
	can_adjust = 0

/obj/item/clothing/under/f13/female/flapper
	name = "flapper dress"
	desc = "An outfit commonly worn by old-time prostitutes from around New Reno, but can be seen all over the wasteland."
	icon_state = "flapper"
	item_state = "gy_suit"
	item_color = "flapper"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/f13/bdu //WalterJe military standarts.
	name = "BDU"
	desc = "A standard military Battle Dress Uniform."
	icon_state = "bdu"
	item_state = "xenos_suit"
	item_color = "bdu"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 1
	self_weight = 3

/obj/item/clothing/under/f13/dbdu
	name = "DBDU"
	desc = "A military Desert Battle Dress Uniform."
	icon_state = "dbdu"
	item_state = "brownjsuit"
	item_color = "dbdu"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 1
	self_weight = 3

/obj/item/clothing/under/f13/shiny //Firefly, yay!
	name = "shiny outfit"
	desc = "The perfect outfit for a brave and reckless space cowboy. Shiny!"
	icon_state = "shiny"
	item_state = "owl"
	item_color = "shiny"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/batter //I guess we're going OFF limits.
	name = "worn baseball uniform"
	desc = "<b>Purification in progress...</b>"
	icon_state = "batter"
	item_state = "w_suit"
	item_color = "batter"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/bennys //Benny's suit from Fallout: New Vegas. But Benny was just a kid back in 2255, so it's just a fancy suit for you.
	name = "fancy suit"
	desc = "A black and white buffalo plaid suit. Fancy!"
	icon_state = "benny"
	item_state = "white_suit"
	item_color = "benny"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/relaxedwear
	name = "pre-War male relaxedwear"
	desc = "A dirty long-sleeve blue shirt with a greenish brown sweater-vest and slacks."
	icon_state = "relaxedwear_m"
	item_state = "g_suit"
	item_color = "relaxedwear_m"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/spring
	name = "pre-War male spring outfit"
	desc = "A dirty long-sleeve beige shirt with a red sweater-vest and brown trousers."
	icon_state = "spring_m"
	item_state = "brownjsuit"
	item_color = "spring_m"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/formal
	name = "pre-War male formal wear"
	desc = "A black jacket with an old white shirt and dirty dark purple trousers.<br>Traditionally worn by the richest of the post-War world."
	icon_state = "formal_m"
	item_state = "judge"
	item_color = "formal_m"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	self_weight = 3
	cloth_count = 5

/obj/item/clothing/under/f13/bodyguard
	name = "bodyguard outfit"
	desc = "A grimy pair of pre-War slacks, tie, and a dress shirt with some makeshift pauldrons made of scrap metal attached with leather straps."
	icon_state = "bodyguard"
	item_state = "sl_suit"
	item_color = "bodyguard"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	self_weight = 4
	cloth_count = 5

/obj/item/clothing/under/f13/rag
	name = "torn rags"
	desc = "A shirt - or whatever it is, made of ripped cloth.<br>It has soaked in sweat, and has a bad smell.<br>Only the poorest of settlers, mostly the drug addicts, raiders or slaves wear something like that."
	icon_state = "rag"
	item_state = "lgloves"
	item_color = "rag"
	can_adjust = 0
	cloth_count = 2

/obj/item/clothing/under/f13/tribal
	name = "male tribal outfit"
	desc = "A male outfit made of gecko hides.<br>It doesn't cover some parts of body, yet it's better than to walk around naked..."
	icon_state = "tribal_m"
	item_state = "lgloves"
	item_color = "tribal_m"
	can_adjust = 0

/obj/item/clothing/under/f13/female/tribal
	name = "female tribal outfit"
	desc = "A female outfit made of gecko hides.<br>It doesn't cover some parts of body, yet it's better than to walk around naked..."
	icon_state = "tribal_f"
	item_state = "lgloves"
	item_color = "tribal_f"
	can_adjust = 0

/obj/item/clothing/under/f13/settler
	name = "settler outfit"
	desc = "A more or less a crudely made tan robe with a makeshift belt made from cloth.<br>Paired with worn grey pants."
	icon_state = "settler"
	item_state = "brownjsuit"
	item_color = "settler"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/brahmin //Male version
	name = "male brahmin-skin outfit"
	desc = "A basic male outfit consisting of a white shirt and patched trousers with Y-shaped suspenders."
	icon_state = "brahmin_m"
	item_state = "brownjsuit"
	item_color = "brahmin_m"
	can_adjust = 0

/obj/item/clothing/under/f13/female/brahmin //Female version
	name = "female brahmin-skin outfit"
	desc = "A basic female outfit consisting of a rolled-up long-sleeve shirt and patched trousers with Y-shaped suspenders.<br>Fitted for female wastelanders."
	icon_state = "brahmin_f"
	item_state = "brownjsuit"
	item_color = "brahmin_f"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/f13/doctor //Male version
	name = "male doctor fatigues"
	desc = "A white t-shirt, a small brown satchel bag and brown trousers with pouches attached to the belt.<br>Fitted for male wastelanders."
	icon_state = "doctor_m"
	item_state = "brownjsuit"
	item_color = "doctor_m"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/female/doctor //Female version
	name = "female doctor fatigues"
	desc = "A white t-shirt with brown trousers, and a small brown satchel bag attached to it.<br>Fitted for female wastelanders."
	icon_state = "doctor_f"
	item_state = "brownjsuit"
	item_color = "doctor_f"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/mercadv //Male version
	name = "male merc adventurer outfit"
	desc = "A large leather jacket with torn-off sleeves, paired with a red sweater, a necklace with three teeth of unknown origin strung on, and a pair of brown leather pants.<br>There is also a rough leather bandolier for additional storage capacity.<br>Fitted for male wastelanders."
	icon_state = "merca_m"
	item_state = "bl_suit"
	item_color = "merca_m"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	self_weight = 3
	cloth_count = 5

/obj/item/clothing/under/f13/female/mercadv //Female version
	name = "female merc adventurer outfit"
	desc = "A large leather jacket with torn-off sleeves, paired with a midriff-revealing red and black top and a pair of brown leather pants.<br>There is also a rough leather bandolier and belt for additional storage capacity.<br>Fitted for female wastelanders."
	icon_state = "merca_f"
	item_state = "bl_suit"
	item_color = "merca_f"
	fitted = FEMALE_UNIFORM_TOP
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	self_weight = 3
	cloth_count = 5

/obj/item/clothing/under/f13/merccharm //Male version
	name = "male merc charmer outfit"
	desc = "A blue and gray outfit resembling a three piece suit, heavily stitched and reinforced with a small metal cup on the groin area.<br>Fitted for male wastelanders."
	icon_state = "mercc_m"
	item_state = "bl_suit"
	item_color = "mercc_m"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	self_weight = 3
	cloth_count = 5

/obj/item/clothing/under/f13/female/merccharm //Female version
	name = "female merc charmer outfit"
	desc = "A ripped and torn blue female business suit, it still gives ladies a rather sexy look.<br>Fitted for female wastelanders."
	icon_state = "mercc_f"
	item_state = "bl_suit"
	item_color = "mercc_f"
	fitted = FEMALE_UNIFORM_TOP
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	self_weight = 3
	cloth_count = 5

/obj/item/clothing/under/f13/mechanic
	name = "worn blue jumpsuit"
	desc = "A worn jumpsuit, made of soft-blue colored cloth, with old machine oil stains on it.<br>Long time ago it could have belonged to a repair mechanic."
	icon_state = "mechanic"
	item_state = "syndicate-blue"
	item_color = "mechanic"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/petrochico
	name = "worn green jumpsuit"
	desc = "A dark green colored jumpsuit, with white lines on its sleeves and a Petro-Chico patch sewn on the right breast."
	icon_state = "petrochico"
	item_state = "centcom"
	item_color = "petrochico"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/caravaneer
	name = "caravaneer outift"
	desc = "A striped brown shirt, with a pair of dark blue pants on suspenders.<br>That type of outfit is commonly worn by caravaneers and travelers."
	icon_state = "caravaneer"
	item_state = "syndicate-blue"
	item_color = "caravaneer"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/trader
	name = "roving trader outfit "
	desc = "An outfit commonly worn by various wastelanders, but it still looks pretty badass!"
	icon_state = "trader"
	item_state = "bl_suit"
	item_color = "trader"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/merchant
	name = "merchant outfit "
	desc = "An outfit commonly worn by various wastelanders - mostly wandering traders and merchants on the market.<br>So what do you say if I buy it from you with 10% discount?"
	icon_state = "merchant"
	item_state = "brownjsuit"
	item_color = "merchant"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/worn
	name = "worn outfit "
	desc = "A worn khaki shirt without any buttons left, and a ragged pair of jeans.<br>It may seem a bad outfit choice at first, yet there are wastelanders out there who can't afford even that."
	icon_state = "worn"
	item_state = "brownjsuit"
	item_color = "worn"
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/f13/vault
	name = "vault jumpsuit"
	desc = "The regulation clothing worn by the vault dwellers of Vault-Tec vaults. It's made of sturdy leather.<br>This particular jumpsuit has no number on the back."
	icon_state = "vault"
	item_state = "b_suit"
	item_color = "vault"
	can_adjust = 1
	cloth_count = 5

/obj/item/clothing/under/f13/vault/v13 //The Legend is here.
	name = "Vault 13 jumpsuit"
	desc = "The regulation clothing worn by the vault dwellers of Vault-Tec vaults. It's made of sturdy leather.<br>This jumpsuit has number 13 on the back."
	icon_state = "vault13"
	item_color = "vault13"

/obj/item/clothing/under/f13/vault/v113
	name = "Vault 113 jumpsuit"
	desc = "The regulation clothing worn by the vault dwellers of Vault-Tec vaults. It's made of sturdy leather.<br>This jumpsuit has number 113 on the back."
	icon_state = "vault113"
	item_color = "vault113"

/obj/item/clothing/under/f13/vault/v21
	name = "Vault 21 jumpsuit"
	desc = "The regulation clothing worn by the vault dwellers of Vault-Tec vaults. It's made of sturdy leather.<br>This jumpsuit has number 21 on the back."
	icon_state = "vault21"
	item_color = "vault21"

/obj/item/clothing/under/f13/vault/v42
	name = "Vault 42 jumpsuit"
	desc = "The regulation clothing worn by the vault dwellers, of Vault-Tec vaults built to solve the Ultimate Question of life, Universe, and everything. It's made of sturdy leather.<br>This jumpsuit has number 42 on the back."
	icon_state = "vault42"
	item_color = "vault42"

/obj/item/clothing/under/f13/followers
	name = "followers outfit "
	desc = "A white shirt with a pair of dark brown cargo pants - an outfit commonly worn by Followers of the Apocalypse.<br><i>Nihil boni sine labore.</i>"
	icon_state = "followers"
	item_state = "bar_suit"
	item_color = "followers"
	cloth_count = 5
	allowed = list(/obj/item/weapon/scalpel, /obj/item/weapon/surgical_drapes, /obj/item/weapon/cautery, /obj/item/weapon/hemostat, /obj/item/weapon/retractor)
	can_adjust = 0

/obj/item/clothing/under/f13/combat
	name = "combat uniform"
	desc = "An ancient combat uniform, that went out of use around the time of the Great War."
	icon_state = "combat"
	item_state = "bl_suit"
	item_color = "combat"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/enclave_officer
	name = "officer uniform"
	desc = "A standard Enclave officer uniform.<br>The outer layer is made of a sturdy material designed to withstand the harsh conditions of the wasteland."
	icon_state = "enclave_o"
	item_state = "bl_suit"
	item_color = "enclave_o"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 10, laser = 10, energy = 10, bomb = 0, bio = 10, rad = 10, fire = 0, acid = 0)
	can_adjust = 0
	self_weight = 3

/obj/item/clothing/under/f13/ncr_officer
	name = "officer uniform"
	desc = "A standard NCR officer uniform.<br>Embroided New California Republic flag patches adorn both sleeves."
	icon_state = "ncr_o"
	item_state = "lb_suit"
	item_color = "ncr_o"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	self_weight = 3

/obj/item/clothing/under/f13/ncr
	name = "overcoat"
	desc = "A regular NCR uniform that consists of khaki field jacket with bellowed hip pockets and khaki breeches."
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	icon_state = "overcoat"
	item_state = "lb_suit"
	item_color = "overcoat"
	can_adjust = 1

/obj/item/clothing/under/f13/ncr/torn
	name = "torn overcoat"
	desc = "Some time ago it looked like a regular NCR uniform, but now it looks like a total mess of ripped cloth."
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	icon_state = "tornovercoat"
	item_color = "tornovercoat"
	can_adjust = 0

/obj/item/clothing/under/f13/general
	name = "general overcoat"
	desc = "A grim looking overcoat - preferable standard for General commander of New California Republic.<br>It's decorated with golden stars, and an insignia plaque that adorns the left side."
	icon_state = "general"
	item_state = "lb_suit"
	item_color = "general"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	self_weight = 3

/obj/item/clothing/under/f13/recon
	name = "recon armor"
	desc = "Intended to serve as the under-armor of the T-45d power armor, the recon armor is a vacuum-sealed asbestos jumpsuit covering the entire body.<br>Attached to it is the interface and mounts for the power armor.<br>Its purpose is twofold - it allows the user to actually operate the armor and protect soft tissue from moving parts inside the suit and heat."
	icon_state = "recon"
	item_state = "rig_suit"
	item_color = "recon"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HEAD
	flags_inv = HIDEHAIR
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HEAD
	can_adjust = 0
	self_weight = 5

//Fluff

/obj/item/clothing/under/f13/cyberpunk
	name = "cyberpunk suit"
	desc = "You never asked for anything that stylish."
	icon_state = "jensen"
	item_state = "jensensuit"
	item_color = "jensen"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)
	can_adjust = 0

/obj/item/clothing/under/f13/agent47
	name = "mysterious suit"
	desc = "This dark suit was made by a blind man named Tommy, who ran a tailor shop in the ruins of Old Chicago.<br>It seems to be reinforced with an unknown material."
	icon_state = "agent47"
	item_state = "lawyer_black"
	item_color = "agent47"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 10, laser = 10, energy = 10, bomb = 50, bio = 10, rad = 10, fire = 10, acid = 10)
	can_adjust = 0

/obj/item/clothing/under/f13/psychologist
	name = "psychologist's turtleneck"
	desc = "A turqouise turtleneck and a pair of dark blue slacks, belonging to a psychologist."
	icon_state = "psychturtle"
	item_state = "b_suit"
	item_color = "psychturtle"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/villain //Doubles as Gang Leader primary uniform for extra villainy
	name = "green and black suit"
	desc = "There is something evil in this suit, only a villain would wear something like that."
	icon_state = "villain"
	item_state = "syndicate-green"
	item_color = "villain"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = -10, bullet = -10, laser = -10, energy = -10, bomb = -10, bio = -10, rad = -10, fire = -10, acid = -10) //Because dying is fun. Especially for evil masterminds.
	can_adjust = 0

/obj/item/clothing/under/f13/gentlesuit
	name = "gentlemans suit"
	desc = "A silk black shirt with a white tie and a matching gray vest and slacks. Feels proper."
	icon_state = "gentlesuit"
	item_state = "gy_suit"
	item_color = "gentlesuit"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 0, fire = 0, acid = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/dispatch
	name = "dispatcher's uniform"
	desc = "A dress shirt and khakis with a security patch sewn on."
	icon_state = "dispatch"
	item_state = "lb_suit"
	item_color = "dispatch"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/detectivealt
	name = "fancy detective suit"
	desc = "An immaculate white dress shirt, paired with a pair of fancy black dress pants, a red tie, and a charcoal vest."
	icon_state = "detectivealt"
	item_state = "bl_suit"
	item_color = "detectivealt"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS
	armor = list(melee = 20, bullet = 20, laser = -10, energy = -10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 1

/obj/item/clothing/under/f13/rdalt
	name = "head researcher uniform"
	desc = "A suit and slacks stained with hard work and dedication to science. Perhaps other things as well, but mostly hard work and dedication."
	icon_state = "rdalt"
	item_state = "lb_suit"
	item_color = "rdalt"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 20, rad = 0, fire = 0, acid = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/hopalt
	name = "head of personnel's suit"
	desc = "A blue jacket and red tie, with matching red cuffs! Snazzy. Wearing this makes you feel more important than your job title does."
	icon_state = "hopalt"
	item_state = "b_suit"
	item_color = "hopalt"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = -10, bullet = 0, laser = 20, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/roboticistalt
	name = "roboticist's jumpsuit"
	desc = "A slimming black with bright reinforced orange seams; great for industrial work."
	icon_state = "roboticsalt"
	item_state = "jensensuit"
	item_color = "roboticsalt"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 0, bullet = 0, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 1

/obj/item/clothing/under/f13/bartenderalt
	name = "fancy bartender's uniform"
	desc = "A rather fancy uniform for a real professional."
	icon_state = "barmanalt"
	item_state = "bl_suit"
	item_color = "barmanalt"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 0, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 10, rad = 0, fire = 0, acid = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/manager
	name = "manager suit"
	desc = "A good choice for an average corporate manager."
	icon_state = "manager"
	item_state = "bar_suit"
	item_color = "manager"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 5, bullet = -20, laser = 0, energy = 0, bomb = 0, bio = 5, rad = 0, fire = 0, acid = 0)
	can_adjust = 1

/obj/item/clothing/under/f13/spaceship
	name = "crewman uniform"
	desc = "The insignia on this uniform tells you that this uniform belongs to some sort of crewman."
	icon_state = "spaceship_crewman"
	item_state = "syndicate-black-red"
	item_color = "spaceship_crewman"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 0, bullet = 0, laser = 5, energy = 5, bomb = 0, bio = 5, rad = 10, fire = 0, acid = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/spaceship/officer
	name = "officer uniform"
	desc = "The insignia on this uniform tells you that this uniform belongs to some sort of officer."
	icon_state = "spaceship_officer"
	item_color = "spaceship_officer"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 10, fire = 0, acid = 0)

/obj/item/clothing/under/f13/spaceship/captain
	name = "captain uniform"
	desc = "The insignia on this uniform tells you that this uniform belongs to some sort of captain."
	icon_state = "spaceship_captain"
	item_color = "spaceship_captain"
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10, fire = 0, acid = 0)

//Female clothing! It's not misogyny, yet dresses shall be separate from /f13/ as Fallout build has its own female subtype.

/obj/item/clothing/under/female
	icon = 'icons/fallout/clothing/uniforms.dmi'
	self_weight = 2

/obj/item/clothing/under/female/nursesuit
	desc = "A jumpsuit commonly worn by nursing staff in the medical department."
	name = "nurse's suit"
	icon_state = "nursesuit"
	item_state = "w_suit"
	item_color = "nursesuit"
	permeability_coefficient = 0.50
	cloth_count = 5
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 10, rad = 0, fire = 0, acid = 0)
	fitted = NO_FEMALE_UNIFORM
	can_adjust = 0

/obj/item/clothing/under/female/wedding
	name = "wedding dress"
	desc = "If you see this, make a screenshot and report for shitspawn."
	icon_state = "bride_orange"
	item_state = "rad_suit"
	item_color = "bride_orange"
	can_adjust = 0
	fitted = FEMALE_UNIFORM_TOP
	cloth_count = 5
	body_parts_covered = CHEST|GROIN|LEGS
	flags_inv = HIDESHOES //IT DOESN'T HIDE SHOES! Someone. Pls. Help.

/obj/item/clothing/under/female/wedding/bride_orange
	name = "orange wedding dress"
	desc = "A big and puffy orange dress."
	icon_state = "bride_orange"
	item_state = "rad_suit"
	item_color = "bride_orange"

/obj/item/clothing/under/female/wedding/bride_purple
	name = "purple wedding dress"
	desc = "A big and puffy purple dress."
	icon_state = "bride_purple"
	item_state = "p_suit"
	item_color = "bride_purple"

/obj/item/clothing/under/female/wedding/bride_blue
	name = "blue wedding dress"
	desc = "A big and puffy blue dress."
	icon_state = "bride_blue"
	item_state = "b_suit"
	item_color = "bride_blue"

/obj/item/clothing/under/female/wedding/bride_red
	name = "red wedding dress"
	desc = "A big and puffy red dress."
	icon_state = "bride_red"
	item_state = "r_suit"
	item_color = "bride_red"

/obj/item/clothing/under/female/wedding/bride_white
	name = "silky wedding dress"
	desc = "A white wedding gown made from the finest silk."
	icon_state = "bride_white"
	item_state = "w_suit"
	item_color = "bride_white"
	body_parts_covered = CHEST|GROIN

/obj/item/clothing/under/female/queen
	name = "royal purple dress"
	desc = "A splender purple dress, made of silk. It's decorated with golden necklace."
	icon_state = "queen_dress"
	item_state = "p_suit"
	item_color = "queen_dress"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0
	cloth_count = 9

/obj/item/clothing/under/female/blackskirt
	name = "black skirt"
	desc = "A black skirt, very fancy!"
	icon_state = "blackskirt"
	item_color = "blackskirt"
	item_state = "bl_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/female/blackskirt/blueskirt
	name = "blue skirt"
	desc = "A blue, casual skirt."
	icon_state = "blueskirt"
	item_color = "blueskirt"
	item_state = "b_suit"

/obj/item/clothing/under/female/blackskirt/redskirt
	name = "red skirt"
	desc = "A red, casual skirt."
	icon_state = "redskirt"
	item_color = "redskirt"
	item_state = "r_suit"

/obj/item/clothing/under/female/blackskirt/purpleskirt
	name = "purple skirt"
	desc = "A purple, casual skirt."
	icon_state = "purpleskirt"
	item_color = "purpleskirt"
	item_state = "p_suit"

/obj/item/clothing/under/female/schoolgirl
	name = "blue schoolgirl uniform"
	desc = "It's just like one of my Japanese animes!"
	icon_state = "schoolgirl"
	item_state = "schoolgirl"
	item_color = "schoolgirl"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0
	cloth_count = 5

/obj/item/clothing/under/female/schoolgirl/red
	name = "red schoolgirl uniform"
	icon_state = "schoolgirlred"
	item_state = "schoolgirlred"
	item_color = "schoolgirlred"

/obj/item/clothing/under/female/schoolgirl/green
	name = "green schoolgirl uniform"
	icon_state = "schoolgirlgreen"
	item_state = "schoolgirlgreen"
	item_color = "schoolgirlgreen"

/obj/item/clothing/under/female/schoolgirl/orange
	name = "orange schoolgirl uniform"
	icon_state = "schoolgirlorange"
	item_state = "schoolgirlorange"
	item_color = "schoolgirlorange"

/obj/item/clothing/under/female/sexyclown
	name = "sexy-clown suit"
	desc = "It makes you look HONKable!"
	icon_state = "sexyclown"
	item_state = "sexyclown"
	item_color = "sexyclown"
	body_parts_covered = CHEST|GROIN|LEGS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/sexymime
	name = "sexy mime outfit"
	desc = "The only time when you DON'T enjoy looking at someone's rack."
	icon_state = "sexymime"
	item_state = "sexymime"
	item_color = "sexymime"
	body_parts_covered = CHEST|GROIN|LEGS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/sundress
	name = "sundress"
	desc = "Makes you want to frolic in a field of daisies."
	icon_state = "sundress"
	item_state = "sundress"
	item_color = "sundress"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/hosparadefem
	name = "head of security's parade uniform"
	desc = "A female head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_fem"
	item_state = "r_suit"
	item_color = "hos_parade_fem"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/dress_rd
	name = "research director dress uniform"
	desc = "Feminine fashion for the style concious RD.<br>Its fabric provides minor protection from biological contaminants."
	icon_state = "dress_rd"
	item_state = "lb_suit"
	item_color = "dress_rd"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 20, rad = 0, fire = 10, acid = 10)
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0
	alt_covers_chest = 1

/obj/item/clothing/under/female/roboticist
	desc = "Female variant of badass jumpsuit - great for industrial work."
	name = "female roboticist's jumpsuit"
	icon_state = "roboticsf"
	item_state = "jensensuit"
	item_color = "roboticsf"

/obj/item/clothing/under/female/blacktango
	name = "black tango dress"
	desc = "Filled with Latin fire."
	icon_state = "black_tango"
	item_state = "wcoat"
	item_color = "black_tango"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/stripeddress
	name = "striped dress"
	desc = "Fashion in space."
	icon_state = "striped_dress"
	item_state = "stripeddress"
	item_color = "striped_dress"
	fitted = FEMALE_UNIFORM_FULL
	can_adjust = 0

/obj/item/clothing/under/female/sailordress
	name = "sailor dress"
	desc = "Formal wear for a leading lady."
	icon_state = "sailor_dress"
	item_state = "sailordress"
	item_color = "sailor_dress"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/redeveninggown
	name = "red evening gown"
	desc = "Fancy dress for space bar singers."
	icon_state = "red_evening_gown"
	item_state = "redeveninggown"
	item_color = "red_evening_gown"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/maid
	name = "maid costume"
	desc = "Maid in China."
	icon_state = "maid"
	item_state = "maid"
	item_color = "maid"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/janimaid
	name = "maid uniform"
	desc = "A simple maid uniform for housekeeping."
	icon_state = "janimaid"
	item_state = "janimaid"
	item_color = "janimaid"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/plaid_skirt
	name = "red plaid skirt"
	desc = "A preppy red skirt with a white blouse."
	icon_state = "plaid_red"
	item_state = "plaid_red"
	item_color = "plaid_red"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 1
	alt_covers_chest = 1

/obj/item/clothing/under/female/plaid_skirt/green
	name = "green plaid skirt"
	desc = "A preppy green skirt with a white blouse."
	icon_state = "plaid_green"
	item_state = "plaid_green"
	item_color = "plaid_green"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 1
	alt_covers_chest = 1

/obj/item/clothing/under/female/plaid_skirt/blue
	name = "blue plaid skirt"
	desc = "A preppy blue skirt with a white blouse."
	icon_state = "plaid_blue"
	item_state = "plaid_blue"
	item_color = "plaid_blue"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 1
	alt_covers_chest = 1

/obj/item/clothing/under/female/plaid_skirt/purple
	name = "purple plaid skirt"
	desc = "A preppy purple skirt with a white blouse."
	icon_state = "plaid_purple"
	item_state = "plaid_purple"
	item_color = "plaid_purple"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 1
	alt_covers_chest = 1

/obj/item/clothing/under/female/dress_black
	name = "black skirt"
	desc = "An official black skirt. Can look quite sexy though."
	icon_state = "dress_black"
	item_state = "bl_suit"
	item_color = "dress_black"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 1
	alt_covers_chest = 1

/obj/item/clothing/under/female/dress_orange
	name = "orange dress"
	desc = "A fancy orange gown for those who like to show leg."
	icon_state = "dress_orange"
	item_state = "rad_suit"
	item_color = "dress_orange"
	body_parts_covered = CHEST
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/dress_yellow
	name = "yellow dress"
	desc = "Rather bright and somewhat ugly yellow dress."
	icon_state = "dress_yellow"
	item_state = "y_suit"
	item_color = "dress_yellow"
	body_parts_covered = CHEST
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/dress_hr
	name = "human resources director uniform"
	desc = "Superior class for the nosy H.R. Director."
	icon_state = "huresource"
	item_state = "rad_suit"
	item_color = "huresource"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/blackjumpskirt
	name = "black jumpskirt"
	desc = "A black jumpskirt, Sol size 0."
	icon_state = "blackjumpskirt"
	item_state = "bl_suit"
	item_color = "blackjumpskirt"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/dress_saloon
	name = "saloon girl dress"
	desc = "An old western inspired gown for the girl who likes to drink."
	icon_state = "dress_saloon"
	item_state = "r_suit"
	item_color = "dress_saloon"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/cheongsam
	name = "white cheongsam"
	desc = "A white cheongsam dress."
	icon_state = "cheongsam"
	item_state = "cheongsam"
	item_color = "cheongsam"
	body_parts_covered = CHEST|GROIN|LEGS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0