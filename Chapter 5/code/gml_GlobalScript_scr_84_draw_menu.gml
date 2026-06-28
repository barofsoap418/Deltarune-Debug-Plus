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
		
		// extra code that adds onto names and stuff
		if (type == "[group]")
            name = "[ " + name + "... ]";
        else if (type == "[flagset]")
            name += "(" + string(item) + ") : " + string(global.flag[item]);
        else if (type == "[globalset]")
            name += ": " + string(variable_global_get(item));
        else if (type == "[globalset_multi]")
            name += ": " + string(variable_global_get(item[0]));
        else if (type == "[platswap]")
        {
            if (!instance_exists(obj_platswap))
                draw_set_color(c_gray);
        }
        else if type == "[ashley]"
        {
            colsiner++
            draw_set_color(make_color_hsv((colsiner * 8) % 255, 60 + (sin(colsiner / 10) * 15), 255))
        }
            
		scr_84_draw_text_outline(xx, yy, prefix + name)
		yy += vspacing
		if (func_depth < menu_depth && ndx == selection_indices[func_depth])
			yy = scr_84_draw_menu(item, xx + 20, yy, vspacing, selection_indices, func_depth + 1, menu_depth)
	}
	return yy;
}
