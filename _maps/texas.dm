#if !defined(MAP_FILE)

		#define TITLESCREEN "title" //Add an image in misc/fullscreen.dmi, and set this define to the icon_state, to set a custom titlescreen for your map

		#define MINETYPE "lavaland"

        #include "map_files\TexasWasteland\texas_wasteland.dmm"
        #include "map_files\TexasWasteland\z2.dmm"

		#define MAP_PATH "map_files/TexasWasteland"
        #define MAP_FILE "texas_wasteland.dmm"
        #define MAP_NAME "Texas Wasteland"
        #define MAP_FACTIONS_LIST list("bs", "enclave", "none", "city", "raiders")

		#define MAP_TRANSITION_CONFIG list()

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring wasteland debug.

#endif
