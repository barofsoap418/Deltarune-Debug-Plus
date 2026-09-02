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
        scr_84_add_menu_item(parent, "[lightitem]", 11, "Glass")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Give Key Item")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[keyitem]", 1, "Cell Phone")
        scr_84_add_menu_item(parent, "[keyitem]", 2, "Egg")
        scr_84_add_menu_item(parent, "[keyitem]", 3, "BrokenCake")
        scr_84_add_menu_item(parent, "[keyitem]", 4, "Broken Key A")
        scr_84_add_menu_item(parent, "[keyitem]", 5, "Door Key")
        scr_84_add_menu_item(parent, "[keyitem]", 6, "Broken Key B")
        scr_84_add_menu_item(parent, "[keyitem]", 7, "Broken Key C")
        scr_84_add_menu_item(parent, "[keyitem]", 13, "ShadowCrystal")
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Give Weapon")
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
        scr_84_add_menu_item(parent, "[group]", group, "Give Armor")
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
        scr_84_add_menu_item(parent, "[group]", group, "??????")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dark1, "room_dark1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dark1a, "room_dark1a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dark2, "room_dark2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dark3, "room_dark3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dark3a, "room_dark3a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dark_wobbles, "room_dark_wobbles")
        scr_84_add_menu_item(parent, "[roomdark]", room_dark_eyepuzzle, "room_dark_eyepuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dark7, "room_dark7")
        scr_84_add_menu_item(parent, "[roomdark]", room_dark_chase1, "room_dark_chase1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dark_chase2, "room_dark_chase2")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Castle Town")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_castle_outskirts, "room_castle_outskirts")
        scr_84_add_menu_item(parent, "[roomdark]", room_castle_town, "room_castle_town")
        scr_84_add_menu_item(parent, "[roomdark]", room_castle_front, "room_castle_front")
        scr_84_add_menu_item(parent, "[roomdark]", room_castle_tutorial, "room_castle_tutorial")
        scr_84_add_menu_item(parent, "[roomdark]", room_castle_darkdoor, "room_castle_darkdoor")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Field")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_field_start, "room_field_start")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_forest, "room_field_forest")
        scr_84_add_menu_item(parent, "[roomdark]", room_field1, "room_field1")
        scr_84_add_menu_item(parent, "[roomdark]", room_field2, "room_field2")
        scr_84_add_menu_item(parent, "[roomdark]", room_field2A, "room_field2A")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_topchef, "room_field_topchef")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_puzzle1, "room_field_puzzle1")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_maze, "room_field_maze")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_puzzle2, "room_field_puzzle2")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_getsusie, "room_field_getsusie")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_shop1, "room_field_shop1")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_puzzletutorial, "room_field_puzzletutorial")
        scr_84_add_menu_item(parent, "[roomdark]", room_field3, "room_field3")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_boxpuzzle, "room_field_boxpuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_field4, "room_field4")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_secret1, "room_field_secret1")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Great Board")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_field_checkers4, "room_field_checkers4")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_checkers2, "room_field_checkers2")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_checkers6, "room_field_checkers6")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_checkers3, "room_field_checkers3")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_checkers1, "room_field_checkers1")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_checkers5, "room_field_checkers5")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_checkers7, "room_field_checkers7")
        scr_84_add_menu_item(parent, "[roomdark]", room_field_checkersboss, "room_field_checkersboss")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Block Forest")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_savepoint1, "room_forest_savepoint1")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_area0, "room_forest_area0")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_area1, "room_forest_area1")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_area2, "room_forest_area2")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_area2A, "room_forest_area2A")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_puzzle1, "room_forest_puzzle1")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_beforeclover, "room_forest_beforeclover")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_area3A, "room_forest_area3A")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_area3, "room_forest_area3")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_savepoint2, "room_forest_savepoint2")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_smith, "room_forest_smith")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_area4, "room_forest_area4")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_dancers1, "room_forest_dancers1")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_secret1, "room_forest_secret1")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_thrashmaker, "room_forest_thrashmaker")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_starwalker, "room_forest_starwalker")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_area5, "room_forest_area5")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_savepoint_relax, "room_forest_savepoint_relax")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_maze1, "room_forest_maze1")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_maze_deadend, "room_forest_maze_deadend")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_maze_susie, "room_forest_maze_susie")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_maze2, "room_forest_maze2")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_maze_deadend2, "room_forest_maze_deadend2")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_savepoint3, "room_forest_savepoint3")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_fightsusie, "room_forest_fightsusie")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_afterthrash2, "room_forest_afterthrash2")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_afterthrash3, "room_forest_afterthrash3")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_afterthrash4, "room_forest_afterthrash4")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_castleview, "room_forest_castleview")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_chase1, "room_forest_chase1")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_chase2, "room_forest_chase2")
        scr_84_add_menu_item(parent, "[roomdark]", room_forest_castlefront, "room_forest_castlefront")
        scr_84_add_menu_item(parent, "[roomdark]", room_man, "room_man")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Card Castle")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_prison_cells, "room_cc_prison_cells")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_prisonlancer, "room_cc_prisonlancer")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_prison_to_elevator, "room_cc_prison_to_elevator")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_prison2, "room_cc_prison2")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_prisonelevator, "room_cc_prisonelevator")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_elevator, "room_cc_elevator")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_prison_prejoker, "room_cc_prison_prejoker")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_joker, "room_cc_joker")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_entrance, "room_cc_entrance")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_1f, "room_cc_1f")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_rudinn, "room_cc_rudinn")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_2f, "room_cc_2f")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_rurus1, "room_cc_rurus1")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_3f, "room_cc_3f")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_hathy, "room_cc_hathy")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_4f, "room_cc_4f")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_rurus2, "room_cc_rurus2")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_clover, "room_cc_clover")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_5f, "room_cc_5f")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_lancer, "room_cc_lancer")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_6f, "room_cc_6f")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_throneroom, "room_cc_throneroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_preroof, "room_cc_preroof")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_kingbattle, "room_cc_kingbattle")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_prefountain, "room_cc_prefountain")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_fountain, "room_cc_fountain")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Special")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", PLACE_DOG, "PLACE_DOG")
        scr_84_add_menu_item(parent, "[room]", room_legend, "room_legend")
        scr_84_add_menu_item(parent, "[roomdark]", room_shop1, "room_shop1")
        scr_84_add_menu_item(parent, "[roomdark]", room_shop2, "room_shop2")
        scr_84_add_menu_item(parent, "[roomdark]", room_gameover, "room_gameover")
        scr_84_add_menu_item(parent, "[room]", room_myroom_dark, "room_myroom_dark")
        scr_84_add_menu_item(parent, "[room]", PLACE_LOGO, "PLACE_LOGO")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_FAILURE, "PLACE_FAILURE")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_MENU, "PLACE_MENU")
        scr_84_add_menu_item(parent, "[room]", room_ed, "room_ed")
        parent = scr_84_pop()
        scr_84_add_menu_item(parent, "[room]", room_empty, "room_empty")
        scr_84_add_menu_item(parent, "[roomdark]", room_DARKempty, "room_DARKempty")
        scr_84_add_menu_item(parent, "[room]", room_battletest, "room_battletest")
        scr_84_add_menu_item(parent, "[room]", room_title_placeholder, "room_title_placeholder")
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
        
        scr_84_add_menu_item(parent, "[idealall]", "", "Idealize Stats") // useless in chapter 1, keeping for funny text
        
        scr_84_add_menu_item(parent, "[setmember]", 0, "Set Party Member 1 (BROKEN)")
        scr_84_add_menu_item(parent, "[setmember]", 1, "Set Party Member 2")
        scr_84_add_menu_item(parent, "[setmember]", 2, "Set Party Member 3")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Quick Plot Warps")
        scr_84_push(parent)
        parent = group
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Pre-Dark World")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 0, "CONTACT")
        scr_84_add_menu_item(parent, "[warp]", 1, "Kris's Room")
        scr_84_add_menu_item(parent, "[warp]", 2, "School")
        scr_84_add_menu_item(parent, "[warp]", 3, "Encountering Susie")
        scr_84_add_menu_item(parent, "[warp]", 4, "Inside the Closet")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Dark World Introduction")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 5, "Waking Up in the Dark World")
        scr_84_add_menu_item(parent, "[warp]", 6, "Meeting Susie")
        scr_84_add_menu_item(parent, "[warp]", 7, "The Chase")
        scr_84_add_menu_item(parent, "[warp]", 8, "Castle Town")
        scr_84_add_menu_item(parent, "[warp]", 9, "Meeting Ralsei")
        scr_84_add_menu_item(parent, "[warp]", 10, "Castle Town (Post-Meeting Ralsei)")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Field")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 11, "Outside the Door")
        scr_84_add_menu_item(parent, "[warp]", 12, "Field of Hopes and Dreams")
        scr_84_add_menu_item(parent, "[warp]", 13, "Triple Hathy Fight")
        scr_84_add_menu_item(parent, "[warp]", 14, "Susie Joins the Party")
        scr_84_add_menu_item(parent, "[warp]", 15, "C. Round Encounter")
        scr_84_add_menu_item(parent, "[warp]", 16, "Seam's Seap")
        scr_84_add_menu_item(parent, "[warp]", 17, "Box Puzzle")
        scr_84_add_menu_item(parent, "[warp]", 18, "Great Board")
        scr_84_add_menu_item(parent, "[warp]", 19, "Choosing a Team Name")
        scr_84_add_menu_item(parent, "[warp]", 20, "K. Round Encounter")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Forest")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 21, "Block Forest Entrance")
        scr_84_add_menu_item(parent, "[warp]", 22, "Susie and Lancer Bad Guy Intro")
        scr_84_add_menu_item(parent, "[warp]", 23, "Clover Encounter")
        scr_84_add_menu_item(parent, "[warp]", 24, "Bake Sale")
        scr_84_add_menu_item(parent, "[warp]", 25, "Making the Thrash Machine")
        scr_84_add_menu_item(parent, "[warp]", 26, "Starwalker")
        scr_84_add_menu_item(parent, "[warp]", 27, "Maze")
        scr_84_add_menu_item(parent, "[warp]", 28, "Susie and Lancer Battle")
        scr_84_add_menu_item(parent, "[warp]", 29, "Post-Susie and Lancer Battle Walk")
        scr_84_add_menu_item(parent, "[warp]", 30, "Chase to Castle")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Card Castle")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 31, "In Prison")
        scr_84_add_menu_item(parent, "[warp]", 32, "Susie Attacks Lancer")
        scr_84_add_menu_item(parent, "[warp]", 33, "Susie Saves Kris and Ralsei")
        scr_84_add_menu_item(parent, "[warp]", 34, "Elevator Scene")
        scr_84_add_menu_item(parent, "[warp]", 35, "Card Castle")
        scr_84_add_menu_item(parent, "[warp]", 42, "Card Castle (Top Floor)")
        scr_84_add_menu_item(parent, "[warp]", 43, "Throne Room")
        scr_84_add_menu_item(parent, "[warp]", 44, "King Battle (No Enemies Hurt)")
        scr_84_add_menu_item(parent, "[warp]", 45, "King Battle (Enemies Hurt)")
        scr_84_add_menu_item(parent, "[warp]", 46, "Going Back to Talk to Everyone")
        scr_84_add_menu_item(parent, "[warp]", 47, "Ralsei Takes His Hat Off")
        scr_84_add_menu_item(parent, "[warp]", 48, "Sealing the Fountain")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Hometown")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 49, "Unused Classroom")
        scr_84_add_menu_item(parent, "[warp]", 50, "At the Closet Door")
        scr_84_add_menu_item(parent, "[warp]", 51, "Hometown")
        scr_84_add_menu_item(parent, "[warp]", 52, "Hospital Scene")
        scr_84_add_menu_item(parent, "[warp]", 53, "Flower Shop")
        scr_84_add_menu_item(parent, "[warp]", 54, "Bedroom Scene")
        scr_84_add_menu_item(parent, "[warp]", 55, "Credits")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Secret Boss Quest")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 36, "Jevil (No Key)")
        scr_84_add_menu_item(parent, "[warp]", 37, "Seam's Seap")
        scr_84_add_menu_item(parent, "[warp]", 38, "Broken Key C")
        scr_84_add_menu_item(parent, "[warp]", 39, "Broken Key B")
        scr_84_add_menu_item(parent, "[warp]", 40, "Malius")
        scr_84_add_menu_item(parent, "[warp]", 41, "Jevil (With Key)")
        parent = scr_84_pop()
        
        parent = scr_84_pop()
        
        global.chemg_menus = parent
    }
    if (process)
        return global.chemg_menu_depth > 0;
        
    // block input to other parts of the game (idk if this even works)
    //sunkus_kb_block()
    
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
                    scr_itemget(4)
                    for (i = 0; i < 2; i++)
                        scr_itemget(1)
                    for (i = 0; i < 4; i++)
                        scr_itemget(8)
                    scr_itemget(12)
                    scr_itemget(13)
                    scr_itemget(7)
                    for (i = 0; i < 2; i++)
                        scr_itemget(15)
                    scr_weaponget(5)
                    scr_weaponget(6)
                    scr_weaponget(7)
                    scr_weaponget(9)
                    scr_weaponget(10)
                    for (i = 0; i < 4; i++)
                        scr_armorget(1)
                    scr_armorget(2)
                    scr_armorget(4)
                    scr_armorget(5)
                    scr_armorget(7)
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
                    show_message("Idealized Stats...\n... or would've if stats could increase in this chapter.")
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
                        if (rnewmem < 0 || rnewmem > 3)
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
                    
                    global.darkzone = 1
                    
                    snd_free_all()
                    
                    // prevent thrash maker scene from playing
                    if choice_data > 25
                        global.flag[226] = 1
                        
                    if choice_data > 33
                        global.charauto[2] = 0
                        
                    if choice_data > 41
                    {
                        global.flag[217] = 1
                        global.flag[218] = 1
                    }
                    
                    // disable walking sound
                    global.flag[31] = 1
                    
                    switch choice_data
                    {
                        case 0: // CONTACT
                            global.plot = 0
                            global.darkzone = 0
                            roomtogo = PLACE_CONTACT
                            break
                        
                        case 1: // Kris's Room
                            global.plot = 0
                            global.darkzone = 0
                            roomtogo = room_krisroom
                            break
                            
                        case 2: // School
                            global.plot = 1
                            global.darkzone = 0
                            roomtogo = room_alphysclass
                            break
                            
                        case 3: // Encountering Susie
                            global.plot = 3
                            global.darkzone = 0
                            roomtogo = room_schoollobby
                            break
                            
                        case 4: // Inside the Closet
                            global.plot = 5
                            global.darkzone = 0
                            roomtogo = room_schooldoor
                            break
                            
                        case 5: // Waking Up in the Dark World
                            global.flag[31] = 0
                            global.plot = 10
                            roomtogo = room_dark1
                            break
                            
                        case 6: // Meeting Susie
                            global.flag[31] = 0
                            global.currentsong[0] = snd_init("creepylandscape.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.5, 0.95)
                            global.plot = 13
                            roomtogo = room_dark7
                            break
                        
                        case 7: // The Chase
                            global.flag[31] = 0
                            global.currentsong[0] = snd_init("creepylandscape.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.5, 0.95)
                            global.plot = 14
                            roomtogo = room_dark_chase1
                            break
                        
                        case 8: // Castle Town
                            global.flag[31] = 0
                            global.plot = 14
                            roomtogo = room_castle_outskirts
                            break
                        
                        case 9: // Meeting Ralsei
                            global.flag[31] = 0
                            global.plot = 16
                            global.entrance = 1
                            global.interact = 3
                            roomtogo = room_castle_front
                            break
                                                    
                        case 10: // Castle Town (Post-Meeting Ralsei)
                            scr_setparty(0, 1, 0)
                            global.flag[31] = 0
                            global.currentsong[0] = snd_init("castletown_empty.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            global.plot = 30
                            roomtogo = room_castle_front
                            break
                            
                        case 11: // Outside the Door
                            scr_setparty(0, 1, 0)
                            global.flag[31] = 0
                            global.plot = 32
                            roomtogo = room_field_start
                            break
                            
                        case 12: // Field of Hopes and Dreams
                            scr_setparty(0, 1, 0)
                            global.plot = 32
                            roomtogo = room_field1
                            break
                            
                        case 13: // Triple Hathy Fight
                            scr_setparty(0, 1, 0)
                            global.plot = 34
                            roomtogo = room_field_maze
                            break
                            
                        case 14: // Susie Joins the Party
                            scr_setparty(0, 1, 0)
                            global.plot = 36
                            roomtogo = room_field_getsusie
                            break
                            
                        case 15: // C. Round Encounter
                            scr_setparty(1, 1, 0)
                            global.plot = 37
                            roomtogo = room_field_getsusie
                            break
                            
                        case 16: // Seam's Seap
                            scr_setparty(1, 1, 0)
                            global.plot = 40
                            roomtogo = room_field_shop1
                            break
                            
                        case 17: // Box Puzzle
                            scr_setparty(1, 1, 0)
                            global.currentsong[0] = snd_init("field_of_hopes.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1)
                            global.plot = 45
                            roomtogo = room_field_boxpuzzle
                            break
                            
                        case 18: // Great Board
                            scr_setparty(1, 1, 0)
                            global.plot = 50
                            roomtogo = room_field_checkers4
                            break
                            
                        case 19: // Choosing a Team Name
                            scr_setparty(1, 1, 0)
                            global.plot = 50
                            roomtogo = room_field_checkers3
                            break
                            
                        case 20: // K. Round Encounter
                            scr_setparty(1, 1, 0)
                            global.plot = 55
                            roomtogo = room_field_checkersboss
                            break
                            
                        case 21: // Block Forest Entrance
                            scr_setparty(0, 1, 0)
                            global.plot = 60
                            roomtogo = room_forest_savepoint1
                            break
                            
                        case 22: // Susie and Lancer Bad Guy Intro
                            scr_setparty(0, 1, 0)
                            global.plot = 60
                            roomtogo = room_forest_area1
                            break
                            
                        case 23: // Clover Encounter
                            scr_setparty(0, 1, 0)
                            global.plot = 72
                            roomtogo = room_forest_area3
                            break
                        
                        case 24: // Bake Sale
                            scr_setparty(0, 1, 0)
                            global.plot = 75
                            roomtogo = room_forest_savepoint2
                            break
                            
                        case 25: // Making the Thrash Machine
                            scr_setparty(0, 1, 0)
                            global.currentsong[0] = snd_init("forest.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1)
                            global.plot = 80
                            roomtogo = room_forest_thrashmaker
                            break
                            
                        case 26: // Starwalker
                            scr_setparty(0, 1, 0)
                            global.plot = 80
                            roomtogo = room_forest_starwalker
                            break
                            
                        case 27: // Maze
                            scr_setparty(0, 1, 0)
                            global.currentsong[0] = snd_init("forest.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1)
                            global.plot = 85
                            roomtogo = room_forest_maze1
                            break
                            
                        case 28: // Susie and Lancer Battle
                            scr_setparty(0, 1, 0)
                            global.plot = 120
                            roomtogo = room_forest_fightsusie
                            break
                            
                        case 29: // Post-Susie and Lancer Battle Walk
                            scr_setparty(1, 1, 0)
                            global.plot = 130
                            roomtogo = room_forest_afterthrash2
                            break
                            
                        case 30: // Chase to Castle
                            scr_setparty(0, 0, 0)
                            global.currentsong[0] = snd_init("creepychase.ogg")
                            global.currentsong[1] = mus_loop(global.currentsong[0])
                            global.plot = 130
                            roomtogo = room_forest_chase1
                            break
                            
                        case 31: // In Prison
                            global.plot = 130
                            roomtogo = room_cc_prison_cells
                            break
                            
                        case 32: // Susie Attacks Lancer
                            scr_setparty(1, 0, 0)
                            global.plot = 152
                            roomtogo = room_cc_prisonlancer
                            break
                            
                        case 33: // Susie Saves Kris and Ralsei
                            scr_setparty(1, 0, 0)
                            global.plot = 154
                            roomtogo = room_cc_prison_cells
                            break
                            
                        case 34: // Elevator Scene
                            scr_setparty(1, 1, 0)
                            global.plot = 156
                            roomtogo = room_cc_elevator
                            break
                            
                        case 35: // Card Castle
                            scr_setparty(1, 1, 0)
                            global.plot = 165
                            roomtogo = room_cc_1f
                            break
                            
                        case 36: // Jevil (No Key)
                            scr_setparty(1, 1, 0)
                            global.flag[241] = 0
                            if scr_keyitemcheck(5)
                                scr_keyitemremove(5)
                            if global.plot < 165
                                global.plot = 165
                                
                            roomtogo = room_cc_prison_prejoker
                            break
                            
                        case 37: // Seam's Seap
                            scr_setparty(1, 1, 0)
                            global.flag[241] = 1
                            
                            if global.plot < 165
                                global.plot = 165
                                
                            roomtogo = room_shop1
                            break
                         
                        case 38: // Broken Key C
                            scr_setparty(1, 1, 0)
                            global.currentsong[0] = snd_init("field_of_hopes.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1)
                            global.flag[241] = 1
                            
                            if global.plot < 165
                                global.plot = 165
                                
                            roomtogo = room_field_secret1
                            break
                            
                        case 39: // Broken Key B
                            scr_setparty(1, 1, 0)
                            global.flag[241] = 1
                            global.interact = 3
                            global.entrance = 24
                            
                            if global.plot < 165
                                global.plot = 165
                                
                            roomtogo = room_forest_dancers1
                            break
                            
                        case 40: // Malius
                            scr_setparty(1, 1, 0)
                            global.currentsong[0] = snd_init("quiet_autumn.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1)
                            global.flag[241] = 1
                            
                            if global.plot < 165
                                global.plot = 165
                                
                            roomtogo = room_forest_smith
                            break
                            
                        case 41: // Jevil (With Key)
                            scr_setparty(1, 1, 0)
                            
                            global.flag[241] = 5
                            if !scr_keyitemcheck(5)
                                scr_keyitemget(5)
                            
                            global.plot = 165
                            roomtogo = room_cc_prison_prejoker
                            break
                            
                        case 42: // Card Castle (Top Floor)
                            scr_setparty(1, 1, 0)
                            global.plot = 165
                            roomtogo = room_cc_5f
                            break
                            
                        case 43: // Throne Room
                            scr_setparty(1, 1, 0)
                            global.plot = 175
                            roomtogo = room_cc_throneroom
                            break
                            
                        case 44: // King Battle (No Enemies Hurt)
                            scr_setparty(1, 1, 0)
                            global.flag[40] = 0
                            global.flag[43] = 0
                            global.plot = 175
                            roomtogo = room_cc_kingbattle
                            break
                            
                        case 45: // King Battle (Enemies Hurt)
                            scr_setparty(1, 1, 0)
                            
                            if global.flag[40] < 1
                                global.flag[40] = 1
                            if global.flag[43] < 2
                                global.flag[43] = 2
                            
                            global.plot = 175
                            roomtogo = room_cc_kingbattle
                            break
                        
                        case 46: // Going Back to Talk to Everyone
                            scr_setparty(1, 0, 0)
                            global.flag[248] = 0
                            global.plot = 240
                            roomtogo = room_cc_prefountain
                            break
                        
                        case 47: // Ralsei Takes His Hat Off
                            scr_setparty(1, 1, 0)
                            global.flag[248] = 0
                            global.plot = 243
                            roomtogo = room_cc_kingbattle
                            break
                            
                        case 48: // Sealing the Fountain
                            scr_setparty(1, 0, 0)
                            global.plot = 244
                            roomtogo = room_cc_fountain
                            break
                            
                        case 49: // Unused Classroom
                            global.darkzone = 0
                            global.plot = 244
                            roomtogo = room_school_unusedroom
                            break
                            
                        case 50: // At the Closet Door
                            global.darkzone = 0
                            global.interact = 3
                            global.entrance = 4
                            global.plot = 250
                            roomtogo = room_schooldoor
                            break
                            
                        case 51: // Hometown
                            global.plot = 251
                            roomtogo = room_schooldoor
                            break
                            
                        case 52: // Hospital Scene
                            global.darkzone = 0
                            global.currentsong[0] = snd_init("town.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.8, 0.97)
                            global.plot = 251
                            roomtogo = room_hospital_rudy
                            break
                            
                        case 53: // Flower Shop
                            global.darkzone = 0
                            global.currentsong[0] = snd_init("town.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.8, 0.97)
                            global.plot = 251
                            roomtogo = room_flowershop_1f
                            break
                            
                        case 54: // Bedroom Scene
                            global.darkzone = 0
                            global.plot = 251
                            roomtogo = room_myroom_dark
                            break
                            
                        case 55: // Credits
                            global.darkzone = 0
                            global.plot = 251
                            roomtogo = room_ed
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
        scr_84_draw_text_outline(10, yy, "====[ 8-4 Debug Menu ]====[ D$: " + string(global.gold) + " $: " + string(global.lgold) + " ]")
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
