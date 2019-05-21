//Fallout 13 general food directory

//WASTELAND MEATS

/obj/item/weapon/reagent_containers/food/snacks/meat/slab/gecko
	name = "gecko fillet"
	desc = "A tasty fillet of gecko meat.<br>If you cook it, it tastes like chicken!"
	icon_state = "fishfillet"
	list_reagents = list("nutriment" = 6, "carpotoxin" = 1, "vitamin" = 2)
	bitesize = 2 //Smaller animal
	filling_color = "#FA8072"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/meat/steak/gecko
	slice_path = null

/obj/item/weapon/reagent_containers/food/snacks/meat/slab/molerat
	name = "molerat meat"
	desc = "A slab of smelly molerat meat."
	list_reagents = list("nutriment" = 3, "carpotoxin" = 3)
	bitesize = 3
	filling_color = "#FA8072"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/meat/steak/molerat
	slice_path = null

/obj/item/weapon/reagent_containers/food/snacks/meat/slab/wolf
	name = "dog meat"
	desc = "Some Asians love this stuff.<br>It does not taste too bad actually."
	list_reagents = list("nutriment" = 6, "vitamin" = 2)
	bitesize = 4 //Average animal
	filling_color = "#FA8072"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/meat/steak/wolf
	slice_path = null

/obj/item/weapon/reagent_containers/food/snacks/meat/slab/deathclaw
	name = "deathclaw meat"
	desc = "A slab of hard but delicious deathclaw meat."
	list_reagents = list("nutriment" = 9, "vitamin" = 9)
	bitesize = 6 //Big slabs of meat from a massive creature
	filling_color = "#FA8072"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/meat/steak/deathclaw
	slice_path = null

//WASTELAND STEAKS

/obj/item/weapon/reagent_containers/food/snacks/meat/steak/gecko
	name = "gecko steak"
	desc = "A delicious steak made of finest gecko meat.<br>Tastes like chicken!"

/obj/item/weapon/reagent_containers/food/snacks/meat/steak/molerat
	name = "molerat steak"
	desc = "A smelly molerat steak.<br>What did you expect from roasted mutant rodent meat?"

/obj/item/weapon/reagent_containers/food/snacks/meat/steak/wolf
	name = "dog steak"
	desc = "A dog steak does not look attractive, but some people eat worse things when it comes to survival.<br>What did you expect from roasted dog?"

/obj/item/weapon/reagent_containers/food/snacks/meat/steak/deathclaw
	name = "deathclaw steak"
	desc = "A piece of hot spicy meat, eaten by only the most worthy hunters - or the most rich clients."
	list_reagents = list("nutriment" = 10)
	bonus_reagents = list("nutriment" = 5, "vitamin" = 10) //It wouldn't make sense for it to be worse than the normal

//WASTELAND JUNK FOOD

/obj/item/weapon/reagent_containers/food/snacks/f13
	name = "ERROR"
	desc = "Badmins spawn shit!"
	icon = 'icons/fallout/objects/food&drinks/food.dmi'

/obj/item/weapon/reagent_containers/food/snacks/f13/bubblegum
	name = "Bubblegum"
	desc = "A Big Pops branded bubblegum."
	icon_state = "bubblegum"
	bonus_reagents = list("radium" = 2, "vitamin" = 1)
	list_reagents = list("nutriment" = 2, "sugar" = 2)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/bubblegum

/obj/item/weapon/reagent_containers/food/snacks/f13/bubblegum/large
	name = "big Bubblegum"
	desc = "A large \"Extra\" Big Pops branded bubblegum."
	icon_state = "bubblegum_large"
	bonus_reagents = list("radium" = 4, "vitamin" = 2)
	list_reagents = list("nutriment" = 4, "sugar" = 4)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/bubblegum_large

/obj/item/weapon/reagent_containers/food/snacks/f13/cram
	name = "Cram"
	desc = "A blue labeled tin of processed meat, primarily used as rations for soldiers during the pre-War times."
	icon_state = "cram"
	bonus_reagents = list("radium" = 2, "vitamin" = 5)
	list_reagents = list("nutriment" = 20)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/cram

/obj/item/weapon/reagent_containers/food/snacks/f13/cram/large
	name = "big Cram"
	desc = "A large blue labeled tin of processed meat, primarily used as rations for soldiers during the pre-War times."
	icon_state = "cram_large"
	bonus_reagents = list("radium" = 2, "vitamin" = 10)
	list_reagents = list("nutriment" = 40)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/cram_large

/obj/item/weapon/reagent_containers/food/snacks/f13/yumyum
	name = "YumYum"
	desc = "YumYum was a pre-War company in the United States, producing packaged foods.<br>YumYum Deviled Eggs was their major product."
	icon_state = "yumyum"
	bonus_reagents = list("radium" = 2, "vitamin" = 2)
	list_reagents = list("nutriment" = 10)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/yumyum

/obj/item/weapon/reagent_containers/food/snacks/f13/fancylads
	name = "Fancy Lads"
	desc = "The presence of snack cakes is a nod to the urban myth that Twinkies and other similar foods would survive a nuclear war.<br>The slogan is \"A big delight in every bite\"."
	icon_state = "fancylads"
	bonus_reagents = list("radium" = 2, "vitamin" = 1)
	list_reagents = list("nutriment" = 20)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/fancylads

/obj/item/weapon/reagent_containers/food/snacks/f13/sugarbombs
	name = "Sugar Bombs"
	desc = "Sugar Bombs is a pre-War breakfast cereal that can be found all around the wasteland, packaged in white and blue boxes with a red ovoid logo at the top, fully labeled as \"Sugar Bombs breakfast cereal\"."
	icon_state = "sugarbombs"
	bonus_reagents = list("radium" = 2, "vitamin" = 2)
	list_reagents = list("nutriment" = 10, "sugar" = 10)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/sugarbombs

/obj/item/weapon/reagent_containers/food/snacks/f13/crisps
	name = "Crisps"
	desc = "Potato Crisps are packaged in a small red and green box, with a yellow bubble encouraging the purchaser to \"See Moon Map Offer on Back!\"."
	icon_state = "crisps"
	bonus_reagents = list("radium" = 2, "vitamin" = 1)
	list_reagents = list("nutriment" = 5)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/crisps

/obj/item/weapon/reagent_containers/food/snacks/f13/steak
	name = "Salisbury Steak"
	desc = "A worn, red box displaying a picture of steak with the words \"Salisbury Steak\" at the top and \"now with Gravy!\" at the bottom."
	icon_state = "steak"
	bonus_reagents = list("radium" = 2, "vitamin" = 5)
	list_reagents = list("nutriment" = 50)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/steak

/obj/item/weapon/reagent_containers/food/snacks/f13/specialapples
	name = "Dandy Apples Special"
	desc = "Dandy Apples Special are a product from the pre-War company Dandy Boy. On the sides of the box there is some sort of apple mascot with a bowler hat, monocle and mustache."
	icon_state = "specialapples"
	bonus_reagents = list("radium" = 2, "vitamin" = 2)
	list_reagents = list("nutriment" = 10, "tricordrazine" = 10)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/specialapples

/obj/item/weapon/reagent_containers/food/snacks/f13/dandyapples
	name = "Dandy Boy Apples"
	desc = "Dandy Boy Apples are a product from the pre-War company Dandy Boy, consisting of candied apples packaged in a red cardboard box."
	icon_state = "dandyapples"
	bonus_reagents = list("radium" = 2, "vitamin" = 2)
	list_reagents = list("nutriment" = 10, "sugar" = 10)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/dandyapples

/obj/item/weapon/reagent_containers/food/snacks/f13/blamco
	name = "BlamCo"
	desc = "BlamCo was a pre-War company in the United States, producing packaged foods.<br>BlamCo Mac & Cheese was their major product.<br>Unlike other foods, like apples or eggs, wheat cannot be freeze-dried. How the macaroni remains edible is unclear."
	icon_state = "blamco"
	bonus_reagents = list("radium" = 2, "vitamin" = 2)
	list_reagents = list("nutriment" = 15)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/blamco

/obj/item/weapon/reagent_containers/food/snacks/f13/blamco/large
	name = "big BlamCo"
	desc = "BlamCo was a pre-War company in the United States, producing packaged foods.<br>BlamCo Mac & Cheese was their major product.<br>Unlike other foods, like apples or eggs, wheat cannot be freeze-dried. How the macaroni remains edible is unclear."
	icon_state = "blamco_large"
	bonus_reagents = list("radium" = 4, "vitamin" = 4)
	list_reagents = list("nutriment" = 30)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/blamco_large

/obj/item/weapon/reagent_containers/food/snacks/f13/mechanic
	name = "MechaMash"
	desc = "MechaMash is packaged in a white box with blue highlights, and a wrench logo printed on the front.<br>It appears to be a form of instant potatoes that smells like WD-40..."
	icon_state = "mechanist"
	bonus_reagents = list("radium" = 2, "vitamin" = 3)
	list_reagents = list("nutriment" = 15)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/mechanist

/obj/item/weapon/reagent_containers/food/snacks/f13/instamash
	name = "InstaMash"
	desc = "InstaMash is packaged in a white box with blue highlights.<br>It appears to be a form of instant potatoes."
	icon_state = "instamash"
	bonus_reagents = list("radium" = 2, "vitamin" = 2)
	list_reagents = list("nutriment" = 15)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/instamash

/obj/item/weapon/reagent_containers/food/snacks/f13/porknbeans
	name = "Pork n' Beans"
	desc = "Pork n' Beans come in a small brown and orange tin, with a label that reads \"Greasy Prospector Improved Pork And Beans\".<br>Toward the bottom of the label is printed that the beans come \"With Hickory Smoked Pig Fat Chunks\"."
	icon_state = "porknbeans"
	bonus_reagents = list("radium" = 1, "vitamin" = 2)
	list_reagents = list("nutriment" = 35)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/porknbeans

/obj/item/weapon/reagent_containers/food/snacks/f13/borscht
	name = "canned borscht"
	desc = "A faded label says something in Cyrillic, but you can't understand a thing.<br>\"KOHCEPBA BKYCHOTA TOMAT CMETAHA MOCKBA\"<br>\"cynep cyn!\"<br>An image of a plate with some red soup explains a lot."
	icon_state = "borscht"
	bonus_reagents = list("radium" = 1, "vitamin" = 3)
	list_reagents = list("nutriment" = 35)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/borscht

/obj/item/weapon/reagent_containers/food/snacks/f13/dog //Max Rockatansky favorite
	name = "dog food"
	desc = "A can of greasy meat with a faded cartoon dog on the label.<br>Smells bad, tastes worse, but filling.<br>Not good enough to get bitten over, though." //Mad Max: Road Warrior 1981 dog food scene reference
	icon_state = "dog"
	bonus_reagents = list("radium" = 1, "vitamin" = 3)
	list_reagents = list("nutriment" = 35)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/dog

/obj/item/weapon/reagent_containers/food/snacks/f13/mre
	name = "MRE"
	desc = "The Meal, Ready-to-Eat : commonly known as the MRE - is a self-contained, individual field ration in lightweight packaging.<br>It's commonly used by military groups for service members to use in combat or other field conditions where organized food facilities are not available."
	icon_state = "mre"
	bonus_reagents = list("silver_sulfadiazine" = 10, "tricordrazine" = 10, "vitamin" = 2)
	list_reagents = list("nutriment" = 30)
	filling_color = "#B22222"
	trash = /obj/item/trash/f13/mre

/obj/item/weapon/reagent_containers/food/snacks/f13/galette
	name = "dehydrated pea soup"
	desc = "A piece of military food ration.<br>Faded label on the front says: \"Dehydrated peas. Chew well, take with water. 60g.\""
	icon_state = "galette"
	bonus_reagents = list("sodiumchloride" = 2, "sugar" = 2, "tricordrazine" = 2)
	list_reagents = list("nutriment" = 10)
	filling_color = "#B22222"

//Grownable

/obj/item/weapon/reagent_containers/food/snacks/grown/broc
	seed = /obj/item/seeds/broc
	name = "broc flower"
	desc = "Broc flower grows on broc plants and can be used in the crafting of healing powder and stimpaks due to its mild healing properties."
	icon_state = "broc"
	icon = 'icons/fallout/objects/food&drinks/grown.dmi'
	//slot_flags = SLOT_HEAD
	filling_color = "#FF6347"

/obj/item/weapon/reagent_containers/food/snacks/grown/xander
	seed = /obj/item/seeds/xander
	name = "xander root"
	desc = "Xander root is a large, turnip-like root with mild healing properties.<br>It can easily be identified by its exposed head and tall green stalk protruding from a raised ring of dirt, resembling an onion.<br>Once collected, xander root can be used in the crafting of both healing powder and stimpaks."
	icon_state = "xander"
	icon = 'icons/fallout/objects/food&drinks/grown.dmi'
	filling_color = "#FF6347"

/obj/item/weapon/reagent_containers/food/snacks/grown/mutfruit
	seed = /obj/item/seeds/mutfruit
	name = "mutfruit"
	desc = "Mutfruit provides both hydration and sustenance, and provides them at moderately higher levels than other fruits.<br>Be aware though - it gives a small amount of radiation to those who consume it."
	icon_state = "mutfruit"
	icon = 'icons/fallout/objects/food&drinks/grown.dmi'
	filling_color = "#FF6347"

/obj/item/weapon/reagent_containers/food/snacks/grown/ferocactus
	seed = /obj/item/seeds/ferocactus
	name = "barrel cactus fruit"
	desc = "Barrel cactus fruit are found on ferocactus - a spherical cacti that can be encountered all over the wasteland.<br>They usually form in groups, with one large barrel cactus that contains the fruit surrounded by several smaller cacti."
	icon_state = "cactusfruit"
	icon = 'icons/fallout/objects/food&drinks/grown.dmi'
	filling_color = "#FF6347"

/obj/item/weapon/reagent_containers/food/snacks/grown/shroom
	seed = /obj/item/seeds/shroom
	name = "shroom"
	desc = "An edible mushroom which has the ability to decrease radiation levels."
	icon_state = "shroom"
	icon = 'icons/fallout/objects/food&drinks/grown.dmi'
	filling_color = "#FF6347"

/obj/item/weapon/reagent_containers/food/snacks/grown/glow
	seed = /obj/item/seeds/glow
	name = "glowing fungus"
	desc = "A cluster of small green mushrooms that exhibit a faint luminescence.<br>The fungus usually thrives in humid and radioactive locations, either on the floors of underground caves, or around pools of irradiated water."
	icon_state = "glow"
	icon = 'icons/fallout/objects/food&drinks/grown.dmi'
	filling_color = "#FF6347"

/obj/item/weapon/reagent_containers/food/snacks/grown/agave
	seed = /obj/item/seeds/agave
	name = "agave"
	desc = "Strange grass. Looks safe."
	icon_state = "agave"
	icon = 'icons/fallout/objects/food&drinks/grown.dmi'