/*
Atoms ambient sound system... WHY NO ONE HAS MADE THIS BEFORE UH????

BeginAmbient - just starting to play a specific sound on the loop

StopAmbient - ... Should I really explain it?


WARNING!! BE CAREFUL WITH THIS SHIT, I'M NOT SURE IT'S WORKING RIGHT

by JackerZz special gift for Fallout 13.

*/

#define AMBIENT_CHANNELS_MIN 500
#define AMBIENT_CHANNELS_MAX 1024

mob
	var
		list/ambient_sounds = list()

	proc/GetFreeAmbientChannel()
		var/back = 0
		for(var/channel = AMBIENT_CHANNELS_MIN, channel < AMBIENT_CHANNELS_MAX, channel++)
			back = channel
			for(var/S in ambient_sounds)
				if(ambient_sounds[S] == channel)
					back = 0
					break
			if(back)
				break

		return back //No free channels... no ambient...


	proc/GetAmbientChannel(var/atom/source)
		if(source in ambient_sounds)
			return ambient_sounds[source]
		return 0

atom
	var
		list/ambient_hearers
		ambient_playing = 0
		ambient_volume = 50
		ambient_sound = null
		ambient_range

	Destroy()
		if(ambient_playing)
			StopAmbient()
		return ..()

	proc/BeginAmbient(sound = ambient_sound, volume = 50, range = world.view)
		ambient_range = range
		ambient_volume = volume
		ambient_sound = sound
		ambient_hearers = list()
		ambient_playing = 1

		SSambient.processing += src
		RefreshAmbient()

	proc/RefreshAmbient()

		var/sound/null_sound = sound(null)

		if(!istype(ambient_hearers))
			ambient_hearers = list()

		var/turf/T = get_turf(src.loc)

		if(!T) //Why not
			return

		var/chan
		var/stat = 0
		var/vol
		var/distance
		for(var/mob/M in GLOB.player_list) //First we stoping leaved mobs ambient.
			if(!M.client)
				continue

			if(M.z != T.z)
				continue

			distance = get_dist(M, T)

			if(distance > ambient_range)
				if(M in ambient_hearers)
					chan = M.GetAmbientChannel(src)
					null_sound.channel = chan
					to_chat(M, null_sound)
					M.ambient_sounds -= src
					ambient_hearers -= M
				continue

			if(M in ambient_hearers)
				chan = M.GetAmbientChannel(src)
				if(chan == 0) //ALARM SOMETHING BREAK
					M.ambient_sounds -= src
					ambient_hearers -= M
					continue
				stat = SOUND_UPDATE

			else
				chan = M.GetFreeAmbientChannel()
				if(chan == 0) //IF STILL 0 THERE WILL BE BLOOD
					continue
				stat = 0
				M.ambient_sounds[src] = chan
				ambient_hearers += M

			vol = (ambient_volume * (1 - distance/ambient_range)) * M.client.prefs.sounds_volume//calculating volume

			M.playsound_local(T, soundin = src.ambient_sound, vol = vol, channel = chan, status = stat, repeat = 1, vary = 0)

	proc/StopAmbient()
		var/sound/null_sound = sound(null)

		if(ambient_sound != null)
			var/chan
			for(var/mob/M in ambient_hearers)
				chan = M.GetAmbientChannel(src)
				null_sound.channel = chan
				to_chat(M, null_sound)
				M.ambient_sounds -= src
		ambient_hearers.Cut()
		SSambient.processing -= src
		ambient_playing = 0
		ambient_hearers = null






/*
Client music system

When a client is created, this creates a sound system datum for them.
*/

client
	var
		sound_system/sound_system
//		var/ambience_playing = 1
		var/music_playing
		var/state_ambience_change
//		var/area/area_music

	New()
		..()
		sound_system = new(src)
		state_ambience_change = world.time + rand(3000, 6000) //3000 - 5 min 6000 - 10 min 9000 - 15 min
		music_playing = 0





// THE sound SYSTEM DATUM
sound_system

	var
		// The client that this sound system plays sounds for.
		client/owner

		// The current channel to play music on. Two channel are required for
		// fading between songs, so we're reserving channels 1 and to for music.
		music_channel = 1 // (1 or 2)

		// The current music file that the player is listening to.
		sound/current_music = null


	// When a sound system is created, it the owner value should be assigned to the
	// client that it was created for, so that it can refer back to that client.
	New(new_owner)
		src.owner = new_owner

/area/Entered(A)
	..()
	if(!isliving(A))
		return

	var/mob/living/L = A
	if(!L.ckey)
		return

	// Ambience goes down here -- make sure to list each area seperately for ease of adding things in later, thanks! Note: areas adjacent to each other should have the same sounds to prevent cutoff when possible.- LastyScratch
	if(!(L.client && (L.client.prefs.toggles & SOUND_AMBIENCE)))
		return //General ambience check is below the ship ambience so one can play without the other

	var/sound = pick(ambience_area)
	to_chat(L, sound(sound, wait = 0, volume = L.client.prefs.ambient_volume*100, channel = 3, repeat =1))

	if(L.client.state_ambience_change < world.time)
		if(L.client.music_playing)
			L.client.music_playing = 0
			L.client.sound_system.MusicFade(null, 0)
			L.client.state_ambience_change = world.time + rand(3000, 6000)
		else
			L.client.music_playing = 1
			L.client.state_ambience_change = world.time + rand(3000, 6000)

	if(L.client.music_playing)
		if(src.ambientmusic && src.ambientmusic.len)
			L.client.sound_system.AlterMusic(pick(src.ambientmusic), time = 100)

/*
PLAY MUSIC
Description: Loads the song file, applies the current volume and channel settings,
	adds it to the current_sounds list and makes it the current music, then plays it.
Exceptions: If the desired music is already playing, nothing will happen.
Variables:
	- songfile: The song file to play.
*/
sound_system/proc/PlayMusic(songfile, volume = owner.prefs.music_volume*100)

	// If music is already playing...
	if(src.current_music)

		// If we're already playing this song, don't change anything.
		if("[songfile]" == "[src.current_music.file]")
			return

	// Load the song file.
	var/sound/song = sound(songfile)

	// Modify the song file settings.
	song.channel = src.music_channel
	song.volume = volume
	song.priority = 255
	song.status = SOUND_STREAM

	src.current_music = song
	to_chat(src.owner, song)
	return



/*
END MUSIC
Description: Ends whatever song is currently playing.
*/
sound_system/proc/EndMusic(sound/song)

	if(!song)
		song = src.current_music

	to_chat(src.owner, sound(null, channel = song.channel))
	del(song)
	return



/*
ALTER MUSIC
Description: Fades out the current song and replaces it with a new one
Exceptions: If no song is playing, it simply starts the new song. If the new song is the same
	as the old song, it doesn't change anything.
Variables:
	- newsong: The song file to play.
	- transition_time: Number of ticks it takes to transition from the old song to the new.
*/
sound_system/proc/AlterMusic(newsong, increments=20, time=increments)
	if(!src.current_music)
		src.PlayMusic(newsong, 0)
		src.MusicFade(0, owner.prefs.music_volume*100, increments, time)
		return

	if("[newsong]" == "[src.current_music.file]")
		return

	src.music_channel = (src.music_channel == 1 ? 2 : 1)

	src.MusicFade(owner.prefs.music_volume*100, 0, increments, time)
	src.PlayMusic(newsong)
	src.MusicFade(0, owner.prefs.music_volume*100, increments, time)
	return



/*
MUSIC FADE
Description: This will cause the music currently playing (ignoring any music that
	may be fading out due to the AlterMusic function) to fade from the specified
	start volume to the specified ending volume in the number of increments and the
	amount of time you specify. Note that the fade function will end prematurely if
	it detects that another fade function is working at the same time.
Variables:
	- start_volume: The volume to start fading from, 0 to 100. If this is set to NULL
		then it will use whatever the current music's volume is (NOT the volume setting).

	- end_volume: The volume to end the fade at, 0 to 100. If this is set to NULL
		then it will use the current volume SETTING as the value.

	- increments: how many points there are between the starting volume and the ending
		volume. If too many points is creating lag, try reducing this number.

	- speed: how long (in 1/10th seconds) it takes to fade from the starting volume
		to the ending volume.
*/
sound_system/proc/MusicFade(start_volume, end_volume, increments=10, time=increments)
	if(!src.current_music)
		return

	// If you set either the start or ending volumes to null, it will
	// use the current music volume (the ACTUAL volume) for that value.
	if(start_volume == null)
		start_volume = src.current_music.volume
	if(end_volume == null)
		end_volume = owner.prefs.music_volume*100

	var/sound/music = src.current_music

	music.status = SOUND_STREAM

	// No increments or time specified means instant change.
	if(!increments || !time)
		music.volume = end_volume
		music.status |= SOUND_UPDATE
		to_chat(src.owner, music)
		return

	// If there are more increments than there is time to have at
	// lest one tick per increment, then limit the number of increments
	// to the amount of time available.
	increments = min(increments, time)

	// How much the volume needs to decrease each increment.
	var/current_volume = start_volume
	var/inc_amount = (start_volume - end_volume) / increments
	var/inc_time = time / increments

	// Set the music to the starting volume.
	music.volume = current_volume
	music.status |= SOUND_UPDATE
	music.priority = 255
	to_chat(src.owner, music)

	spawn()
		for(var/inc = increments, inc > 0, inc--)

			// Check to see if the music volume has changed outside of this function.
			if(music.volume != current_volume)
				return // music volume changed itself, to skip this.

			// In case the music object stopped existing...
			if(!music)
				return

			current_volume -= inc_amount
			music.volume = current_volume
			music.status |= SOUND_UPDATE
			music.priority = 255
			to_chat(src.owner, music)

			sleep(inc_time)

		// Set the volume to the desired volume in the end, just in case
		// it didn't quite reach it through the increments.
		music.volume = end_volume
		music.status |= SOUND_UPDATE
		to_chat(src.owner, music)

		// If the music is now mute, and it is no longer the primary music channel,
		// then it was probably faded out and alternated with another song, so to
		// prevent it from playing uselessly in the background, we'll delete it.
		if(!music.volume)
			if(music.channel != src.music_channel)
				src.EndMusic(music)

	return