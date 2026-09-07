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
        global.chemg_show_val = ini_read_real("AshleysDebug", "chemg_show_val", 1)
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
        global.chemg_show_interact_box = ini_read_real("AshleysDebug", "chemg_show_interact_box", 1)
        ossafe_ini_close()
        
        global.chemg_rebinding = false
        global.chemg_font_test = false
        
        var parent = ds_list_create()
        show_debug_message("init debug")
        var group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Money")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, {
            action: function()
            {
                var varname = get_string("Enter Amount", "")
                if varname != ""
                {
                    try
                        global.gold = ceil(varname)
                    catch(exc)
                    {
                        global.gold = 0
                        show_message("you tried to put letters in the number box and\nit blew up your wallet so you have no money\nnow good job kid hope you're happy")
                    }
                }
            }
        }, 0, "Set D$")
        scr_84_add_menu_item(parent, {
            action: function()
            {
                var varname = get_string("Enter Amount", "")
                if varname != ""
                {
                    try
                        global.lgold = ceil(varname)
                    catch(exc)
                    {
                        global.lgold = 0
                        show_message("you tried to put letters in the number box and\nit blew up your wallet so you have no money\nnow good job kid hope you're happy")
                    }
                }
            }
        }, 0, "Set $")
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
        
        // if you wanna add a custom item or smth use scr_84_add_menu_item(parent, "[item]", <id>, <itemname>)
        // you can also use scr_iteminfo(<id>) and then put "itemnameb" in place of the item's name to pull it straight from its item data
        // you can do both of the above with weapons and armors and stuff too by just using their scripts and variable names instead
        
        // all items between start and end are added automatically
        for (var i = global.chapter >= 4 ? 2 : 1; i <= 15; i ++)
        {
            scr_iteminfo(i) // get info for current item id
            scr_84_add_menu_item(parent, "[item]", i, itemnameb) // add it
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 2")
        scr_84_push(parent)
        parent = group
        
        for (var i = 16; i <= 33; i ++)
        {
            scr_iteminfo(i)
            scr_84_add_menu_item(parent, "[item]", i, itemnameb)
        }
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        
        // leaving this manual cus light world items do some weird shit for their names in scr_litemname
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Give Light Item")
        scr_84_push(parent)
        parent = group
        // chapter 1
        scr_84_add_menu_item(parent, "[lightitem]", 1, "Hot Chocolate")
        scr_84_add_menu_item(parent, "[lightitem]", 2, "Pencil")
        scr_84_add_menu_item(parent, "[lightitem]", 3, "Bandage")
        scr_84_add_menu_item(parent, "[lightitem]", 4, "Bouquet")
        scr_84_add_menu_item(parent, "[lightitem]", 5, "Ball of Junk")
        scr_84_add_menu_item(parent, "[lightitem]", 6, "Halloween Pencil")
        scr_84_add_menu_item(parent, "[lightitem]", 7, "Lucky Pencil")
        scr_84_add_menu_item(parent, "[lightitem]", 8, "Egg")
        
        // chapter 2
        scr_84_add_menu_item(parent, "[lightitem]", 9, "Cards")
        scr_84_add_menu_item(parent, "[lightitem]", 10, "Box of Heart Candy")
        scr_84_add_menu_item(parent, "[lightitem]", 11, "Glass") // this is also in chapter 1
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
        
        for (var i = 1; i <= 7; i ++)
        {
            scr_keyiteminfo(i)
            scr_84_add_menu_item(parent, "[keyitem]", i, tempkeyitemname)
        }
        if global.chapter == 1 // shadow crystal. should technically be in the chapter 1 key items always but it's easier to put it in chapter 2's from then onward lol
        {
            scr_keyiteminfo(13)
            scr_84_add_menu_item(parent, "[keyitem]", 13, tempkeyitemname)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 2")
        scr_84_push(parent)
        parent = group
        
        for (var i = 8; i <= 15; i ++)
        {
            scr_keyiteminfo(i)
            scr_84_add_menu_item(parent, "[keyitem]", i, tempkeyitemname)
        }
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
        
        for (var i = 1; i <= 10; i ++)
        {
            scr_weaponinfo(i)
            scr_84_add_menu_item(parent, "[weaponitem]", i, weaponnametemp)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 2")
        scr_84_push(parent)
        parent = group
        
        for (var i = 11; i <= 22; i ++)
        {
            scr_weaponinfo(i)
            scr_84_add_menu_item(parent, "[weaponitem]", i, weaponnametemp)
        }
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
        
        for (var i = 1; i <= 7; i ++)
        {
            scr_armorinfo(i)
            scr_84_add_menu_item(parent, "[armoritem]", i, armornametemp)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 2")
        scr_84_push(parent)
        parent = group
        
        for (var i = 8; i <= 22; i ++)
        {
            scr_armorinfo(i)
            scr_84_add_menu_item(parent, "[armoritem]", i, armornametemp)
        }
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, {
            action: function()
            {
                for (i = 0; i < 13; i++)
                    global.item[i] = 0
                repeat(2)
                    scr_itemget(16)
                repeat(6)
                    scr_itemget(24)
                scr_itemget(7)
                repeat(3)
                    scr_itemget(2)
                scr_weaponget(16)
                scr_weaponget(14)
                scr_weaponget(17)
                scr_weaponget(7)
                scr_weaponget(18)
                scr_weaponget(19)
                scr_weaponget(21)
                repeat(6)
                    scr_armorget(22)
                scr_armorget(2)
                scr_armorget(3)
                scr_armorget(5)
                scr_armorget(7)
                scr_armorget(21)
                show_message("Idealized Items/Gear")
            }
        }, 0, "Idealize Items/Gear")
        
        scr_84_add_menu_item(parent, {
            action: function()
            {
                for (i = 0; i < 13; i++)
                    global.item[i] = 0
                repeat(2)
                    scr_itemget(8)
                repeat(9)
                    scr_itemget(16)
                scr_itemget(23)
                scr_weaponget(16)
                scr_weaponget(7)
                scr_weaponget(17)
                scr_weaponget(18)
                scr_weaponget(19)
                scr_weaponget(22)
                scr_weaponget(13)
                repeat(6)
                    scr_armorget(8)
                scr_armorget(3)
                scr_armorget(5)
                show_message("Idealized Items/Gear for Weird Route")
            }
        }, 0, "Idealize Items/Gear (Side B)")
        
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Rooms")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, {
            action: function()
            {
                var newroom = get_string("Enter Room Name or ID (ex. room_castle_tutorial)", "")
                if (newroom != "")
                {
                    try
                    {
                        room_goto(real(newroom))
                    }
                    catch(exc)
                    {
                        if (room_exists(asset_get_index(newroom)))
                            room_goto(asset_get_index(newroom))
                        else if newroom != ""
                            show_message("Doesn't exist vro.")
                    }
                }
            }
        }, 0, "Go to Specific Room")
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
        scr_84_add_menu_item(parent, "[roomdark]", room_teacup_demoauto, "room_teacup_demoauto")
        scr_84_add_menu_item(parent, "[roomdark]", room_teacup_demobullets, "room_teacup_demobullets")
        scr_84_add_menu_item(parent, "[roomdark]", room_shaun_puzzle, "room_shaun_puzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_GMS2_test, "room_GMS2_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_cutscene_tester_b, "room_cutscene_tester_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_color, "room_debug_color")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_battle, "room_debug_battle")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_loc, "room_debug_loc")
        scr_84_add_menu_item(parent, "[roomdark]", room_musical_sync_test, "room_musical_sync_test")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_smallface_dark, "room_debug_smallface_dark")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_smallface, "room_debug_smallface")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_choicer_dark, "room_debug_choicer_dark")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_choicer_light, "room_debug_choicer_light")
        scr_84_add_menu_item(parent, "[roomdark]", room_debug_battleBalloon, "room_debug_battleBalloon")
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
        scr_84_add_menu_item(parent, "[roomdark]", room_castle_town, "room_castle_town")
        scr_84_add_menu_item(parent, "[roomdark]", room_castle_tutorial, "room_castle_tutorial")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_east_door, "room_dw_castle_east_door")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_west_cliff, "room_dw_castle_west_cliff")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_area_1, "room_dw_castle_area_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_area_2, "room_dw_castle_area_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_area_2_transformed, "room_dw_castle_area_2_transformed")
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
        scr_84_add_menu_item(parent, "[group]", group, "Cyber Field")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_intro_1, "room_dw_cyber_intro_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_intro_connector, "room_dw_cyber_intro_connector")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_intro_2, "room_dw_cyber_intro_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_rhythm_slide, "room_dw_cyber_rhythm_slide")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_savepoint, "room_dw_cyber_savepoint")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_battle_maze_1, "room_dw_cyber_battle_maze_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_music_bullet, "room_dw_cyber_music_bullet")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_tasque_battle, "room_dw_cyber_tasque_battle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_keyboard_puzzle_1, "room_dw_cyber_keyboard_puzzle_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_queen_boxing, "room_dw_cyber_queen_boxing")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_musical_door, "room_dw_cyber_musical_door")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_maze_virokun, "room_dw_cyber_maze_virokun")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_keyboard_puzzle_2, "room_dw_cyber_keyboard_puzzle_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_battle_maze_2, "room_dw_cyber_battle_maze_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_music_final, "room_dw_cyber_music_final")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_musical_shop, "room_dw_cyber_muscal_shop")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_teacup_final, "room_dw_cyber_teacup_final")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_rollercoaster, "room_dw_cyber_rollercoaster")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_maze_fireworks, "room_dw_cyber_maze_fireworks")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_maze_tasque, "room_dw_cyber_maze_tasque")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_maze_queenscreen, "room_dw_cyber_maze_queenscreen")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_viro_ring, "room_dw_cyber_viro_ring")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_post_music_boss_slide, "room_dw_cyber_post_music_boss_slide")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_keyboard_puzzle_3, "room_dw_cyber_keyboard_puzzle_3")
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Cyber City")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_spamton_shop_exterior, "room_dw_city_spamton_shop_exterior")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_spamton_house, "room_dw_city_spamton_house")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_intro, "room_dw_city_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_split, "room_dw_city_split")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_entrance, "room_dw_city_entrance")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_traffic_1, "room_dw_city_traffic_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_roadblock, "room_dw_city_roadblock")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_hacker, "room_dw_city_hacker")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_mice, "room_dw_city_mice")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_big_1, "room_dw_city_big_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_traffic_2, "room_dw_city_traffic_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_big_2, "room_dw_city_big_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_queen_drunk, "room_dw_city_queen_drunk")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_savepoint, "room_dw_city_savepoint")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_big_3, "room_dw_city_big_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_traffic_3, "room_dw_city_traffic_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_mice2, "room_dw_city_mice2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_cheesemaze, "room_dw_city_cheezemaze")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_mice3, "room_dw_city_mice3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_poppup, "room_dw_city_poppup")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_berdly, "room_dw_city_berdly")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_traffic_4, "room_dw_city_traffic_4")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_spamton_alley, "room_dw_city_spamton_alley")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_monologue, "room_dw_city_monologue")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_baseball, "room_dw_city_baseball")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_postbaseball_1, "room_dw_city_postbaseball_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_postbaseball_2, "room_dw_city_postbaseball_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_postbaseball_3, "room_dw_city_postbaseball_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_mansion_front, "room_dw_city_mansion_front")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_susie_ralsei_fun_1, "room_dw_city_susie_ralsei_fun_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_mirrorfriend, "room_dw_city_mirrorfriend")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_treasure, "room_dw_city_treasure")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_dog_traffic, "room_dw_city_dog_traffic")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_man, "room_dw_city_man")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_moss, "room_dw_city_moss")
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Queen's Mansion")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_krisroom, "room_dw_mansion_krisroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_susieroom, "room_dw_mansion_susieroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_lightner_hallway, "room_dw_mansion_lightner_hallway")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_darkbulb_1, "room_dw_mansion_darkbulb_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_darkbulb_2, "room_dw_mansion_darkbulb_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_darkbulb_3, "room_dw_mansion_darkbulb_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_dining_a, "room_dw_mansion_dining_a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_entrance, "room_dw_mansion_entrance")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_fire_paintings, "room_dw_mansion_fire_paintings")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_single_pot, "room_dw_mansion_single_pot")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_potBalance, "room_dw_mansion_potBalance")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_tasquePaintings, "room_dw_mansion_tasquePaintings")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_traffic, "room_dw_mansion_traffic")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_1f_e, "room_dw_mansion_east_1f_e")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_1f_secret, "room_dw_mansion_east_1f_secret")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_teacup, "room_dw_mansion_east_teacup")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_teacup_4, "room_dw_mansion_east_teacup_4")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_teacup_3, "room_dw_mansion_east_teacup_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_teacup_2, "room_dw_mansion_east_teacup_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_entrance, "room_dw_mansion_b_entrance")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_stairs, "room_dw_mansion_b_stairs")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_central, "room_dw_mansion_b_central")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_west_1f, "room_dw_mansion_b_west_1f")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_west_1f_a, "room_dw_mansion_b_west_1f_a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_west_1f_b, "room_dw_mansion_b_west_1f_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_west_2f, "room_dw_mansion_b_west_2f")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_east, "room_dw_mansion_b_east")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_east_a, "room_dw_mansion_b_east_a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_east_b, "room_dw_mansion_b_east_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_b_east_transformed, "room_dw_mansion_b_east_transformed")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_2f_a, "room_dw_mansion_east_2f_a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_2f_transformed_new, "room_dw_mansion_east_2f_transformed_new")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_2f_shortcut, "room_dw_mansion_east_2f_shortcut")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_kitchen, "room_dw_mansion_kitchen")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_2f_c, "room_dw_mansion_east_2f_c")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_2f_c_a, "room_dw_mansion_east_2f_c_a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_2f_d, "room_dw_mansion_east_2f_d")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_3f, "room_dw_mansion_east_3f")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_3f_projection, "room_dw_mansion_east_3f_projection")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_3f_toilet, "room_dw_mansion_east_3f_toilet")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_acid_tunnel, "room_dw_mansion_acid_tunnel")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_acid_tunnel_puzzle_entrance, "room_dw_mansion_acid_tunnel_puzzle_entrance")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_acid_tunnel_loop_rouxls, "room_dw_mansion_acid_tunnel_loop_rouxls")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_acid_tunnel_exit, "room_dw_mansion_acid_tunnel_exit")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_4f_b, "room_dw_mansion_east_4f_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_4f_c, "room_dw_mansion_east_4f_c")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_4f_d, "room_dw_mansion_east_4f_d")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_top, "room_dw_mansion_top")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_top_post, "room_dw_mansion_top_post")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_prefountain, "room_dw_mansion_prefountain")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_fountain, "room_dw_mansion_fountain")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_ferris_wheel, "room_dw_mansion_ferris_wheel")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_ferris_wheel_post, "room_dw_mansion_ferris_wheel_post")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_noelle_room, "room_dw_mansion_noelle_room")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_bridges, "room_dw_mansion_bridges")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_bridges_funny, "room_dw_mansion_bridges_funny")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_mouseLottery, "room_dw_mansion_mouseLottery")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_hands, "room_dw_mansion_hands")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_dining3, "room_dw_mansion_dining3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_dininghall, "room_dw_mansion_dininghall")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_dining_storage, "room_dw_mansion_dining_storage")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_fountain, "room_cc_fountain")
        scr_84_add_menu_item(parent, "[roomdark]", room_transformation_sequence, "room_transformation_sequence")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_gigaqueen, "room_dw_mansion_gigaqueen")
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Special")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_intro_ch2, "room_intro_ch2")
        scr_84_add_menu_item(parent, "[room]", PLACE_DOG, "PLACE_DOG")
        scr_84_add_menu_item(parent, "[room]", room_legend, "room_legend")
        scr_84_add_menu_item(parent, "[roomdark]", room_legend_neo, "room_legend_neo")
        scr_84_add_menu_item(parent, "[roomdark]", room_shop1, "room_shop1")
        scr_84_add_menu_item(parent, "[roomdark]", room_shop_ch2_music, "room_shop_ch2_music")
        scr_84_add_menu_item(parent, "[roomdark]", room_shop_ch2_swatch, "room_shop_ch2_swatch")
        scr_84_add_menu_item(parent, "[roomdark]", room_shop_ch2_spamton, "room_shop_ch2_spamton")
        scr_84_add_menu_item(parent, "[roomdark]", room_gameover, "room_gameover")
        scr_84_add_menu_item(parent, "[room]", PLACE_LOGO, "PLACE_LOGO")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_FAILURE, "PLACE_FAILURE")
        scr_84_add_menu_item(parent, "[roomdark]", PLACE_NAMING_JIKKEN, "PLACE_NAMING_JIKKEN")
        scr_84_add_menu_item(parent, "[room]", PLACE_MENU, "PLACE_MENU")
        scr_84_add_menu_item(parent, "[room]", room_ed, "room_ed")
        scr_84_add_menu_item(parent, "[room]", PLACE_DOGCHECK2, "PLACE_DOGCHECK2")
        scr_84_add_menu_item(parent, "[room]", room_chapter_continue, "room_chapter_continue")
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Unused")
        scr_84_push(parent)
        parent = group
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Castle Town")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_west_cliff_old, "room_dw_castle_west_cliff_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_rooms_hallway, "room_dw_castle_rooms_hallway")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_rooms_lancer, "room_dw_castle_rooms_lancer")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Cyber Field")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_battle_maze_3, "room_dw_cyber_battle_maze_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_teacup_2, "room_dw_cyber_teacup_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_teacup_demobullets, "room_teacup_demobullets")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_shaunsmusicalbullettunnel, "room_dw_cyber_shaunsmusicalbullettunnel")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_maze_rhythm, "room_dw_cyber_maze_rhythm")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_escalator_slide, "room_dw_cyber_escalator_slide")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_nuberts_treasure, "room_dw_cyber_nuberts_treasure")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_music_fight, "room_dw_cyber_music_fight")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_keyboardexample, "room_dw_cyber_keyboardexample")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_battle_maze_2_old, "room_dw_cyber_battle_maze_2_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_keyboard_puzzle_1_old, "room_dw_cyber_keyboard_puzzle_1_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_tasque_battle_og, "room_dw_cyber_tasque_battle_og")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_savepoint_original, "room_dw_cyber_savepoint_original")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_battle_maze_1_Original, "room_dw_cyber_battle_maze_1_Original")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_music_bullet_original, "room_dw_cyber_music_bullet_original")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_maze_virokun_backuo, "room_dw_cyber_maze_virokun_backuo")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_battle_maze_2_toby, "room_dw_cyber_battle_maze_2_toby")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_virovirokun_fight, "room_dw_cyber_virovirokun_fight")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_teacup_1, "room_dw_cyber_teacup_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cyber_viromaze2, "room_dw_cyber_viromaze2")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Cyber City")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_prototype_01, "room_dw_city_prototype_01")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_prototype_02, "room_dw_city_prototype_02")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_big_3_backup_2exits, "room_dw_city_big_3_backup_2exits")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_traffic_3_2Entrances, "room_dw_city_traffic_3_2Entrances")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_cheese, "room_dw_city_cheese")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_carnival, "room_dw_city_carnival")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_noelle_fight_intro, "room_dw_city_noelle_fight_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_spamton_shop_interior, "room_dw_city_spamton_shop_interior")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_monologue_old, "room_dw_city_monologue_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_big_1_original, "room_dw_city_big_1_original")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_traffic_2_old, "room_dw_city_traffic_2_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_big_2_OG, "room_dw_city_big_2_OG")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_mice2_og, "room_dw_city_mice2_og")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_traffic_5_old, "room_dw_city_traffic_5_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_traffic_3_backup, "room_dw_city_traffic_3_backup")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_big_3_og, "room_dw_city_big_3_og")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_city_sidewayscars, "room_dw_city_sidewayscars")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Queen's Mansion")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_1f_b, "room_dw_mansion_east_1f_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_2f_c_b, "room_dw_mansion_east_2f_c_b")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_traffic_original, "room_dw_mansion_traffic_original")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_1f_a, "room_dw_mansion_east_1f_a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_2f_teacup, "room_dw_mansion_east_2f_teacup")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_4f_e, "room_dw_mansion_east_4f_e")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_4f_a, "room_dw_mansion_east_4f_a")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_2f_ufo_old, "room_dw_mansion_east_2f_ufo_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_1f_d, "room_dw_mansion_east_1f_d")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_1f_c, "room_dw_mansion_east_1f_c")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_sparks, "room_dw_mansion_sparks")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_acid_tunnel_old, "room_dw_mansion_acid_tunnel_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_top_post_old, "room_dw_mansion_top_post_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_elevator, "room_dw_mansion_elevator")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_teacup_4_old, "room_dw_mansion_east_teacup_4_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_east_2f_d_backup, "room_dw_mansion_east_2f_d_backup")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_dining_storage_old, "room_dw_mansion_dining_storage_old")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_mansion_bridgesold, "room_dw_mansion_bridgesold")
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
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_show_interact_box", "Show Interaction Box")
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_show_val", "Show Misc Values")
        parent = scr_84_pop()
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
        
        scr_84_add_menu_item(parent, {
            action: function()
            {
                show_debug_message("restart room")
                room_restart()
                global.chemg_menu_depth = 0
            }
        }, "", "Restart Room")
        scr_84_add_menu_item(parent, {
            action: function()
            {
                var type = scr_84_lang_load()
                show_debug_message("loaded " + type + " lang file")
                show_message("loaded " + type + " lang file")
                global.chemg_menu_depth = 0
            }
        }, "", "Reload Japanese")
        scr_84_add_menu_item(parent, "[lang]", "ja", "Use Japanese")
        scr_84_add_menu_item(parent, "[lang]", "en", "Use English")
        scr_84_add_menu_item(parent, {
            action: function()
            {
                scr_phoneadd(202)
            }
        }, "", "Give Sans's Number")
        scr_84_add_menu_item(parent, {
            action: function()
            {
                global.chemg_font_test = !global.chemg_font_test
                global.chemg_menu_depth = 0
            }
        }, "", "Font Test")
        
        // Just call snd_free_all directly
        scr_84_add_menu_item(parent, {action: snd_free_all}, "", "Stop All Music");
        scr_84_add_menu_item(parent, {action: function() 
        {
            show_message("8-4 Ltd: Original Menu from Chapter 1.\nTenna Save Editor: Flag list.\nbarofsoap418: Restored the menu in all chapters and updated most things for them/added most new features.\nVRadExe: Chapter 5 Room list, figured out Chapter 3+ handler system and how to add extra text onto menu entries, several new features.\nZender Troop: Documented most global.plot changes in Chapters 4 and 5 for the Plot Warp menu.\nFafuhnir: literally nothing but i wanna shout him out hi leon :wave:")
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
        
        for (var i = 5; i <= 23; i ++)
        {
            scr_recruit_info(i)
            if !string_starts_with(_name, "Known Quantity ") // don't add recruits with no data
                scr_84_add_menu_item(parent, "[flagset]", 600 + i, _name)
        }
        
        scr_84_add_menu_item(parent, "[recruitall]", 1, "Recruit All")
        scr_84_add_menu_item(parent, "[recruitremove]", 1, "Remove All")
        scr_84_add_menu_item(parent, "[recruitlose]", 1, "LOSE All")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 2")
        scr_84_push(parent)
        parent = group
        
        for (var i = 30; i <= 44; i ++)
        {
            scr_recruit_info(i)
            if !string_starts_with(_name, "Known Quantity ") // don't add recruits with no data
                scr_84_add_menu_item(parent, "[flagset]", 600 + i, _name)
        }
        
        scr_84_add_menu_item(parent, "[recruitall]", 2, "Recruit All")
        scr_84_add_menu_item(parent, "[recruitremove]", 2, "Remove All")
        scr_84_add_menu_item(parent, "[recruitlose]", 2, "LOSE All")
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
            
            var _str = concat("Enter the variable's new value as a ", type, " (currently: ", variable_global_get(_globalvar), ")")
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
        scr_84_add_menu_item(parent, "[group]", group, "Party/Stat Editor")
        scr_84_push(parent)
        parent = group
        // it's just the same thing each time so i made this into one array
        for (var i = 1; i < 5; i ++)
        {
            group = ds_list_create()
            scr_84_add_menu_item(parent, "[group]", group, global.charname[i])
            scr_84_push(parent)
            parent = group
            
            scr_84_add_menu_item(parent, "[hp]", i, "HP")
            scr_84_add_menu_item(parent, "[hpmax]", i, "Max Hp")
            scr_84_add_menu_item(parent, "[attack]", i, "Attack")
            scr_84_add_menu_item(parent, "[defense]", i, "Defense")
            scr_84_add_menu_item(parent, "[magic]", i, "Magic")
            
            scr_84_add_menu_item(parent, "[weapon]", i, "Weapon")
            scr_84_add_menu_item(parent, "[armor1]", i, "Armor 1")
            scr_84_add_menu_item(parent, "[armor2]", i, "Armor 2")
            
            group = ds_list_create()
            scr_84_add_menu_item(parent, "[group]", group, "Spells")
            scr_84_push(parent)
            parent = group
            for (var j = 0; j < 12; j ++)
                scr_84_add_menu_item(parent, "[spell]", i, concat((j < 10 ? 0 : ""), j, " : ", "Empty"))
            parent = scr_84_pop()
            parent = scr_84_pop()
        }
        
        scr_84_add_menu_item(parent, {
            action: function()
            {
                // kris
                global.maxhp[1] = 160
                global.hp[1] = 160
                global.at[1] = 14
                global.df[1] = 2
                global.mag[1] = 0
                
                // susie
                global.maxhp[2] = 190
                global.hp[2] = 190
                global.at[2] = 18
                global.df[2] = 2
                global.mag[2] = 3
                
                // ralsei
                global.maxhp[3] = 140
                global.hp[3] = 140
                global.at[3] = 12
                global.df[3] = 2
                global.mag[3] = 11
                
                // noelle
                global.maxhp[4] = 166
                global.hp[4] = 166
                global.at[4] = 8
                global.df[4] = 1
                global.mag[4] = 16
                show_message("Idealized Stats")
            }
        }, "", "Idealize Stats")
        
        for (var i = 0; i < 3; i ++)
        {
            scr_84_add_menu_item(parent, "[setmember]", i, concat("Party Member ", (i + 1)))
        }
        parent = scr_84_pop()
        
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Quick Plot Warps");
        scr_84_push(parent);
        parent = group;
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Pre-Cyber World");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 0, "Chapter Start")
        scr_84_add_menu_item(parent, "[warp]", 1, "Classroom")
        scr_84_add_menu_item(parent, "[warp]", 2, "Going to Closet Dark World")
        scr_84_add_menu_item(parent, "[warp]", 3, "Castle Town")
        scr_84_add_menu_item(parent, "[warp]", 4, "Transformed Castle Town")
        scr_84_add_menu_item(parent, "[warp]", 5, "Transformed Castle Town (No Cutscene)")
        scr_84_add_menu_item(parent, "[warp]", 6, "Transformed Castle Town (Post-Seeing Rooms)")
        scr_84_add_menu_item(parent, "[warp]", 7, "Back to the Light World")
        scr_84_add_menu_item(parent, "[warp]", 8, "Library")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Cyber Field");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 9, "Dark World Entrance")
        scr_84_add_menu_item(parent, "[warp]", 10, "Meeting Queen")
        scr_84_add_menu_item(parent, "[warp]", 11, "Musical Slide")
        scr_84_add_menu_item(parent, "[warp]", 12, "Punch Out")
        scr_84_add_menu_item(parent, "[warp]", 13, "Cyber Field Midpoint")
        scr_84_add_menu_item(parent, "[warp]", 14, "Sweet Cap'n Cakes Battle")
        scr_84_add_menu_item(parent, "[warp]", 15, "Music Shop")
        scr_84_add_menu_item(parent, "[warp]", 16, "Berdly Battle")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Cyber City");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 17, "Trash Pile")
        scr_84_add_menu_item(parent, "[warp]", 18, "Susie and Ralsei Leave")
        scr_84_add_menu_item(parent, "[warp]", 19, "Cyber City Entrance")
        scr_84_add_menu_item(parent, "[warp]", 20, "Meeting Up with Noelle")
        scr_84_add_menu_item(parent, "[warp]", 21, "Meeting Up with Noelle (No Cutscene)")
        scr_84_add_menu_item(parent, "[warp]", 22, "Drunk Queen")
        scr_84_add_menu_item(parent, "[warp]", 23, "Sweet Cap'n Cakes Save Point")
        scr_84_add_menu_item(parent, "[warp]", 24, "Mice Room 3")
        scr_84_add_menu_item(parent, "[warp]", 25, "Berdly Battle")
        scr_84_add_menu_item(parent, "[warp]", 26, "Driving with Queen")
        scr_84_add_menu_item(parent, "[warp]", 27, "Spamton Battle")
        scr_84_add_menu_item(parent, "[warp]", 28, "Driving with Queen TWO!!!")
        scr_84_add_menu_item(parent, "[warp]", 29, "Noelle's Monologue")
        scr_84_add_menu_item(parent, "[warp]", 30, "Susie and Ralsei Rejoin")
        scr_84_add_menu_item(parent, "[warp]", 31, "Post-Susie and Ralsei Rejoining")
        scr_84_add_menu_item(parent, "[warp]", 32, "Outside the Mansion Scene")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Mansion");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 33, "Kris's Room")
        scr_84_add_menu_item(parent, "[warp]", 34, "Lancer Getting Sick")
        scr_84_add_menu_item(parent, "[warp]", 35, "Light Puzzle 3")
        scr_84_add_menu_item(parent, "[warp]", 36, "Lancer Petrifies")
        scr_84_add_menu_item(parent, "[warp]", 37, "Entrance")
        scr_84_add_menu_item(parent, "[warp]", 38, "Tasque Manager Room")
        scr_84_add_menu_item(parent, "[warp]", 47, "Mauswheel Battle")
        scr_84_add_menu_item(parent, "[warp]", 48, "Meeting Up with Berdly")
        scr_84_add_menu_item(parent, "[warp]", 49, "Acid Tunnel of Love")
        scr_84_add_menu_item(parent, "[warp]", 50, "Rouxls Battle")
        scr_84_add_menu_item(parent, "[warp]", 51, "Post-Tunnel Scene")
        scr_84_add_menu_item(parent, "[warp]", 52, "Post-Ferris Wheel Scene")
        scr_84_add_menu_item(parent, "[warp]", 53, "Werewerewire Battle")
        scr_84_add_menu_item(parent, "[warp]", 54, "Queen Battle")
        scr_84_add_menu_item(parent, "[warp]", 55, "Giga Queen Battle")
        scr_84_add_menu_item(parent, "[warp]", 56, "Post-Giga Queen Battle")
        scr_84_add_menu_item(parent, "[warp]", 57, "Sealing the Fountain")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Hometown");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 58, "Computer Lab")
        scr_84_add_menu_item(parent, "[warp]", 59, "Susie Joining Outside the Computer Lab")
        scr_84_add_menu_item(parent, "[warp]", 60, "Hometown")
        scr_84_add_menu_item(parent, "[warp]", 61, "Back to Castle Town")
        scr_84_add_menu_item(parent, "[warp]", 62, "Castle Town")
        scr_84_add_menu_item(parent, "[warp]", 63, "Hospital Scene")
        scr_84_add_menu_item(parent, "[warp]", 64, "Kris's House")
        scr_84_add_menu_item(parent, "[warp]", 65, "Bathroom Scene")
        scr_84_add_menu_item(parent, "[warp]", 66, "Final Scene")
        scr_84_add_menu_item(parent, "[warp]", 67, "Credits")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Secret Boss Quest");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 39, "Mansion Secret Room Entrance")
        scr_84_add_menu_item(parent, "[warp]", 40, "Spamton's Shop")
        scr_84_add_menu_item(parent, "[warp]", 41, "Queen's Basement")
        scr_84_add_menu_item(parent, "[warp]", 42, "EmptyDisk Room")
        scr_84_add_menu_item(parent, "[warp]", 43, "EmptyDisk Room (with LoadedDisk)")
        scr_84_add_menu_item(parent, "[warp]", 44, "Spamton Neo Battle")
        scr_84_add_menu_item(parent, "[warp]", 45, "Post-Battle Scene")
        scr_84_add_menu_item(parent, "[warp]", 46, "Post-Battle Discussion")
        parent = scr_84_pop();
        
        
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Weird Route");
        scr_84_push(parent);
        parent = group;
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Cyber City");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 68, "Meeting Up With Noelle")
        scr_84_add_menu_item(parent, "[warp]", 69, "Meeting Up With Noelle (No Cutscene)")
        scr_84_add_menu_item(parent, "[warp]", 70, "Spamton's Shop")
        scr_84_add_menu_item(parent, "[warp]", 71, "Mouse Puzzle 1")
        scr_84_add_menu_item(parent, "[warp]", 72, "Ferris Wheel Poster, FreezeRing and Forcefield")
        scr_84_add_menu_item(parent, "[warp]", 73, "Save Point")
        scr_84_add_menu_item(parent, "[warp]", 74, "Spamton in the Trash Can")
        scr_84_add_menu_item(parent, "[warp]", 75, "Mouse Puzzle 2")
        scr_84_add_menu_item(parent, "[warp]", 76, "Mouse Puzzle 3")
        scr_84_add_menu_item(parent, "[warp]", 77, "Getting the ThornRing")
        scr_84_add_menu_item(parent, "[warp]", 78, "Berdly Encounter")
        scr_84_add_menu_item(parent, "[warp]", 79, "Meeting Up With Susie And Ralsei")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Queen's Mansion");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 80, "Foyer")
        scr_84_add_menu_item(parent, "[warp]", 81, "Taque Manager Encounter")
        scr_84_add_menu_item(parent, "[warp]", 82, "Werewerewire Encounter")
        scr_84_add_menu_item(parent, "[warp]", 83, "Susie Talks to Noelle")
        scr_84_add_menu_item(parent, "[warp]", 84, "Queen Encounter")
        scr_84_add_menu_item(parent, "[warp]", 85, "Pre-Spamton NEO Battle")
        scr_84_add_menu_item(parent, "[warp]", 86, "Spamton NEO Battle")
        parent = scr_84_pop();
        
        group = ds_list_create();
        scr_84_add_menu_item(parent, "[group]", group, "Hometown");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 87, "Computer Lab")
        scr_84_add_menu_item(parent, "[warp]", 88, "Rudy's Room Scene")
        scr_84_add_menu_item(parent, "[warp]", 89, "Outside Rudy's Room Scene")
        parent = scr_84_pop();
        parent = scr_84_pop();
        
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
    && !global.chemg_rebinding)
    {
        if global.chemg_menu_depth <= 0
        {
            global.chemg_menu_depth = 1
            global.chemg_interact = global.interact
            global.chemg_yoffset = 0
            global.interact = 0
        }
        else
        {
            global.chemg_menu_depth = 0
            global.interact = global.chemg_interact
        }
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
            if (debug_movetimer >= (3.25 * (game_get_speed(gamespeed_fps) / 30))) // make the amount of time it takes for the autoscrolling to kick in consistent when using the speed up debug key (the scrolling itelf will still be fast tho,,,,)
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
                else if (choice == "[hp]")
                {
                    var newhp = get_string("Enter their new HP value", "")
                    if (newhp != "")
                    {
                        try
                        {
                            global.hp[choice_data] = real(newhp)
                        }
                        catch(exc)
                            show_message("It needs numbers or else it will die :(")
                    }
                }
                else if (choice == "[hpmax]")
                {
                    var newhpmax = get_string("Enter their new max HP value", "")
                    if (newhpmax != "")
                    {
                        try
                        {
                            global.maxhp[choice_data] = real(newhpmax)
                            global.hp[choice_data] = real(newhpmax)
                        }
                        catch(exc)
                            show_message("It needs numbers or else it will die :(")
                    }
                }
                else if (choice == "[attack]")
                {
                    var newat = get_string("Enter their new Attack value", "")
                    if (newat != "")
                    {
                        try
                            global.at[choice_data] = real(newat)
                        catch(exc)
                            show_message("It needs numbers or else it will die :(")
                    }
                }
                else if (choice == "[defense]")
                {
                    var newdf = get_string("Enter their new Defense value", "")
                    if (newdf != "")
                    {
                        try
                            global.df[choice_data] = real(newdf)
                        catch(exc)
                            show_message("It needs numbers or else it will die :(")
                    }
                }
                else if (choice == "[magic]")
                {
                    var newmag = get_string("Enter their new Magic value", "")
                    if (newmag != "")
                    {
                        try
                            global.mag[choice_data] = real(newmag)
                        catch(exc)
                            show_message("It needs numbers or else it will die :(")
                    }
                }
                else if choice == "[weapon]"
                {
                    var newweapon = get_string("Enter new weapon name or ID ", "")
                    if (newweapon != "")
                    {
                        try
                            global.charweapon[choice_data] = real(newweapon)
                        catch(exc)
                        {
                            for (var i = 0; i < 100; i ++) // higher number in case someone using this adds a weapon with an id higher than the vanilla game's highest one
                            {
                                scr_weaponinfo(i)
                                if string_lower(weaponnametemp) == string_lower(newweapon)
                                {
                                    global.charweapon[choice_data] = i
                                    break
                                }
                                else if i == 99
                                {
                                    show_message("Invalid Name")
                                }
                            }
                        }
                        scr_weaponinfo_mine()
                    }
                }
                else if string_starts_with(choice, "[armor")
                {
                    var newarmor = get_string("Enter new weapon name or ID ", "")
                    if (newarmor != "")
                    {
                        try
                        {
                            if choice == "[armor1]"
                                global.chararmor1[choice_data] = real(newarmor)
                            else
                                global.chararmor2[choice_data] = real(newarmor)
                        }
                        catch(exc)
                        {
                            for (var i = 0; i < 100; i ++) // higher number in case someone using this adds an armor with an id higher than the vanilla game's highest one
                            {
                                scr_armorinfo(i)
                                if string_lower(armornametemp) == string_lower(newarmor)
                                {
                                    if choice == "[armor1]"
                                        global.chararmor1[choice_data] = i
                                    else
                                        global.chararmor2[choice_data] = i
                                    break
                                }
                                else if i == 99
                                {
                                    show_message("Invalid Name")
                                }
                            }
                        }
                        scr_armorinfo_mine()
                    }
                }
                else if (choice == "[spell]")
                {
                    var newspell = get_string("Enter new spell name or ID", "")
                    if (newspell != "")
                    {
                        try
                            global.spell[choice_data][real(string_char_at(choice_name, 1) + string_char_at(choice_name, 2))] = real(newspell)
                        catch(exc)
                        {
                            for (var i = 0; i < 100; i ++) // higher number in case someone using this adds a spell with an id higher than the vanilla game's highest one
                            {
                                scr_spellinfo(i)
                                if string_lower(spellname) == string_lower(newspell) || string_lower(spellnameb) == string_lower(newspell)
                                {
                                    global.spell[choice_data][real(string_char_at(choice_name, 1) + string_char_at(choice_name, 2))] = i
                                    break
                                }
                                else if i == 99
                                {
                                    show_message("Invalid Name")
                                }
                            }
                        }
                        scr_weaponinfo_mine()
                    }
                }
                else if (choice == "[setmember]")
                {
                    var _maxChar = (global.chapter == 1 ? 3 : 4) 
                    // get string
                    var newmem = get_string(concat("Enter new party member ", choice_data + 1, " name or ID"), "")
                    
                    if newmem != ""
                    {
                        try // try to convert the string to a number
                        {
                            newmem = real(newmem)
                            if (newmem < 0 || newmem > _maxChar) // fail if number isn't a valid character id
                            {
                                show_message("Invalid ID")
                                exit
                            }
                        }
                        catch(exc) // otherwise try to match the string to one of the characters' names
                        {
                            // check each character name
                            for (var j = 0; j <= _maxChar; j ++)
                            {
                                if string_lower(global.charname[j]) == string_lower(newmem) // if name is detected
                                {
                                    newmem = j
                                    j = _maxChar
                                }
                                else if j == _maxChar // fail if name isn't detected
                                {
                                    show_message("Invalid Name")
                                    exit
                                }
                            }
                        }
                        
                        // destroy party member object in targeted slot
                        if newmem != 1 && choice_data > 0
                        {
                            with global.cinstance[choice_data - 1]
                            {
                                instance_destroy()
                            }
                        }
                        
                        // back up current party for after scr_losechar is run
                        var charmem = array_create(2)
                        var i = 0
                        repeat(3)
                        {
                            charmem[i] = global.char[i]
                            i ++
                        }
                        global.char[0] = 0 // remove kris manually since scr_losechar doesn't remove them
                        scr_losechar()
                        
                        // add the new party member and readd lost party members
                        for (var i = 0; i < 3; i ++)
                        {
                            if choice_data == i // if i is the targeted slot
                            {
                                scr_getchar(newmem) // get the new member
                                // replace the deleted party member object with the one for the new character (code for alignment taken from scr_setparty)
                                if newmem > 1 && choice_data > 0 && i_ex(obj_mainchara) // check if kris exists cus if they don't obj_caterpillarchara shouldn't be made
                                {
                                    with (scr_makecaterpillar(obj_mainchara.x, obj_mainchara.y, newmem, choice_data - 1))
                                    {
                                        if newmem == 2 // susie
                                        {
                                            halign = (global.darkzone == 0) ? 3 : 6
                                            valign = (global.darkzone == 0) ? 6 : 16
                                            x -= halign
                                            y -= valign
                                        }
                                        else if newmem == 3 // ralsei
                                        {
                                            halign = 2
                                            valign = 12
                                            x -= halign
                                            y -= valign
                                        }
                                        else if newmem == 4 // noelle
                                        {
                                            halign = (global.darkzone == 0) ? 2 : 4
                                            valign = (global.darkzone == 0) ? 9 : 18
                                            x -= halign
                                            y -= valign
                                        }
                                    }
                                }
                            }
                            else // readd lost party members that aren't in the slot of the new one
                                scr_getchar(charmem[i])
                        }
                        
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
                    // set susie/ralsei/noelle acting suppresion flags
                    if choice_data > 14
                        global.flag[34] = 0
                    else
                        global.flag[34] = 1
                        
                    // prevent noelle room scene from playing
                    if choice_data > 52 && choice_data < 68
                        global.flag[319] = 1
                        
                    // give susie ultimateheal
                    var _getUltimateHeal = "remove"
                    if (choice_data > 30 && choice_data < 68) || choice_data > 79
                        _getUltimateHeal = "get"
                    for (var i = 0; i < 12; i ++)
                    {
                        if global.spell[2][i] == 11
                        {
                            if _getUltimateHeal == "remove"
                                global.spell[2][i] = 0
                            break
                        }
                        else if global.spell[2][i] == 0 && _getUltimateHeal == "get"
                        {
                            scr_spellget(2, 11)
                        }
                    }
                    
                    // give noelle snowgrave
                    var _getSnowgrave = "remove"
                    if choice_data > 78
                        _getSnowgrave = "get"
                    for (var i = 0; i < 12; i ++)
                    {
                        if global.spell[4][i] == 10
                        {
                            if _getSnowgrave == "remove"
                                global.spell[4][i] = 0
                            break
                        }
                        else if global.spell[4][i] == 0 && _getSnowgrave == "get"
                        {
                            scr_spellget(4, 10)
                        }
                    }
                    
                    snd_free_all()
                    
                    switch choice_data
                    {
                        case 0: // chapter start
                            global.darkzone = 0
                            global.plot = 0
                            roomtogo = room_krisroom
                            break
                        
                        case 1: // classroom
                            global.darkzone = 0
                            global.plot = 1
                            roomtogo = room_alphysclass
                            break
                            
                        case 2: // going to closet dark world
                            global.darkzone = 0
                            global.plot = 6
                            roomtogo = room_schooldoor
                            break
                            
                        case 3: // castle town
                            scr_setparty(1, 0, 0)
                            global.plot = 7
                            global.entrance = 1
                            global.interact = 3
                            roomtogo = room_dw_castle_area_2
                            break
                            
                        case 4: // transformed castle town
                            scr_setparty(0, 0, 0)
                            global.plot = 9
                            global.entrance = 23
                            global.interact = 3
                            roomtogo = room_dw_castle_area_2
                            break
                            
                        case 5: // transformed castle town no cutscene
                            scr_setparty(1, 1, 0)
                            global.plot = 12
                            roomtogo = room_dw_castle_area_2_transformed
                            break
                            
                        case 6: // transformed castle town post-seeing rooms
                            scr_setparty(1, 1, 0)
                            global.plot = 15
                            roomtogo = room_dw_castle_area_2_transformed
                            break
                            
                        case 7: // back to the light world
                            scr_setparty(1, 0, 0)
                            global.plot = 16
                            roomtogo = room_dw_castle_area_1
                            break
                            
                        case 8: // library
                            scr_setparty(0, 0, 0)
                            global.darkzone = 0
                            global.plot = 17
                            roomtogo = room_library
                            break
                        
                        case 9: // dark world entrance
                            scr_setparty(1, 0, 0)
                            global.plot = 49
                            roomtogo = room_dw_cyber_intro_1
                            break
                                                    
                        case 10: // meeting queen
                            scr_setparty(1, 0, 0)
                            global.plot = 50
                            roomtogo = room_dw_cyber_intro_2
                            break
                            
                        case 11: // musical slide
                            scr_setparty(1, 1, 0)
                            global.plot = 51
                            roomtogo = room_dw_cyber_rhythm_slide
                            break
                            
                        case 12: // punch out with queen
                            scr_setparty(1, 1, 0)
                            global.plot = 52
                            global.entrance = 3
                            global.interact = 3
                            roomtogo = room_dw_cyber_queen_boxing
                            break
                            
                        case 13: // cyber field midpoint
                            scr_setparty(1, 1, 0)
                            global.plot = 55
                            roomtogo = room_dw_cyber_musical_door
                            break
                            
                        case 14: // sweet capn cakes battle
                            scr_setparty(1, 1, 0)
                            global.plot = 55
                            roomtogo = room_dw_cyber_music_final
                            break
                            
                        case 15: // music shop
                            scr_setparty(1, 1, 0)
                            global.plot = 60
                            roomtogo = room_dw_cyber_musical_shop
                            break
                            
                        case 16: // berdly battle
                            scr_setparty(1, 1, 0)
                            global.plot = 60
                            roomtogo = room_dw_cyber_rollercoaster
                            break
                            
                        case 17: // trash pile
                            scr_setparty(1, 1, 0)
                            global.plot = 64
                            roomtogo = room_dw_city_intro
                            break
                            
                        case 18: // susie and ralsei leave
                            scr_setparty(1, 1, 0)
                            global.plot = 65.5
                            roomtogo = room_dw_city_split
                            break
                            
                        case 19: // cyber city entrance
                            scr_setparty(0, 0, 0)
                            global.plot = 66
                            global.interact = 3
                            global.entrance = 1
                            roomtogo = room_dw_city_entrance
                            break
                            
                        case 20: // meeting up with noelle
                            scr_setparty(0, 0, 0)
                            global.plot = 69
                            global.entrance = 1
                            global.interact = 3
                            roomtogo = room_dw_city_hacker
                            break
                            
                        case 21: // meeting noelle (no cutscene)
                            scr_setparty(0, 0, 1)
                            global.plot = 70
                            roomtogo = room_dw_city_hacker
                            break
                            
                        case 22: // drunk queen
                            scr_setparty(0, 0, 1)
                            global.plot = 72
                            roomtogo = room_dw_city_queen_drunk
                            break
                            
                        case 23: // sweet cap'n cakes save point
                            scr_setparty(0, 0, 1)
                            global.plot = 75
                            roomtogo = room_dw_city_savepoint
                            break
                        
                        case 24: // mice room 3
                            scr_setparty(0, 0, 1)
                            global.plot = 75
                            global.entrance = 1
                            global.interact = 3
                            roomtogo = room_dw_city_mice3
                            break
                            
                        case 25: // berdly battle
                            scr_setparty(0, 0, 1)
                            global.plot = 78
                            global.entrance = 1
                            global.interact = 3
                            roomtogo = room_dw_city_berdly
                            break
                            
                        case 26: // driving with queen
                            scr_setparty(0, 0, 1)
                            global.plot = 79
                            roomtogo = room_dw_city_traffic_4
                            break
                            
                        case 27: // spamton battle
                            scr_setparty(0, 0, 0)
                            global.plot = 80
                            roomtogo = room_dw_city_spamton_alley
                            break
                            
                        case 28: // driving with queen 2 the squeakquel
                            scr_setparty(0, 0, 0)
                            global.plot = 85
                            global.entrance = 23
                            global.interact = 3
                            roomtogo = room_dw_city_traffic_4
                            break
                            
                        case 29: // noelle monologue
                            scr_setparty(0, 0, 1)
                            global.plot = 90
                            roomtogo = room_dw_city_monologue
                            break
                            
                        case 30: // susie and ralsei rejoin
                            scr_setparty(0, 0, 1)
                            global.plot = 94
                            roomtogo = room_dw_city_baseball
                            break
                            
                        case 31: // post-susie and ralsei rejoining
                            scr_setparty(1, 1, 0)
                            global.plot = 95
                            roomtogo = room_dw_city_postbaseball_1
                            break
                            
                        case 32: // outside queen's mansion scene
                            scr_setparty(1, 1, 0)
                            global.plot = 95
                            roomtogo = room_dw_city_mansion_front
                            break
                            
                        case 33: // kris's room
                            scr_setparty(0, 0, 0)
                            global.flag[7] = 0
                            global.plot = 99
                            roomtogo = room_dw_mansion_krisroom
                            break
                            
                        case 34: // lancer getting sick
                            scr_setparty(0, 0, 0)
                            global.plot = 100
                            roomtogo = room_dw_mansion_lightner_hallway
                            break
                            
                        case 35: // light puzzle 3
                            scr_setparty(0, 0, 0)
                            global.plot = 110
                            global.currentsong[0] = snd_init("mansion_entrance.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            roomtogo = room_dw_mansion_darkbulb_3
                            break
                            
                        case 36: // lancer petrifying
                            scr_setparty(0, 0, 0)
                            global.plot = 115
                            global.currentsong[0] = snd_init("mansion_entrance.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            roomtogo = room_dw_mansion_dining_a
                            break
                            
                        case 37: // entrance room
                            scr_setparty(1, 1, 0)
                            global.plot = 120
                            roomtogo = room_dw_mansion_entrance
                            break
                            
                        case 38: // tasque manager room
                            scr_setparty(1, 1, 0)
                            global.plot = 120
                            roomtogo = room_dw_mansion_tasquePaintings
                            break
                            
                        case 39: // secret room entrance
                            scr_setparty(1, 1, 0)
                            global.plot = 120
                            roomtogo = room_dw_mansion_east_1f_e
                            break
                            
                        case 40: // spamton's shop
                            scr_setparty(1, 1, 0)
                            global.plot = 120
                            roomtogo = room_shop_ch2_spamton
                            break
                            
                        case 41: // queen's basement
                            scr_setparty(0, 0, 0)
                            global.plot = 120
                            roomtogo = room_dw_mansion_b_central
                            break
                            
                        case 42: // emptydisk room
                            scr_setparty(0, 0, 0)
                            global.plot = 120
                            roomtogo = room_dw_mansion_b_east_b
                            break
                            
                        case 43: // emptydisk room (with loadeddisk)
                            scr_setparty(0, 0, 0)
                            global.plot = 120
                            if !scr_keyitemcheck(11)
                                scr_keyitemget(11)
                            global.flag[309] = 7
                            roomtogo = room_dw_mansion_b_east_b
                            break
                        
                        case 44: // spamton neo battle
                            scr_setparty(0, 0, 0)
                            global.plot = 120
                            global.entrance = 23
                            global.interact = 3
                            global.flag[309] = 8
                            roomtogo = room_dw_mansion_b_east
                            break
                            
                        case 45: // post-spamton battle scene
                            scr_setparty(1, 1, 0)
                            global.plot = 120
                            global.entrance = 23
                            global.interact = 3
                            global.flag[309] = 8
                            roomtogo = room_dw_mansion_b_east_a
                            break
                            
                        case 46: // post-spamton battle discussion
                            scr_setparty(1, 1, 0)
                            global.plot = 120
                            global.entrance = 2
                            global.interact = 3
                            global.flag[309] = 9
                            roomtogo = room_dw_mansion_b_entrance
                            break
                        
                        case 47: // mauswheel battle
                            scr_setparty(1, 1, 0)
                            global.plot = 120
                            global.currentsong[0] = snd_init("mansion.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            roomtogo = room_dw_mansion_kitchen
                            break
                        
                        case 48: // meeting up with berdly
                            scr_setparty(1, 1, 0)
                            global.plot = 120
                            roomtogo = room_dw_mansion_east_3f
                            break
                         
                        case 49: // acid tunnel of love
                            scr_setparty(0, 1, 0)
                            global.plot = 125
                            roomtogo = room_dw_mansion_acid_tunnel
                            break
                        
                        case 50: // rouxls battle
                            scr_setparty(0, 1, 0)
                            global.plot = 141
                            roomtogo = room_dw_mansion_acid_tunnel_loop_rouxls
                            break
                        
                        case 51: // post-tunnel scene
                            scr_setparty(0, 1, 0)
                            global.plot = 150
                            global.entrance = 1
                            global.interact = 3
                            roomtogo = room_dw_mansion_acid_tunnel_exit
                            break
                        
                        case 52: // post-ferris wheel scene
                            scr_setparty(0, 1, 0)
                            global.plot = 150
                            roomtogo = room_dw_mansion_ferris_wheel_post
                            break
                        
                        case 53: // werewerewire battle
                            scr_setparty(1, 1, 0)
                            global.plot = 160
                            roomtogo = room_dw_mansion_east_4f_b
                            break
                        
                        case 54: // queen battle
                            scr_setparty(1, 1, 0)
                            global.plot = 160
                            global.entrance = 1
                            global.interact = 3
                            global.currentsong[0] = snd_init("wind_highplace.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            roomtogo = room_dw_mansion_east_4f_d
                            break
                        
                        case 55: // giga queen battle
                            scr_setparty(1, 1, 0)
                            global.plot = 165
                            roomtogo = room_dw_mansion_top
                            break
                        
                        case 56: // post-giga queen battle
                            scr_setparty(1, 1, 0)
                            global.plot = 170
                            roomtogo = room_dw_mansion_top_post
                            break
                        
                        case 57: // sealing the fountain
                            scr_setparty(1, 1, 0)
                            global.plot = 171
                            roomtogo = room_cc_fountain
                            break
                        
                        case 58: // computer lab
                            scr_setparty(0, 0, 0)
                            global.darkzone = 0
                            global.plot = 171
                            roomtogo = room_lw_computer_lab
                            break
                        
                        case 59: // susie joining outside the computer lab
                            scr_setparty(0, 0, 0)
                            global.darkzone = 0
                            global.plot = 200
                            global.entrance = 24
                            global.interact = 3
                            roomtogo = room_town_south
                            break
                        
                        case 60: // hometown
                            scr_setparty(1, 0, 0)
                            global.darkzone = 0
                            global.plot = 205
                            global.entrance = 24
                            global.interact = 3
                            roomtogo = room_town_south
                            break
                            
                        case 61: // back to castle town
                            global.darkzone = 0
                            scr_setparty(1, 0, 0)
                            global.plot = 205
                            roomtogo = room_schooldoor
                            break
                            
                        case 62: // castle town
                            scr_setparty(1, 1, 0)
                            global.flag[387] = 1 // town entrance queen cutscene flag
                            global.plot = 205
                            roomtogo = room_dw_castle_area_2_transformed
                            break
                        
                        case 63: // hospital scene
                            global.darkzone = 0
                            scr_setparty(1, 0, 0)
                            global.plot = 205
                            global.currentsong[0] = snd_init("town.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 0.97)
                            roomtogo = room_hospital_rudy
                            break
                        
                        case 64: // going to kris's house
                            scr_setparty(1, 0, 0)
                            global.darkzone = 0
                            global.plot = 205
                            roomtogo = room_town_krisyard
                            break
                        
                        case 65: // bathroom scene
                            scr_setparty(0, 0, 0)
                            global.darkzone = 0
                            global.plot = 210
                            roomtogo = room_torbathroom
                            break
                        
                        case 66: // final scene
                            scr_setparty(0, 0, 0)
                            global.darkzone = 0
                            global.plot = 211
                            global.entrance = 2
                            global.interact = 3
                            roomtogo = room_torhouse
                            break
                            
                        case 67: // credits
                            scr_setparty(0, 0, 0)
                            global.darkzone = 0
                            global.plot = 211
                            roomtogo = room_ed
                            break
                            
                        case 68: // meeting up with noelle
                            scr_setparty(0, 0, 0)
                            global.plot = 69
                            global.entrance = 1
                            global.interact = 3
                            roomtogo = room_dw_city_hacker
                            break
                            
                        case 69: // meeting noelle (no cutscene)
                            scr_setparty(0, 0, 1)
                            global.plot = 70
                            roomtogo = room_dw_city_hacker
                            break
                            
                        case 70: // spamton's shop
                            scr_setparty(0, 0, 1)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // 2 poppups
                            global.flag[560] = 6 // second virovirokun
                            global.flag[561] = 6 // werewire
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            
                            // overall weird route progress
                            global.flag[915] = 1.5 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 4 // noelle level up count
                            global.flag[925] = 7 // iceshocks
                            global.flag[926] = 4 // iceshocked encounters
                            global.flag[45] = 5 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 4
                            {
                                // kris
                                global.hp[1] = 128
                                global.maxhp[1] = 128
                                global.at[1] = 12
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 148
                                global.maxhp[2] = 150
                                global.at[2] = 16
                                global.df[2] = 2
                                global.ma[2] = 1
                                
                                // ralsei
                                global.hp[3] = 108
                                global.maxhp[3] = 108
                                global.at[3] = 10
                                global.df[3] = 2
                                global.ma[3] = 9
                                
                                global.flag[65] = 4 // level up count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 110
                            global.maxhp[4] = 110
                            global.at[4] = 4
                            global.df[4] = 1
                            global.ma[4] = 12
                            
                            global.plot = 70
                            roomtogo = room_dw_city_spamton_shop_exterior
                            break
                            
                        case 71: // mouse puzzle 1
                            scr_setparty(0, 0, 1)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // 2 poppups
                            global.flag[560] = 6 // second virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // first ambyu-lance
                            global.flag[563] = 6 // first tasque
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            
                            // overall weird route progress
                            global.flag[915] = 1.75 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 6 // noelle level up count
                            global.flag[925] = 11 // iceshocks
                            global.flag[926] = 6 // iceshocked encounters
                            global.flag[45] = 7 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 6
                            {
                                // kris
                                global.hp[1] = 132
                                global.maxhp[1] = 132
                                global.at[1] = 12
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 152
                                global.maxhp[2] = 155
                                global.at[2] = 16
                                global.df[2] = 2
                                global.ma[2] = 1
                                
                                // ralsei
                                global.hp[3] = 112
                                global.maxhp[3] = 112
                                global.at[3] = 10
                                global.df[3] = 2
                                global.ma[3] = 9
                                
                                global.flag[65] = 6 // level up count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 114
                            global.maxhp[4] = 114
                            global.at[4] = 4
                            global.df[4] = 1
                            global.ma[4] = 12
                            
                            global.plot = 70
                            roomtogo = room_dw_city_mice
                            break
                            
                        case 72: // ferris wheel poster, freezering and forcefield
                            scr_setparty(0, 0, 1)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            
                            // overall weird route progress
                            global.flag[915] = 1.75 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 9 // noelle level up count
                            global.flag[925] = 19 // iceshocks
                            global.flag[926] = 9 // iceshocked encounters
                            global.flag[45] = 11 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 9
                            {
                                // kris
                                global.hp[1] = 138
                                global.maxhp[1] = 138
                                global.at[1] = 12
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 158
                                global.maxhp[2] = 162
                                global.at[2] = 16
                                global.df[2] = 2
                                global.ma[2] = 1
                                
                                // ralsei
                                global.hp[3] = 118
                                global.maxhp[3] = 118
                                global.at[3] = 10
                                global.df[3] = 2
                                global.ma[3] = 9
                                
                                global.flag[65] = 9 // level up count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 126
                            global.maxhp[4] = 126
                            global.at[4] = 5
                            global.df[4] = 1
                            global.ma[4] = 13
                            
                            global.plot = 72
                            roomtogo = room_dw_city_big_2
                            break
                            
                        case 73: // save point
                            scr_setparty(0, 0, 1)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            
                            // overall weird route progress
                            global.flag[915] = 4 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 11 // noelle level up count
                            global.flag[925] = 26 // iceshocks
                            global.flag[926] = 11 // iceshocked encounters
                            global.flag[45] = 16 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 11
                            {
                                // kris
                                global.hp[1] = 142
                                global.maxhp[1] = 142
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 167
                                global.maxhp[2] = 167
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 122
                                global.maxhp[3] = 122
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 11 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 134
                            global.maxhp[4] = 134
                            global.at[4] = 5
                            global.df[4] = 1
                            global.ma[4] = 13
                            
                            // force equip freezering
                            if global.charweapon[4] != 22
                            {
                                // get snow ring if wearing it to prevent completely overwriting it
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(22)
                                global.charweapon[4] = 22
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.plot = 75
                            roomtogo = room_dw_city_savepoint
                            break
                            
                        case 74: // spamton in the trash can
                            scr_setparty(0, 0, 1)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            
                            // overall weird route progress
                            global.flag[915] = 4 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 14 // noelle level up count
                            global.flag[925] = 33 // iceshocks
                            global.flag[926] = 14 // iceshocked encounters
                            global.flag[45] = 23 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 14
                            {
                                // kris
                                global.hp[1] = 148
                                global.maxhp[1] = 148
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 173
                                global.maxhp[2] = 175
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 128
                                global.maxhp[3] = 128
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 14 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 146
                            global.maxhp[4] = 146
                            global.at[4] = 6
                            global.df[4] = 1
                            global.ma[4] = 14
                            
                            // force equip freezering
                            if global.charweapon[4] != 22
                            {
                                // get snow ring if wearing it to prevent completely overwriting it
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(22)
                                global.charweapon[4] = 22
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.plot = 75
                            roomtogo = room_dw_city_moss
                            break
                            
                        case 75: // mouse puzzle 2
                            scr_setparty(0, 0, 1)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            
                            // overall weird route progress
                            global.flag[915] = 4 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 15 // noelle level up count
                            global.flag[925] = 36 // iceshocks
                            global.flag[926] = 15 // iceshocked encounters
                            global.flag[45] = 26 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 15
                            {
                                // kris
                                global.hp[1] = 150
                                global.maxhp[1] = 150
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 175
                                global.maxhp[2] = 177
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 130
                                global.maxhp[3] = 130
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 15 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 150
                            global.maxhp[4] = 150
                            global.at[4] = 6
                            global.df[4] = 1
                            global.ma[4] = 14
                            
                            // force equip freezering
                            if global.charweapon[4] != 22
                            {
                                // get snow ring if wearing it to prevent completely overwriting it
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(22)
                                global.charweapon[4] = 22
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.plot = 75
                            roomtogo = room_dw_city_mice2
                            break
                            
                        case 76: // mouse puzzle 3
                            scr_setparty(0, 0, 1)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            
                            // overall weird route progress
                            global.flag[915] = 5 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 17 // noelle level up count
                            global.flag[925] = 42 // iceshocks
                            global.flag[926] = 17 // iceshocked encounters
                            global.flag[45] = 32 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 17
                            {
                                // kris
                                global.hp[1] = 154
                                global.maxhp[1] = 154
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 179
                                global.maxhp[2] = 182
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 134
                                global.maxhp[3] = 134
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 17 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 158
                            global.maxhp[4] = 158
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip freezering
                            if global.charweapon[4] != 22
                            {
                                // get snow ring if wearing it to prevent completely overwriting it
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(22)
                                global.charweapon[4] = 22
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.entrance = 1
                            global.interact = 3
                            global.plot = 77
                            roomtogo = room_dw_city_mice3
                            break
                            
                        case 77: // getting the thornring
                            scr_setparty(0, 0, 1)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            
                            // overall weird route progress
                            global.flag[915] = 5 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip freezering
                            if global.charweapon[4] != 22
                            {
                                // get snow ring if wearing it to prevent completely overwriting it
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(22)
                                global.charweapon[4] = 22
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            if global.gold < 1997
                                global.gold = 1997
                            
                            global.plot = 78
                            roomtogo = room_dw_city_moss
                            break
                            
                        case 78: // berdly encounter
                            scr_setparty(0, 0, 1)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            
                            // overall weird route progress
                            global.flag[915] = 5 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.entrance = 1
                            global.interact = 3
                            global.plot = 78
                            roomtogo = room_dw_city_berdly
                            break
                            
                        case 79: // meeting up with susie and ralsei
                            scr_setparty(0, 0, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            // overall weird route progress
                            global.flag[915] = 6 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.entrance = 24
                            global.interact = 3
                            global.plot = 79
                            roomtogo = room_dw_city_mansion_front
                            break
                            
                        case 80: // foyer
                            scr_setparty(1, 1, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            global.flag[418] = 1 // flag for getting the shoe from an addison, set when entering here too for some reason
                            global.flag[346] = 1 // first mansion shortcut opened
                            global.flag[340] = 1 // basement shortcut opened
                            
                            // overall weird route progress
                            global.flag[915] = 7 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.entrance = 24
                            global.interact = 3
                            global.plot = 79
                            roomtogo = room_dw_mansion_entrance
                            break
                            
                        case 81: // tasque manager encounter
                            scr_setparty(1, 1, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            global.flag[418] = 1 // flag for getting the shoe from an addison, set when entering here too for some reason
                            global.flag[346] = 1 // first mansion shortcut opened
                            global.flag[340] = 1 // basement shortcut opened
                            
                            // overall weird route progress
                            global.flag[915] = 7 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.plot = 79
                            roomtogo = room_dw_mansion_east_2f_d
                            break
                            
                        case 82: // werewerewire encounter
                            scr_setparty(1, 1, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            global.flag[418] = 1 // flag for getting the shoe from an addison, set when entering here too for some reason
                            global.flag[346] = 1 // first mansion shortcut opened
                            global.flag[340] = 1 // basement shortcut opened
                            global.flag[392] = 1 // second mansion shortcut opened
                            
                            // overall weird route progress
                            global.flag[915] = 7 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.currentsong[0] = snd_init("spamton_neo_meeting.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            
                            global.plot = 160
                            roomtogo = room_dw_mansion_east_3f_projection
                            break
                            
                        case 83: // susie talks to noelle
                            scr_setparty(1, 1, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            global.flag[418] = 1 // flag for getting the shoe from an addison, set when entering here too for some reason
                            global.flag[346] = 1 // first mansion shortcut opened
                            global.flag[340] = 1 // basement shortcut opened
                            global.flag[392] = 1 // second mansion shortcut opened
                            
                            // overall weird route progress
                            global.flag[915] = 7 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.entrance = 20
                            global.interact = 3
                            global.plot = 160
                            roomtogo = room_dw_mansion_east_4f_b
                            break
                            
                        case 84: // queen encounter
                            scr_setparty(1, 1, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            global.flag[418] = 1 // flag for getting the shoe from an addison, set when entering here too for some reason
                            global.flag[346] = 1 // first mansion shortcut opened
                            global.flag[340] = 1 // basement shortcut opened
                            global.flag[392] = 1 // second mansion shortcut opened
                            
                            // overall weird route progress
                            global.flag[915] = 9 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.plot = 160
                            roomtogo = room_dw_mansion_top
                            break
                            
                        case 85: // pre-spamton neo battle
                            scr_setparty(0, 0, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            global.flag[418] = 1 // flag for getting the shoe from an addison, set when entering here too for some reason
                            global.flag[346] = 1 // first mansion shortcut opened
                            global.flag[340] = 1 // basement shortcut opened
                            global.flag[392] = 1 // second mansion shortcut opened
                            
                            // overall weird route progress
                            global.flag[915] = 9 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.plot = 170
                            roomtogo = room_dw_mansion_prefountain
                            break
                            
                        case 86: // spamton neo battle
                            scr_setparty(0, 0, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            global.flag[418] = 1 // flag for getting the shoe from an addison, set when entering here too for some reason
                            global.flag[346] = 1 // first mansion shortcut opened
                            global.flag[340] = 1 // basement shortcut opened
                            global.flag[392] = 1 // second mansion shortcut opened
                            
                            // overall weird route progress
                            global.flag[915] = 9 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.plot = 170
                            roomtogo = room_dw_mansion_fountain
                            break
                            
                        case 87: // waking up in the library
                            scr_setparty(0, 0, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            global.flag[571] = 2 // spamton neo
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            global.flag[418] = 1 // flag for getting the shoe from an addison, set when entering here too for some reason
                            global.flag[346] = 1 // first mansion shortcut opened
                            global.flag[340] = 1 // basement shortcut opened
                            global.flag[392] = 1 // second mansion shortcut opened
                            global.flag[456] = 1 // spamton neo defeated on weird route
                            global.flag[309] = 9 // spamton quest progress
                            
                            // overall weird route progress
                            global.flag[915] = 9 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.darkzone = 0
                            global.plot = 170
                            roomtogo = room_lw_computer_lab
                            break
                            
                        case 88: // meeting noelle in rudy's room
                            scr_setparty(1, 0, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            global.flag[571] = 2 // spamton neo
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            global.flag[418] = 1 // flag for getting the shoe from an addison, set when entering here too for some reason
                            global.flag[346] = 1 // first mansion shortcut opened
                            global.flag[340] = 1 // basement shortcut opened
                            global.flag[392] = 1 // second mansion shortcut opened
                            global.flag[456] = 1 // spamton neo defeated on weird route
                            global.flag[309] = 9 // spamton quest progress
                            
                            // overall weird route progress
                            global.flag[915] = 9 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.darkzone = 0
                            global.currentsong[0] = snd_init("town.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.8, 0.97)
                            global.plot = 205
                            roomtogo = room_hospital_rudy
                            break
                            
                        case 89: // listening to noelle outside of rudy's room
                            scr_setparty(1, 0, 0)
                            // encounters (in order of how you encounter them)
                            global.flag[531] = 6 // first virovirokun
                            global.flag[559] = 6 // two poppups
                            global.flag[560] = 6 // virovirokun
                            global.flag[561] = 6 // werewire
                            global.flag[562] = 6 // ambyu-lance
                            global.flag[563] = 6 // tasque
                            global.flag[532] = 6 // two ambyu-lances
                            global.flag[564] = 6 // virovirokun
                            global.flag[565] = 6 // werewire
                            global.flag[533] = 6 // virovirokun and ambyu-lance
                            global.flag[556] = 6 // three tasques
                            global.flag[535] = 6 // two virovirokuns
                            global.flag[534] = 6 // two werewires
                            global.flag[553] = 6 // three ambyu-lances
                            global.flag[554] = 6 // two virovirokuns and a tasque
                            global.flag[555] = 6 // three maus
                            global.flag[556] = 6 // three maus
                            global.flag[538] = 6 // poppup and maus
                            global.flag[566] = 6 // three maus
                            global.flag[567] = 6 // two poppups
                            global.flag[550] = 2 // berdly
                            global.flag[571] = 2 // spamton neo
                            // remove enemy recruits
                            global.flag[635] = -1 // virovirokun
                            global.flag[631] = -1 // poppup
                            global.flag[633] = -1 // werewire
                            global.flag[630] = -1 // ambyu-lance
                            global.flag[632] = -1 // tasque
                            global.flag[634] = -1 // maus
                            
                            // scene flags
                            global.flag[452] = 1 // trash zone "are you sure this is the right way?"
                            global.flag[446] = 1 // interacted with spamton's door
                            global.flag[440] = 1 // interacted with ferris wheel poster
                            global.flag[455] = 1 // said "noelle will ride with me"
                            global.flag[441] = 1 // talked to the dating shoes addison
                            global.flag[421] = 1 // said "we're something else"
                            global.flag[383] = 1 // solved forcefield puzzle
                            global.flag[368] = 1 // mice puzzle 2 finished
                            global.flag[379] = 1 // noelle beats her fear after doing the third mice puzzle
                            global.flag[924] = 4 // amount of times noelle was told to use snowgrave
                            global.flag[349] = 1 // berdly was frozen
                            
                            global.flag[418] = 1 // flag for getting the shoe from an addison, set when entering here too for some reason
                            global.flag[346] = 1 // first mansion shortcut opened
                            global.flag[340] = 1 // basement shortcut opened
                            global.flag[392] = 1 // second mansion shortcut opened
                            global.flag[456] = 1 // spamton neo defeated on weird route
                            global.flag[309] = 9 // spamton quest progress
                            global.flag[316] = 1 // saw the rudy scene
                            
                            // overall weird route progress
                            global.flag[915] = 19 // main progress flag
                            global.flag[916] = 0 // aborted route
                            global.flag[919] = 19 // noelle level up count
                            global.flag[925] = 46 // iceshocks
                            global.flag[926] = 19 // iceshocked encounters
                            global.flag[45] = 36 // number of frozen enemies
                            
                            // Kris/Susie/Ralsei Stats + chapter 2 level up count
                            if global.flag[65] < 19
                            {
                                // kris
                                global.hp[1] = 158
                                global.maxhp[1] = 158
                                global.at[1] = 13
                                global.df[1] = 2
                                global.ma[1] = 0
                                
                                // susie
                                global.hp[2] = 183
                                global.maxhp[2] = 187
                                global.at[2] = 17
                                global.df[2] = 2
                                global.ma[2] = 2
                                
                                // ralsei
                                global.hp[3] = 138
                                global.maxhp[3] = 138
                                global.at[3] = 11
                                global.df[3] = 2
                                global.ma[3] = 10
                                
                                global.flag[65] = 19 // level up count
                                global.flag[66] = 1 // attack/magic gain count
                            }
                            
                            // Noelle's Stats
                            global.hp[4] = 166
                            global.maxhp[4] = 166
                            global.at[4] = 7
                            global.df[4] = 1
                            global.ma[4] = 15
                            
                            // force equip thornring
                            if global.charweapon[4] != 13
                            {
                                // get snow ring or freeze ring if wearing one of them to prevent completely overwriting them
                                if global.charweapon[4] == 12
                                    scr_weaponget(12)
                                else if global.charweapon[4] == 22
                                    scr_weaponget(22)
                                    
                                // assign proper stats when equipping the weapon
                                scr_weaponinfo(13)
                                global.charweapon[4] = 13
                                global.itemat[4][0] = weaponattemp
                                global.itemma[4][0] = weaponmagtemp
                            }
                            
                            global.darkzone = 0
                            global.entrance = 2
                            global.interact = 3
                            global.plot = 205
                            roomtogo = room_hospital_hallway
                            break
                        
                        // template
                        case 99: // 
                            scr_setparty(0, 0, 0)
                            global.plot = 0
                            roomtogo = room
                            break
                    }
                    room_goto(roomtogo)
                    global.chemg_menu_depth = 0
                }
                else if string_starts_with(choice, "[recruit")
                {
                    // array of recruitable enemies
                    var _recruitArray = [
                        [5, 6, 11, 13, 14, 15, 20, 22, 23], // chapter 1
                        [30, 31, 32, 33, 34, 35, 36, 40, 42, 44], // chapter 2
                        [54, 55, 56, 57, 58, 59, 60, 61], // chapter 3
                        [62, 63, 64, 65, 66, 67, 68, 69], // chapter 4
                        [70, 71, 72, 73, 74, 75, 76, 77], // chapter 5
                        //[], // chapter 6
                        //[], // chapter 7
                    ]
                    
                    // set if recruting, removing, or losing recruits
                    var _setType = (choice == "[recruitall]" ? 1 : (choice == "[recruitremove]" ? 0 : -1))
                    
                    
                    if choice_data != 8
                    {
                        // alter status of all recruits from chosen chapter
                        for (var i = 0; i < array_length(_recruitArray[choice_data - 1]); i ++)
                        {
                            global.flag[600 + _recruitArray[choice_data - 1][i]] = _setType
                        }
                    }
                    else
                    {
                        // alter status of recruits from every chapter (except chapter 1 since you can never normally lose any of the chapter 1 recruits besides rabbick in chapter 3 i guess.)
                        for (var i = 1; i < global.chapter; i ++)
                        {
                            for (var j = 0; j < array_length(_recruitArray[i]); j ++)
                            {
                                global.flag[600 + _recruitArray[i][j]] = _setType
                            }
                        }
                    }
                    
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
        
        
        var header = concat("====[ 8-4 Debug Menu ]====[ D$: ", global.gold, " $: ", global.lgold)
        if global.chapter == 3
            header += concat(" PTs: ", global.flag[1044])
        else if global.chapter == 5
            header += concat(" F$: ", global.flag[1411], " P$: ", global.flag[1312])
        header += " ]"
        
        scr_84_draw_text_outline(10, yy, header)
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
