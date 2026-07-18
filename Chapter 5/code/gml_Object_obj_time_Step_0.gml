if (scr_debug())
{
	if (keyboard_check_pressed(vk_f12))
	{
		var num = 0
		while (file_exists(program_directory + "screenshots/deltarune_" + string(num) + ".png"))
			num++
		screen_save(program_directory + "screenshots/deltarune_" + string(num) + ".png")
	}
	
	if (sunkus_kb_check_pressed(ord("C")) && sunkus_kb_check_direct(vk_shift))
	{
		global.flag[24] = (global.flag[24] + 1) % 2
		scr_debug_print("platforming ability toggled")
	}
	
	if (sunkus_kb_check_pressed(ord("H")) && sunkus_kb_check_direct(vk_shift))
	{
		scr_flag_set(1311, (scr_flag_get(1311) > 0) ? 0 : 1)
		scr_debug_print("ralsei hat mode: " + string(global.flag[1311]))
	}
	
	if (sunkus_kb_check_pressed(vk_insert))
	{
		if (room_exists(room + ROOM_INITIALIZE))
			room_goto_next()
		else
			scr_debug_print("LAST ROOM")
	}
	
	if (sunkus_kb_check_pressed(vk_delete))
	{
		if (room_exists(room - ROOM_INITIALIZE))
			room_goto_previous()
	}
	
	if (sunkus_kb_check_pressed(vk_home))
	{
		if (sunkus_kb_check(ord("2")))
		{
			room_goto(room_krisroom)
			global.plot = 0
			global.darkzone = 0
		}
		if (sunkus_kb_check(ord("3")))
		{
			room_goto(room_dw_castle_area_1)
			global.plot = 7
			global.darkzone = 1
		}
		if (sunkus_kb_check(ord("7")))
			room_goto(room_legend_neo)
		if (sunkus_kb_check(ord("8")))
		{
			room_goto(room_battletest)
			global.darkzone = 1
		}
		if (sunkus_kb_check(ord("9")))
		{
			room_goto(room_bullettest)
			global.darkzone = 1
		}
	}
	
	if (sunkus_kb_check_pressed(ord("S")))
		instance_create(0, 0, obj_savemenu)
		
	if (sunkus_kb_check_pressed(ord("L")))
		scr_load()
		
	if (sunkus_kb_check_pressed(ord("R")) && sunkus_kb_check(vk_backspace))
		game_restart_true()
		
	if (sunkus_kb_check_pressed(ord("R")) && !sunkus_kb_check(vk_backspace))
	{
		snd_free_all()
		room_restart()
		global.interact = 0
	}
	
	if sunkus_kb_check(vk_rshift) && sunkus_kb_check_pressed(ord("P"))
	{
	   scr_exportsheets("spr_sans_d")
	   scr_exportsheets("spr_face_n_matome")
	   scr_exportsheets("spr_flowery_walk_right")
	   scr_exportsheets("spr_susie_dance")
	   scr_exportsheets("spr_ralsei_pirouette")
	   
	   var _dumpme = ["spr_susieb_idle", "spr_krisb_pirouette", "spr_flowery_pirouette", "spr_face_n_matome", "spr_asgored", "spr_asgoreu", "spr_asgorel", "spr_asgorer", "spr_tenna_dance_cabbage_smol", "spr_spamton_idle"]
	   scr_exportsheets_list("test dump", _dumpme)
	}
}
if (global.is_console && sunkus_kb_check_pressed(vk_pause))
{
	paused = !paused
	if (!sprite_exists(screenshot))
		screenshot = sprite_create_from_surface(application_surface, 0, 0, view_wport, view_hport, 0, 0, 0, 0)
}
if (global.is_console)
{
	if (!i_ex(obj_border_controller))
	{
		var border_controller = instance_create(0, 0, obj_border_controller)
		border_controller.init_border()
	}
}
