var/_curl/curl = new()

_curl
	proc

		Http(url, data, file, method = HTTP_GET)
			if(istext(data))
				// @ prefix denotes file name
				if(length(data) && copytext(data, 1, 2) != "@")
					data = url_encode(data)
			else if(istype(data, /list))
				data = list2params(data)
			else
				CRASH("Invalid parameter 'data'.")
			var
				options = {"--proto =http,https --output "[file]" --request [method] --data "[data]" [method == HTTP_GET ? "--get" : ""]"}
				code 	= shell("curl [options] [url]")
			// return true on success
			world.log << options
			return !(code || isnull(code))