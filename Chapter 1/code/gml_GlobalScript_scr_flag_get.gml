function scr_flag_get(arg0)
{
    return global.flag[arg0];
}
function scr_flag_name_get(arg0)
{
    var v = global.flagname[arg0]
    return is_undefined(v) ? "*unknown flag*" : v;
}
function scr_flag_get_ext(arg0, arg1, arg2 = 1)
{
    if (arg1 < 0)
        scr_flag_get(arg0)
    else
        return scr_get_bitmask_value(global.flag[arg0], arg1, arg2);
}
