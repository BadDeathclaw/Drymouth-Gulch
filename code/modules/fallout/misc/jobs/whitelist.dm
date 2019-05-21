#define WHITELISTFILE 'data/whitelist.txt'

var/list/whitelist

/mob/var/in_whitelist = -1

/proc/load_whitelist()
	return 1
//	whitelist = file2list(WHITELISTFILE)
//	if(!whitelist.len)	whitelist = null

/proc/check_whitelist(mob/M , var/rank = null)
	if(!config.usewhitelist)
		return 1
	if(M.in_whitelist != -1 && rank == null)
		return M.in_whitelist
	if(check_whitelist_db(M, rank))
		M.in_whitelist = 1
		return M.in_whitelist
	if(check_rights(0, 0))
		M.in_whitelist = 1
		return 1
	if(!whitelist)
		M.in_whitelist = 0
		return 0
	if(rank != null)
		return 0
	M.in_whitelist = ("[M.ckey]" in whitelist)
	return M.in_whitelist

/proc/check_whitelist_db(mob/M, var/rank = null)
	establish_db_connection()
	if(!dbcon.IsConnected())
		log_game("SQL ERROR while whitelist checking. Failed to connect.")
		return 0
	var/DBQuery/query = dbcon.NewQuery("SELECT * FROM [format_table_name("whitelist")] WHERE ckey = '[sanitizeSQL(M.ckey)]'")
	query.Execute()
	while(query.NextRow())
		var/list/row_data = query.GetRowData()
		if(rank != null)
			if(findtext(row_data["rank"], rank))
				return 1
			else
				return 0
		return 1
	return 0

#undef WHITELISTFILE