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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 4")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[item]", 1, "Darker Candy")
        scr_84_add_menu_item(parent, "[item]", 60, "AncientSweet")
        scr_84_add_menu_item(parent, "[item]", 61, "Rhapsotea")
        scr_84_add_menu_item(parent, "[item]", 62, "Scarlixir")
        scr_84_add_menu_item(parent, "[item]", 63, "BitterTear")
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
        scr_84_add_menu_item(parent, "[lightitem]", 15, "Holiday Pencil")
        scr_84_add_menu_item(parent, "[lightitem]", 16, "CactusNeedle")
        scr_84_add_menu_item(parent, "[lightitem]", 17, "BlackShard")
        scr_84_add_menu_item(parent, "[lightitem]", 18, "QuillPen")
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 4")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[keyitem]", 30, "SheetMusic") // why does chapter 4 skip to here...
        scr_84_add_menu_item(parent, "[keyitem]", 31, "ClaimbClaws")
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 4")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[weaponitem]", 50, "JingleBlade")
        scr_84_add_menu_item(parent, "[weaponitem]", 51, "ScarfMark")
        scr_84_add_menu_item(parent, "[weaponitem]", 52, "JusticeAxe")
        scr_84_add_menu_item(parent, "[weaponitem]", 53, "Winglade")
        scr_84_add_menu_item(parent, "[weaponitem]", 54, "AbsorbAx")
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 4")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[armoritem]", 50, "Waferguard")
        scr_84_add_menu_item(parent, "[armoritem]", 51, "MysticBand")
        scr_84_add_menu_item(parent, "[armoritem]", 52, "PowerBand")
        scr_84_add_menu_item(parent, "[armoritem]", 53, "PrincessRBN")
        scr_84_add_menu_item(parent, "[armoritem]", 54, "GoldWidow")
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[idealitem]", 0, "Idealize Items/Gear")
        
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Rooms")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[gotoroom]", room_gms_debug_failsafe, "Go to Specific Room")
        scr_84_add_menu_item(parent, "[room]", ROOM_INITIALIZE, "ROOM_INITIALIZE")
        scr_84_add_menu_item(parent, "[room]", PLACE_CONTACT, "PLACE_CONTACT")
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Debug")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_title_placeholder, "room_title_placeholder")
        scr_84_add_menu_item(parent, "[room]", room_battletest, "room_battletest")
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
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_layeredLevelTest, "room_debug_layeredLevelTest")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_windowEffect, "room_debug_windowEffect")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_slidingbookshelf, "room_dw_church_slidingbookshelf")
        scr_84_add_menu_item(parent, "[roomdark]", room_darkness_example, "room_darkness_example")
        scr_84_add_menu_item(parent, "[roomdark]", room_darkness_example_2, "room_darkness_example_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_lerptest, "room_lerptest")
        scr_84_add_menu_item(parent, "[roomdark]", room_rhythmgame_editor, "room_rhythmgame_editor")
        scr_84_add_menu_item(parent, "[roomdark]", room_bullettest_new, "room_bullettest_new")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_channelchange_test, "room_dw_channelchange_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_test_climb_new, "room_test_climb_new")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_rotating_tower, "room_dw_rotating_tower")
        scr_84_add_menu_item(parent, "[roomdark]", room_dark_twostoryTest, "room_dark_twostoryTest")
        scr_84_add_menu_item(parent, "[roomdark]", room_overworldDarknessBulletTest, "room_overworldDarknessBulletTest")
        scr_84_add_menu_item(parent, "[roomdark]", room_overworld_darkmaku_ring, "room_overworld_darkmaku_ring")
        scr_84_add_menu_item(parent, "[roomdark]", room_overworld_darkmakumaze, "room_overworld_darkmakumaze")
        scr_84_add_menu_item(parent, "[roomdark]", room_overworld_darkmaku_blocks, "room_overworld_darkmaku_blocks")
        scr_84_add_menu_item(parent, "[roomdark]", room_traintest, "room_traintest")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_rippletest, "room_dw_church_rippletest")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_gueitest, "room_dw_church_gueitest")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_pianotest, "room_debug_pianotest")
        scr_84_add_menu_item(parent, "[roomdark]", room_gersonbattleroomtest, "room_gersonbattleroomtest")
        scr_84_add_menu_item(parent, "[roomdark]", room_traintest_big, "room_traintest_big")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_3d_tower_test, "room_dw_3d_tower_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_3d_tower_test, "room_dw_3d_tower_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_test_pianoGimmick, "room_test_pianoGimmick")
        scr_84_add_menu_item(parent, "[roomdark]", room_test_remotePiano, "room_test_remotePiano")
        scr_84_add_menu_item(parent, "[roomdark]", room_test_climb_new2, "room_test_climb_new2")
        scr_84_add_menu_item(parent, "[roomdark]", room_test_climb_cameratest, "room_test_climb_cameratest")
        scr_84_add_menu_item(parent, "[roomdark]", room_test_climb_0001, "room_test_climb_0001")
        scr_84_add_menu_item(parent, "[roomdark]", room_test_climb_enterexit, "room_test_climb_enterexit")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_quicktest, "room_dw_church_quicktest")
        scr_84_add_menu_item(parent, "[roomdark]", room_rotating_tower_new_test, "room_rotating_tower_new_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_rotating_tower_new_example, "room_rotating_tower_new_example")
        scr_84_add_menu_item(parent, "[roomdark]", room_rhythmgame_editor, "room_rhythmgame_editor")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_channelchange_test, "room_dw_channelchange_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_ripple_test, "room_ripple_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_lightworldTest, "room_lightworldTest")
        scr_84_add_menu_item(parent, "[roomdark]", room_vfx_tester, "room_vfx_tester")
        scr_84_add_menu_item(parent, "[roomdark]", room_shapetest, "room_shapetest")
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
        scr_84_add_menu_item(parent, "[room]", room_krisroom_dark, "room_krisroom_dark")
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
        scr_84_add_menu_item(parent, "[group]", group, "Church")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_lw_church_entrance, "room_lw_church_entrance")
        scr_84_add_menu_item(parent, "[room]", room_lw_church_main, "room_lw_church_main")
        scr_84_add_menu_item(parent, "[room]", room_lw_church_choir, "room_lw_church_choir")
        scr_84_add_menu_item(parent, "[room]", room_lw_church_office, "room_lw_church_office")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Noelle's House")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_town_noellehouse, "room_town_noellehouse")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_main, "room_lw_noellehouse_main")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_kitchen, "room_lw_noellehouse_kitchen")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_bathroom, "room_lw_noellehouse_bathroom")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_noelle, "room_lw_noellehouse_noelle")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_dess, "room_lw_noellehouse_dess")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_closet, "room_lw_noellehouse_closet")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_vents_west, "room_lw_noellehouse_vents_west")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_vents_north, "room_lw_noellehouse_vents_north")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_vents_east, "room_lw_noellehouse_vents_east")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_vents_south, "room_lw_noellehouse_vents_south")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_vents_north_west, "room_lw_noellehouse_vents_north_west")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_north, "room_lw_noellehouse_north")
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_basement, "room_lw_noellehouse_basement")
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
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_tv, "room_dw_castle_tv")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_tv_rhythm, "room_dw_castle_tv_rhythm")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ralsei_castle_1f, "room_dw_ralsei_castle_1f")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ralsei_castle_2f, "room_dw_ralsei_castle_2f")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ralsei_castle_3f, "room_dw_ralsei_castle_3f")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_dungeon, "room_dw_castle_dungeon")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_rooms_kris, "room_dw_castle_rooms_kris")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_rooms_susie, "room_dw_castle_rooms_susie")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_rooms_ralsei, "room_dw_castle_rooms_ralsei")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_rooms_queen, "room_dw_castle_rooms_queen")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_rooms_tenna, "room_dw_castle_rooms_tenna")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_rooms_kris_susie, "room_dw_castle_rooms_kris_susie")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_rhythm, "room_dw_rhythm")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_rhythm_countdown, "room_dw_rhythm_countdown")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_tv_zone_1, "room_dw_castle_tv_zone_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_tv_zone_2, "room_dw_castle_tv_zone_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_tv_zone_3, "room_dw_castle_tv_zone_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_tv_zone_battle, "room_dw_castle_tv_zone_battle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_tv_zone_minigame, "room_dw_castle_tv_zone_minigame")
        
        
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Dark Sanctuary")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_intro1, "room_dw_church_intro1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_intropiano, "room_dw_church_intropiano")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_staircase, "room_dw_church_staircase")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_glass, "room_dw_church_glass")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_savepoint, "room_dw_church_savepoint")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_intro_guei, "room_dw_church_intro_guei")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_intro_gerson, "room_dw_church_intro_gerson")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_minorlegend, "room_dw_church_minorlegend")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_holywatercooler, "room_dw_church_holywatercooler")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_shadowgerson, "room_dw_church_shadowgerson")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bookcase, "room_dw_church_bookcase")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_turtles, "room_dw_church_turtles")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_ripseq1, "room_dw_church_ripseq1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_ripseq2, "room_dw_church_ripseq2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_ripplepuzzle, "room_dw_church_ripplepuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_ripplepuzzle_postgers, "room_dw_church_ripplepuzzle_postgers")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_rippleworship, "room_dw_church_rippleworship")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_lantern_hallway, "room_dw_church_lantern_hallway")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_darkmaze, "room_dw_church_darkmaze")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_gersonstudy, "room_dw_church_gersonstudy")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_arena, "room_dw_church_arena")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_dogclimb, "room_dw_church_dogclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_nwconnect, "room_dw_church_nwconnect")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_biblioxencounter, "room_dw_church_biblioxencounter")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_moneyfountain, "room_dw_church_moneyfountain")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_waterfallroom, "room_dw_church_waterfallroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_waterfalltearoom, "room_dw_church_waterfalltearoom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bookshelfpuzzle_rev, "room_dw_church_bookshelfpuzzle_rev")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_worshiproom, "room_dw_church_worshiproom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_tallbookcases, "room_dw_church_tallbookcases")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_pianopiece_right, "room_dw_church_pianopiece_right")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_pianopiece_rightprophecy, "room_dw_church_pianopiece_rightprophecy")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_pianopiece_left, "room_dw_church_pianopiece_left")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_pianopiece_left_b, "room_dw_church_pianopiece_left_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_secretpiano, "room_dw_church_secretpiano")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_pianopuzzle, "room_dw_church_pianopuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_jackenstein, "room_dw_church_jackenstein")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_rightconnect, "room_dw_church_rightconnect")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_stairspreview, "room_dw_church_stairspreview")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_trueclimbadventure, "room_dw_church_trueclimbadventure")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_sideclimb, "room_dw_church_sideclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_organpuzzle, "room_dw_church_organpuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_mizzleencounter, "room_dw_church_mizzleencounter")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bellhall_bookroom, "room_dw_church_bellhall_bookroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bellhall_curtain, "room_dw_church_bellhall_curtain")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_northprophecies, "room_dw_church_northprophecies")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_knightclimb, "room_dw_church_knightclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_knightclimb_post, "room_dw_church_knightclimb_post")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_fountain, "room_dw_church_fountain")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Second Sanctuary")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_fountain, "room_dw_churchb_fountain")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_staircaseintro, "room_dw_churchb_staircaseintro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_ripple1, "room_dw_churchb_ripple1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_ripplepost, "room_dw_churchb_ripplepost")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_prophecyencounter, "room_dw_churchb_prophecyencounter")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_library, "room_dw_churchb_library")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_worshiproom, "room_dw_churchb_worshiproom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_libraryconnector, "room_dw_churchb_libraryconnector")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_savepoint, "room_dw_churchb_savepoint")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_moneyfountain, "room_dw_churchb_moneyfountain")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_rotatingtower, "room_dw_churchb_rotatingtower")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_windows, "room_dw_churchb_windows")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_bookshelf, "room_dw_churchb_bookshelf")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_man, "room_dw_churchb_man")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_bellroom, "room_dw_churchb_bellroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_gallery, "room_dw_churchb_gallery")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_darkclimb_scene, "room_dw_churchb_darkclimb_scene")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_darkclimb, "room_dw_churchb_darkclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_gersonstudy, "room_dw_churchb_gersonstudy")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_fireplace, "room_dw_churchb_fireplace")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_gersonchase, "room_dw_churchb_gersonchase")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_nongerson, "room_dw_churchb_nongerson")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_nongerson_post, "room_dw_churchb_nongerson_post")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_extinguisher, "room_dw_churchb_extinguisher")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Third Sanctuary")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_superprophecies, "room_dw_churchc_superprophecies")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_encounter1, "room_dw_churchc_encounter1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_prophecies, "room_dw_churchc_prophecies")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_dodge, "room_dw_churchc_dodge")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_angelprophecy_encounter, "room_dw_churchc_angelprophecy_encounter")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_angelprophecy, "room_dw_churchc_angelprophecy")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_encounter2, "room_dw_churchc_encounter2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_treasurechest, "room_dw_churchc_treasurechest")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_slidingpiano, "room_dw_churchc_slidingpiano")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_savepoint, "room_dw_churchc_savepoint")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_finalclimb, "room_dw_churchc_finalclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_darkswords, "room_dw_churchc_darkswords")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_prepretitan, "room_dw_churchc_prepretitan")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_pretitan, "room_dw_churchc_pretitan")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_titanclimb1, "room_dw_churchc_titanclimb1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_titanclimb1_post, "room_dw_churchc_titanclimb1_post")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_titanclimb2, "room_dw_churchc_titanclimb2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_titanclimb2_post, "room_dw_churchc_titanclimb2_post")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_insidetitan, "room_dw_churchc_insidetitan")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_titandefeated, "room_dw_churchc_titandefeated")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_final_prophecy, "room_dw_churchc_final_prophecy")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Special")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_intro_ch4, "room_intro_ch4")
        scr_84_add_menu_item(parent, "[room]", PLACE_DOG, "PLACE_DOG")
        scr_84_add_menu_item(parent, "[room]", room_legend, "room_legend")
        scr_84_add_menu_item(parent, "[room]", room_legend_neo, "room_legend_neo")
        scr_84_add_menu_item(parent, "[roomdark]", room_shop1, "room_shop1")
        scr_84_add_menu_item(parent, "[roomdark]", room_shop_music, "room_shop_music")
        scr_84_add_menu_item(parent, "[roomdark]", room_gameover, "room_gameover")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_LOGO, "PLACE_LOGO")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_FAILURE, "PLACE_FAILURE")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_NAMING_JIKKEN, "PLACE_NAMING_JIKKEN")
        scr_84_add_menu_item(parent, "[room]", PLACE_MENU, "PLACE_MENU")
        scr_84_add_menu_item(parent, "[room]", room_ed, "room_ed")
        scr_84_add_menu_item(parent, "[room]", PLACE_DOGCHECK2, "PLACE_DOGCHECK2")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Unused")
        scr_84_push(parent)
        parent = group
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Dark Sanctuary (Original Non-linear Version)")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_intro3, "room_dw_church_intro3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_darkroom1_old, "room_dw_church_darkroom1_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_lantern1_old_old, "room_dw_church_lantern1_old_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_darkbell_old, "room_dw_church_darkbell_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_stairs_west_bell, "room_dw_church_stairs_west_bell")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_librarybookenemy, "room_dw_church_librarybookenemy")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bookshelfpuzzle1, "room_dw_church_bookshelfpuzzle1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bookshelfpuzzle2, "room_dw_church_bookshelfpuzzle2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_swingingbell, "room_dw_church_swingingbell")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_lantern2, "room_dw_church_lantern2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_smallbells, "room_dw_church_smallbells")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_claw, "room_dw_church_claw")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_shelfclimb1, "room_dw_church_shelfclimb1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_statueclimb, "room_dw_church_statueclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_offering, "room_dw_church_offering")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_npcroom_shelfclimb, "room_dw_church_npcroom_shelfclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_stairs_stainedglass, "room_dw_church_stairs_stainedglass")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bellsareawest, "room_dw_church_bellsareawest")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_stairs_topright, "room_dw_church_stairs_topright")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_poolsroom1, "room_dw_church_poolsroom1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_candlesroom1, "room_dw_church_candlesroom1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_solowaterfall, "room_dw_church_solowaterfall")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_statueroom, "room_dw_church_statueroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_poolsroom2, "room_dw_church_poolsroom2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_shelfclimb2, "room_dw_church_shelfclimb2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_statueclimb_npcroom, "room_dw_church_statueclimb_npcroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bellhall_west, "room_dw_church_bellhall_west")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_fountainconnection, "room_dw_church_fountainconnection")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_stainedglasspreview, "room_dw_church_stainedglasspreview")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_stairs_topleft, "room_dw_church_stairs_topleft")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_npcroom_pools1, "room_dw_church_npcroom_pools1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_poolsroom1_east, "room_dw_church_poolsroom1_east")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bookenemywest, "room_dw_church_bookenemywest")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_poolsroom2south, "room_dw_church_poolsroom2south")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bellhall_east, "room_dw_church_bellhall_east")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bellhall_central, "room_dw_church_bellhall_central")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_darkroom_old, "room_dw_church_darkroom_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_lantern1_old, "room_dw_church_lantern1_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_statueroom_old, "room_dw_church_statueroom_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_dark_fire_puzzle, "room_dw_church_dark_fire_puzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_guei, "room_dw_church_guei")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_lantern_hallway_old, "room_dw_church_lantern_hallway_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_chase_old, "room_dw_church_chase_old")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Dark Sanctuary")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_climbtut, "room_dw_church_climbtut")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_fastwater, "room_dw_church_fastwater")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_crumbletower, "room_dw_church_crumbletower")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_tower1, "room_dw_church_tower1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bellclimb, "room_dw_church_bellclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_shiftclimb, "room_dw_church_shiftclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_darkclimb, "room_dw_church_darkclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_tallbookcases_backup, "room_dw_church_tallbookcases_backup")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_bookshelfpuzzle, "room_dw_church_bookshelfpuzzle")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Second Sanctuary")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_church_b_intro, "room_dw_church_b_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_library_alternate, "room_dw_churchb_library_alternate")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_escherstaircase, "room_dw_churchb_escherstaircase")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_prophecymaze, "room_dw_churchb_prophecymaze")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_rotatingtower2, "room_dw_churchb_rotatingtower2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_prophecymaze_old, "room_dw_churchb_prophecymaze_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_rotatingtower_old, "room_dw_churchb_rotatingtower_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchb_rotatingtower_tiled, "room_dw_churchb_rotatingtower_tiled")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Third Sanctuary")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_ripplesneak_poc, "room_dw_churchc_ripplesneak_poc")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_prophecies_backup, "room_dw_churchc_prophecies_backup")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_titanclimb1_old, "room_dw_churchc_titanclimb1_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_titanclimb2_old, "room_dw_churchc_titanclimb2_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_titanclimb2_old2, "room_dw_churchc_titanclimb2_old2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_titanclimb1_tiled, "room_dw_churchc_titanclimb1_tiled")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_churchc_titanclimb2_tiled, "room_dw_churchc_titanclimb2_tiled")
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[room]", room_empty, "room_empty")
        scr_84_add_menu_item(parent, "[roomdark]", room_DARKempty, "room_DARKempty")
        scr_84_add_menu_item(parent, "[roomdark]", room_DARKbase_GMS2, "room_DARKbase_GMS2")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_clover, "room_cc_clover")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_rhythm_empty, "room_dw_rhythm_empty")
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
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Quick Plot Warps")
        scr_84_push(parent)
        parent = group
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Pre-Noelle's House")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 0, "Chapter Start")
        scr_84_add_menu_item(parent, "[warp]", 1, "Kris's House")
        scr_84_add_menu_item(parent, "[warp]", 2, "Church Entrance")
        scr_84_add_menu_item(parent, "[warp]", 3, "Attending Service")
        scr_84_add_menu_item(parent, "[warp]", 4, "Asking Around For Info About the Shelter")
        scr_84_add_menu_item(parent, "[warp]", 5, "Leaving the Church")
        scr_84_add_menu_item(parent, "[warp]", 6, "Hometown")
        scr_84_add_menu_item(parent, "[warp]", 7, "Diner Scene")
        scr_84_add_menu_item(parent, "[warp]", 8, "Entering Castle Town")
        scr_84_add_menu_item(parent, "[warp]", 9, "Castle Town")
        scr_84_add_menu_item(parent, "[warp]", 10, "Tea Party")
        scr_84_add_menu_item(parent, "[warp]", 11, "Ralsei's Room")
        scr_84_add_menu_item(parent, "[warp]", 12, "Meeting Noelle At Her Gate")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Noelle's House")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 13, "Outside Noelle's House")
        scr_84_add_menu_item(parent, "[warp]", 14, "Noelle's House")
        scr_84_add_menu_item(parent, "[warp]", 15, "Noelle's House (No Cutscene)")
        scr_84_add_menu_item(parent, "[warp]", 16, "Noelle's House (Post-Study Session)")
        scr_84_add_menu_item(parent, "[warp]", 17, "Dess's Room")
        scr_84_add_menu_item(parent, "[warp]", 18, "Kris Throws the Soul in a Box")
        scr_84_add_menu_item(parent, "[warp]", 19, "Kris on the Phone in the Kitchen")
        scr_84_add_menu_item(parent, "[warp]", 20, "Kris Playing the Piano")
        scr_84_add_menu_item(parent, "[warp]", 21, "Asgore in the Bathroom")
        scr_84_add_menu_item(parent, "[warp]", 22, "Asgore in Carol and Rudy's Room")
        scr_84_add_menu_item(parent, "[warp]", 23, "Noelle's Basement")
        scr_84_add_menu_item(parent, "[warp]", 24, "Noelle and Susie Discuss the \"Mouse\"")
        scr_84_add_menu_item(parent, "[warp]", 25, "Dess's Room as the Soul")
        scr_84_add_menu_item(parent, "[warp]", 26, "Noelle and Susie on the Couch Together")
        scr_84_add_menu_item(parent, "[warp]", 27, "Carol Appears")
        scr_84_add_menu_item(parent, "[warp]", 28, "Noelle's House Post-Carol")
        scr_84_add_menu_item(parent, "[warp]", 29, "Outside Noelle's House Again")
        scr_84_add_menu_item(parent, "[warp]", 30, "The Rain Starts")
        scr_84_add_menu_item(parent, "[warp]", 31, "Finding the Dark World")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Dark Sanctuary")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 32, "Dark Sanctuary Entrance")
        scr_84_add_menu_item(parent, "[warp]", 33, "Knight Encounter")
        scr_84_add_menu_item(parent, "[warp]", 34, "Ralsei Joins the Party")
        scr_84_add_menu_item(parent, "[warp]", 35, "Prophecy Save Point")
        scr_84_add_menu_item(parent, "[warp]", 36, "Lancer Prophecy")
        scr_84_add_menu_item(parent, "[warp]", 37, "Heroes Prophecy Broken")
        scr_84_add_menu_item(parent, "[warp]", 38, "Meeting Gerson")
        scr_84_add_menu_item(parent, "[warp]", 39, "Escorting Gerson Segment")
        scr_84_add_menu_item(parent, "[warp]", 40, "Helping Gerson Get the Green Book")
        scr_84_add_menu_item(parent, "[warp]", 41, "Gerson Breaks a Prophecy")
        scr_84_add_menu_item(parent, "[warp]", 42, "Gerson Leads the Way to His Study")
        scr_84_add_menu_item(parent, "[warp]", 43, "Gerson's Study")
        scr_84_add_menu_item(parent, "[warp]", 44, "Bookshelf Puzzle")
        scr_84_add_menu_item(parent, "[warp]", 45, "West Piano Puzzle Piece")
        scr_84_add_menu_item(parent, "[warp]", 46, "East Piano Puzzle Piece")
        scr_84_add_menu_item(parent, "[warp]", 47, "Piano Puzzle")
        scr_84_add_menu_item(parent, "[warp]", 48, "Jackenstein")
        scr_84_add_menu_item(parent, "[warp]", 49, "Gerson's Study (Post-Jackenstein)")
        scr_84_add_menu_item(parent, "[warp]", 50, "Organ Puzzle (No Solution)")
        scr_84_add_menu_item(parent, "[warp]", 51, "Outside the Organ Puzzle Solution Room")
        scr_84_add_menu_item(parent, "[warp]", 52, "Kris Plays the Organ")
        scr_84_add_menu_item(parent, "[warp]", 53, "Gerson Gets Susie to Memorize His Letter")
        scr_84_add_menu_item(parent, "[warp]", 63, "Climb to the Knight")
        scr_84_add_menu_item(parent, "[warp]", 64, "Sealing the Dark Sanctuary Fountain")
        scr_84_add_menu_item(parent, "[warp]", 65, "Back in the Church")
        scr_84_add_menu_item(parent, "[warp]", 66, "Susie Finds Gerson's Dust")
        scr_84_add_menu_item(parent, "[warp]", 67, "Susie Makes a Dark World")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Secret Boss Quest")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 54, "Golden Piano (No Notes)")
        scr_84_add_menu_item(parent, "[warp]", 55, "Room Behind the Waterfall")
        scr_84_add_menu_item(parent, "[warp]", 56, "Tea Scene")
        scr_84_add_menu_item(parent, "[warp]", 57, "Whispering Statues Room")
        scr_84_add_menu_item(parent, "[warp]", 58, "Miss Mizzle Battle")
        scr_84_add_menu_item(parent, "[warp]", 59, "Miss Mizzle Battle (Post Climb)")
        scr_84_add_menu_item(parent, "[warp]", 60, "Golden Piano (All Notes)")
        scr_84_add_menu_item(parent, "[warp]", 61, "Gerson Fight")
        scr_84_add_menu_item(parent, "[warp]", 62, "Gerson's Study (Post Battle)")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Second Sanctuary")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 68, "Second Sanctuary Fountain")
        scr_84_add_menu_item(parent, "[warp]", 69, "The Prince Prophecy")
        scr_84_add_menu_item(parent, "[warp]", 70, "The Cage Prophecy")
        scr_84_add_menu_item(parent, "[warp]", 71, "The Girl Prophecy")
        scr_84_add_menu_item(parent, "[warp]", 72, "Upside Down Save Point")
        scr_84_add_menu_item(parent, "[warp]", 73, "Love Finds its Way to the Girl Prophecy")
        scr_84_add_menu_item(parent, "[warp]", 74, "Glass Breaks, Susie and Kris Fall")
        scr_84_add_menu_item(parent, "[warp]", 75, "Gerson's Study")
        scr_84_add_menu_item(parent, "[warp]", 76, "Chasing After \"Gerson\"")
        scr_84_add_menu_item(parent, "[warp]", 77, "Sound of Justice Battle")
        scr_84_add_menu_item(parent, "[warp]", 78, "Ralsei Scene")
        scr_84_add_menu_item(parent, "[warp]", 79, "Sealing the Second Sanctuary Fountain")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Third Sanctuary")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 80, "Third Sanctuary Entrance")
        scr_84_add_menu_item(parent, "[warp]", 81, "The Fountain Calls to the Party")
        scr_84_add_menu_item(parent, "[warp]", 82, "Sliding Piano")
        scr_84_add_menu_item(parent, "[warp]", 83, "Pre-Jackenstein Room Save Point")
        scr_84_add_menu_item(parent, "[warp]", 84, "Glowing Soul Sequence")
        scr_84_add_menu_item(parent, "[warp]", 85, "Pre-Knight Confrontation Save Point")
        scr_84_add_menu_item(parent, "[warp]", 86, "First Titan Climb")
        scr_84_add_menu_item(parent, "[warp]", 87, "Titan Spawn Battle")
        scr_84_add_menu_item(parent, "[warp]", 88, "Second Titan Climb")
        scr_84_add_menu_item(parent, "[warp]", 89, "Titan Battle")
        scr_84_add_menu_item(parent, "[warp]", 90, "Sealing the Titan")
        scr_84_add_menu_item(parent, "[warp]", 91, "Final Prophecy")
        scr_84_add_menu_item(parent, "[warp]", 92, "Sealing the Third Sanctuary Fountain")
        scr_84_add_menu_item(parent, "[warp]", 93, "Back in the Church")
        scr_84_add_menu_item(parent, "[warp]", 94, "Walking Home With Susie")
        scr_84_add_menu_item(parent, "[warp]", 95, "Sans and Toriel Dancing")
        scr_84_add_menu_item(parent, "[warp]", 96, "Kris's Room")
        scr_84_add_menu_item(parent, "[warp]", 97, "Credits")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Weird Route")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 98, "Asking Around For Info About the Shelter")
        scr_84_add_menu_item(parent, "[warp]", 99, "Hometown")
        scr_84_add_menu_item(parent, "[warp]", 100, "Hospital")
        scr_84_add_menu_item(parent, "[warp]", 101, "Noelle's House")
        scr_84_add_menu_item(parent, "[warp]", 102, "Basement")
        scr_84_add_menu_item(parent, "[warp]", 103, "Noelle's Room")
        scr_84_add_menu_item(parent, "[warp]", 104, "Noelle's Room (Watch Taken in Chapter 2)")
        scr_84_add_menu_item(parent, "[warp]", 105, "Bathroom Scene")
        scr_84_add_menu_item(parent, "[warp]", 106, "Outside Noelle's House")
        scr_84_add_menu_item(parent, "[warp]", 107, "The Rain Starts")
        scr_84_add_menu_item(parent, "[warp]", 108, "Susie Asks What Kris and Noelle Were Doing")
        scr_84_add_menu_item(parent, "[warp]", 109, "Gerson Leads the Way to His Study")
        scr_84_add_menu_item(parent, "[warp]", 110, "Outside the Organ Puzzle Solution Room")
        scr_84_add_menu_item(parent, "[warp]", 111, "Tea Scene")
        scr_84_add_menu_item(parent, "[warp]", 112, "Final Prophecy")
        scr_84_add_menu_item(parent, "[warp]", 113, "Kris's Room")
        parent = scr_84_pop()
        
        parent = scr_84_pop()
        
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
                    for (i = 0; i < 13; i++)
                        global.item[i] = 0
                    for (i = 0; i < 7; i++)
                        scr_itemget(62)
                    scr_itemget(63)
                    for (i = 0; i < 2; i++)
                    scr_itemget(7)
                    scr_itemget(2)
                    scr_weaponget(26)
                    scr_weaponget(50)
                    scr_weaponget(53)
                    scr_weaponget(7)
                    scr_weaponget(54)
                    scr_weaponget(52)
                    scr_weaponget(21)
                    scr_weaponget(51)
                    for (i = 0; i < 2; i++)
                        scr_armorget(22)
                    scr_armorget(3)
                    scr_armorget(9)
                    scr_armorget(13)
                    scr_armorget(7)
                    scr_armorget(21)
                    scr_armorget(23)
                    for (i = 0; i < 2; i++)
                        scr_armorget(27)
                    for (i = 0; i < 6; i++)
                        scr_armorget(50)
                    scr_armorget(51)
                    scr_armorget(52)
                    scr_armorget(54)
                    scr_armorget(53)
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
                    global.maxhp[1] = 241
                    global.hp[1] = 241
                    global.at[1] = 19
                    global.df[1] = 2
                    global.mag[1] = 0
                    
                    // susie
                    global.maxhp[2] = 282
                    global.hp[2] = 282
                    global.at[2] = 24
                    global.df[2] = 2
                    global.mag[2] = 9
                    
                    // ralsei
                    global.maxhp[3] = 210
                    global.hp[3] = 210
                    global.at[3] = 17
                    global.df[3] = 2
                    global.mag[3] = 16
                    
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
                    scr_losechar()
                    
                    // disable rain
                    if choice_data < 31 || choice_data >= 98 && choice_data < 107
                        global.flag[794] = 0
                    
                    // set pre-jackenstein piano puzzle flags to post-completion state
                    if (choice_data > 47 && choice_data < 98) || (choice_data >= 110 && choice_data <= 113)
                    {
                        if choice_data > 48
                            global.flag[850] = 6
                        global.flag[891] = -1
                        global.flag[886] = -1
                    }
                    else if choice_data != 45 && choice_data != 46
                    {
                        global.flag[850] = 0
                        global.flag[891] = 0
                        global.flag[886] = 0
                    }
                    
                    // set if event should be in the dark world or not (just done here instead of in every defined warp for convenience)
                    if (choice_data > 0 && choice_data < 32) || (choice_data > 93 && choice_data < 109)
                        global.darkzone = 0
                    else
                        global.darkzone = 1
                    
                    // set if the player can climb
                    if (choice_data > 48 && choice_data < 98) || (choice_data >= 110 && choice_data <= 113)
                    {
                        global.flag[23] = 1
                        // give claimbclaws
                        if !scr_keyitemcheck(31)
                            scr_keyitemget(31)
                    }
                    else
                    {
                        global.flag[23] = 0
                        // remove claimbclaws
                        scr_keyitemremove(31)
                    }
                    
                    // set if you have the sheetmusic
                    if (choice_data > 52 && choice_data < 98) || choice_data == 112 || choice_data == 113
                    {
                        if !scr_keyitemcheck(30)
                            scr_keyitemget(30)
                    }
                    else
                        scr_keyitemremove(30)
                    
                    // set weird route active flags
                    if choice_data >= 98 && choice_data <= 113
                    {
                        global.flag[916] = 0
                        global.flag[915] = 20
                        if choice_data > 106
                            global.flag[1527] = 1 // finished noelle's house sequence on weird route
                            
                        // weird route events between noelle's house and the church
                        if choice_data < 107
                            global.flag[1528] = 0
                        else if choice_data > 107
                            global.flag[1528] = 2
                    }
                    
                    snd_free_all()
                    
                    switch choice_data
                    {
                        case 0: // chapter start
                            global.plot = 0
                            roomtogo = room_cc_fountain
                            break
                        
                        case 1: // kris's house (no cutscene)
                            scr_setparty(1, 0, 0)
                            global.plot = 15
                            roomtogo = room_torhouse
                            break
                            
                        case 2: // church entrance
                            scr_setparty(1, 0, 0)
                            global.plot = 20
                            roomtogo = room_lw_church_entrance
                            break
                            
                        case 3: // attending service
                            scr_setparty(1, 0, 0)
                            global.plot = 20
                            roomtogo = room_lw_church_main
                            break
                            
                        case 4: // asking around for info about the shelter
                            scr_setparty(0, 0, 0)
                            global.plot = 25
                            roomtogo = room_lw_church_main
                            break
                            
                        case 5: // hometown
                            scr_setparty(1, 0, 0)
                            global.plot = 30
                            global.interact = 3
                            global.entrance = 1
                            roomtogo = room_town_church
                            break
                            
                        case 6: // hometown (no cutscene)
                            scr_setparty(1, 0, 0)
                            global.plot = 40
                            global.interact = 3
                            global.entrance = 1
                            roomtogo = room_town_church
                            break
                        
                        case 7: // diner scene
                            scr_setparty(1, 0, 0)
                            if global.plot < 40 // if before noelle's house
                                global.plot = 40
                            else if global.plot >= 50 // if after entering noelle's house
                                global.plot = 45
                            global.flag[701] = 0
                            roomtogo = room_diner
                            break
                        
                        case 8: // entering castle town
                            scr_setparty(1, 0, 0)
                            
                            if global.plot < 40 // if before noelle's house
                                global.plot = 40
                            else if global.plot >= 50 && global.plot < 100 // if before you leave noelle's house
                                global.plot = 100
                            if global.plot > 100 // if after entering the church dark world (set to 40 cus i think most people go to castle town before noelle's house)
                                global.plot = 40
                            
                            roomtogo = room_dw_castle_town
                            break
                        
                        case 9: // castle town (no cutscene)
                            scr_setparty(1, 1, 0)
                            
                            if global.plot < 40 // if before noelle's house
                                global.plot = 40
                            else if global.plot >= 50 && global.plot < 100 // if before you leave noelle's house
                                global.plot = 100
                            if global.plot > 100 // if after entering the church dark world (set to 40 cus i think most people go to castle town before noelle's house)
                                global.plot = 40
                            global.flag[706] = 1
                            
                            roomtogo = room_dw_castle_town
                            break
                        
                        case 10: // tea party
                            scr_setparty(1, 1, 0)
                            global.flag[1516] = 1
                            
                            if global.plot < 40 // if before noelle's house
                                global.plot = 40
                            else if global.plot >= 50 && global.plot < 100 // if before you leave noelle's house
                                global.plot = 100
                            if global.plot > 100 // if after entering the church dark world (set to 40 cus i think most people go to castle town before noelle's house)
                                global.plot = 40
                            global.flag[706] = 1
                            
                            roomtogo = room_dw_castle_rooms_kris_susie
                            break
                                                    
                        case 11: // ralsei's room scene
                            scr_setparty(1, 1, 0)
                            
                            if global.plot < 40 // if before noelle's house
                                global.plot = 40
                            else if global.plot >= 50 && global.plot < 100 // if before you leave noelle's house
                                global.plot = 100
                            if global.plot > 100 // if after entering the church dark world (set to 40 cus i think most people go to castle town before noelle's house)
                                global.plot = 40
                            global.flag[706] = 1
                            
                            global.interact = 3
                            global.entrance = 4
                            roomtogo = room_dw_ralsei_castle_3f
                            break
                            
                        case 12: // meeting noelle at her gate
                            scr_setparty(1, 0, 0)
                            global.plot = 40
                            roomtogo = room_town_north
                            break
                            
                        case 13: // outside noelle's house
                            scr_setparty(1, 0, 0)
                            global.plot = 45
                            roomtogo = room_town_noellehouse
                            break
                            
                        case 14: // noelle's house
                            scr_setparty(1, 0, 1)
                            global.plot = 50
                            roomtogo = room_lw_noellehouse_main
                            break
                            
                        case 15: // noelle's house (no cutscene)
                            scr_setparty(1, 0, 1)
                            global.plot = 55
                            roomtogo = room_lw_noellehouse_main
                            break
                            
                        case 16: // noelle's house (post study session)
                            scr_setparty(0, 0, 0)
                            global.plot = 60
                            roomtogo = room_lw_noellehouse_main
                            break
                            
                        case 17: // dess's room
                            scr_setparty(0, 0, 0)
                            global.plot = 60
                            roomtogo = room_lw_noellehouse_dess
                            break
                            
                        case 18: // kris throws the soul in the box
                            scr_setparty(0, 0, 0)
                            global.plot = 61
                            roomtogo = room_lw_noellehouse_closet
                            break
                            
                        case 19: // kris on the phone in the kitchen
                            scr_setparty(0, 0, 0)
                            global.flag[736] = 0
                            global.flag[737] = 0
                            global.plot = 63
                            roomtogo = room_lw_noellehouse_kitchen
                            break
                            
                        case 20: // kris playing the piano
                            scr_setparty(0, 0, 0)
                            global.flag[737] = 2
                            global.plot = 63
                            roomtogo = room_lw_noellehouse_kitchen
                            break
                            
                        case 21: // asgore in the bathroom
                            scr_setparty(0, 0, 0)
                            global.flag[742] = 0
                            global.plot = 63
                            roomtogo = room_lw_noellehouse_bathroom
                            break
                            
                        case 22: // asgore in carol and rudy's room
                            scr_setparty(0, 0, 0)
                            global.flag[742] = 7
                            global.flag[1558] = 0
                            global.plot = 63
                            roomtogo = room_lw_noellehouse_north
                            break
                            
                        case 23: // noelle's basement
                            scr_setparty(0, 0, 0)
                            global.plot = 63
                            roomtogo = room_lw_noellehouse_basement
                            break
                            
                        case 24: // noelle and susie talk about what to do with the "mouse"
                            scr_setparty(0, 0, 0)
                            global.plot = 65
                            roomtogo = room_lw_noellehouse_main
                            break
                        
                        case 25: // dess's room as the soul
                            scr_setparty(0, 0, 0)
                            global.plot = 66
                            roomtogo = room_lw_noellehouse_dess
                            break
                            
                        case 26: // noelle and susie get really gay with each other
                            scr_setparty(0, 0, 0)
                            global.plot = 67
                            roomtogo = room_lw_noellehouse_main
                            break
                            
                        case 27: // carol appears
                            scr_setparty(0, 0, 0)
                            global.plot = 67
                            global.tempflag[90] = 1
                            roomtogo = room_lw_noellehouse_main
                            break
                            
                        case 28: // noelle's house post-carol
                            scr_setparty(0, 0, 0)
                            global.plot = 67
                            global.tempflag[90] = 2
                            roomtogo = room_lw_noellehouse_main
                            break
                            
                        case 29: // outside noelle's house after getting kicked out
                            scr_setparty(0, 0, 0)
                            global.plot = 90
                            roomtogo = room_town_noellehouse
                            break
                            
                        case 30: // the rain starts
                            scr_setparty(1, 0, 0)
                            global.plot = 95
                            roomtogo = room_town_north
                            break
                            
                        case 31: // entering the dark world
                            scr_setparty(1, 0, 0)
                            global.plot = 100
                            roomtogo = room_town_church
                            break
                            
                        case 32: // dark sanctuary entrance
                            scr_setparty(1, 0, 0)
                            global.plot = 105
                            roomtogo = room_dw_church_intro1
                            break
                            
                        case 33: // knight encounter
                            scr_setparty(1, 0, 0)
                            global.plot = 108
                            roomtogo = room_dw_church_staircase
                            break
                            
                        case 34: // ralsei joins the party
                            scr_setparty(1, 0, 0)
                            global.plot = 110
                            roomtogo = room_dw_church_glass
                            break
                            
                        case 35: // dark sanctuary prophecy save point
                            scr_setparty(1, 1, 0)
                            global.plot = 120
                            roomtogo = room_dw_church_savepoint
                            break
                            
                        case 36: // lancer prophecy
                            scr_setparty(1, 1, 0)
                            global.plot = 127
                            roomtogo = room_dw_church_shadowgerson
                            break
                            
                        case 37: // heroes prophecy is broken
                            scr_setparty(1, 1, 0)
                            global.plot = 128
                            roomtogo = room_dw_church_ripplepuzzle
                            break
                            
                        case 38: // meeting gerson
                            scr_setparty(1, 1, 0)
                            global.plot = 128
                            global.tempflag[90] = 7
                            roomtogo = room_dw_church_ripplepuzzle
                            break
                            
                        case 39: // with gerson segment
                            scr_setparty(1, 1, 0)
                            global.plot = 140
                            global.interact = 3
                            global.entrance = 5
                            roomtogo = room_dw_church_ripplepuzzle_postgers
                            break
                            
                        case 40: // helping gerson get the green book
                            scr_setparty(1, 1, 0)
                            global.plot = 141
                            roomtogo = room_dw_church_bookcase
                            break
                            
                        case 41: // gerson breaks a prophecy
                            scr_setparty(1, 1, 0)
                            global.plot = 145
                            roomtogo = room_dw_church_lantern_hallway
                            break
                        
                        case 42: // gerson leads the way to his study
                            scr_setparty(1, 1, 0)
                            global.plot = 150
                            roomtogo = room_dw_church_darkmaze
                            break
                        
                        case 43: // gerson's study
                            scr_setparty(1, 1, 0)
                            global.plot = 170
                            roomtogo = room_dw_church_gersonstudy
                            break
                            
                        case 44: // bookshelf puzzle
                            scr_setparty(1, 1, 0)
                            global.plot = 170
                            roomtogo = room_dw_church_bookshelfpuzzle_rev
                            break
                            
                        case 45: // west piano puzzle piece
                            scr_setparty(1, 1, 0)
                            global.plot = 170
                            if global.flag[886] == 1
                                global.flag[850] = 0.5 // cutscene progress
                            else
                                global.flag[850] = 0
                            global.flag[891] = 0 // left hint obtained
                            roomtogo = room_dw_church_pianopiece_left
                            break
                            
                        case 46: // east piano puzzle piece
                            scr_setparty(1, 1, 0)
                            global.plot = 170
                            if global.flag[891] == 1
                                global.flag[850] = 0.5 // cutscene progress
                            else
                                global.flag[850] = 0
                            global.flag[886] = 0 // right hint obtained
                            roomtogo = room_dw_church_pianopiece_right
                            break
                            
                        case 47: // piano puzzle
                            scr_setparty(1, 1, 0)
                            global.plot = 170
                            global.flag[850] = 1 // cutscene progress
                            global.flag[891] = 1 // left hint obtained
                            global.flag[886] = 1 // right hint obtained
                            global.interact = 3
                            global.entrance = 3
                            roomtogo = room_dw_church_pianopuzzle
                            break
                            
                        case 48: // jackenstein
                            scr_setparty(1, 1, 0)
                            global.plot = 170
                            global.interact = 3
                            global.entrance = 4
                            roomtogo = room_dw_church_jackenstein
                            break
                            
                        case 49: // gerson's study (post-jackenstein)
                            scr_setparty(1, 1, 0)
                            global.plot = 170
                            roomtogo = room_dw_church_gersonstudy
                            break
                            
                        case 50: // organ puzzle (no solution)
                            scr_setparty(1, 1, 0)
                            global.plot = 170
                            roomtogo = room_dw_church_organpuzzle
                            break
                            
                        case 51: // outside the organ puzzle solution room
                            scr_setparty(1, 1, 0)
                            if global.plot != 175
                                global.plot = 170
                            roomtogo = room_dw_church_bellhall_bookroom
                            break
                            
                        case 52: // kris plays the organ
                            scr_setparty(1, 1, 0)
                            global.plot = 180
                            global.interact = 3
                            global.entrance = 9
                            roomtogo = room_dw_church_organpuzzle
                            break
                            
                        case 53: // gerson gets susie to memorize his letter
                            scr_setparty(1, 1, 0)
                            global.plot = 185
                            global.interact = 3
                            global.entrance = 9
                            roomtogo = room_dw_church_gersonstudy
                            break
                            
                        case 54: // golden piano (no notes)
                            scr_setparty(1, 1, 0)
                            if global.plot < 170
                                global.plot = 170
                            else if global.plot > 190
                                global.plot = 190
                            global.flag[1519] = 0
                            global.flag[1503] = 0
                            global.flag[1502] = 0
                            global.flag[899] = 0
                            global.flag[851] = 0
                            global.flag[1571] = 0
                            global.flag[852] = 0 // defeated gerson
                            global.flag[1649] = 0 // got the shadow crystal
                            global.flag[1688] = 0 // has justice axe
                            global.flag[1569] = 0 // susie has betterheal
                            global.flag[1629] = 0 // fought gerson
                            
                            scr_weaponremove(52)
                            scr_keyitemremove(13)
                            if scr_weaponcheck_equipped(2, 52)
                                global.charweapon[2] = 54
                            roomtogo = room_dw_church_secretpiano
                            break
                            
                        case 55: // room behind the waterfall
                            scr_setparty(1, 1, 0)
                            if global.plot < 170
                                global.plot = 170
                            else if global.plot > 190
                                global.plot = 190
                            global.flag[1503] = 0
                            global.flag[1519] = 0
                            global.flag[851] = 0
                            global.flag[1571] = 0
                            global.flag[852] = 0 // defeated gerson
                            global.flag[1649] = 0 // got the shadow crystal
                            global.flag[1688] = 0 // has justice axe
                            global.flag[1569] = 0 // susie has betterheal
                            global.flag[1629] = 0 // fought gerson
                            
                            scr_weaponremove(52)
                            scr_keyitemremove(13)
                            if scr_weaponcheck_equipped(2, 52)
                                global.charweapon[2] = 54
                            roomtogo = room_dw_church_waterfallroom
                            break
                            
                        case 56: // tea scene
                            scr_setparty(1, 1, 0)
                            if global.plot < 170
                                global.plot = 170
                            else if global.plot > 190
                                global.plot = 190
                            global.flag[1503] = 0
                            global.flag[1519] = 0
                            global.flag[851] = 0
                            global.flag[1571] = 0
                            global.flag[852] = 0 // defeated gerson
                            global.flag[1649] = 0 // got the shadow crystal
                            global.flag[1688] = 0 // has justice axe
                            global.flag[1569] = 0 // susie has betterheal
                            global.flag[1629] = 0 // fought gerson
                            
                            scr_weaponremove(52)
                            scr_keyitemremove(13)
                            if scr_weaponcheck_equipped(2, 52)
                                global.charweapon[2] = 54
                            roomtogo = room_dw_church_waterfalltearoom
                            break
                            
                        case 57: // statue room
                            scr_setparty(1, 1, 0)
                            if global.plot < 170
                                global.plot = 170
                            else if global.plot > 190
                                global.plot = 190
                            global.flag[1502] = 0
                            global.flag[851] = 0
                            global.flag[1571] = 0
                            global.flag[852] = 0 // defeated gerson
                            global.flag[1649] = 0 // got the shadow crystal
                            global.flag[1688] = 0 // has justice axe
                            global.flag[1569] = 0 // susie has betterheal
                            global.flag[1629] = 0 // fought gerson
                            
                            scr_weaponremove(52)
                            scr_keyitemremove(13)
                            if scr_weaponcheck_equipped(2, 52)
                                global.charweapon[2] = 54
                            roomtogo = room_dw_church_rippleworship
                            break
                            
                        case 58: // miss mizzle battle
                            scr_setparty(1, 1, 0)
                            if global.plot < 170
                                global.plot = 170
                            else if global.plot > 190
                                global.plot = 190
                            global.interact = 7
                            global.entrance = 1
                            global.flag[899] = 0
                            global.flag[851] = 0
                            global.flag[1571] = 0
                            global.flag[852] = 0 // defeated gerson
                            global.flag[1649] = 0 // got the shadow crystal
                            global.flag[1688] = 0 // has justice axe
                            global.flag[1569] = 0 // susie has betterheal
                            global.flag[1629] = 0 // fought gerson
                            
                            scr_weaponremove(52)
                            scr_keyitemremove(13)
                            if scr_weaponcheck_equipped(2, 52)
                                global.charweapon[2] = 54
                            roomtogo = room_dw_church_holywatercooler
                            break
                            
                        case 59: // miss mizzle battle (post-climb)
                            scr_setparty(1, 1, 0)
                            if global.plot < 170
                                global.plot = 170
                            else if global.plot > 190
                                global.plot = 190
                            global.flag[899] = 0
                            global.flag[851] = 0
                            global.flag[1571] = 0
                            global.flag[852] = 0 // defeated gerson
                            global.flag[1649] = 0 // got the shadow crystal
                            global.flag[1688] = 0 // has justice axe
                            global.flag[1569] = 0 // susie has betterheal
                            global.flag[1629] = 0 // fought gerson
                            
                            scr_weaponremove(52)
                            scr_keyitemremove(13)
                            if scr_weaponcheck_equipped(2, 52)
                                global.charweapon[2] = 54
                            roomtogo = room_dw_church_holywatercooler
                            break
                            
                        case 60: // golden piano (all notes)
                            scr_setparty(1, 1, 0)
                            if global.plot < 170
                                global.plot = 170
                            else if global.plot > 190
                                global.plot = 190
                            if global.flag[1503] != 1
                                global.flag[1503] = 1
                            if global.flag[1519] != 1
                                global.flag[1519] = 1
                            if global.flag[1502] != 2
                                global.flag[1502] = 2
                            if abs(global.flag[899]) == 0
                                global.flag[899] = 2
                            global.flag[851] = 0
                            global.flag[1571] = 0
                            global.flag[852] = 0 // defeated gerson
                            global.flag[1649] = 0 // got the shadow crystal
                            global.flag[1688] = 0 // has justice axe
                            global.flag[1569] = 0 // susie has betterheal
                            global.flag[1629] = 0 // fought gerson
                            
                            scr_weaponremove(52)
                            scr_keyitemremove(13)
                            if scr_weaponcheck_equipped(2, 52)
                                global.charweapon[2] = 54
                            roomtogo = room_dw_church_secretpiano
                            break
                            
                        case 61: // gerson fight
                            scr_setparty(1, 1, 0)
                            if global.plot < 170
                                global.plot = 170
                            else if global.plot > 190
                                global.plot = 190
                            if global.flag[1503] != 1
                                global.flag[1503] = 1
                            if global.flag[1519] != 1
                                global.flag[1519] = 1
                            if global.flag[1502] != 2
                                global.flag[1502] = 2
                            if abs(global.flag[899]) == 0
                                global.flag[899] = 2
                            global.flag[851] = 1
                            global.flag[1571] = 1
                            global.flag[852] = 0 // defeated gerson
                            global.flag[1649] = 0 // got the shadow crystal
                            global.flag[1688] = 0 // has justice axe
                            global.flag[1569] = 0 // susie has betterheal
                            global.flag[1629] = 0 // fought gerson
                            
                            scr_weaponremove(52)
                            scr_keyitemremove(13)
                            if scr_weaponcheck_equipped(2, 52)
                                global.charweapon[2] = 54
                            roomtogo = room_dw_church_arena
                            break
                            
                        case 62: // gerson's study (post gerson battle)
                            scr_setparty(1, 1, 0)
                            if global.plot < 170
                                global.plot = 170
                            else if global.plot > 190
                                global.plot = 190
                            if global.flag[1503] != 1
                                global.flag[1503] = 1
                            if global.flag[1519] != 1
                                global.flag[1519] = 1
                            if global.flag[1502] != 2
                                global.flag[1502] = 2
                            if abs(global.flag[899]) == 0
                                global.flag[899] = 2
                            global.flag[851] = 3 // gerson cutscene progress
                            global.flag[1571] = 1 // solved piano puzzle
                            global.flag[852] = 1 // defeated gerson
                            global.flag[1649] = 1 // got the shadow crystal
                            global.flag[1688] = 1 // has justice axe
                            global.flag[1569] = 1 // susie has betterheal
                            global.flag[1629] = 1 // fought gerson
                            if !scr_weaponcheck_inventory(52) && !scr_weaponcheck_equipped(2, 52)
                                scr_weaponget(52)
                            if !scr_keyitemcheck(13)
                                scr_keyitemget(13)
                                
                            if global.mag[2] < 7
                                global.mag[2] += 4
                                
                            roomtogo = room_dw_church_gersonstudy
                            break
                            
                        case 63: // climb to the knight
                            scr_setparty(1, 1, 0)
                            global.plot = 190
                            roomtogo = room_dw_church_knightclimb
                            break
                            
                        case 64: // sealing the dark sanctuary fountain
                            scr_setparty(1, 1, 0)
                            global.plot = 195
                            global.flag[1566] = 1
                            global.interact = 3
                            global.entrance = 9
                            roomtogo = room_dw_church_staircase
                            break
                        
                        case 65: // back in the church
                            scr_setparty(1, 0, 0)
                            global.darkzone = 0
                            global.plot = 200
                            roomtogo = room_lw_church_entrance
                            break
                            
                        case 66: // susie finds gerson's dust
                            scr_setparty(1, 0, 0)
                            global.darkzone = 0
                            global.plot = 210
                            roomtogo = room_lw_church_office
                            break
                            
                        case 67: // susie makes a dark world
                            scr_setparty(1, 0, 0)
                            global.darkzone = 0
                            global.plot = 220
                            roomtogo = room_lw_church_entrance
                            break
                            
                        case 68: // second sanctuary fountain
                            scr_setparty(1, 0, 0)
                            global.plot = 225
                            roomtogo = room_dw_churchb_fountain
                            break
                            
                        case 69: // the prince prophecy
                            scr_setparty(1, 0, 0)
                            global.plot = 237
                            roomtogo = room_dw_churchb_library
                            break
                            
                        case 70: // the cage prophecy
                            scr_setparty(1, 0, 0)
                            global.plot = 238.10
                            global.tempflag[90] = 1
                            roomtogo = room_dw_churchb_libraryconnector
                            break
                            
                        case 71: // girl prophecy
                            scr_setparty(1, 0, 0)
                            global.plot = 238.20
                            global.tempflag[90] = 2
                            roomtogo = room_dw_churchb_libraryconnector
                            break
                            
                        case 72: // upside down save point
                            scr_setparty(1, 0, 0)
                            global.plot = 238.30
                            roomtogo = room_dw_churchb_savepoint
                            break
                            
                        case 73: // love finds its way to the girl prophecy
                            scr_setparty(1, 0, 0)
                            global.plot = 238.61
                            global.tempflag[90] = 0.1
                            roomtogo = room_dw_churchb_rotatingtower
                            break
                            
                        case 74: // glass breaks, susie and kris fall
                            scr_setparty(1, 0, 0)
                            global.plot = 238.65
                            roomtogo = room_dw_churchb_darkclimb_scene
                            break
                            
                        case 75: // gerson's study, second sanctuary
                            scr_setparty(1, 0, 0)
                            global.plot = 239
                            roomtogo = room_dw_churchb_gersonstudy
                            break
                            
                        case 76: // chasing after gerson
                            scr_setparty(1, 0, 0)
                            global.plot = 239.20
                            roomtogo = room_dw_churchb_gersonchase
                            break
                            
                        case 77: // sound of justice battle
                            scr_setparty(1, 0, 0)
                            global.plot = 239.20
                            roomtogo = room_dw_churchb_nongerson
                            break
                            
                        case 78: // ralsei scene
                            scr_setparty(1, 0, 0)
                            global.plot = 239.20
                            roomtogo = room_dw_churchb_nongerson_post
                            break
                            
                        case 79: // sealing the second sanctuary fountain
                            scr_setparty(1, 1, 0)
                            global.plot = 242.30
                            global.interact = 3
                            global.entrance = 7
                            roomtogo = room_dw_churchb_staircaseintro
                            break
                            
                        case 80: // third sanctuary entrance
                            scr_setparty(1, 1, 0)
                            global.plot = 243
                            roomtogo = room_dw_church_knightclimb_post
                            break
                            
                        case 81: // fountain calls to the party
                            scr_setparty(1, 1, 0)
                            global.plot = 243
                            roomtogo = room_dw_churchc_encounter1
                            break
                            
                        case 82: // sliding piano
                            scr_setparty(1, 1, 0)
                            global.plot = 244
                            roomtogo = room_dw_churchc_slidingpiano
                            break
                            
                        case 83: // pre-jackenstein room save point
                            scr_setparty(1, 1, 0)
                            global.plot = 244.90
                            roomtogo = room_dw_churchc_savepoint
                            break
                            
                        case 84: // glowing soul sequence
                            scr_setparty(1, 1, 0)
                            global.plot = 245
                            roomtogo = room_dw_churchc_darkswords
                            break
                            
                        case 85: // pre-knight confrontation save point
                            scr_setparty(1, 1, 0)
                            global.plot = 249
                            roomtogo = room_dw_churchc_prepretitan
                            break
                            
                        case 86: // first titan climb
                            scr_setparty(1, 1, 0)
                            global.plot = 250
                            roomtogo = room_dw_churchc_titanclimb1
                            break
                            
                        case 87: // titan spawn battle
                            scr_setparty(1, 1, 0)
                            global.plot = 250
                            roomtogo = room_dw_churchc_titanclimb1_post
                            break
                            
                        case 88: // second titan climb
                            scr_setparty(1, 1, 0)
                            global.plot = 250
                            roomtogo = room_dw_churchc_titanclimb2
                            break
                            
                        case 89: // titan battle
                            scr_setparty(1, 1, 0)
                            global.plot = 250
                            roomtogo = room_dw_churchc_titanclimb2_post
                            break
                            
                        case 90: // sealing the titan
                            scr_setparty(1, 1, 0)
                            global.plot = 259
                            roomtogo = room_dw_churchc_insidetitan
                            break
                            
                        case 91: // final prophecy
                            scr_setparty(0, 0, 0)
                            global.plot = 260
                            roomtogo = room_dw_churchc_final_prophecy
                            break
                            
                        case 92: // sealing the third sanctuary fountain
                            scr_setparty(0, 0, 0)
                            global.plot = 270
                            roomtogo = room_cc_fountain
                            break
                            
                        case 93: // back in the church
                            scr_setparty(0, 0, 0)
                            global.plot = 280
                            roomtogo = room_lw_church_main
                            break
                            
                        case 94: // walking home with susie
                            scr_setparty(0, 0, 0)
                            global.plot = 290
                            roomtogo = room_town_church
                            break
                            
                        case 95: // sans and toriel dancing
                            scr_setparty(1, 0, 0)
                            global.plot = 300
                            roomtogo = room_torhouse
                            break
                            
                        case 96: // kris's room
                            scr_setparty(0, 0, 0)
                            global.plot = 310
                            roomtogo = room_krisroom_dark
                            break
                            
                        case 97: // credits
                            scr_setparty(0, 0, 0)
                            global.plot = 320
                            roomtogo = room_ed
                            break
                            
                        case 98: // asking around for info about the shelter (weird route)
                            scr_setparty(0, 0, 0)
                            global.plot = 25
                            roomtogo = room_lw_church_main
                            break
                            
                        case 99: // hometown (no cutscene, weird route)
                            scr_setparty(1, 0, 0)
                            global.plot = 40
                            global.interact = 3
                            global.entrance = 1
                            roomtogo = room_town_church
                            break
                        
                        case 100: // hospital
                            scr_setparty(1, 0, 0)
                            global.plot = 40
                            global.interact = 3
                            global.entrance = 4
                            roomtogo = room_hospital_hallway
                            break
                        
                        case 101: // noelle's house (no cutscene, weird route)
                            scr_setparty(1, 0, 1)
                            global.plot = 55
                            roomtogo = room_lw_noellehouse_main
                            break
                        
                        case 102: // basement
                            scr_setparty(0, 0, 0)
                            global.plot = 63
                            roomtogo = room_lw_noellehouse_basement
                            break
                        
                        case 103: // noelle's room
                            scr_setparty(0, 0, 0)
                            global.plot = 63
                            roomtogo = room_lw_noellehouse_noelle
                            break
                        
                        case 104: // noelle's room (watch taken in chapter 2)
                            scr_setparty(0, 0, 0)
                            global.plot = 63
                            global.flag[708] = 1
                            roomtogo = room_lw_noellehouse_noelle
                            break
                        
                        case 105: // bathroom scene
                            scr_setparty(0, 0, 0)
                            global.plot = 90
                            roomtogo = room_lw_noellehouse_bathroom
                            break
                        
                        case 106: // outside noelle's house (weird route)
                            scr_setparty(0, 0, 0)
                            global.plot = 91
                            roomtogo = room_town_noellehouse
                            break
                            
                        case 107: // the rain starts (weird route)
                            scr_setparty(1, 0, 0)
                            global.plot = 95
                            roomtogo = room_town_north
                            break
                        
                        case 108: // susie asks what kris and noelle were doing
                            scr_setparty(1, 0, 0)
                            global.flag[1528] = 1
                            global.plot = 100
                            roomtogo = room_town_church
                            break
                        
                        case 109: // gerson leads the way to his study (weird route)
                            scr_setparty(1, 1, 0)
                            global.plot = 150
                            roomtogo = room_dw_church_darkmaze
                            break
                        
                        case 110: // outside the organ puzzle solution room (weird route)
                            scr_setparty(1, 1, 0)
                            if global.plot != 175
                                global.plot = 170
                            roomtogo = room_dw_church_bellhall_bookroom
                            break
                        
                        case 111: // tea cutscene (weird route)
                            scr_setparty(1, 1, 0)
                            if global.plot < 170
                                global.plot = 170
                            else if global.plot > 190
                                global.plot = 190
                            global.flag[1503] = 0
                            global.flag[1519] = 0
                            global.flag[851] = 0
                            global.flag[1571] = 0
                            global.flag[852] = 0 // defeated gerson
                            global.flag[1649] = 0 // got the shadow crystal
                            global.flag[1688] = 0 // has justice axe
                            global.flag[1569] = 0 // susie has betterheal
                            global.flag[1629] = 0 // fought gerson
                            
                            scr_weaponremove(52)
                            scr_keyitemremove(13)
                            if scr_weaponcheck_equipped(2, 52)
                                global.charweapon[2] = 54
                            roomtogo = room_dw_church_waterfalltearoom
                            break
                        
                        case 112: // final prophecy (weird route)
                            scr_setparty(0, 0, 0)
                            global.plot = 260
                            roomtogo = room_dw_churchc_final_prophecy
                            break
                            
                        case 113: // kris's room
                            scr_setparty(0, 0, 0)
                            global.darkzone = 0
                            global.plot = 310
                            roomtogo = room_krisroom_dark
                            break
                        
                        // template
                        case -1: // 
                            scr_setparty(1, 1, 0)
                            global.plot = 0
                            roomtogo = room
                            break
                    }
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
        
        // removed in favor of the chaper 1 fps counter, which is already in this chapter's code anyway
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
