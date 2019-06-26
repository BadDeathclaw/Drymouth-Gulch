//Fallout 13 whatever directory

atom
	var
		list/overlays_cache

	proc
		add_cached_overlay(key, overlay)
			if(!overlays_cache)
				overlays_cache = list()
			if(!overlays_cache.Find(key))
				overlays_cache[key] = list()
			overlays_cache[key] += overlay
			overlays += overlay
		remove_cached_overlay(key)
			if(!overlays_cache || !overlays_cache.Find(key))
				return
			overlays -= overlays_cache[key]
			overlays_cache.Remove(key)
			if(!overlays_cache.len)
				overlays_cache = null