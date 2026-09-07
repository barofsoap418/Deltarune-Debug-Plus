setup_encounter = 0
if (global.fighting == 0)
{
	if (sunkus_kb_check_pressed(ord("1")) || gamepad_button_check_pressed(0, gp_shoulderl))
		global.encounterno--
	if (sunkus_kb_check_pressed(ord("2")) || gamepad_button_check_pressed(0, gp_shoulderr))
		global.encounterno++
	if (sunkus_kb_check_pressed(ord("3")))
		global.encounterno -= 5
	if (sunkus_kb_check_pressed(ord("4")))
		global.encounterno += 5
    if (sunkus_kb_check_pressed(ord("5")))
    {
        var _encountergoto = get_string("Jump to which encounter?", "")
        
        if _encountergoto != ""
        {
            try
            {
                _encountergoto = real(_encountergoto)
                if _encountergoto < encountermin || _encountergoto > encountermax
                    show_message("Must be between " + string(encountermin) + " and " + string(encountermax) + "!!!")
                else
                    global.encounterno = _encountergoto
            }
            catch(exc)
                show_message("Must be a number!!!")
        }
    }
	if (sunkus_kb_check_pressed(ord("0")))
		global.encounterno = 500
}
global.encounterno = clamp(global.encounterno, encountermin, encountermax)
if (instance_exists(obj_chaseenemy))
	obj_chaseenemy.myencounter = global.encounterno
if (global.fighting == 0)
{
	if (sunkus_kb_check_pressed(ord("6")))
	{
		scr_losechar()
		scr_setparty(1, 1, 0)
	}
	if (sunkus_kb_check_pressed(ord("7")))
		scr_setparty(0, 0, 0)
	if (sunkus_kb_check_pressed(ord("8")))
	{
		scr_setparty(0, 1, 0)
	}
	if (sunkus_kb_check_pressed(ord("9")))
	{
		scr_setparty(1, 0, 0)
	}
	/*if (sunkus_kb_check_pressed(ord("0")))
	{
		scr_setparty(1, 0, 0)
		scr_itemget(1)
	}*/
	draw_set_color(c_lime)
	scr_84_set_draw_font("main")
	draw_text(0, 440, string_hash_to_newline("Party:  " + string(global.charname[global.char[0]]) + " " + string(global.charname[global.char[1]]) + " " + string(global.charname[global.char[2]])))
	draw_text(0, 455, string_hash_to_newline("6: full party. 7:kris only. 8:kris and ralsei. 9:kris and susie"))
}
if (!instance_exists(obj_debug_xy))
{
	if (global.fighting == 0)
	{
		scr_encountersetup(global.encounterno)
		draw_set_color(c_black)
		ossafe_fill_rectangle(0, 0, 80, 50, false)
		draw_set_color(c_white)
		scr_84_set_draw_font("mainbig")
		draw_text(0, 0, string_hash_to_newline("EncounterNo: " + string(global.encounterno)))
		for (i = 0; i < 3; i++)
		{
			if (global.monstertype[i] > 0)
				draw_text(0, 20 + (i * 20), string_hash_to_newline(object_get_name(global.monsterinstancetype[i])))
		}
		draw_set_color(c_ltgray)
		scr_84_set_draw_font("main")
		for (j = 1; j < 5; j++)
		{
			scr_encountersetup(global.encounterno + j)
			for (i = 0; i < 3; i++)
			{
				draw_text(0, 60 + (j * 70), string_hash_to_newline("Encounter: " + string(global.encounterno + j)))
				if (global.monstertype[i] > 0)
					draw_text(0, 70 + (i * 10) + (j * 70), string_hash_to_newline(object_get_name(global.monsterinstancetype[i])))
			}
		}
		draw_text(300, 0, string_hash_to_newline("Adjust EncounterNo:#1- 2+#3----- 4+++++#5 jump to encounter"))
		scr_encountersetup(global.encounterno)
	}
	else
	{
	}
}
if (global.fighting == 1 && sunkus_kb_check_pressed(ord("D")))
{
	if (!i_ex(obj_danmaku_analyzer))
	{
		instance_create(0, 0, obj_danmaku_analyzer)
	}
	else
	{
		with (obj_danmaku_analyzer)
			instance_destroy()
	}
}
