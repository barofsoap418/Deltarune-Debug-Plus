if (up_p())
{
    choice_index = ((choice_index - 1) < 0) ? (array_length_1d(choice) - 1) : (choice_index - 1)
    var _mysnd = audio_play_sound(snd_menumove, 50, 0)
    snd_volume(_mysnd, 1, 0)
    snd_pitch(_mysnd, 1.2)
}
if (down_p())
{
    choice_index = ((choice_index + 1) > (array_length_1d(choice) - 1)) ? 0 : (choice_index + 1)
    var _mysnd2 = snd_play(snd_menumove)
    snd_volume(_mysnd2, 1, 0)
}
choice_index = clamp(choice_index, 0, array_length(choice) - 1)
if (button1_p())
{
    if (choice_index == 0)
    {
        var menu_go = 0
        var roomchoice = room_legend
        var CH = string(global.chapter)
        if (ossafe_file_exists("filech" + CH + "_0"))
            menu_go = 1
        if (ossafe_file_exists("filech" + CH + "_1"))
            menu_go = 1
        if (ossafe_file_exists("filech" + CH + "_2"))
            menu_go = 1
        if (ossafe_file_exists("filech" + CH + "_3"))
            menu_go = 1
        if (ossafe_file_exists("dr.ini"))
            menu_go = 1
        if (ossafe_file_exists("filech" + CH + "_3"))
            menu_go = 2
        if (ossafe_file_exists("filech" + CH + "_4"))
            menu_go = 2
        if (ossafe_file_exists("filech" + CH + "_5"))
            menu_go = 2
        if (menu_go == 0 || menu_go == 1)
            roomchoice = room_legend
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
if (scr_debug())
{
    if (keyboard_check_pressed(ord("L")))
    {
        // WHY DON'T THESE KEYS WORK IN CHAPTER 1???????????????
        if keyboard_check(ord("1"))
           global.filechoice = 0
        if keyboard_check(ord("2"))
           global.filechoice = 1
        if keyboard_check(ord("3"))
           global.filechoice = 2
        scr_load()
    }
}
