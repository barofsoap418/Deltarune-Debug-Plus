if (ds_map_find_value(async_load, "id") == request_id)
{
    var status = ds_map_find_value(async_load, "status")
    if (dialog_type == "string" && status == true)
    {
        var result = ds_map_find_value(async_load, "result")
        request_handler(result)
    }
    else if (dialog_type == "question")
    {
        request_handler(status)
    }
    
    instance_destroy()
}