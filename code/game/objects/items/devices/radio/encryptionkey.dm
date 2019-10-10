/obj/item/encryptionkey
	name = "standard encryption key"
	desc = "An encryption key for a radio headset.  Has no special codes in it.  WHY DOES IT EXIST?"
	icon = 'icons/obj/radio.dmi'
	icon_state = "cypherkey"
	w_class = WEIGHT_CLASS_TINY
	var/translate_binary = FALSE
	var/syndie = FALSE
	var/independent = FALSE
	var/list/channels = list()

/obj/item/encryptionkey/syndicate
	name = "syndicate encryption key"
	desc = "An encryption key for a radio headset. To access the syndicate channel, use :t."
	icon_state = "syn_cypherkey"
	channels = list("Syndicate" = 1)
	syndie = 1//Signifies that it de-crypts Syndicate transmissions

/obj/item/encryptionkey/binary
	name = "binary translator key"
	desc = "An encryption key for a radio headset.  To access the binary channel, use :b."
	icon_state = "bin_cypherkey"
	translate_binary = TRUE

/obj/item/encryptionkey/headset_sec
	name = "security radio encryption key"
	desc = "An encryption key for a radio headset.  To access the security channel, use :s."
	icon_state = "sec_cypherkey"
	channels = list("Security" = 1)

/obj/item/encryptionkey/headset_eng
	name = "engineering radio encryption key"
	desc = "An encryption key for a radio headset.  To access the engineering channel, use :e."
	icon_state = "eng_cypherkey"
	channels = list("Engineering" = 1)

/obj/item/encryptionkey/headset_rob
	name = "robotics radio encryption key"
	desc = "An encryption key for a radio headset.  To access the engineering channel, use :e. For research, use :n."
	icon_state = "rob_cypherkey"
	channels = list("Science" = 1, "Engineering" = 1)

/obj/item/encryptionkey/headset_med
	name = "medical radio encryption key"
	desc = "An encryption key for a radio headset.  To access the medical channel, use :m."
	icon_state = "med_cypherkey"
	channels = list("Medical" = 1)

/obj/item/encryptionkey/headset_sci
	name = "science radio encryption key"
	desc = "An encryption key for a radio headset.  To access the science channel, use :n."
	icon_state = "sci_cypherkey"
	channels = list("Science" = 1)

/obj/item/encryptionkey/headset_medsci
	name = "medical research radio encryption key"
	desc = "An encryption key for a radio headset.  To access the medical channel, use :m. For science, use :n."
	icon_state = "medsci_cypherkey"
	channels = list("Science" = 1, "Medical" = 1)

/obj/item/encryptionkey/headset_com
	name = "command radio encryption key"
	desc = "An encryption key for a radio headset.  To access the command channel, use :c."
	icon_state = "com_cypherkey"
	channels = list("Command" = 1)

/obj/item/encryptionkey/heads/captain
	name = "\proper the captain's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :c - command, :s - security, :e - engineering, :u - supply, :v - service, :m - medical, :n - science."
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 0, "Science" = 0, "Medical" = 0, "Supply" = 0, "Service" = 0)

/obj/item/encryptionkey/heads/rd
	name = "\proper the research director's encryption key"
	desc = "An encryption key for a radio headset.  To access the science channel, use :n. For command, use :c."
	icon_state = "rd_cypherkey"
	channels = list("Science" = 1, "Command" = 1)

/obj/item/encryptionkey/heads/hos
	name = "\proper the head of security's encryption key"
	desc = "An encryption key for a radio headset.  To access the security channel, use :s. For command, use :c."
	icon_state = "hos_cypherkey"
	channels = list("Security" = 1, "Command" = 1)

/obj/item/encryptionkey/heads/ce
	name = "\proper the chief engineer's encryption key"
	desc = "An encryption key for a radio headset.  To access the engineering channel, use :e. For command, use :c."
	icon_state = "ce_cypherkey"
	channels = list("Engineering" = 1, "Command" = 1)

/obj/item/encryptionkey/heads/cmo
	name = "\proper the chief medical officer's encryption key"
	desc = "An encryption key for a radio headset.  To access the medical channel, use :m. For command, use :c."
	icon_state = "cmo_cypherkey"
	channels = list("Medical" = 1, "Command" = 1)

/obj/item/encryptionkey/heads/hop
	name = "\proper the head of personnel's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :u - supply, :v - service, :c - command."
	icon_state = "hop_cypherkey"
	channels = list("Supply" = 1, "Service" = 1, "Command" = 1)

/obj/item/encryptionkey/headset_cargo
	name = "supply radio encryption key"
	desc = "An encryption key for a radio headset.  To access the supply channel, use :u."
	icon_state = "cargo_cypherkey"
	channels = list("Supply" = 1)

/obj/item/encryptionkey/headset_mining
	name = "mining radio encryption key"
	desc = "An encryption key for a radio headset.  To access the supply channel, use :u. For science, use :n."
	icon_state = "cargo_cypherkey"
	channels = list("Supply" = 1, "Science" = 1)

/obj/item/encryptionkey/headset_service
	name = "service radio encryption key"
	desc = "An encryption key for a radio headset.  To access the service channel, use :v."
	icon_state = "srv_cypherkey"
	channels = list("Service" = 1)

//FALLOUT

/obj/item/encryptionkey/headset_vault
	name = "vault radio encryption key"
	desc = "An encryption key for a radio headset.  To access the vault channel, use :v."
	icon_state = "cypherkey"
	channels = list("Vault" = 1)

/obj/item/encryptionkey/headset_vault_security
	name = "\proper the Security encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :v - vault, :s - security"
	icon_state = "sec_cypherkey"
	channels = list("Vault" = 1, "Security" = 1)

/obj/item/encryptionkey/headset_overseer
	name = "\proper the Overseer's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :v - vault, :c - command, :s - security, :e - engineering, :m - medical, :n - science."
	icon_state = "cap_cypherkey"
	channels = list("Vault" = 1, "Command" = 1, "Security" = 1, "Engineering" = 0, "Science" = 0, "Medical" = 0)

/obj/item/encryptionkey/headset_vault_hos
	name = "\proper the Head of Security's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :v - vault, :c - command, :s - security"
	icon_state = "hos_cypherkey"
	channels = list("Vault" = 1, "Command" = 1, "Security" = 1)

/obj/item/encryptionkey/headset_ncr
	name = "NCR radio encryption key"
	desc = "An encryption key for a radio headset.  To access the NCR channel, use :w."
	icon_state = "cypherkey"
	channels = list("NCR" = 1)

/obj/item/encryptionkey/headset_bos
	name = "Brotherhood radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Enclave channel, use :q."
	icon_state = "cypherkey"
	channels = list("BOS" = 1)

/obj/item/encryptionkey/headset_enclave
	name = "Enclave radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Brotherhood channel, use :z."
	icon_state = "cypherkey"
	channels = list("Enclave" = 1)

/obj/item/encryptionkey/headset_den
	name = "Town radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Town channel, use :f."
	icon_state = "cypherkey"
	channels = list("Town" = 1)

/obj/item/encryptionkey/headset_legion
	name = "Legion radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Legion channel, use :e."
	icon_state = "cypherkey"
	channels = list("Legion" = 1)

/obj/item/encryptionkey/headset_cent
	name = "\improper CentCom radio encryption key"
	desc = "An encryption key for a radio headset.  To access the CentCom channel, use :y."
	icon_state = "cent_cypherkey"
	independent = TRUE
	channels = list("CentCom" = 1)

/obj/item/encryptionkey/ai //ported from NT, this goes 'inside' the AI.
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "AI Private" = 1)

/obj/item/encryptionkey/secbot
	channels = list("AI Private"=1,"Security"=1)
