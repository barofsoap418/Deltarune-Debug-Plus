function scr_damage_all_overworld()
{
	var debug_inv = 0
    if (variable_global_exists("chemg_god_mode"))
        debug_inv = global.chemg_god_mode
    if (global.inv < 0 && debug_inv == 0)
	{
		gameover = 1
		if (global.char[0] != 0 && global.hp[global.char[0]] > 1)
			gameover = 0
		if (global.char[1] != 0 && global.hp[global.char[1]] > 1)
			gameover = 0
		if (global.char[2] != 0 && global.hp[global.char[2]] > 1)
			gameover = 0
		if (global.chapter == 5 && gameover && global.tempflag[57] == 1)
		{
			if (global.char[0] != 0)
				global.hp[global.char[0]] = 0
			if (global.char[1] != 0)
				global.hp[global.char[1]] = 0
			if (global.char[2] != 0)
				global.hp[global.char[2]] = 0
			exit
		}
		if (gameover == 1)
			scr_gameover()
		remdamage = damage
		remtarget = target
		if (!instance_exists(obj_shake))
			instance_create(0, 0, obj_shake)
		with (obj_dmgwriter)
			killactive = 1
		snd_stop(snd_hurt1)
		snd_play(snd_hurt1)
		var maxhpdiff = 0
		for (ti = 0; ti < 3; ti += 1)
		{
			global.inv = -1
			damage = remdamage
			target = ti
			tdamage = damage
			with (global.charinstance[target])
			{
				hurt = 1
				hurttimer = 0
			}
			hpdiff = tdamage
			if (hpdiff >= global.hp[global.char[target]])
				hpdiff = global.hp[global.char[target]] - 1
			maxhpdiff = max(hpdiff, maxhpdiff)
			d_cancel = 0
			if (hpdiff <= 1)
			{
				if (global.hp[global.char[target]] <= 0)
				{
					hpdiff = 0
					d_cancel = 1
				}
				else
				{
					hpdiff = 1
				}
			}
			if (d_cancel == 0)
			{
				doomtype = -1
				global.hp[global.char[target]] -= hpdiff
				if ((instance_exists(global.charinstance[target]) && global.charinstance[target].visible == true) || i_ex(obj_climb_kris) || i_ex(obj_plat_player))
				{
					var trg = -4
					var nowriter = false
					if (i_ex(obj_plat_player))
					{
						trg = 910
						if (ti > 0)
						{
							with (obj_plat_follower)
							{
								if (name == "susie" && other.ti == 1)
									trg = self
								if (name == "ralsei" && other.ti == 2)
									trg = self
							}
							if (trg == 910)
							{
								if (hpdiff == maxhpdiff)
								{
									with (dmgwriter)
										damage = maxhpdiff
								}
								nowriter = true
							}
						}
					}
					else if (i_ex(obj_climb_kris))
					{
						trg = 1164
						if (ti > 0)
						{
							with (obj_climb_susie)
							{
								if (name == "susie" && other.ti == 1)
									trg = self
								if (name == "ralsei" && other.ti == 2)
									trg = self
							}
							if (trg == 1164)
							{
								if (hpdiff == maxhpdiff)
								{
									with (dmgwriter)
										damage = maxhpdiff
								}
								nowriter = true
							}
						}
					}
					if (!nowriter)
					{
						dmgwriter = instance_create(x, y, obj_dmgwriter)
						dmgwriter.damage = hpdiff
						dmgwriter.type = doomtype
						if (i_ex(obj_climb_kris) || i_ex(obj_plat_player))
						{
							dmgwriter.x = trg.x
							dmgwriter.y = trg.y
							dmgwriter.ystart = trg.y
							dmgwriter.depth = trg.depth - 100
							if (i_ex(obj_plat_player))
							{
								dmgwriter.depth = 1650
								if (obj_plat_player.dashing)
									dmgwriter.slidespeedx = obj_plat_player.hspeed
							}
							if (variable_instance_exists(trg, "onrotatingtower") && trg.onrotatingtower == true)
								dmgwriter.x = camerax() + (camerawidth() / 2)
						}
						else if (instance_exists(global.charinstance[target]))
						{
							dmgwriter.x = global.charinstance[target].x
							dmgwriter.y = (global.charinstance[target].y + global.charinstance[target].myheight) - 24
						}
					}
				}
				if (global.hp[global.char[target]] < 1)
					global.hp[global.char[target]] = 1
			}
		}
		target = remtarget
		global.inv = global.invc * 40
	}
}
