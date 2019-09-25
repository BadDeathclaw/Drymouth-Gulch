#define UI_INTERACTIVE 2	// Green/Interactive
#define UI_UPDATE 1			// Orange/Updates Only
#define UI_DISABLED 0		// Red/Disabled
#define UI_CLOSE -1			// Closed

#define send_rsc(target, rsc_content, rsc_name)             target << browse_rsc(rsc_content, rsc_name)
