function draw_text_debug(arg0, arg1, arg2, arg3 = 0, arg4 = c_white)
{
    if scr_debug()
    {
        var _bckcol = draw_get_color()
        draw_set_color(arg4)
        draw_set_font(fnt_small)
        draw_text(arg0, arg1, arg2)
        draw_set_color(_bckcol)
    }
}
