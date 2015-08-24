/obj/structure/sandbag
	icon = 'icons/turf/sandbag.dmi' //WHAT'S YOUR ICON
	icon_state = "sandbag_front"
	name = "sandbag"
	flags = ON_BORDER
	density = 1
	anchored = 1.0
	var/ini_dir = null
	var/state = 0

/obj/structure/sandbag/CanPass(atom/movable/mover as mob|obj, turf/target, height=0, air_group=0)
	if(!mover)
		return 0
	if(air_group || (height==0)) return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/table) in get_turf(mover))
		return 1
	if(get_dir(loc, target) == dir)
		return !density
	else
		return 1

/obj/structure/sandbag/CheckExit(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0)) return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/table) in get_turf(mover))
		return 1
	if (get_dir(mover.loc, target) == src.dir)
		return 0
	return 1


/obj/structure/sandbag/attack_hand(mob/user as mob)
	user << "\red You climb onto sandbag"
	sleep(5)
	user.loc = src.loc