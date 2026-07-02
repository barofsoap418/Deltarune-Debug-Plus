function scr_84_draw_menu(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
	var array = arg0
	var xx = arg1
	var yy = arg2
	var vspacing = arg3
	var selection_indices = arg4
	var func_depth = arg5
	var menu_depth = arg6
	var length = ds_list_size(array)
	for (var i = 0; i < length; i += 3)
	{
		var ndx = i / 3
		var type = ds_list_find_value(array, i)
		var item = ds_list_find_value(array, i + 1)
		var name = ds_list_find_value(array, i + 2)
		var selected = false
		var prefix = "  "
		if (ndx == selection_indices[func_depth])
			selected = true
		draw_set_colour(c_white)
		if (selected)
		{
			draw_set_colour(c_yellow)
			prefix = "> "
			if (func_depth > global.chemg_max_depth)
			{
				global.chemg_max_depth = func_depth
				global.chemg_cursor_y = yy
			}
		}
		
		// extra code that adds onto option names in the menu
		// in truth the code in this script was updated after chapter 2 presumably to make this work without chain of
		// else ifs, but i don't feel like figuring it out so this script has been reverted to the ch2 version lol
		if (type == "[group]")
            name = "[ " + name + "... ]"
        else if (type == "[flagset]") // display ID of a flag beside the name and display its current value beside that
            name += "(" + string(item) + ") : " + string(global.flag[item])
        else if (type == "[globalset]") // display global variable's current value
            name += ": " + string(variable_global_get(item))
        else if (type == "[globalset_multi]") // same but for multiple global variables
            name += ": " + string(variable_global_get(item[0]))
        else if type == "[toggle_global_saveto_ini]"
            name += ": " + string(variable_global_get(item))
        else if type == "[flagchangeGUI]"
            name += ": " + string(variable_global_get("chemg_display_flag_changes"))
        else if (type == "[platswap]") // gray out the platswap string if it's unavailable
        {
            if (!instance_exists(obj_platswap))
                draw_set_color(c_gray);
        }
        else if type == "[ashley]" // make the super important option rainbow lmaoo
        {
            colsiner++
            draw_set_color(make_color_hsv((colsiner * 8) % 255, 60 + (sin(colsiner / 10) * 15), 255))
        }
        else if (type == "[menukey]") // display menu key
        {
            if (global.chemg_rebinding)
                name += ": <Press Key>"
            else
                name += ": " + global.asc_def[global.chemg_menu_key]
        }
            
		scr_84_draw_text_outline(xx, yy, prefix + name)
		yy += vspacing
		if (func_depth < menu_depth && ndx == selection_indices[func_depth])
			yy = scr_84_draw_menu(item, xx + 20, yy, vspacing, selection_indices, func_depth + 1, menu_depth)
	}
	return yy;
}
