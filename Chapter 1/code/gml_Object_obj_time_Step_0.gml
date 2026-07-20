if (scr_debug())
{
    if (keyboard_check_pressed(vk_f12))
    {
        var num = 0
        while (file_exists(program_directory + "screenshots/deltarune_" + string(num) + ".png"))
            num++
        screen_save(program_directory + "screenshots/deltarune_" + string(num) + ".png")
    }
    if (keyboard_check_pressed(vk_insert))
    {
        if (room_exists(room + 1))
            room_goto_next()
        else
            scr_debug_print("LAST ROOM")
    }
    
    if (keyboard_check_pressed(vk_delete))
    {
        if (room_exists(room - 1))
            room_goto_previous()
    }
    
    if (keyboard_check_pressed(vk_home))
    {
        if (keyboard_check(ord("2")))
        {
            room_goto(room_krisroom)
            global.plot = 0
            global.darkzone = 0
        }
        if (keyboard_check(ord("8")))
        {
            room_goto(room_battletest)
            global.darkzone = 1
        }
        if (keyboard_check(ord("9")))
        {
            room_goto(room_bullettest)
            global.darkzone = 1
        }
    }
    
    if (keyboard_check_pressed(ord("S")))
        instance_create(0, 0, obj_savemenu)
        
    if (keyboard_check_pressed(ord("L")))
        scr_load()
        
    if (keyboard_check_pressed(ord("R")) && keyboard_check(vk_backspace))
        game_restart_true()
        
    if (keyboard_check_pressed(ord("R")) && !keyboard_check(vk_backspace))
    {
        snd_free_all()
        room_restart()
        global.interact = 0
    }
}