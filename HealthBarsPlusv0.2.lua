-----------------------------------------------
---------Health Bars Plus v0.2-----------------
---------    Created By:    -------------------
---------  GameChampCrafted  ------------------
-------- (Aimware - CarterPoe) ----------------
---------   Date: 7/6/2022   ------------------
-----------------------------------------------
--------- Tester(s):         ------------------
--------- Agentsix1          ------------------
-----------------------------------------------
--
-- This is a product of the G&A Development Team
--

--Fonts
local fntSml = draw.CreateFont("Bahnschrift", 10)
local fntNml = draw.CreateFont("Bahnschrift", 20)
local fntBig = draw.CreateFont("Bahnschrift", 30)

--Screen dimensions
local screenW, screenH = draw.GetScreenSize()

--Container
local MyTeam = {
	W = 150,
	H = 300,
	X = 1000,
	Y = 300,
	HealthW = 0.5,
	HealthH = 0.1,
	HealthX = 0.1,
	HealthY = 0.1,
	HealthColor,
	ArmorW = 0.5,
	ArmorH = 0.1,
	ArmorX = 0.1,
	ArmorY = 0.1,
	ArmorColor,
	DefuseW = 0.5,
	DefuseH = 0.1,
	TextColor,
	Move = true
}

local Enemy = {
	W = 150,
	H = 300,
	X = 160,
	Y = 0,
	HealthW = 0.5,
	HealthH = 0.1,
	HealthX = 0.1,
	HealthY = 0.1,
	HealthColor,
	ArmorW = 0.5,
	ArmorH = 0.1,
	ArmorX = 0.1,
	ArmorY = 0.1,
	ArmorColor,
	DefuseW = 0.5,
	DefuseH = 0.1,
	TextColor,
	Move = false
}

local Health = {
	W = 200,
	H = 100,
	X = 330,
	Y = 0,
	HealthW = 0.5,
	HealthH = 0.1,
	HealthX = 0.1,
	HealthY = 0.1,
	HealthColor,
	ArmorW = 0.5,
	ArmorH = 0.1,
	ArmorX = 0.1,
	ArmorY = 0.1,
	ArmorColor,
	DefuseW = 0.5,
	DefuseH = 0.1,
	TextColor,
	Move = false
	
}

--Handles dragging of containers
local function moveContainer(Cont)
	if Cont.Move then
		print("Yesss" .. Cont.Y)
		if input.IsButtonDown(1) then
			mouseX, mouseY = input.GetMousePos();
			if shouldDrag then
				Cont.X = mouseX - dx;
				Cont.Y = mouseY - dy;
			end
			if mouseX >= Cont.X and mouseX <= Cont.X + Cont.W and mouseY >= Cont.Y and mouseY <= Cont.Y + 40 then
				shouldDrag = true;
				dx = mouseX - Cont.X;
				dy = mouseY - Cont.Y;
			end
		else
			shouldDrag = false;
		end
	end
end

--Handles drawing of containers
local function drawContainer(Cont)
	draw.SetFont(fntNml)
	draw.Color(Cont.TextColor)
	draw.TextShadow(Cont.X+(Cont.H*Cont.HealthX), Cont.Y+(Cont.W*Cont.HealthY), "username")
end



--Script GUI Reference
local gui_ref = gui.Reference("VISUALS")

--Health Bars Plus Tab
local gui_tab = gui.Tab(gui_ref, "HBP", "Health Bars Plus")
--Groupbox for HBPL colors
local gui_colors = gui.Groupbox(gui_tab, "HBP Colors", 16, 32+156-2, 296, 311)
local gui_textcolor = gui.ColorPicker(gui_colors, "HBP_colorpicker_textcolor", "Text Color", 255, 255, 255, 255)
Enemy.TextColor = gui_textcolor:GetValue()
MyTeam.TextColor = gui_textcolor:GetValue()
Health.TextColor = gui_textcolor:GetValue()
--local HealthW = HealthBoxW/player:GetMaxHealth()
--local ArmorW = ArmorBoxW/100
--local m_ArmorValue = player:GetProp("m_ArmorValue")


callbacks.Register("Draw", function()
	drawContainer(Enemy)
	drawContainer(MyTeam)
	drawContainer(Health)
	moveContainer(Enemy)
	moveContainer(MyTeam)
	moveContainer(Health)
end)
