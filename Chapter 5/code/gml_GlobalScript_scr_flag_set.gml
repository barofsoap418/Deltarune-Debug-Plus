function scr_flag_set(arg0, arg1)
{
	global.flag[arg0] = arg1
	if (scr_debug())
        show_debug_message("*** flag [" + string(arg0) + "] updated: " + string(arg1) + " | " + scr_flag_name_get(arg0))
}
function scr_flag_set_ext(arg0, arg1, arg2, arg3 = 1)
{
	if (arg1 < 0)
		scr_flag_set(arg0, arg2)
	else
		global.flag[arg0] = scr_set_bitmask_value(global.flag[arg0], arg1, arg2, arg3)
}
