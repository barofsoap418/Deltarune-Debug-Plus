function ossafe_get_string(message, def_val, handler)
{
    // probably want to have windows use the blocking dialogs still, but disabling it for testing for now
    if (false /*os_type == os_windows*/)
    {
        handler(get_string(message, def_val))
    }
    else
    {
        keyboard_clear(keyboard_key)
        var helper = instance_create_depth(x, y, depth, obj_ddp_async_helper)
        with (helper)
        {
            dialog_type = "string"
            request_handler = handler
            request_id = get_string_async(message, def_val)
        }
    }
}

function ossafe_get_integer(message, def_val, handler)
{
    if (false /*os_type == os_windows*/)
    {
        handler(get_integer(message, def_val))
    }
    else
    {
        keyboard_clear(keyboard_key)
        var helper = instance_create_depth(x, y, depth, obj_ddp_async_helper)
        with (helper)
        {
            dialog_type = "string"
            request_handler = handler
            request_id = get_integer_async(message, def_val)
        }
    }
}

function ossafe_show_message(message)
{
    if (false /*os_type == os_windows*/)
    {
        show_message(message)
    }
    else
    {
        keyboard_clear(keyboard_key)
        show_message_async(message)
    }
}

function ossafe_show_question(message, handler)
{
    if (false /*os_type == os_windows*/)
    {
        handler(show_question(message))
    }
    else
    {
        keyboard_clear(keyboard_key)
        var helper = instance_create_depth(x, y, depth, obj_ddp_async_helper)
        with (helper)
        {
            dialog_type = "question"
            request_handler = handler
            request_id = show_question_async(message)
        }
    }
}