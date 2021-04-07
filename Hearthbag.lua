-- default profile for when no bag addon is loaded
local DefaultProfile = {
	["parent"] = "ContainerFrame1PortraitButton",
	["scale"] = 1,
	["position"] = {
		-3, -- [1]
		2, -- [2]
	},
}

-- inventorian
-- requires special work on right / left click functionality. couldn't find resizing settings
local InventorianProfile = {
	["parent"] = "InventorianBagFrameIconButton",
	["scale"] = 2,
	["position"] = {
		0, -- [1]
		0, -- [2]
	},
}
--local inventorianTest = {parent="InventorianBagFrameIconButton",scale=2,position={[1]=0,[2]=0}}

	--HearthDB.BAG["parent"] = "InventorianBagFrameIconButton"
	--HearthDB.BAG["scale"] = 2
	--HearthDB.BAG["position"] = {0,0,}


-- baggins
-- left / right click should be fine - base frame has right click functionality but not the icon. thinner columns setting may break it

local BagginsProfile = {
	["parent"] = "BagginsBag1Section2",
	["scale"] = 1.1,
	["position"] = {
		-29, -- [1]
		50, -- [2]
	},
}

-- combuctor
-- both left nad right click are consumed, do not use portrait (this one is neat and has a lot of utility). Settings seem fine.

local CombuctorProfile = {
	["parent"] = "CombuctorInventoryFrame1",
	["scale"] = 1.45,
	["position"] = {
		-148, -- [1]
		113, -- [2]
	},
}

-- arkinventory
-- has the same menu for both left / right, so either can be used. scaling and resizing settings seem fine.

local ArkinventoryProfile = {
	["parent"] = "ARKINV_Frame1TitleActionButton0",
	["scale"] = 1.75,
	["position"] = {
		0, -- [1]
		0, -- [2]
	},
}

-- adibags
-- this is the bag frame, but don't replace it. It's too small (maybe). Scaling with the bag frame seems to be fine with its settings.

local AdiBagsProfile = {
	["parent"] = "AdiBagsSimpleLayeredRegion1",
	["scale"] = 1.65,
	["position"] = {
		-25, -- [1]
		-6, -- [2]
	},
}



-- bagnon
-- anchored to the money frame because scaling and reshaping the frame breaks the addon.

local BagnonProfile = {
	["parent"] = "BagnonMoneyFrame1",
	["scale"] = 1.4,
	["position"] = {
		-213, -- [1]
		237, -- [2]
	},
}

-- baudbag
-- anchoring to the sfirst inventory slot itself because it scales best and is compatible with the background options.

local BaudbagProfile = {
	["parent"] = "BaudBagSubBag0Item1",
	["scale"] = 1.3,
	["position"] = {
		-10, -- [1]
		32, -- [2]
	},
}

-- sorted
-- very nice look / feel to it. Left click has settings functionality, will need to inherit it.
local SortedProfile = {
	["parent"] = "SortedFramePortraitButton",
	["scale"] = 1.85,
	["position"] = {
		-0, -- [1]
		-0, -- [2]
	},
}

-- elvUI
-- style doesn't fit very well, have to anchor to bag slot
local ElvuiProfile = {
		["parent"] = "ElvUI_ContainerFrameBag0Slot1",
		["scale"] = 2.5,
		["position"] = {
			-25, -- [1]
			14, -- [2]
		},
}

-- GW2 UI
-- style somewhat fits, anchoring to a bag button that may not exist on retail
local GW2Profile = {
	["parent"] = "MainMenuBarBackpackButton",
	["scale"] = 2,
	["position"] = {
		1, -- [1]
		50, -- [2]
	},
}

local dimensionX = ContainerFrame1PortraitButton:GetWidth()
local dimensionY = ContainerFrame1PortraitButton:GetHeight()

local hearthbag = CreateFrame("Button", "Hearthbag", ContainerFrame1PortraitButton, "SecureActionButtonTemplate")	-- creates the first frame using a Secure Action Button Template
hearthbag:SetSize((dimensionX*.85),(dimensionY*.85))	-- makes the size be proportional to the frame in case frame is scaled
hearthbag:SetPoint("CENTER", parentHB, "CENTER", -dimensionX*0.09, dimensionY*.05)	-- anchors it proportional to frame in case also scaled

-- texture list

local hearthDefaultTex = "Interface/AddOns/Hearthbag/Hearthstone_Default.blp"
local hearthCooldownTex = "Interface/AddOns/Hearthbag/Hearthstone_Cooldown.blp"
local hearthCooldownBlip = "Interface/AddOns/Hearthbag/Hearthstone_Cooldown_blip.blp"
local hearthDesatTex = "Interface/AddOns/Hearthbag/Hearthstone_Desat.blp"
local hearthDownTex = "Interface/AddOns/Hearthbag/Hearthstone_Down.blp"

local item = Item:CreateFromItemID(6948)	-- magical code stuff, basically will call upon the hearthstone item ID

item:ContinueOnItemLoad(function()	-- this is friend. ensures the item is loaded with a mixin so you don't get item = nil
	hearthbag:SetAttribute("*type1", "item")	-- set to "any left click," targets an item
	hearthbag:SetAttribute("item", item:GetItemName())	-- the targetted item is now using the Item:CreateFromItemID() from before
end)

local icon = hearthbag:CreateTexture("yeehaw", "ARTWORK")	-- making the texture frame portion
icon:SetAllPoints(true)

local hearthCD = CreateFrame("Cooldown", "HearthCD", Hearthbag, "CooldownFrameTemplate")	-- making the cooldown frame portion
hearthCD:RegisterEvent("SPELL_UPDATE_COOLDOWN")	-- hearthstone effect is technically a spell
hearthCD:RegisterEvent("PLAYER_ENTERING_WORLD")	-- to ensure the cooldown is calculated upon login
hearthCD:RegisterEvent("BAG_UPDATE_COOLDOWN")	-- just in case spell doesn't do the thing
hearthCD:RegisterEvent("BAG_UPDATE")			-- this fires a lot
hearthCD:SetUseCircularEdge(true)	-- makes the cooldown edge circular, probably not needed
hearthCD:SetSwipeTexture(hearthCooldownTex)	-- set the cooldown texture to be the rune
hearthCD:SetSwipeColor(0.2,0.2,0.2,1.0)	-- set the RGB of the rune to ~20% "brightness" (makes it dark)
hearthCD:SetDrawEdge(true)	-- shows the blip on the CD
hearthCD:SetEdgeTexture(hearthCooldownBlip,1.0,1.0,1.0,1.0)	-- makes the blip as bright as possible
hearthCD:SetRotation(-2.22)	-- rotates the whole cooldown rune so that the tail end of the rune will fill out last. ~ -127 degrees

local function hearthCheck()	-- checks the cooldown on the hearthstone spell portion of the item
    local start, duration = GetSpellCooldown(8690)
    if duration ~= 0 then
        hearthCD:SetCooldown(start, duration)
    end
end

local function hearthBag_OnMouseDown(self, button)	-- controls the mouse down behaviour, including the "down" texture
    local start, duration = GetSpellCooldown(8690)
    local CastingHearth = select(8,UnitCastingInfo("player"))	-- I refuse to use == 1 for the item count because it may be possible to glitch the game and grab 2+ hearthstones
	if ((GetItemCount(6948) > 0) and (button == "LeftButton") and (duration == 0) and (CastingHearth ~= 8690) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
		icon:SetTexture(hearthDownTex)
		PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\ButtonDown" .. math.random(1, 4) ..  ".ogg", "SFX")	-- selects from a random number of sounds
	elseif (GetItemCount(6948) > 0) then	-- if the item exists but doesn't fullfil above criteria
		icon:SetTexture(hearthDefaultTex)
	else									-- if the item does not exist or turns up nil
		icon:SetTexture(hearthDesatTex)
	end
end
local function hearthBag_OnMouseUp()	-- controls the mouse up behaviour, similar to mousedown function
	local start, duration = GetSpellCooldown(8690)
	local CastingHearth = select(8,UnitCastingInfo("player"))
	if (GetItemCount(6948) > 0) then
		icon:SetTexture(hearthDefaultTex)
		if ((duration == 0) and (CastingHearth ~= 8690) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
			
			PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\Button" .. math.random(1, 4) ..  ".ogg", "SFX")
		end
	else
		icon:SetTexture(hearthDesatTex)
	end
end


local function hearthDestroyed()	-- this also sets the texture upon login
	if GetItemCount(6948) > 0 then
		icon:SetTexture(hearthDefaultTex)
	else
		icon:SetTexture(hearthDesatTex)
	end
end

local function HearthInfo()
	GameTooltip:AddLine("Hearthbag Tooltip - currently using: " .. item:GetItemName())
end


-- all the scripts

hearthCD:SetScript("OnEvent", hearthCheck)
hearthCD:HookScript("OnEvent", hearthDestroyed)
hearthbag:SetScript("OnEnter", ContainerFramePortraitButton_OnEnter)
hearthbag:HookScript("OnEnter", HearthInfo)
hearthbag:SetScript("OnLeave", ContainerFramePortraitButton_OnLeave)
hearthbag:SetScript("OnMouseDown", hearthBag_OnMouseDown)
hearthbag:SetScript("OnMouseUp", hearthBag_OnMouseUp)


--[[local modelThingy = CreateFrame("Model", "HearthModel", UIParent)
modelThingy:SetSize(500,500)
modelThingy:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
modelThingy:SetModel("spells\\arcaneexplosion_base.m2")
modelThingy:SetModelScale(.5)]]


local _G, _M = getfenv(0), {}
setfenv(1, setmetatable(_M, {__index=_G}))

do
	local f = CreateFrame'Frame'
	f:SetScript('OnEvent', function(self, event, ...) _M[event](self, ...) end)
	f:RegisterEvent'ADDON_LOADED'
end

_G.HearthDB = {
	BAG = {},
};

BAG = {
};


local _dummy, core = ...;

-- old slash cmd list
--[[_G.SLASH_HEARTHBAG1 = "/hearthbag"
_G.SLASH_HEARTHBAG2 = "/hb"

function _G.SlashCmdList.HEARTHBAG(arg)
	if UnitAffectingCombat("player") == false then
		buttonPlacer.key = 'BAG'
		buttonPlacer:Show()
	else
		print("|T"..hearthDefaultTex..":14|t".."|ThearthDefaultTex|t".."|cff4fe6fcH|r|cff44e7ebe|r|cff4de7d6a|r|cff62e6bfr|r|cff7be4a6t|r|cff95e08eh|r|cffafdb78b|r|cffc9d466a|r|cffe2cb5ag|r: You can't do that in combat!")
	end
end]]

function ADDON_LOADED(_, arg1)
	if arg1 ~= 'Hearthbag' then
		return
	end

	CreateButtonPlacer()
	CreateButton'BAG'
	CreateButtonResetter()
end

function ParentButton(parent)
	local button = CreateFrame('Button', "HearthPlacer", parent)
	button:SetWidth(dimensionX*.85)
	button:SetHeight(dimensionY*.85)
	button:SetNormalTexture(hearthDesatTex)
	button:SetPushedTexture(hearthDesatTex)
	button:SetHighlightTexture[[Interface\Buttons\ButtonHilight-Square]]
	button:GetHighlightTexture():ClearAllPoints()
	button:GetHighlightTexture():SetPoint('CENTER', 0, 0)
	button:GetHighlightTexture():SetWidth(dimensionX)
	button:GetHighlightTexture():SetHeight(dimensionY)
	return button
end

function CreateButton(key)
	local settings = HearthDB[key]
	local button = ParentButton()
	_M[key].button = button
	button:SetScript('OnUpdate', function(self)
		if settings.parent and getglobal(settings.parent) then
			UpdateButton(key)
			self:SetScript('OnUpdate', nil)
		end
	end)
end



function UpdateButton(key)
	local button, settings = _M[key].button, HearthDB[key]
	if UnitAffectingCombat("player") == false then
		button:SetParent(settings.parent)
		button:SetPoint('CENTER', unpack(settings.position))
		button:SetScale(settings.scale)
		button:SetFrameStrata("BACKGROUND")
		button:Show()
		hearthbag:SetParent(settings.parent)
		hearthbag:SetPoint('CENTER', unpack(settings.position))
		hearthbag:SetScale(settings.scale)
		hearthbag:Show()
	else
		core:Print("Cancelling placement due to combat!")
	end
end

-- eventually change this to be the ProfileChecker onEvent script for /hb reset
--[[function ResetProfile(key)
	local button, settings = _M[key].button, HearthDB[key]
	--HearthDB.BAG["parent"] = "ContainerFrame1PortraitButton"
	--HearthDB.BAG["scale"] = 1
	--HearthDB.BAG["position"] = {-3,2,},
	print("|T"..hearthDefaultTex..":14|t".."|ThearthDefaultTex|t".."|cff4fe6fcH|r|cff44e7ebe|r|cff4de7d6a|r|cff62e6bfr|r|cff7be4a6t|r|cff95e08eh|r|cffafdb78b|r|cffc9d466a|r|cffe2cb5ag|r has been reset.")
	HearthDB.BAG = {parent="ContainerFrame1PortraitButton",scale=1,position={[1]=-3,[2]=2}}
	button:SetParent(settings.parent)
	button:SetPoint('CENTER', unpack(settings.position))
	button:SetScale(settings.scale)
	button:SetFrameStrata("BACKGROUND")
	button:Show()
	hearthbag:SetParent(settings.parent)
	hearthbag:SetPoint('CENTER', unpack(settings.position))
	hearthbag:SetScale(settings.scale)
	hearthbag:Show()
end]]

function CollectFrames()
	frames = {}
	local f
	while true do
		f = EnumerateFrames(f)
		if not f then break end
		if f.GetName and f:GetName() and f.IsVisible and f:IsVisible() and f.GetCenter and f:GetCenter() then
			tinsert(frames, f)
		end
	end	
end


function CreateButtonPlacer()
	local frame = CreateFrame("Frame", nil, UIParent)
	buttonPlacer = frame
	frame:EnableMouse(true)
	frame:EnableMouseWheel(true)
	frame:EnableKeyboard(true)
	frame:SetFrameStrata("FULLSCREEN_DIALOG")
	frame:SetAllPoints()
	frame:Hide()
	local targetMarker = frame:CreateTexture()
	targetMarker:SetColorTexture(1, 1, 0, .5)

	local buttonPreview = ParentButton(frame)
	buttonPreview:EnableMouse(false)
	buttonPreview:SetAlpha(.5)

	local function target(self)
		local f = frames[frame.index]
		frame.target = f
		local scale, x, y = f:GetEffectiveScale(), GetCursorPosition()
		targetMarker:SetAllPoints(f)
		buttonPreview:SetScale(scale * self.scale)
		RaidNotice_Clear(RaidWarningFrame)
		RaidNotice_AddMessage(RaidWarningFrame, f:GetName(), ChatTypeInfo["SAY"])
	end

	frame:SetScript("OnShow", function(self)
		self.scale = 1
		self.index = 1
		CollectFrames()
		target(self)
	end)
	frame:SetScript("OnKeyDown", function(self, arg1) if arg1 == 'ESCAPE' then self:Hide() end end)
	frame:SetScript("OnMouseWheel", function(self, arg1)
		if IsControlKeyDown() then
			self.scale = max(0, self.scale + arg1 * .05)
			buttonPreview:SetScale(self.target:GetEffectiveScale() * self.scale)
		else
			self.index = self.index + arg1
			if self.index < 1 then
				self.index = #frames
			elseif self.index > #frames then
				self.index = 1
			end
			target(self)
		end
	end)
	frame:SetScript("OnMouseDown", function(self)
		self:Hide()
		local x, y = GetCursorPosition()
		local targetScale, targetX, targetY = self.target:GetEffectiveScale(), self.target:GetCenter()
		HearthDB[self.key] = {parent=self.target:GetName(), position={(x/targetScale-targetX)/self.scale, (y/targetScale-targetY)/self.scale}, scale=self.scale}
		UpdateButton(self.key)
		core:Print("Placement has been anchored to: " .. HearthDB.BAG["parent"])
	end)
	frame:SetScript("OnUpdate", function()
		local scale, x, y = buttonPreview:GetEffectiveScale(), GetCursorPosition()
		buttonPreview:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x/scale, y/scale)
	end)
	frame:HookScript("OnUpdate", function(self)
		if UnitAffectingCombat("player") == true then
			self:Hide()
			core:Print("Cancelling placement due to combat!")
		end
	end)
end

function CreateButtonResetter()
	local frame = CreateFrame("Frame", nil, UIParent)
	buttonResetter = frame
	frame:EnableMouse(true)
	frame:EnableMouseWheel(true)
	frame:EnableKeyboard(true)
	frame:SetFrameStrata("FULLSCREEN_DIALOG")
	frame:SetAllPoints()
	frame:Hide()
	local targetMarker = frame:CreateTexture()
	targetMarker:SetColorTexture(1, 1, 0, .5)

	local buttonPreview = ParentButton(frame)
	buttonPreview:EnableMouse(false)
	buttonPreview:SetAlpha(.5)

	local function target(self)
		local f = frames[frame.index]
		frame.target = f
		local scale, x, y = f:GetEffectiveScale(), GetCursorPosition()
		targetMarker:SetAllPoints(f)
		buttonPreview:SetScale(scale * self.scale)
		RaidNotice_Clear(RaidWarningFrame)
		RaidNotice_AddMessage(RaidWarningFrame, f:GetName(), ChatTypeInfo["SAY"])
	end

--[[local AddonProfiles = {
	Name = {
		["ElvUI"] = ,

	}
}]]

	frame:SetScript("OnShow", function(self)
		self:Hide()
		if IsAddOnLoaded("ElvUI") == true then
			--OpenAllBags()
			if (ElvUI_ContainerFrameBag0Slot1:IsVisible() == true) then
				HearthDB[self.key] = ElvuiProfile
			elseif ElvUI_ContainerFrameBag0Slot1:GetParent() == UIParent then
				ElvUI_ContainerFrameBag0Slot1:Show()
				HearthDB[self.key] = ElvuiProfile
			else
				ElvUI_ContainerFrameBag0Slot1:GetParent():Show()
				HearthDB[self.key] = ElvuiProfile
			end

		elseif IsAddOnLoaded("GW2_UI") == true then
			--OpenAllBags()
			if (MainMenuBarBackpackButton:IsVisible() == true) then
				HearthDB[self.key] = GW2Profile
			elseif MainMenuBarBackpackButton:GetParent() == UIParent then
				MainMenuBarBackpackButton:Show()
				HearthDB[self.key] = GW2Profile
			else
				MainMenuBarBackpackButton:GetParent():Show()
				HearthDB[self.key] = GW2Profile
			end

		elseif IsAddOnLoaded("Inventorian") == true then
			--OpenAllBags()
			if (InventorianBagFrameIconButton:IsVisible() == true) then
				HearthDB[self.key] = InventorianProfile
			elseif InventorianBagFrameIconButton:GetParent() == UIParent then
				InventorianBagFrameIconButton:Show()
				HearthDB[self.key] = InventorianProfile
			else
				InventorianBagFrameIconButton:GetParent():Show()
				HearthDB[self.key] = InventorianProfile
			end

		elseif IsAddOnLoaded("AdiBags") == true then
			--OpenAllBags()
			if (AdiBagsSimpleLayeredRegion1:IsVisible() == true) then
				HearthDB[self.key] = AdiBagsProfile
			elseif AdiBagsSimpleLayeredRegion1:GetParent() == UIParent then
				AdiBagsSimpleLayeredRegion1:Show()
				HearthDB[self.key] = AdiBagsProfile
			else
				AdiBagsSimpleLayeredRegion1:GetParent():Show()
				HearthDB[self.key] = AdiBagsProfile
			end

		elseif IsAddOnLoaded("Baggins") == true then
			--OpenAllBags()
			if (BagginsBag1Section2:IsVisible() == true) then
				HearthDB[self.key] = BagginsProfile
			elseif BagginsBag1Section2:GetParent() == UIParent then
				BagginsBag1Section2:Show()
				HearthDB[self.key] = BagginsProfile
			else
				BagginsBag1Section2:GetParent():Show()
				HearthDB[self.key] = BagginsProfile
			end

		elseif IsAddOnLoaded("Combuctor") == true then
			OpenAllBags()
			if (CombuctorInventoryFrame1:IsVisible() == true) then
				HearthDB[self.key] = CombuctorProfile
			elseif CombuctorInventoryFrame1:GetParent() == UIParent then
				CombuctorInventoryFrame1:Show()
				HearthDB[self.key] = CombuctorProfile
			else
				CombuctorInventoryFrame1:GetParent():Show()
				HearthDB[self.key] = CombuctorProfile
			end

		elseif IsAddOnLoaded("Arkinventory") == true then
			--OpenAllBags()
			if (ARKINV_Frame1TitleActionButton0:IsVisible() == true) then
				HearthDB[self.key] = ArkinventoryProfile
			elseif ARKINV_Frame1TitleActionButton0:GetParent() == UIParent then
				ARKINV_Frame1TitleActionButton0:Show()
				HearthDB[self.key] = ArkinventoryProfile
			else
				ARKINV_Frame1TitleActionButton0:GetParent():Show()
				HearthDB[self.key] = ArkinventoryProfile
			end

		elseif IsAddOnLoaded("Bagnon") == true then
			OpenAllBags()
			if (BagnonMoneyFrame1:IsVisible() == true) then
				HearthDB[self.key] = BagnonProfile
			elseif BagnonMoneyFrame1:GetParent() == UIParent then
				BagnonMoneyFrame1:Show()
				HearthDB[self.key] = BagnonProfile
			else
				BagnonMoneyFrame1:GetParent():Show()
				HearthDB[self.key] = BagnonProfile
			end

		elseif IsAddOnLoaded("BaudBag") == true then
			--OpenAllBags()
			if (BaudBagSubBag0Item1:IsVisible() == true) then
				HearthDB[self.key] = BaudbagProfile
			elseif BaudBagSubBag0Item1:GetParent() == UIParent then
				BaudBagSubBag0Item1:Show()
				HearthDB[self.key] = BaudbagProfile
			else
				BaudBagSubBag0Item1:GetParent():Show()
				HearthDB[self.key] = BaudbagProfile
			end

		elseif IsAddOnLoaded("Sorted") == true then
			--OpenAllBags()
			if (SortedFramePortraitButton:IsVisible() == true) then
				HearthDB[self.key] = SortedProfile
			elseif SortedFramePortraitButton:GetParent() == UIParent then
				SortedFramePortraitButton:Show()
				HearthDB[self.key] = SortedProfile
			else
				SortedFramePortraitButton:GetParent():Show()
				HearthDB[self.key] = SortedProfile
			end

		else
			HearthDB[self.key] = DefaultProfile
			print("executing default profile")
		end
		UpdateButton(self.key)
	end)
end

local ProfileChecker = CreateFrame("Frame")
ProfileChecker:RegisterEvent("ADDON_LOADED")

--{parent=ContainerFrame1PortraitButton, position ={-2.5, 2}, scale=1.2}
-- handling addon profiles

--	HearthDB.BAG = {parent="ContainerFrame1PortraitButton",scale=1,position={[1]=-3,[2]=2}}
-- this structure correctly writes preset data, for use with ingame chat cmd like /run

-- test structure with /run print(HearthDB.BAG["parent"]) etc.




ProfileChecker:SetScript("OnEvent", function(self, event, arg1)
	if event == "ADDON_LOADED" and arg1 == "Hearthbag" then
		if (HearthDB.BAG["parent"] == nil) and (HearthDB.BAG["scale"] == nil) and (HearthDB.BAG["position"] == nil) then
			HearthDB.BAG["parent"] = "ContainerFrame1PortraitButton"
			HearthDB.BAG["scale"] = 1
			HearthDB.BAG["position"] = {-3,2,}
			core:Print("Detecting no profile set for this character. Now using default profile.")
		end
	end
end)

core.commands = {
	["reset"] = function()
		if UnitAffectingCombat("player") == false then
			buttonResetter.key = 'BAG'
			buttonResetter:Show()
			core:Print("Placement has been reset. Anchoring to: " .. HearthDB.BAG["parent"])
			--HearthDB.BAG = {parent="ContainerFrame1PortraitButton",scale=1,position={[1]=-3,[2]=2}}
			--UpdateButton(HearthDB.BAG)
		end
	end,

	--[[["addon"] = function()
		if UnitAffectingCombat("player") == false then
			print("passing initial")
			HearthDB.BAG = inventorianTest
			print("passing the variable part, parent is: ".. HearthDB.BAG["parent"])
			buttonResetter.key = 'BAG'
			print("passing the key part, parent is: ".. HearthDB.BAG["parent"])
			--buttonResetter:Show()
			print("passing the show part, parent is: ".. HearthDB.BAG["parent"])
			core:Print("Placement has been reset. Anchoring to: " .. HearthDB.BAG["parent"])
			--HearthDB.BAG = {parent="ContainerFrame1PortraitButton",scale=1,position={[1]=-3,[2]=2}}
			--UpdateButton(HearthDB.BAG)
		end
	end,]]

	["help"] = function()
		core:Print("Type '/hearthbag' or '/hb' to place the button on a highlighted frame. Use ScrollWheel to cycle through the frames until you select the one of your choosing. Control+ScrollWheel will scale the size of the Hearthbag. '/hearthbag reset' will reset to a preset location, depending on your addons loaded.")
	end
};

local function HandleSlashCommands(str)
	if (#str == 0) and UnitAffectingCombat("player") == false then
		-- user entered "/hearthbag" or "/hb" with no additional args
		buttonPlacer.key = 'BAG'
		buttonPlacer:Show()
		core.commands.help();
		return;	
	elseif UnitAffectingCombat("player") == true then
		core:Print("You can't do that in combat!")
	end

	local args = {};
	for _dummy, arg in ipairs({ string.split(' ', str) }) do
		if (#arg > 0) then
			table.insert(args, arg);
		end
	end

	local path = core.commands; -- required for updating found table.

	for id, arg in ipairs(args) do

		if (#arg > 0) then --if string length is greater than 0
			arg = arg:lower();			
			if (path[arg]) then
				if (type(path[arg]) == "function") then				
					-- all remaining args passed to our function!
					path[arg](select(id + 1, unpack(args))); 
					return;					
				elseif (type(path[arg]) == "table") then				
					path = path[arg]; -- another sub-table found!
				end
			else
				-- does not exist!
				core.commands.help();
				return;
			end
		end
	end
end

function core:Print(...)
	local hex = "00ccff";
	local prefix = string.format("|cff%s%s|r", hex:upper(), "|T"..hearthDefaultTex..":14|t".."|ThearthDefaultTex|t".."|cff4fe6fcH|r|cff44e7ebe|r|cff4de7d6a|r|cff62e6bfr|r|cff7be4a6t|r|cff95e08eh|r|cffafdb78b|r|cffc9d466a|r|cffe2cb5ag|r:");
	DEFAULT_CHAT_FRAME:AddMessage(string.join(" ", prefix, ...));
end

function core:HearthbagSlash(event, name)
	if (name ~= "Hearthbag") then return end

	_G.SLASH_HEARTHBAG1 = "/hearthbag"
	_G.SLASH_HEARTHBAG2 = "/hb"
	_G.SlashCmdList.HEARTHBAG = HandleSlashCommands;
end

ProfileChecker:HookScript("OnEvent", core.HearthbagSlash); -- part of 

