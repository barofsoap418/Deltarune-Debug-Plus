if (scr_debug())
{
    if (!variable_global_exists("debug_fps_display"))
        exit
    if (!global.debug_fps_display)
        exit
    draw_set_font(fnt_main)
    draw_set_color(c_red)
    draw_text(camerax(), cameray(), fps)
    draw_set_color(c_white)
}
