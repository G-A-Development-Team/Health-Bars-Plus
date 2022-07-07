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

--Screen dimensions
local screenW, screenH = draw.GetScreenSize()

--Container
local MyTeam = {
	W = 150,
	H = 300,
	X = 0,
	Z = 0,
	HealthW = 0.5,
	HealthH = 0.1,
	HealthPaddingT = 0.1,
	HealthPaddingB = 0.1,
	HealthPaddingL = 0.1,
	HealthPaddingR = 0.1,
	ArmorW = 0.5,
	ArmorH = 0.1,
	ArmorPaddingT = 0.1,
	ArmorPaddingB = 0.1,
	ArmorPaddingL = 0.1,
	ArmorPaddingR = 0.1,
	Move = false
}

local Enemy = {
	W = 150,
	H = 300,
	X = 160,
	Z = 0,
	HealthW = 0.5,
	HealthH = 0.1,
	HealthPaddingT = 0.1,
	HealthPaddingB = 0.1,
	HealthPaddingL = 0.1,
	HealthPaddingR = 0.1,
	ArmorW = 0.5,
	ArmorH = 0.1,
	ArmorPaddingT = 0.1,
	ArmorPaddingB = 0.1,
	ArmorPaddingL = 0.1,
	ArmorPaddingR = 0.1,
	DefuseW = 0.5,
	DefuseH = 0.1,
	Move = false
}

local Health = {
	W = 200,
	H = 100,
	X = 330,
	Z = 0,
	HealthW = 0.5,
	HealthH = 0.1,
	HealthPaddingT = 0.1,
	HealthPaddingB = 0.1,
	HealthPaddingL = 0.1,
	HealthPaddingR = 0.1,
	ArmorW = 0.5,
	ArmorH = 0.1,
	ArmorPaddingT = 0.1,
	ArmorPaddingB = 0.1,
	ArmorPaddingL = 0.1,
	ArmorPaddingR = 0.1,
	DefuseW = 0.5,
	DefuseH = 0.1,
	Move = false
	
}

--Handles dragging of containers
local function moveContainer(Cont)
	if Move then
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

--Fonts
local fntSml = draw.CreateFont("Bahnschrift", 10)
local fntNml = draw.CreateFont("Bahnschrift", 20)
local fntBig = draw.CreateFont("Bahnschrift", 30)

--Script GUI Reference
local gui_ref = gui.Reference("VISUALS")

--Health Bars Plus Tab
local gui_tab = gui.Tab(gui_ref, "HBP", "Health Bars Plus")


local HealthW = HealthBoxW/player:GetMaxHealth()
local ArmorW = ArmorBoxW/100
local m_ArmorValue = player:GetProp("m_ArmorValue")


callbacks.Register("Draw", function()
	moveContainer(Enemy)
	moveContainer(MyTeam)
	moveContainer(Health)
end)
