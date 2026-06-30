if (global.chapter == 5)
{
	if (i_ex(obj_seth_shi_controller) && obj_seth_shi_controller.con < 1)
		exit
	if (i_ex(obj_seth_shinobeetle_controller) && obj_seth_shinobeetle_controller.con < 1)
		exit
	if (i_ex(obj_flowery_enemy) && obj_flowery_enemy.introcon < 2)
		exit
	if (i_ex(obj_pink_enemy) && obj_pink_enemy.introcon < 3)
		exit
	if (i_ex(obj_pink_enemy) && obj_pink_enemy.phase4introcon > 0)
		exit
	if (i_ex(obj_orange_green_controller) && obj_orange_green_controller.endcon > 0 && victory == 0)
	{
		if (grazenoise == 1 && victory == 0)
		{
			snd_play(snd_graze)
			grazenoise = 0
		}
		exit
	}
	if (i_ex(obj_orange_green_controller) && obj_orange_green_controller.afterbulletcon > 0)
		exit
	if (i_ex(obj_blue_enemy) && !obj_blue_enemy.done_intro)
		exit
	if (i_ex(obj_flowery_enemy))
	{
		if (obj_flowery_enemy.endcon > 0)
			exit
		if (obj_flowery_enemy.healingscenecon > 0)
			exit
		if (obj_flowery_enemy.phasetransition_con > 0 && global.mnfight != 2)
			exit
		if (obj_flowery_enemy.phasetransition_con == 1 && obj_flowery_enemy.visible == true)
			exit
	}
}
if (victory == 1 && victoried == 0)
{
	global.faceaction[0] = 0
	global.faceaction[1] = 0
	global.faceaction[2] = 0
	global.battleend = 1
	global.mnfight = -1
	global.myfight = 7
	with (battlewriter)
		instance_destroy()
	with (obj_face)
		instance_destroy()
	with (obj_smallface)
		instance_destroy()
	for (i = 0; i < 5; i += 1)
	{
		if (global.hp[i] < 1)
			global.hp[i] = round(global.maxhp[i] / 8)
	}
	lastbattlewriter = 32482473284732
	if (skipvictory == 0)
	{
		global.monstergold[3] += floor(global.tension / 10) * global.chapter
		if (global.charweapon[1] == 8)
			global.monstergold[3] += floor(global.monstergold[3] / 20)
		if (global.charweapon[1] == 53)
			global.monstergold[3] += floor(global.monstergold[3] / 20)
		global.monstergold[3] *= 1 + (scr_armorcheck_equipped_party(8) * 0.05)
		global.monstergold[3] *= 1 + (scr_armorcheck_equipped_party(21) * 0.3)
		global.monstergold[3] -= global.monstergold[3] * (scr_armorcheck_equipped_party(54) * 0.1)
		global.monstergold[3] = clamp(global.monstergold[3] - (global.monstergold[3] * (scr_armorcheck_equipped_party(32) * 0.9)), 0, global.monstergold[3])
		global.monstergold[3] = floor(global.monstergold[3])
		if (global.flag[37] == 1)
			global.monstergold[3] = 0
		global.gold += global.monstergold[3]
		global.xp += global.monsterexp[3]
		if (global.gold < 0)
			global.gold = 0
		global.fc = 0
		global.fe = 0
		global.battlemsg[0] = stringsetsubloc("* You won^1!&* Got ~1 EXP and ~2 D$./%", string(global.monsterexp[3]), string(global.monstergold[3]), "obj_battlecontroller_slash_Step_0_gml_42_0")
		if (global.flag[37] == 1)
			global.battlemsg[0] = stringsetloc("* You won the battle!/%", "obj_battlecontroller_slash_Step_0_gml_43_0")
		if (global.flag[63] == 1)
		{
			global.battlemsg[0] = stringsetsubloc("* You won^1!&* Got ~1 D$^1.&* You became stronger./%", string(global.monstergold[3]), "obj_battlecontroller_slash_Step_0_gml_46_0")
			if (scr_havechar(4))
				global.battlemsg[0] = stringsetsubloc("* You won^1!&* Got ~1 D$^1.&* Noelle became stronger./%", string(global.monstergold[3]), "obj_battlecontroller_slash_Step_0_gml_69_0")
			var lvsnd = snd_play_pitch(snd_dtrans_lw, 2)
			snd_volume(lvsnd, 0.7, 0)
			scr_levelup()
		}
		if (global.chapter == 5 && i_ex(obj_aqua_enemy) && i_ex(obj_netskie_enemy))
			stringsetloc("* Seth was defeated...&You won!/%", "obj_battlecontroller_slash_Step_0_gml_80_0")
		global.msg[0] = global.battlemsg[0]
		global.typer = global.battletyper
		lastbattlewriter = scr_battletext()
		if (global.flag[38] == 1)
		{
			with (lastbattlewriter)
				instance_destroy()
		}
		for (i = 0; i < 3; i += 1)
		{
			with (global.charinstance[i])
			{
				state = 7
				hurt = 0
				hurttimer = 0
			}
		}
	}
	victoried = 1
	victortimer = 0
	if (skipvictory == 1)
		victortimer = -20
	if (skipvictory == 2)
		victortimer = 9
	with (obj_tensionbar)
	{
		alarm[5] = 15
		hspeed = -10
		friction = -0.4
	}
}
if (victoried == 1)
{
	victortimer += 1
	if (i_ex(lastbattlewriter) == false && victortimer >= 10 && !i_ex(obj_seth_shi_controller) && !i_ex(obj_seth_shinobeetle_controller))
	{
		intro = 2
		if (bp <= 0)
			scr_endcombat()
	}
}
if (i_ex(obj_flowery_enemy) && obj_flowery_enemy.introcon == 2)
{
}
else if (global.myfight == 0)
{
	if (global.bmenuno == 0)
	{
		if (!i_ex(battlewriter) || (global.chapter == 2 && !i_ex(battlewriter)))
		{
			global.msg[0] = global.battlemsg[0]
			global.typer = global.battletyper
			scr_battletext()
		}
		if (left_p() == 1 && lbuffer < 0)
		{
			if (global.bmenucoord[0][global.charturn] == 0)
				global.bmenucoord[0][global.charturn] = 4
			else
				global.bmenucoord[0][global.charturn] -= 1
			movenoise = 1
			rbuffer = 1
			if (disablesusieralseiattack == 1 && (global.charturn == 1 || global.charturn == 2) && global.bmenucoord[0][global.charturn] == 0)
				global.bmenucoord[0][global.charturn] = 4
		}
		if (right_p() == 1 && rbuffer < 0)
		{
			if (global.bmenucoord[0][global.charturn] == 4)
				global.bmenucoord[0][global.charturn] = 0
			else
				global.bmenucoord[0][global.charturn] += 1
			movenoise = 1
			lbuffer = 1
			if (disablesusieralseiattack == 1 && (global.charturn == 1 || global.charturn == 2) && global.bmenucoord[0][global.charturn] == 0)
				global.bmenucoord[0][global.charturn] = 1
		}
		if (button1_p() == 1 && twobuffer < 0)
		{
			onebuffer = 1
			selnoise = 1
			if (global.bmenucoord[0][global.charturn] == 0)
				global.bmenuno = 1
			if (global.bmenucoord[0][global.charturn] == 1 && global.char[global.charturn] != 1)
			{
				onebuffer = 1
				global.bmenuno = 2
			}
			else if (global.bmenucoord[0][global.charturn] == 1)
			{
				onebuffer = 1
				global.bmenuno = 11
			}
			if (global.bmenucoord[0][global.charturn] == 2 && tempitem[0][global.charturn] != 0)
			{
				onebuffer = 1
				global.bmenuno = 4
				scr_iteminfo_temp(global.charturn)
				for (i = 0; i < 12; i += 1)
				{
					if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 0 && global.bmenucoord[4][global.charturn] > 0)
						global.bmenucoord[4][global.charturn] -= 1
				}
			}
			if (global.bmenucoord[0][global.charturn] == 3)
			{
				onebuffer = 1
				global.bmenuno = 12
			}
			if (global.bmenucoord[0][global.charturn] == 4)
			{
				if (i_ex(obj_flowery_enemy))
					scr_tensionheal(20)
				else if (i_ex(obj_orange_enemy))
					scr_tensionheal(20)
				else
					scr_tensionheal(40)
				global.faceaction[global.charturn] = 4
				global.charaction[global.charturn] = 10
				scr_nexthero()
			}
		}
		if (button2_p() == 1 && onebuffer < 0 && global.charturn > 0)
		{
			twobuffer = 1
			movenoise = 1
			scr_prevhero()
		}
		with (battlewriter)
			depth = 3
		with (obj_face_parent)
			depth = 3
		with (obj_smallface)
			depth = 3
	}
	if (global.bmenuno == 2 && global.flag[34] == 1)
	{
		with (battlewriter)
			skipme = 1
		with (battlewriter)
			depth = 10
		with (obj_face_parent)
			depth = 10
		with (obj_smallface)
			depth = 10
		thischar = global.char[global.charturn]
		if (right_p() || left_p())
		{
			cango = 1
			spellcoord = global.bmenucoord[2][global.charturn]
			if (spellcoord < 11)
			{
				if (global.spell[thischar][global.bmenucoord[2][global.charturn] + 1] == 0)
				{
					cango = 0
					if ((spellcoord % 2) == 1 && spellcoord > 0)
						global.bmenucoord[2][global.charturn] -= 1
				}
			}
			else
			{
				global.bmenucoord[2][global.charturn] -= 1
				cango = 0
			}
			if (cango == 1)
			{
				if ((spellcoord % 2) == 0)
					global.bmenucoord[2][global.charturn] += 1
				else
					global.bmenucoord[2][global.charturn] -= 1
			}
		}
		if (down_p())
		{
			spellcoord = global.bmenucoord[2][global.charturn]
			cango = 1
			if (spellcoord >= 10)
			{
				cango = 0
			}
			else
			{
				if (global.spell[thischar][spellcoord + 2] == 0)
					cango = 0
				if (spellcoord == 5 && global.spell[thischar][6] != 0 && global.spell[thischar][7] == 0)
					cango = 2
			}
			if (cango != 0)
			{
				if (cango == 1)
					global.bmenucoord[2][global.charturn] += 2
				if (cango == 2)
					global.bmenucoord[2][global.charturn] = 6
			}
		}
		if (up_p())
		{
			spellcoord = global.bmenucoord[2][global.charturn]
			cango = 1
			if (spellcoord <= 1)
				cango = 0
			if (cango == 1)
				global.bmenucoord[2][global.charturn] -= 2
		}
		global.tensionselect = global.spellcost[thischar][global.bmenucoord[2][global.charturn]]
		if (button1_p() && global.spell[thischar][global.bmenucoord[2][global.charturn]] != 0 && onebuffer < 0)
		{
			if (global.spellcost[thischar][global.bmenucoord[2][global.charturn]] <= global.tension)
			{
				onebuffer = 2
				global.bmenuno = 0
				selnoise = 1
				scr_spellinfo(global.spell[thischar][global.bmenucoord[2][global.charturn]])
				if (spelltarget == 0)
					scr_spellconsumeb()
				if (spelltarget == 1)
					global.bmenuno = 8
				if (spelltarget == 2)
					global.bmenuno = 3
			}
		}
		if (button2_p() && onebuffer < 0)
		{
			global.tensionselect = 0
			twobuffer = 1
			global.bmenuno = 0
			movenoise = 1
		}
	}
	if (global.bmenuno == 2 && global.flag[34] == 0)
	{
		with (battlewriter)
			skipme = 1
		with (battlewriter)
			depth = 10
		with (obj_face_parent)
			depth = 10
		with (obj_smallface)
			depth = 10
		thischar = global.charturn
		if (right_p() || left_p())
		{
			cango = 1
			spellcoord = global.bmenucoord[2][global.charturn]
			if (spellcoord < 11)
			{
				if (global.battlespell[thischar][global.bmenucoord[2][global.charturn] + 1] == 0)
				{
					cango = 0
					if ((spellcoord % 2) == 1 && spellcoord > 0)
						global.bmenucoord[2][global.charturn] -= 1
				}
			}
			else
			{
				global.bmenucoord[2][global.charturn] -= 1
				cango = 0
			}
			if (cango == 1)
			{
				if ((spellcoord % 2) == 0)
					global.bmenucoord[2][global.charturn] += 1
				else
					global.bmenucoord[2][global.charturn] -= 1
			}
		}
		if (down_p())
		{
			spellcoord = global.bmenucoord[2][global.charturn]
			cango = 1
			if (spellcoord >= 10)
			{
				cango = 0
			}
			else
			{
				if (global.battlespell[thischar][spellcoord + 2] == 0)
					cango = 0
				if (spellcoord == 5 && global.battlespell[thischar][6] != 0 && global.battlespell[thischar][7] == 0)
					cango = 2
			}
			if (cango != 0)
			{
				if (cango == 1)
					global.bmenucoord[2][global.charturn] += 2
				if (cango == 2)
					global.bmenucoord[2][global.charturn] = 6
			}
		}
		if (up_p())
		{
			spellcoord = global.bmenucoord[2][global.charturn]
			cango = 1
			if (spellcoord <= 1)
				cango = 0
			if (cango == 1)
				global.bmenucoord[2][global.charturn] -= 2
		}
		global.tensionselect = global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]]
		var _confirm = true
		var _noitems = true
		for (iii = 0; iii < 12; iii += 1)
		{
			if (tempitem[iii][global.charturn] != 0)
				_noitems = false
		}
		if (i_ex(obj_pink_enemy) && global.battlespellname[thischar][global.bmenucoord[2][global.charturn]] == global.actnamesus[obj_pink_enemy.myself][2] && _noitems == true)
			_confirm = false
		if (i_ex(obj_flowery_enemy) && global.charturn == 1 && global.bmenucoord[2][global.charturn] == 1 && disablesusieralseiattack)
			_confirm = false
		if (button1_p() && global.battlespell[thischar][global.bmenucoord[2][global.charturn]] != 0 && onebuffer < 0 && _confirm == true)
		{
			if (global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]] <= global.tension)
			{
				onebuffer = 2
				global.bmenuno = 0
				selnoise = 1
				if (global.battlespell[thischar][global.bmenucoord[2][global.charturn]] != -1)
				{
					scr_spellinfo(global.battlespell[thischar][global.bmenucoord[2][global.charturn]])
					if (spelltarget == 0)
						scr_spellconsumeb()
					if (spelltarget == 1)
						global.bmenuno = 8
					if (spelltarget == 2)
						global.bmenuno = 3
					if (spelltarget == 3)
						global.bmenuno = 99
				}
				else if (global.encounterno == 222 && global.charturn && spellcoord == 0)
				{
					global.actingchoice[global.charturn] = global.bmenucoord[2][global.charturn]
					global.tension -= global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]]
					global.tensionselect = 0
					scr_actinfo_temp(global.bmenucoord[13][global.charturn])
					scr_actselect(global.bmenucoord[13][global.charturn], global.bmenucoord[2][global.charturn])
					scr_nexthero()
				}
				else if (global.encounterno == 223 && global.charturn && spellcoord == 0)
				{
					global.actingchoice[global.charturn] = global.bmenucoord[2][global.charturn]
					global.tension -= global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]]
					global.tensionselect = 0
					scr_actinfo_temp(global.bmenucoord[13][global.charturn])
					scr_actselect(global.bmenucoord[13][global.charturn], global.bmenucoord[2][global.charturn])
					scr_nexthero()
				}
				else
				{
					global.bmenuno = 13
				}
			}
		}
		if (button2_p() && onebuffer < 0)
		{
			global.tensionselect = 0
			twobuffer = 1
			global.bmenuno = 0
			movenoise = 1
		}
	}
	if (global.bmenuno == 4)
	{
		with (battlewriter)
			skipme = 1
		with (battlewriter)
			depth = 10
		with (obj_face_parent)
			depth = 10
		with (obj_smallface)
			depth = 10
		if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 0)
			global.bmenucoord[4][global.charturn] -= 1
		if (right_p())
		{
			cango = 1
			itemcoord = global.bmenucoord[4][global.charturn]
			if (itemcoord < 11)
			{
				if (tempitem[global.bmenucoord[4][global.charturn] + 1][global.charturn] == 0)
				{
					cango = 0
					if ((itemcoord % 2) == 1 && itemcoord > 0)
						global.bmenucoord[4][global.charturn] -= 1
				}
			}
			else
			{
				global.bmenucoord[4][global.charturn] -= 1
				cango = 0
			}
			if (cango == 1)
			{
				if ((itemcoord % 2) == 0)
					global.bmenucoord[4][global.charturn] += 1
				else
					global.bmenucoord[4][global.charturn] -= 1
			}
		}
		if (left_p())
		{
			cango = 1
			itemcoord = global.bmenucoord[4][global.charturn]
			if (tempitem[1][global.charturn] != 0)
			{
				if ((itemcoord % 2) == 0)
					global.bmenucoord[4][global.charturn] += 1
				else
					global.bmenucoord[4][global.charturn] -= 1
			}
		}
		if (down_p())
		{
			itemcoord = global.bmenucoord[4][global.charturn]
			cango = 1
			if (itemcoord >= 10)
			{
				cango = 0
			}
			else
			{
				if (tempitem[itemcoord + 2][global.charturn] == 0)
					cango = 0
				if (itemcoord == 5 && tempitem[6][global.charturn] != 0 && tempitem[7][global.charturn] == 0)
					cango = 2
			}
			if (cango != 0)
			{
				if (cango == 1)
					global.bmenucoord[4][global.charturn] += 2
				if (cango == 2)
					global.bmenucoord[4][global.charturn] = 6
			}
		}
		if (up_p())
		{
			itemcoord = global.bmenucoord[4][global.charturn]
			cango = 1
			if (itemcoord <= 1)
				cango = 0
			if (cango == 1)
				global.bmenucoord[4][global.charturn] -= 2
		}
		if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 0)
			global.bmenucoord[4][global.charturn] -= 1
		if (button1_p() && tempitem[global.bmenucoord[4][global.charturn]][global.charturn] != 0 && onebuffer < 0)
		{
			onebuffer = 2
			global.bmenuno = 0
			selnoise = 1
			scr_iteminfo(tempitem[global.bmenucoord[4][global.charturn]][global.charturn])
			if (shareitemcon == 1)
			{
				if (i_ex(obj_pink_enemy))
					obj_pink_enemy.sharefood_item_number = tempitem[global.bmenucoord[4][global.charturn]][global.charturn]
				scr_itemconsumeb()
				global.charspecial[1] = 0
				global.charaction[1] = 0
				shareitemcon = 0
				exit
			}
			if (itemtarget == 0 || itemtarget == 2)
			{
				var _tensionhealed = 0
				if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 27)
				{
					scr_tensionheal(80)
					_tensionhealed = 1
				}
				if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 28)
				{
					scr_tensionheal(ceil(global.maxtension / 2))
					_tensionhealed = 1
				}
				if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 29)
				{
					scr_tensionheal(ceil(global.maxtension))
					_tensionhealed = 1
				}
				if (_tensionhealed)
				{
					var _drivenoise = snd_play(snd_cardrive)
					snd_pitch(_drivenoise, 1.4)
					snd_volume(_drivenoise, 0.8, 0)
					with (global.charinstance[global.charturn])
					{
						ha = instance_create(x, y, obj_healanim)
						ha.target = id
						ha.particlecolor = c_orange
					}
					scr_itemshift_temp(global.bmenucoord[4][global.charturn], global.charturn)
					scr_nexthero()
				}
				if (!_tensionhealed)
					scr_itemconsumeb()
			}
			if (itemtarget == 1)
				global.bmenuno = 7
		}
		if (button2_p() && onebuffer < 0)
		{
			twobuffer = 1
			global.bmenuno = 0
			movenoise = 1
			if (shareitemcon == 1)
			{
				shareitemcon = 0
				global.bmenuno = 0
				actingsus = 0
				global.actingsingle[global.charturn] = 0
				global.actingsimul[global.charturn] = 0
				global.faceaction[global.charturn] = 0
				global.chartarget[global.charturn] = 0
				global.charaction[global.charturn] = 0
				global.charspecial[global.charturn] = 0
			}
		}
	}
	if (global.bmenuno == 9)
	{
		thisenemy = global.bmenucoord[11][global.charturn]
		scr_actinfo_temp(thisenemy)
		if (right_p())
		{
			cango = 1
			actcoord = global.bmenucoord[9][global.charturn]
			if (actcoord < 5)
			{
				if (canact[global.bmenucoord[9][global.charturn] + 1] == 0)
				{
					cango = 0
					if ((actcoord % 2) == 1 && actcoord > 0)
						global.bmenucoord[9][global.charturn] -= 1
				}
			}
			else
			{
				global.bmenucoord[9][global.charturn] -= 1
				cango = 0
			}
			if (cango == 1)
			{
				if ((actcoord % 2) == 0)
					global.bmenucoord[9][global.charturn] += 1
				else
					global.bmenucoord[9][global.charturn] -= 1
			}
		}
		if (left_p())
		{
			cango = 1
			actcoord = global.bmenucoord[9][global.charturn]
			if ((actcoord % 2) == 0)
			{
				if (canact[actcoord + 1] != 0)
					global.bmenucoord[9][global.charturn] += 1
			}
			else
			{
				global.bmenucoord[9][global.charturn] -= 1
			}
		}
		if (down_p())
		{
			actcoord = global.bmenucoord[9][global.charturn]
			cango = 1
			if (actcoord >= 4)
				cango = 0
			else if (canact[actcoord + 2] == 0)
				cango = 0
			if (cango != 0)
			{
				if (cango == 1)
					global.bmenucoord[9][global.charturn] += 2
			}
		}
		if (up_p())
		{
			actcoord = global.bmenucoord[9][global.charturn]
			cango = 1
			if (actcoord <= 1)
				cango = 0
			if (cango == 1)
				global.bmenucoord[9][global.charturn] -= 2
		}
		global.tensionselect = acttpcost[global.bmenucoord[9][global.charturn]]
		canpress = 1
		if (global.char[global.charturn] == 1)
		{
			if (global.actactor[global.bmenucoord[11][global.charturn]][global.bmenucoord[9][global.charturn]] == 2 || global.actactor[global.bmenucoord[11][global.charturn]][global.bmenucoord[9][global.charturn]] == 4)
			{
				if (havechar[1] == 0 || global.hp[2] <= 0)
					canpress = 0
			}
			if (global.actactor[global.bmenucoord[11][global.charturn]][global.bmenucoord[9][global.charturn]] == 3 || global.actactor[global.bmenucoord[11][global.charturn]][global.bmenucoord[9][global.charturn]] == 4)
			{
				if (havechar[2] == 0 || global.hp[3] <= 0)
					canpress = 0
			}
			if (global.actactor[global.bmenucoord[11][global.charturn]][global.bmenucoord[9][global.charturn]] == 5)
			{
				if (havechar[3] == 0 || global.hp[4] <= 0)
					canpress = 0
			}
		}
		if (global.chapter == 5 && i_ex(obj_pink_enemy) && obj_pink_enemy.dateactdisabled == true && global.bmenucoord[9][global.charturn] == 1)
		{
		}
		else if (canpress == 1)
		{
			if (button1_p() && global.canact[thisenemy][global.bmenucoord[9][global.charturn]] == 1 && global.tension >= global.tensionselect && onebuffer < 0)
			{
				onebuffer = 2
				global.bmenuno = 0
				selnoise = 1
				global.actingchoice[global.charturn] = global.bmenucoord[9][global.charturn]
				global.tension -= acttpcost[global.bmenucoord[9][global.charturn]]
				global.tensionselect = 0
				scr_actselect(thisenemy, global.bmenucoord[9][global.charturn])
				global.bmenucoord[9][global.charturn] = 0
				scr_nexthero()
			}
		}
		if (button2_p() && onebuffer < 0)
		{
			global.bmenucoord[9][global.charturn] = 0
			global.tensionselect = 0
			twobuffer = 1
			global.bmenuno = 11
			movenoise = 1
		}
	}
	if (global.bmenuno == 7 || global.bmenuno == 1 || global.bmenuno == 8 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
	{
		with (battlewriter)
			skipme = 1
		with (battlewriter)
			depth = 10
		with (obj_face_parent)
			depth = 10
		with (obj_smallface)
			depth = 10
		if (button2_p() && onebuffer < 0)
		{
			twobuffer = 1
			if (global.bmenuno == 1 || global.bmenuno == 11 || global.bmenuno == 12)
				global.bmenuno = 0
			if (global.bmenuno == 7)
				global.bmenuno = 4
			if (global.bmenuno == 8 || global.bmenuno == 3 || global.bmenuno == 13)
				global.bmenuno = 2
			movenoise = 1
		}
		if (global.bmenuno == 7 || global.bmenuno == 1 || global.bmenuno == 8 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
		{
			if (global.bmenuno == 7 || global.bmenuno == 8)
			{
				for (i = 0; i < 3; i += 1)
				{
					ht[i] = 0
					if (global.char[i] > 0)
						ht[i] = 1
				}
			}
			if (global.bmenuno == 1 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
			{
				for (i = 0; i < 3; i += 1)
					ht[i] = global.monster[i]
			}
			if (global.bmenucoord[global.bmenuno][global.charturn] == 2 && ht[2] == 0)
				global.bmenucoord[global.bmenuno][global.charturn] = 0
			if (global.bmenucoord[global.bmenuno][global.charturn] == 0 && ht[0] == 0)
				global.bmenucoord[global.bmenuno][global.charturn] = 1
			if (global.bmenucoord[global.bmenuno][global.charturn] == 1 && ht[1] == 0)
				global.bmenucoord[global.bmenuno][global.charturn] = 0
			if (global.bmenucoord[global.bmenuno][global.charturn] == 0 && ht[0] == 0)
				global.bmenucoord[global.bmenuno][global.charturn] = 2
			if (down_p() == 1)
			{
				if (global.bmenucoord[global.bmenuno][global.charturn] == 0)
				{
					if (ht[1] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 1
					}
					else if (ht[2] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 2
					}
				}
				else if (global.bmenucoord[global.bmenuno][global.charturn] == 1)
				{
					if (ht[2] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 2
					}
					else if (ht[0] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 0
					}
				}
				else if (global.bmenucoord[global.bmenuno][global.charturn] == 2)
				{
					if (ht[0] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 0
					}
					else if (ht[1] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 1
					}
				}
			}
			if (up_p() == 1)
			{
				if (global.bmenucoord[global.bmenuno][global.charturn] == 0)
				{
					if (ht[2] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 2
					}
					else if (ht[1] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 1
					}
				}
				else if (global.bmenucoord[global.bmenuno][global.charturn] == 1)
				{
					if (ht[0] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 0
					}
					else if (ht[2] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 2
					}
				}
				else if (global.bmenucoord[global.bmenuno][global.charturn] == 2)
				{
					if (ht[1] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 1
					}
					else if (ht[0] == 1)
					{
						movenoise = 1
						global.bmenucoord[global.bmenuno][global.charturn] = 0
					}
				}
			}
			if (button1_p() && onebuffer < 0)
			{
				onebuffer = 1
				selnoise = 1
				if (global.bmenuno == 1)
				{
					global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn]
					global.faceaction[global.charturn] = 1
					global.charaction[global.charturn] = 1
					scr_nexthero()
				}
				if (global.bmenuno == 7)
				{
					global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn]
					var _tensionhealed = 0
					if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 67)
					{
						scr_tensionheal(ceil(global.maxtension * 0.16))
						_tensionhealed = 1
					}
					if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 68)
					{
						scr_tensionheal(ceil(global.maxtension * 0.16))
						_tensionhealed = 1
					}
					if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 69)
					{
						scr_tensionheal(ceil(global.maxtension * 0.16))
						_tensionhealed = 1
					}
					if (_tensionhealed)
					{
						var _drivenoise = snd_play(snd_cardrive)
						snd_pitch(_drivenoise, 1.4)
						snd_volume(_drivenoise, 0.8, 0)
						with (global.charinstance[global.charturn])
						{
							ha = instance_create(x, y, obj_healanim)
							ha.target = id
							ha.particlecolor = c_orange
						}
					}
					scr_itemconsumeb()
				}
				if (global.bmenuno == 8 || global.bmenuno == 3)
				{
					global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn]
					scr_spellconsumeb()
				}
				if (global.bmenuno == 11)
				{
					if (i_ex(obj_flowery_enemy) && obj_flowery_enemy.act_type == 1 && obj_flowery_enemy.flowerbuttonactive == true && obj_flowery_enemy.phase <= 4)
					{
						instance_create(x, y, obj_flowery_act_menu_controller)
						global.bmenuno = 9.5
						exit
					}
					global.bmenuno = 9
					actcoord = global.bmenucoord[9][global.charturn]
					thisenemy = global.bmenucoord[11][global.charturn]
					if (global.char[global.charturn] == 1)
					{
						for (i = 0; i < 6; i += 1)
						{
							if (global.canact[thisenemy][actcoord] == 0)
							{
								if (actcoord > 0)
									global.bmenucoord[9][global.charturn] -= 1
							}
						}
					}
					if (global.char[global.charturn] == 2)
					{
						for (i = 0; i < 6; i += 1)
						{
							if (global.canactsus[thisenemy][actcoord] == 0)
							{
								if (actcoord > 0)
									global.bmenucoord[9][global.charturn] -= 1
							}
						}
					}
					if (global.char[global.charturn] == 3)
					{
						for (i = 0; i < 6; i += 1)
						{
							if (global.canactral[thisenemy][actcoord] == 0)
							{
								if (actcoord > 0)
									global.bmenucoord[9][global.charturn] -= 1
							}
						}
					}
					if (global.char[global.charturn] == 4)
					{
						for (i = 0; i < 6; i += 1)
						{
							if (global.canactnoe[thisenemy][actcoord] == 0)
							{
								if (actcoord > 0)
									global.bmenucoord[9][global.charturn] -= 1
							}
						}
					}
					onebuffer = 1
				}
				if (global.bmenuno == 12)
				{
					global.faceaction[global.charturn] = 10
					global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn]
					global.charaction[global.charturn] = 2
					global.charspecial[global.charturn] = 100
					scr_nexthero()
				}
				if (global.bmenuno == 13)
				{
					onebuffer = 2
					global.bmenuno = 0
					selnoise = 1
					global.actingchoice[global.charturn] = global.bmenucoord[2][global.charturn]
					global.tension -= global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]]
					global.tensionselect = 0
					scr_actinfo_temp(global.bmenucoord[13][global.charturn])
					scr_actselect(global.bmenucoord[13][global.charturn], global.bmenucoord[2][global.charturn])
					if (i_ex(obj_pink_enemy) && obj_pink_enemy.actingsus == 3 && global.charturn == 1)
					{
						shareitemcon = 1
						global.bmenuno = 4
						scr_iteminfo_temp(global.charturn)
						for (i = 0; i < 12; i += 1)
						{
							if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 0 && global.bmenucoord[4][global.charturn] > 0)
								global.bmenucoord[4][global.charturn] -= 1
						}
						exit
					}
					scr_nexthero()
				}
			}
		}
	}
}
if (movenoise == 1)
{
	snd_play(snd_menumove)
	movenoise = 0
}
if (grazenoise == 1 && victory == 0)
{
	snd_play(snd_graze)
	grazenoise = 0
}
if (selnoise == 1)
{
	snd_play(snd_select)
	selnoise = 0
}
if (damagenoise == 1)
{
	snd_play(snd_damage)
	damagenoise = 0
}
if (laznoise == 1)
{
	snd_play(snd_laz_c)
	laznoise = 0
}
if (bumpnoise == 1)
{
	snd_play(snd_bounceflower)
	snd_play(snd_acquire_lancer, 0.5, 1)
	bumpnoise = 0
}
onebuffer -= 1
twobuffer -= 1
lbuffer -= 1
rbuffer -= 1
if ((global.mnfight == 2 && timeron == 1) || (i_ex(obj_flowery_enemy) && obj_flowery_enemy.introcon == 2))
{
	global.turntimer -= 1
	if (global.turntimer <= 0 && reset == 0)
	{
		with (obj_bulletparent)
			instance_destroy()
		with (obj_bulletgenparent)
			instance_destroy()
		with (obj_darkener)
			darken = 0
		with (obj_heart)
		{
			instance_create(x, y, obj_returnheart)
			instance_destroy()
		}
		reset = 1
		if (i_ex(obj_flowery_enemy) && noreturn == 1)
		{
			noreturn = 0
			alarm[2] = 1
		}
		else if (noreturn == 0)
		{
			alarm[2] = 15
		}
	}
}
if (global.myfight == 3)
{
	if (scr_monsterpop() == 0 && !instance_exists(obj_writer))
	{
		scr_wincombat()
		if (global.myfight == 3)
			scr_endturn()
	}
}
if (global.myfight == 5)
{
	myfightreturntimer--
	if (myfightreturntimer <= 0)
	{
		scr_mnendturn()
		global.spelldelay = 10
		with (obj_heroparent)
		{
			attacktimer = 0
			image_index = 0
			index = 0
			itemed = 0
			acttimer = 0
			defendtimer = 0
			state = 0
			flash = 0
			siner = 0
			fsiner = 0
			alarm[4] = -1
		}
		with (obj_spellphase)
		{
			with (spellwriter)
				instance_destroy()
			instance_destroy()
		}
	}
}
if (global.charweapon[4] == 13)
{
	if ((t_siner % 6) == 0)
	{
		if (global.hp[4] > round(global.maxhp[4] / 3))
			global.hp[4]--
	}
}
t_siner++
if (scr_debug())
{
	scr_turn_skip()
	if (scr_debug_keycheck(vk_f2))
		scr_debug_fullheal()
	if (scr_debug_keycheck(vk_f3))
		scr_raise_party()
	if (scr_debug_keycheck(vk_f5))
		scr_wincombat()
	if (scr_debug_keycheck(vk_f6))
		scr_weaken_enemies()
		
	if scr_debug_keycheck(vk_f7) && !i_ex(obj_pink_enemy) // exclude pink since she has her own debug keybind for f7
	{
	    var _tire = false
        if (keyboard_check(vk_space))
            _tire = true
        for (var i = 0; i < 3; i++)
        {
            if (!global.monster[i])
                continue
            if (_tire)
                scr_monster_make_tired(i)
            else if (global.mercymod[i] < global.mercymax[i])
                scr_mercyadd(i, 100)
        }
	}
		
	if (scr_debug_keycheck(vk_f8))
		scr_weaken_party(true)
	if (scr_debug_keycheck(vk_f9))
	{
		global.tension = 0
		scr_debug_print("TP set to 0%")
	}
	if (scr_debug_keycheck(vk_f10))
	{
		global.tension = 250
		scr_debug_print("TP maxed out!!")
	}
	if (scr_debug_keycheck(ord("M")))
	{
		if (audio_is_playing(global.batmusic[1]))
		{
			if (!audio_is_paused(global.batmusic[1]))
				audio_pause_sound(global.batmusic[1])
			else
				audio_resume_sound(global.batmusic[1])
		}
	}
}
