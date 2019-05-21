#define CB_CLEAN 0
#define CB_WET 1
#define CB_CONTENT 2
#define CB_MESS 3

/obj/structure/chalkboard
	name = "chalkboard"
	desc = "A classic chalkboard for various activities involving writing and drawing.<br>Don't eat the chalk."
	icon = 'icons/fallout/machines/64x32.dmi'
	icon_state = "board_clean"
	flags = FPRINT
	density = 0
	anchored = 1
	var/status = CB_CLEAN
	var/content

/obj/structure/chalkboard/verb/honk()
	set src in oview(1)
	set name = "Draw"
	set desc = "Messing around is fun."
	set category = "Object"

	if (usr.stat != 0)
		return

	if(!ishuman(usr))
		usr << "\red You want, but you don't. You try, but you can't."
		return

	if(content)
		usr << "\blue The board is full! Clean it to write again."
		return

	add_fingerprint(usr)
	status = CB_MESS
	update()

/proc/count_occurrences(string, substring)
	var/count = 0
	var/found = 0
	var/length = length(substring)

	found = findtext(string, substring)

	while(found)
		count++
		found += length
		found = findtext(string, substring, found)

	return count

/obj/structure/chalkboard/verb/wrtite()
	set src in oview(1)
	set name = "Write"
	set desc = "Don't stare, just write."
	set category = "Object"

	if (usr.stat != 0)
		return


	if(!ishuman(usr))
		usr << "\red You want, but you don't. You try, but you can't."
		return

	if(content)
		usr << "\blue The board is full! Clean it to write again."
		return

	//part wrom paper/write
	var/t =  input("What do you want to write here? 20 lines or 2000 symbols max.", "Write", null, null) as message

	if(length(t) > 2048)
		usr << "\blue Your message does not fit in the board!"
		return

	//t = checkhtml(t)
	t = sanitize(t, list("\n"="\[br\]")) //"?"=LETTER_255

	//t = replacetext(t, "\n", "<BR>")
	t = parsepencode(t) // Encode everything from pencode to html

	if(!t)
		return
	if(count_occurrences(t, "<BR>") > 20)
		usr << "\blue You can't write it all on the board!"
		return

	content = t
	add_fingerprint(usr)
	status = CB_CONTENT
	update()



/obj/structure/chalkboard/verb/cleanup()
	set src in oview(1)
	set name = "Cleanup"
	set desc = "Make the board clean"
	set category = "Object"
//	set src in usr

	if (usr.stat != 0)
		return

	if(!ishuman(usr))
		usr << "\red You want, but you don't. You try, but you can't."
		return

	if(status != CB_WET)
		status = CB_WET

	else
		status = CB_CLEAN

	add_fingerprint(usr)
	update()

/obj/structure/chalkboard/proc/update()

	switch (status)
		if(CB_CLEAN)
			desc = "A classic chalkboard for various activities involving writing and drawing.<br>Don't eat the chalk."
			icon_state = "board_clean"
			content = null

		if(CB_WET)
			desc = "Dirty chalkboard."
			icon_state = "board_wet"
			content = null

		if(CB_CONTENT)
			desc = "A classic chalkboard for various activities involving writing and drawing.<br>Something is written on it, you start reading..."
			desc += "<HR>"
			desc +=	content
			desc += "<HR>"
			icon_state = "board_text[rand(1, 9)]"

		if(CB_MESS)
			desc = "A classic chalkboard for various activities involving writing and drawing.<br>It seems someone decided to have some fun."
			icon_state = "board_mess[rand(1, 9)]"
			content = "Draw"

/obj/structure/chalkboard/proc/parsepencode(var/t)

	t = replacetext(t, "\[center\]", "<center>")
	t = replacetext(t, "\[/center\]", "</center>")
	t = replacetext(t, "\[br\]", "<BR>")
	t = replacetext(t, "\[b\]", "<B>")
	t = replacetext(t, "\[/b\]", "</B>")
	t = replacetext(t, "\[i\]", "<I>")
	t = replacetext(t, "\[/i\]", "</I>")
	t = replacetext(t, "\[u\]", "<U>")
	t = replacetext(t, "\[/u\]", "</U>")
	t = replacetext(t, "\[large\]", "<font size=\"4\">")
	t = replacetext(t, "\[/large\]", "</font>")
	t = replacetext(t, "\[*\]", "<li>")
	t = replacetext(t, "\[small\]", "<font size = \"1\">")
	t = replacetext(t, "\[/small\]", "</font>")
	t = replacetext(t, "\[list\]", "<ul>")
	t = replacetext(t, "\[/list\]", "</ul>")

	return t

#undef CB_CLEAN
#undef CB_WET
#undef CB_CONTENT
#undef CB_MESS