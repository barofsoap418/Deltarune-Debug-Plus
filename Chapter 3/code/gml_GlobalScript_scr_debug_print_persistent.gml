function scr_debug_print_persistent(arg0, arg1)
{
    // this isn't how the function worked at all probably but i don't feel like figuring it out atm
    // from what i gleamed, i think it creates a unique printing object with its own tag, which
    // scr_debug_delete_persistent uses to delete specific persistent printers?
    //scr_debug_print(arg0)
    //scr_debug_print(arg1)
    
    // todo: chapter 2 has code in this function to draw text in the top right of the screen. the code in this chapter and onwards indicates that this function was reworked. i suspect the code from chapter 2 was moved to an object that this function instead spawns that object with a unique tag so the object can be deleted. figure this shit out
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
