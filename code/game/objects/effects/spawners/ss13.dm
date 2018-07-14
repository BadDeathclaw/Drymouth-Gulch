/*Devs read notes so you know what you are doing*/
//1 Object spawners, !.1 Medical Spawns, 1.2 Surgical Spawns, 1.3 Bloodpacks, 1.4 Vault Medical, 1.5 Wasteland Medical,
//1.6 Weapon Spawners , 1.7 Ammo Spawners, 1.8 Armor Spawners
obj
	spawners
		icon=null
		density=0
		alpha=0
		objectspawners //1
			medicalspawn //1.1
				surgical //1.2
					New()
						switch(rand(1,10))//get a random num between 1 and 10 inside a switch proc set the ifs bellow that
							if(1)
								var/obj/item/hemostat/lb = new //creates a new copy of the item
								lb.loc=src.loc //sets the location of the item to the location of the spawner
								del src //deletes the spawner
							if(2)
								var/obj/item/surgicaldrill/lb = new
								lb.loc=src.loc
								del src
							if(3)
								var/obj/item/retractor/lb = new
								lb.loc=src.loc
								del src
							if(4)
								var/obj/item/cautery/lb = new
								lb.loc=src.loc
								del src
							if(5)
								var/obj/item/scalpel/lb = new
								lb.loc=src.loc
								del src
							if(6)
								var/obj/item/clothing/suit/apron/surgical/lb = new
								lb.loc=src.loc
								del src
							if(7)
								var/obj/item/clothing/gloves/color/latex/lb = new
								lb.loc=src.loc
								del src
							if(8)
								var/obj/item/clothing/mask/surgical/lb = new
								lb.loc=src.loc
								del src
							if(9)
								var/obj/item/surgical_drapes/lb = new
								lb.loc=src.loc
								del src
							if(10)
								var/obj/item/circular_saw/lb = new
								lb.loc=src.loc
								del src
					bloodpack //1.3
						New()
							switch(rand(1,1))
								if(1)
									var/obj/item/reagent_containers/blood/random/lb = new
									lb.loc=src.loc
									del src

				vault //1.4
					equipment
						New()
							switch(rand(1,2))
								if(1)
									var/obj/item/gun/medbeam/lb = new
									lb.loc=src.loc
									del src
								if(2)
									var/obj/item/defibrillator/loaded/lb = new
									lb.loc=src.loc
									del src
					meds
						New()
							switch(rand(1,5))
								if(1)
									var/obj/item/reagent_containers/hypospray/medipen/stimpak/lb = new
									lb.loc=src.loc
									del src
								if(2)
									var/obj/item/storage/pill_bottle/radx/lb = new
									lb.loc=src.loc
									del src
								if(3)
									var/obj/item/reagent_containers/blood/radaway/lb = new
									lb.loc=src.loc
									del src
								if(4)
									var/obj/item/storage/pill_bottle/mentats/lb = new
									lb.loc=src.loc
									del src
								if(5)
									var/obj/item/storage/pill_bottle/fixer/lb = new
									lb.loc=src.loc
									del src
						drugs
				wasteland //1.5
					equipment
					meds
						New()
							switch(rand(1,5))
								if(1)
									var/obj/item/reagent_containers/pill/patch/healingpowder/lb = new
									lb.loc=src.loc
									del src
								if(2)
									var/obj/item/storage/pill_bottle/radx/lb = new
									lb.loc=src.loc
									del src
								if(3)
									var/obj/item/reagent_containers/blood/radaway/lb = new
									var/obj/item/reagent_containers/blood/radaway/lb2 = new
									var/obj/item/reagent_containers/blood/radaway/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(4)
									var/obj/item/storage/pill_bottle/mentats/lb = new
									lb.loc=src.loc
									del src
								if(5)
									var/obj/item/storage/pill_bottle/fixer/lb = new
									lb.loc=src.loc
									del src
								if(6)
									var/obj/item/reagent_containers/hypospray/medipen/stimpak/lb = new
									lb.loc=src.loc
									del src
								if(7)
									var/obj/item/reagent_containers/medspray/styptic/lb = new
									lb.loc=src.loc
									del src
								if(8)
									var/obj/item/reagent_containers/medspray/silver_sulf/lb = new
									lb.loc=src.loc
									del src
								if(9)
									var/obj/item/reagent_containers/medspray/synthflesh/lb = new
									lb.loc=src.loc
									del src
								if(10)
									var/obj/item/reagent_containers/medspray/sterilizine/lb = new
									lb.loc=src.loc
									del src

						drugs
						New()
							switch(rand(1,5))
								if(1)
									var/obj/item/reagent_containers/pill/patch/jet/lb = new
									lb.loc=src.loc
									del src
								if(2)
									var/obj/item/reagent_containers/pill/patch/turbo/lb = new
									lb.loc=src.loc
									del src
								if(3)
									var/obj/item/reagent_containers/pill/patch/healingpowder/lb = new
									lb.loc=src.loc
									del src
								if(4)
									var/obj/item/reagent_containers/pill/stimulant/lb = new
									lb.loc=src.loc
									del src
								if(5)
									var/obj/item/reagent_containers/syringe/medx/lb = new
									lb.loc=src.loc
									del src


			weaponspawners //port
				melee
					tier1
						New()
							switch(rand(1,7))
								if(1)
									var/obj/item/crowbar/lb = new
									lb.loc=src.loc
									del src
								if(2)
									var/obj/item/extinguisher/lb = new
									lb.loc=src.loc
									del src
								if(3)
									var/obj/item/hatchet/lb = new
									lb.loc=src.loc
									del src
								if(4)
									var/obj/item/pickaxe/mini/lb = new
									lb.loc=src.loc
									del src
								if(5)
									var/obj/item/wrench/lb = new
									lb.loc=src.loc
									del src
								if(6)
									var/obj/item/kitchen/knife/lb = new
									lb.loc=src.loc
									del src
								if(7)
									var/obj/item/kitchen/rollingpin/lb = new
									lb.loc=src.loc
									del src


					tier2
						New()
							switch(rand(1,14))
								if(1)
									var/obj/item/gavelhammer/lb = new
									lb.loc=src.loc
									del src
								if(2)
									var/obj/item/oar/lb = new
									lb.loc=src.loc
									del src
								if(3)
									var/obj/item/pickaxe/lb = new
									lb.loc=src.loc
									del src
								if(4)
									var/obj/item/shovel/lb = new
									lb.loc=src.loc
									del src
								if(5)
									var/obj/item/switchblade/lb = new
									lb.loc=src.loc
									del src
								if(6)
									var/obj/item/throwing_star/spear/lb = new
									lb.loc=src.loc
									del src
								if(7)
									var/obj/item/surgicaldrill/lb = new
									lb.loc=src.loc
									del src
								if(8)
									var/obj/item/kitchen/knife/combat/lb = new
									lb.loc=src.loc
									del src
								if(9)
									var/obj/item/kitchen/knife/combat/survival/lb = new
									lb.loc=src.loc
									del src
								if(10)
									var/obj/item/kitchen/knife/combat/bone/lb = new
									lb.loc=src.loc
									del src
								if(11)
									var/obj/item/instrument/guitar/lb = new
									lb.loc=src.loc
									del src
								if(12)
									var/obj/item/instrument/violin/lb = new
									lb.loc=src.loc
									del src
								if(13)
									var/obj/item/instrument/saxophone/lb = new
									lb.loc=src.loc
									del src
								if(14)
									var/obj/item/claymore/machete/pipe/lb = new
									lb.loc=src.loc
									del src

					tier3
						New()
							switch(rand(1,9))
								if(1)
									var/obj/item/weldingtool/lb = new
									lb.loc=src.loc
									del src
								if(2)
									var/obj/item/twohanded/spear/lb = new
									lb.loc=src.loc
									del src
								if(3)
									var/obj/item/twohanded/bostaff/lb = new
									lb.loc=src.loc
									del src
								if(4)
									var/obj/item/twohanded/baseball/lb = new
									lb.loc=src.loc
									del src
								if(5)
									var/obj/item/kitchen/knife/butcher/lb = new
									lb.loc=src.loc
									del src
								if(6)
									var/obj/item/claymore/machete/golf/lb = new
									lb.loc=src.loc
									del src
								if(7)
									var/obj/item/claymore/machete/lb = new
									lb.loc=src.loc
									del src
								if(8)
									var/obj/item/circular_saw/lb = new
									lb.loc=src.loc
									del src
								if(9)
									var/obj/item/shield/riot/buckler/lb = new
									lb.loc=src.loc
									del src

					tier4
						New()
							switch(rand(1,4))
								if(1)
									var/obj/item/twohanded/fireaxe/lb = new
									lb.loc=src.loc
									del src
								if(2)
									var/obj/item/twohanded/fireaxe/sledgehammer/lb = new
									lb.loc=src.loc
									del src
								if(3)
									var/obj/item/twohanded/fireaxe/bmprsword/lb = new
									lb.loc=src.loc
									del src
								if(4)
									var/obj/item/shield/riot/lb = new
									lb.loc=src.loc
									del src


					tier5
						New()
							switch(rand(1,6))
								if(1)
									var/obj/item/twohanded/required/thermic_lance/lb = new
									lb.loc=src.loc
									del src
								if(2)
									var/obj/item/twohanded/required/chainsaw/lb = new
									lb.loc=src.loc
									del src
								if(3)
									var/obj/item/twohanded/required/kinetic_crusher/lb = new
									lb.loc=src.loc
									del src
								if(4)
									var/obj/item/nullrod/claymore/chainsaw_sword/lb = new
									lb.loc=src.loc
									del src
								if(5)
									var/obj/item/melee/powerfist/lb = new
									lb.loc=src.loc
									del src
								if(6)
									var/obj/item/melee/transforming/energy/axe/lb = new
									lb.loc=src.loc
									del src


				gun
					tier1
						New()
							switch(rand(1,10))
								if(1)
									var/obj/item/gun/ballistic/revolver/single_shotgun/lb = new
									var/obj/item/storage/box/rubbershot/beanbag/lb2 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									del src
								if(2)
									var/obj/item/gun/ballistic/revolver/caravan_shotgun/lb = new
									var/obj/item/storage/box/rubbershot/beanbag/lb2 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									del src
								if(3)
									var/obj/item/gun/ballistic/shotgun/boltaction/lb = new
									var/obj/item/ammo_box/a762/lb2 = new
									var/obj/item/ammo_box/a762/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(4)
									var/obj/item/gun/ballistic/revolver/zipgun/lb = new
									lb.loc=src.loc
									del src
								if(5)
									var/obj/item/gun/ballistic/revolver/pipe_rifle/lb = new
									lb.loc=src.loc
									del src
								if(6)
									var/obj/item/gun/ballistic/shotgun/boltaction/remington/lb = new
									var/obj/item/ammo_box/a762/lb2 = new
									var/obj/item/ammo_box/a762/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(7)
									var/obj/item/gun/ballistic/revolver/detective/lb = new
									var/obj/item/ammo_box/c38/lb2 = new
									var/obj/item/ammo_box/c38/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(8)
									var/obj/item/gun/ballistic/automatic/pistol/n99/lb = new
									var/obj/item/ammo_box/magazine/m10mm_adv/lb2 = new
									var/obj/item/ammo_box/magazine/m10mm_adv/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(9)
									var/obj/item/gun/ballistic/automatic/pistol/m1911/lb = new
									var/obj/item/ammo_box/magazine/m45/lb2 = new
									var/obj/item/ammo_box/magazine/m45/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(9)
									var/obj/item/gun/ballistic/automatic/pistol/ninemil/lb = new
									var/obj/item/ammo_box/magazine/m9mm/lb2 = new
									var/obj/item/ammo_box/magazine/m9mm/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(10)
									var/obj/item/gun/ballistic/revolver/colt6250/lb = new
									var/obj/item/ammo_box/c10mm/lb2 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									del src



					tier2
						New()
							switch(rand(1,5))
								if(1)
									var/obj/item/gun/ballistic/shotgun/trench/lb = new
									var/obj/item/storage/box/lethalshot/lb2 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									del src
								if(2)
									var/obj/item/gun/ballistic/shotgun/lb = new
									var/obj/item/storage/box/lethalshot/lb2 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									del src
								if(3)
									var/obj/item/gun/ballistic/revolver/m29/lb = new
									var/obj/item/ammo_box/m44/lb2 = new
									var/obj/item/ammo_box/m44/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(4)
									var/obj/item/gun/ballistic/shotgun/boltaction/remington/scoped/lb = new
									var/obj/item/ammo_box/a762/lb2 = new
									var/obj/item/ammo_box/a762/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(5)
									var/obj/item/gun/ballistic/revolver/m29/scoped/lb = new
									var/obj/item/ammo_box/m44/lb2 = new
									var/obj/item/ammo_box/m44/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src



					tier3
						New()
							switch(rand(1,9))
								if(1)
									var/obj/item/gun/ballistic/shotgun/automatic/hunting/lb = new
									var/obj/item/ammo_box/a762/doublestacked/lb2 = new
									var/obj/item/ammo_box/a762/doublestacked/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(2)
									var/obj/item/gun/ballistic/automatic/mini_uzi/lb = new
									var/obj/item/ammo_box/magazine/uzim9mm/lb2 = new
									var/obj/item/ammo_box/magazine/uzim9mm/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(3)
									var/obj/item/gun/ballistic/automatic/marksman/servicerifle/lb = new
									var/obj/item/ammo_box/magazine/r20/lb2 = new
									var/obj/item/ammo_box/magazine/r20/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(4)
									var/obj/item/gun/ballistic/automatic/smg10mm/lb = new
									var/obj/item/ammo_box/magazine/m10mm_auto/lb2 = new
									var/obj/item/ammo_box/magazine/m10mm_auto/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(5)
									var/obj/item/gun/ballistic/automatic/greasegun/lb = new
									var/obj/item/ammo_box/magazine/greasegun/lb2 = new
									var/obj/item/ammo_box/magazine/greasegun/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(6)
									var/obj/item/gun/ballistic/automatic/smg10mm/lb = new
									var/obj/item/ammo_box/magazine/m10mm_auto/lb2 = new
									var/obj/item/ammo_box/magazine/m10mm_auto/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(7)
									var/obj/item/gun/ballistic/shotgun/riot/lb = new
									var/obj/item/storage/box/lethalshot/lb2 = new
									var/obj/item/storage/box/rubbershot/beanbag/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(8)
									var/obj/item/gun/energy/laser/pistol/lb = new
									lb.loc=src.loc
									del src
								if(9)
									var/obj/item/gun/ballistic/revolver/needler/lb = new
									var/obj/item/ammo_box/needle/lb2 = new
									var/obj/item/ammo_box/needle/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src


					tier4
						New()
							switch(rand(1,9))
								if(1)
									var/obj/item/gun/ballistic/automatic/assault_rifle/lb = new
									var/obj/item/ammo_box/magazine/r20/lb2 = new
									var/obj/item/ammo_box/magazine/r20/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(2)
									var/obj/item/gun/ballistic/automatic/marksman/lb = new
									var/obj/item/ammo_box/magazine/r20/lb2 = new
									var/obj/item/ammo_box/magazine/r20/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(3)
									var/obj/item/gun/ballistic/automatic/pistol/deagle/lb = new
									var/obj/item/ammo_box/magazine/m50/lb2 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									del src
								if(4)
									var/obj/item/gun/energy/laser/scatter/lb = new
									lb.loc=src.loc
									del src
								if(5)
									var/obj/item/gun/energy/laser/plasma/pistol/lb = new
									lb.loc=src.loc
									del src
								if(6)
									var/obj/item/gun/energy/laser/aer9/lb = new
									lb.loc=src.loc
									del src
								if(7)
									var/obj/item/gun/ballistic/automatic/tommygun/lb = new
									var/obj/item/ammo_box/magazine/tommygunm45/lb2 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									del src
								if(8)
									var/obj/item/gun/ballistic/automatic/assault_rifle/infiltrator/lb = new
									var/obj/item/ammo_box/magazine/r20/lb2 = new
									var/obj/item/ammo_box/magazine/r20/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src
								if(9)
									var/obj/item/gun/ballistic/automatic/m72/lb = new
									var/obj/item/ammo_box/magazine/m2mm/lb2 = new
									var/obj/item/ammo_box/magazine/m2mm/lb3 = new
									lb.loc=src.loc
									lb2.loc=src.loc
									lb3.loc=src.loc
									del src


					tier5
						New()
							switch(rand(1,8))
								if(1)
									var/obj/item/gun/energy/laser/plasma/lb = new
									lb.loc=src.loc
									del src
								if(2)
									var/obj/item/gun/energy/laser/plasma/scatter/lb = new
									lb.loc=src.loc
									del src
								if(3)
									var/obj/item/gun/ballistic/revolver/sequoia/scoped/lb = new
									lb.loc=src.loc
									del src
								if(4)
									var/obj/item/gun/ballistic/automatic/l6_saw/unrestricted/lb = new
									lb.loc=src.loc
									del src
								if(5)
									var/obj/item/gun/ballistic/automatic/sniper_rifle/lb = new
									lb.loc=src.loc
									del src
								if(6)
									var/obj/item/gun/ballistic/automatic/shotgun/caws/lb = new
									lb.loc=src.loc
									del src
								if(7)
									var/obj/item/gun/ballistic/automatic/shotgun/pancor/lb = new
									lb.loc=src.loc
									del src
								if(8)
									var/obj/item/gun/ballistic/automatic/bozar/lb = new
									lb.loc=src.loc
									del src


					ammo
						tier1
							New()
								switch(rand(1,5))
									if(1)
										var/obj/item/ammo_box/magazine/m9mm/lb = new
										var/obj/item/ammo_box/magazine/m9mm/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(2)
										var/obj/item/storage/box/lethalshot/lb = new
										lb.loc=src.loc
										del src
									if(3)
										var/obj/item/storage/box/rubbershot/lb = new
										lb.loc=src.loc
										del src
									if(4)
										var/obj/item/storage/box/rubbershot/beanbag/lb = new
										lb.loc=src.loc
										del src
									if(5)
										var/obj/item/ammo_box/c38/lb = new
										var/obj/item/ammo_box/c38/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src



						tier2
							New()
								switch(rand(1,7))
									if(1)
										var/obj/item/ammo_box/c45/lb = new
										lb.loc=src.loc
										del src
									if(2)
										var/obj/item/ammo_box/c10mm/lb = new
										lb.loc=src.loc
										del src
									if(3)
										var/obj/item/ammo_box/a762/lb = new
										var/obj/item/ammo_box/a762/lb2 = new
										var/obj/item/ammo_box/a762/lb3 = new
										var/obj/item/ammo_box/a762/lb4 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										lb4.loc=src.loc
										del src
									if(4)
										var/obj/item/ammo_box/a556/lb = new
										lb.loc=src.loc
										del src
									if(5)
										var/obj/item/ammo_box/c9mm/lb = new
										lb.loc=src.loc
										del src
									if(6)
										var/obj/item/ammo_box/m44/lb = new
										var/obj/item/ammo_box/m44/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(7)
										var/obj/item/ammo_box/c45/lb = new
										lb.loc=src.loc
										del src


						tier3
							New()
								switch(rand(1,11))
									if(1)
										var/obj/item/ammo_box/magazine/r20/lb = new
										var/obj/item/ammo_box/magazine/r20/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(2)
										var/obj/item/ammo_box/magazine/m10mm_adv/lb = new
										var/obj/item/ammo_box/magazine/m10mm_adv/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(3)
										var/obj/item/ammo_box/m44/lb = new
										var/obj/item/ammo_box/m44/lb2 = new
										var/obj/item/ammo_box/m44/lb3 = new
										var/obj/item/ammo_box/m44/lb4 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										lb4.loc=src.loc
										del src
									if(4)
										var/obj/item/ammo_box/magazine/m45/lb = new
										var/obj/item/ammo_box/magazine/m45/lb2 = new
										var/obj/item/ammo_box/magazine/m45/lb3 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										del src
									if(5)
										var/obj/item/ammo_box/magazine/uzim9mm/lb = new
										var/obj/item/ammo_box/magazine/uzim9mm/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(6)
										var/obj/item/storage/box/lethalshot/lb = new
										var/obj/item/storage/box/lethalshot/lb2 = new
										var/obj/item/storage/box/lethalshot/lb3 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										del src
									if(7)
										var/obj/item/ammo_box/magazine/greasegun/lb = new
										var/obj/item/ammo_box/magazine/greasegun/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(8)
										var/obj/item/ammo_box/needle/lb = new
										var/obj/item/ammo_box/needle/lb2 = new
										var/obj/item/ammo_box/needle/lb3 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										del src
									if(9)
										var/obj/item/ammo_box/magazine/tommygunm45/lb = new
										var/obj/item/ammo_box/magazine/tommygunm45/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(10)
										var/obj/item/ammo_box/magazine/m10mm_auto/lb = new
										var/obj/item/ammo_box/magazine/m10mm_auto/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(11)
										var/obj/item/ammo_box/magazine/m9mm/lb = new
										var/obj/item/ammo_box/magazine/m9mm/lb2 = new
										var/obj/item/ammo_box/magazine/m9mm/lb3 = new
										var/obj/item/ammo_box/magazine/m9mm/lb4 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										lb4.loc=src.loc
										del src

						tier4
							New()
								switch(rand(1,6))
									if(1)
										var/obj/item/ammo_box/magazine/d12g/lb = new
										var/obj/item/ammo_box/magazine/d12g/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(2)
										var/obj/item/ammo_box/magazine/m50/lb = new
										var/obj/item/ammo_box/magazine/m50/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(3)
										var/obj/item/ammo_box/magazine/r20/lb = new
										var/obj/item/ammo_box/magazine/r20/lb2 = new
										var/obj/item/ammo_box/magazine/r20/lb3 = new
										var/obj/item/ammo_box/magazine/r20/lb4 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										lb4.loc=src.loc
										del src
									if(4)
										var/obj/item/ammo_box/magazine/m2mm/lb = new
										var/obj/item/ammo_box/magazine/m2mm/lb2 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										del src
									if(5)
										var/obj/item/ammo_box/a40mm/lb = new
										var/obj/item/ammo_box/a40mm/lb2 = new
										var/obj/item/ammo_box/a40mm/lb3 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										del src
									if(6)
										var/obj/item/ammo_box/c4570/lb = new
										var/obj/item/ammo_box/c4570/lb2 = new
										var/obj/item/ammo_box/c4570/lb3 = new
										var/obj/item/ammo_box/c4570/lb4 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										lb4.loc=src.loc
										del src


						tier5
							New()
								switch(rand(1,14))
									if(1)
										var/obj/item/ammo_box/magazine/mm195x129/lb = new
										lb.loc=src.loc
										del src
									if(2)
										var/obj/item/ammo_box/magazine/mm195x129/hollow/lb = new
										lb.loc=src.loc
										del src
									if(3)
										var/obj/item/ammo_box/magazine/sniper_rounds/lb = new
										var/obj/item/ammo_box/magazine/sniper_rounds/lb2 = new
										var/obj/item/ammo_box/magazine/sniper_rounds/penetrator/lb3 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										del src
									if(4)
										var/obj/item/ammo_box/magazine/d12g/lb = new
										var/obj/item/ammo_box/magazine/d12g/lb2 = new
										var/obj/item/ammo_box/magazine/d12g/lb3 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										del src
									if(5)
										var/obj/item/ammo_box/magazine/m2mm/lb = new
										var/obj/item/ammo_box/magazine/m2mm/lb2 = new
										var/obj/item/ammo_box/magazine/m2mm/lb3 = new
										var/obj/item/ammo_box/magazine/m2mm/lb4 = new
										var/obj/item/ammo_box/magazine/m2mm/lb5 = new
										var/obj/item/ammo_box/magazine/m2mm/lb6 = new
										lb.loc=src.loc
										lb2.loc=src.loc
										lb3.loc=src.loc
										lb4.loc=src.loc
										lb5.loc=src.loc
										lb6.loc=src.loc
										del src

			armorspawners //1.8
				tier1
					New()
						switch(rand(1,17))
							if(1)
								var/obj/item/clothing/suit/armor/vest/lb = new
								var/obj/item/clothing/head/helmet/riot/vaultsec/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(2)
								var/obj/item/clothing/suit/armor/vest/det_suit/lb = new
								lb.loc=src.loc
								del src
							if(4)
								var/obj/item/clothing/suit/armor/f13/kit/lb = new
								lb.loc=src.loc
								del src
							if(5)
								var/obj/item/clothing/suit/armor/f13/raider/lb = new
								var/obj/item/clothing/head/helmet/f13/raider/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(6)
								var/obj/item/clothing/suit/armor/f13/raider/sadist/lb = new
								var/obj/item/clothing/head/helmet/f13/raider/arclight/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(7)
								var/obj/item/clothing/suit/armor/f13/raider/blastmaster/lb = new
								var/obj/item/clothing/head/helmet/f13/raider/blastmaster/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(8)
								var/obj/item/clothing/suit/armor/f13/raider/yankee/lb = new
								var/obj/item/clothing/head/helmet/f13/raider/yankee/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(9)
								var/obj/item/clothing/suit/armor/f13/leatherarmor/lb = new
								lb.loc=src.loc
								del src
							if(10)
								var/obj/item/clothing/suit/f13/mfp/lb = new
								lb.loc=src.loc
								del src
							if(11)
								var/obj/item/clothing/suit/fluff/cowboybvest/lb = new
								lb.loc=src.loc
								del src
							if(12)
								var/obj/item/clothing/suit/fluff/cowboygvest/lb = new
								lb.loc=src.loc
								del src
							if(13)
								var/obj/item/clothing/suit/fluff/battlecruiser/lb = new
								lb.loc=src.loc
								del src
							if(14)
								var/obj/item/clothing/suit/fluff/vest/lb = new
								lb.loc=src.loc
								del src
							if(15)
								var/obj/item/clothing/suit/f13/veteran/lb = new
								lb.loc=src.loc
								del src
							if(16)
								var/obj/item/clothing/suit/f13/duster/lb = new
								lb.loc=src.loc
								del src
							if(17)
								var/obj/item/clothing/suit/f13/autumn/lb = new
								lb.loc=src.loc
								del src


				tier2
					New()
						switch(rand(1,6))
							if(1)
								var/obj/item/clothing/suit/armor/fluff/chestplate/lb = new
								var/obj/item/clothing/head/helmet/f13/metalmask/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(2)
								var/obj/item/clothing/suit/armor/f13/combat/lb = new
								var/obj/item/clothing/head/helmet/f13/combat/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(3)
								var/obj/item/clothing/suit/armor/f13/bmetalarmor/lb = new
								var/obj/item/clothing/head/helmet/f13/eyebot/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(4)
								var/obj/item/clothing/suit/armor/fluff/chestplate/lb = new
								lb.loc=src.loc
								del src
							if(5)
								var/obj/item/clothing/suit/armor/fluff/chestplate/lb = new
								var/obj/item/clothing/head/helmet/f13/eyebot/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(6)
								var/obj/item/clothing/suit/armor/f13/combat/lb = new
								var/obj/item/clothing/head/helmet/f13/combat/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src


				tier3
					New()
						switch(rand(1,5))
							if(1)
								var/obj/item/clothing/suit/armor/f13/combat/mk2/lb = new
								var/obj/item/clothing/head/helmet/f13/combat/mk2/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(2)
								var/obj/item/clothing/suit/armor/f13/combat/mk2/lb = new
								var/obj/item/clothing/head/helmet/f13/combat/mk2/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(3)
								var/obj/item/clothing/suit/armor/f13/brokenpa/t45b/lb = new
								var/obj/item/clothing/head/helmet/f13/brokenpa/t45b/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(4)
								var/obj/item/clothing/suit/armor/f13/combat/mk2/lb = new
								var/obj/item/clothing/head/helmet/f13/combat/mk2/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(5)
								var/obj/item/clothing/suit/armor/f13/rangercombat/lb = new
								var/obj/item/clothing/head/helmet/f13/ncr/rangercombat/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src



				tier4
					New()
						switch(rand(1,8))
							if(1)
								var/obj/item/clothing/suit/armor/fluff/chestplate/mk2/lb = new
								var/obj/item/clothing/head/helmet/f13/metalmask/mk2/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(2)
								var/obj/item/clothing/suit/armor/f13/ibmetalarmor/lb = new
								lb.loc=src.loc
								del src
							if(3)
								var/obj/item/clothing/head/helmet/swat/lb = new
								var/obj/item/clothing/suit/armor/bulletproof/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(4)
								var/obj/item/clothing/suit/armor/laserproof/lb = new
								var/obj/item/clothing/head/helmet/f13/tesla/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(5)
								var/obj/item/clothing/suit/armor/f13/rangercombat/desert/lb = new
								var/obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(6)
								var/obj/item/clothing/suit/armor/fluff/chestplate/mk2/lb = new
								var/obj/item/clothing/head/helmet/f13/metalmask/mk2/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(7)
								var/obj/item/clothing/suit/armor/f13/ibmetalarmor/lb = new
								lb.loc=src.loc
								del src
							if(8)
								var/obj/item/clothing/head/helmet/f13/brokenpa/t45b/lb = new
								var/obj/item/clothing/suit/armor/f13/brokenpa/t45b/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src






				tier5
					New()
						switch(rand(1,7))
							if(1)
								var/obj/item/clothing/suit/armor/f13/power_armor/advanced/lb = new
								var/obj/item/clothing/head/helmet/power_armor/advanced/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
							if(2)
								var/obj/item/clothing/suit/armor/f13/power_armor/advanced/mk2/lb = new
								var/obj/item/clothing/head/helmet/power_armor/advanced/mk2/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
								return
							if(3)
								var/obj/item/clothing/suit/armor/f13/power_armor/tesla/lb = new
								var/obj/item/clothing/head/helmet/power_armor/tesla/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
								return
							if(4)
								var/obj/item/clothing/suit/armor/f13/power_armor/t45d/lb = new
								var/obj/item/clothing/head/helmet/power_armor/t45d/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
								return
							if(5)
								var/obj/item/clothing/suit/armor/f13/power_armor/t51b/lb = new
								var/obj/item/clothing/head/helmet/power_armor/t51b/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
								return
							if(6)
								var/obj/item/clothing/suit/armor/f13/power_armor/t45d/lb = new
								var/obj/item/clothing/head/helmet/power_armor/t45d/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
								return
							if(7)
								var/obj/item/clothing/suit/armor/f13/power_armor/t45d/lb = new
								var/obj/item/clothing/head/helmet/power_armor/t45d/lb2 = new
								lb.loc=src.loc
								lb2.loc=src.loc
								del src
								return