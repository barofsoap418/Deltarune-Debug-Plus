function scr_roomname(arg0)
{
	roomname = stringsetloc("Dark World?", "scr_roomname_slash_scr_roomname_gml_1_0")
	
	if scr_debug()
       roomname = room_get_name(arg0)
	
	if (arg0 == room_gms_debug_failsafe)
		roomname = stringsetloc("---", "scr_roomname_slash_scr_roomname_gml_2_0")
	if (arg0 == room_dw_couch_overworld_intro)
		roomname = stringsetloc("Dark World", "scr_roomname_slash_scr_roomname_gml_4_0")
	if (arg0 == room_dw_green_room)
		roomname = stringsetloc("Green Room", "scr_roomname_slash_scr_roomname_gml_6_0_b")
	if (arg0 == room_dw_tv_curtain)
		roomname = stringsetloc("TV World - Before the Show", "scr_roomname_slash_scr_roomname_gml_7_0")
	if (arg0 == room_dw_snow_zone)
		roomname = stringsetloc("Cold Place", "scr_roomname_slash_scr_roomname_gml_8_0")
	if (arg0 == room_dw_teevie_intro)
		roomname = stringsetloc("TV World - Entrance", "scr_roomname_slash_scr_roomname_gml_8_0_b")
	if (arg0 == room_dw_b3bs_jail1)
		roomname = stringsetloc("TV World - Goulden Sam", "scr_roomname_slash_scr_roomname_gml_9_0_b")
	if (arg0 == room_dw_teevie_rhythm)
		roomname = stringsetloc("TV World - Concert", "scr_roomname_slash_scr_roomname_gml_9_0")
	if (arg0 == room_dw_teevie_chef)
		roomname = stringsetloc("TV World - Cooking Show", "scr_roomname_slash_scr_roomname_gml_11_0")
	return roomname;
}
