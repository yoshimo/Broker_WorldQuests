local _, addon = ...
local CONSTANTS = addon.CONSTANTS
--==========================================================
-- Create BWQ and define important functions and data members
--==========================================================
BWQ = CreateFrame("Frame", "Broker_WorldQuests", UIParent, "BackdropTemplate")

--==========================================================
-- Configuration and/or Default related routines and data
--==========================================================
function BWQ:C(configSetting)
	if BWQcfg.usePerCharacterSettings then
		return BWQcfgPerCharacter[k]
	else
		return BWQcfg[k]
	end
end

--==========================================================
-- Setup primary GUI elements
--==========================================================
BWQ:EnableMouse(true)
BWQ:SetBackdrop({
		bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
		edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
		tile = false,
		tileSize = 0,
		edgeSize = 2,
		insets = { left = 0, right = 0, top = 0, bottom = 0 },
	})
BWQ:SetBackdropColor(0, 0, 0, .9)
BWQ:SetBackdropBorderColor(0, 0, 0, 1)
BWQ:SetClampedToScreen(true)
BWQ:Hide()

BWQ.buttonTheWarWithin = CreateFrame("Button", nil, BWQ, "BackdropTemplate")
BWQ.buttonTheWarWithin:SetSize(20, 15)
BWQ.buttonTheWarWithin:SetPoint("TOPRIGHT", BWQ, "TOPRIGHT", -146, -8)
BWQ.buttonTheWarWithin:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = false, tileSize = 0, edgeSize = 2, insets = { left = 0, right = 0, top = 0, bottom = 0 }, })
BWQ.buttonTheWarWithin:SetBackdropColor(0.1, 0.1, 0.1)
BWQ.buttonTheWarWithin.texture = BWQ.buttonTheWarWithin:CreateTexture(nil, "OVERLAY")
BWQ.buttonTheWarWithin.texture:SetPoint("TOPLEFT", 1, -1)
BWQ.buttonTheWarWithin.texture:SetPoint("BOTTOMRIGHT", -1, 1)
BWQ.buttonTheWarWithin.texture:SetTexture("Interface\\Calendar\\Holidays\\Calendar_WeekendTheWarWithinStart")		-- Use https://github.com/Marlamin/wow.tools.local to find textures
BWQ.buttonTheWarWithin.texture:SetTexCoord(0.15, 0.55, 0.23, 0.47)

BWQ.buttonDragonflight = CreateFrame("Button", nil, BWQ, "BackdropTemplate")
BWQ.buttonDragonflight:SetSize(20, 15)
BWQ.buttonDragonflight:SetPoint("TOPRIGHT", BWQ, "TOPRIGHT", -119, -8)
BWQ.buttonDragonflight:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = false, tileSize = 0, edgeSize = 2, insets = { left = 0, right = 0, top = 0, bottom = 0 }, })
BWQ.buttonDragonflight:SetBackdropColor(0.1, 0.1, 0.1)
BWQ.buttonDragonflight.texture = BWQ.buttonDragonflight:CreateTexture(nil, "OVERLAY")
BWQ.buttonDragonflight.texture:SetPoint("TOPLEFT", 1, -1)
BWQ.buttonDragonflight.texture:SetPoint("BOTTOMRIGHT", -1, 1)
BWQ.buttonDragonflight.texture:SetTexture("Interface\\Calendar\\Holidays\\Calendar_dragonflightstart")
BWQ.buttonDragonflight.texture:SetTexCoord(0.15, 0.55, 0.23, 0.47)

BWQ.buttonShadowlands = CreateFrame("Button", nil, BWQ, "BackdropTemplate")
BWQ.buttonShadowlands:SetSize(20, 15)
BWQ.buttonShadowlands:SetPoint("TOPRIGHT", BWQ, "TOPRIGHT", -92, -8)
BWQ.buttonShadowlands:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = false, tileSize = 0, edgeSize = 2, insets = { left = 0, right = 0, top = 0, bottom = 0 }, })
BWQ.buttonShadowlands:SetBackdropColor(0.1, 0.1, 0.1)
BWQ.buttonShadowlands.texture = BWQ.buttonShadowlands:CreateTexture(nil, "OVERLAY")
BWQ.buttonShadowlands.texture:SetPoint("TOPLEFT", 1, -1)
BWQ.buttonShadowlands.texture:SetPoint("BOTTOMRIGHT", -1, 1)
BWQ.buttonShadowlands.texture:SetTexture("Interface\\Calendar\\Holidays\\Calendar_WeekendShadowlandsStart")
BWQ.buttonShadowlands.texture:SetTexCoord(0.15, 0.55, 0.23, 0.47)

BWQ.buttonBFA = CreateFrame("Button", nil, BWQ, "BackdropTemplate")
BWQ.buttonBFA:SetSize(20, 15)
BWQ.buttonBFA:SetPoint("TOPRIGHT", BWQ, "TOPRIGHT", -65, -8)
BWQ.buttonBFA:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = false, tileSize = 0, edgeSize = 2, insets = { left = 0, right = 0, top = 0, bottom = 0 }, })
BWQ.buttonBFA:SetBackdropColor(0.1, 0.1, 0.1)
BWQ.buttonBFA.texture = BWQ.buttonBFA:CreateTexture(nil, "OVERLAY")
BWQ.buttonBFA.texture:SetPoint("TOPLEFT", 1, -1)
BWQ.buttonBFA.texture:SetPoint("BOTTOMRIGHT", -1, 1)
BWQ.buttonBFA.texture:SetTexture("Interface\\Calendar\\Holidays\\Calendar_WeekendBattleforAzerothStart")
BWQ.buttonBFA.texture:SetTexCoord(0.15, 0.55, 0.23, 0.45)

BWQ.buttonLegion = CreateFrame("Button", nil, BWQ, "BackdropTemplate")
BWQ.buttonLegion:SetSize(20, 15)
BWQ.buttonLegion:SetPoint("TOPRIGHT", BWQ, "TOPRIGHT", -38, -8)
BWQ.buttonLegion:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = false, tileSize = 0, edgeSize = 2, insets = { left = 0, right = 0, top = 0, bottom = 0 }, })
BWQ.buttonLegion:SetBackdropColor(0.1, 0.1, 0.1)
BWQ.buttonLegion.texture = BWQ.buttonLegion:CreateTexture(nil, "OVERLAY")
BWQ.buttonLegion.texture:SetPoint("TOPLEFT", 1, -1)
BWQ.buttonLegion.texture:SetPoint("BOTTOMRIGHT", -1, 1)
BWQ.buttonLegion.texture:SetTexture("Interface\\Calendar\\Holidays\\Calendar_WeekendLegionStart")
BWQ.buttonLegion.texture:SetTexCoord(0.15, 0.55, 0.23, 0.47)

BWQ.buttonTheWarWithin:SetScript("OnClick", function(self) BWQ:SwitchExpansion(CONSTANTS.EXPANSIONS.THEWARWITHIN) end)
BWQ.buttonDragonflight:SetScript("OnClick", function(self) BWQ:SwitchExpansion(CONSTANTS.EXPANSIONS.DRAGONFLIGHT) end)
BWQ.buttonShadowlands:SetScript("OnClick", function(self) BWQ:SwitchExpansion(CONSTANTS.EXPANSIONS.SHADOWLANDS) end)
BWQ.buttonBFA:SetScript("OnClick", function(self) BWQ:SwitchExpansion(CONSTANTS.EXPANSIONS.BFA) end)
BWQ.buttonLegion:SetScript("OnClick", function(self) BWQ:SwitchExpansion(CONSTANTS.EXPANSIONS.LEGION) end)

BWQ.buttonSettings = CreateFrame("BUTTON", nil, BWQ, "BackdropTemplate")
BWQ.buttonSettings:SetWidth(15)
BWQ.buttonSettings:SetHeight(15)
BWQ.buttonSettings:SetPoint("TOPRIGHT", BWQ, "TOPRIGHT", -12, -8)
BWQ.buttonSettings.texture = BWQ.buttonSettings:CreateTexture(nil, "BORDER")
BWQ.buttonSettings.texture:SetAllPoints()
BWQ.buttonSettings.texture:SetTexture("Interface\\WorldMap\\Gear_64.png")
BWQ.buttonSettings.texture:SetTexCoord(0, 0.50, 0, 0.50)
BWQ.buttonSettings.texture:SetVertexColor(1.0, 0.82, 0, 1.0)
BWQ.buttonSettings:SetScript("OnClick", function(self) BWQ:OpenConfigMenu(self) end)
function BWQ:Block_OnLeave()
	if not BWQ:C("attachToWorldMap") or (BWQ:C("attachToWorldMap") and not WorldMapFrame:IsShown()) then
		if not BWQ:IsMouseOver() then
			BWQ:Hide()
		end
	end
end
BWQ:SetScript("OnLeave", function() BWQ:Block_OnLeave() end)

BWQ.slider = CreateFrame("Slider", nil, BWQ, "BackdropTemplate")
BWQ.slider:SetWidth(16)
BWQ.slider:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
BWQ.slider:SetBackdrop( {
	bgFile = "Interface\\Buttons\\UI-SliderBar-Background",
	--edgeFile = "Interface\\Buttons\\UI-SliderBar-Border",
	edgeSize = 8, tile = true, tileSize = 8,
	insets = { left=3, right=3, top=6, bottom=6 }
} )
BWQ.slider:SetValueStep(1)
BWQ.slider:SetHeight(200)
BWQ.slider:SetMinMaxValues( 0, 100 )
BWQ.slider:SetValue(0)
BWQ.slider:Hide()
--==========================================================

--==========================================================
-- Global variables
--==========================================================
BWQ.isHorde = UnitFactionGroup("player") == "Horde"
BWQ.expansion = ""
BWQ.warmodeEnabled = false
BWQ.bounties = {}
BWQ.questIds = {}
BWQ.numQuestsTotal = 0
BWQ.totalWidth = 0
BWQ.offsetTop = -15
BWQ.hasCollapsedQuests = false
BWQ.showDownwards = false
BWQ.blockYPos = 0
BWQ.highlightedRow = true
BWQ.hasUnlockedWorldQuests = false