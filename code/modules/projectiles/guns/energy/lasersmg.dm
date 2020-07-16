
/obj/item/weapon/gun/energy/lasersmg
	name = "Disco Vazer \"Lasblender\""
	desc = "This conversion of the Atreides is a "Disco Vazer", as it is called by enthusiastic gun-tinkerers across the galaxy. Unlike most other laser weapons, an integral part of creating the laser shots of Disco Vazers is based on localized micro-explosions in a chain reaction. \
                        While this approach is charge-effective, both the explosions and the improvised nature of the gun worsen accuracy, and the chain-reaction  allows for neither control of kickback nor conserving charge. \
                        Due to these glaring flaws, Disco Vazers are seen as unfit for duty by most professional organisations, but are still used commonly by less prosperous groups and individuals. 
	icon = 'icons/obj/guns/projectile/lasersmg.dmi'
	icon_state = "lasersmg"
        item_state = "lasersmg"
	w_class = ITEM_SIZE_NORMAL
	fire_sound = 'sound/weapons/Laser.ogg'
        can_dual = 1
        projectile_type = /obj/item/projectile/beam
        charge_meter = FALSE
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
        matter = list(MATERIAL_PLASTEEL = 11, MATERIAL_STEEL = 13, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 1, MATERIAL_GLASS = 2)
	price_tag = 1000
	damage_multiplier = 0.9 //makeshift laser 
	recoil_buildup = 7 
	one_hand_penalty = 3 // I wanted it to be hard to control yet still able to be fired from one hand like an SMG
        projectile_type = /obj/item/projectile/beam
        init_offset = 7 // shit accuracy even on the first shot
        suitable_cell = /obj/item/weapon/cell/medium
        charge_cost = 50 // 2 bursts with a 800m cell

	init_firemodes = list(
		BURST_8_ROUND
		)

/obj/item/weapon/gun/energy/lasersmg/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (cell)
                iconstring += "_mag"
	        itemstring += "_mag"

/obj/item/weapon/gun/energy/lasersmg/update_icon()
	overlays.Cut()
	..()
	if(istype(/obj/item/weapon/cell/medium/moebius/nuclear))
		overlays += image(icon, "nuke_cell")
        
        else if(istype(/obj/item/weapon/cell/medium/moebius))
                overlays += image(icon, "nuke_cell")
        
        else if(istype(/obj/item/weapon/cell/medium/excelsior))
                overlays += image(icon, "excel_cell")
        
        else if(istype(/obj/item/weapon/cell/medium/))
                overlays += image(icon, "guild_cell")
