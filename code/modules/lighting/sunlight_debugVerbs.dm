mob/verb/zzz()
    world << "Do de shit"
    SSsunlight.workQueue |= GLOB.GLOBAL_LIGHT_OVERLAYS


mob/verb/newSunlight()
    world << "Attempting to create new sunlight overlay"
    var/turf/T = loc

    // check for a sunlight overlay at this loc
    if(T.sunlight_overlay)
        world << "Sunlight overlay already exists"
        return
    
    new /atom/movable/sunlight_overlay(src.loc)
    world << "Sunlight overlay created"

mob/verb/toggleRoof()
    world << "Toggling Roof"
    var/turf/T = loc
    if(T.sunlight_overlay)
        T.sunlight_overlay.toggleRoof()


mob/verb/deleteSunlight()
    world << "Attempting to delete sunlight overlay"

mob/verb/SunlightInfo()
    world << "Sunlight"
    world << "There are [GLOB.GLOBAL_LIGHT_OVERLAYS.len] sunlight turfs"
    var/turf/T = loc
    
    var/atom/movable/sunlight_overlay/SL = T.sunlight_overlay

    var/cr = (T.corners[3].globAffect.len ? 0 : 1) /* check if we are globally affected or not */
    var/cg = (T.corners[2].globAffect.len ? 0 : 1)
    var/cb = (T.corners[4].globAffect.len ? 0 : 1)
    var/ca = (T.corners[1].globAffect.len ? 0 : 1)

    var/rp = SL.light_color
    var/bp = SL.light_color
    var/gp = SL.light_color

    var/mx = max(rp, bp, gp) // Scale it so 1 is the strongest lum, if it is above 1.
    . = 1 // factor
    if (mx > 1)
        . = 1 / mx

    rp = round(rp * ., LIGHTING_ROUND_VALUE)
    bp = round(bp * ., LIGHTING_ROUND_VALUE)
    gp = round(gp * ., LIGHTING_ROUND_VALUE)

    /* bottom left */
    var/rr = rp * cr
    var/rg = gp * cr
    var/rb = bp * cr

    /* bottom right*/
    var/gr = rp * cg
    var/gg = gp * cg
    var/gb = bp * cg

    /* top right */
    var/br = rp * cb
    var/bg = gp * cb
    var/bb = bp * cb

    /* top left */
    var/ar = rp * ca
    var/ag = gp * ca
    var/ab = bp * ca
    
    world << "cr [cr] "
    world << "cg [cg] "
    world << "cb [cb] "
    world << "ca [ca] "
    world << "rp [rp] "
    world << "bp [bp] "
    world << "gp [gp] "
    world << "mx [mx] "
    world << "rr [rr] "
    world << "rg [rg] "
    world << "rb [rb] "
    world << "gr [gr] "
    world << "gg [gg] "
    world << "gb [gb] "
    world << "br [br] "
    world << "bg [bg] "
    world << "bb [bb] "
    world << "ar [ar] "
    world << "ag [ag] "
    world << "ab [ab] "
    //SunlightInfo

mob/verb/ATQW()
    var/turf/T = loc
    world << "Adding to work queue - len [SSsunlight.workQueue.len]"
    SSsunlight.workQueue |= T.sunlight_overlay
    world << "new len [SSsunlight.workQueue.len]"