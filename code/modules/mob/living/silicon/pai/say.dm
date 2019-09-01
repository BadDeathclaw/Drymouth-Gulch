/mob/living/silicon/pai/say(msg, var/list/spans = list(), sanitize, datum/language/language = null, language, ignore_spam)
	if(silent)
		to_chat(src, "<span class='warning'>Communication circuits remain unitialized.</span>")
	else
		..(msg)

/mob/living/silicon/pai/binarycheck()
	return 0
