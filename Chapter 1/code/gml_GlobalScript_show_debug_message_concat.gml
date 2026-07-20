function show_debug_message_concat()
{
    var _string = ""
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i])
    show_debug_message(_string)
    //scr_debug_print(_string) // remove/make optional if it causes too many messages to appear in some areas and lag the game
}