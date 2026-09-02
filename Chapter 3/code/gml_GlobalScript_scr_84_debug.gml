function scr_84_debug(arg0)
{
    var process = argument0
    if (!variable_global_exists("chemg_menu_depth"))
    {
        global.chemg_menu_indices = array_create(0)
        global.chemg_menu_indices[0] = 0
        global.chemg_menu_depth = 0
        
        ossafe_ini_open("DebugPlus.ini")
        global.chemg_god_mode = ini_read_real("AshleysDebug", "chemg_god_mode", 0)
        global.chemg_show_room = ini_read_real("AshleysDebug", "chemg_show_room", 1)
        global.chemg_show_plot = ini_read_real("AshleysDebug", "chemg_show_plot", 1)
        global.chemg_show_encounterno = ini_read_real("AshleysDebug", "chemg_show_encounterno", 0)
        global.chemg_show_interact = ini_read_real("AshleysDebug", "chemg_show_interact", 0)
        global.chemg_show_entrance = ini_read_real("AshleysDebug", "chemg_show_entrance", 0)
        global.debug_fps_display = ini_read_real("AshleysDebug", "debug_fps_display", 0)
        global.chemg_display_flag_changes = ini_read_real("AshleysDebug", "chemg_display_flag_changes", 0)
        global.chemg_flag_detection = ini_read_real("AshleysDebug", "chemg_flag_detection", 1)
        global.chemg_menu_key = ini_read_real("AshleysDebug", "chemg_menu_key", vk_f1)
        global.chemg_debug_messages = ini_read_real("AshleysDebug", "chemg_debug_messages", 1)
        ossafe_ini_close()
        
        global.chemg_rebinding = false
        global.chemg_font_test = false
        
        var parent = ds_list_create()
        show_debug_message("init debug")
        var group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Money")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[setgold]", 0, "Set D$")
        scr_84_add_menu_item(parent, "[setgoldlight]", 0, "Set $")
        scr_84_add_menu_item(parent, "[flagset]", 1044, "Set POINTS")
        
        scr_84_add_menu_item(parent, "[gold]", 50, "+50 D$")
        scr_84_add_menu_item(parent, "[gold]", -50, "-50 D$")
        scr_84_add_menu_item(parent, "[gold]", 100, "+100 D$")
        scr_84_add_menu_item(parent, "[gold]", -100, "-100 D$")
        scr_84_add_menu_item(parent, "[gold]", 200, "+200 D$")
        scr_84_add_menu_item(parent, "[gold]", -200, "-200 D$")
        scr_84_add_menu_item(parent, "[gold]", 500, "+500 D$")
        scr_84_add_menu_item(parent, "[gold]", -500, "-500 D$")
        
        scr_84_add_menu_item(parent, "[lightgold]", 25, "+25 $")
        scr_84_add_menu_item(parent, "[lightgold]", -25, "-25 $")
        
        scr_84_add_menu_item(parent, "[points]", 100, "+50 PTs")
        scr_84_add_menu_item(parent, "[points]", -100, "-50 PTs")
        scr_84_add_menu_item(parent, "[points]", 100, "+100 PTs")
        scr_84_add_menu_item(parent, "[points]", -100, "-100 PTs")
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Items")
        scr_84_push(parent)
        parent = group
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Give Dark Item")
        scr_84_push(parent)
        parent = group
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 1")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[item]", 1, "Dark Candy")
        scr_84_add_menu_item(parent, "[item]", 2, "ReviveMint")
        scr_84_add_menu_item(parent, "[item]", 3, "Glowshard")
        scr_84_add_menu_item(parent, "[item]", 4, "Manual")
        scr_84_add_menu_item(parent, "[item]", 5, "BrokenCake")
        scr_84_add_menu_item(parent, "[item]", 6, "Top Cake")
        scr_84_add_menu_item(parent, "[item]", 7, "SpinCake")
        scr_84_add_menu_item(parent, "[item]", 8, "Darkburger")
        scr_84_add_menu_item(parent, "[item]", 9, "LancerCookie")
        scr_84_add_menu_item(parent, "[item]", 10, "GigaSalad")
        scr_84_add_menu_item(parent, "[item]", 11, "Clubswich")
        scr_84_add_menu_item(parent, "[item]", 12, "HeartsDonut")
        scr_84_add_menu_item(parent, "[item]", 13, "ChocDiamond")
        scr_84_add_menu_item(parent, "[item]", 14, "FavSandwich")
        scr_84_add_menu_item(parent, "[item]", 15, "RouxlsRoux")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 2")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[item]", 16, "CD Bagel")
        scr_84_add_menu_item(parent, "[item]", 17, "Mannequin")
        scr_84_add_menu_item(parent, "[item]", 18, "Kris Tea")
        scr_84_add_menu_item(parent, "[item]", 19, "Noelle Tea")
        scr_84_add_menu_item(parent, "[item]", 20, "Ralsei Tea")
        scr_84_add_menu_item(parent, "[item]", 21, "Susie Tea")
        scr_84_add_menu_item(parent, "[item]", 22, "DD-Burger")
        scr_84_add_menu_item(parent, "[item]", 23, "LightCandy")
        scr_84_add_menu_item(parent, "[item]", 24, "ButJuice")
        scr_84_add_menu_item(parent, "[item]", 25, "SpaghettiCode")
        scr_84_add_menu_item(parent, "[item]", 26, "JavaCookie")
        scr_84_add_menu_item(parent, "[item]", 27, "TensionBit")
        scr_84_add_menu_item(parent, "[item]", 28, "TensionGem")
        scr_84_add_menu_item(parent, "[item]", 29, "TensionMax")
        scr_84_add_menu_item(parent, "[item]", 30, "ReviveDust")
        scr_84_add_menu_item(parent, "[item]", 31, "ReviveBrite")
        scr_84_add_menu_item(parent, "[item]", 32, "S.POISON")
        scr_84_add_menu_item(parent, "[item]", 33, "DogDollar")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 3")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[item]", 34, "TVDinner")
        scr_84_add_menu_item(parent, "[item]", 35, "Pipis")
        scr_84_add_menu_item(parent, "[item]", 36, "FlatSoda")
        scr_84_add_menu_item(parent, "[item]", 37, "TVSlop")
        scr_84_add_menu_item(parent, "[item]", 38, "ExecBuffet")
        scr_84_add_menu_item(parent, "[item]", 39, "DeluxeDinner")
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Give Light Item")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[lightitem]", 1, "Hot Chocolate")
        scr_84_add_menu_item(parent, "[lightitem]", 2, "Pencil")
        scr_84_add_menu_item(parent, "[lightitem]", 3, "Bandage")
        scr_84_add_menu_item(parent, "[lightitem]", 4, "Bouquet")
        scr_84_add_menu_item(parent, "[lightitem]", 5, "Ball of Junk")
        scr_84_add_menu_item(parent, "[lightitem]", 6, "Halloween Pencil")
        scr_84_add_menu_item(parent, "[lightitem]", 7, "Lucky Pencil")
        scr_84_add_menu_item(parent, "[lightitem]", 8, "Egg")
        scr_84_add_menu_item(parent, "[lightitem]", 9, "Cards")
        scr_84_add_menu_item(parent, "[lightitem]", 10, "Box of Heart Candy")
        scr_84_add_menu_item(parent, "[lightitem]", 11, "Glass")
        scr_84_add_menu_item(parent, "[lightitem]", 12, "Eraser")
        scr_84_add_menu_item(parent, "[lightitem]", 13, "Mech. Pencil")
        scr_84_add_menu_item(parent, "[lightitem]", 14, "Wristwatch")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Give Key Item")
        scr_84_push(parent)
        parent = group
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 1")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[keyitem]", 1, "Cell Phone")
        scr_84_add_menu_item(parent, "[keyitem]", 2, "Egg")
        scr_84_add_menu_item(parent, "[keyitem]", 3, "BrokenCake")
        scr_84_add_menu_item(parent, "[keyitem]", 4, "Broken Key A")
        scr_84_add_menu_item(parent, "[keyitem]", 5, "Door Key")
        scr_84_add_menu_item(parent, "[keyitem]", 6, "Broken Key B")
        scr_84_add_menu_item(parent, "[keyitem]", 7, "Broken Key C")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 2")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[keyitem]", 8, "Lancer")
        scr_84_add_menu_item(parent, "[keyitem]", 9, "Rouxls Kaard")
        scr_84_add_menu_item(parent, "[keyitem]", 10, "EmptyDisk")
        scr_84_add_menu_item(parent, "[keyitem]", 11, "LoadedDisk")
        scr_84_add_menu_item(parent, "[keyitem]", 12, "KeyGen")
        scr_84_add_menu_item(parent, "[keyitem]", 13, "ShadowCrystal")
        scr_84_add_menu_item(parent, "[keyitem]", 14, "StarWalker")
        scr_84_add_menu_item(parent, "[keyitem]", 15, "PureCrystal")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 3")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[keyitem]", 16, "OddController")
        scr_84_add_menu_item(parent, "[keyitem]", 17, "BackstagePass")
        scr_84_add_menu_item(parent, "[keyitem]", 18, "TripTicket")
        scr_84_add_menu_item(parent, "[keyitem]", 19, "LancerCon")
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Give Weapon")
        scr_84_push(parent)
        parent = group
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 1")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[weaponitem]", 1, "Wood Blade")
        scr_84_add_menu_item(parent, "[weaponitem]", 2, "Mane Ax")
        scr_84_add_menu_item(parent, "[weaponitem]", 3, "Red Scarf")
        scr_84_add_menu_item(parent, "[weaponitem]", 4, "EverybodyWeapon")
        scr_84_add_menu_item(parent, "[weaponitem]", 5, "Spookysword")
        scr_84_add_menu_item(parent, "[weaponitem]", 6, "Brave Ax")
        scr_84_add_menu_item(parent, "[weaponitem]", 7, "DEVILSKNIFE")
        scr_84_add_menu_item(parent, "[weaponitem]", 8, "Trefoil")
        scr_84_add_menu_item(parent, "[weaponitem]", 9, "Ragger")
        scr_84_add_menu_item(parent, "[weaponitem]", 10, "DaintyScarf")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 2")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[weaponitem]", 11, "TwistedSwd")
        scr_84_add_menu_item(parent, "[weaponitem]", 12, "SnowRing")
        scr_84_add_menu_item(parent, "[weaponitem]", 13, "ThornRing")
        scr_84_add_menu_item(parent, "[weaponitem]", 14, "BounceBlade")
        scr_84_add_menu_item(parent, "[weaponitem]", 15, "CheerScarf")
        scr_84_add_menu_item(parent, "[weaponitem]", 16, "MechaSaber")
        scr_84_add_menu_item(parent, "[weaponitem]", 17, "AutoAxe")
        scr_84_add_menu_item(parent, "[weaponitem]", 18, "FiberScarf")
        scr_84_add_menu_item(parent, "[weaponitem]", 19, "Ragger2")
        scr_84_add_menu_item(parent, "[weaponitem]", 20, "BrokenSwd")
        scr_84_add_menu_item(parent, "[weaponitem]", 21, "PuppetScarf")
        scr_84_add_menu_item(parent, "[weaponitem]", 22, "FreezeRing")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 3")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[weaponitem]", 23, "Saber10")
        scr_84_add_menu_item(parent, "[weaponitem]", 24, "ToxicAxe")
        scr_84_add_menu_item(parent, "[weaponitem]", 25, "FlexScarf")
        scr_84_add_menu_item(parent, "[weaponitem]", 26, "BlackShard")
        parent = scr_84_pop()
        
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Give Armor")
        scr_84_push(parent)
        parent = group
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 1")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[armoritem]", 1, "Amber Card")
        scr_84_add_menu_item(parent, "[armoritem]", 2, "Dice Brace")
        scr_84_add_menu_item(parent, "[armoritem]", 3, "Pink Ribbon")
        scr_84_add_menu_item(parent, "[armoritem]", 4, "White Ribbon")
        scr_84_add_menu_item(parent, "[armoritem]", 5, "IronShackle")
        scr_84_add_menu_item(parent, "[armoritem]", 6, "MouseToken")
        scr_84_add_menu_item(parent, "[armoritem]", 7, "JEVILSTAIL")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 2")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[armoritem]", 8, "Silver Card")
        scr_84_add_menu_item(parent, "[armoritem]", 9, "TwinRibbon")
        scr_84_add_menu_item(parent, "[armoritem]", 10, "GlowWrist")
        scr_84_add_menu_item(parent, "[armoritem]", 11, "ChainMail")
        scr_84_add_menu_item(parent, "[armoritem]", 12, "B.ShotBowtie")
        scr_84_add_menu_item(parent, "[armoritem]", 13, "SpikeBand")
        scr_84_add_menu_item(parent, "[armoritem]", 14, "SilverWatch")
        scr_84_add_menu_item(parent, "[armoritem]", 15, "TensionBow")
        scr_84_add_menu_item(parent, "[armoritem]", 16, "Mannequin")
        scr_84_add_menu_item(parent, "[armoritem]", 17, "DarkGoldBand")
        scr_84_add_menu_item(parent, "[armoritem]", 18, "SkyMantle")
        scr_84_add_menu_item(parent, "[armoritem]", 19, "SpikeShackle")
        scr_84_add_menu_item(parent, "[armoritem]", 20, "FrayedBowtie")
        scr_84_add_menu_item(parent, "[armoritem]", 21, "Dealmaker")
        scr_84_add_menu_item(parent, "[armoritem]", 22, "RoyalPin")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 3")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[armoritem]", 23, "ShadowMantle")
        scr_84_add_menu_item(parent, "[armoritem]", 24, "LodeStone")
        scr_84_add_menu_item(parent, "[armoritem]", 25, "GingerGuard")
        scr_84_add_menu_item(parent, "[armoritem]", 26, "BlueRibbon")
        scr_84_add_menu_item(parent, "[armoritem]", 27, "TennaTie")
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[idealitem]", 0, "Idealize Items/Gear")
        
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Rooms")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[gotoroom]", 0, "Go to Specific Room")
        scr_84_add_menu_item(parent, "[room]", ROOM_INITIALIZE, "ROOM_INITIALIZE")
        scr_84_add_menu_item(parent, "[room]", PLACE_CONTACT, "PLACE_CONTACT")
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Debug")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_title_placeholder, "room_title_placeholder")
        scr_84_add_menu_item(parent, "[roomdark]", room_battletest, "room_battletest")
        scr_84_add_menu_item(parent, "[roomdark]", room_cutscene_tester, "room_cutscene_tester")
        scr_84_add_menu_item(parent, "[roomdark]", room_sound_tester, "room_sound_tester")
        scr_84_add_menu_item(parent, "[roomdark]", room_sprite_tester, "room_sprite_tester")
        scr_84_add_menu_item(parent, "[roomdark]", room_gif_tester, "room_gif_tester")
        scr_84_add_menu_item(parent, "[roomdark]", room_bullettest, "room_bullettest")
        scr_84_add_menu_item(parent, "[roomdark]", room_GMS2_test, "room_GMS2_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_cutscene_tester_b, "room_cutscene_tester_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_color, "room_debug_color")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_battle, "room_debug_battle")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_loc, "room_debug_loc")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_smallface_dark, "room_debug_smallface_dark")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_smallface, "room_debug_smallface")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_choicer_dark, "room_debug_choicer_dark")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_choicer_light, "room_debug_choicer_light")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_battleBalloon, "room_debug_battleBalloon")
        scr_84_add_menu_item(parent, "[roomdark]", room_overworldBulletEnemyTest, "room_overworldBulletEnemyTest")
        scr_84_add_menu_item(parent, "[roomdark]", room_tennaCutsceneTest, "room_tennaCutsceneTest")
        scr_84_add_menu_item(parent, "[roomdark]", room_tennaAnimTest, "room_tennaAnimTest")
        scr_84_add_menu_item(parent, "[roomdark]", room_lerptest, "room_lerptest")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_tennatexttester, "room_debug_tennatexttester")
        scr_84_add_menu_item(parent, "[roomdark]", room_rhythmgame_editor, "room_rhythmgame_editor")
        scr_84_add_menu_item(parent, "[roomdark]", room_genanimtest, "room_genanimtest")
        scr_84_add_menu_item(parent, "[roomdark]", room_perspective_testing, "room_perspective_testing")
        scr_84_add_menu_item(parent, "[roomdark]", room_bullettest_new, "room_bullettest_new")
        scr_84_add_menu_item(parent, "[roomdark]", room_ch3_gameshowroom_tennatest, "room_ch3_gameshowroom_tennatest")
        scr_84_add_menu_item(parent, "[roomdark]", room_rhythmgame_tenna_test, "room_rhythmgame_tenna_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_channelchange_test, "room_dw_channelchange_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_CHEFS, "room_CHEFS")
        scr_84_add_menu_item(parent, "[roomdark]", room_susiezilla_singleScreenMockup, "room_susiezilla_singleScreenMockup")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Light World")
        scr_84_push(parent)
        parent = group
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Kris's House")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_krisroom, "room_krisroom")
        scr_84_add_menu_item(parent, "[room]", room_krishallway, "room_krishallway")
        scr_84_add_menu_item(parent, "[room]", room_torroom, "room_torroom")
        scr_84_add_menu_item(parent, "[room]", room_torhouse, "room_torhouse")
        scr_84_add_menu_item(parent, "[room]", room_torbathroom, "room_torbathroom")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Exteriors")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_town_krisyard, "room_town_krisyard")
        scr_84_add_menu_item(parent, "[room]", room_town_krisyard_dark, "room_town_krisyard_dark")
        scr_84_add_menu_item(parent, "[room]", room_town_northwest, "room_town_northwest")
        scr_84_add_menu_item(parent, "[room]", room_town_north, "room_town_north")
        scr_84_add_menu_item(parent, "[room]", room_beach, "room_beach")
        scr_84_add_menu_item(parent, "[room]", room_town_mid, "room_town_mid")
        scr_84_add_menu_item(parent, "[room]", room_town_apartments, "room_town_apartments")
        scr_84_add_menu_item(parent, "[room]", room_town_south, "room_town_south")
        scr_84_add_menu_item(parent, "[room]", room_town_school, "room_town_school")
        scr_84_add_menu_item(parent, "[room]", room_town_church, "room_town_church")
        scr_84_add_menu_item(parent, "[room]", room_graveyard, "room_graveyard")
        scr_84_add_menu_item(parent, "[room]", room_town_shelter, "room_town_shelter")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Interiors")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_hospital_lobby, "room_hospital_lobby")
        scr_84_add_menu_item(parent, "[room]", room_hospital_hallway, "room_hospital_hallway")
        scr_84_add_menu_item(parent, "[room]", room_hospital_rudy, "room_hospital_rudy")
        scr_84_add_menu_item(parent, "[room]", room_hospital_room2, "room_hospital_room2")
        scr_84_add_menu_item(parent, "[room]", room_diner, "room_diner")
        scr_84_add_menu_item(parent, "[room]", room_townhall, "room_townhall")
        scr_84_add_menu_item(parent, "[room]", room_flowershop_1f, "room_flowershop_1f")
        scr_84_add_menu_item(parent, "[room]", room_flowershop_2f, "room_flowershop_2f")
        scr_84_add_menu_item(parent, "[room]", room_library, "room_library")
        scr_84_add_menu_item(parent, "[room]", room_alphysalley, "room_alphysalley")
        scr_84_add_menu_item(parent, "[room]", room_lw_computer_lab, "room_lw_computer_lab")
        scr_84_add_menu_item(parent, "[room]", room_lw_library_upstairs, "room_lw_library_upstairs")
        scr_84_add_menu_item(parent, "[room]", room_lw_police, "room_lw_police")
        scr_84_add_menu_item(parent, "[room]", room_lw_conbini, "room_lw_conbini")
        scr_84_add_menu_item(parent, "[room]", room_lw_icee_pizza, "room_lw_icee_pizza")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "School")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_torielclass, "room_torielclass")
        scr_84_add_menu_item(parent, "[room]", room_schoollobby, "room_schoollobby")
        scr_84_add_menu_item(parent, "[room]", room_alphysclass, "room_alphysclass")
        scr_84_add_menu_item(parent, "[room]", room_schooldoor, "room_schooldoor")
        scr_84_add_menu_item(parent, "[room]", room_insidecloset, "room_insidecloset")
        scr_84_add_menu_item(parent, "[room]", room_school_unusedroom, "room_school_unusedroom")
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Castle Town")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_castle_tutorial, "room_castle_tutorial")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_east_door, "room_dw_castle_east_door")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_west_cliff, "room_dw_castle_west_cliff")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_area_1, "room_dw_castle_area_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_town, "room_dw_castle_town")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ralsei_castle_front, "room_dw_ralsei_castle_front")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_restaurant, "room_dw_castle_restaurant")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_cafe, "room_dw_castle_cafe")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_dojo, "room_dw_castle_dojo")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ralsei_castle_1f, "room_dw_ralsei_castle_1f")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ralsei_castle_2f, "room_dw_ralsei_castle_2f")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_dungeon, "room_dw_castle_dungeon")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_rooms_kris, "room_dw_castle_rooms_kris")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_rooms_susie, "room_dw_castle_rooms_susie")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Couch Overworld")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_couch_overworld_intro, "room_dw_couch_overworld_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_couch_overworld_intro_left, "room_dw_couch_overworld_intro_left")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_couch_overworld_01, "room_dw_couch_overworld_01")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_couch_overworld_02, "room_dw_couch_overworld_02")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_couch_points, "room_dw_couch_points")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_couch_overworld_03, "room_dw_couch_overworld_03")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_couch_overworld_04, "room_dw_couch_overworld_04")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_couch_overworld_05, "room_dw_couch_overworld_05")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_nondescript_room, "room_dw_nondescript_room")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_nondescript_field, "room_dw_nondescript_field")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_nondescript_classroom, "room_dw_nondescript_classroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_nondescript_hallway, "room_dw_nondescript_hallway")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_couch_video, "room_dw_couch_video")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_tv_cutscene1g, "room_dw_tv_cutscene1g")
        parent = scr_84_pop()
        
        
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_tv_curtain, "room_dw_tv_curtain")
        scr_84_add_menu_item(parent, "[roomdark]", room_ch3_gameshowroom, "room_ch3_gameshowroom")
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Green Room")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_board_empty, "room_board_empty")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_interstitial, "room_dw_b3bs_interstitial")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_green_room, "room_dw_green_room")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ranking_hub, "room_dw_ranking_hub")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ranking_a, "room_dw_ranking_a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ranking_b, "room_dw_ranking_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ranking_c, "room_dw_ranking_c")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ranking_z, "room_dw_ranking_z")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ranking_z_hallway, "room_dw_ranking_z_hallway")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ranking_t, "room_dw_ranking_t")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_inbetween, "room_dw_inbetween")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_changing_room, "room_dw_changing_room")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_console_room, "room_dw_console_room")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_preview, "room_dw_teevie_preview")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_puzzlecloset_0, "room_dw_puzzlecloset_0")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_puzzlecloset_1, "room_dw_puzzlecloset_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_puzzlecloset_1a, "room_dw_puzzlecloset_1a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_puzzlecloset_2, "room_dw_puzzlecloset_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_puzzlecloset_3, "room_dw_puzzlecloset_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_snow_zone, "room_dw_snow_zone")
        scr_84_add_menu_item(parent, "[roomdark]", room_torhouse_sepia, "room_torhouse_sepia")
        scr_84_add_menu_item(parent, "[roomdark]", room_ch3_gacharoom_unknown, "room_ch3_gacharoom_unknown")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Boards")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_board_gsa02_b0, "room_board_gsa02_b0")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_intro, "room_board_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_1, "room_board_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_sword_intro, "room_board_sword_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_1_sword, "room_board_1_sword")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_1_sword_trees, "room_board_1_sword_trees")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_2, "room_board_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_2_sword, "room_board_2_sword")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_dungeon_2, "room_board_dungeon_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_3_sword, "room_board_3_sword")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_dungeon_3, "room_board_dungeon_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_preshadowmantle, "room_board_preshadowmantle")
        scr_84_add_menu_item(parent, "[roomdark]", room_shadowmantle, "room_shadowmantle")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_prepostshadowmantle, "room_board_prepostshadowmantle")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_postshadowmantle, "room_board_postshadowmantle")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_preshadowmantle_repeat, "room_board_preshadowmantle_repeat")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Minigames")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_chef, "room_dw_chef")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_rhythm, "room_dw_rhythm")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_susiezilla, "room_dw_susiezilla")
        scr_84_add_menu_item(parent, "[roomdark]", room_shootout, "room_shootout")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_chef_empty, "room_dw_chef_empty")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_susiezilla_empty, "room_dw_susiezilla_empty")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_rhythm_empty, "room_dw_rhythm_empty")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "TV World")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_backstage, "room_dw_backstage")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_intro, "room_dw_teevie_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_cowboy_zone_01_intro, "room_dw_teevie_cowboy_zone_01_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_cowboy_zone_01_after, "room_dw_teevie_cowboy_zone_01_after")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_large_01, "room_dw_teevie_large_01")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_lancerget, "room_dw_b3bs_lancerget")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_large_02, "room_dw_teevie_large_02")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_mysterypuzzle, "room_dw_b3bs_mysterypuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_susiezilla, "room_dw_teevie_susiezilla")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_jail1, "room_dw_b3bs_jail1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_zapper_a, "room_dw_b3bs_zapper_a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_ribbicks_a, "room_dw_teevie_ribbicks_a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_zapper_b, "room_dw_b3bs_zapper_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_watercooler, "room_dw_teevie_watercooler")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_ribbicks_b, "room_dw_teevie_ribbicks_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_jail2, "room_dw_b3bs_jail2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_cowboy_zone_02_intro, "room_dw_teevie_cowboy_zone_02_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_cowboy_zone_02_after, "room_dw_teevie_cowboy_zone_02_after")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_shadow_guys, "room_dw_teevie_shadow_guys")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_cooltrashy, "room_dw_b3bs_cooltrashy")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_susiebridge, "room_dw_teevie_susiebridge")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_stealth_c, "room_dw_teevie_stealth_c")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_rhythm, "room_dw_teevie_rhythm")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_shuttahmaze, "room_dw_teevie_shuttahmaze")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_maze_quiz, "room_dw_teevie_maze_quiz")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_bonus_zone, "room_dw_teevie_bonus_zone")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_tv_closet, "room_dw_tv_closet")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_sams, "room_dw_teevie_sams")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_stealth_d, "room_dw_teevie_stealth_d")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_chef, "room_dw_teevie_chef")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_dust, "room_dw_teevie_dust")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_dust_south, "room_dw_teevie_dust_south")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_zapper_c, "room_dw_b3bs_zapper_c")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_zapper_d, "room_dw_b3bs_zapper_d")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_extrapuzzle, "room_dw_b3bs_extrapuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_bibliox, "room_dw_b3bs_bibliox")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ch3_man, "room_dw_ch3_man")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Special")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_intro, "room_intro")
        scr_84_add_menu_item(parent, "[room]", PLACE_DOG, "PLACE_DOG")
        scr_84_add_menu_item(parent, "[room]", room_legend, "room_legend")
        scr_84_add_menu_item(parent, "[room]", room_legend_neo, "room_legend_neo")
        scr_84_add_menu_item(parent, "[roomdark]", room_shop1, "room_shop1")
        scr_84_add_menu_item(parent, "[roomdark]", room_shop_music, "room_shop_music")
        scr_84_add_menu_item(parent, "[roomdark]", room_gameover, "room_gameover")
        scr_84_add_menu_item(parent, "[room]", PLACE_LOGO, "PLACE_LOGO")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_FAILURE, "PLACE_FAILURE")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_NAMING_JIKKEN, "PLACE_NAMING_JIKKEN")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_MENU, "PLACE_MENU")
        scr_84_add_menu_item(parent, "[room]", room_ed, "room_ed")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_DOGCHECK2, "PLACE_DOGCHECK2")
        scr_84_add_menu_item(parent, "[roomdark]", room_chapter_continue, "room_chapter_continue")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Unused")
        scr_84_push(parent)
        parent = group
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Green Room")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_preview_south, "room_dw_teevie_preview_south")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_snow_zone_battle, "room_dw_snow_zone_battle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_snow_zone_east_door, "room_dw_snow_zone_east_door")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Boards")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_board_3, "room_board_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_3b, "room_board_3b")
        
        scr_84_add_menu_item(parent, "[roomdark]", room_boardtest, "room_boardtest")
        scr_84_add_menu_item(parent, "[roomdark]", room_boardtest_old, "room_boardtest_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_board1_oldtest, "room_board1_oldtest")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_designTest, "room_board_designTest")
        
        scr_84_add_menu_item(parent, "[roomdark]", room_adventureboardtest, "room_adventureboardtest")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_tests, "room_board_tests")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_boattest, "room_board_boattest")
        scr_84_add_menu_item(parent, "[roomdark]", room_shadowmantle_movementExample, "room_shadowmantle_movementExample")
        scr_84_add_menu_item(parent, "[roomdark]", room_board_postshadowmantle_test, "room_board_postshadowmantle_test")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Backstage")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bstest, "room_dw_b3bstest")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bstest_big, "room_dw_b3bstest_big")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_template, "room_dw_b3bs_template")
        
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_intro, "room_dw_b3bs_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_zapper_a_old, "room_dw_b3bs_zapper_a_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_shop, "room_dw_b3bs_shop")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_rabbick_a, "room_dw_b3bs_rabbick_a")
        
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_watercooler, "room_dw_b3bs_watercooler")
        
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_sadshadowguys, "room_dw_b3bs_sadshadowguys")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_rabbick_b, "room_dw_b3bs_rabbick_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_rouxls_lanina, "room_dw_b3bs_rouxls_lanina")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_rouxls_boss, "room_dw_b3bs_rouxls_boss")
        
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_cheaterpippins, "room_dw_b3bs_cheaterpippins")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_camerareminder, "room_dw_b3bs_camerareminder")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_b3bs_idcardpuzzle, "room_dw_b3bs_idcardpuzzle")
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[roomdark]", room_susiezilla, "room_susiezilla")
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "TV World")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_stealth, "room_dw_teevie_stealth")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_failure_cage, "room_dw_teevie_failure_cage")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_ribbick, "room_dw_teevie_ribbick")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_maze, "room_dw_teevie_maze")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_maze_points, "room_dw_teevie_maze_points")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_maze_chef, "room_dw_teevie_maze_chef")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_maze_final, "room_dw_teevie_maze_final")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_cutscene_final, "room_dw_teevie_cutscene_final")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_audiencepits, "room_dw_teevie_audiencepits")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_teevie_lightmaze, "room_dw_teevie_lightmaze")
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[room]", room_empty, "room_empty")
        scr_84_add_menu_item(parent, "[roomdark]", room_DARKempty, "room_DARKempty")
        scr_84_add_menu_item(parent, "[roomdark]", room_DARKbase_GMS2, "room_DARKbase_GMS2")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_clover, "room_cc_clover")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Unsorted Full List")
        scr_84_push(parent)
        parent = group
        for (var rooms = 0; rooms < (room_last + 1); rooms++)
            scr_84_add_menu_item(parent, "[roomgeneric]", rooms, room_get_name(rooms))
        parent = scr_84_pop()
        
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Options")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_god_mode", "God Mode")
        
        
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_show_room", "Show Room Name")
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Additional Visibility Toggles")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_show_plot", "Show Plot")
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_show_encounterno", "Show Encounterno")
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_show_interact", "Show Interact")
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_show_entrance", "Show Entrance")
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "debug_fps_display", "Show FPS")
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_debug_messages", "Show Debug Messages")
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, {
            action: function() 
            {
                if i_ex(obj_debugProfiler)
                {
                    obj_debugProfiler.toggleFlagGUI = true
                }
            },
            draw_text: function(item, name)
            {
                return name + ": " + (global.chemg_display_flag_changes ? "ON" : "OFF")
            }
        }, "", "Show Flag Changes")
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_flag_detection", "Always Detect Flag Changes")
        
        scr_84_add_menu_item(parent, {
            action: function() 
            {
                // Ignore controller since only keyboard mapping is currently supported
                if (!gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.input_g[4]))
                    global.chemg_rebinding = true;
            },
            draw_text: function(item, name)
            {
                if (global.chemg_rebinding)
                    return name + ": <Press Key>"
                else
                    return name + ": " + global.asc_def[global.chemg_menu_key]
            }
        }, "", "Menu Keybind");
        
        scr_84_add_menu_item(parent, "[restart]", "", "Restart Room")
        scr_84_add_menu_item(parent, "[loadj]", "", "Reload Japanese")
        scr_84_add_menu_item(parent, "[lang]", "ja", "Use Japanese")
        scr_84_add_menu_item(parent, "[lang]", "en", "Use English")
        scr_84_add_menu_item(parent, "[phone]", "", "Give Sans's Number")
        scr_84_add_menu_item(parent, "[fonttest]", "", "Font Test")
        
        // Just call snd_free_all directly
        scr_84_add_menu_item(parent, {action: snd_free_all}, "", "Stop All Music");
        scr_84_add_menu_item(parent, {action: function() 
        {
            show_message("8-4 Ltd: Original Menu from Chapter 1.\nTenna Save Editor: Flag list.\nbarofsoap418: Restored the menu in all chapters and updated most things for them/added most new features.\nVRadExe: Chapter 5 Room list, figured out Chapter 3+ handler system and how to add text to menu entries, made room warp types function properly+added one for starting in platforming mode, updated font list.\nZender Troop: Documented most global.plot changes in Chapter 5, which were used as reference for the Plot Warp menu.\nFafuhnir: literally nothing but i wanna shout him out hi leon :wave:")
        }}, "", "Credits")
        
        scr_84_add_menu_item(parent, {
            action: function() // the most important option
            {
                url_open("https://twitter.com/barofsoap418")
            },
            draw_text: method(self, function(item, name)
            {
                colsiner++
                draw_set_color(make_color_hsv((colsiner * 8) % 255, 60 + (sin(colsiner / 10) * 15), 255))
                return name
            })
        }, "", "!!!SUPER IMPORTANT!!!")
        
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Flags")
        scr_84_push(parent)
        parent = group
        
        scr_84_add_menu_item(parent, {action: function() 
        {
            var flagstr = get_string("Enter the flag name or numeric ID", "")
            if (flagstr != "")
            {
                var flagid = 0
                try
                {
                    flagid = real(flagstr)
                }
                catch(exc)
                {
                    // non-numeric, check flagnames instead
                    var _continue = false
                    for (var i = 0; i < array_length(global.flagname); i++)
                    {
                        if (global.flagname[i] != undefined && 
                            string_lower(global.flagname[i]) == string_lower(flagstr))
                        {
                            flagid = i
                            _continue = true
                            break
                        }
                    }
                    if (!_continue)
                    {
                        show_message("No flag with this name was found")
                        exit
                    }
                }
                
                // Array length is 9999, but only 2500 flags get saved in chapter 2 onward, so we might as well just show that
                if (flagid >= 2500)
                {
                    show_message("Too high!! Max flag count is 2500")
                    exit
                }
                
                var str = "Enter new value for flag " + string(flagid) + " " + scr_flag_name_get(flagid) + " (currently: " + string(global.flag[flagid]) + ")"
                    
                var varname = get_string(str, "")
                if (varname != "")
                {
                    try
                        global.flag[flagid] = real(varname)
                    catch(exc)
                        show_message("Flags can only be set to numbers!!!!")
                }
            }
        }}, 0, "Set Specific Flag")
        
        scr_84_add_menu_item(parent, {action: function()
        {
            var flagid = get_string("Set which global.tempflag value?", "");
            
            if (flagid != "")
            {
                flagid = real(flagid)
                if (flagid <= array_length(global.tempflag))
                {
                    var varname = get_string("Enter new value (currently: " + string(global.tempflag[flagid]) + ")", "")
                    if (varname != "")
                    {
                        if (is_numeric(global.tempflag[flagid]))
                            global.tempflag[flagid] = real(varname)
                        else
                            show_message("Tempflags can only be set to numbers!!!!")
                    }
                }
                else
                {
                    show_message("Too high!! Max tempflag count is " + string(array_length(global.tempflag) - 1))
                }
            }
        }}, 0, "Set Temporary Flag")
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Enemy Recruit Flags")
        scr_84_push(parent)
        parent = group
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 1")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[flagset]", 605, "Rudinn")
        scr_84_add_menu_item(parent, "[flagset]", 606, "Hathy")
        scr_84_add_menu_item(parent, "[flagset]", 611, "Ponman")
        scr_84_add_menu_item(parent, "[flagset]", 613, "Rabbick")
        scr_84_add_menu_item(parent, "[flagset]", 614, "Bloxor")
        scr_84_add_menu_item(parent, "[flagset]", 615, "Jigsawry")
        scr_84_add_menu_item(parent, "[flagset]", 616, "Clover")
        scr_84_add_menu_item(parent, "[flagset]", 620, "JEVIL")
        scr_84_add_menu_item(parent, "[flagset]", 622, "Rudinn Ranger")
        scr_84_add_menu_item(parent, "[flagset]", 623, "Head Hathy")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 2")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[flagset]", 630, "Ambyu-Lance")
        scr_84_add_menu_item(parent, "[flagset]", 631, "Poppup")
        scr_84_add_menu_item(parent, "[flagset]", 632, "Tasque")
        scr_84_add_menu_item(parent, "[flagset]", 633, "Werewire")
        scr_84_add_menu_item(parent, "[flagset]", 634, "Maus")
        scr_84_add_menu_item(parent, "[flagset]", 635, "Virovirokun")
        scr_84_add_menu_item(parent, "[flagset]", 636, "Swatchling")
        scr_84_add_menu_item(parent, "[flagset]", 640, "Werewerewire")
        scr_84_add_menu_item(parent, "[flagset]", 642, "Tasque Manager")
        scr_84_add_menu_item(parent, "[flagset]", 644, "Mauswheel")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 3")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[flagset]", 654, "Shadowguy")
        scr_84_add_menu_item(parent, "[flagset]", 655, "Shuttah")
        scr_84_add_menu_item(parent, "[flagset]", 656, "Zapper")
        scr_84_add_menu_item(parent, "[flagset]", 657, "Ribbick")
        scr_84_add_menu_item(parent, "[flagset]", 658, "Watercooler")
        scr_84_add_menu_item(parent, "[flagset]", 659, "Pippins")
        scr_84_add_menu_item(parent, "[flagset]", 660, "Elnina")
        scr_84_add_menu_item(parent, "[flagset]", 661, "Lanino")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 4")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[flagset]", 662, "Guei")
        scr_84_add_menu_item(parent, "[flagset]", 663, "Balthizard")
        scr_84_add_menu_item(parent, "[flagset]", 664, "Bibliox")
        scr_84_add_menu_item(parent, "[flagset]", 665, "Mizzle")
        scr_84_add_menu_item(parent, "[flagset]", 666, "Wicabel")
        scr_84_add_menu_item(parent, "[flagset]", 667, "Winglade")
        scr_84_add_menu_item(parent, "[flagset]", 668, "Organikk")
        scr_84_add_menu_item(parent, "[flagset]", 669, "HolywaterCooler")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 5")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[flagset]", 670, "Floradinn")
        scr_84_add_menu_item(parent, "[flagset]", 671, "Leafling")
        scr_84_add_menu_item(parent, "[flagset]", 672, "Shi")
        scr_84_add_menu_item(parent, "[flagset]", 673, "Shinobeetle")
        scr_84_add_menu_item(parent, "[flagset]", 674, "KawKaw")
        scr_84_add_menu_item(parent, "[flagset]", 675, "Sheary")
        scr_84_add_menu_item(parent, "[flagset]", 676, "Netskie")
        scr_84_add_menu_item(parent, "[flagset]", 677, "Terakota")
        parent = scr_84_pop()
        
        
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Options")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[flagset]", 8, "Simplify VFX")
        scr_84_add_menu_item(parent, "[flagset]", 11, "Autorun")
        scr_84_add_menu_item(parent, "[flagset]", 12, "Disable Screen Shake (UNUSED)")
        scr_84_add_menu_item(parent, "[flagset]", 13, "Beta Attack System (UNUSED)")
        scr_84_add_menu_item(parent, "[flagset]", 14, "Battle Cursor Memory (UNUSED)")
        scr_84_add_menu_item(parent, "[flagset]", 15, "SFX Volume (UNUSED)")
        scr_84_add_menu_item(parent, "[flagset]", 16, "Music Volume (UNUSED)")
        scr_84_add_menu_item(parent, "[flagset]", 17, "Master Volume")
        scr_84_add_menu_item(parent, "[flagset]", 1391, "Voice Clips")
        scr_84_add_menu_item(parent, "[flagset]", 25, "Platforming Jump and Attack Swap")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Game Control")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[flagset]", 6, "X-Skippable Dialogue")
        scr_84_add_menu_item(parent, "[flagset]", 10, "C-Skippable Dialogue")
        scr_84_add_menu_item(parent, "[flagset]", 7, "Openable Menu")
        scr_84_add_menu_item(parent, "[flagset]", 9, "Battle Music")
        scr_84_add_menu_item(parent, "[flagset]", 23, "Climbing Flag")
        scr_84_add_menu_item(parent, "[flagset]", 24, "Petal Feather Flag")
        scr_84_add_menu_item(parent, "[flagset]", 31, "Disable Walking Sounds")
        scr_84_add_menu_item(parent, "[flagset]", 32, "Disable Item/Gear Comments")
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[flagset]", 40, "Enemy Kills")
        scr_84_add_menu_item(parent, "[flagset]", 254, "Starwalker Flag")
        scr_84_add_menu_item(parent, "[flagset]", 1324, "Hometown Time of Day")
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Eggs")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[flagset]", 910, "CH1 Egg Flag (Obtained)")
        scr_84_add_menu_item(parent, "[flagset]", 911, "CH1 Egg Flag (Placed in Fridge)")
        scr_84_add_menu_item(parent, "[flagset]", 917, "CH2 Egg Flag (Obtained)")
        scr_84_add_menu_item(parent, "[flagset]", 918, "CH2 Egg Flag (Placed in Egg Basket)")
        scr_84_add_menu_item(parent, "[flagset]", 930, "CH3 Egg Flag")
        scr_84_add_menu_item(parent, "[flagset]", 931, "CH4 Egg Flag")
        scr_84_add_menu_item(parent, "[flagset]", 941, "CH5 Egg Flag")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Shadow Crystals")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[flagset]", 1646, "CH1 Shadow Crystal")
        scr_84_add_menu_item(parent, "[flagset]", 1647, "CH2 Shadow Crystal")
        scr_84_add_menu_item(parent, "[flagset]", 1648, "CH3 Shadow Crystal")
        scr_84_add_menu_item(parent, "[flagset]", 1649, "CH4 Shadow Crystal")
        scr_84_add_menu_item(parent, "[flagset]", 1907, "CH5 Shadow Crystal")
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[flagset]", 915, "Weird Route Progress")
        scr_84_add_menu_item(parent, "[flagset]", 916, "Weird Route Aborted")
        scr_84_add_menu_item(parent, "[flagset]", 1656, "Weird Route Aborted in Chapter 4")
        scr_84_add_menu_item(parent, "[flagset]", 1743, "Weird Route Aborted in Chapter 5")
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Unsorted Full List")
        scr_84_push(parent)
        parent = group
        for (var i = 0; i < array_length(global.flagname); i++)
        {   
            // Don't bother showing unnamed flags
            if (global.flagname[i] != undefined)
                scr_84_add_menu_item(parent, "[flagset]", i, scr_flag_name_get(i))
        }
        parent = scr_84_pop()
        
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Global Variables")
        scr_84_push(parent)
        parent = group
        
        var _set_global_any_handler = { action: function(type)
        {
            var _globalvar = get_string("Enter the variable to set (don't include \"global.\")", "")
            
            if _globalvar == ""
                exit
                
            if !variable_global_exists(_globalvar)
            {
                if !show_question("A variable with this name doesn't exist.\nInitialize a variable with this name?")
                    exit
            }
            
            var _str = "Enter the variable's new value as a " + type
            var _globalvarvalue = get_string(_str, "")
            
            if type == "number"
            {
                try
                    variable_global_set(_globalvar, real(_globalvarvalue))
                catch(exc)
                    show_message("That's not a number silly")
            }
            else if type == "string"
            {
                variable_global_set(_globalvar, _globalvarvalue)
            }
        }}
        scr_84_add_menu_item(parent, _set_global_any_handler, "number", "Set Any Global Variable (Number)")
        scr_84_add_menu_item(parent, _set_global_any_handler, "string", "Set Any Global Variable (String)")
        
        scr_84_add_menu_item(parent, "[globalset]", "plot", "Set Plot Value")
        // Menu overrides global.interact, so set the value to switch back to instead
        scr_84_add_menu_item(parent, "[globalset]", "chemg_interact", "Set Interact Value")
        scr_84_add_menu_item(parent, "[globalset]", "darkzone", "Set Darkzone Value")
        scr_84_add_menu_item(parent, "[globalset]", "debug", "Disable Debug Mode (RE-ENABLES UPON RESTARTING)")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Stats")
        scr_84_push(parent)
        parent = group
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Kris Stats")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[hp]", 1, "Set HP")
        scr_84_add_menu_item(parent, "[hpmax]", 1, "Set Max Hp")
        scr_84_add_menu_item(parent, "[attack]", 1, "Set Attack")
        scr_84_add_menu_item(parent, "[defense]", 1, "Set Defense")
        scr_84_add_menu_item(parent, "[magic]", 1, "Set Magic")
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Spells")
        scr_84_push(parent)
        parent = group
        for (var i = 0; i < 12; i ++)
            scr_84_add_menu_item(parent, "[spell]", 1, concat(i, " : ", "Empty"))
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Susie Stats")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[hp]", 2, "Set HP")
        scr_84_add_menu_item(parent, "[hpmax]", 2, "Set Max Hp")
        scr_84_add_menu_item(parent, "[attack]", 2, "Set Attack")
        scr_84_add_menu_item(parent, "[defense]", 2, "Set Defense")
        scr_84_add_menu_item(parent, "[magic]", 2, "Set Magic")
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Spells")
        scr_84_push(parent)
        parent = group
        for (var i = 0; i < 12; i ++)
            scr_84_add_menu_item(parent, "[spell]", 2, concat(i, " : ", "Empty"))
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Ralsei Stats")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[hp]", 3, "Set HP")
        scr_84_add_menu_item(parent, "[hpmax]", 3, "Set Max Hp")
        scr_84_add_menu_item(parent, "[attack]", 3, "Set Attack")
        scr_84_add_menu_item(parent, "[defense]", 3, "Set Defense")
        scr_84_add_menu_item(parent, "[magic]", 3, "Set Magic")
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Spells")
        scr_84_push(parent)
        parent = group
        for (var i = 0; i < 12; i ++)
            scr_84_add_menu_item(parent, "[spell]", 3, concat(i, " : ", "Empty"))
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Noelle Stats")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[hp]", 4, "Set HP")
        scr_84_add_menu_item(parent, "[hpmax]", 4, "Set Max Hp")
        scr_84_add_menu_item(parent, "[attack]", 4, "Set Attack")
        scr_84_add_menu_item(parent, "[defense]", 4, "Set Defense")
        scr_84_add_menu_item(parent, "[magic]", 4, "Set Magic")
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Spells")
        scr_84_push(parent)
        parent = group
        for (var i = 0; i < 12; i ++)
            scr_84_add_menu_item(parent, "[spell]", 4, concat(i, " : ", "Empty"))
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[idealall]", "", "Idealize Stats")
        
        scr_84_add_menu_item(parent, "[setmember]", 0, "Set Party Member 1 (BROKEN)")
        scr_84_add_menu_item(parent, "[setmember]", 1, "Set Party Member 2")
        scr_84_add_menu_item(parent, "[setmember]", 2, "Set Party Member 3")
        parent = scr_84_pop()
        
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Quick Plot Warps");
        scr_84_push(parent);
        parent = group;
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Pre-Game Show");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 0, "Chapter Start")
        scr_84_add_menu_item(parent, "[warp]", 1, "Ralsei Exposition Cutscene")
        scr_84_add_menu_item(parent, "[warp]", 2, "Tenna's Introduction Video")
        scr_84_add_menu_item(parent, "[warp]", 3, "Tenna's Post-Video Introduction")
        scr_84_add_menu_item(parent, "[warp]", 4, "Curtain Room")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Game Show 1");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 5, "Pre-Board 1 Cutscene")
        scr_84_add_menu_item(parent, "[warp]", 6, "Board 1 Intro")
        scr_84_add_menu_item(parent, "[warp]", 6.5, "Board 1")
        scr_84_add_menu_item(parent, "[warp]", 7, "Cooking Show")
        scr_84_add_menu_item(parent, "[warp]", 8, "Post-Board 1 Cutscene")
        scr_84_add_menu_item(parent, "[warp]", 9, "Green Room 1")
        scr_84_add_menu_item(parent, "[warp]", 10, "Green Room 1 (No Cutscene)")
        scr_84_add_menu_item(parent, "[warp]", 11, "Sword Route Board 1")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Game Show 2");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 12, "Pre-Board 2 Cutscene")
        scr_84_add_menu_item(parent, "[warp]", 13, "Board 2")
        scr_84_add_menu_item(parent, "[warp]", 14, "Rhythm Game")
        scr_84_add_menu_item(parent, "[warp]", 15, "Post-Board 2 Cutscene")
        scr_84_add_menu_item(parent, "[warp]", 16, "Green Room 2")
        scr_84_add_menu_item(parent, "[warp]", 17, "Green Room 2 (No Cutscene)")
        scr_84_add_menu_item(parent, "[warp]", 18, "Sword Route Board 2")
        scr_84_add_menu_item(parent, "[warp]", 19, "Sword Route Board 2 (No Ice Key)")
        scr_84_add_menu_item(parent, "[warp]", 20, "Sword Route Board 2 Dungeon")
        scr_84_add_menu_item(parent, "[warp]", 21, "Finding Toriel")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Doom Board");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 22, "Pre-Doom Board Cutscene")
        scr_84_add_menu_item(parent, "[warp]", 23, "Doom Board")
        scr_84_add_menu_item(parent, "[warp]", 24, "Post-Doom Board Cutscene")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "TV World");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 25, "TV World Entrance")
        scr_84_add_menu_item(parent, "[warp]", 26, "Tenna Sending Employees to Find Party")
        scr_84_add_menu_item(parent, "[warp]", 27, "Tenna Calls Ramb")
        scr_84_add_menu_item(parent, "[warp]", 28, "Bonus Zone")
        scr_84_add_menu_item(parent, "[warp]", 29, "Pipis Scene")
        scr_84_add_menu_item(parent, "[warp]", 30, "Pipis Scene (Spamton Version)")
        scr_84_add_menu_item(parent, "[warp]", 31, "Stealth Group")
        scr_84_add_menu_item(parent, "[warp]", 32, "Rouxls Battle")
        scr_84_add_menu_item(parent, "[warp]", 33, "Tenna Abandonment Scene A")
        scr_84_add_menu_item(parent, "[warp]", 34, "Tenna Abandonment Scene B")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Finale");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 35, "Green Room 3")
        scr_84_add_menu_item(parent, "[warp]", 36, "Ramb Half-Stone Scene")
        scr_84_add_menu_item(parent, "[warp]", 37, "Sword Route Board 3")
        scr_84_add_menu_item(parent, "[warp]", 38, "Sword Route Board 3 Dungeon")
        scr_84_add_menu_item(parent, "[warp]", 39, "Pre-Shadow Mantle Battle")
        scr_84_add_menu_item(parent, "[warp]", 40, "Shadow Mantle Battle")
        scr_84_add_menu_item(parent, "[warp]", 41, "Post-Shadow Mantle Battle")
        scr_84_add_menu_item(parent, "[warp]", 42, "Tenna Battle")
        scr_84_add_menu_item(parent, "[warp]", 43, "Knight Battle")
        scr_84_add_menu_item(parent, "[warp]", 44, "Light World Scene")
        parent = scr_84_pop();
        parent = scr_84_pop();
        
        global.chemg_menus = parent
    }
    if (process)
        return global.chemg_menu_depth > 0;
        
    // block input to other parts of the game (idk if this even works)
    sunkus_kb_block()
    
    // Store old states of draw parameters so we can avoid messing with how other menus look
    var old_color = draw_get_color()
    var old_font = draw_get_font()
    var old_halign = draw_get_halign()
    var old_valign = draw_get_valign()
    
    draw_set_font(fnt_main)
    draw_set_colour(c_white)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    
    if ((keyboard_check_pressed(global.chemg_menu_key) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_stickr))
    && !global.chemg_rebinding && global.chemg_menu_depth <= 0)
    {
        global.chemg_menu_depth = 1
        global.chemg_interact = global.interact
        global.chemg_yoffset = 0
        global.interact = 0
    }
    if (global.chemg_menu_depth > 0)
    {
        var parent = global.chemg_menus
        var change = 0
        var depth_ndx = global.chemg_menu_depth - 1
        var i = 0
        var choice, choice_data, choice_name
        do
        {
            var choice_ndx = global.chemg_menu_indices[i]
            choice = ds_list_find_value(parent, choice_ndx * 3)
            choice_data = ds_list_find_value(parent, (choice_ndx * 3) + 1)
            choice_name = ds_list_find_value(parent, (choice_ndx * 3) + 2)
            i += 1
            if (i == global.chemg_menu_depth)
                break
            parent = choice_data
        }
        until (0)
        var num_choices = ds_list_size(parent) / 3
        var timeinc = 0.25
        if (debug_movecooldown > 0)
            debug_movecooldown -= 1
        if ((keyboard_check(global.input_k[2]) || gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[2]) || keyboard_check(global.input_k[0]) || gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[0]))
            && !global.chemg_rebinding)
        {
            debug_movetimer += timeinc
            if (debug_movetimer >= 3.25)
            {
                if (keyboard_check(global.input_k[2]) || gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[2]))
                    debug_upmove = 1
                else if (keyboard_check(global.input_k[0]) || gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[0]))
                    debug_downmove = 1
                debug_movetimer = 0
                debug_movecooldown = 1
            }
        }
        else
        {
            debug_upmove = 0
            debug_downmove = 0
            debug_movetimer = 0
        }

        // Override all other input while rebinding
        if (global.chemg_rebinding)
        {
            // Disallow binding navigation keys
            if (keyboard_check_pressed(global.input_k[0]) ||
                keyboard_check_pressed(global.input_k[1]) ||
                keyboard_check_pressed(global.input_k[2]) ||
                keyboard_check_pressed(global.input_k[3]) ||
                keyboard_check_pressed(vk_escape) ||
                keyboard_check_pressed(vk_enter) ||
                keyboard_check_pressed(global.input_k[4]) ||
                keyboard_check_pressed(global.input_k[5]))
            {
                scr_debug_print("Can't bind menu to this key");
                snd_play(snd_cantselect);
                global.chemg_rebinding = false;
            }
            else if (keyboard_check_pressed(vk_anykey))
            {
                snd_play(snd_select)
                global.chemg_menu_key = keyboard_lastkey;
                global.chemg_rebinding = false;
                ossafe_ini_open("DebugPlus.ini");
                ini_write_real("AshleysDebug", "chemg_menu_key", global.chemg_menu_key);
                ossafe_ini_close();
            }
        }
        else if (keyboard_check_pressed(global.input_k[2]) || (debug_upmove >= 1 && debug_movecooldown <= 0) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.input_g[2]))
        {
            change = -1
        }
        else if (keyboard_check_pressed(global.input_k[0]) || (debug_downmove >= 1 && debug_movecooldown <= 0) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.input_g[0]))
        {
            change = 1
        }
        else if (keyboard_check_pressed(global.input_k[4]) || keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.input_g[4]))
        {
            if (is_struct(choice))
            {
                // Chapter 3+ method, inferred from code in scr_84_draw_menu
                var action_handler = variable_struct_get(choice, "action");
        
                if (action_handler)
                    action_handler(choice_data, choice_name);
            }
            else
            {
                // Chapter 1/2 method, most stuff in the mod uses this since this was built off the chapter 1 switch version
                if (choice == "[group]")
                {
                    global.chemg_menu_indices[global.chemg_menu_depth] = 0
                    global.chemg_menu_depth += 1
                }
                else if (choice == "[loadj]")
                {
                    var type = scr_84_lang_load()
                    show_debug_message("loaded " + type + " lang file")
                    show_message("loaded " + type + " lang file")
                    global.chemg_menu_depth = 0
                }
                else if (choice == "[room]") // Light World rooms
                {
                    global.darkzone = 0
                    global.start_in_platmode = 0;
                    room_goto(choice_data)
                    global.chemg_menu_depth = 0
                }
                else if (choice == "[roomdark]") // Dark World rooms
                {
                    global.darkzone = 1
                    global.start_in_platmode = 0;
                    room_goto(choice_data)
                    global.chemg_menu_depth = 0
                }
                else if (choice == "[roomplat]") // DW rooms that expect to start in platformer mode, to save having to manually switch
                {
                    global.darkzone = 1
                    global.start_in_platmode = 1
                    show_debug_message("room_goto: " + choice_name)
                    room_goto(choice_data)
                    global.chemg_menu_depth = 0
                }
                else if (choice == "[roomgeneric]") // Rooms that don't care about light/dark state
                {
                    room_goto(choice_data)
                    global.chemg_menu_depth = 0
                }
                else if (choice == "[lang]")
                {
                    show_debug_message("switch lang: " + choice_data)
                    if (ossafe_file_exists("true_config.ini"))
                    {
                        ossafe_ini_open("true_config.ini")
                        ini_write_string("LANG", "LANG", choice_data)
                        ossafe_ini_close()
                    }
                    global.lang = choice_data
                    global.chemg_menu_depth = 0
                    scr_84_init_localization()
                    room_restart()
                }
                else if (choice == "[restart]")
                {
                    show_debug_message("restart room")
                    room_restart()
                    global.chemg_menu_depth = 0
                }
                else if (choice == "[lightitem]")
                {
                    scr_litemget(choice_data)
                }
                else if (choice == "[item]")
                {
                    scr_itemget(choice_data)
                }
                else if (choice == "[keyitem]")
                {
                    scr_keyitemget(choice_data)
                }
                else if (choice == "[weaponitem]")
                {
                    scr_weaponget(choice_data)
                }
                else if (choice == "[armoritem]")
                {
                    scr_armorget(choice_data)
                }
                else if (choice == "[phone]")
                {
                    scr_phoneadd(202)
                }
                else if (choice == "[gold]")
                {
                    global.gold = max(0, global.gold + choice_data)
                }
                else if (choice == "[lightgold]")
                {
                    global.lgold = max(0, global.lgold + choice_data)
                }
                else if (choice == "[points]")
                {
                    global.flag[1044] = max(0, global.flag[1044] + choice_data)
                }
                else if choice == "[toggle_global_saveto_ini]"
                {
                    variable_global_set(choice_data, 1 - variable_global_get(choice_data))
                    ossafe_ini_open("DebugPlus.ini")
                    ini_write_real("AshleysDebug", choice_data, variable_global_get(choice_data))
                    ossafe_ini_close()
                    
                }
                else if (choice == "[fonttest]")
                {
                    global.chemg_font_test = !global.chemg_font_test
                    global.chemg_menu_depth = 0
                }
                else if (choice == "[gotoroom]")
                {
                    var varname = get_string("Enter Room ID (ex. room_castle_tutorial)", "")
                    if (room_exists(asset_get_index(varname)))
                        room_goto(asset_get_index(varname))
                    else if varname != ""
                        show_message("Doesn't exist vro.")
                }
                else if (choice == "[setgold]")
                {
                    var varname = get_string("Enter Amount", "")
                    global.gold = ceil(varname)
                }
                else if (choice == "[setgoldlight]")
                {
                    var varname = get_string("Enter Amount", "")
                    global.lgold = ceil(varname)
                }
                else if (choice == "[flagset]")
                {
                    var varname = get_string("Enter new value for flag " + string(choice_data) + " (currently: " + string(global.flag[choice_data]) + ")", "")
                    if (varname != "")
                    {
                        try
                            global.flag[choice_data] = real(varname)
                        catch(exc)
                            show_message("Flags can only be set to numbers!!!!")
                    }
                }
                else if (choice == "[flagtog]")
                {
                    global.flag[choice_data] = !global.flag[choice_data]
                }
                else if (choice == "[idealitem]")
                {
                    // remove inventory
                    for (i = 0; i < 13; i++)
                        global.item[i] = 0
                    
                    // deluxedinner
                    for (i = 0; i < 6; i++)
                        scr_itemget(39)
                    
                    // execbuffet
                    for (i = 0; i < 2; i++)
                        scr_itemget(38)
                    
                    // spincake
                    scr_itemget(7)
                    
                    // revivemint
                    for (i = 0; i < 3; i++)
                        scr_itemget(2)
                    
                    // weapons
                    scr_weaponget(14) // bounceblade
                    scr_weaponget(23) // saber10
                    scr_weaponget(24) // toxicaxe
                    scr_weaponget(7) // devilsknife
                    scr_weaponget(18) // fiberscarf
                    scr_weaponget(19) // rager2
                    scr_weaponget(21) // puppetscarf
                    scr_weaponget(25) // flexscarf
                    
                    // armors
                    for (i = 0; i < 4; i++) // royalpin
                        scr_armorget(22)
                    scr_armorget(3) // pink ribbon
                    scr_armorget(9) // twinribbon
                    scr_armorget(13) // spikeband
                    scr_armorget(7) // jevilstail
                    scr_armorget(21) // dealmaker
                    scr_armorget(23) // shadowmantle
                    for (i = 0; i < 3; i++) // lodestone
                        scr_armorget(24)
                    //for (i = 0; i < 3; i++) // tennatie
                        scr_armorget(27)
                    show_message("Idealized Items/Gear")
                }
                else if (choice == "[hp]")
                {
                    var newhp = get_string("Enter their new HP value", "")
                    if (newhp != "")
                        global.hp[choice_data] = real(newhp)
                }
                else if (choice == "[hpmax]")
                {
                    var newhpmax = get_string("Enter their new max HP value", "")
                    if (newhpmax != "")
                    {
                        global.maxhp[choice_data] = real(newhpmax)
                        global.hp[choice_data] = real(newhpmax)
                    }
                }
                else if (choice == "[attack]")
                {
                    var newat = get_string("Enter their new Attack value", "")
                    if (newat != "")
                        global.at[choice_data] = real(newat)
                }
                else if (choice == "[defense]")
                {
                    var newdf = get_string("Enter their new Defense value", "")
                    if (newdf != "")
                        global.df[choice_data] = real(newdf)
                }
                else if (choice == "[magic]")
                {
                    var newmag = get_string("Enter their new Magic value", "")
                    if (newmag != "")
                        global.mag[choice_data] = real(newmag)
                }
                else if (choice == "[idealall]") // idealize stats (make them the maximum they'd be after defeating each enemy with violence)
                {
                    // kris
                    global.maxhp[1] = 186
                    global.hp[1] = 186
                    global.at[1] = 15
                    global.df[1] = 2
                    global.mag[1] = 0
                    
                    // susie
                    global.maxhp[2] = 222
                    global.hp[2] = 222
                    global.at[2] = 19
                    global.df[2] = 2
                    global.mag[2] = 3
                    
                    // ralsei
                    global.maxhp[3] = 166
                    global.hp[3] = 166
                    global.at[3] = 13
                    global.df[3] = 2
                    global.mag[3] = 12
                    
                    // noelle
                    global.maxhp[4] = 166
                    global.hp[4] = 166
                    global.at[4] = 8
                    global.df[4] = 1
                    global.mag[4] = 16
                    show_message("Idealized Stats")
                }
                else if (choice == "[spell]")
                {
                    var newspell = get_string("Enter new spell ", "")
                    if (newspell != "")
                        global.spell[choice_data][real(string_char_at(choice_name, 1) + string_char_at(choice_name, 2))] = real(newspell)
                }
                else if (choice == "[setmember]")
                {
                    var newmem = get_string("Set party member " + string(choice_data), "")
                    if (newmem != "")
                    {
                        var rnewmem = real(newmem)
                        if (rnewmem < 0 || rnewmem > 4)
                        {
                            show_message("Invalid ID")
                            exit
                        }
                        global.char[choice_data] = rnewmem
                        show_message("Party member " + string(choice_data + 1) + " set, requires room restart to take effect.\nSome rooms set the party automatically in debug mode, so if it doesn't work that's probably why.")
                    }
                }
                else if (choice == "[globalset]")
                {
                    var newval = get_string("Enter new " + choice_data + " value (currently: " + string(variable_global_get(choice_data)) + ")", "");
                    if (newval != "")
                    {
                        variable_global_set(choice_data, real(newval));
                        
                        // set menu depth to false if debug mode is disabled, prevents the menu from appearing if you return to title screen
                        if choice_data == "debug" && newval != 1
                            global.chemg_menu_depth = 0
                    }
                }
                else if (choice == "[globalset_multi]")
                {
                    var newval = get_string("Enter new " + choice_data + " value (currently: " + string(variable_global_get(choice_data[0])) + ")", "");
                    if (newval != "")
                    {
                        for (var i = 0; i < array_length(choice_data); i++)
                        {
                            variable_global_set(choice_data[i], real(newval));
                        }
                    }
                }
                else if (choice == "[warp]")
                {
                    var roomtogo = ROOM_INITIALIZE
                    global.darkzone = 1
                    
                    snd_free_all()
                    
                    switch choice_data
                    {
                        case 0: // chapter start
                            global.plot = 0
                            scr_losechar()
                            roomtogo = room_dw_couch_overworld_intro
                            break
                        
                        case 1: // ralsei exposition scene
                            global.plot = 21
                            roomtogo = room_dw_couch_overworld_05
                            break
                            
                        case 2: // tenna intro video
                            global.plot = 50
                            roomtogo = room_dw_couch_video
                            break
                            
                        case 3: // tenna post-video intro
                            global.plot = 50
                            roomtogo = room_dw_tv_cutscene1g
                            break
                            
                        case 4: // curtain room
                            global.plot = 60
                            roomtogo = room_dw_tv_curtain
                            break
                            
                        case 5: // pre board 1 cutscene
                            global.plot = 70
                            roomtogo = room_ch3_gameshowroom
                            break
                            
                        case 6: // board 1 intro
                            global.plot = 80
                            roomtogo = room_board_gsa02_b0
                            break
                            
                        case 6.5: // board 1
                            global.plot = 80
                            roomtogo = room_board_1
                            break
                            
                        case 7: // cooking show
                            global.plot = 80
                            roomtogo = room_dw_chef
                            break
                            
                        case 8: // post board 1 cutscene
                            global.plot = 110
                            roomtogo = room_ch3_gameshowroom
                            break
                        
                        case 9: // green room 1
                            global.plot = 120
                            roomtogo = room_dw_green_room
                            break
                                                    
                        case 10: // green room 1 (no cutscene)
                            global.plot = 121
                            roomtogo = room_dw_green_room
                            break
                            
                        case 11: // sword route board 1
                            global.plot = 121
                            roomtogo = room_board_1_sword
                            scr_losechar()
                            if !scr_keyitemcheck(16)
                                scr_keyitemget(16)
                            break
                            
                        case 12: // pre board 2 cutscene
                            global.plot = 122
                            roomtogo = room_ch3_gameshowroom
                            break
                            
                        case 13: // board 2
                            global.plot = 130
                            roomtogo = room_board_2
                            break
                            
                        case 14: // rhythm game
                            global.plot = 131
                            roomtogo = room_dw_rhythm
                            break
                            
                        case 15: // post board 2 cutscene
                            global.plot = 140
                            roomtogo = room_ch3_gameshowroom
                            break
                            
                        case 16: // green room 2
                            global.plot = 150
                            roomtogo = room_dw_green_room
                            break
                            
                        case 17: // green room 2 (no cutscene)
                            global.plot = 160
                            roomtogo = room_dw_green_room
                            break
                            
                        case 18: // sword route board 2
                            global.plot = 160
                            roomtogo = room_board_2_sword
                            scr_losechar()
                            if !scr_keyitemcheck(16)
                                scr_keyitemget(16)
                            global.flag[1055] = 1
                            break
                            
                        case 19: // sword route board 2 (no ice key)
                            global.plot = 160
                            roomtogo = room_board_2_sword
                            scr_losechar()
                            if !scr_keyitemcheck(16)
                                scr_keyitemget(16)
                            global.flag[1055] = 0
                            break
                            
                        case 20: // sword route board 2 dungeon
                            global.plot = 160
                            roomtogo = room_board_dungeon_2
                            scr_losechar()
                            if !scr_keyitemcheck(16)
                                scr_keyitemget(16)
                            global.flag[1055] = 1.50
                            break
                            
                        case 21: // finding toriel
                            global.plot = 160
                            roomtogo = room_dw_snow_zone
                            break
                            
                        case 22: // doom board starting scene
                            global.plot = 170
                            roomtogo = room_ch3_gameshowroom
                            break
                            
                        case 23: // doom board
                            global.plot = 230
                            roomtogo = room_ch3_gameshowroom
                            break
                        
                        case 24: // post-doom board scene
                            global.plot = 230
                            roomtogo = room_dw_backstage
                            break
                            
                        case 25: // tv world entrance
                            global.plot = 250
                            roomtogo = room_dw_teevie_intro
                            break
                            
                        case 26: // tenna sending emplyoees to find party
                            global.plot = 255
                            global.currentsong[0] = snd_init("tv_world.ogg") // play here since there'll be no music otherwise
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1)
                            roomtogo = room_dw_teevie_large_02
                            break
                            
                        case 27: // tenna ramb call
                            global.plot = 255
                            global.currentsong[0] = snd_init("tv_world.ogg") // play here since there'll be no music otherwise
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1)
                            roomtogo = room_dw_teevie_stealth_c
                            break
                            
                        case 28: // bonus zone
                            global.plot = 255
                            roomtogo = room_dw_teevie_bonus_zone
                            break
                            
                        case 29: // pipis scene (no spamton)
                            global.plot = 255
                            roomtogo = room_dw_tv_closet
                            if scr_weaponcheck_inventory(21)
                                scr_weaponremove(21)
                            
                            for (i = 0; i < 4; i ++)
                            {
                                if global.charweapon[i] == 21
                                    global.charweapon[i] = 0
                            }
                            
                            if scr_armorcheck_inventory(21)
                                scr_armorremove(21)
                                
                            for (i = 0; i < 4; i ++)
                            {
                                if global.chararmor1[i] == 21
                                    global.chararmor1[i] = 0
                                if global.chararmor2[i] == 21
                                    global.chararmor2[i] = 0
                            }
                            
                            
                            break
                            
                        case 30: // pipis scene (spamton variant)
                            global.plot = 255
                            roomtogo = room_dw_tv_closet
                            if !scr_weaponcheck_inventory(21)
                                scr_weaponget(21)
                            if !scr_armorcheck_inventory(21)
                                scr_armorget(21)
                            break
                            
                        case 31: // stealth group scene
                            global.plot = 255
                            global.currentsong[0] = snd_init("tv_world.ogg") // play here since there'll be no music otherwise
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1)
                            roomtogo = room_dw_teevie_stealth_d
                            break
                            
                        case 32: // rouxls battle
                            global.plot = 255
                            roomtogo = room_dw_teevie_chef
                            break
                            
                        case 33: // tenna abandonment scene A
                            global.plot = 255
                            roomtogo = room_dw_teevie_dust
                            break
                            
                        case 34: // tenna abandonment scene B
                            global.plot = 270
                            roomtogo = room_dw_teevie_dust
                            break
                            
                        case 35: // green room 3
                            global.plot = 280
                            roomtogo = room_dw_green_room
                            break
                            
                        case 36: // ramb half-stone scene
                            global.plot = 280
                            roomtogo = room_dw_console_room
                            scr_losechar()
                            if !scr_keyitemcheck(16)
                                scr_keyitemget(16)
                            global.flag[1055] = 3
                            break
                            
                        case 37: // sword route board 3
                            global.plot = 280
                            roomtogo = room_board_3_sword
                            scr_losechar()
                            if !scr_keyitemcheck(16)
                                scr_keyitemget(16)
                            global.flag[1055] = 3
                            break
                            
                        case 38: // sword route board 3 dungeon
                            global.plot = 280
                            roomtogo = room_board_dungeon_3
                            scr_losechar()
                            if !scr_keyitemcheck(16)
                                scr_keyitemget(16)
                            global.flag[1055] = 4
                            break
                            
                        case 39: // pre-shadow mantle battle
                            global.plot = 280
                            roomtogo = room_board_preshadowmantle
                            scr_losechar()
                            if !scr_keyitemcheck(16)
                                scr_keyitemget(16)
                            global.flag[1055] = 5
                            break
                            
                        case 40: // shadow mantle battle
                            global.plot = 280
                            roomtogo = room_shadowmantle
                            scr_losechar()
                            if !scr_keyitemcheck(16)
                                scr_keyitemget(16)
                            global.flag[1055] = 5
                            break
                            
                        case 41: // post-shadow mantle battle
                            global.plot = 280
                            roomtogo = room_board_prepostshadowmantle
                            scr_losechar()
                            if !scr_keyitemcheck(16)
                                scr_keyitemget(16)
                            global.flag[1055] = 6
                            break
                        
                        case 42: // tenna battle
                            global.plot = 280
                            roomtogo = room_dw_snow_zone
                            break
                        
                        case 43: // knight battle
                            global.plot = 320
                            roomtogo = room_dw_snow_zone
                            break
                            
                        case 44: // light world scene
                            global.plot = 340
                            roomtogo = room_town_krisyard_dark
                            global.darkzone = 0
                            break
                        
                        // template
                        case 99: // 
                            global.plot = 0
                            roomtogo = room_dw_tv_cutscene1g
                            break
                    }
                    
                    if (!scr_havechar(2))
                        scr_getchar(2)
                    if (!scr_havechar(3))
                        scr_getchar(3)
                    
                    global.flag[1173] = 5
                    global.flag[1174] = 5
                    room_goto(roomtogo)
                    global.chemg_menu_depth = 0
                }
                else
                {
                    show_debug_message("unknown menu cmd:" + choice)
                }
            }
        }
        else if (keyboard_check_pressed(global.input_k[5]) || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.input_g[5]))
        {
            if (global.chemg_menu_depth > 0)
                global.chemg_menu_depth -= 1
            if (global.chemg_menu_depth == 0)
                global.interact = global.chemg_interact
        }
        for (i = 0; i < 10; i += 1)
        {
            global.input_pressed[i] = 0
            global.input_held[i] = 0
            global.input_released[i] = 0
        }

        if (change != 0)
            global.chemg_menu_indices[depth_ndx] = (global.chemg_menu_indices[depth_ndx] + num_choices + change) % num_choices
        draw_set_font(fnt_main)
        draw_set_colour(c_white)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        var yy = global.chemg_yoffset
        var vspacing = 15
        scr_84_draw_text_outline(10, yy, "====[ 8-4 Debug Menu ]====[ D$: " + string(global.gold) + " $: " + string(global.lgold) + " F$: " + string(global.flag[1411]) + " P$: " + string(global.flag[1312]) + " ]")
        yy += vspacing
        global.chemg_max_depth = -1
        global.chemg_cursor_y = 0
        scr_84_draw_menu(global.chemg_menus, 10, yy, vspacing, global.chemg_menu_indices, 0, global.chemg_menu_depth - 1)
        global.chemg_yoffset = min(10, 400 - (global.chemg_cursor_y - global.chemg_yoffset))
    }
    var chemg_room_name = room_get_name(room)
    if (global.chemg_god_mode > 0)
        chemg_room_name = chemg_room_name + "[god]"
    if (global.chemg_show_room)
    {
        draw_set_font(fnt_main)
        draw_set_colour(c_white)
        var chemg_x = 635 - string_width(chemg_room_name)
        var chemg_y = 5
        scr_84_draw_text_outline(chemg_x, chemg_y, chemg_room_name)
        draw_set_font(fnt_small)
        var _counter = 0
        if (global.chemg_show_plot == 1)
        {
            scr_84_draw_text_outline(chemg_x, chemg_y + 16 + (8 * _counter), "PLOT: " + string(global.plot))
            _counter++
        }
        if (global.chemg_show_encounterno == 1)
        {
            scr_84_draw_text_outline(chemg_x, chemg_y + 16 + (8 * _counter), "ENCOUNTERNO: " + string(global.encounterno))
            _counter++
        }
        if (global.chemg_show_interact == 1)
        {
            scr_84_draw_text_outline(chemg_x, chemg_y + 16 + (8 * _counter), "INTERACT: " + string(global.interact))
            _counter++
        }
        if (global.chemg_show_entrance == 1)
        {
            scr_84_draw_text_outline(chemg_x, chemg_y + 16 + (8 * _counter), "ENTRANCE: " + string(global.entrance))
            _counter++
        }
        
        // removed in favor of the chaper 1 fps counter
        /*if (global.chemg_show_fps == 1)
        {
            scr_84_draw_text_outline(chemg_x, chemg_y + 16 + (8 * _counter), "FPS: " + string(fps))
            _counter++
        }*/
    }
    if (global.chemg_menu_depth > 0)
    {
        draw_set_font(fnt_main)
        if draw_get_color() == c_yellow
            draw_set_color(c_lime)
        var barofsoap418 = "Restored/Improved by barofsoap418"
        scr_84_draw_text_outline(635 - string_width(barofsoap418), 475 - string_height(barofsoap418), barofsoap418)
    }
    if (global.chemg_font_test)
    {
        if (!variable_global_exists("chemg_font_init"))
        {
            global.chemg_font_init = 1
            ft = array_create()
            ft[array_length_1d(ft)] = 1
            ft[array_length_1d(ft)] = "NORMAL FONT"
            ft[array_length_1d(ft)] = 2
            ft[array_length_1d(ft)] = "SLOWER, SILENT"
            ft[array_length_1d(ft)] = 3
            ft[array_length_1d(ft)] = "normal enemy font."
            ft[array_length_1d(ft)] = 4
            ft[array_length_1d(ft)] = "battle dialogue"
            ft[array_length_1d(ft)] = 5
            ft[array_length_1d(ft)] = "NORMAL MAIN FONT"
            ft[array_length_1d(ft)] = 6
            ft[array_length_1d(ft)] = "NORMAL FONT BIG"
            ft[array_length_1d(ft)] = 7
            ft[array_length_1d(ft)] = "toriel font"
            ft[array_length_1d(ft)] = 8
            ft[array_length_1d(ft)] = "toriel font slow"
            // 9 skipped
            ft[array_length_1d(ft)] = 10
            ft[array_length_1d(ft)] = "susie font"
            ft[array_length_1d(ft)] = 11
            ft[array_length_1d(ft)] = "ralsei font"
            ft[array_length_1d(ft)] = 12
            ft[array_length_1d(ft)] = "noelle font"
            ft[array_length_1d(ft)] = 13
            ft[array_length_1d(ft)] = "berdly font"
            ft[array_length_1d(ft)] = 14
            ft[array_length_1d(ft)] = "sans font"
            ft[array_length_1d(ft)] = 15
            ft[array_length_1d(ft)] = "pap font (unused)"
            // skipped ? what could this have been
            //ft[array_length_1d(ft)] = 16
            //ft[array_length_1d(ft)] = ")??? font"
            ft[array_length_1d(ft)] = 17
            ft[array_length_1d(ft)] = "undyne font"
            ft[array_length_1d(ft)] = 18
            ft[array_length_1d(ft)] = "asgore font"
            ft[array_length_1d(ft)] = 19
            ft[array_length_1d(ft)] = "lancer font"
            ft[array_length_1d(ft)] = 20
            ft[array_length_1d(ft)] = "alphys font"
            ft[array_length_1d(ft)] = 21
            ft[array_length_1d(ft)] = "temmie font"
            ft[array_length_1d(ft)] = 22
            ft[array_length_1d(ft)] = "alphys font small"
            ft[array_length_1d(ft)] = 23
            ft[array_length_1d(ft)] = "noelle font small"
            // 24-29 skipped
            ft[array_length_1d(ft)] = 30
            ft[array_length_1d(ft)] = "susie dark world"
            ft[array_length_1d(ft)] = 31
            ft[array_length_1d(ft)] = "ralsei dark world"
            ft[array_length_1d(ft)] = 32
            ft[array_length_1d(ft)] = "lancer dark world"
            ft[array_length_1d(ft)] = 33
            ft[array_length_1d(ft)] = "king dark world"
            // 34 skipped
            ft[array_length_1d(ft)] = 35
            ft[array_length_1d(ft)] = "joker dark world"
            ft[array_length_1d(ft)] = 36
            ft[array_length_1d(ft)] = "NORMAL FONT SILENT"
            ft[array_length_1d(ft)] = 37
            ft[array_length_1d(ft)] = "susie dark world slow, spaced."
            // 38-39 skipped
            ft[array_length_1d(ft)] = 40
            ft[array_length_1d(ft)] = "inteo"
            ft[array_length_1d(ft)] = 41
            ft[array_length_1d(ft)] = "intro slower"
            ft[array_length_1d(ft)] = 42
            ft[array_length_1d(ft)] = "big silent slower"
            // 43-44 skipped
            ft[array_length_1d(ft)] = 45
            ft[array_length_1d(ft)] = "battle dialogue ral"
            ft[array_length_1d(ft)] = 46
            ft[array_length_1d(ft)] = "battle dialogue lan"
            ft[array_length_1d(ft)] = 47
            ft[array_length_1d(ft)] = "battle dialogue sus"
            ft[array_length_1d(ft)] = 48
            ft[array_length_1d(ft)] = "king dark world battle"
            // 49 skipped
            ft[array_length_1d(ft)] = 50
            ft[array_length_1d(ft)] = "enemy"
            ft[array_length_1d(ft)] = 51
            ft[array_length_1d(ft)] = "hellish yak text"
            ft[array_length_1d(ft)] = 52
            ft[array_length_1d(ft)] = "hellish yak text 2"
            ft[array_length_1d(ft)] = 53
            ft[array_length_1d(ft)] = "enemy: Susie"
            ft[array_length_1d(ft)] = 54
            ft[array_length_1d(ft)] = "enemy: Susie 2"
            ft[array_length_1d(ft)] = 55
            ft[array_length_1d(ft)] = "rudy font"
            // 56-59 skipped
            ft[array_length_1d(ft)] = 60
            ft[array_length_1d(ft)] = "SLOWER, SILENT 2"
            ft[array_length_1d(ft)] = 61
            ft[array_length_1d(ft)] = "susie alt"
            ft[array_length_1d(ft)] = 62
            ft[array_length_1d(ft)] = "queen"
            ft[array_length_1d(ft)] = 63
            ft[array_length_1d(ft)] = "noelle alt 1"
            ft[array_length_1d(ft)] = 64
            ft[array_length_1d(ft)] = "noelle alt 2"
            ft[array_length_1d(ft)] = 65
            ft[array_length_1d(ft)] = "rouxls (unused)"
            ft[array_length_1d(ft)] = 66
            ft[array_length_1d(ft)] = "spamton"
            ft[array_length_1d(ft)] = 67
            ft[array_length_1d(ft)] = "spamton neo"
            ft[array_length_1d(ft)] = 68
            ft[array_length_1d(ft)] = "spamton battle"
            ft[array_length_1d(ft)] = 69
            ft[array_length_1d(ft)] = "berdly battle"
            ft[array_length_1d(ft)] = 70
            ft[array_length_1d(ft)] = "queen battle (unused?)"
            ft[array_length_1d(ft)] = 71
            ft[array_length_1d(ft)] = "queen battle alt (unused?)"
            ft[array_length_1d(ft)] = 72
            ft[array_length_1d(ft)] = "spamton neo battle"
            // 73 skipped
            ft[array_length_1d(ft)] = 74
            ft[array_length_1d(ft)] = "ralsei in battle"
            ft[array_length_1d(ft)] = 75
            ft[array_length_1d(ft)] = "susie in battle"
            ft[array_length_1d(ft)] = 76
            ft[array_length_1d(ft)] = "noelle in battle"
            ft[array_length_1d(ft)] = 77
            ft[array_length_1d(ft)] = "berdly dark world"
            ft[array_length_1d(ft)] = 78
            ft[array_length_1d(ft)] = "dark world generic alt?"
            ft[array_length_1d(ft)] = 79
            ft[array_length_1d(ft)] = "susie and ralsei"
            // 80-82 skipped - chapter 3 stuff?
            ft[array_length_1d(ft)] = 83
            ft[array_length_1d(ft)] = "jackenstein"
            ft[array_length_1d(ft)] = 84
            ft[array_length_1d(ft)] = "tenna"
            // 85 skipped
            ft[array_length_1d(ft)] = 86
            ft[array_length_1d(ft)] = "flowery"
            ft[array_length_1d(ft)] = 87
            ft[array_length_1d(ft)] = "carol"
            ft[array_length_1d(ft)] = 88
            ft[array_length_1d(ft)] = "flowery alt"
            ft[array_length_1d(ft)] = 89
            ft[array_length_1d(ft)] = "asgore dark world"
            ft[array_length_1d(ft)] = 90
            ft[array_length_1d(ft)] = "aqua"
            ft[array_length_1d(ft)] = 91
            ft[array_length_1d(ft)] = "seth"
            ft[array_length_1d(ft)] = 92
            ft[array_length_1d(ft)] = "yellow"
            ft[array_length_1d(ft)] = 93
            ft[array_length_1d(ft)] = "orange"
            ft[array_length_1d(ft)] = 94
            ft[array_length_1d(ft)] = "blue"
            ft[array_length_1d(ft)] = 95
            ft[array_length_1d(ft)] = "green"
            ft[array_length_1d(ft)] = 96
            ft[array_length_1d(ft)] = "flowery battle"
            ft[array_length_1d(ft)] = 97
            ft[array_length_1d(ft)] = "normal alt?"
            ft[array_length_1d(ft)] = 98
            ft[array_length_1d(ft)] = "normal orange?"
            ft[array_length_1d(ft)] = 99
            ft[array_length_1d(ft)] = "susie alt"
            ft[array_length_1d(ft)] = 100
            ft[array_length_1d(ft)] = "board text"
            
            ft[array_length_1d(ft)] = 200
            ft[array_length_1d(ft)] = "susie in battle alt"
            ft[array_length_1d(ft)] = 201
            ft[array_length_1d(ft)] = "ralsei in battle alt"
            ft[array_length_1d(ft)] = 202
            ft[array_length_1d(ft)] = "ralsei alt"
            ft[array_length_1d(ft)] = 203
            ft[array_length_1d(ft)] = "normal alt?"
            
            ft[array_length_1d(ft)] = 666
            ft[array_length_1d(ft)] = "GLOW TEXT"
            ft[array_length_1d(ft)] = 667
            ft[array_length_1d(ft)] = "GLOW TEXT 2"
            
            ft[array_length_1d(ft)] = 999
            ft[array_length_1d(ft)] = "susie intro (unused)"
            
            // Autogenerate the list of raw fonts
            for (var i = 0; font_exists(i); i++) {
                ft[array_length_1d(ft)] = -1;
                ft[array_length_1d(ft)] = i;
            }
            global.chemg_font_types = ft
            global.chemg_font_type_ndx = 0
        }
        var ft = global.chemg_font_types
        var num_types = array_length_1d(ft) / 2
        var change = 0
        if (keyboard_check_pressed(global.input_k[1]) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.input_g[1]))
            change = 1
        else if (keyboard_check_pressed(global.input_k[3]) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.input_g[3]))
            change = -1
        global.chemg_font_type_ndx = (global.chemg_font_type_ndx + change + num_types) % num_types
        var fndx = global.chemg_font_type_ndx * 2
        var xx = 10
        var yy = 200
        var strings
        strings[0] = "pack my box with five"
        strings[1] = "dozen liquor jugs."
        strings[2] = "PACK MY BOX WITH FIVE"
        strings[3] = "DOZEN LIQUOR JUGS!"
        // I don't speak japanese so idk if there's a better test to do here - kelsey
        strings[4] = "これは日本語です。"
        strings[5] = "魔物に食われない！"
        strings[6] = "1234567890+-%/$"
        var typer = ft[fndx]
        var font, vspacing, msg, clr
        if (typer >= 0)
        {
            global.typer = typer
            scr_texttype()
            font = myfont
            clr = mycolor
            msg = "(" + string(global.typer) + ") " + ft[fndx + 1] + ", font: " + font_get_name(myfont)
            vspacing = vspace
            
            // play the sound, may be more useful to just spawn a obj_writer
            // so you can see other properties like speed
            if (change) != 0
                snd_play(textsound);
        }
        else
        {
            font = ft[fndx + 1]
            clr = c_white
            
            // Indicate runtime generated fonts
            var fontname = font_get_name(font)
            if (string_starts_with(fontname, "__newfont"))
                msg = "runtime sprite font (" + font_get_fontname(font) + ")"
            else
                msg = "font: " + fontname + " (" + font_get_fontname(font) + ")"
            vspacing = font_get_size(font) + 2
        }
        draw_set_font(font)
        draw_set_colour(clr)
        for (var i = 0; i < array_length_1d(strings); i += 1)
        {
            var str = strings[i]
            if (typer >= 0)
            {
                var len = string_length(str)
                var wx = xx
                for (var j = 1; j <= len; j += 1)
                {
                    var mychar = string_copy(str, j, 1)
                    draw_text(wx, yy + 20 + (i * vspacing), mychar)
                    wx += hspace
                    if (global.lang == "ja")
                    {
                        if (ord(mychar) < 256 || (ord(mychar) >= 65377 && ord(mychar) <= 65439))
                            wx -= (hspace / 2)
                    }
                }
            }
            else
            {
                draw_text(xx, yy + 20 + (i * vspacing), str)
            }
        }
        draw_set_colour(c_white)
        draw_set_font(fnt_main)
        draw_text(xx, yy, "<-/-> to change typer: " + msg)
    }
    
    draw_set_color(old_color)
    draw_set_font(old_font)
    draw_set_halign(old_halign)
    draw_set_valign(old_valign)
    
}
