function scr_damage(arg0 = true)
{
	var debug_inv = 0
    if (variable_global_exists("chemg_god_mode"))
        debug_inv = global.chemg_god_mode
    if (global.inv < 0 && debug_inv == 0)
	{
		var __element = 0
		if (variable_instance_exists(id, "element"))
		{
			if (is_real(element))
				__element = element
		}
		if (target < 3)
		{
			if (global.hp[global.char[target]] <= 0)
			{
				scr_randomtarget_old()
				target = mytarget
				with (global.charinstance[target])
				{
					image_blend = c_white
					darkify = 0
				}
			}
		}
		var __remtarget = -1
		if (target == 4)
		{
			__remtarget = 4
			scr_randomtarget_old()
			target = mytarget
			if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
			{
				scr_randomtarget_old()
				target = mytarget
			}
			if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
			{
				scr_randomtarget_old()
				target = mytarget
			}
			if (target == 0 && (global.hp[global.char[target]] / global.maxhp[global.char[target]]) < 0.35)
			{
				scr_randomtarget_old()
				target = mytarget
			}
			with (global.charinstance[target])
			{
				image_blend = c_white
				darkify = 0
			}
		}
		chartarget = 3
		if (global.chapter == 5 && i_ex(obj_flowery_enemy))
		{
			if (obj_flowery_enemy.partydefenselowered == true)
				damage = ceil(damage * 1.1)
			if (obj_flowery_enemy.remove_ralsei_con > 0)
				damage = ceil(damage * 0.8)
			if (obj_flowery_enemy.ralsei_removed == true && target == 2)
			{
				target = choose(0, 1)
				if (global.hp[1] < 1)
					target = 1
				if (global.hp[2] < 1)
					target = 0
			}
			if (i_ex(obj_dbulletcontroller) && obj_dbulletcontroller.type == 637)
				obj_flowery_enemy.damage_taken_during_tutorial++
		}
		tdamage = damage
		var oldcalculation = 0
		if (target < 3)
		{
			chartarget = global.char[target]
			if (global.ignoredefense == true)
			{
				tdamage = ceil(tdamage)
			}
			else
			{
				if (oldcalculation)
					tdamage = ceil(tdamage - (global.battledf[target] * 3))
				else
					tdamage = scr_damage_calculation(tdamage, target)
				if (global.charaction[target] == 10)
					tdamage = ceil((2 * tdamage) / 3)
				tdamage = ceil(tdamage * scr_element_damage_reduction(__element, global.char[target]))
				debug_message("The element is: " + string(__element))
				if (tdamage < 1)
					tdamage = 1
			}
		}
		if (!instance_exists(obj_shake))
			instance_create(0, 0, obj_shake)
		with (global.charinstance[target])
		{
			hurt = 1
			hurttimer = 0
		}
		if (!arg0)
			tdamage = min(tdamage, global.hp[chartarget] - 1)
		hpdiff = tdamage
		with (obj_dmgwriter)
		{
			if (delaytimer >= 1)
				killactive = 1
		}
		doomtype = -1
		with (obj_heart)
			dmgnoise = 1
		if (target < 3)
		{
			if (global.hp[chartarget] <= 0)
			{
				doomtype = 4
				global.hp[chartarget] -= round(tdamage / 4)
				hpdiff = round(tdamage / 4)
			}
			else
			{
				global.hp[chartarget] -= tdamage
				if (global.hp[chartarget] <= 0)
				{
					hpdiff = abs(global.hp[chartarget] - (global.maxhp[chartarget] / 2))
					doomtype = 4
					global.hp[chartarget] = round(-global.maxhp[chartarget] / 2)
					scr_dead(target)
				}
			}
			var targetobj = global.charinstance[target]
			var targetheight = 0
			if (i_ex(obj_plat_player))
			{
				targetobj = obj_plat_player
				targetheight = -24
			}
			else if (i_ex(obj_climb_kris))
			{
				targetobj = obj_climb_kris
				with (obj_climb_susie)
				{
					if (other.target == 1 && name == "susie")
						targetobj = id
					if (other.target == 2 && name == "ralsei")
						targetobj = id
				}
			}
			else
			{
				targetheight = global.charinstance[target].myheight - 24
			}
			if (i_ex(targetobj))
			{
				dmgwriter = instance_create(targetobj.x, targetobj.y + targetheight, obj_dmgwriter)
				dmgwriter.damage = hpdiff
				dmgwriter.type = doomtype
				if (targetobj == obj_climb_kris || targetobj.object_index == obj_climb_susie)
				{
					dmgwriter.type = -1
					dmgwriter.damage = tdamage
					if (obj_climb_kris.onrotatingtower)
						dmgwriter.x = camerax() + (camerawidth() / 2)
				}
			}
		}
		if (target == 3)
		{
			for (hpi = 0; hpi < 3; hpi += 1)
			{
				chartarget = global.char[hpi]
				if (global.hp[chartarget] >= 0)
				{
					if (global.ignoredefense == true)
						tdamage = ceil(tdamage)
					else if (oldcalculation)
						tdamage = ceil(tdamage - (global.battledf[hpi] * 3))
					else
						tdamage = scr_damage_calculation(tdamage, hpi)
					tdamage = ceil(tdamage * scr_element_damage_reduction(__element, chartarget))
					if (global.charaction[hpi] == 10)
						global.hp[chartarget] -= ceil((3 * tdamage) / 4)
					else
						global.hp[chartarget] -= tdamage
					if (global.hp[chartarget] <= 0)
						global.hp[chartarget] = round(-global.maxhp[0] / 2)
				}
			}
		}
		if (i_ex(obj_terracota_wateringcan))
			obj_terracota_wateringcan.timer = -28
		if (i_ex(obj_dbulletcontroller) && obj_dbulletcontroller.type == 630 && i_ex(obj_flowery_enemy))
			obj_flowery_enemy.did_sethaqua_attack_hit_count++
		global.inv = global.invc * 40
		if (global.chararmor1[1] == 35 || global.chararmor2[1] == 35 || global.chararmor1[2] == 35 || global.chararmor2[2] == 35 || global.chararmor1[3] == 35 || global.chararmor2[3] == 35)
			global.inv = global.invc * 40 * 1.2
		gameover = 1
		if (global.char[0] != 0 && global.hp[global.char[0]] > 0)
			gameover = 0
		if (global.char[1] != 0 && global.hp[global.char[1]] > 0)
			gameover = 0
		if (global.char[2] != 0 && global.hp[global.char[2]] > 0)
			gameover = 0
		if (gameover == 1)
			scr_gameover()
		if (__remtarget != -1)
			target = __remtarget
	}
}
