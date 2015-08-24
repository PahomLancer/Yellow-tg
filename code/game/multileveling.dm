// FIRST

/obj/effect/SUPERULTRAHIGHROLEPLAYTRIGGER //DERVEN POWEEEEEEEEEEEEEEEEER
	var/affect_ghosts = 0
	invisibility = 101
	anchored = 1

/obj/effect/SUPERULTRAHIGHROLEPLAYTRIGGER/proc/Trigger(var/atom/movable/A)
	return 0

/obj/effect/SUPERULTRAHIGHROLEPLAYTRIGGER/Crossed(H as mob|obj)
	..()
	if(!H)
		return
	if(istype(H, /mob/dead/observer) && !affect_ghosts)
		return
	Trigger(H)

/obj/effect/SUPERULTRAHIGHROLEPLAYTRIGGER/teleport_to_night
	var/teleport_x = 0	// teleportation coordinates (if one is null, then no teleport!)
	var/teleport_y = 0
	var/teleport_z = 0
	New()
		if(dir == 1)
			teleport_y = y-98
			teleport_x = x
		if(dir == 2)
			teleport_y = y+98
			teleport_x = x
		if(dir == 4)
			teleport_x = x+98
			teleport_y = y
		if(dir == 6)
			teleport_x = x-98
			teleport_y = y

	Trigger(var/atom/movable/A)
		if(teleport_x && teleport_y && teleport_z)

			A.x = teleport_x
			A.y = teleport_y
			A.z = teleport_z

/obj/effect/SUPERULTRAHIGHROLEPLAYTRIGGER/teleport_to_night/south
	dir = 1
	teleport_z = 2

/obj/effect/SUPERULTRAHIGHROLEPLAYTRIGGER/teleport_to_night/north
	dir = 2
	teleport_z = 1

/obj/effect/SUPERULTRAHIGHROLEPLAYTRIGGER/teleport_to_night/east
	dir = 4
	teleport_z = 6

/obj/effect/SUPERULTRAHIGHROLEPLAYTRIGGER/teleport_to_night/west
	dir = 8
	teleport_z = 4