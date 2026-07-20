if (scr_debug())
{
    if (keyboard_check(ord("3")) && keyboard_check(ord("D")))
    {
        global.char[0] = 1
        global.char[1] = 0
        global.char[2] = 0
        global.interact = 0
        global.darkzone = 1
        room_goto(room_dark1)
    }
    if (keyboard_check(ord("4")) && keyboard_check(ord("D")))
    {
        global.char[0] = 1
        global.char[1] = 3
        global.char[2] = 2
        global.interact = 0
        global.darkzone = 1
        room_goto(room_field_checkers5)
    }
    if (keyboard_check(ord("5")) && keyboard_check(ord("D")))
    {
        global.char[0] = 1
        global.char[1] = 0
        global.char[2] = 0
        global.interact = 0
        global.darkzone = 1
        room_goto(room_castle_tutorial)
    }
    if (keyboard_check(ord("6")) && keyboard_check(ord("D")))
    {
        global.char[0] = 1
        global.char[1] = 3
        global.char[2] = 0
        global.interact = 0
        global.darkzone = 1
        global.plot = 32
        room_goto(room_field1)
    }
    if (keyboard_check(ord("7")) && keyboard_check(ord("D")))
    {
        global.char[0] = 1
        global.char[1] = 3
        global.char[2] = 0
        global.interact = 0
        global.darkzone = 1
        room_goto(room_forest_area3)
    }
    if (keyboard_check(ord("8")) && keyboard_check(ord("D")))
    {
        global.char[0] = 1
        global.char[1] = 3
        global.char[2] = 0
        global.interact = 0
        global.darkzone = 1
        room_goto(room_forest_fightsusie)
    }
    if (keyboard_check(ord("9")) && keyboard_check(ord("D")))
    {
        global.char[0] = 2
        global.char[1] = 0
        global.char[2] = 0
        global.interact = 0
        global.darkzone = 1
        global.plot = 154
        room_goto(room_cc_prison_cells)
    }
    if (keyboard_check(ord("6")) && keyboard_check(ord("J")))
    {
        global.char[0] = 1
        global.char[1] = 3
        global.char[2] = 0
        global.interact = 0
        global.darkzone = 1
        global.charauto[2] = 0
        room_goto(room_battletest)
    }
    if (keyboard_check(ord("7")) && keyboard_check(ord("J")))
    {
        global.char[0] = 1
        global.char[1] = 2
        global.char[2] = 3
        global.interact = 0
        global.darkzone = 1
        global.charauto[2] = 0
        room_goto(room_battletest)
    }
    if (keyboard_check(ord("8")) && keyboard_check(ord("J")))
    {
        global.char[0] = 1
        global.char[1] = 2
        global.char[2] = 3
        global.interact = 0
        global.darkzone = 1
        global.charauto[2] = 0
        global.plot = 165
        scr_keyitemget(5)
        global.tempflag[4] = 1
        repeat (13)
            scr_weaponget(5)
        room_goto(room_cc_prison_prejoker)
    }
    if (keyboard_check(ord("9")) && keyboard_check(ord("J")))
    {
        global.char[0] = 1
        global.char[1] = 2
        global.char[2] = 3
        global.interact = 0
        global.darkzone = 1
        global.charauto[2] = 0
        global.flag[248] = 0
        room_goto(room_cc_kingbattle)
    }
    if (keyboard_check(ord("2")) && keyboard_check(ord("W")))
    {
        global.interact = 0
        global.darkzone = 0
        room_goto(room_town_krisyard)
    }
    if (keyboard_check(ord("3")) && keyboard_check(ord("W")))
    {
        global.interact = 0
        global.darkzone = 0
        room_goto(room_schooldoor)
    }
    if (keyboard_check(ord("4")) && keyboard_check(ord("W")))
    {
        global.interact = 0
        global.darkzone = 0
        room_goto(room_school_unusedroom)
    }
    if (keyboard_check(ord("5")) && keyboard_check(ord("W")))
    {
        global.interact = 0
        global.darkzone = 0
        global.plot = 251
        room_goto(room_town_school)
    }
    if (keyboard_check(ord("6")) && keyboard_check(ord("W")))
    {
        global.interact = 0
        global.darkzone = 0
        global.plot = 251
        room_goto(room_town_north)
    }
}

if (!paused)
{
    if (scr_84_debug(1))
        exit
	global.time += 1
	if (global.is_console && os_is_paused())
	{
		paused = true
		if (!sprite_exists(screenshot))
		{
			var sw = surface_get_width(application_surface)
			var sh = surface_get_height(application_surface)
			screenshot = sprite_create_from_surface(application_surface, 0, 0, sw, sh, 0, 0, 0, 0)
		}
		exit
	}
}
else
{
	exit
}
if (keyboard_check(vk_escape))
{
	if (quit_timer < 0)
		quit_timer = 0
	quit_timer += 1
	if (quit_timer >= 30)
		ossafe_game_end()
}
else
{
	quit_timer -= 2
}
if (keyboard_check_pressed(vk_f4))
	fullscreen_toggle = 1
if (fullscreen_toggle == 1)
{
	fullscreen_toggle = 0
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false)
		ossafe_ini_open("true_config.ini")
		ini_write_real("SCREEN", "FULLSCREEN", 0)
		ossafe_ini_close()
		ossafe_savedata_save()
	}
	else
	{
		window_set_fullscreen(true)
		ossafe_ini_open("true_config.ini")
		ini_write_real("SCREEN", "FULLSCREEN", 1)
		ossafe_ini_close()
		ossafe_savedata_save()
	}
}
if (window_center_toggle == 2)
{
	window_center()
	window_center_toggle = 0
}
if (window_center_toggle == 1)
	window_center_toggle = 2
for (i = 0; i < 10; i += 1)
{
	global.input_released[i] = 0
	global.input_pressed[i] = 0
}
if (obj_gamecontroller.gamepad_active == 1)
{
	for (var j = 0; j < 4; j++)
	{
		if (keyboard_check(global.input_k[j]) || gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[j]) || scr_gamepad_axis_check(obj_gamecontroller.gamepad_id, j))
		{
			if (global.input_held[j] == 0)
				global.input_pressed[j] = 1
			global.input_held[j] = 1
		}
		else
		{
			if (global.input_held[j] == 1)
				global.input_released[j] = 1
			global.input_held[j] = 0
		}
	}
	for (var k = 4; k < 10; k++)
	{
		if (keyboard_check(global.input_k[k]) || gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[k]))
		{
			if (global.input_held[k] == 0)
				global.input_pressed[k] = 1
			global.input_held[k] = 1
		}
		else
		{
			if (global.input_held[k] == 1)
				global.input_released[k] = 1
			global.input_held[k] = 0
		}
	}
}
else
{
	for (var l = 0; l < 10; l++)
	{
		if (keyboard_check(global.input_k[l]))
		{
			if (global.input_held[l] == 0)
				global.input_pressed[l] = 1
			global.input_held[l] = 1
		}
		else
		{
			if (global.input_held[l] == 1)
				global.input_released[l] = 1
			global.input_held[l] = 0
		}
	}
}
if (border_fade_out)
{
	if (border_alpha > 0)
	{
		border_alpha -= border_fade_value
		if (border_alpha <= 0)
			border_alpha = 0
	}
}
else if (border_fade_in)
{
	if (border_alpha <= 1)
	{
		border_alpha += border_fade_value
		if (border_alpha >= 1)
			border_alpha = 1
	}
}
if (scr_debug())
{
    if (mouse_check_button_pressed(mb_middle))
        instance_create(0, 0, obj_debug_xy)
	if (keyboard_check_pressed(192))
	{
		if (room_speed == 30)
			room_speed = 200
		else
			room_speed = 30
	}
	if (keyboard_check_pressed(vk_numpad3))
	{
		if (room_speed == 30)
			room_speed = 5
		else
			room_speed = 30
	}
}
