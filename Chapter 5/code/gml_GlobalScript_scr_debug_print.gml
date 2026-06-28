function scr_debug_print(arg0)
{
	if (!scr_debug())
        exit
    if (!instance_exists(obj_debug_gui))
    {
        instance_create(camerax() + 10, cameray() + 10, obj_debug_gui)
        obj_debug_gui.depth = -9999
    }
    obj_debug_gui.newtext = arg0
    with (obj_debug_gui)
    {
        message[messagecount] = newtext
        newtext = ""
        timer[messagecount] = 90 - totaltimer
        totaltimer += timer[messagecount]
        messagecount++
        debugmessage = message[0]
        for (i = 1; i < messagecount; i++)
            debugmessage += ("#" + message[i])
    }
}
function scr_debug_clear_all()
{
    scr_debug_clear_persistent()
}
