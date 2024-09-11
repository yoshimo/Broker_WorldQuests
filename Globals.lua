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
BWQ.TomTomWaypoints = {}

-- When adding zones to MAP_ZONES, be sure to also add the zoneID to MAP_ZONES_SORT immediately below
-- The simplest way to get the MapID for the zone you are currently in is to enter "/dump C_Map.GetBestMapForUnit("player")"
BWQ.MAP_ZONES = {
	[CONSTANTS.EXPANSIONS.THEWARWITHIN] = {
		[2248] = { id = 2248, name = C_Map.GetMapInfo(2248).name, quests = {}, buttons = {}, }, -- Isle of Dorn 11.0
		[2214] = { id = 2214, name = C_Map.GetMapInfo(2214).name, quests = {}, buttons = {}, }, -- The Ringing Deeps 11.0
		[2215] = { id = 2215, name = C_Map.GetMapInfo(2215).name, quests = {}, buttons = {}, }, -- Hallowfall 11.0
		[2255] = { id = 2255, name = C_Map.GetMapInfo(2255).name, quests = {}, buttons = {}, }, -- Azj-Kahet 11.0
	},
	[CONSTANTS.EXPANSIONS.DRAGONFLIGHT] = {
		[2022] = { id = 2022, name = C_Map.GetMapInfo(2022).name, quests = {}, buttons = {}, }, -- The Waking Shores 10.0
		[2023] = { id = 2023, name = C_Map.GetMapInfo(2023).name, quests = {}, buttons = {}, }, -- Ohn'ahran Plains 10.0
		[2024] = { id = 2024, name = C_Map.GetMapInfo(2024).name, quests = {}, buttons = {}, }, -- The Azure Span 10.0
		[2025] = { id = 2025, name = C_Map.GetMapInfo(2025).name, quests = {}, buttons = {}, }, -- Thaldraszus 10.0
		[2085] = { id = 2085, name = C_Map.GetMapInfo(2085).name, quests = {}, buttons = {}, }, -- Primalist Tomorrow 10.0
		[2151] = { id = 2151, name = C_Map.GetMapInfo(2151).name, quests = {}, buttons = {}, }, -- The Forbidden Reach 10.0.7
		[2133] = { id = 2133, name = C_Map.GetMapInfo(2133).name, quests = {}, buttons = {}, }, -- Zaralek Cavern 10.1
		[2200] = { id = 2200, name = C_Map.GetMapInfo(2200).name, quests = {}, buttons = {}, }, -- Emerald Dream 10.2
	},
	[CONSTANTS.EXPANSIONS.SHADOWLANDS] = {
		[1525] = { id = 1525, name = C_Map.GetMapInfo(1525).name, quests = {}, buttons = {}, }, -- Revendreth 9.0
		[1533] = { id = 1533, name = C_Map.GetMapInfo(1533).name, quests = {}, buttons = {}, }, -- Bastion 9.0
		[1536] = { id = 1536, name = C_Map.GetMapInfo(1536).name, quests = {}, buttons = {}, }, -- Maldraxxus 9.0
		[1565] = { id = 1565, name = C_Map.GetMapInfo(1565).name, quests = {}, buttons = {}, }, -- Ardenwald 9.0
		[1543] = { id = 1543, name = C_Map.GetMapInfo(1543).name, quests = {}, buttons = {}, }, -- The Maw 9.1
		[1970] = { id = 1970, name = C_Map.GetMapInfo(1970).name, quests = {}, buttons = {}, }, -- Zereth Mortis 9.2
	},
	[CONSTANTS.EXPANSIONS.BFA] = {
		[863] = { id = 863,   name = C_Map.GetMapInfo(863).name, faction = CONSTANTS.FACTIONS.HORDE, quests = {}, buttons = {}, },      -- Nazmir
		[864] = { id = 864,   name = C_Map.GetMapInfo(864).name, faction = CONSTANTS.FACTIONS.HORDE, quests = {}, buttons = {}, },      -- Vol'dun
		[862] = { id = 862,   name = C_Map.GetMapInfo(862).name, faction = CONSTANTS.FACTIONS.HORDE, quests = {}, buttons = {}, },      -- Zuldazar
		[895] = { id = 895,   name = C_Map.GetMapInfo(895).name, faction = CONSTANTS.FACTIONS.ALLIANCE, quests = {}, buttons = {}, },   -- Tiragarde
		[942] = { id = 942,   name = C_Map.GetMapInfo(942).name, faction = CONSTANTS.FACTIONS.ALLIANCE, quests = {}, buttons = {}, },   -- Stormsong Valley
		[896] = { id = 896,   name = C_Map.GetMapInfo(896).name, faction = CONSTANTS.FACTIONS.ALLIANCE, quests = {}, buttons = {}, },   -- Drustvar
		[1161] = { id = 1161, name = C_Map.GetMapInfo(1161).name, faction = CONSTANTS.FACTIONS.ALLIANCE, quests = {}, buttons = {}, },  -- Boralus
		[1527] = { id = 1527, name = C_Map.GetMapInfo(1527).name, quests = {}, buttons = {}, },  -- Uldum 8.3
		[1530] = { id = 1530, name = C_Map.GetMapInfo(1530).name, quests = {}, buttons = {}, },  -- Valley of Eternal Blossoms 8.3
		[1355] = { id = 1355, name = C_Map.GetMapInfo(1355).name, quests = {}, buttons = {}, },  -- Nazjatar 8.2
		[1462] = { id = 1462, name = C_Map.GetMapInfo(1462).name, quests = {}, buttons = {}, },  -- Mechagon 8.2
		[14] = { id = 14,     name = C_Map.GetMapInfo(14).name,  quests = {}, buttons = {}, },   -- Arathi
		[62] = { id = 62,     name = C_Map.GetMapInfo(62).name,  quests = {}, buttons = {}, },   -- Darkshore
	},
	[CONSTANTS.EXPANSIONS.LEGION] = {
		[630] = { id = 630,   name = C_Map.GetMapInfo(630).name, quests = {}, buttons = {}, },   -- Aszuna
		[790] = { id = 790,   name = C_Map.GetMapInfo(790).name, quests = {}, buttons = {}, },   -- Eye of Azshara
		[641] = { id = 641,   name = C_Map.GetMapInfo(641).name, quests = {}, buttons = {}, },   -- Val'sharah
		[650] = { id = 650,   name = C_Map.GetMapInfo(650).name, quests = {}, buttons = {}, },   -- Highmountain
		[634] = { id = 634,   name = C_Map.GetMapInfo(634).name, quests = {}, buttons = {}, },   -- Stormheim
		[680] = { id = 680,   name = C_Map.GetMapInfo(680).name, quests = {}, buttons = {}, },   -- Suramar
		[627] = { id = 627,   name = C_Map.GetMapInfo(627).name, quests = {}, buttons = {}, },   -- Dalaran
		[646] = { id = 646,   name = C_Map.GetMapInfo(646).name, quests = {}, buttons = {}, },   -- Broken Shore
		[830] = { id = 830,   name = C_Map.GetMapInfo(830).name, quests = {}, buttons = {}, },   -- Krokuun
		[882] = { id = 882,   name = C_Map.GetMapInfo(882).name, quests = {}, buttons = {}, },   -- Mac'aree
		[885] = { id = 885,   name = C_Map.GetMapInfo(885).name, quests = {}, buttons = {}, },   -- Antoran Wastes
	},
}
BWQ.MAP_ZONES_SORT = {
	[CONSTANTS.EXPANSIONS.THEWARWITHIN] = {
		2248, 2214, 2215, 2255
	},
	[CONSTANTS.EXPANSIONS.DRAGONFLIGHT] = {
		2022, 2023, 2024, 2025, 2085, 2151, 2133, 2200
	},
	[CONSTANTS.EXPANSIONS.SHADOWLANDS] = {
		1525, 1533, 1536, 1565, 1543, 1970
	},
	[CONSTANTS.EXPANSIONS.BFA] = {
		1530, 1527, 1355, 1462, 62, 14, 863, 864, 862, 895, 942, 896, 1161
	},
	[CONSTANTS.EXPANSIONS.LEGION] = {
		630, 790, 641, 650, 634, 680, 627, 646, 830, 882, 885
	},
}