x = round(mouse_x)
y = round(mouse_y)
siner++
mousebuffer--
main_focus = 1
if (instance_exists(obj_debug_windows))
    main_focus = 0
if (main_focus)
{
    if (mouse_check_button_pressed(mb_left) && mousebuffer < 0)
    {
        mouse_held = 0
        obj_check = collision_rectangle(x - 2, y - 2, x + 2, y + 2, all, false, true)
        if (obj_check != -4)
        {
            visiblecheck = 0
            if (show_invisible == 1)
                visiblecheck = 1
            else if (obj_check.visible == 1)
                visiblecheck = 1
            if (visiblecheck == 1 && obj_check.image_alpha > 0)
                selected_object = obj_check
        }
        else
        {
            selected_object = -898
        }
    }
}
if (main_focus)
{
    if (mouse_check_button(mb_left) && instance_exists(selected_object))
    {
        mouse_held++
        mouse_held_minimum = 5
        if (mouse_held >= mouse_held_minimum && instance_exists(selected_object))
        {
            selected_object.x = x - (selected_object.sprite_width / 2)
            selected_object.y = y - (selected_object.sprite_height / 2)
        }
    }
    else
    {
        mouse_held = 0
    }
}
if (keyboard_check_pressed(vk_pagedown))
{
    if (show_all_object_xy == 1)
        show_all_object_xy = 0
    else
        show_all_object_xy = 1
    mouse_held = 0
}
if (instance_exists(selected_object) && !keyboard_check(ord("P")))
{
    if (selected_object.sprite_index != -1)
    {
        os = selected_object
        if (keyboard_check(vk_up))
            os.y -= 1
        if (keyboard_check(vk_left))
            os.x -= 1
        if (keyboard_check(vk_down))
            os.y += 1
        if (keyboard_check(vk_right))
            os.x += 1
        draw_sprite_ext_flash(os.sprite_index, os.image_index, os.x, os.y, os.image_xscale, os.image_yscale, os.image_angle, os.image_blend, (sin(siner / 8) * 0.5) + 0.5)
    }
}
if (keyboard_check_pressed(vk_pageup))
{
    xy_camera_relative++
    if (xy_camera_relative >= 3)
        xy_camera_relative = 0
}
if (keyboard_check_pressed(vk_delete))
{
    if (instance_exists(selected_object))
    {
        with (selected_object)
            instance_destroy()
        selected_object = -999
    }
}
if (keyboard_check_pressed(ord("V")))
{
    if (show_invisible == 0)
        show_invisible = 1
    else
        show_invisible = 0
}
if (siner >= 5 && mouse_check_button_pressed(mb_middle))
{
    instance_destroy()
    with (obj_debug_windows)
        instance_destroy()
}
if (show_all_object_xy == 1)
{
    for (i = 0; i < instance_count; i++)
    {
        findo = instance_id_get(i)
        if (instance_exists(findo))
        {
            visiblecheck = 0
            if (show_invisible == 1)
                visiblecheck = 1
            else if (findo.visible == 1)
                visiblecheck = 1
            if (visiblecheck == 1 && findo.sprite_index != -1)
            {
                fox = findo.x
                foy = findo.y
                if (xy_camera_relative == 1)
                {
                    fox -= __view_get(e__VW.XView, 0)
                    foy -= __view_get(e__VW.YView, 0)
                }
                if (xy_camera_relative == 2)
                {
                    fox -= findo.xstart
                    foy -= findo.ystart
                }
                draw_info = true
                if (findo.object_index == object_index)
                    draw_info = false
                if (findo.object_index == obj_overworldheart)
                    draw_info = false
                if (findo.object_index == obj_grazebox)
                    draw_info = false
                if (draw_info == true)
                {
                    draw_set_color(c_black)
                    draw_rectangle(findo.x - 4, findo.y - 32, findo.x + 80, findo.y, false)
                    draw_set_font(fnt_main)
                    draw_set_color(c_aqua)
                    draw_text(findo.x, findo.y - 32, string_hash_to_newline(object_get_name(findo.object_index)))
                    draw_text(findo.x, findo.y - 16, string_hash_to_newline(string(fox) + " , " + string(foy)))
                    draw_set_color(c_red)
                    draw_rectangle(findo.bbox_left, findo.bbox_top, findo.bbox_right, findo.bbox_bottom, true)
                }
            }
        }
    }
}
if (show_all_object_xy == 1)
{
    fox = x
    foy = y
    if (xy_camera_relative == 1)
    {
        fox -= __view_get(e__VW.XView, 0)
        foy -= __view_get(e__VW.YView, 0)
    }
    if (xy_camera_relative == 2)
    {
        fox -= xstart
        foy -= ystart
    }
    draw_set_color(c_black)
    draw_rectangle(x - 4, y - 24, x + 60, y, false)
    draw_set_color(c_fuchsia)
    draw_text(x, y - 20, string_hash_to_newline(string(fox) + " , " + string(foy)))
}
draw_set_color(c_black)
draw_line_width(x + 16, y + 16, x + 2, y + 2, 5)
draw_set_color(c_white)
draw_line_width(x + 12, y + 12, x + 3, y + 3, 4)
draw_set_color(make_color_hsv(siner * 6, 255, 255))
draw_line_width(x + 7, y + 7, x + 3, y + 3, 3)
old_right_click = 0
if (!old_right_click)
{
    if (mouse_check_button_pressed(mb_right))
    {
        main_focus = 0
        if (!instance_exists(obj_debug_windows))
        {
            instance_create(0, 0, obj_debug_windows)
            if (!instance_exists(selected_object))
                obj_debug_windows.type = 1
            with (obj_debug_windows)
                event_user(15)
        }
        else
        {
            with (obj_debug_windows)
                instance_destroy()
        }
    }
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
