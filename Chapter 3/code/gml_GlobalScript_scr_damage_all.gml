function scr_damage_all()
{
	var debug_inv = 0
    if (variable_global_exists("chemg_god_mode"))
        debug_inv = global.chemg_god_mode
    if (global.inv < 0 && debug_inv == 0)
	{
		remdamage = damage
		_temptarget = target
		for (ti = 0; ti < 3; ti += 1)
		{
			global.inv = -1
			damage = remdamage
			target = ti
			if (global.hp[global.char[ti]] > 0 && global.char[ti] != 0)
				scr_damage()
		}
		global.inv = global.invc * 30
		target = _temptarget
	}
}
