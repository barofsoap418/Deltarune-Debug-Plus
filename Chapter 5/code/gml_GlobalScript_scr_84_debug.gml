function scr_84_debug(arg0)
{
    var process = argument0
    if (!variable_global_exists("chemg_menu_depth"))
    {
        global.chemg_menu_indices = array_create(0)
        global.chemg_menu_indices[0] = 0
        global.chemg_menu_depth = 0
        ossafe_ini_open("DebugPlus.ini")
        global.chemg_god_mode = ini_read_real("AshleysDebug", "global.chemg_god_mode", 0)
        global.chemg_show_room = ini_read_real("AshleysDebug", "global.chemg_show_room", 1)
        global.chemg_show_val = ini_read_real("AshleysDebug", "global.chemg_show_val", 1)
        global.chemg_show_plot = ini_read_real("AshleysDebug", "global.chemg_show_plot", 1)
        global.chemg_show_encounterno = ini_read_real("AshleysDebug", "global.chemg_show_encounterno", 0)
        global.chemg_show_interact = ini_read_real("AshleysDebug", "global.chemg_show_interact", 0)
        global.chemg_show_entrance = ini_read_real("AshleysDebug", "global.chemg_show_entrance", 0)
        global.chemg_show_fps = ini_read_real("AshleysDebug", "global.chemg_show_fps", 0)
        ossafe_ini_close()
        global.chemg_font_test = false
        var parent = ds_list_create()
        show_debug_message("init debug")
        var group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Money")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[setgold]", 0, "Set D$")
        scr_84_add_menu_item(parent, "[setgoldlight]", 0, "Set $")
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
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Items")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[idealitem]", 0, "Idealize Items/Gear")
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 5")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[item]", 40, "PunchBowl")
        scr_84_add_menu_item(parent, "[item]", 41, "Flavigne")
        scr_84_add_menu_item(parent, "[item]", 42, "GreenTea")
        scr_84_add_menu_item(parent, "[item]", 43, "OrangeJuice")
        
        scr_84_add_menu_item(parent, "[item]", 64, "Schadenbrot")
        scr_84_add_menu_item(parent, "[item]", 65, "TreeCake")
        scr_84_add_menu_item(parent, "[item]", 66, "S.POTION")
        scr_84_add_menu_item(parent, "[item]", 67, "Raw Moon")
        scr_84_add_menu_item(parent, "[item]", 68, "Phanta")
        scr_84_add_menu_item(parent, "[item]", 69, "FlowerySoda")
        scr_84_add_menu_item(parent, "[item]", 70, "Shikacola")
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
        scr_84_add_menu_item(parent, "[keyitem]", 1, "Cell Phone")
        scr_84_add_menu_item(parent, "[keyitem]", 2, "Egg")
        scr_84_add_menu_item(parent, "[keyitem]", 3, "BrokenCake")
        scr_84_add_menu_item(parent, "[keyitem]", 4, "Broken Key A")
        scr_84_add_menu_item(parent, "[keyitem]", 5, "Door Key")
        scr_84_add_menu_item(parent, "[keyitem]", 6, "Broken Key B")
        scr_84_add_menu_item(parent, "[keyitem]", 7, "Broken Key C")
        
        scr_84_add_menu_item(parent, "[keyitem]", 8, "Lancer")
        scr_84_add_menu_item(parent, "[keyitem]", 9, "Rouxls Kaard")
        scr_84_add_menu_item(parent, "[keyitem]", 10, "EmptyDisk")
        scr_84_add_menu_item(parent, "[keyitem]", 11, "LoadedDisk")
        scr_84_add_menu_item(parent, "[keyitem]", 12, "KeyGen")
        scr_84_add_menu_item(parent, "[keyitem]", 13, "ShadowCrystal")
        scr_84_add_menu_item(parent, "[keyitem]", 14, "StarWalker")
        scr_84_add_menu_item(parent, "[keyitem]", 15, "PureCrystal")
        
        scr_84_add_menu_item(parent, "[keyitem]", 16, "OddController")
        scr_84_add_menu_item(parent, "[keyitem]", 17, "BackstagePass")
        scr_84_add_menu_item(parent, "[keyitem]", 18, "TripTicket")
        scr_84_add_menu_item(parent, "[keyitem]", 19, "LancerCon")
        
        scr_84_add_menu_item(parent, "[keyitem]", 20, "Scissors")
        scr_84_add_menu_item(parent, "[keyitem]", 21, "YellowShred")
        scr_84_add_menu_item(parent, "[keyitem]", 22, "BootOil")
        scr_84_add_menu_item(parent, "[keyitem]", 23, "RedSplatter")
        scr_84_add_menu_item(parent, "[keyitem]", 24, "BromideR")
        scr_84_add_menu_item(parent, "[keyitem]", 25, "PetalFeather")
        scr_84_add_menu_item(parent, "[keyitem]", 26, "PerpBook")
        scr_84_add_menu_item(parent, "[keyitem]", 27, "BlueString")
        scr_84_add_menu_item(parent, "[keyitem]", 28, "TrainPlan")
        scr_84_add_menu_item(parent, "[keyitem]", 29, "YellowKey")
        
        scr_84_add_menu_item(parent, "[keyitem]", 30, "SheetMusic") // why does chapter 4 skip to here...
        scr_84_add_menu_item(parent, "[keyitem]", 31, "ClaimbClaws")
        
        scr_84_add_menu_item(parent, "[keyitem]", 32, "MysteryKey")
        scr_84_add_menu_item(parent, "[keyitem]", 33, "BromideF")
        
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 5")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[weaponitem]", 30, "WoodBlade2")
        scr_84_add_menu_item(parent, "[weaponitem]", 31, "Thatchet")
        scr_84_add_menu_item(parent, "[weaponitem]", 32, "BlueShoes")
        scr_84_add_menu_item(parent, "[weaponitem]", 33, "AquaKnife")
        scr_84_add_menu_item(parent, "[weaponitem]", 34, "FloweryScarf")
        scr_84_add_menu_item(parent, "[weaponitem]", 35, "BrokenScarf")
        scr_84_add_menu_item(parent, "[weaponitem]", 36, "GildedRose")
        scr_84_add_menu_item(parent, "[weaponitem]", 37, "MistleWP")
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
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Chapter 5")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[armoritem]", 23, "ShadowMantle")
        scr_84_add_menu_item(parent, "[armoritem]", 24, "LodeStone")
        scr_84_add_menu_item(parent, "[armoritem]", 25, "GingerGuard")
        scr_84_add_menu_item(parent, "[armoritem]", 26, "BlueRibbon")
        scr_84_add_menu_item(parent, "[armoritem]", 27, "TennaTie")
        parent = scr_84_pop()
        
        parent = scr_84_pop()
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Rooms")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[gotoroom]", 0, "Go to Specific Room")
        scr_84_add_menu_item(parent, "[room]", 1, "ROOM_INITIALIZE")
        scr_84_add_menu_item(parent, "[room]", 17, "PLACE_CONTACT")
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Debug")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", 2, "room_title_placeholder")
        scr_84_add_menu_item(parent, "[room]", 3, "room_battletest")
        scr_84_add_menu_item(parent, "[roomdark]", 4, "room_cutscene_tester")
        scr_84_add_menu_item(parent, "[roomdark]", 5, "room_sound_tester")
        scr_84_add_menu_item(parent, "[roomdark]", 6, "room_sprite_tester")
        scr_84_add_menu_item(parent, "[roomdark]", 7, "room_gif_tester")
        scr_84_add_menu_item(parent, "[roomdark]", 8, "room_bullettest")
        scr_84_add_menu_item(parent, "[roomdark]", 9, "room_GMS2_test")
        scr_84_add_menu_item(parent, "[roomdark]", 10, "room_cutscene_tester_b")
        scr_84_add_menu_item(parent, "[roomdark]", 11, "room_debug_color")
        scr_84_add_menu_item(parent, "[roomdark]", 12, "room_debug_battle")
        scr_84_add_menu_item(parent, "[roomdark]", 13, "room_debug_loc")
        scr_84_add_menu_item(parent, "[roomdark]", 84, "room_debug_smallface_dark")
        scr_84_add_menu_item(parent, "[roomdark]", 85, "room_debug_smallface")
        scr_84_add_menu_item(parent, "[roomdark]", 86, "room_debug_choicer_dark")
        scr_84_add_menu_item(parent, "[roomdark]", 87, "room_debug_choicer_light")
        scr_84_add_menu_item(parent, "[roomdark]", 88, "room_debug_battleBalloon")
        scr_84_add_menu_item(parent, "[roomdark]", 89, "room_overworldBulletEnemyTest")
        scr_84_add_menu_item(parent, "[roomdark]", 93, "room_tennaCutsceneTest")
        scr_84_add_menu_item(parent, "[roomdark]", 94, "room_tennaAnimTest")
        scr_84_add_menu_item(parent, "[roomdark]", 113, "room_lerptest")
        scr_84_add_menu_item(parent, "[roomdark]", 123, "room_debug_tennatexttester")
        scr_84_add_menu_item(parent, "[roomdark]", 128, "room_rhythmgame_editor")
        scr_84_add_menu_item(parent, "[roomdark]", 133, "room_genanimtest")
        scr_84_add_menu_item(parent, "[roomdark]", 143, "room_perspective_testing")
        scr_84_add_menu_item(parent, "[roomdark]", 143, "room_bullettest_new")
        scr_84_add_menu_item(parent, "[roomdark]", 165, "room_ch3_gameshowroom_tennatest")
        scr_84_add_menu_item(parent, "[roomdark]", 185, "room_rhythmgame_tenna_test")
        scr_84_add_menu_item(parent, "[roomdark]", 222, "room_dw_channelchange_test")
        scr_84_add_menu_item(parent, "[roomdark]", 176, "room_CHEFS")
        scr_84_add_menu_item(parent, "[roomdark]", 126, "room_susiezilla_singleScreenMockup")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Light World")
        scr_84_push(parent)
        parent = group
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Kris's House")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", 15, "room_krisroom")
        scr_84_add_menu_item(parent, "[room]", 16, "room_krishallway")
        scr_84_add_menu_item(parent, "[room]", 17, "room_torroom")
        scr_84_add_menu_item(parent, "[room]", 18, "room_torhouse")
        scr_84_add_menu_item(parent, "[room]", 19, "room_torbathroom")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Exteriors")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", 20, "room_town_krisyard")
        scr_84_add_menu_item(parent, "[room]", 21, "room_town_northwest")
        scr_84_add_menu_item(parent, "[room]", 22, "room_town_north")
        scr_84_add_menu_item(parent, "[room]", 23, "room_beach")
        scr_84_add_menu_item(parent, "[room]", 24, "room_town_mid")
        scr_84_add_menu_item(parent, "[room]", 25, "room_town_apartments")
        scr_84_add_menu_item(parent, "[room]", 26, "room_town_south")
        scr_84_add_menu_item(parent, "[room]", 27, "room_town_school")
        scr_84_add_menu_item(parent, "[room]", 28, "room_town_church")
        scr_84_add_menu_item(parent, "[room]", 29, "room_graveyard")
        scr_84_add_menu_item(parent, "[room]", 30, "room_town_shelter")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Interiors")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", 31, "room_hospital_lobby")
        scr_84_add_menu_item(parent, "[room]", 32, "room_hospital_hallway")
        scr_84_add_menu_item(parent, "[room]", 33, "room_hospital_rudy")
        scr_84_add_menu_item(parent, "[room]", 34, "room_hospital_room2")
        scr_84_add_menu_item(parent, "[room]", 35, "room_diner")
        scr_84_add_menu_item(parent, "[room]", 36, "room_townhall")
        scr_84_add_menu_item(parent, "[room]", 37, "room_flowershop_1f")
        scr_84_add_menu_item(parent, "[room]", 38, "room_flowershop_2f")
        scr_84_add_menu_item(parent, "[room]", 39, "room_library")
        scr_84_add_menu_item(parent, "[room]", 40, "room_alphysalley")
        scr_84_add_menu_item(parent, "[room]", 41, "room_lw_computer_lab")
        scr_84_add_menu_item(parent, "[room]", 42, "room_lw_library_upstairs")
        scr_84_add_menu_item(parent, "[room]", 43, "room_lw_police")
        scr_84_add_menu_item(parent, "[room]", 44, "room_lw_conbini")
        scr_84_add_menu_item(parent, "[room]", 45, "room_lw_icee_pizza")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "School")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", 46, "room_torielclass")
        scr_84_add_menu_item(parent, "[room]", 47, "room_schoollobby")
        scr_84_add_menu_item(parent, "[room]", 48, "room_alphysclass")
        scr_84_add_menu_item(parent, "[room]", 49, "room_schooldoor")
        scr_84_add_menu_item(parent, "[room]", 50, "room_insidecloset")
        scr_84_add_menu_item(parent, "[room]", 51, "room_school_unusedroom")
        parent = scr_84_pop()
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Castle Town")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 52, "room_castle_tutorial")
        scr_84_add_menu_item(parent, "[roomdark]", 53, "room_dw_castle_east_door")
        scr_84_add_menu_item(parent, "[roomdark]", 54, "room_dw_castle_west_cliff")
        scr_84_add_menu_item(parent, "[roomdark]", 55, "room_dw_castle_area_1")
        scr_84_add_menu_item(parent, "[roomdark]", 56, "room_dw_castle_town")
        scr_84_add_menu_item(parent, "[roomdark]", 57, "room_dw_ralsei_castle_front")
        scr_84_add_menu_item(parent, "[roomdark]", 58, "room_dw_castle_restaurant")
        scr_84_add_menu_item(parent, "[roomdark]", 59, "room_dw_castle_cafe")
        scr_84_add_menu_item(parent, "[roomdark]", 60, "room_dw_castle_dojo")
        scr_84_add_menu_item(parent, "[roomdark]", 61, "room_dw_ralsei_castle_1f")
        scr_84_add_menu_item(parent, "[roomdark]", 62, "room_dw_ralsei_castle_2f")
        scr_84_add_menu_item(parent, "[roomdark]", 63, "room_dw_castle_dungeon")
        scr_84_add_menu_item(parent, "[roomdark]", 64, "room_dw_castle_rooms_kris")
        scr_84_add_menu_item(parent, "[roomdark]", 65, "room_dw_castle_rooms_susie")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Couch Overworld")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 188, "room_dw_couch_overworld_intro_left")
        scr_84_add_menu_item(parent, "[roomdark]", 98, "room_dw_couch_overworld_intro")
        scr_84_add_menu_item(parent, "[roomdark]", 99, "room_dw_couch_overworld_01")
        scr_84_add_menu_item(parent, "[roomdark]", 100, "room_dw_couch_overworld_02")
        scr_84_add_menu_item(parent, "[roomdark]", 187, "room_dw_couch_points")
        scr_84_add_menu_item(parent, "[roomdark]", 101, "room_dw_couch_overworld_03")
        scr_84_add_menu_item(parent, "[roomdark]", 102, "room_dw_couch_overworld_04")
        scr_84_add_menu_item(parent, "[roomdark]", 103, "room_dw_couch_overworld_05")
        scr_84_add_menu_item(parent, "[roomdark]", 189, "room_dw_couch_video")
        parent = scr_84_pop()
        scr_84_add_menu_item(parent, "[roomdark]", 194, "room_dw_tv_curtain")
        scr_84_add_menu_item(parent, "[roomdark]", 131, "room_ch3_gameshowroom")
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Green Room")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 150, "room_board_empty")
        scr_84_add_menu_item(parent, "[roomdark]", 147, "room_dw_b3bs_interstitial")
        scr_84_add_menu_item(parent, "[roomdark]", 135, "room_dw_green_room")
        scr_84_add_menu_item(parent, "[roomdark]", 139, "room_dw_changing_room")
        scr_84_add_menu_item(parent, "[roomdark]", 140, "room_dw_console_room")
        scr_84_add_menu_item(parent, "[roomdark]", 168, "room_dw_teevie_preview")
        scr_84_add_menu_item(parent, "[roomdark]", 216, "room_dw_teevie_preview_south")
        scr_84_add_menu_item(parent, "[roomdark]", 192, "room_dw_puzzlecloset_0")
        scr_84_add_menu_item(parent, "[roomdark]", 170, "room_dw_puzzlecloset_1")
        scr_84_add_menu_item(parent, "[roomdark]", 240, "room_dw_puzzlecloset_1a")
        scr_84_add_menu_item(parent, "[roomdark]", 171, "room_dw_puzzlecloset_2")
        scr_84_add_menu_item(parent, "[roomdark]", 218, "room_dw_puzzlecloset_3")
        scr_84_add_menu_item(parent, "[roomdark]", 109, "room_dw_snow_zone")
        scr_84_add_menu_item(parent, "[roomdark]", 190, "room_dw_snow_zone_battle")
        scr_84_add_menu_item(parent, "[roomdark]", 242, "room_dw_snow_zone_east_door")
        scr_84_add_menu_item(parent, "[roomdark]", 238, "room_ch3_gacharoom_unknown")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Boards")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 193, "room_board_gsa02_b0")
        scr_84_add_menu_item(parent, "[roomdark]", 125, "room_board_intro")
        scr_84_add_menu_item(parent, "[roomdark]", 112, "room_board_1")
        scr_84_add_menu_item(parent, "[roomdark]", 137, "room_board_sword_intro")
        scr_84_add_menu_item(parent, "[roomdark]", 136, "room_board_1_sword")
        scr_84_add_menu_item(parent, "[roomdark]", 138, "room_board_1_sword_trees")
        scr_84_add_menu_item(parent, "[roomdark]", 141, "room_board_2")
        scr_84_add_menu_item(parent, "[roomdark]", 148, "room_board_2_sword")
        scr_84_add_menu_item(parent, "[roomdark]", 115, "room_board_dungeon_2")
        scr_84_add_menu_item(parent, "[roomdark]", 144, "room_board_3")
        scr_84_add_menu_item(parent, "[roomdark]", 186, "room_board_3_sword")
        scr_84_add_menu_item(parent, "[roomdark]", 116, "room_board_dungeon_3")
        scr_84_add_menu_item(parent, "[roomdark]", 117, "room_board_preshadowmantle")
        scr_84_add_menu_item(parent, "[roomdark]", 118, "room_shadowmantle")
        scr_84_add_menu_item(parent, "[roomdark]", 119, "room_board_prepostshadowmantle")
        scr_84_add_menu_item(parent, "[roomdark]", 120, "room_board_postshadowmantle")
        scr_84_add_menu_item(parent, "[roomdark]", 134, "room_board_preshadowmantle_repeat")
        scr_84_add_menu_item(parent, "[roomdark]", 175, "room_board_3b")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Minigames")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 169, "room_dw_chef")
        scr_84_add_menu_item(parent, "[roomdark]", 96, "room_dw_rhythm")
        scr_84_add_menu_item(parent, "[roomdark]", 166, "room_dw_susiezilla")
        scr_84_add_menu_item(parent, "[roomdark]", 132, "room_shootout")
        scr_84_add_menu_item(parent, "[roomdark]", 172, "room_dw_chef_empty")
        scr_84_add_menu_item(parent, "[roomdark]", 173, "room_dw_susiezilla_empty")
        scr_84_add_menu_item(parent, "[roomdark]", 174, "room_dw_rhythm_empty")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Backstage")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 156, "room_dw_b3bs_intro")
        scr_84_add_menu_item(parent, "[roomdark]", 177, "room_dw_b3bs_jail1")
        scr_84_add_menu_item(parent, "[roomdark]", 157, "room_dw_b3bs_zapper_a")
        scr_84_add_menu_item(parent, "[roomdark]", 178, "room_dw_b3bs_shop")
        scr_84_add_menu_item(parent, "[roomdark]", 159, "room_dw_b3bs_lancerget")
        scr_84_add_menu_item(parent, "[roomdark]", 179, "room_dw_b3bs_mysterypuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", 158, "room_dw_b3bs_rabbick_a")
        scr_84_add_menu_item(parent, "[roomdark]", 164, "room_dw_b3bs_zapper_b")
        scr_84_add_menu_item(parent, "[roomdark]", 181, "room_dw_b3bs_jail2")
        scr_84_add_menu_item(parent, "[roomdark]", 180, "room_dw_b3bs_watercooler")
        scr_84_add_menu_item(parent, "[roomdark]", 163, "room_dw_b3bs_sadshadowguys")
        scr_84_add_menu_item(parent, "[roomdark]", 162, "room_dw_b3bs_rabbick_b")
        scr_84_add_menu_item(parent, "[roomdark]", 160, "room_dw_b3bs_cooltrashy")
        scr_84_add_menu_item(parent, "[roomdark]", 151, "room_dw_b3bs_rouxls_lanina")
        scr_84_add_menu_item(parent, "[roomdark]", 153, "room_dw_b3bs_rouxls_boss")
        scr_84_add_menu_item(parent, "[roomdark]", 154, "room_dw_b3bs_cheaterpippins")
        scr_84_add_menu_item(parent, "[roomdark]", 217, "room_dw_b3bs_camerareminder")
        scr_84_add_menu_item(parent, "[roomdark]", 155, "room_dw_b3bs_idcardpuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", 161, "room_dw_b3bs_zapper_c")
        scr_84_add_menu_item(parent, "[roomdark]", 182, "room_dw_b3bs_zapper_d")
        scr_84_add_menu_item(parent, "[roomdark]", 183, "room_dw_b3bs_extrapuzzle")
        scr_84_add_menu_item(parent, "[roomdark]", 184, "room_dw_b3bs_bibliox")
        scr_84_add_menu_item(parent, "[roomdark]", 121, "room_dw_ch3_man")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "TV World")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 108, "room_dw_backstage")
        scr_84_add_menu_item(parent, "[roomdark]", 195, "room_dw_teevie_intro")
        scr_84_add_menu_item(parent, "[roomdark]", 196, "room_dw_teevie_large_01")
        scr_84_add_menu_item(parent, "[roomdark]", 197, "room_dw_teevie_large_02")
        scr_84_add_menu_item(parent, "[roomdark]", 198, "room_dw_teevie_cowboy_zone_01_intro")
        scr_84_add_menu_item(parent, "[roomdark]", 199, "room_dw_teevie_cowboy_zone_01_after")
        scr_84_add_menu_item(parent, "[roomdark]", 201, "room_dw_teevie_susiezilla")
        scr_84_add_menu_item(parent, "[roomdark]", 202, "room_dw_teevie_cowboy_zone_02_intro")
        scr_84_add_menu_item(parent, "[roomdark]", 203, "room_dw_teevie_cowboy_zone_02_after")
        scr_84_add_menu_item(parent, "[roomdark]", 231, "room_dw_teevie_ribbicks_a")
        scr_84_add_menu_item(parent, "[roomdark]", 200, "room_dw_teevie_watercooler")
        scr_84_add_menu_item(parent, "[roomdark]", 232, "room_dw_teevie_ribbicks_b")
        scr_84_add_menu_item(parent, "[roomdark]", 204, "room_dw_teevie_shadow_guys")
        scr_84_add_menu_item(parent, "[roomdark]", 205, "room_dw_teevie_stealth_c")
        scr_84_add_menu_item(parent, "[roomdark]", 206, "room_dw_teevie_stealth")
        scr_84_add_menu_item(parent, "[roomdark]", 207, "room_dw_teevie_failure_cage")
        scr_84_add_menu_item(parent, "[roomdark]", 215, "room_dw_teevie_ribbick")
        scr_84_add_menu_item(parent, "[roomdark]", 208, "room_dw_teevie_rhythm")
        scr_84_add_menu_item(parent, "[roomdark]", 234, "room_dw_teevie_shuttahmaze")
        scr_84_add_menu_item(parent, "[roomdark]", 224, "room_dw_teevie_maze_quiz")
        scr_84_add_menu_item(parent, "[roomdark]", 220, "room_dw_teevie_bonus_zone")
        scr_84_add_menu_item(parent, "[roomdark]", 142, "room_dw_tv_closet")
        scr_84_add_menu_item(parent, "[roomdark]", 219, "room_dw_teevie_sams")
        scr_84_add_menu_item(parent, "[roomdark]", 235, "room_dw_teevie_stealth_d")
        scr_84_add_menu_item(parent, "[roomdark]", 213, "room_dw_teevie_chef")
        scr_84_add_menu_item(parent, "[roomdark]", 236, "room_dw_teevie_dust")
        scr_84_add_menu_item(parent, "[roomdark]", 237, "room_dw_teevie_dust_south")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Cutscene")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 95, "room_dw_tv_cutscene1g")
        scr_84_add_menu_item(parent, "[roomdark]", 104, "room_dw_nondescript_room")
        scr_84_add_menu_item(parent, "[roomdark]", 105, "room_dw_nondescript_field")
        scr_84_add_menu_item(parent, "[roomdark]", 106, "room_dw_nondescript_hallway")
        scr_84_add_menu_item(parent, "[roomdark]", 107, "room_dw_nondescript_classroom")
        scr_84_add_menu_item(parent, "[roomdark]", 110, "room_town_krisyard_dark")
        scr_84_add_menu_item(parent, "[roomdark]", 127, "room_torhouse_sepia")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Special")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[room]", 243, "room_intro")
        scr_84_add_menu_item(parent, "[room]", 66, "PLACE_DOG")
        scr_84_add_menu_item(parent, "[room]", 67, "room_legend")
        scr_84_add_menu_item(parent, "[room]", 68, "room_legend_neo")
        scr_84_add_menu_item(parent, "[room]", 69, "room_shop1")
        scr_84_add_menu_item(parent, "[room]", 70, "room_shop_music")
        scr_84_add_menu_item(parent, "[room]", 71, "room_gameover")
        scr_84_add_menu_item(parent, "[room]", 72, "PLACE_LOGO")
        scr_84_add_menu_item(parent, "[room]", 73, "PLACE_FAILURE")
        scr_84_add_menu_item(parent, "[room]", 74, "PLACE_NAMING_JIKKEN")
        scr_84_add_menu_item(parent, "[room]", 75, "PLACE_MENU")
        scr_84_add_menu_item(parent, "[room]", 76, "room_ed")
        scr_84_add_menu_item(parent, "[room]", 83, "PLACE_DOGCHECK2")
        scr_84_add_menu_item(parent, "[room]", 245, "room_chapter_continue")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Unused")
        scr_84_push(parent)
        parent = group
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Boards")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 90, "room_board1_oldtest")
        scr_84_add_menu_item(parent, "[roomdark]", 91, "room_boardtest")
        scr_84_add_menu_item(parent, "[roomdark]", 92, "room_boardtest_old")
        scr_84_add_menu_item(parent, "[roomdark]", 97, "room_board_designTest")
        scr_84_add_menu_item(parent, "[roomdark]", 114, "room_shadowmantle_movementExample")
        scr_84_add_menu_item(parent, "[roomdark]", 122, "room_board_boattest")
        scr_84_add_menu_item(parent, "[roomdark]", 129, "room_board_tests")
        scr_84_add_menu_item(parent, "[roomdark]", 130, "room_board_postshadowmantle_test")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Green Room")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 225, "room_dw_ranking_hub")
        scr_84_add_menu_item(parent, "[roomdark]", 226, "room_dw_ranking_a")
        scr_84_add_menu_item(parent, "[roomdark]", 227, "room_dw_ranking_b")
        scr_84_add_menu_item(parent, "[roomdark]", 228, "room_dw_ranking_c")
        scr_84_add_menu_item(parent, "[roomdark]", 229, "room_dw_ranking_z")
        scr_84_add_menu_item(parent, "[roomdark]", 230, "room_dw_ranking_z_hallway")
        scr_84_add_menu_item(parent, "[roomdark]", 239, "room_dw_ranking_t")
        scr_84_add_menu_item(parent, "[roomdark]", 167, "room_dw_inbetween")
        parent = scr_84_pop()
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Backstage")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 145, "room_dw_b3bstest")
        scr_84_add_menu_item(parent, "[roomdark]", 146, "room_dw_b3bstest_big")
        scr_84_add_menu_item(parent, "[roomdark]", 152, "room_dw_b3bs_template")
        scr_84_add_menu_item(parent, "[roomdark]", 191, "room_dw_b3bs_zapper_a_old")
        parent = scr_84_pop()
        
        
        scr_84_add_menu_item(parent, "[roomdark]", 124, "room_susiezilla")
        
        
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "TV World")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[roomdark]", 233, "room_dw_teevie_susiebridge")
        scr_84_add_menu_item(parent, "[roomdark]", 212, "room_dw_teevie_maze")
        scr_84_add_menu_item(parent, "[roomdark]", 209, "room_dw_teevie_maze_points")
        scr_84_add_menu_item(parent, "[roomdark]", 210, "room_dw_teevie_maze_chef")
        scr_84_add_menu_item(parent, "[roomdark]", 211, "room_dw_teevie_maze_final")
        scr_84_add_menu_item(parent, "[roomdark]", 214, "room_dw_teevie_cutscene_final")
        scr_84_add_menu_item(parent, "[roomdark]", 221, "room_dw_teevie_audiencepits")
        scr_84_add_menu_item(parent, "[roomdark]", 223, "room_dw_teevie_lightmaze")
        parent = scr_84_pop()
        
        
        scr_84_add_menu_item(parent, "[room]", 77, "room_empty")
        scr_84_add_menu_item(parent, "[roomdark]", 78, "room_DARKempty")
        scr_84_add_menu_item(parent, "[roomdark]", 79, "room_DARKbase_GMS2")
        scr_84_add_menu_item(parent, "[roomdark]", 81, "room_cc_clover")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Unsorted Full List")
        scr_84_push(parent)
        parent = group
        for (var rooms = 0; rooms < (room_last + ROOM_INITIALIZE); rooms++)
            scr_84_add_menu_item(parent, "[roomdark]", rooms, room_get_name(rooms))
        parent = scr_84_pop()
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Options")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[god]", "", "God Mode")
        scr_84_add_menu_item(parent, "[showroom]", "", "Toggle Room Name")
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Additional Visibility Toggles")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[showplot]", "", "Toggle Plot")
        scr_84_add_menu_item(parent, "[showencounter]", "", "Toggle Encounterno")
        scr_84_add_menu_item(parent, "[showinteract]", "", "Toggle Interact")
        scr_84_add_menu_item(parent, "[showentrance]", "", "Toggle Entrance")
        scr_84_add_menu_item(parent, "[showfps]", "", "Toggle FPS")
        parent = scr_84_pop()
        scr_84_add_menu_item(parent, "[restart]", "", "Restart Room")
        scr_84_add_menu_item(parent, "[loadj]", "", "Reload Japanese")
        scr_84_add_menu_item(parent, "[lang]", "ja", "Use Japanese")
        scr_84_add_menu_item(parent, "[lang]", "en", "Use English")
        scr_84_add_menu_item(parent, "[phone]", "", "Give Sans's Number")
        scr_84_add_menu_item(parent, "[fonttest]", "", "Font Test")
        scr_84_add_menu_item(parent, "[credits]", "", "Credits")
        scr_84_add_menu_item(parent, "[ashley]", "", "!!!SUPER IMPORTANT!!!")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Flags")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[flagsetspec]", 0, "Set Specific Flag")
        scr_84_add_menu_item(parent, "[tempflag]", 0, "Set Temporary Flag")
        scr_84_add_menu_item(parent, "[plot]", 0, "Set Plot Value")
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
        parent = scr_84_pop()
        scr_84_add_menu_item(parent, "[flagset]", 31, "Disable Walking Sounds")
        scr_84_add_menu_item(parent, "[flagset]", 32, "Disable Item/Gear Comments")
        scr_84_add_menu_item(parent, "[flagset]", 40, "Enemy Kills")
        scr_84_add_menu_item(parent, "[flagset]", 254, "Starwalker Flag")
        scr_84_add_menu_item(parent, "[flagset]", 910, "CH1 Egg Flag")
        scr_84_add_menu_item(parent, "[flagset]", 918, "CH2 Egg Flag")
        scr_84_add_menu_item(parent, "[flagset]", 930, "CH3 Egg Flag")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Stats")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[idealall]", "", "Idealize Stats")
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Kris Stats")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[hp]", 1, "Set HP")
        scr_84_add_menu_item(parent, "[hpmax]", 1, "Set HP and Max Hp")
        scr_84_add_menu_item(parent, "[attack]", 1, "Set Attack")
        scr_84_add_menu_item(parent, "[defense]", 1, "Set Defense")
        scr_84_add_menu_item(parent, "[magic]", 1, "Set Magic")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Susie Stats")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[hp]", 2, "Set HP")
        scr_84_add_menu_item(parent, "[hpmax]", 2, "Set HP and Max Hp")
        scr_84_add_menu_item(parent, "[attack]", 2, "Set Attack")
        scr_84_add_menu_item(parent, "[defense]", 2, "Set Defense")
        scr_84_add_menu_item(parent, "[magic]", 2, "Set Magic")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Ralsei Stats")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[hp]", 3, "Set HP")
        scr_84_add_menu_item(parent, "[hpmax]", 3, "Set HP and Max Hp")
        scr_84_add_menu_item(parent, "[attack]", 3, "Set Attack")
        scr_84_add_menu_item(parent, "[defense]", 3, "Set Defense")
        scr_84_add_menu_item(parent, "[magic]", 3, "Set Magic")
        parent = scr_84_pop()
        group = ds_list_create()
        scr_84_add_menu_item(parent, "[group]", group, "Noelle Stats")
        scr_84_push(parent)
        parent = group
        scr_84_add_menu_item(parent, "[hp]", 4, "Set HP")
        scr_84_add_menu_item(parent, "[hpmax]", 4, "Set HP and Max Hp")
        scr_84_add_menu_item(parent, "[attack]", 4, "Set Attack")
        scr_84_add_menu_item(parent, "[defense]", 4, "Set Defense")
        scr_84_add_menu_item(parent, "[magic]", 4, "Set Magic")
        parent = scr_84_pop()
        scr_84_add_menu_item(parent, "[setmember]", 1, "Set Party Member 1")
        scr_84_add_menu_item(parent, "[setmember]", 2, "Set Party Member 2")
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
        scr_84_add_menu_item(parent, "[warp]", 6, "Board 1")
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
        scr_84_add_menu_item(parent, "[group]", group, "Game Show 3");
        scr_84_push(parent);
        parent = group;
        scr_84_add_menu_item(parent, "[warp]", 21.1, "Pre-Board 3 Cutscene")
        scr_84_add_menu_item(parent, "[warp]", 21.2, "Board 3")
        scr_84_add_menu_item(parent, "[warp]", 21.3, "Sneaking Backstage Scene")
        scr_84_add_menu_item(parent, "[warp]", 21.4, "Green Room 3")
        scr_84_add_menu_item(parent, "[warp]", 37, "Sword Route Board 3")
        scr_84_add_menu_item(parent, "[warp]", 38, "Sword Route Board 3 Dungeon")
        scr_84_add_menu_item(parent, "[warp]", 36, "Ramb Half-Stone Scene")
        scr_84_add_menu_item(parent, "[warp]", 37, "Sword Route Board 3")
        scr_84_add_menu_item(parent, "[warp]", 38, "Sword Route Board 3 Dungeon")
        scr_84_add_menu_item(parent, "[warp]", 39, "Pre-Shadow Mantle Battle")
        scr_84_add_menu_item(parent, "[warp]", 40, "Shadow Mantle Battle")
        scr_84_add_menu_item(parent, "[warp]", 41, "Post-Shadow Mantle Battle")
        scr_84_add_menu_item(parent, "[warp]", 21.5, "Backstage Entrance")
        scr_84_add_menu_item(parent, "[warp]", 21.6, "Backstage Rouxls Encounter")
        scr_84_add_menu_item(parent, "[warp]", 21.7, "Back to Board 3")
        scr_84_add_menu_item(parent, "[warp]", 21.8, "Back to Board 3 (Sword Route Version)")
        scr_84_add_menu_item(parent, "[warp]", 21.9, "Susiezilla")
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
        scr_84_add_menu_item(parent, "[warp]", 35, "Green Room 4")
        scr_84_add_menu_item(parent, "[warp]", 42, "Tenna Battle")
        scr_84_add_menu_item(parent, "[warp]", 43, "Knight Battle")
        scr_84_add_menu_item(parent, "[warp]", 44, "Light World Scene")
        parent = scr_84_pop();
        parent = scr_84_pop();
        
        global.chemg_menus = parent
    }
    if (process)
        return global.chemg_menu_depth > 0;
    if (keyboard_check_pressed(ord("B")) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_stickr))
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
        if (keyboard_check(vk_up) || gamepad_button_check(obj_gamecontroller.gamepad_id, gp_padu) || keyboard_check(vk_down) || gamepad_button_check(obj_gamecontroller.gamepad_id, gp_padd))
        {
            debug_movetimer += timeinc
            if (debug_movetimer >= 0.75)
            {
                if (keyboard_check(vk_up) || gamepad_button_check(obj_gamecontroller.gamepad_id, gp_padu))
                    debug_upmove = 1
                else if (keyboard_check(vk_down) || gamepad_button_check(obj_gamecontroller.gamepad_id, gp_padd))
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
        if (keyboard_check_pressed(vk_up) || (debug_upmove >= 1 && debug_movecooldown <= 0) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_padu))
        {
            change = -1
        }
        else if (keyboard_check_pressed(vk_down) || (debug_downmove >= 1 && debug_movecooldown <= 0) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_padd))
        {
            change = 1
        }
        else if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_face2))
        {
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
            else if (choice == "[room]")
            {
                room_goto(choice_data)
                global.chemg_menu_depth = 0
            }
            else if (choice == "[roomdark]")
            {
                show_debug_message("room_goto: " + choice_name)
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
            else if (choice == "[god]")
            {
                global.chemg_god_mode = 1 - global.chemg_god_mode
                ossafe_ini_open("DebugPlus.ini")
                ini_write_real("AshleysDebug", "global.chemg_god_mode", global.chemg_god_mode)
                ossafe_ini_close()
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
            else if (choice == "[showroom]")
            {
                global.chemg_show_room = !global.chemg_show_room
                ossafe_ini_open("DebugPlus.ini")
                ini_write_real("AshleysDebug", "global.chemg_show_room", global.chemg_show_room)
                ossafe_ini_close()
            }
            else if (choice == "[showval]")
            {
                global.chemg_show_val = !global.chemg_show_val
                ossafe_ini_open("DebugPlus.ini")
                ini_write_real("AshleysDebug", "global.chemg_show_val", global.chemg_show_val)
                ossafe_ini_close()
            }
            else if (choice == "[showplot]")
            {
                global.chemg_show_plot = !global.chemg_show_plot
                ossafe_ini_open("DebugPlus.ini")
                ini_write_real("AshleysDebug", "global.chemg_show_plot", global.chemg_show_plot)
                ossafe_ini_close()
            }
            else if (choice == "[showencounter]")
            {
                global.chemg_show_encounterno = !global.chemg_show_encounterno
                ossafe_ini_open("DebugPlus.ini")
                ini_write_real("AshleysDebug", "global.chemg_show_encounterno", global.chemg_show_encounterno)
                ossafe_ini_close()
            }
            else if (choice == "[showinteract]")
            {
                global.chemg_show_interact = !global.chemg_show_interact
                ossafe_ini_open("DebugPlus.ini")
                ini_write_real("AshleysDebug", "global.chemg_show_interact", global.chemg_show_interact)
                ossafe_ini_close()
            }
            else if (choice == "[showentrance]")
            {
                global.chemg_show_entrance = !global.chemg_show_entrance
                ossafe_ini_open("DebugPlus.ini")
                ini_write_real("AshleysDebug", "global.chemg_show_entrance", global.chemg_show_entrance)
                ossafe_ini_close()
            }
            else if (choice == "[showfps]")
            {
                global.chemg_show_fps = !global.chemg_show_fps
                ossafe_ini_open("DebugPlus.ini")
                ini_write_real("AshleysDebug", "global.chemg_show_fps", global.chemg_show_fps)
                ossafe_ini_close()
            }
            else if (choice == "[fonttest]")
            {
                global.chemg_font_test = !global.chemg_font_test
                global.chemg_menu_depth = 0
            }
            else if (choice == "[gotoroom]")
            {
                var varname = get_string("Enter Room ID (ex. room_dark1)", "")
                if (room_exists(asset_get_index(varname)))
                    room_goto(asset_get_index(varname))
                else
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
                var varname = get_string("Enter new value (currently: " + string(global.flag[choice_data]) + ")", "")
                if (varname != "")
                {
                    if (is_numeric(global.flag[choice_data]))
                        global.flag[choice_data] = real(varname)
                    else
                        show_message("Flags can only be set to numbers!!!!")
                    // idk why i added this, flags can't be strings lmao it makes the game crash when loading files
                    /*else if (is_string(global.flag[choice_data]))
                        global.flag[choice_data] = string(varname)
                    else
                        show_message("error????")*/
                }
            }
            else if (choice == "[flagsetspec]")
            {
                var flagid = get_string("Enter the flag ID", "")
                if (flagid != "")
                {
                    flagid = real(flagid)
                    if (flagid <= array_length(global.flag))
                    {
                        var varname = get_string("Enter new value (currently: " + string(global.flag[flagid]) + ")", "")
                        if (varname != "")
                        {
                            if (is_numeric(global.flag[flagid]))
                                global.flag[flagid] = real(varname)
                            else
                                show_message("Flags can only be set to numbers!!!!")
                            // idk why i added this, flags can't be strings lmao it makes the game crash when loading files
                            /*else if (is_string(global.flag[choice_data]))
                                global.flag[choice_data] = string(varname)
                            else
                                show_message("error????")*/
                        }
                    }
                    else
                    {
                        show_message("Too high!! Max flag count is 9999 for CH1 and 2500 for CH2+")
                    }
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
                for (i = 0; i < 6; i++)
                    scr_itemget(39)
                for (i = 0; i < 2; i++)
                    scr_itemget(38)
                scr_itemget(7)
                for (i = 0; i < 3; i++)
                    scr_itemget(2)
                scr_weaponget(14)
                scr_weaponget(23)
                scr_weaponget(24)
                scr_weaponget(7)
                scr_weaponget(18)
                scr_weaponget(19)
                scr_weaponget(21)
                scr_weaponget(25)
                for (i = 0; i < 4; i++)
                    scr_armorget(22)
                scr_armorget(3)
                scr_armorget(9)
                scr_armorget(13)
                scr_armorget(7)
                scr_armorget(21)
                scr_armorget(23)
                for (i = 0; i < 3; i++)
                    scr_armorget(24)
                for (i = 0; i < 3; i++)
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
            else if (choice == "[idealall]")
            {
                global.maxhp[1] = 186
                global.hp[1] = 186
                global.at[1] = 15
                global.df[1] = 2
                global.mag[1] = 0
                global.maxhp[2] = 222
                global.hp[2] = 222
                global.at[2] = 19
                global.df[2] = 2
                global.mag[2] = 3
                global.maxhp[3] = 166
                global.hp[3] = 166
                global.at[3] = 13
                global.df[3] = 2
                global.mag[3] = 12
                global.maxhp[4] = 166
                global.hp[4] = 166
                global.at[4] = 8
                global.df[4] = 1
                global.mag[4] = 16
                show_message("Idealized Stats")
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
                    show_message("Party member " + string(choice_data) + " set, requires room restart to take effect.\nSome rooms set the party automatically in debug mode, so if it doesn't work that's probably why.")
                }
            }
            else if (choice == "[ashley]")
            {
                url_open("https://twitter.com/barofsoap418")
            }
            else if (choice == "[plot]")
            {
                var plotvalue = get_string("Enter new plot value (currently: " + string(global.plot) + ")", "");
                
                if (plotvalue != "")
                {
                    global.plot = real(plotvalue)
                }
            }
            else if (choice == "[globalset]")
            {
                var newval = get_string("Enter new " + choice_data + " value (currently: " + string(variable_global_get(choice_data)) + ")", "");
                if (newval != "")
                    variable_global_set(choice_data, real(newval));
            }
            else if (choice == "[globalset_multi]")
            {
                var newval = get_string("Enter new " + choice_data + " value (currently: " + string(variable_global_get(choice_data[0])) + ")", "");
                if (newval != "")
                {
                    for (var i = 0; i < array_length_1d(choice_data); i++)
                    {
                        variable_global_set(choice_data[i], real(newval));
                    }
                }
            }
            else if (choice == "[platswap]")
            {
                if (instance_exists(obj_platswap))
                {
                    with (obj_platswap)
                        event_user(0);
                }
                else
                {
                    scr_debug_print("This room doesn't support platformer mode");
                }
            }
            else if choice == "[credits]"
            {
                show_message("place")
            }
            else if (choice == "[warp]")
            {
                var roomtogo = ROOM_INITIALIZE
                global.darkzone = 1
                scr_setparty(1, 1, 0)
                switch choice_data
                {
                    case 0: // chapter start
                        global.plot = 0
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
                        
                    case 6: // board 1
                        global.plot = 80
                        roomtogo = room_board_gsa02_b0
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
                        global.flag[1055] = 1
                        break
                        
                    case 19: // sword route board 2 (no ice key)
                        global.plot = 160
                        roomtogo = room_board_2_sword
                        scr_losechar()
                        global.flag[1055] = 0
                        break
                        
                    case 20: // sword route board 2 dungeon
                        global.plot = 160
                        roomtogo = room_board_dungeon_2
                        scr_losechar()
                        global.flag[1055] = 1.50
                        break
                        
                    case 21: // finding toriel
                        global.plot = 160
                        roomtogo = room_dw_snow_zone
                        break
                        
                    case 21.1: // pre board 3 cutscene
                        global.plot = 170
                        roomtogo = room_ch3_gameshowroom
                        break
                        
                    case 21.2: // board 3
                        global.plot = 180
                        roomtogo = room_board_3
                        break
                        
                    case 21.3: // sneaking backstage
                        global.plot = 199
                        roomtogo = room_dw_b3bs_interstitial
                        break
                        
                    case 21.4: // green room 3
                        global.plot = 200
                        global.flag[1057] = 1
                        scr_losechar()
                        roomtogo = room_dw_b3bs_interstitial
                        break
                        
                    case 21.5: // backstage entrance
                        global.plot = 200
                        global.flag[1057] = 1
                        roomtogo = room_dw_b3bs_intro
                        break
                        
                    case 21.6: // backstage rouxls encounter
                        global.plot = 200
                        global.flag[1057] = 2
                        roomtogo = room_dw_b3bs_rouxls_lanina
                        break
                        
                    case 21.7: // back to board 3
                        global.plot = 215
                        global.flag[1057] = 2
                        global.flag[1097] = 2
                        global.flag[1055] = 0
                        roomtogo = room_dw_b3bs_interstitial
                        break
                        
                    case 21.8: // back to board 3 (sword route)
                        global.plot = 215
                        global.flag[1057] = 2
                        global.flag[1097] = 2
                        global.flag[1055] = 6
                        roomtogo = room_dw_b3bs_interstitial
                        break
                        
                    case 21.9: // susiezilla
                        global.plot = 215
                        roomtogo = room_dw_susiezilla
                        break
                        
                    case 22: // doom board starting scene
                        global.plot = 225
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
                        roomtogo = room_dw_teevie_large_02
                        break
                        
                    case 27: // tenna ramb call
                        global.plot = 255
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
                        global.plot = 200
                        roomtogo = room_dw_console_room
                        scr_losechar()
                        global.flag[1055] = 3
                        break
                        
                    case 37: // sword route board 3
                        global.plot = 200
                        roomtogo = room_board_3_sword
                        scr_losechar()
                        global.flag[1055] = 3
                        break
                        
                    case 38: // sword route board 3 dungeon
                        global.plot = 200
                        roomtogo = room_board_dungeon_3
                        scr_losechar()
                        global.flag[1055] = 4
                        break
                        
                    case 39: // pre-shadow mantle battle
                        global.plot = 200
                        roomtogo = room_board_preshadowmantle
                        scr_losechar()
                        global.flag[1055] = 5
                        break
                        
                    case 40: // shadow mantle battle
                        global.plot = 200
                        roomtogo = room_shadowmantle
                        scr_losechar()
                        global.flag[1055] = 5
                        break
                        
                    case 41: // post-shadow mantle battle
                        global.plot = 200
                        roomtogo = room_board_prepostshadowmantle
                        scr_losechar()
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
                snd_free_all()
                global.flag[1173] = 5
                global.flag[1174] = 5
                room_goto(roomtogo)
                global.chemg_menu_depth = 0
            }
            else if (choice == "[tempflag]")
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
                            else if (is_string(global.tempflag[choice_data]))
                                global.tempflag[flagid] = string(varname)
                            else
                                show_message("error????")
                        }
                    }
                    else
                    {
                        show_message("Too high!! Max tempflag count is 100.")
                    }
                }
            }
            else
            {
                show_debug_message("unknown menu cmd:" + choice)
            }
        }
        else if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_face1))
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
        keyboard_clear(vk_up)
        keyboard_clear(vk_down)
        keyboard_clear(vk_left)
        keyboard_clear(vk_right)
        keyboard_clear(vk_escape)
        keyboard_clear(vk_enter)
        keyboard_clear(ord("X"))
        keyboard_clear(ord("Z"))
        if (change != 0)
            global.chemg_menu_indices[depth_ndx] = (global.chemg_menu_indices[depth_ndx] + num_choices + change) % num_choices
        draw_set_font(fnt_main)
        draw_set_colour(c_white)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        var yy = global.chemg_yoffset
        var vspacing = 15
        scr_84_draw_text_outline(10, yy, "====[ 8-4 Debug Menu ]====[ D$: " + string(global.gold) + " $: " + string(global.lgold) + " PTs: " + string(global.flag[1044]) + " ]")
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
        if (global.chemg_show_fps == 1)
        {
            scr_84_draw_text_outline(chemg_x, chemg_y + 16 + (8 * _counter), "FPS: " + string(fps))
            _counter++
        }
    }
    if (global.chemg_menu_depth > 0)
    {
        draw_set_font(fnt_main)
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
            ft[array_length_1d(ft)] = "pap font"
            ft[array_length_1d(ft)] = 16
            ft[array_length_1d(ft)] = ")??? font"
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
            ft[array_length_1d(ft)] = 30
            ft[array_length_1d(ft)] = "susie dark world"
            ft[array_length_1d(ft)] = 31
            ft[array_length_1d(ft)] = "ralsei dark world"
            ft[array_length_1d(ft)] = 32
            ft[array_length_1d(ft)] = "lancer dark world"
            ft[array_length_1d(ft)] = 33
            ft[array_length_1d(ft)] = "king dark world"
            ft[array_length_1d(ft)] = 35
            ft[array_length_1d(ft)] = "joker dark world"
            ft[array_length_1d(ft)] = 36
            ft[array_length_1d(ft)] = "NORMAL FONT SILENT"
            ft[array_length_1d(ft)] = 37
            ft[array_length_1d(ft)] = "susie dark world slow, spaced."
            ft[array_length_1d(ft)] = 40
            ft[array_length_1d(ft)] = "inteo"
            ft[array_length_1d(ft)] = 41
            ft[array_length_1d(ft)] = "intro slower"
            ft[array_length_1d(ft)] = 42
            ft[array_length_1d(ft)] = "big silent slower"
            ft[array_length_1d(ft)] = 45
            ft[array_length_1d(ft)] = "battle dialogue ral"
            ft[array_length_1d(ft)] = 46
            ft[array_length_1d(ft)] = "battle dialogue lan"
            ft[array_length_1d(ft)] = 47
            ft[array_length_1d(ft)] = "battle dialogue sus"
            ft[array_length_1d(ft)] = 48
            ft[array_length_1d(ft)] = "king dark world battle"
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
            ft[array_length_1d(ft)] = 60
            ft[array_length_1d(ft)] = "SLOWER, SILENT 2"
            ft[array_length_1d(ft)] = 666
            ft[array_length_1d(ft)] = "GLOW TEXT"
            ft[array_length_1d(ft)] = 667
            ft[array_length_1d(ft)] = "GLOW TEXT 2"
            ft[array_length_1d(ft)] = -1
            ft[array_length_1d(ft)] = 3
            ft[array_length_1d(ft)] = -2
            ft[array_length_1d(ft)] = 7
            ft[array_length_1d(ft)] = -3
            ft[array_length_1d(ft)] = 2
            ft[array_length_1d(ft)] = -4
            ft[array_length_1d(ft)] = 10
            ft[array_length_1d(ft)] = -5
            ft[array_length_1d(ft)] = 0
            ft[array_length_1d(ft)] = -6
            ft[array_length_1d(ft)] = 9
            ft[array_length_1d(ft)] = -7
            ft[array_length_1d(ft)] = 1
            ft[array_length_1d(ft)] = -8
            ft[array_length_1d(ft)] = 8
            ft[array_length_1d(ft)] = -9
            ft[array_length_1d(ft)] = 11
            ft[array_length_1d(ft)] = -10
            ft[array_length_1d(ft)] = 5
            ft[array_length_1d(ft)] = -11
            ft[array_length_1d(ft)] = 4
            ft[array_length_1d(ft)] = -12
            ft[array_length_1d(ft)] = 6
            global.chemg_font_types = ft
            global.chemg_font_type_ndx = 0
        }
        var ft = global.chemg_font_types
        var num_types = array_length_1d(ft) / 2
        var change = 0
        if (keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_padr))
            change = 1
        else if (keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_padl))
            change = -1
        global.chemg_font_type_ndx = (global.chemg_font_type_ndx + change + num_types) % num_types
        var fndx = global.chemg_font_type_ndx * 2
        var xx = 10
        var yy = 250
        var strings
        strings[0] = "Pack my box with five"
        strings[1] = "dozen liquor jugs."
        strings[2] = "これは日本語です。"
        strings[3] = "魔物に食われない！"
        var typer = ft[fndx]
        var font, vspacing, msg
        if (typer >= 0)
        {
            global.typer = typer
            scr_texttype()
            font = myfont
            msg = "(" + string(global.typer) + ") " + ft[fndx + 1] + ", font: " + font_get_name(myfont)
            vspacing = vspace
        }
        else
        {
            font = ft[fndx + 1]
            msg = "font: " + font_get_name(font)
            vspacing = font_get_size(font) + 2
        }
        draw_set_font(font)
        draw_set_colour(c_white)
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
}
