function scr_damage_all(arg0 = 0, arg1 = true)
{
	var debug_inv = 0
    if (variable_global_exists("chemg_god_mode"))
        debug_inv = global.chemg_god_mode
    if (global.inv < 0 && debug_inv == 0)
	{
		remdamage = damage
		_temptarget = target
		for (ti = 0; ti < 3; ti++)
		{
			global.inv = -1
			if (argument_count == 0)
			{
				damage = remdamage
			}
			else
			{
				damage = arg0
				remdamage = arg0
			}
			target = ti
			if (global.hp[global.char[ti]] > 0 && global.char[ti] != 0)
				scr_damage(arg1)
		}
		global.inv = global.invc * 40
		target = _temptarget
	}
}
