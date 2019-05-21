//Fallout 13 general drinks directory

/obj/item/weapon/reagent_containers/food/drinks/bottle/sunset //Howdy, pardner!
	name = "Sunset Sarsaparilla"
	desc = "A traditional radiation-free carbonated beverage of a root-beer-type.<br>Tastes like sunshine!"
	icon_state = "sunset"
	item_state = "beer"
	materials = list(MAT_GLASS=500)
	icon = 'icons/fallout/objects/food&drinks/drinks.dmi'
	list_reagents = list("beer" = 10, "mannitol" = 10, "potass_iodide" = 10)

/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola //It's actually a coffee...
	name = "Nuka-Cola"
	desc = "The most popular flavored soft drink in the United States before the Great War.<br>It was preserved in a fairly pristine state."
	icon_state = "nukacola"
	item_state = "beer"
	materials = list(MAT_GLASS=500)
	icon = 'icons/fallout/objects/food&drinks/drinks.dmi'
	list_reagents = list("coffee" = 30)

/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola/radioactive //Whoa, oh, oh, oh, oh, whoa, oh, oh, oh, I'm radioactive, radioactive!
	desc = "The most popular flavored soft drink in the United States before the Great War.<br>It was preserved in a fairly pristine state.<br>The bottle is slightly glowing."
	list_reagents = list("coffee" = 25, "radium" = 5)

/obj/item/weapon/reagent_containers/food/drinks/flask
	name = "metal flask"
	desc = "A metallic liquid container. Never leave home without one."
	icon_state = "flask"
	icon = 'icons/fallout/objects/food&drinks/drinks.dmi'
	materials = list(MAT_METAL=500)
	volume = 60
	list_reagents = list("water" = 50)
	self_weight = 0.3

/obj/item/weapon/reagent_containers/food/drinks/flask/survival
	name = "metal flask"
	desc = "A metallic liquid container. Essential for survival out in the wastes."
	list_reagents = list("water" = 40, "silver_sulfadiazine" = 10)

/obj/item/weapon/reagent_containers/food/drinks/flask/vault13
	name = "Vault 13 flask"
	desc = "Take a sip from your trusty Vault 13 canteen."
	icon_state = "flask13"
	list_reagents = list("water" = 30, "silver_sulfadiazine" = 10, "charcoal" = 20)

/obj/item/weapon/reagent_containers/food/drinks/flask/vault113
	name = "Vault 113 flask"
	desc = "See this large yellow number? It means it's a Vault 113 canteen. Never forget."
	icon_state = "flask113"
	list_reagents = list("water" = 30, "radium" = 10, "mine_salve" = 20)

/obj/item/weapon/reagent_containers/food/drinks/flask/ss13
	name = "metal flask"
	desc = "A strange metal flask with some meaningless letters engraved on the side."
	icon_state = "flaskss13"
	list_reagents = list("tricordrazine" = 40, "adminordrazine" = 10)
