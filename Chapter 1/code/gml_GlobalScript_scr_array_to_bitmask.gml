function scr_array_to_bitmask(arg0, arg1 = 1)
{
    var maxvalue = power(2, arg1) - 1
    var newFlag = 0
    var arrayLength = array_length(arg0)
    if (arrayLength > floor(18 / arg1))
        scr_debug_print("Warning! values_to_bitmask: Array too long. Truncating to " + string(floor(18 / arg1)))
    for (var i = 0; i < min(arrayLength, floor(18 / arg1)); i++)
    {
        var value = arg0[i]
        if (value > maxvalue || value < 0 || floor(value) != value)
        {
            scr_debug_print("Warning! values_to_bitmask: Value " + string(i) + "is too large, too small or not an integer.")
            value = clamp(floor(value), 0, maxvalue)
            scr_debug_print("Fixed Value: " + string(value))
        }
        newFlag |= ((value & maxvalue) << (i * arg1))
    }
    return newFlag;
}
function scr_bitmask_to_array(arg0, arg1, arg2 = 1)
{
    var mask = power(2, arg2) - 1
    var values = array_create(arg1)
    for (var i = 0; i < arg1; i++)
        values[i] = (arg0 >> (i * arg2)) & mask
    return values;
}
function scr_set_bitmask_value(arg0, arg1, arg2, arg3 = 1)
{
    var maxvalue = power(2, arg3) - 1
    if (arg2 > maxvalue || arg2 < 0 || floor(arg2) != arg2)
    {
        scr_debug_print("Warning! scr_set_bitmask_value: Value " + string(arg2) + " is too large, too small or not an integer.")
        arg2 = clamp(floor(arg2), 0, maxvalue)
        scr_debug_print("Fixed Value: " + string(arg2))
    }
    if (arg1 > (18 / arg3))
        scr_debug_print("ERROR: WRITING OUT OF BITMASK BOUNDS")
    arg0 &= ~(maxvalue << (arg1 * arg3))
    arg0 |= ((arg2 & maxvalue) << (arg1 * arg3))
    return arg0;
}
function scr_get_bitmask_value(arg0, arg1, arg2 = 1)
{
    var maxvalue = power(2, arg2) - 1
    return (arg0 >> (arg1 * arg2)) & maxvalue;
}
