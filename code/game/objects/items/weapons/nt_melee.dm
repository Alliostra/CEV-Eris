//Warning! If you change icon_state or item_state, make sure you change path for sheath as well. icons/obj/sheath.dmi
/obj/item/weapon/tool/sword/nt/ // not supposed to be in the game, had to make the shortsword its own type to prevent fucking up the scourge. sorry.
	name = "NT Sword"
	desc = "A saint looking sword, made to do God's work."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shortsword"
	item_state = "nt_shortsword"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_WEAK
	armor_penetration = ARMOR_PEN_DEEP
	spawn_blacklisted = TRUE
	aspects = list(SANCTIFIED)
	price_tag = 300
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5)

/obj/item/weapon/tool/sword/nt/equipped(mob/living/M)
	. = ..()
	if(is_held() && is_neotheology_disciple(M))
		embed_mult = 0.1
	else
		embed_mult = initial(embed_mult)

/obj/item/weapon/tool/sword/nt/shortsword
	name = "NT Gladius"
	desc = "A saint looking sword, made to do God's work."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shortsword"
	item_state = "nt_shortsword"
	force_unwielded = 25
	force_wielded = 26
	throwforce = WEAPON_FORCE_WEAK
	armor_penetration = ARMOR_PEN_DEEP
	spawn_blacklisted = TRUE
	aspects = list(SANCTIFIED)
	price_tag = 300
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5)


/obj/item/weapon/tool/sword/nt/longsword
	name = "NT Spatha"
	desc = "A saint looking longsword, recommended by experianced crusaders."
	icon_state = "nt_longsword"
	item_state = "nt_longsword"
	force = 30
	armor_penetration = ARMOR_PEN_EXTREME
	w_class = ITEM_SIZE_HUGE
	price_tag = 1200
	matter = list(MATERIAL_BIOMATTER = 75, MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 5, MATERIAL_DIAMOND = 1)


/obj/item/weapon/tool/knife/dagger/nt
	name = "NT Pugio"
	desc = "A saint looking dagger, even God have mercy."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_dagger"
	item_state = "nt_dagger"
	force = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_MASSIVE
	aspects = list(SANCTIFIED)
	price_tag = 120
	matter = list(MATERIAL_BIOMATTER = 10, MATERIAL_STEEL = 1)

/obj/item/weapon/tool/knife/dagger/nt/equipped(mob/living/H)
	. = ..()
	if(is_held() && is_neotheology_disciple(H))
		embed_mult = 0.1
	else
		embed_mult = initial(embed_mult)

/obj/item/weapon/tool/sword/nt/halberd
	name = "NT Bipennis"
	desc = "A saint looking halberd, for emergency situation."
	icon_state = "nt_halberd"
	item_state = "nt_halberd"
	wielded_icon = "nt_halberd_wielded"
	force = WEAPON_FORCE_ROBUST
	armor_penetration = ARMOR_PEN_MASSIVE
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	price_tag = 600
	matter = list(MATERIAL_BIOMATTER = 80, MATERIAL_STEEL = 8, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 2)

/obj/item/weapon/tool/sword/nt/scourge
	name = "NT Flagellum"
	desc = "A saint looking scourge, extreme punisment. Can be extended to hurt more."
	icon_state = "nt_scourge"
	item_state = "nt_scourge"
	force = WEAPON_FORCE_DANGEROUS
	var/force_extended = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_HALF
	var/armor_penetration_extended = ARMOR_PEN_EXTREME
	var/extended = FALSE
	var/agony = 20
	var/agony_extended = 40
	var/stun = 0
	w_class = ITEM_SIZE_BULKY
	price_tag = 1000
	matter = list(MATERIAL_BIOMATTER = 50, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 2)

/obj/item/weapon/tool/sword/nt/scourge/attack_self(mob/user)
	if(isBroken)
		to_chat(user, SPAN_WARNING("\The [src] is broken."))
		return
	if(extended)
		unextend()
	else
		extend()

/obj/item/weapon/tool/sword/nt/scourge/proc/extend()
	extended = TRUE
	force += (force_extended - initial(force))
	armor_penetration += (armor_penetration_extended - initial(armor_penetration))
	agony += (agony_extended - initial(agony))
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	update_icon()

/obj/item/weapon/tool/sword/nt/scourge/proc/unextend()
	extended = FALSE
	w_class = initial(w_class)
	force = initial(force)
	armor_penetration = initial(armor_penetration)
	agony += initial(agony)
	slot_flags = initial(slot_flags)
	update_icon()

/obj/item/weapon/tool/sword/nt/scourge/update_icon()
	if(extended)
		icon_state = initial(icon_state) + "_extended"
	else
		icon_state = initial(icon_state)
	..()

/obj/item/weapon/tool/sword/nt/scourge/apply_hit_effect(mob/living/carbon/human/target, mob/living/user, var/hit_zone)
	if(isrobot(target))
		return ..()
	var/obj/item/organ/external/affecting
	if(ishuman(target))
		var/mob/living/carbon/human/O = target
		affecting = O.get_organ(hit_zone)
		target.stun_effect_act(stun, agony, hit_zone, src)


/obj/item/weapon/tool/sword/nt/pilum
	name = "NT Pilum"
	desc = "A saint looking short spear, designed for use with a shield or as a throwing weapon. The speartip usually breaks after being thrown at a target, but it can be welded into shape again."
	icon_state = "nt_halberd"
	item_state = "nt_halberd"
	wielded_icon = "nt_halberd_wielded"
	force = 23
	force_wielded = 25
	var/tipbroken = FALSE
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK | SLOT_BELT 
	throwforce = 75 
	armor_penetration = ARMOR_PEN_HALF
	throw_speed = 3
	embed_mult = 200
	price_tag = 150
	matter = list(MATERIAL_BIOMATTER = 10, MATERIAL_STEEL = 5,) // easy to mass-produce and arm the faithful

/obj/item/weapon/tool/sword/nt/pilum/equipped(mob/living/W)
	. = ..()
	if(is_held() && is_neotheology_disciple(W))
		embed_mult = 0.1
	else
		embed_mult = initial(embed_mult)
	if(isBroken)
		force = WEAPON_FORCE_NORMAL
		throwforce = WEAPON_FORCE_HARMLESS
/obj/item/weapon/tool/sword/nt/pilum/dropped(mob/living/W)
	else
		embed_mult = 300

/obj/item/weapon/tool/sword/nt/pilum/on_embed(mob/user)
		tipbroken = TRUE

/obj/item/weapon/tool/sword/nt/pilum/examine(mob/user)
	if (tipbroken)
		to_chat(user, SPAN_WARNING("\The [src] is broken. It looks like it could be repaired with a welder."))
	. = ..()

/obj/item/weapon/tool/sword/nt/pilum/attackby(obj/item/I, var/mob/user)
	. = ..()
	if (I.has_quality(QUALITY_WELDING))
		if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_WELDING, FAILCHANCE_EASY, STAT_MEC))
			to_chat(user, SPAN_NOTICE("You repair \the damaged spear-tip."))
			tipbroken = FALSE
	
/obj/item/weapon/shield/riot/nt
	name = "NT Scutum"
	desc = "A saint looking shield, let the God protect you. Has several leather straps on the back to hold melee weapons."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shield"
	item_state = "nt_shield"
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 2)
	aspects = list(SANCTIFIED)
	spawn_blacklisted = TRUE
	price_tag = 1000
	base_block_chance = 40


/obj/item/weapon/shield/riot/nt/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/melee/baton) || istype(W, /obj/item/weapon/tool/sword/nt))
		on_bash(W, user)
	else
		..()

/obj/item/weapon/shield/riot/nt/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance
