if !scr_debug()
{
    instance_destroy()
    exit
}
writedisplay = 0
alarm[0] = 300
showdebug = 0
cutsceneshow = 0
windowswitcher = 0
interactshower = 0
depth = -9999

var i = array_length_1d(global.flag) - 1
while (i > -1)
{
    lastval[i] = global.flag[i]
    i--
}


toggleFlagGUI = false
enableFlagDetection = false
maxFlags = 27
for (var i = 0; i < maxFlags; i ++)
    flagSetArray[i] = ""
displaySetFlagsArray = false

// Ch5 code expects this to be here, no clue what it does - gmlive related maybe?
rmdebug = false;