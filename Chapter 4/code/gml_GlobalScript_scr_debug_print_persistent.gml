function scr_debug_print_persistent(arg0, arg1)
{
    // this isn't how the function worked at all probably but i don't feel like figuring it out atm
    // from what i gleamed, i think it creates a unique printing object with its own tag, which
    // scr_debug_delete_persistent uses to delete specific persistent printers?
    //scr_debug_print(arg0)
    //scr_debug_print(arg1)
}
function debug_print_persistent(arg0, arg1)
{
}
function scr_debug_delete_persistent(arg0, arg1 = false)
{
    scr_debug_print_persistent(arg0, arg1)
}
function scr_debug_clear_persistent()
{
    with obj_debug_gui
        instance_destroy()
}
