#define SOUND_CHANNEL_ADMIN 777
var/list/sounds_cache = list()
var/sound/admin_sound

/client/proc/play_sound(S as sound)
	set category = "Fun"
	set name = "Play Global Sound"
	if(!check_rights(R_SOUNDS))	return

	admin_sound = sound(S, repeat = 0, wait = 0, channel = SOUND_CHANNEL_ADMIN)
	admin_sound.priority = 250
	admin_sound.status = SOUND_UPDATE|SOUND_STREAM

	sounds_cache += S

	switch(alert("Are you sure?\nSong: [S]\nNow you can also play this sound using \"Play Server Sound\".", "Confirmation request" ,"Play", "FORCE", "Cancel")) //Use the Force, Luke.
		if("Play")
			log_admin("[key_name(src)] played sound [S]")
			message_admins("[key_name_admin(src)] played sound [S]", 1)
			for(var/mob/M in player_list)
				if(M.client.prefs.toggles & SOUND_MIDI)
					M << admin_sound
		if("FORCE") //I have a very bad feeling about this.
			log_admin("[key_name(src)] played sound [S] FORCED")
			message_admins("[key_name_admin(src)] played sound [S] FORCED", 1)
			for(var/mob/M in player_list)
				M << admin_sound

	if(SSevent.holidays && SSevent.holidays[APRIL_FOOLS])
		admin_sound.frequency = pick(0.5, 0.7, 0.8, 0.85, 0.9, 0.95, 1.1, 1.2, 1.4, 1.6, 2.0, 2.5)
		src << "You feel the Honkmother messing with your song..."

	admin_sound.frequency = 1 //Remove this line when the AFD stuff above is gone
	admin_sound.wait = 0
	feedback_add_details("admin_verb","PGS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/play_local_sound(S as sound)
	set category = "Fun"
	set name = "Play Local Sound"
	if(!check_rights(R_SOUNDS))
		return

	log_admin("[key_name(src)] played a local sound [S]")
	message_admins("[key_name_admin(src)] played a local sound [S]")
	playsound(get_turf(src.mob), S, 50, 0, 0)
	feedback_add_details("admin_verb","PLS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/play_server_sound()
	set category = "Fun"
	set name = "Play Server Sound"
	if(!check_rights(R_SOUNDS))	return

	var/list/sounds = file2list("sound/serversound_list.txt");
	sounds += sounds_cache //It looks really dumb being below the cancel button
	sounds += "--CANCEL--"

	var/melody = input("Select a sound from the server to play", "Server sound list", "--CANCEL--") in sounds

	if(melody == "--CANCEL--")	return
	play_sound(melody)
	//for(var/mob/M in player_list)
		//if(M.client.prefs.toggles & SOUND_MIDI)
			//M << melody
	feedback_add_details("admin_verb","PSS") //If you are copy-pasting this, ensure the 2nd paramter is unique to the new proc!

/client/proc/set_round_end_sound(S as sound)
	set category = "Fun"
	set name = "Set Round End Sound"
	if(!check_rights(R_SOUNDS))
		return

	if(ticker)
		ticker.round_end_sound = fcopy_rsc(S)
	else
		return

	log_admin("[key_name(src)] set the round end sound to [S]")
	message_admins("[key_name_admin(src)] set the round end sound to [S]")
	feedback_add_details("admin_verb","SRES") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/stop_sounds()
	set category = "Debug"
	set name = "Stop All Playing Sounds"
	if(!src.holder)
		return

	log_admin("[key_name(src)] stopped all currently playing sounds.")
	message_admins("[key_name_admin(src)] stopped all currently playing sounds.")
	for(var/mob/M in player_list)
		if(M.client)
			to_chat(M, sound(null))
	feedback_add_details("admin_verb","SS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

#undef SOUND_CHANNEL_ADMIN
