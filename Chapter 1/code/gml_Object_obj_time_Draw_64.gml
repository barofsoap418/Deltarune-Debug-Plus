if (scr_debug())
{
    if (variable_global_exists("chemg_menu_depth"))
    {
        if (global.chemg_menu_depth != 0)
            draw_sprite_ext(spr_pxwhite, 0, 0, 0, 640, 480, 0, #002B36, 0.9)
    }
    scr_84_debug(false)
}
if (quit_timer >= 1)
	draw_sprite_ext(scr_84_get_sprite("spr_quitmessage"), quit_timer / 7, 4, 4, 2, 2, 0, c_white, quit_timer / 15)
