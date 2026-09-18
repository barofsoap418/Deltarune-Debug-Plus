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
        scr_84_add_menu_item(parent, "[flagset]", 1411, "Set F$")
        scr_84_add_menu_item(parent, "[flagset]", 1312, "Set P$")
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
        scr_84_add_menu_item(parent, "[flowerydollars]", 50, "+50 F$")
        scr_84_add_menu_item(parent, "[flowerydollars]", -50, "-50 F$")
        scr_84_add_menu_item(parent, "[flowerydollars]", 100, "+100 F$")
        scr_84_add_menu_item(parent, "[flowerydollars]", -100, "-100 F$")
        scr_84_add_menu_item(parent, "[flowerydollars]", 200, "+200 F$")
        scr_84_add_menu_item(parent, "[flowerydollars]", -200, "-200 F$")
        scr_84_add_menu_item(parent, "[flowerydollars]", 500, "+500 F$")
        scr_84_add_menu_item(parent, "[flowerydollars]", -500, "-500 F$")
        scr_84_add_menu_item(parent, "[pinkcoins]", 1, "+1 P$")
        scr_84_add_menu_item(parent, "[pinkcoins]", -1, "-1 P$")
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 3")
        scr_84_push(parent)
        parent = group
        
        for (var i = 34; i <= 39; i ++)
        {
            scr_iteminfo(i)
            scr_84_add_menu_item(parent, "[item]", i, itemnameb)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 4")
        scr_84_push(parent)
        parent = group
        
        // add darker candy by itself first cus it overwrote dark candy lol
        scr_iteminfo(1)
        scr_84_add_menu_item(parent, "[item]", 1, itemnameb)
        
        for (var i = 60; i <= 63; i ++)
        {
            scr_iteminfo(i)
            scr_84_add_menu_item(parent, "[item]", i, itemnameb)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 5")
        scr_84_push(parent)
        parent = group
        
        for (var i = 40; i <= 43; i ++)
        {
            scr_iteminfo(i)
            scr_84_add_menu_item(parent, "[item]", i, itemnameb)
        }
        for (var i = 64; i <= 70; i ++)
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
        
        // chapter 3 has no new light world items
        
        // chapter 4
        scr_84_add_menu_item(parent, "[lightitem]", 15, "Holiday Pencil")
        scr_84_add_menu_item(parent, "[lightitem]", 16, "CactusNeedle")
        scr_84_add_menu_item(parent, "[lightitem]", 17, "BlackShard")
        scr_84_add_menu_item(parent, "[lightitem]", 18, "QuillPen")
        
        // chapter 5
        scr_84_add_menu_item(parent, "[lightitem]", 19, "Honey Toast")
        scr_84_add_menu_item(parent, "[lightitem]", 20, "Bread")
        scr_84_add_menu_item(parent, "[lightitem]", 21, "Seeds")
        scr_84_add_menu_item(parent, "[lightitem]", 22, "Pencil2")
        scr_84_add_menu_item(parent, "[lightitem]", 23, "Petal")
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 3")
        scr_84_push(parent)
        parent = group
        
        for (var i = 16; i <= 19; i ++)
        {
            scr_keyiteminfo(i)
            scr_84_add_menu_item(parent, "[keyitem]", i, tempkeyitemname)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 4")
        scr_84_push(parent)
        parent = group
        
        for (var i = 30; i <= 31; i ++) // why does chapter 4 skip to here...
        {
            scr_keyiteminfo(i)
            scr_84_add_menu_item(parent, "[keyitem]", i, tempkeyitemname)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 5")
        scr_84_push(parent)
        parent = group
        
        for (var i = 20; i <= 29; i ++)
        {
            scr_keyiteminfo(i)
            scr_84_add_menu_item(parent, "[keyitem]", i, tempkeyitemname)
        }
        for (var i = 32; i <= 33; i ++)
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 3")
        scr_84_push(parent)
        parent = group
        
        for (var i = 23; i <= 26; i ++)
        {
            scr_weaponinfo(i)
            scr_84_add_menu_item(parent, "[weaponitem]", i, weaponnametemp)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 4")
        scr_84_push(parent)
        parent = group
        
        for (var i = 50; i <= 54; i ++)
        {
            scr_weaponinfo(i)
            scr_84_add_menu_item(parent, "[weaponitem]", i, weaponnametemp)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 5")
        scr_84_push(parent)
        parent = group
        
        for (var i = 30; i <= 37; i ++)
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 3")
        scr_84_push(parent)
        parent = group
        
        for (var i = 23; i <= 27; i ++)
        {
            scr_armorinfo(i)
            scr_84_add_menu_item(parent, "[armoritem]", i, armornametemp)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 4")
        scr_84_push(parent)
        parent = group
        
        for (var i = 50; i <= 54; i ++)
        {
            scr_armorinfo(i)
            scr_84_add_menu_item(parent, "[armoritem]", i, armornametemp)
        }
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 5")
        scr_84_push(parent)
        parent = group
        
        for (var i = 30; i <= 38; i ++)
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
                repeat(6)
                    scr_itemget(39)
                repeat(2)
                    scr_itemget(38)
                scr_itemget(7)
                repeat(3)
                    scr_itemget(2)
                scr_weaponget(14)
                scr_weaponget(23)
                scr_weaponget(24)
                scr_weaponget(7)
                scr_weaponget(18)
                scr_weaponget(19)
                scr_weaponget(21)
                scr_weaponget(25)
                repeat(4)
                    scr_armorget(22)
                scr_armorget(3)
                scr_armorget(9)
                scr_armorget(13)
                scr_armorget(7)
                scr_armorget(21)
                scr_armorget(23)
                repeat(3)
                    scr_armorget(24)
                repeat(3)
                    scr_armorget(27)
                show_message("Idealized Items/Gear")
            }
        }, 0, "Idealize Items/Gear")
        
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
        scr_84_add_menu_item(parent, "[roomdark]", room_lerptest, "room_lerptest")
        scr_84_add_menu_item(parent, "[roomdark]", room_rhythmgame_editor, "room_rhythmgame_editor")
        scr_84_add_menu_item(parent, "[roomdark]", room_bullettest_new, "room_bullettest_new")
        scr_84_add_menu_item(parent, "[roomdark]", room_animexampletest, "room_animexampletest")
        scr_84_add_menu_item(parent, "[roomdark]", room_climbtest, "room_climbtest")
        scr_84_add_menu_item(parent, "[roomdark]", room_darkbulbTest, "room_darkbulbTest")
        scr_84_add_menu_item(parent, "[roomdark]", room_towery_tester, "room_towery_tester")
        scr_84_add_menu_item(parent, "[roomdark]", room_animtest, "room_animtest")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_shadowplatformTest, "room_dw_fcastle_shadowplatformTest")
        scr_84_add_menu_item(parent, "[roomplat]", room_plat_lab, "room_plat_lab")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_flowerclimb_for_tiling, "room_dw_fcastle_flowerclimb_for_tiling")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_petaltest, "room_dw_petaltest")
        scr_84_add_menu_item(parent, "[roomdark]", room_floortex_test, "room_floortex_test")
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
        scr_84_add_menu_item(parent, "[room]", room_lw_noellehouse_dess, "room_lw_noellehouse_dess")
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
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_rhythm, "room_dw_rhythm")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_rhythm_countdown, "room_dw_rhythm_countdown")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_church_entrance, "room_dw_castle_church_entrance")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_church_climb, "room_dw_castle_church_climb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_ralsei_castle_basketball, "room_dw_ralsei_castle_basketball")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_music, "room_dw_castle_music")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_tv_mike, "room_dw_castle_tv_mike")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_castle_tv_kikky, "room_dw_castle_tv_kikky")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Garden")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_intro, "room_dw_garden_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_meetflowery, "room_dw_garden_meetflowery")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_video, "room_dw_garden_video")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_ralseicupboard, "room_dw_garden_ralseicupboard")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_floradinnencounter, "room_dw_garden_floradinnencounter")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_hospital, "room_dw_garden_hospital")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_fishingspot, "room_dw_garden_fishingspot")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_mushrooms, "room_dw_garden_mushrooms")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_shearydodge, "room_dw_garden_shearydodge")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_hopschef, "room_dw_garden_hopschef")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_riverchest, "room_dw_garden_riverchest")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_enemyrush, "room_dw_garden_enemyrush")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_pedestal, "room_dw_garden_pedestal")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_shearyguide, "room_dw_garden_shearyguide")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_flowerygardening, "room_dw_garden_flowerygardening")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_firstdash, "room_dw_garden_firstdash")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_platshortcut, "room_dw_garden_platshortcut")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_starwalkerdash, "room_dw_garden_starwalkerdash")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_diner, "room_dw_garden_diner")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_newdash, "room_dw_garden_newdash")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_hardpressureplates, "room_dw_garden_hardpressureplates")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_susiechase, "room_dw_garden_susiechase")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_aquatransition, "room_dw_garden_aquatransition")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_aquadash, "room_dw_garden_aquadash")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_garden_aquadash_plat, "room_dw_garden_aquadash_plat")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_wateringcan_aqua, "room_dw_garden_wateringcan_aqua")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_aqua, "room_dw_garden_aqua")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_aquadarkness, "room_dw_garden_aquadarkness")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_aquahole, "room_dw_garden_aquahole")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_aquahole_left, "room_dw_garden_aquahole_left")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_aquashrine, "room_dw_garden_aquashrine")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_garden_aquaplatforming, "room_dw_garden_aquaplatforming")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_finalplatforming, "room_dw_garden_finalplatforming")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_finalplatforming_right, "room_dw_garden_finalplatforming_right")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_garden_cliffexit, "room_dw_garden_cliffexit")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Cliffs")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_gardentransition_new, "room_dw_cliff_gardentransition_new")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_climbrefresher, "room_dw_cliff_climbrefresher")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_cutdown_tutorial, "room_dw_cliff_cutdown_tutorial")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_precipice, "room_dw_cliff_precipice")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_bunnyfarm, "room_dw_cliff_bunnyfarm")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_silver_hammer, "room_dw_cliff_silver_hammer")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_twirlflowerplatforming, "room_dw_cliff_twirlflowerplatforming")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_yellowcave, "room_dw_cliff_yellowcave")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_dash_runner, "room_dw_cliff_dash_runner")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_seth_miniboss, "room_dw_cliff_seth_miniboss")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_shop, "room_dw_cliff_shop")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_kawkawdash, "room_dw_cliff_kawkawdash")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_twirlflowerwind, "room_dw_cliff_twirlflowerwind")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_bonuscombat, "room_dw_cliff_bonuscombat")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_netskieclimb, "room_dw_cliff_netskieclimb")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_netskieclimb_behind, "room_dw_cliff_netskieclimb_behind")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_finaldash, "room_dw_cliff_finaldash")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_cliff_verticalwind, "room_dw_cliff_verticalwind")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_cliff_eastcliff, "room_dw_cliff_eastcliff")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_shicave, "room_dw_cliff_shicave")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_verticalwind_post, "room_dw_cliff_verticalwind_post")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_cliff_sethaqua_battle, "room_dw_cliff_sethaqua_battle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_dogballoon, "room_dw_dogballoon")
        scr_84_add_menu_item(parent, "[roomdark]", room_man, "room_man")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Flower Castle")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_entrance, "room_dw_fcastle_entrance")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_partyjail, "room_dw_fcastle_partyjail")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_post_party_jail, "room_dw_fcastle_post_party_jail")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_foyer, "room_dw_fcastle_foyer")
        
        // Left path
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Left Path")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_shinobeetle_encounter, "room_dw_fcastle_shinobeetle_encounter")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_left_wing_floweryscene, "room_dw_fcastle_left_wing_floweryscene")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_bounce_1, "room_dw_fcastle_bounce_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_left_twodoors, "room_dw_fcastle_left_twodoors")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_yellow_miniboss, "room_dw_fcastle_yellow_miniboss")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_sandtrap, "room_dw_fcastle_sandtrap")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_zenlooker, "room_dw_fcastle_zenlooker")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_dangerous_platforming, "room_dw_fcastle_dangerous_platforming")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_fcastle_bounce_3, "room_dw_fcastle_bounce_3")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_blueroom, "room_dw_fcastle_blueroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_left_penultimate, "room_dw_fcastle_left_penultimate")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_shinobeetle_3d, "room_dw_fcastle_shinobeetle_3d")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_yellowjail, "room_dw_fcastle_yellowjail")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_onsen, "room_dw_fcastle_onsen")
        parent = scr_84_pop()
        
        // Right path
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Right Path")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_cafe, "room_dw_fcastle_cafe")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_terracotta_encounter, "room_dw_fcastle_terracotta_encounter")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_terracotta_bonus, "room_dw_fcastle_terracotta_bonus")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_terracotta_puzzle, "room_dw_fcastle_terracotta_puzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_fusumadodge, "room_dw_fcastle_fusumadodge")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_right_wing_floweryscene, "room_dw_fcastle_right_wing_floweryscene")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_right_puzzle, "room_dw_fcastle_right_puzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_orange_puppet_introduction, "room_dw_fcastle_orange_puppet_introduction")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_fcastle_gloves_tower, "room_dw_fcastle_gloves_tower")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_fcastle_trainroom, "room_dw_fcastle_trainroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_second_diner, "room_dw_fcastle_second_diner")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_foxhunt, "room_dw_fcastle_foxhunt")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_foxhunt_terakota, "room_dw_fcastle_foxhunt_terakota")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_foxhunt_socks, "room_dw_fcastle_foxhunt_socks")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_foxhunt_chaos, "room_dw_fcastle_foxhunt_chaos")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_foxhunt_secret, "room_dw_fcastle_foxhunt_secret")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_obscured_bullets, "room_dw_fcastle_obscured_bullets")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_sidepuzzle, "room_dw_fcastle_sidepuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_right_penultimate, "room_dw_fcastle_right_penultimate")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_heldmushrooms, "room_dw_fcastle_heldmushrooms")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_green_orange_battle, "room_dw_fcastle_green_orange_battle")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_right_endingscene, "room_dw_fcastle_right_endingscene")
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_asgore, "room_dw_fcastle_asgore")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Flower Castle - Top")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_top_intro, "room_dw_fcastle_top_intro")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_top_entrance, "room_dw_fcastle_top_entrance")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_seth_encounter, "room_dw_fcastle_seth_encounter")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_yellowblue, "room_dw_fcastle_yellowblue")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_top_staircase_1, "room_dw_fcastle_top_staircase_1")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_ultradash, "room_dw_fcastle_ultradash")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_top_staircase_2, "room_dw_fcastle_top_staircase_2")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_green_checkpoint, "room_dw_fcastle_green_checkpoint")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_fcastle_top_ascent, "room_dw_fcastle_top_ascent")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_fcastle_orange_gauntlet, "room_dw_fcastle_orange_gauntlet")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_final_save, "room_dw_fcastle_final_save")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_flowery, "room_dw_fcastle_flowery")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_fcastle_top_challenge, "room_dw_fcastle_top_challenge")
        scr_84_add_menu_item(parent, "[roomplat]", room_dogplatforming, "room_dogplatforming")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_bromides, "room_dw_fcastle_bromides")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_fcastle_top_descent, "room_dw_fcastle_top_descent")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_top_pinkdoor, "room_dw_fcastle_top_pinkdoor")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_pinkroom, "room_dw_fcastle_pinkroom")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_pink_encounter, "room_dw_pink_encounter")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_fcastle_pinkshop, "room_dw_fcastle_pinkshop")
        
        // Flowery Battle
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_fcastle_flowerclimb, "room_dw_fcastle_flowerclimb")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_fcastle_flowerydash, "room_dw_fcastle_flowerydash")
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_post_flowery_battle, "room_dw_post_flowery_battle")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_fcastle_top_fountain, "room_dw_fcastle_top_fountain")
        scr_84_add_menu_item(parent, "[roomplat]", room_dw_post_fountain_close, "room_dw_post_fountain_close")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_flowery_tree, "room_dw_flowery_tree")
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Special")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", room_intro_ch5, "room_intro_ch5")
        scr_84_add_menu_item(parent, "[room]", PLACE_DOG, "PLACE_DOG")
        scr_84_add_menu_item(parent, "[room]", room_legend, "room_legend")
        scr_84_add_menu_item(parent, "[room]", room_legend_neo, "room_legend_neo")
        scr_84_add_menu_item(parent, "[room]", room_shop1, "room_shop1")
        scr_84_add_menu_item(parent, "[room]", room_shop_music, "room_shop_music")
        scr_84_add_menu_item(parent, "[room]", room_gameover, "room_gameover")
        scr_84_add_menu_item(parent, "[room]", PLACE_LOGO, "PLACE_LOGO")
        scr_84_add_menu_item(parent, "[room]", PLACE_FAILURE, "PLACE_FAILURE")
        scr_84_add_menu_item(parent, "[room]", PLACE_NAMING_JIKKEN, "PLACE_NAMING_JIKKEN")
        scr_84_add_menu_item(parent, "[room]", PLACE_MENU, "PLACE_MENU")
        scr_84_add_menu_item(parent, "[room]", room_ed, "room_ed")
        scr_84_add_menu_item(parent, "[room]", PLACE_DOGCHECK2, "PLACE_DOGCHECK2")
        scr_84_add_menu_item(parent, "[room]", room_chapter_continue, "room_chapter_continue")
        scr_84_add_menu_item(parent, "[room]", PLACE_DOGCHECK_CH5, "PLACE_DOGCHECK_CH5")
        scr_84_add_menu_item(parent, "[room]", room_shop_ch5, "room_shop_ch5")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Unused")
        scr_84_push(parent)
        parent = group
        
        scr_84_add_menu_item(parent, "[room]", room_empty, "room_empty")
        scr_84_add_menu_item(parent, "[roomdark]", room_DARKempty, "room_DARKempty")
        scr_84_add_menu_item(parent, "[roomdark]", room_DARKbase_GMS2, "room_DARKbase_GMS2")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_clover, "room_cc_clover")
        scr_84_add_menu_item(parent, "[roomdark]", room_cc_lancer, "room_cc_lancer")
        scr_84_add_menu_item(parent, "[roomdark]", room_dw_rhythm_empty, "room_dw_rhythm_empty")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Unsorted Full List")
        scr_84_push(parent)
        parent = group
        
        for (var rooms = 0; rooms <= room_last; rooms++)
            scr_84_add_menu_item(parent, "[roomgeneric]", rooms, room_get_name(rooms))
        
        parent = scr_84_pop()
        parent = scr_84_pop()
        
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Options")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[toggle_global_saveto_ini]", "chemg_god_mode", "God Mode")
        
        scr_84_add_menu_item(parent, { 
            action: function()
            {
                if (instance_exists(obj_platswap))
                {
                    with (obj_platswap)
                        event_user(0);
                }
                else
                {
                    scr_debug_print("This room doesn't support platformer mode");
                    snd_play(snd_cantselect);
                }
            }, 
            draw_text: function(item, name)
            {
                if (!instance_exists(obj_platswap))
                {
                    draw_set_color(c_gray);
                    return name + ": UNAVAILABLE"
                }
                else
                {
                    return name + ": " + (obj_platswap.mode ? "ON" : "OFF")
                }
            }
        }, "", "Platformer Mode")
        
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 3")
        scr_84_push(parent)
        parent = group
        
        for (var i = 54; i <= 61; i ++)
        {
            scr_recruit_info(i)
            if !string_starts_with(_name, "Known Quantity ") // don't add recruits with no data
                scr_84_add_menu_item(parent, "[flagset]", 600 + i, _name)
        }
        
        scr_84_add_menu_item(parent, "[recruitall]", 3, "Recruit All")
        scr_84_add_menu_item(parent, "[recruitremove]", 3, "Remove All")
        scr_84_add_menu_item(parent, "[recruitlose]", 3, "LOSE All")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 4")
        scr_84_push(parent)
        parent = group
        
        for (var i = 62; i <= 69; i ++)
        {
            scr_recruit_info(i)
            if !string_starts_with(_name, "Known Quantity ") // don't add recruits with no data
                scr_84_add_menu_item(parent, "[flagset]", 600 + i, _name)
        }
        
        scr_84_add_menu_item(parent, "[recruitall]", 4, "Recruit All")
        scr_84_add_menu_item(parent, "[recruitremove]", 4, "Remove All")
        scr_84_add_menu_item(parent, "[recruitlose]", 4, "LOSE All")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 5")
        scr_84_push(parent)
        parent = group
        
        for (var i = 70; i <= 77; i ++)
        {
            scr_recruit_info(i)
            if !string_starts_with(_name, "Known Quantity ") // don't add recruits with no data
                scr_84_add_menu_item(parent, "[flagset]", 600 + i, _name)
        }
        
        scr_84_add_menu_item(parent, "[recruitall]", 5, "Recruit All")
        scr_84_add_menu_item(parent, "[recruitremove]", 5, "Remove All")
        scr_84_add_menu_item(parent, "[recruitlose]", 5, "LOSE All")
        parent = scr_84_pop()
        
        scr_84_add_menu_item(parent, "[recruitall]", 8, concat("Recruit All (Chapter 2 - Chapter ", global.chapter, ")"))
        scr_84_add_menu_item(parent, "[recruitremove]", 8, concat("Remove All (Chapter 2 - Chapter ", global.chapter, ")"))
        scr_84_add_menu_item(parent, "[recruitlose]", 8, concat("LOSE All (Chapter 2 - Chapter ", global.chapter, ")"))
        
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
                global.maxhp[1] = 272
                global.hp[1] = 272
                global.at[1] = 18
                global.df[1] = 2
                global.mag[1] = 0
                
                // susie
                global.maxhp[2] = 330
                global.hp[2] = 330
                global.at[2] = 23
                global.df[2] = 2
                global.mag[2] = 4
                
                // ralsei
                global.maxhp[3] = 242
                global.hp[3] = 242
                global.at[3] = 16
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
        }, "", "Idealize Stats")
        
        for (var i = 0; i < 3; i ++)
        {
            scr_84_add_menu_item(parent, "[setmember]", i, concat("Party Member ", (i + 1)))
        }
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Quick Plot Warps")
        scr_84_push(parent)
        parent = group
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Pre-Dark World")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 0, "Chapter Start")
        scr_84_add_menu_item(parent, "[warp]", 1, "Entering Castle Town")
        scr_84_add_menu_item(parent, "[warp]", 2, "Castle Town (Pre-Susie)")
        scr_84_add_menu_item(parent, "[warp]", 3, "Castle Town (Post-Susie)")
        scr_84_add_menu_item(parent, "[warp]", 4, "Mike Room Scene 1")
        scr_84_add_menu_item(parent, "[warp]", 5, "Mike Room Scene 2 (With Tenna)")
        scr_84_add_menu_item(parent, "[warp]", 6, "Mike Room Scene 2 (No Tenna)")
        scr_84_add_menu_item(parent, "[warp]", 7, "Meeting Up With Noelle")
        scr_84_add_menu_item(parent, "[warp]", 8, "Festival")
        scr_84_add_menu_item(parent, "[warp]", 9, "Beach Scene")
        scr_84_add_menu_item(parent, "[warp]", 10, "Dark World is Created")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Garden")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 11, "Dark World Entrance")
        scr_84_add_menu_item(parent, "[warp]", 11.5, "Meeting Ralsei")
        scr_84_add_menu_item(parent, "[warp]", 12, "Garden of Hopes and Dreams")
        scr_84_add_menu_item(parent, "[warp]", 13, "Flowery Joins the Party")
        scr_84_add_menu_item(parent, "[warp]", 14, "Diner")
        scr_84_add_menu_item(parent, "[warp]", 15, "Pressure Plate Puzzles")
        scr_84_add_menu_item(parent, "[warp]", 16, "Flowery Solves the Puzzle")
        scr_84_add_menu_item(parent, "[warp]", 17, "Flowery Tells the Party to Leave")
        scr_84_add_menu_item(parent, "[warp]", 18, "Aqua Battle")
        scr_84_add_menu_item(parent, "[warp]", 19, "Get Petal Feather")
        scr_84_add_menu_item(parent, "[warp]", 20, "Encountering Asgore")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Cliff")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 21, "Cliff Entrance")
        scr_84_add_menu_item(parent, "[warp]", 22, "Seth and Aqua Cutscene")
        scr_84_add_menu_item(parent, "[warp]", 23, "Seth and Aqua Miniboss")
        scr_84_add_menu_item(parent, "[warp]", 24, "Shop")
        scr_84_add_menu_item(parent, "[warp]", 25, "Vertical Wind Room")
        scr_84_add_menu_item(parent, "[warp]", 26, "Seth and Aqua Battle")
        scr_84_add_menu_item(parent, "[warp]", 27, "Asgore Throws Kris and Susie Out")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Flower Castle (Main)")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 28, "Jail")
        scr_84_add_menu_item(parent, "[warp]", 29, "Foyer (Neither Side Finished)")
        scr_84_add_menu_item(parent, "[warp]", 30, "Cafe")
        scr_84_add_menu_item(parent, "[warp]", 38, "Foyer (Right Side Finished)")
        scr_84_add_menu_item(parent, "[warp]", 49, "Foyer (Left Side Finished)")
        scr_84_add_menu_item(parent, "[warp]", 50, "Foyer (Both Sides Finished)")
        scr_84_add_menu_item(parent, "[warp]", 51, "Asgore Climb")
        scr_84_add_menu_item(parent, "[warp]", 52, "The Flowers Resolve to Stop You")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Flower Castle (Right)")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 31, "Asgore Scene")
        scr_84_add_menu_item(parent, "[warp]", 32, "Meeting Orange")
        scr_84_add_menu_item(parent, "[warp]", 33, "Green Encounter")
        scr_84_add_menu_item(parent, "[warp]", 34, "Cafe (After Green Encounter)")
        scr_84_add_menu_item(parent, "[warp]", 35, "Seth and Orange Battle")
        scr_84_add_menu_item(parent, "[warp]", 36, "Green and Orange Battle")
        scr_84_add_menu_item(parent, "[warp]", 37, "Susie Leaves and You Can Think About Ralsei")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Flower Castle (Left)")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 39, "Asgore Cutscene")
        scr_84_add_menu_item(parent, "[warp]", 40, "Yellow Miniboss")
        scr_84_add_menu_item(parent, "[warp]", 41, "Yellow at the Yellow Door")
        scr_84_add_menu_item(parent, "[warp]", 42, "Yellow Goes to Kill Himself")
        scr_84_add_menu_item(parent, "[warp]", 43, "Yellow Laser Gun Miniboss")
        scr_84_add_menu_item(parent, "[warp]", 44, "Meeting Blue")
        scr_84_add_menu_item(parent, "[warp]", 45, "Blue Finds the Bloody Hole")
        scr_84_add_menu_item(parent, "[warp]", 46, "Blue and Yellow Battle")
        scr_84_add_menu_item(parent, "[warp]", 47, "Blue and Yellow Battle (With All Evidence)")
        scr_84_add_menu_item(parent, "[warp]", 48, "Post-Battle Talk With Susie or Ralsei")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Flower Castle (Top)")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 53, "Starting Room")
        scr_84_add_menu_item(parent, "[warp]", 54, "Seth Encounter")
        scr_84_add_menu_item(parent, "[warp]", 55, "Yellow and Blue Encounter")
        scr_84_add_menu_item(parent, "[warp]", 56, "Flowery Talk 1")
        scr_84_add_menu_item(parent, "[warp]", 57, "Aqua Encounter")
        scr_84_add_menu_item(parent, "[warp]", 58, "Flowery and Ralsei Talk")
        scr_84_add_menu_item(parent, "[warp]", 59, "Green Checkpoint")
        scr_84_add_menu_item(parent, "[warp]", 60, "Green Checkpoint (No Cutscene)")
        scr_84_add_menu_item(parent, "[warp]", 61, "Descent to Pink's Room")
        scr_84_add_menu_item(parent, "[warp]", 62, "Outside Pink's Room (With Mystery Key)")
        scr_84_add_menu_item(parent, "[warp]", 63, "Pink's Room")
        scr_84_add_menu_item(parent, "[warp]", 64, "Pink Battle")
        scr_84_add_menu_item(parent, "[warp]", 66, "Pink's Room (Post-Battle)")
        scr_84_add_menu_item(parent, "[warp]", 67, "Final Flower Encounter Gauntlet")
        scr_84_add_menu_item(parent, "[warp]", 68, "Final Save Point")
        scr_84_add_menu_item(parent, "[warp]", 69, "Flowery Pre-Battle Talk")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Finale")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 70, "Flowery Battle")
        scr_84_add_menu_item(parent, "[warp]", 70.5, "Flowery Battle Towery Climb")
        scr_84_add_menu_item(parent, "[warp]", 71, "Flowery Battle Finale")
        scr_84_add_menu_item(parent, "[warp]", 72, "Post-Flowery Battle Scene")
        scr_84_add_menu_item(parent, "[warp]", 73, "Flowers Revert to Normal Flowers")
        scr_84_add_menu_item(parent, "[warp]", 74, "Fountain")
        scr_84_add_menu_item(parent, "[warp]", 75, "Flowery VS. The Knight")
        scr_84_add_menu_item(parent, "[warp]", 76, "Flowery Dies")
        scr_84_add_menu_item(parent, "[warp]", 77, "Second Fountain Sealing")
        scr_84_add_menu_item(parent, "[warp]", 78, "Back in the Light World")
        scr_84_add_menu_item(parent, "[warp]", 79, "Leaving Flower King")
        scr_84_add_menu_item(parent, "[warp]", 80, "Susie Entering Castle Town")
        scr_84_add_menu_item(parent, "[warp]", 81, "Credits")
        parent = scr_84_pop()
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Weird Route")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[warp]", 82, "Weird Route Opening")
        scr_84_add_menu_item(parent, "[warp]", 83, "Weird Route Opening (No Cutscene)")
        scr_84_add_menu_item(parent, "[warp]", 84, "Meeting Susie")
        scr_84_add_menu_item(parent, "[warp]", 85, "Festival With Susie")
        scr_84_add_menu_item(parent, "[warp]", 86, "Festival With Susie (Post-Ice Cream)")
        scr_84_add_menu_item(parent, "[warp]", 87, "Beach Scene")
        scr_84_add_menu_item(parent, "[warp]", 88, "Beach Scene (Post-Aborting Route)")
        scr_84_add_menu_item(parent, "[warp]", 89, "Meeting Ralsei (Aborted Route Version)")
        scr_84_add_menu_item(parent, "[warp]", 90, "Post-Blue and Yellow Battle Talk With Susie or Ralsei (Aborted Route Version)")
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
                else if (choice == "[flowerydollars]")
                {
                    global.flag[1411] = max(0, global.flag[1411] + choice_data)
                }
                else if (choice == "[pinkcoins]")
                {
                    global.flag[1312] = max(0, global.flag[1312] + choice_data)
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
                        
                        // destroy party member object in targeted slot (not if the member being chosen is kris)
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
                    
                    // set if event should be in the dark world or not (just done here instead of in every defined warp for convenience)
                    if choice_data == 0 || (choice_data > 6 && choice_data < 11) || (choice_data > 77 && choice_data < 89)
                        global.darkzone = 0
                    else
                        global.darkzone = 1
                    
                    // hat ralsei
                    if choice_data > 11.5 && choice_data < 20
                        global.flag[1311] = 1
                    else
                        global.flag[1311] = 0
                    
                    // garden of hopes and dreams logo
                    if choice_data > 12 && choice_data < 82
                        global.flag[1306] = 1
                    
                    // set if the player can enter platforming mode
                    if (choice_data > 19 && choice_data < 82) || (choice_data >= 89 && choice_data <= 90)
                        global.flag[24] = 1
                    else
                        global.flag[24] = 0
                    
                    // set left and right sides of the castle as completed
                    if choice_data > 50 && choice_data < 82
                    {
                        global.flag[1454] = 100
                        global.flag[1455] = 100
                    }
                    
                    // set weird route active flags
                    if choice_data >= 82 && choice_data <= 90
                    {
                        global.flag[916] = 0
                        global.flag[915] = 20
                        global.flag[349] = 1 // berdly frozen
                        global.flag[457] = 0 // berdly spared
                        if choice_data > 87 // aborted route events
                        {
                            global.flag[916] = 1
                            global.flag[1743] = 1
                        }
                    }
                    
                    snd_free_all()
                    
                    switch choice_data
                    {
                        case 0: // chapter start
                            global.flag[1324] = 0
                            global.plot = 0
                            roomtogo = room_krisroom
                            break
                        
                        case 1: // entering castle town
                            global.flag[1324] = 0
                            global.plot = 10
                            roomtogo = room_dw_castle_area_1
                            break
                            
                        case 2: // castle town (pre-susie)
                            scr_setparty(0, 1, 0)
                            global.plot = 50
                            roomtogo = room_dw_castle_town
                            break
                            
                        case 3: // castle town (post-susie)
                            scr_setparty(1, 1, 0)
                            global.plot = 60
                            roomtogo = room_dw_castle_town
                            break
                            
                        case 4: // mike room scene 1
                            scr_setparty(0, 0, 0)
                            global.plot = 60
                            global.flag[1771] = 1
                            roomtogo = room_dw_castle_tv_mike
                            break
                            
                        case 5: // mike room scene 2 (with tenna)
                            scr_setparty(0, 0, 0)
                            global.plot = 60
                            global.flag[1771] = 2
                            global.flag[779] = 0
                            roomtogo = room_dw_castle_tv_mike
                            break
                            
                        case 6: // mike room scene 2 (no tenna)
                            scr_setparty(0, 0, 0)
                            global.plot = 60
                            global.flag[1771] = 2
                            global.flag[779] = 2
                            roomtogo = room_dw_castle_tv_mike
                            break
                        
                        case 7: // meeting up with noelle
                            scr_setparty(1, 0, 0)
                            global.flag[1324] = 1
                            global.plot = 100
                            roomtogo = room_town_school
                            break
                        
                        case 8: // festival
                            scr_setparty(1, 0, 1)
                            global.flag[1324] = 1
                            global.plot = 105
                            roomtogo = room_town_south
                            break
                        
                        case 9: // beach scene
                            scr_setparty(1, 0, 1)
                            global.flag[1324] = 2
                            global.plot = 150
                            roomtogo = room_beach
                            break
                                                    
                        case 10: // dark world is created
                            scr_setparty(1, 0, 0)
                            global.flag[1324] = 2
                            global.plot = 190
                            roomtogo = room_town_north
                            break
                            
                        case 11: // dark world entrance
                            scr_setparty(1, 0, 0)
                            global.plot = 190
                            roomtogo = room_dw_garden_intro
                            break
                        
                        case 11.5: // meeting ralsei
                            scr_setparty(1, 0, 0)
                            global.plot = 210
                            roomtogo = room_dw_garden_ralseicupboard
                            break
                            
                        case 12: // garden of hopes and dreams
                            scr_setparty(1, 1, 0)
                            global.flag[1410] = 1
                            global.plot = 230
                            roomtogo = room_dw_garden_floradinnencounter
                            break
                            
                        case 13: // flowery joins the party
                            scr_setparty(1, 1, 0)
                            //global.tempflag[90] = 0.12 // setting this makes it start the scene automatically but there's also a debug key to do that so i'll just leave it disabled 
                            global.plot = 230
                            global.interact = 3
                            global.entrance = 2
                            roomtogo = room_dw_garden_enemyrush
                            break
                            
                        case 14: // diner
                            scr_setparty(1, 1, 0)
                            global.plot = 254
                            global.interact = 3
                            global.entrance = 1
                            roomtogo = room_dw_garden_diner
                            break
                            
                        case 15: // pressure plate puzzles
                            scr_setparty(1, 1, 0)
                            global.plot = 255
                            roomtogo = room_dw_garden_hardpressureplates
                            break
                            
                        case 16: // flowery solves the puzzle
                            scr_setparty(0, 1, 0)
                            global.plot = 265
                            global.entrance = 3
                            global.interact = 3
                            roomtogo = room_dw_garden_hardpressureplates
                            break
                            
                        case 17: // flowery tells the party to leave
                            scr_setparty(1, 1, 0)
                            global.plot = 270
                            global.interact = 3
                            global.entrance = 2
                            roomtogo = room_dw_garden_aquadash
                            break
                            
                        case 18: // aqua battle
                            scr_setparty(1, 1, 0)
                            global.plot = 280
                            roomtogo = room_dw_garden_aqua
                            break
                            
                        case 19: // get petal feather
                            scr_setparty(1, 1, 0)
                            global.plot = 292
                            roomtogo = room_dw_garden_aquashrine
                            break
                            
                        case 20: // encountering asgore
                            scr_setparty(1, 1, 0)
                            global.plot = 295
                            roomtogo = room_dw_garden_cliffexit
                            break
                            
                        case 21: // cliff entrance
                            scr_setparty(1, 1, 0)
                            global.plot = 300
                            roomtogo = room_dw_cliff_gardentransition_new
                            break
                            
                        case 22: // aqua and seth cutscene
                            scr_setparty(1, 1, 0)
                            global.plot = 306
                            roomtogo = room_dw_cliff_cutdown_tutorial
                            break
                            
                        case 23: // seth and aqua miniboss
                            scr_setparty(1, 1, 0)
                            global.plot = 320
                            global.start_in_platmode = 1
                            global.entrance = 1
                            global.interact = 3
                            roomtogo = room_dw_cliff_seth_miniboss
                            break
                        
                        case 24: // shop
                            scr_setparty(1, 1, 0)
                            global.plot = 321
                            roomtogo = room_dw_cliff_shop
                            break
                            
                        case 25: // vertical wind room
                            scr_setparty(1, 1, 0)
                            global.plot = 340
                            global.start_in_platmode = 1
                            roomtogo = room_dw_cliff_verticalwind
                            break
                            
                        case 26: // seth and aqua battle
                            scr_setparty(1, 1, 0)
                            global.plot = 350
                            roomtogo = room_dw_cliff_sethaqua_battle
                            break
                            
                        case 27: // asgore throws kris and susie out
                            scr_setparty(1, 1, 0)
                            global.plot = 360
                            roomtogo = room_dw_fcastle_entrance
                            break
                            
                        case 28: // jail
                            scr_setparty(1, 0, 0)
                            global.plot = 390
                            roomtogo = room_dw_fcastle_partyjail
                            break
                            
                        case 29: // foyer (neither side finished)
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 0
                            global.flag[1455] = 0
                            global.plot = 399
                            global.interact = 7
                            global.entrance = 6
                            roomtogo = room_dw_fcastle_foyer
                            break
                            
                        case 30: // cafe
                            scr_setparty(1, 1, 0)
                            if global.plot < 405
                                global.plot = 405
                            roomtogo = room_dw_fcastle_cafe
                            break
                            
                        case 31: // right path asgore cutscene
                            scr_setparty(1, 1, 0)
                            global.flag[1455] = 5
                            global.plot = 405
                            global.currentsong[0] = snd_init("flower_castle.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            roomtogo = room_dw_fcastle_right_wing_floweryscene
                            break
                            
                        case 32: // meeting orange
                            scr_setparty(1, 1, 0)
                            global.flag[1455] = 10
                            global.plot = 405
                            global.currentsong[0] = snd_init("flower_castle.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            roomtogo = room_dw_fcastle_orange_puppet_introduction
                            break
                            
                        case 33: // green encounter
                            scr_setparty(1, 1, 0)
                            global.flag[1455] = 15
                            global.plot = 405
                            roomtogo = room_dw_fcastle_second_diner
                            break
                            
                        case 34: // cafe (after green encounter)
                            scr_setparty(1, 1, 0)
                            global.flag[1455] = 30
                            global.plot = 405
                            roomtogo = room_dw_fcastle_cafe
                            break
                            
                        case 35: // seth and orange battle
                            scr_setparty(1, 1, 0)
                            global.flag[1455] = 40//45
                            //global.flag[1316] = 1 // makes a shortcut but idk if i should keep it or if people would want it to be "vanilla"
                            global.plot = 405
                            roomtogo = room_dw_fcastle_obscured_bullets
                            break
                            
                        case 36: // green and orange battle
                            scr_setparty(1, 1, 0)
                            global.flag[1455] = 50
                            global.plot = 405
                            roomtogo = room_dw_fcastle_green_orange_battle
                            break
                            
                        case 37: // susie leaves and you can think about ralsei
                            scr_setparty(1, 1, 0)
                            global.flag[1455] = 70
                            global.plot = 405
                            roomtogo = room_dw_fcastle_right_endingscene
                            break
                            
                        case 38: // foyer (right side finished)
                            scr_setparty(1, 1, 0)
                            global.flag[1455] = 100
                            global.plot = 405
                            roomtogo = room_dw_fcastle_foyer
                            break
                            
                        case 39: // left path asgore cutscene
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 0
                            global.plot = 405
                            global.interact = 3
                            global.entrance = 2
                            global.currentsong[0] = snd_init("flower_castle.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            roomtogo = room_dw_fcastle_left_wing_floweryscene
                            break
                            
                        case 40: // yellow miniboss
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 5
                            global.plot = 405
                            global.currentsong[0] = snd_init("flower_castle.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            roomtogo = room_dw_fcastle_yellow_miniboss
                            break
                            
                        case 41: // yellow enters the yellow door
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 10
                            global.plot = 405
                            roomtogo = room_dw_fcastle_left_twodoors
                            break
                        
                        case 42: // yellow goes to kill himself
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 25
                            global.plot = 405
                            roomtogo = room_dw_fcastle_sandtrap
                            break
                        
                        case 43: // yellow laser gun miniboss
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 30
                            global.plot = 405
                            roomtogo = room_dw_fcastle_dangerous_platforming
                            break
                            
                        case 44: // meeting blue
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 35
                            global.plot = 405
                            roomtogo = room_dw_fcastle_blueroom
                            break
                            
                        case 45: // blue finds the bloody hole
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 45
                            global.plot = 405
                            global.interact = 3
                            global.entrance = 1
                            roomtogo = room_dw_fcastle_sandtrap
                            break
                            
                        case 46: // blue and yellow battle
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 52
                            global.plot = 405
                            roomtogo = room_dw_fcastle_yellowjail
                            break
                            
                        case 47: // blue and yellow battle (with all evidence)
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 52
                            
                            if !scr_keyitemcheck(20) // scissors
                                scr_keyitemget(20)
                            if !scr_keyitemcheck(21) // yellowshred
                                scr_keyitemget(21)
                            if !scr_keyitemcheck(22) // bootoil
                                scr_keyitemget(22)
                            if !scr_keyitemcheck(23) // redsplatter
                                scr_keyitemget(23)
                            if !scr_keyitemcheck(26) // perpbook
                                scr_keyitemget(26)
                            if !scr_keyitemcheck(27) // bluestring
                                scr_keyitemget(27)
                            if !scr_keyitemcheck(28) // trainplan
                                scr_keyitemget(28)
                            if !scr_keyitemcheck(2) // egg
                                scr_keyitemget(2)
                            
                            global.plot = 405
                            roomtogo = room_dw_fcastle_yellowjail
                            break
                            
                        case 48: // post-battle talk with susie or ralsei
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 70
                            global.plot = 405
                            roomtogo = room_dw_fcastle_onsen
                            break
                            
                        case 49: // foyer (left side finished)
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 100
                            global.plot = 405
                            roomtogo = room_dw_fcastle_foyer
                            break
                            
                        case 50: // foyer (both sides finished)
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 100
                            global.flag[1455] = 100
                            global.plot = 405
                            roomtogo = room_dw_fcastle_foyer
                            break
                            
                        case 51: // asgore climb
                            scr_setparty(1, 1, 0)
                            global.entrance = 5
                            global.interact = 7
                            global.plot = 430
                            roomtogo = room_dw_fcastle_asgore
                            break
                            
                        case 52: // the flowers resolve to stop you
                            scr_setparty(1, 1, 0)
                            global.plot = 435
                            global.interact = 7
                            global.entrance = 5
                            roomtogo = room_dw_fcastle_top_intro
                            break
                            
                        case 53: // top of castle starting room
                            scr_setparty(1, 1, 0)
                            global.plot = 440
                            roomtogo = room_dw_fcastle_top_entrance
                            break
                            
                        case 54: // seth encounter
                            scr_setparty(1, 1, 0)
                            global.plot = 440
                            roomtogo = room_dw_fcastle_seth_encounter
                            break
                            
                        case 55: // yellow and blue encounter
                            scr_setparty(1, 1, 0)
                            global.plot = 450
                            roomtogo = room_dw_fcastle_yellowblue
                            break
                            
                        case 56: // flowery talk 1
                            scr_setparty(1, 1, 0)
                            global.plot = 455
                            roomtogo = room_dw_fcastle_top_staircase_1
                            break
                            
                        case 57: // aqua encounter
                            scr_setparty(1, 1, 0)
                            global.plot = 460
                            roomtogo = room_dw_fcastle_ultradash
                            break
                            
                        case 58: // flowery and ralsei talk
                            scr_setparty(1, 1, 0)
                            global.plot = 465
                            global.currentsong[0] = snd_init("castle_top.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            roomtogo = room_dw_fcastle_top_staircase_2
                            break
                            
                        case 59: // green checkpoint
                            scr_setparty(1, 1, 0)
                            global.plot = 470
                            roomtogo = room_dw_fcastle_green_checkpoint
                            break
                            
                        case 60: // green checkpoint (no cutscene)
                            scr_setparty(1, 1, 0)
                            global.plot = 473
                            roomtogo = room_dw_fcastle_green_checkpoint
                            break
                            
                        case 61: // descent to pink's room
                            scr_setparty(1, 1, 0)
                            global.start_in_platmode = 1
                            if global.plot < 473
                                global.plot = 473
                            global.currentsong[0] = snd_init("castle_top.ogg")
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
                            roomtogo = room_dw_fcastle_top_descent
                            break
                            
                        case 62: // outside pink's room (with mystery key)
                            scr_setparty(1, 1, 0)
                            global.flag[1846] = 0
                            if !scr_keyitemcheck(32)
                                scr_keyitemget(32)
                            if global.plot < 473
                                global.plot = 473
                            roomtogo = room_dw_fcastle_top_pinkdoor
                            break
                            
                        case 63: // pink's room
                            scr_setparty(1, 1, 0)
                            global.flag[1846] = 1
                            if global.plot < 473
                                global.plot = 473
                            roomtogo = room_dw_fcastle_pinkroom
                            break
                            
                        case 64: // pink battle
                            scr_setparty(1, 1, 0)
                            global.flag[1846] = 1.50
                            if global.plot < 473
                                global.plot = 473
                            roomtogo = room_dw_pink_encounter
                            break
                        
                        // idk where 65 went but i already formatted everything around it not being here lmao oops
                            
                        case 66: // pink's room (post-battle)
                            scr_setparty(1, 1, 0)
                            if global.flag[1846] < 2
                                global.flag[1846] = 2
                            if global.plot < 473
                                global.plot = 473
                            roomtogo = room_dw_fcastle_pinkroom
                            break
                            
                        case 67: // final flower encounter gauntlet
                            scr_setparty(1, 1, 0)
                            global.start_in_platmode = 1
                            global.plot = 473
                            roomtogo = room_dw_fcastle_orange_gauntlet
                            break
                            
                        case 68: // final save point
                            scr_setparty(1, 1, 0)
                            if global.plot < 475
                                global.plot = 475
                            roomtogo = room_dw_fcastle_final_save
                            break
                            
                        case 69: // flowery pre-battle talk
                            scr_setparty(1, 1, 0)
                            global.flag[1877] = 0
                            global.plot = 475
                            roomtogo = room_dw_fcastle_flowery
                            break
                            
                        case 70: // flowery battle
                            scr_setparty(1, 1, 0)
                            global.flag[1877] = 2
                            global.plot = 475
                            roomtogo = room_dw_fcastle_flowery
                            break
                            
                        case 70.5: // flowery battle towery climb
                            scr_setparty(1, 0, 0)
                            global.plot = 475
                            global.batmusic[0] = snd_init("Flowerman_Arrangement.ogg")
                            global.batmusic[1] = mus_loop_ext(global.batmusic[0], 1, 1)
                            roomtogo = room_dw_fcastle_flowerclimb
                            break
                            
                        case 71: // flowery battle finale
                            scr_setparty(1, 0, 0)
                            global.plot = 475
                            global.batmusic[0] = snd_init("Flowerman_Arrangement.ogg")
                            global.batmusic[1] = mus_loop_ext(global.batmusic[0], 1, 1)
                            roomtogo = room_dw_fcastle_flowerydash
                            break
                            
                        case 72: // post-flowery battle scene
                            scr_setparty(1, 1, 0)
                            global.plot = 499
                            roomtogo = room_dw_post_flowery_battle
                            break
                            
                        case 73: // flowers revert to normal flowers
                            scr_setparty(1, 1, 0)
                            global.plot = 500
                            roomtogo = room_dw_post_flowery_battle
                            break
                            
                        case 74: // fountain
                            scr_setparty(1, 1, 0)
                            global.plot = 510
                            roomtogo = room_dw_fcastle_top_fountain
                            break
                            
                        case 75: // flowery vs the knight
                            scr_setparty(1, 1, 0)
                            global.plot = 510
                            roomtogo = room_dw_post_fountain_close
                            break
                            
                        case 76: // flowery dies
                            scr_setparty(1, 1, 0)
                            global.plot = 510
                            roomtogo = room_dw_flowery_tree
                            break
                            
                        case 77: // second fountain sealing
                            scr_setparty(1, 0, 0)
                            global.plot = 510
                            roomtogo = room_cc_fountain
                            break
                            
                        case 78: // back in the light world
                            scr_setparty(1, 0, 0)
                            global.plot = 550
                            roomtogo = room_flowershop_2f
                            break
                            
                        case 79: // leaving flower king
                            scr_setparty(0, 0, 0)
                            global.flag[1324] = 3
                            global.plot = 560
                            roomtogo = room_town_north
                            break
                            
                        case 80: // susie entering castle town
                            scr_setparty(1, 0, 0)
                            global.flag[1324] = 3
                            global.plot = 570
                            roomtogo = room_schooldoor
                            break
                            
                        case 81: // credits
                            scr_setparty(0, 0, 0)
                            global.flag[1324] = 3
                            global.plot = 580
                            roomtogo = room_ed
                            break
                            
                        case 82: // weird route opening
                            scr_setparty(0, 0, 0)
                            global.flag[1324] = 2
                            global.plot = 0
                            roomtogo = room_krisroom
                            break
                            
                        case 83: // weird route opening (no cutscene)
                            scr_setparty(0, 0, 0)
                            global.flag[1324] = 2
                            global.plot = 5
                            roomtogo = room_krisroom
                            break
                            
                        case 84: // meeting susie
                            scr_setparty(0, 0, 0)
                            global.flag[1324] = 2
                            global.plot = 5
                            roomtogo = room_town_krisyard
                            break
                            
                        case 85: // festival with susie
                            scr_setparty(1, 0, 0)
                            global.flag[1324] = 2
                            
                            global.currentsong[0] = snd_init("happy_town.ogg") // play here since the normal festival theme plays otherwise
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.8, 1)
                            
                            global.plot = 105
                            roomtogo = room_town_krisyard
                            break
                            
                        case 86: // festival with susie (post-ice cream)
                            scr_setparty(1, 0, 0)
                            global.flag[1324] = 2
                            
                            global.currentsong[0] = snd_init("happy_town.ogg") // play here since the normal festival theme plays otherwise
                            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.8, 1)
                            
                            global.plot = 150
                            roomtogo = room_town_north
                            break
                            
                        case 87: // beach scene
                            scr_setparty(0, 0, 0)
                            global.flag[1324] = 2
                            global.plot = 160
                            roomtogo = room_beach
                            break
                            
                        case 88: // beach scene (post-aborting route)
                            scr_setparty(0, 0, 0)
                            global.flag[1324] = 2
                            global.plot = 189
                            roomtogo = room_beach
                            break
                            
                        case 89: // meeting ralsei (aborted route version)
                            scr_setparty(1, 0, 0)
                            global.plot = 210
                            roomtogo = room_dw_garden_ralseicupboard
                            break
                            
                        case 90: // post-blue and yellow battle talk with susie or ralsei (aborted route version)
                            scr_setparty(1, 1, 0)
                            global.flag[1454] = 70
                            global.plot = 405
                            roomtogo = room_dw_fcastle_onsen
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
            ft[array_length_1d(ft)] = "intro"
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
