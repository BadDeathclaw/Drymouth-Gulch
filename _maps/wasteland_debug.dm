#if !defined(MAP_FILE)

		#define TITLESCREEN "title" //Add an image in misc/fullscreen.dmi, and set this define to the icon_state, to set a custom titlescreen for your map

		#define MINETYPE "lavaland"

        #include "map_files\debug\wasteland.dmm"

		#define MAP_PATH "map_files/debug"
        #define MAP_FILE "wasteland.dmm"
        #define MAP_NAME "Debug Wasteland"
//		#define MAP_FACTIONS_LIST list("ncr", "legion", "none", "city", "raiders")

		#define MAP_TRANSITION_CONFIG DEFAULT_MAP_TRANSITION_CONFIG

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring wasteland debug.

#endif
