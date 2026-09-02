function debug_printline(arg0, arg1)
{
    if (scr_debug())
    {
        draw_set_font(fnt_small)
        draw_set_color(c_white)//c_black)
        yy = 480 - (8 * arg1)
        xx = 2
        
        draw_text_outline(xx, yy, arg0) // this isn't in the original function's code for some reason even though it just does nohting without it
        
        draw_set_color(c_white)
    }
}
