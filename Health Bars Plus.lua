-----------------------------------------------
---------Health Bars Plus v0.1-----------------
---------    Created By:    -------------------
---------  GameChampCrafted  ------------------
-------- (Aimware - CarterPoe) ----------------
---------   Date: 2/8/2021   ------------------
-----------------------------------------------
--------- Tester(s):         ------------------
--------- Agentsix1          ------------------
-----------------------------------------------
--
-- This is a product of the G&A Development Team
--

--Local vars
local _var_myteam_nextheight_health = 0
local _var_myteam_nextheight_armor = 0
local _var_enemyteam_nextheight_health = 0
local _var_enemyteam_nextheight_armor = 0

--Screen dimensions
local _var_screenW, _var_screenH = draw.GetScreenSize()

--Default Slider Values
local _slider__gttg_slider_myteamxpos = 150
local _slider__gttg_slider_myteamypos = 20 - 18

local _slider__gttlg_slider_hbplxpos = 150
local _slider__gttlg_slider_hbplypos = 20 - 18

local _slider__gttg_slider_enemyteamxpos = 150
local _slider__gttg_slider_enemyteamypos = 20 - 18

--Fonts
local _defaultfont = draw.CreateFont("Bahnschrift", 20)
local _big_defaultfont = draw.CreateFont("Bahnschrift", 30)

--GUI
--Script GUI Reference (Only 1)
local _gui_ref_misc = gui.Reference("VISUALS")

--GUI Tabs
--Start _gui_tab_teams

--Groupbox measurements for Toggle
local _x_gtt_groupbox_toggle = 16
local _y_gtt_groupbox_toggle = 16
local _h_gtt_groupbox_toggle = 318
local _w_gtt_groupbox_toggle = 296

--Groupbox measurements for HBP Team Positions
local _x_gtt_groupbox_hbpteamspos = _x_gtt_groupbox_toggle*2 + _w_gtt_groupbox_toggle
local _y_gtt_groupbox_hbpteamspos = 16
local _h_gtt_groupbox_hbpteamspos = 240
local _w_gtt_groupbox_hbpteamspos = 296

--Groupbox measurements for HBP bar sizes
local _x_gtt_groupbox_hbpbarsizes = _x_gtt_groupbox_toggle*2 + _w_gtt_groupbox_toggle
local _y_gtt_groupbox_hbpbarsizes = _y_gtt_groupbox_hbpteamspos*2 + _h_gtt_groupbox_hbpteamspos
local _h_gtt_groupbox_hbpbarsizes = 240
local _w_gtt_groupbox_hbpbarsizes = 296

--Groupbox measurements for HBP spacing
local _x_gtt_groupbox_hbpspacing = _x_gtt_groupbox_toggle*2 + _w_gtt_groupbox_toggle
local _y_gtt_groupbox_hbpspacing = _y_gtt_groupbox_hbpbarsizes + _h_gtt_groupbox_hbpbarsizes + _y_gtt_groupbox_hbpteamspos
local _h_gtt_groupbox_hbpspacing = 192
local _w_gtt_groupbox_hbpspacing = 296

--Groupbox measurements for HBP colors
local _x_gtt_groupbox_hbpcolors = _x_gtt_groupbox_toggle
local _y_gtt_groupbox_hbpcolors = _y_gtt_groupbox_toggle*2 + _h_gtt_groupbox_toggle
local _h_gtt_groupbox_hbpcolors = 102
local _w_gtt_groupbox_hbpcolors = 296

--Groupbox measurements for HBP nametag char length
local _x_gtt_groupbox_hbpnametaglength = _x_gtt_groupbox_hbpspacing
local _y_gtt_groupbox_hbpnametaglength = _h_gtt_groupbox_hbpspacing + _y_gtt_groupbox_hbpspacing + _y_gtt_groupbox_hbpteamspos
local _h_gtt_groupbox_hbpnametaglength = 102
local _w_gtt_groupbox_hbpnametaglength = 296

--Health Bars Plus Tab
local _gui_tab_teams = gui.Tab(_gui_ref_misc, "HBP_gui_tab_teams", "Health Bars Plus")

--Groupbox for Toggle
local _gtt_groupbox_toggle = gui.Groupbox(_gui_tab_teams, "Toggle", _x_gtt_groupbox_toggle, _y_gtt_groupbox_toggle, _w_gtt_groupbox_toggle, _h_gtt_groupbox_toggle) --ref gttg

--Checkbox for enabling the health bars plus hud
local _gttg_checkbox_enablehbphud = gui.Checkbox(_gtt_groupbox_toggle, "HBP_gttg_checkbox_enablehbphud", "Enable HBP HUD", false)
_gttg_checkbox_enablehbphud:SetDescription("Enables Health Bars Plus HUD.")

--Checkbox for showing my team bars
local _gttg_checkbox_showmyteam = gui.Checkbox(_gtt_groupbox_toggle, "HBP_gttg_checkbox_showmyteam", "Show my Team", false)
_gttg_checkbox_showmyteam:SetDescription("Shows the bars of the current team you're on.")

--Checkbox for showing enemy team bars
local _gttg_checkbox_showenemyteam = gui.Checkbox(_gtt_groupbox_toggle, "HBP_gttg_checkbox_showenemyteam", "Show Enemy Team", false)
_gttg_checkbox_showenemyteam:SetDescription("Shows the bars of the enemy team.")

--Checkbox for showing yourself in your team row
local _gttg_checkbox_showmyplayer = gui.Checkbox(_gtt_groupbox_toggle, "HBP_gttg_checkbox_showmyplayer", "Show My Player", false)
_gttg_checkbox_showmyplayer:SetDescription("Shows your player in your team.")

--Checkbox for showing health/armor counters
local _gttg_checkbox_showcounters = gui.Checkbox(_gtt_groupbox_toggle, "HBP_gttg_checkbox_showcounters", "Show Health/Armor Counters & Defuse Icon", false)
_gttg_checkbox_showcounters:SetDescription("Shows health and armor number counters & defuse icon.")

--Groupbox for HBP team positions
local _gtt_groupbox_hbpteamspos = gui.Groupbox(_gui_tab_teams, "HBP Team Positions", _x_gtt_groupbox_hbpteamspos, _y_gtt_groupbox_hbpteamspos, _w_gtt_groupbox_hbpteamspos, _h_gtt_groupbox_hbpteamspos)

--Slider for my team x pos
local _gttg_slider_myteamxpos = gui.Slider(_gtt_groupbox_hbpteamspos, "HBP_gttg_slider_myteamxpos", "My Team [XPos]", 0, 0, _var_screenW - _slider__gttg_slider_myteamxpos + 300)

--Slider for my team y pos
local _gttg_slider_myteamypos = gui.Slider(_gtt_groupbox_hbpteamspos, "HBP_gttg_slider_myteamypos", "My Team [YPos]", 0, 0, _var_screenH - _slider__gttg_slider_myteamypos)

--Slider for enemy team x pos
local _gttg_slider_enemyteamxpos = gui.Slider(_gtt_groupbox_hbpteamspos, "HBP_gttg_slider_enemyteamxpos", "Enemy Team [XPos]", 200, 0, _var_screenW - _slider__gttg_slider_enemyteamxpos + 300)

--Slider for enemy team y pos
local _gttg_slider_enemyteamypos = gui.Slider(_gtt_groupbox_hbpteamspos, "HBP_gttg_slider_enemyteamypos", "Enemy Team [YPos]", 0, 0, _var_screenH - _slider__gttg_slider_enemyteamypos)

--Groupbox for HBP bar sizes
local _gtt_groupbox_hbpbarsizes = gui.Groupbox(_gui_tab_teams, "HBP Bar Sizes", _x_gtt_groupbox_hbpbarsizes, _y_gtt_groupbox_hbpbarsizes, _w_gtt_groupbox_hbpbarsizes, _h_gtt_groupbox_hbpbarsizes)

--Slider for my team health height 
local _gttg_slider_barhealthheight = gui.Slider(_gtt_groupbox_hbpbarsizes, "HBP_gttg_slider_barhealthheight", "Health Bar [Height]", 20, 13, 200)

--Slider for my team health width 
local _gttg_slider_barhealthwidth = gui.Slider(_gtt_groupbox_hbpbarsizes, "HBP_gttg_slider_barhealthwidth", "Health Bar [Width]", 150, 5, 300)

--Slider for my team armor height 
local _gttg_slider_bararmorheight = gui.Slider(_gtt_groupbox_hbpbarsizes, "HBP_gttg_slider_bararmorheight", "Armor Bar [Height]", 20, 13, 200)

--Slider for my team armor width 
local _gttg_slider_bararmorwidth = gui.Slider(_gtt_groupbox_hbpbarsizes, "HBP_gttg_slider_bararmorwidth", "Armor Bar [Width]", 150, 5, 300)

--Groupbox for HBP spacing
local _gtt_groupbox_hbpspacing = gui.Groupbox(_gui_tab_teams, "HBP Spacing", _x_gtt_groupbox_hbpspacing, _y_gtt_groupbox_hbpspacing, _w_gtt_groupbox_hbpspacing, _h_gtt_groupbox_hbpspacing)

--Slider for text spacing
local _gttg_slider_textspacing = gui.Slider(_gtt_groupbox_hbpspacing, "HBP_gttg_slider_textspacing", "Text Spacing", 0, 0, 50)

--Slider for bar spacing
local _gttg_slider_barspacing = gui.Slider(_gtt_groupbox_hbpspacing, "HBP_gttg_slider_barspacing", "Bar Spacing", 0, 0, 50)

--Slider for player spacing
local _gttg_slider_playerspacing = gui.Slider(_gtt_groupbox_hbpspacing, "HBP_gttg_slider_playerspacing", "Player Spacing", 0, 0, 50)

--Groupbox for HBP colors
local _gtt_groupbox_hbpcolors = gui.Groupbox(_gui_tab_teams, "HBP Colors", _x_gtt_groupbox_hbpcolors, _y_gtt_groupbox_hbpcolors, _w_gtt_groupbox_hbpcolors, _h_gtt_groupbox_hbpcolors)

--Color picker for my team text color
local _gttg_colorpicker_myteamtextcolor = gui.ColorPicker(_gtt_groupbox_hbpcolors, "HBP_gttg_colorpicker_myteamtextcolor", "My Team Text Color", 246, 228, 0, 255)

--Color picker for my team health filler color
local _gttg_colorpicker_myteamhealthfillercolor = gui.ColorPicker(_gtt_groupbox_hbpcolors, "HBP_gttg_colorpicker_myteamhealthfillercolor", "My Team Health Filler Color", 255, 14, 14, 255)

--Color picker for my team armor filler color
local _gttg_colorpicker_myteamarmorfillercolor = gui.ColorPicker(_gtt_groupbox_hbpcolors, "HBP_gttg_colorpicker_myteamarmorfillercolor", "My Team Armor Filler Color", 13, 131, 255, 255)

--Color picker for my team placeholder color
local _gttg_colorpicker_myteamplaceholdercolor = gui.ColorPicker(_gtt_groupbox_hbpcolors, "HBP_gttg_colorpicker_myteamplaceholdercolor", "My Team Placeholder Color", 14, 14, 14, 255)

--Color picker for Enemy team text color
local _gttg_colorpicker_enemyteamtextcolor = gui.ColorPicker(_gtt_groupbox_hbpcolors, "HBP_gttg_colorpicker_enemyteamtextcolor", "Enemy Team Text Color", 246, 228, 0, 255)

--Color picker for Enemy team health filler color
local _gttg_colorpicker_enemyteamhealthfillercolor = gui.ColorPicker(_gtt_groupbox_hbpcolors, "HBP_gttg_colorpicker_enemyteamhealthfillercolor", "Enemy Team Health Filler Color", 255, 14, 14, 255)

--Color picker for Enemy team armor filler color
local _gttg_colorpicker_enemyteamarmorfillercolor = gui.ColorPicker(_gtt_groupbox_hbpcolors, "HBP_gttg_colorpicker_enemyteamarmorfillercolor", "Enemy Team Armor Filler Color", 13, 131, 255, 255)

--Color picker for Enemy team placeholder color
local _gttg_colorpicker_enemyteamplaceholdercolor = gui.ColorPicker(_gtt_groupbox_hbpcolors, "HBP_gttg_colorpicker_enemyteamplaceholdercolor", "Enemy Team Placeholder Color", 14, 14, 14, 255)

--Color picker for defuse icon color
local _gttg_colorpicker_defuseiconcolor = gui.ColorPicker(_gtt_groupbox_hbpcolors, "HBP_gttg_colorpicker_defuseiconcolor", "Defuse Icon Color", 13, 131, 255, 255)

--Groupbox for HBP nametag length
local _gtt_groupbox_hbpnametaglength = gui.Groupbox(_gui_tab_teams, "HBP Nametag Char Length", _x_gtt_groupbox_hbpnametaglength, _y_gtt_groupbox_hbpnametaglength, _w_gtt_groupbox_hbpnametaglength, _h_gtt_groupbox_hbpnametaglength)

--Slider for nametag char length
local _gttg_slider_nametagcharlength = gui.Slider(_gtt_groupbox_hbpnametaglength, "HBP_gttg_slider_nametagcharlength", "Nametag Char Length", 10, 0, 40)

--Groupbox measurements for Toggle (local)
local _x_gttl_groupbox_toggle = 16
local _y_gttl_groupbox_toggle = 16
local _h_gttl_groupbox_toggle = 156
local _w_gttl_groupbox_toggle = 296

--Groupbox measurements for HBPL Position
local _x_gttl_groupbox_hbplpos = _x_gttl_groupbox_toggle*2 + _w_gttl_groupbox_toggle
local _y_gttl_groupbox_hbplpos = 16
local _h_gttl_groupbox_hbplpos = 144
local _w_gttl_groupbox_hbplpos = 296

--Groupbox measurements for HBPL bar sizes
local _x_gttl_groupbox_hbplbarsizes = _x_gttl_groupbox_toggle*2 + _w_gttl_groupbox_toggle
local _y_gttl_groupbox_hbplbarsizes = _y_gttl_groupbox_hbplpos*2 + _h_gttl_groupbox_hbplpos
local _h_gttl_groupbox_hbplbarsizes = 240
local _w_gttl_groupbox_hbplbarsizes = 296

--Groupbox measurements for HBPL individual bar positions
local _x_gttl_groupbox_hbplindivbarpos = _x_gttl_groupbox_toggle*2 + _w_gttl_groupbox_toggle
local _y_gttl_groupbox_hbplindivbarpos = _y_gttl_groupbox_hbplbarsizes + _h_gttl_groupbox_hbplbarsizes + _y_gttl_groupbox_hbplpos
local _h_gttl_groupbox_hbplindivbarpos = 240
local _w_gttl_groupbox_hbplindivbarpos = 296

--Groupbox measurements for HBPL Counter Positions
local _x_gttl_groupbox_hbplcounterpos = _x_gttl_groupbox_hbplindivbarpos
local _y_gttl_groupbox_hbplcounterpos = _h_gttl_groupbox_hbplindivbarpos + _y_gttl_groupbox_hbplindivbarpos + _y_gttl_groupbox_hbplpos
local _h_gttl_groupbox_hbplcounterpos = 102
local _w_gttl_groupbox_hbplcounterpos = 296

--Groupbox measurements for HBPL colors
local _x_gttl_groupbox_hbplcolors = _x_gttl_groupbox_toggle
local _y_gttl_groupbox_hbplcolors = _y_gttl_groupbox_toggle*2 + _h_gttl_groupbox_toggle - 2
local _h_gttl_groupbox_hbplcolors = 311
local _w_gttl_groupbox_hbplcolors = 296

--Health Bars Plus Local Tab
local _gui_tab_teams_local = gui.Tab(_gui_ref_misc, "HBP_gui_tab_teams_local", "Health Bars Plus Local")

--Groupbox for Toggle
local _gttl_groupbox_toggle = gui.Groupbox(_gui_tab_teams_local, "Toggle", _x_gttl_groupbox_toggle, _y_gttl_groupbox_toggle, _w_gttl_groupbox_toggle, _h_gttl_groupbox_toggle) --ref gttg

--Checkbox for enabling the hud part
local _gttlg_checkbox_enablehbplocalhud = gui.Checkbox(_gttl_groupbox_toggle, "HBP_gttlg_checkbox_enablehbplocalhud", "Enable HBP Local HUD", false)
_gttlg_checkbox_enablehbplocalhud:SetDescription("Enables Health Bars Plus Local HUD")

--Checkbox for showing health/armor counters
local _gttlg_checkbox_showcounters = gui.Checkbox(_gttl_groupbox_toggle, "HBP_gttlg_checkbox_showcounters", "Show Health/Armor Counters & Defuse Icon", false)
_gttlg_checkbox_showcounters:SetDescription("Shows health and armor number counters & defuse icon.")

--Groupbox for HBPL position
local _gttl_groupbox_hbplpos = gui.Groupbox(_gui_tab_teams_local, "HBPL Position", _x_gttl_groupbox_hbplpos, _y_gttl_groupbox_hbplpos, _w_gttl_groupbox_hbplpos, _h_gttl_groupbox_hbplpos)

--Slider for HBPL x pos
local _gttlg_slider_hbplxpos = gui.Slider(_gttl_groupbox_hbplpos, "HBP_gttlg_slider_hbplxpos", "[XPos]", 0, 0, _var_screenW - _slider__gttlg_slider_hbplxpos + 300)

--Slider for HBPL y pos
local _gttlg_slider_hbplypos = gui.Slider(_gttl_groupbox_hbplpos, "HBP_gttlg_slider_hbplypos", "[YPos]", 0, 0, _var_screenH - _slider__gttlg_slider_hbplypos)

--Groupbox for HBPL bar sizes
local _gttl_groupbox_hbplbarsizes = gui.Groupbox(_gui_tab_teams_local, "HBPL Bar Sizes", _x_gttl_groupbox_hbplbarsizes, _y_gttl_groupbox_hbplbarsizes, _w_gttl_groupbox_hbplbarsizes, _h_gttl_groupbox_hbplbarsizes)

--Slider for hbpl health height 
local _gttlg_slider_lbarhealthheight = gui.Slider(_gttl_groupbox_hbplbarsizes, "HBP_gttlg_slider_lbarhealthheight", "Health Bar [Height]", 20, 13, 200)

--Slider for hbpl health width 
local _gttlg_slider_lbarhealthwidth = gui.Slider(_gttl_groupbox_hbplbarsizes, "HBP_gttlg_slider_lbarhealthwidth", "Health Bar [Width]", 150, 5, 300)

--Slider for hbpl armor height 
local _gttlg_slider_lbararmorheight = gui.Slider(_gttl_groupbox_hbplbarsizes, "HBP_gttlg_slider_lbararmorheight", "Armor Bar [Height]", 20, 13, 200)

--Slider for hbpl armor width 
local _gttlg_slider_lbararmorwidth = gui.Slider(_gttl_groupbox_hbplbarsizes, "HBP_gttlg_slider_lbararmorwidth", "Armor Bar [Width]", 150, 5, 300)

--Groupbox for HBPL individual bar positions
local _gttl_groupbox_hbplindivbarpos = gui.Groupbox(_gui_tab_teams_local, "HBPL Bar Positions", _x_gttl_groupbox_hbplindivbarpos, _y_gttl_groupbox_hbplindivbarpos, _w_gttl_groupbox_hbplindivbarpos, _h_gttl_groupbox_hbplindivbarpos)

--Slider for HBPL individual health bar x pos
local _gttlg_slider_hbplhealthindivbarxpos = gui.Slider(_gttl_groupbox_hbplindivbarpos, "HBP_gttlg_slider_hbplhealthindivbarxpos", "Health Bar [XPos]", 0, 0, _var_screenW - _slider__gttlg_slider_hbplxpos + 300)

--Slider for HBPL individual health bar y pos
local _gttlg_slider_hbplhealthindivbarypos = gui.Slider(_gttl_groupbox_hbplindivbarpos, "HBP_gttlg_slider_hbplhealthindivbarypos", "Health Bar [YPos]", 227, 0, _var_screenH - _slider__gttlg_slider_hbplypos)

--Slider for HBPL individual armor bar x pos
local _gttlg_slider_hbplarmorindivbarxpos = gui.Slider(_gttl_groupbox_hbplindivbarpos, "HBP_gttlg_slider_hbplarmorindivbarxpos", "Armor Bar [XPos]", 0, 0, _var_screenW - _slider__gttlg_slider_hbplxpos + 300)

--Slider for HBPL individual armor bar y pos
local _gttlg_slider_hbplarmorindivbarypos = gui.Slider(_gttl_groupbox_hbplindivbarpos, "HBP_gttlg_slider_hbplarmorindivbarypos", "Armor Bar [YPos]", 238, 0, _var_screenH - _slider__gttlg_slider_hbplypos)

--Groupbox for HBP nametag length
local _gttl_groupbox_hbplcounterpos = gui.Groupbox(_gui_tab_teams_local, "HBPL Counter Positions", _x_gttl_groupbox_hbplcounterpos, _y_gttl_groupbox_hbplcounterpos, _w_gttl_groupbox_hbplcounterpos, _h_gttl_groupbox_hbplcounterpos)

--Slider for HBPL health counter x pos
local _gttlg_slider_hbplhealthcounterxpos = gui.Slider(_gttl_groupbox_hbplcounterpos, "HBP_gttlg_slider_hbplhealthcounterxpos", "Health Counter [XPos]", 35, 0, _var_screenW - _slider__gttlg_slider_hbplxpos + 300)

--Slider for HBPL health counter y pos
local _gttlg_slider_hbplhealthcounterypos = gui.Slider(_gttl_groupbox_hbplcounterpos, "HBP_gttlg_slider_hbplhealthcounterypos", "Health Counter [YPos]", 204, 0, _var_screenH - _slider__gttlg_slider_hbplypos)

--Slider for HBPL armor counter x pos
local _gttlg_slider_hbplarmorcounterxpos = gui.Slider(_gttl_groupbox_hbplcounterpos, "HBP_gttlg_slider_hbplarmorcounterxpos", "Armor Counter [XPos]", 0, 0, _var_screenW - _slider__gttlg_slider_hbplxpos + 300)

--Slider for HBPL armor counter y pos
local _gttlg_slider_hbplarmorcounterypos = gui.Slider(_gttl_groupbox_hbplcounterpos, "HBP_gttlg_slider_hbplarmorcounterypos", "Armor Counter [YPos]", 204, 0, _var_screenH - _slider__gttlg_slider_hbplypos)

--Slider for HBPL defuse icon x pos
local _gttlg_slider_hbpldefuseiconxpos = gui.Slider(_gttl_groupbox_hbplcounterpos, "HBP_gttlg_slider_hbpldefuseiconxpos", "Defuse Icon [XPos]", 70, 0, _var_screenW - _slider__gttlg_slider_hbplxpos + 300)

--Slider for HBPL defuse icon y pos
local _gttlg_slider_hbpldefuseiconypos = gui.Slider(_gttl_groupbox_hbplcounterpos, "HBP_gttlg_slider_hbpldefuseiconypos", "Defuse Icon [YPos]", 204, 0, _var_screenH - _slider__gttlg_slider_hbplypos)

--Groupbox for HBPL colors
local _gttl_groupbox_hbplcolors = gui.Groupbox(_gui_tab_teams_local, "HBPL Colors", _x_gttl_groupbox_hbplcolors, _y_gttl_groupbox_hbplcolors, _w_gttl_groupbox_hbplcolors, _h_gttl_groupbox_hbplcolors)

--Color picker for my team health filler color
local _gttlg_colorpicker_healthfillercolor = gui.ColorPicker(_gttl_groupbox_hbplcolors, "HBP_gttlg_colorpicker_healthfillercolor", "Health Filler Color", 255, 14, 14, 255)

--Color picker for health text color
local _gttlg_colorpicker_healthtextcolor = gui.ColorPicker(_gttl_groupbox_hbplcolors, "HBP_gttlg_colorpicker_healthtextcolor", "Health Text Color", 255, 14, 14, 255)

--Color picker for my team armor filler color
local _gttlg_colorpicker_armorfillercolor = gui.ColorPicker(_gttl_groupbox_hbplcolors, "HBP_gttlg_colorpicker_armorfillercolor", "Armor Filler Color", 13, 131, 255, 255)

--Color picker for my team armor filler color
local _gttlg_colorpicker_armortextcolor = gui.ColorPicker(_gttl_groupbox_hbplcolors, "HBP_gttlg_colorpicker_armortextcolor", "Armor Text Color", 13, 131, 255, 255)

--Color picker for my team placeholder color
local _gttlg_colorpicker_placeholdercolor = gui.ColorPicker(_gttl_groupbox_hbplcolors, "HBP_gttlg_colorpicker_placeholdercolor", "Placeholder Color", 14, 14, 14, 255)

--Color picker for defuse icon color
local _gttlg_colorpicker_defuseiconcolor = gui.ColorPicker(_gttl_groupbox_hbplcolors, "HBP_gttlg_colorpicker_defuseiconcolor", "Defuse Icon Color", 13, 131, 255, 255)

--Groupbox measurements for Toggle (local)
local _x_gttc_groupbox_hbpconfig = 16
local _y_gttc_groupbox_hbpconfig = 16
local _h_gttc_groupbox_hbpconfig = 432
local _w_gttc_groupbox_hbpconfig = 296*2+16

--Health Bars Plus Config Tab
--Disable for right now
--[=====[ 
local _gui_tab_teams_config = gui.Tab(_gui_ref_misc, "HBP_gui_tab_teams_config", "Health Bars Plus Config")

--Groupbox for HBP config
local _gttc_groupbox_hbpconfig = gui.Groupbox(_gui_tab_teams_config, "Manage Health Bar Plus Configurations", _x_gttc_groupbox_hbpconfig, _y_gttc_groupbox_hbpconfig, _w_gttc_groupbox_hbpconfig, _h_gttc_groupbox_hbpconfig)

--Listbox for HBP configs
local _gttcg_combobox_hbpconfigs = gui.Listbox(_gttc_groupbox_hbpconfig, "HBP_gttcg_listbox_hbpconfigs", _h_gttc_groupbox_hbpconfig, "")
_gttcg_combobox_hbpconfigs:SetWidth(280)

--Editbox for making config name
local _gttcg_editbox_hbpeditconfigname = gui.Editbox(_gttc_groupbox_hbpconfig, "HBP_gttcg_editbox_hbpeditconfigname", "Name")
_gttcg_editbox_hbpeditconfigname:SetDescription("Create or rename config.")
_gttcg_editbox_hbpeditconfigname:SetWidth(280)
_gttcg_editbox_hbpeditconfigname:SetPosX(296)
_gttcg_editbox_hbpeditconfigname:SetPosY(0)

--Button for creating a new config file
local _gttcg_button_hbpcreateconfig = gui.Button(_gttc_groupbox_hbpconfig, "Create", function()

end)
_gttcg_button_hbpcreateconfig:SetHeight(28)
_gttcg_button_hbpcreateconfig:SetWidth(136)
_gttcg_button_hbpcreateconfig:SetPosX(296)
_gttcg_button_hbpcreateconfig:SetPosY(64)

--Button to rename a config file
local _gttcg_button_hbprenameconfig = gui.Button(_gttc_groupbox_hbpconfig, "Rename", function()

end)
_gttcg_button_hbprenameconfig:SetHeight(28)
_gttcg_button_hbprenameconfig:SetWidth(136)
_gttcg_button_hbprenameconfig:SetPosX(304 + 136)
_gttcg_button_hbprenameconfig:SetPosY(64)
--]=====]
--End _gui_tab_teams

--Normal accessing functions

--Handle Health Bar Plus Local HUD
function handle_HBPL()
    local player = entities.GetLocalPlayer()
    --Check if player exists or not
    if player == nil then
        return
    end
    --Create Health box dimensions
    local HealthBoxW = 0 + _gttlg_slider_lbarhealthwidth:GetValue() 
    local HealthBoxH = 0 + _gttlg_slider_lbarhealthheight:GetValue() + _gttg_slider_textspacing:GetValue()
    local HealthBoxX = 0 + _gttlg_slider_hbplxpos:GetValue() + _gttlg_slider_hbplhealthindivbarxpos:GetValue()
    local HealthBoxY = 10 + _gttg_slider_textspacing:GetValue()
    local HealthBoxSliderY = _gttlg_slider_hbplypos:GetValue() - HealthBoxY + 18 + _gttlg_slider_hbplhealthindivbarypos:GetValue() - 20 + 2
    --Create Armor box dimensions
    local ArmorBoxW = 0 + _gttlg_slider_lbararmorwidth:GetValue() 
    local ArmorBoxH = 0 + _gttlg_slider_lbararmorheight:GetValue() + _gttg_slider_textspacing:GetValue()
    local ArmorBoxX = 0 + _gttlg_slider_hbplxpos:GetValue() + _gttlg_slider_hbplarmorindivbarxpos:GetValue()
    local ArmorBoxY = 10  + _gttg_slider_textspacing:GetValue()
    local ArmorBoxSliderY = _gttlg_slider_hbplypos:GetValue() - ArmorBoxY + 18 + _gttlg_slider_hbplarmorindivbarypos:GetValue() - 35 + 6
    --Make a margin between each box on y axis
    local PlayerMargin = 30 + _gttg_slider_playerspacing:GetValue()
    local BarMargin = 11 + _gttg_slider_barspacing:GetValue()
    --Create Player Text dimensions
    local PlayerTextX = 0
    local PlayerTextY = 0 + _gttlg_slider_hbplypos:GetValue() - _gttg_slider_textspacing:GetValue()
    --Get the boxW size by scaling the health/armor to it
    local HealthW = HealthBoxW/player:GetMaxHealth()
    local ArmorW = ArmorBoxW/100
    --vars
    local m_ArmorValue = player:GetProp("m_ArmorValue")

    --Create Health Bar Placeholder
    draw.Color(_gttlg_colorpicker_placeholdercolor:GetValue())
    draw.FilledRect(HealthBoxX, HealthBoxY + HealthBoxSliderY, player:GetMaxHealth()*HealthW + HealthBoxX, HealthBoxH + HealthBoxSliderY)

    --Create Health Bar Placeholder Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(HealthBoxX, HealthBoxY + HealthBoxSliderY, player:GetMaxHealth()*HealthW + HealthBoxX, HealthBoxH + HealthBoxSliderY)

    --Create Health Bar Filler
    draw.Color(_gttlg_colorpicker_healthfillercolor:GetValue())
    draw.FilledRect(HealthBoxX, HealthBoxY + HealthBoxSliderY, player:GetHealth()*HealthW + HealthBoxX, HealthBoxH + HealthBoxSliderY)

    --Create Health Bar Filler Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(HealthBoxX, HealthBoxY + HealthBoxSliderY, player:GetHealth()*HealthW + HealthBoxX, HealthBoxH + HealthBoxSliderY)

    --Create Armor Bar Placeholders
    draw.Color(_gttlg_colorpicker_placeholdercolor:GetValue())
    draw.FilledRect(ArmorBoxX, ArmorBoxY + BarMargin + ArmorBoxSliderY, 100*ArmorW + ArmorBoxX, ArmorBoxH + BarMargin + ArmorBoxSliderY)

    --Create Armor Bar Placeholders Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(ArmorBoxX, ArmorBoxY + BarMargin + ArmorBoxSliderY, 100*ArmorW + ArmorBoxX, ArmorBoxH + BarMargin + ArmorBoxSliderY)

    --Create Armor Bar Filler
    draw.Color(_gttlg_colorpicker_armorfillercolor:GetValue())
    draw.FilledRect(ArmorBoxX, ArmorBoxY + BarMargin + ArmorBoxSliderY, m_ArmorValue*ArmorW + ArmorBoxX, ArmorBoxH + BarMargin + ArmorBoxSliderY)
    
    --Create Armor Bar Placeholders Filler Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(ArmorBoxX, ArmorBoxY + BarMargin + ArmorBoxSliderY, m_ArmorValue*ArmorW + ArmorBoxX, ArmorBoxH + BarMargin + ArmorBoxSliderY)

    --Create font to be used
    draw.SetFont(_big_defaultfont)

    --Check if showing counters is enabled
    if _gttlg_checkbox_showcounters:GetValue() then
        --Armor Counter Text
        draw.Color(_gttlg_colorpicker_armortextcolor:GetValue())
        draw.TextShadow(PlayerTextX + _gttlg_slider_hbplarmorcounterxpos:GetValue(), PlayerTextY + _gttlg_slider_hbplarmorcounterypos:GetValue(), m_ArmorValue)

        --Health Counter Text
        draw.Color(_gttlg_colorpicker_healthtextcolor:GetValue())
        draw.TextShadow(PlayerTextX + _gttlg_slider_hbplhealthcounterxpos:GetValue(), PlayerTextY + _gttlg_slider_hbplhealthcounterypos:GetValue(), player:GetHealth())

        --Check if player has a defuser
        if player:GetPropBool("m_bHasDefuser") then
            --Create defuse icon
            draw.Color(_gttlg_colorpicker_defuseiconcolor:GetValue())
            draw.TextShadow(PlayerTextX + 70 + _gttlg_slider_hbpldefuseiconxpos:GetValue() - 70, PlayerTextY + _gttlg_slider_hbpldefuseiconypos:GetValue(), "✔")
        end
    end

end

--Handle Health Bar Plus HUD
function handle_HBP()
    --Reset old local vars
    _var_myteam_nextheight_health = 0
    _var_myteam_nextheight_armor = 0
    _var_enemyteam_nextheight_health = 0
    _var_enemyteam_nextheight_armor = 0
    --Define localplayer
    local lp = entities.GetLocalPlayer() 
    local lp_team = 0
    --Check if lp isn't null (So doesnt throw errors in menu)
    if lp ~= nil then
        --Get & set team number
        lp_team = lp:GetTeamNumber()
    end

    --Define player entity
    local players = entities.FindByClass("CCSPlayer")

    --Player list loop
    for i = 1, #players do
        --Define player for easy access
        local player = players[i]
        --Check if player is alive
        if player:IsAlive() then
            --Check if show my team is enabled
            if _gttg_checkbox_showmyteam:GetValue() then
                --Get players team number if equals to ours and make sure they arent in spectator mode & make sure we dont load ourself
                --Check if show my player is on
                if _gttg_checkbox_showmyplayer:GetValue() then
                    if player:GetTeamNumber() == lp_team and player:GetTeamNumber() ~= 1 then
                        handle_HBP_showmyteam(player)
                    end
                else
                    if player:GetTeamNumber() == lp_team and player:GetTeamNumber() ~= 1 and player:GetIndex() ~= lp:GetIndex() then
                        handle_HBP_showmyteam(player)
                    end
                end
            end
            --Check if show enemy team is enabled
            if _gttg_checkbox_showenemyteam:GetValue() then
                --Get players team number if opposite to ours and make sure they arent in spectator mode
                if player:GetTeamNumber() ~= lp_team and player:GetTeamNumber() ~= 1 then
                    handle_HBP_showenemyteam(player)
                end
            end
        end
    end
end

--Handle show my team part of hbp
function handle_HBP_showmyteam(player)
    --Create Health box dimensions
    local HealthBoxW = 0 + _gttg_slider_barhealthwidth:GetValue() 
    local HealthBoxH = 0 + _gttg_slider_barhealthheight:GetValue() + _gttg_slider_textspacing:GetValue()
    local HealthBoxX = 0 + _gttg_slider_myteamxpos:GetValue()
    local HealthBoxY = 10 + _gttg_slider_textspacing:GetValue()
    local HealthBoxSliderY = _gttg_slider_myteamypos:GetValue() - HealthBoxY + 18
    --Create Armor box dimensions
    local ArmorBoxW = 0 + _gttg_slider_bararmorwidth:GetValue() 
    local ArmorBoxH = 0 + _gttg_slider_bararmorheight:GetValue() + _gttg_slider_textspacing:GetValue()
    local ArmorBoxX = 0 + _gttg_slider_myteamxpos:GetValue()
    local ArmorBoxY = 10  + _gttg_slider_textspacing:GetValue()
    local ArmorBoxSliderY = _gttg_slider_myteamypos:GetValue() - ArmorBoxY + 18
    --Make a margin between each box on y axis
    local PlayerMargin = 30 + _gttg_slider_barhealthheight:GetValue() - 20 + _gttg_slider_bararmorheight:GetValue()  - 20 + _gttg_slider_playerspacing:GetValue()
    local BarMargin = 11 + _gttg_slider_barhealthheight:GetValue() - 20 + _gttg_slider_barspacing:GetValue()
    --Create Player Text dimensions
    local PlayerTextX = 0 + HealthBoxX
    local PlayerTextY = 0 + _var_myteam_nextheight_health + _gttg_slider_myteamypos:GetValue() - _gttg_slider_textspacing:GetValue()
    --Get the boxW size by scaling the health/armor to it
    local HealthW = HealthBoxW/player:GetMaxHealth()
    local ArmorW = ArmorBoxW/100
    --vars
    local m_ArmorValue = player:GetProp("m_ArmorValue")

    --Create font to be used
    draw.SetFont(_defaultfont)

    --Check if showing counters is enabled
    if _gttg_checkbox_showcounters:GetValue() then
        --Armor Counter Text
        draw.Color(_gttg_colorpicker_myteamarmorfillercolor:GetValue())
        draw.TextShadow(PlayerTextX, PlayerTextY, m_ArmorValue)

        --Health Counter Text
        draw.Color(_gttg_colorpicker_myteamhealthfillercolor:GetValue())
        draw.TextShadow(PlayerTextX + draw.GetTextSize(m_ArmorValue) + 1, PlayerTextY, player:GetHealth())

        --Create Player Name
        --Create name with given max char length
        local charname = string.sub(player:GetName(), 1, _gttg_slider_nametagcharlength:GetValue())
        draw.Color(_gttg_colorpicker_myteamtextcolor:GetValue())
        draw.TextShadow(PlayerTextX + 50, PlayerTextY, charname)

        --Check if player has a defuser
        if player:GetPropBool("m_bHasDefuser") then
            --Create defuse icon
            draw.Color(_gttg_colorpicker_defuseiconcolor:GetValue())
            draw.TextShadow(PlayerTextX + 50 + draw.GetTextSize(charname), PlayerTextY, "✔")
        end
    else
        --Create Player Name
        --Create name with given max char length
        local charname = string.sub(player:GetName(), 1, _gttg_slider_nametagcharlength:GetValue())
        draw.Color(_gttg_colorpicker_myteamtextcolor:GetValue())
        draw.TextShadow(PlayerTextX, PlayerTextY, charname)
    end

    --Create Health Bar Placeholder
    draw.Color(_gttg_colorpicker_myteamplaceholdercolor:GetValue())
    draw.FilledRect(HealthBoxX, HealthBoxY + _var_myteam_nextheight_health + HealthBoxSliderY, player:GetMaxHealth()*HealthW + HealthBoxX, HealthBoxH + _var_myteam_nextheight_health + HealthBoxSliderY)

    --Create Health Bar Placeholder Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(HealthBoxX, HealthBoxY + _var_myteam_nextheight_health + HealthBoxSliderY, player:GetMaxHealth()*HealthW + HealthBoxX, HealthBoxH + _var_myteam_nextheight_health + HealthBoxSliderY)

    --Create Health Bar Filler
    draw.Color(_gttg_colorpicker_myteamhealthfillercolor:GetValue())
    draw.FilledRect(HealthBoxX, HealthBoxY + _var_myteam_nextheight_health + HealthBoxSliderY, player:GetHealth()*HealthW + HealthBoxX, HealthBoxH + _var_myteam_nextheight_health + HealthBoxSliderY)

    --Create Health Bar Filler Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(HealthBoxX, HealthBoxY + _var_myteam_nextheight_health + HealthBoxSliderY, player:GetHealth()*HealthW + HealthBoxX, HealthBoxH + _var_myteam_nextheight_health + HealthBoxSliderY)

    --Create Armor Bar Placeholders
    draw.Color(_gttg_colorpicker_myteamplaceholdercolor:GetValue())
    draw.FilledRect(ArmorBoxX, ArmorBoxY + _var_myteam_nextheight_armor + BarMargin + ArmorBoxSliderY, 100*ArmorW + ArmorBoxX, ArmorBoxH + _var_myteam_nextheight_armor + BarMargin + ArmorBoxSliderY)

    --Create Armor Bar Placeholders Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(ArmorBoxX, ArmorBoxY + _var_myteam_nextheight_armor + BarMargin + ArmorBoxSliderY, 100*ArmorW + ArmorBoxX, ArmorBoxH + _var_myteam_nextheight_armor + BarMargin + ArmorBoxSliderY)

    --Create Armor Bar Filler
    draw.Color(_gttg_colorpicker_myteamarmorfillercolor:GetValue())
    draw.FilledRect(ArmorBoxX, ArmorBoxY + _var_myteam_nextheight_armor + BarMargin + ArmorBoxSliderY, m_ArmorValue*ArmorW + ArmorBoxX, ArmorBoxH + _var_myteam_nextheight_armor + BarMargin + ArmorBoxSliderY)
    
    --Create Armor Bar Placeholders Filler Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(ArmorBoxX, ArmorBoxY + _var_myteam_nextheight_armor + BarMargin + ArmorBoxSliderY, m_ArmorValue*ArmorW + ArmorBoxX, ArmorBoxH + _var_myteam_nextheight_armor + BarMargin + ArmorBoxSliderY)

    --Add the y axis to next height to prevent over lap and plus a magin to separate boxes
    _var_myteam_nextheight_health = _var_myteam_nextheight_health + HealthBoxY + PlayerMargin
    _var_myteam_nextheight_armor = _var_myteam_nextheight_armor + ArmorBoxY + PlayerMargin
end

--Handle show enemy team part of hbp
function handle_HBP_showenemyteam(player)
    --Create Health box dimensions
    local HealthBoxW = 0 + _gttg_slider_barhealthwidth:GetValue() 
    local HealthBoxH = 0 + _gttg_slider_barhealthheight:GetValue() + _gttg_slider_textspacing:GetValue()
    local HealthBoxX = 0 + _gttg_slider_enemyteamxpos:GetValue()
    local HealthBoxY = 10 + _gttg_slider_textspacing:GetValue()
    local HealthBoxSliderY = _gttg_slider_enemyteamypos:GetValue() - HealthBoxY + 18
    --Create Armor box dimensions
    local ArmorBoxW = 0 + _gttg_slider_bararmorwidth:GetValue() 
    local ArmorBoxH = 0 + _gttg_slider_bararmorheight:GetValue() + _gttg_slider_textspacing:GetValue()
    local ArmorBoxX = 0 + _gttg_slider_enemyteamxpos:GetValue()
    local ArmorBoxY = 10  + _gttg_slider_textspacing:GetValue()
    local ArmorBoxSliderY = _gttg_slider_enemyteamypos:GetValue() - ArmorBoxY + 18
    --Make a margin between each box on y axis
    local PlayerMargin = 30 + _gttg_slider_barhealthheight:GetValue() - 20 + _gttg_slider_bararmorheight:GetValue()  - 20 + _gttg_slider_playerspacing:GetValue()
    local BarMargin = 11 + _gttg_slider_barhealthheight:GetValue() - 20 + _gttg_slider_barspacing:GetValue()
    --Create Player Text dimensions
    local PlayerTextX = 0 + HealthBoxX
    local PlayerTextY = 0 + _var_enemyteam_nextheight_health + _gttg_slider_enemyteamypos:GetValue() - _gttg_slider_textspacing:GetValue()
    --Get the boxW size by scaling the health/armor to it
    local HealthW = HealthBoxW/player:GetMaxHealth()
    local ArmorW = ArmorBoxW/100
    --vars
    local m_ArmorValue = player:GetProp("m_ArmorValue")

    --Create font to be used
    draw.SetFont(_defaultfont)

    --Check if showing counters is enabled
    if _gttg_checkbox_showcounters:GetValue() then
        --Armor Counter Text
        draw.Color(_gttg_colorpicker_enemyteamarmorfillercolor:GetValue())
        draw.TextShadow(PlayerTextX, PlayerTextY, m_ArmorValue)

        --Health Counter Text
        draw.Color(_gttg_colorpicker_enemyteamhealthfillercolor:GetValue())
        draw.TextShadow(PlayerTextX + draw.GetTextSize(m_ArmorValue) + 1, PlayerTextY, player:GetHealth())

        --Create Player Name
        --Create name with given max char length
        local charname = string.sub(player:GetName(), 1, _gttg_slider_nametagcharlength:GetValue())
        draw.Color(_gttg_colorpicker_enemyteamtextcolor:GetValue())
        draw.TextShadow(PlayerTextX + 50, PlayerTextY, charname)

        --Check if player has a defuser
        if player:GetPropBool("m_bHasDefuser") then
            --Create defuse icon
            draw.Color(_gttg_colorpicker_defuseiconcolor:GetValue())
            draw.TextShadow(PlayerTextX + 50 + draw.GetTextSize(charname), PlayerTextY, "✔")
        end
    else
        --Create Player Name
        --Create name with given max char length
        local charname = string.sub(player:GetName(), 1, _gttg_slider_nametagcharlength:GetValue())
        draw.Color(_gttg_colorpicker_enemyteamtextcolor:GetValue())
        draw.TextShadow(PlayerTextX, PlayerTextY, charname)
    end

    --Create Health Bar Placeholder
    draw.Color(_gttg_colorpicker_enemyteamplaceholdercolor:GetValue())
    draw.FilledRect(HealthBoxX, HealthBoxY + _var_enemyteam_nextheight_health + HealthBoxSliderY, player:GetMaxHealth()*HealthW + HealthBoxX, HealthBoxH + _var_enemyteam_nextheight_health + HealthBoxSliderY)

    --Create Health Bar Placeholder Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(HealthBoxX, HealthBoxY + _var_enemyteam_nextheight_health + HealthBoxSliderY, player:GetMaxHealth()*HealthW + HealthBoxX, HealthBoxH + _var_enemyteam_nextheight_health + HealthBoxSliderY)

    --Create Health Bar Filler
    draw.Color(_gttg_colorpicker_enemyteamhealthfillercolor:GetValue())
    draw.FilledRect(HealthBoxX, HealthBoxY + _var_enemyteam_nextheight_health + HealthBoxSliderY, player:GetHealth()*HealthW + HealthBoxX, HealthBoxH + _var_enemyteam_nextheight_health + HealthBoxSliderY)

    --Create Health Bar Filler Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(HealthBoxX, HealthBoxY + _var_enemyteam_nextheight_health + HealthBoxSliderY, player:GetHealth()*HealthW + HealthBoxX, HealthBoxH + _var_enemyteam_nextheight_health + HealthBoxSliderY)

    --Create Armor Bar Placeholders
    draw.Color(_gttg_colorpicker_enemyteamplaceholdercolor:GetValue())
    draw.FilledRect(ArmorBoxX, ArmorBoxY + _var_enemyteam_nextheight_armor + BarMargin + ArmorBoxSliderY, 100*ArmorW + ArmorBoxX, ArmorBoxH + _var_enemyteam_nextheight_armor + BarMargin + ArmorBoxSliderY)

    --Create Armor Bar Placeholders Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(ArmorBoxX, ArmorBoxY + _var_enemyteam_nextheight_armor + BarMargin + ArmorBoxSliderY, 100*ArmorW + ArmorBoxX, ArmorBoxH + _var_enemyteam_nextheight_armor + BarMargin + ArmorBoxSliderY)

    --Create Armor Bar Filler
    draw.Color(_gttg_colorpicker_enemyteamarmorfillercolor:GetValue())
    draw.FilledRect(ArmorBoxX, ArmorBoxY + _var_enemyteam_nextheight_armor + BarMargin + ArmorBoxSliderY, m_ArmorValue*ArmorW + ArmorBoxX, ArmorBoxH + _var_enemyteam_nextheight_armor + BarMargin + ArmorBoxSliderY)
    
    --Create Armor Bar Placeholders Filler Outline (Pops out more)
    draw.Color(0, 0, 0, 255)
    draw.OutlinedRect(ArmorBoxX, ArmorBoxY + _var_enemyteam_nextheight_armor + BarMargin + ArmorBoxSliderY, m_ArmorValue*ArmorW + ArmorBoxX, ArmorBoxH + _var_enemyteam_nextheight_armor + BarMargin + ArmorBoxSliderY)

    --Add the y axis to next height to prevent over lap and plus a magin to separate boxes
    _var_enemyteam_nextheight_health = _var_enemyteam_nextheight_health + HealthBoxY + PlayerMargin
    _var_enemyteam_nextheight_armor = _var_enemyteam_nextheight_armor + ArmorBoxY + PlayerMargin
end

--Function for updating menu vars
local function menuvars()
    --Set this hud part disabled until script toggle is on (check)
    --Tab Health Bars Plus
    --Main enable toggles
    
    _gtt_groupbox_hbpteamspos:SetDisabled(not _gttg_checkbox_enablehbphud:GetValue())
    _gttg_checkbox_showmyteam:SetDisabled(not _gttg_checkbox_enablehbphud:GetValue())
    _gttg_checkbox_showenemyteam:SetDisabled(not _gttg_checkbox_enablehbphud:GetValue())
    _gttg_checkbox_showmyplayer:SetDisabled(not _gttg_checkbox_enablehbphud:GetValue())
    _gttg_checkbox_showcounters:SetDisabled(not _gttg_checkbox_enablehbphud:GetValue())
    _gtt_groupbox_hbpcolors:SetDisabled(not _gttg_checkbox_enablehbphud:GetValue())
    _gtt_groupbox_hbpbarsizes:SetDisabled(not _gttg_checkbox_enablehbphud:GetValue())
    _gtt_groupbox_hbpspacing:SetDisabled(not _gttg_checkbox_enablehbphud:GetValue())
    _gtt_groupbox_hbpnametaglength:SetDisabled(not _gttg_checkbox_enablehbphud:GetValue())

    _gttl_groupbox_hbplpos:SetDisabled(true) --Not needed
    _gttl_groupbox_hbplbarsizes:SetDisabled(not _gttlg_checkbox_enablehbplocalhud:GetValue())
    _gttl_groupbox_hbplindivbarpos:SetDisabled(not _gttlg_checkbox_enablehbplocalhud:GetValue())
    _gttl_groupbox_hbplcounterpos:SetDisabled(not _gttlg_checkbox_enablehbplocalhud:GetValue())
    _gttl_groupbox_hbplcolors:SetDisabled(not _gttlg_checkbox_enablehbplocalhud:GetValue())
    _gttlg_checkbox_showcounters:SetDisabled(not _gttlg_checkbox_enablehbplocalhud:GetValue())
end

--Drawing callback function
local function callback_draw()
    --If HBP HUD is enabled
    if _gttg_checkbox_enablehbphud:GetValue() then
        handle_HBP()
    end
    if _gttlg_checkbox_enablehbplocalhud:GetValue() then
        --Hide hude and show ours
        client.SetConVar("hidehud", 8, true)
        handle_HBPL()
    else
        --Set hud back to default
        client.SetConVar("hidehud", 0, true)
    end
    menuvars()
end

callbacks.Register("Draw", "callback_draw", callback_draw)
