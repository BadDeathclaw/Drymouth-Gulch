//Fallout 13 - Loadsamoney!
#define DONATE_UPDATE_DELAY 6000
//#define ALL_PACKS_AVAILABLE 1

// NOTICE:
// SERVER MUST HAVE CURL TOOL! This feature use shell to get data.
client
	var
		list/allowed_roles
		list/allowed_factions
		list/content_packs
		list/allowed_races
		donate_money
		next_donate_update
	proc
		update_content_data(force = FALSE)
			if(!force && world.time < next_donate_update)
				return 0
			update_content_packs(FALSE)
			update_allowed_factions()
			load_content_data()

			next_donate_update = world.time + DONATE_UPDATE_DELAY
			return 1

		update_content_packs(reload)
			content_packs = list()
			add_pack("starter", reload)
			var/data = SScontent.get_data(ckey(ckey))
			var/data_array = splittext(data,":")
			donate_money = text2num(data_array[1])

			for(var/pack in splittext(data_array[2],","))
				add_pack(pack, reload)
#if defined(ALL_PACKS_AVAILABLE)
			for(var/pack in SScontent.all_content_packs)
				add_pack(pack, reload)
#endif

		add_pack(pack_id, reload)
			content_packs |= pack_id
			var/datum/content_pack/pack = SScontent.get_pack(pack_id)
			pack.on_set(src)
			if(reload)
				load_content_data()

		buy_content_pack(pack_id)
			var/datum/content_pack/pack = SScontent.get_pack(pack_id)
			if(donate_money < pack.price)
				to_chat(src, "You can't afford that! You need more caps.")
				return 0
			if(!SScontent.buy_pack(ckey(ckey), pack_id, pack.price))
				to_chat(src, "Something went wrong...")
				return 0
			donate_money -= pack.price
			add_pack(pack_id, TRUE)
			return 1

		load_content_data()
			allowed_roles = list()
			for(var/pack_id in content_packs)
				var/datum/content_pack/D = SScontent.get_pack(pack_id)
				if(D != null)
					allowed_roles += D.roles

		add_race(race_name, race_type)
			if(!allowed_races)
				allowed_races = roundstart_species.Copy()
			allowed_races[race_name] = race_type

		update_allowed_factions()
			allowed_factions = list()
			for(var/f in human_factions)
				var/datum/f13_faction/F = human_factions[f]
				allowed_factions += F
//				if(!(F.flags & DONATE))
//					allowed_factions += F
//					continue
//				if(F in donate_factions)
//					allowed_factions += F
			return 1