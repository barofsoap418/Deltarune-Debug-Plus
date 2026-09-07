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
		var handler = ds_list_find_value(array, i)
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
        
        // skip drawing if the option would be completely offscreen
        if (yy + vspacing < 0 || yy > display_get_gui_height())
        {
            yy += vspacing;
            if (func_depth < menu_depth && ndx == selection_indices[func_depth])
                yy = scr_84_draw_menu(item, xx + 20, yy, vspacing, selection_indices, func_depth + 1, menu_depth)
            continue;
        }
		
		if (is_struct(handler))
		{
            // Chapter 3+ method
            var draw_handler = variable_struct_get(handler, "draw_text");
        
            if (draw_handler)
                name = draw_handler(item, name, selected);
		}
		else
		{
		    // Chapter 1/2 method, most stuff in the mod uses this since this was built off the chapter 1 switch version
            var type = handler;
    		if (type == "[group]")
                name = "[ " + name + "... ]"
            else if (type == "[flagset]") // display ID of a flag beside the name and display its current value beside that
                name += " (" + string(item) + ") : " + string(global.flag[item])
            else if (type == "[globalset]") // display global variable's current value
                name += ": " + string(variable_global_get(item))
            else if (type == "[globalset_multi]") // same but for multiple global variables
                name += ": " + string(variable_global_get(item[0]))
            else if type == "[toggle_global_saveto_ini]" // debug menu settings, display "ON" or "OFF" instead of a number
                name += ": " + (variable_global_get(item) ? "ON" : "OFF")
            else if type == "[item]" || type == "[lightitem]" || type == "[keyitem]" || type == "[weaponitem]" || type == "[armoritem]"
            {
                name += concat(" (", item,")")
            }
            else if type == "[room]" || type == "[roomdark]" || type == "[roomplat]" || type == "[roomgeneric]"
            {
                // This is a bit inefficient, because it loops through the entire room list for each item
                // I don't think it matters too much for a debug menu though...there's only like 20 rooms max onscreen anyway...
                var save_id = scr_get_id_by_room_index(item);
                if (save_id > 0)
                    name += string(" ({0} / {1})", item, save_id)
                else
                    name += string(" ({0})", item)
            }
            else if type == "[weapon]"
            {
                scr_weaponinfo(global.charweapon[item])
                name += concat(" (", global.charweapon[item], ", ", weaponnametemp, ")")
            }
            else if type == "[armor1]"
            {
                scr_armorinfo(global.chararmor1[item])
                name += concat(" (", global.chararmor1[item], ", ", armornametemp, ")")
            }
            else if type == "[armor2]"
            {
                scr_armorinfo(global.chararmor2[item])
                name += concat(" (", global.chararmor2[item], ", ", armornametemp, ")")
            }
            else if type == "[spell]"
            {
                var _val = global.spell[item][real(string_char_at(name, 1) + string_char_at(name, 2))] // probably could have been done in a way that didn't DEPEND on the id being at the start of the string but i wanted the id to be at the start of the string anyway so like whatever lol
                scr_spellinfo(_val)
                
                if string_pos("Empty", name) > 0 && spellname != " "
                    name = string_replace(name, "Empty", spellname)
                    
                name += concat(" (", _val,")")
                
            }
            else if type == "[hp]"
                name += concat(" (", global.hp[item],")")
            else if type == "[hpmax]"
                name += concat(" (", global.maxhp[item],")")
            else if type == "[attack]"
                name += concat(" (", global.at[item],")")
            else if type == "[defense]"
                name += concat(" (", global.df[item],")")
            else if type == "[magic]"
                name += concat(" (", global.mag[item],")")
            else if type == "[setmember]"
            {
                var _charname = global.charname[global.char[item]]
                if _charname == global.charname[0]
                    _charname = "Empty"
                name += concat(" (", global.char[item], ", ", _charname, ")")
            }
        }
            
		scr_84_draw_text_outline(xx, yy, prefix + name)
		yy += vspacing
		if (func_depth < menu_depth && ndx == selection_indices[func_depth])
			yy = scr_84_draw_menu(item, xx + 20, yy, vspacing, selection_indices, func_depth + 1, menu_depth)
	}
	return yy;
}
