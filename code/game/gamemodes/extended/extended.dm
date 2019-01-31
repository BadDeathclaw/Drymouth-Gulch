/datum/game_mode/extended
	name = "secret extended"
	config_tag = "secret_extended"
	false_report_weight = 5
	required_players = 0

	announce_span = "notice"
	announce_text = "Just have fun and enjoy the game!"

/datum/game_mode/extended/pre_setup()
	return 1

/datum/game_mode/extended/generate_report()
	return "The wasteland is a scary place."

/datum/game_mode/extended/announced
	name = "extended"
	config_tag = "extended"
	false_report_weight = 0

/datum/game_mode/extended/announced/send_intercept(report = 0)
	priority_announce("Anything could happen on [station_name()]")
