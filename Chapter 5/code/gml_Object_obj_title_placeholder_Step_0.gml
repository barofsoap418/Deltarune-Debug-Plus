if (up_p())
{
	choice_index = ((choice_index - 1) < 0) ? (array_length_1d(choice) - 1) : (choice_index - 1)
	snd_play_x(snd_menumove, 1, 1.2)
}
if (down_p())
{
	choice_index = ((choice_index + 1) > (array_length_1d(choice) - 1)) ? 0 : (choice_index + 1)
	snd_play_x(snd_menumove, 1, 1)
}
if (button1_p())
{
	if (choice_index == 0)
	{
		var menu_go = 0
		var roomchoice = room_intro_ch5
		if (scr_chapter_save_file_exists(global.chapter) || ossafe_file_exists("dr.ini"))
			menu_go = 1
		if (scr_completed_chapter_any_slot(global.chapter))
			menu_go = 2
		if (menu_go == 0 || menu_go == 1)
			roomchoice = room_intro_ch5
		if (menu_go == 2)
		{
			scr_windowcaption("DELTARUNE")
			global.tempflag[10] = 1
			roomchoice = room_legend
			global.plot = 0
		}
		global.darkzone = 0
		room_goto(roomchoice)
	}
	else if (choice_index == 1)
	{
		room_goto(room_battletest)
	}
	else if (choice_index == 2)
	{
		scr_load()
	}
	else if (choice_index == 3)
	{
		room_goto(PLACE_MENU)
	}
}

if (keyboard_check_pressed(ord("L")))
{
	var doload = true
	with (obj_debugProfiler)
	{
		if (rmdebug)
			doload = false
	}
	if (doload)
	{
	    if keyboard_check(ord("1"))
	       global.filechoice = 0
	    if keyboard_check(ord("2"))
           global.filechoice = 1
        if keyboard_check(ord("3"))
           global.filechoice = 2
		scr_load()
    }
}
