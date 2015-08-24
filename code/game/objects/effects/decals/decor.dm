/obj/effect/decal/decor
	name = "decoration"
	icon = 'icons/effects/decor.dmi'
	layer = 2

/obj/effect/decal/warning_stripes/New()
	. = ..()

	loc.overlays += src
	del src