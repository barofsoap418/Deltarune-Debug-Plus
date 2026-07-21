if (global.interact == 0)
{
	global.specialbattle = 0
	global.flag[9] = 1
	global.batmusic[0] = snd_init("battle.ogg")
	
	// set proper battle music in room_battletest
	if room == room_battletest
	{
	    if global.encounterno == 12 || global.encounterno == 27
            global.batmusic[0] = snd_init("checkers.ogg")
	    else if global.encounterno == 20
            global.batmusic[0] = snd_init("vs_susie.ogg")
        else if global.encounterno == 25
            global.batmusic[0] = snd_init("joker.ogg")
        else if global.encounterno == 31
            global.batmusic[0] = snd_init("lancerfight.ogg")
        else if global.encounterno == 40
            global.batmusic[0] = snd_init("kingboss.ogg")
	}
	
	alarm[5] = -300
	vspeed = 0
	global.interact = 1
	con = 1
}
