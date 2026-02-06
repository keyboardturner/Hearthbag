local addonName, Hearthbag = ...

L = Hearthbag.L;

local function GetFrameByName(name)
	if type(name) == "string" then
		return _G[name]
	else
		return name
	end
end

local function Print(...)
	local prefix = WrapTextInColorCode(L["Hearthbag"], "FF4FE6FC");
	DEFAULT_CHAT_FRAME:AddMessage(string.format(prefix, WrapTextInColorCode(..., "FFFFFFFF")));
end

local HearthbagPath = Hearthbag.TexturePath
local HOUSING_SPELLID = 1233637

local hb = CreateFrame("Button", "HearthbagButton", UIParent, "SecureActionButtonTemplate")
hb:SetSize(42, 42)
hb:SetPoint("CENTER")
hb:SetAttribute("type1", "item")
hb:SetAttribute("useOnKeyDown", false) -- key thingy to make it work on mouse up instead of down
hb:RegisterForClicks("LeftButtonUp")
hb:SetMouseClickEnabled(true)
hb:SetClampedToScreen(true)
hb:Hide()

hb:EnableMouseWheel(true)
hb.baseSize = 42
hb.sizeAmp = 1
hb.minAmp = 0.5
hb.maxAmp = 4.0

hb.isTemporaryOverride = false

function hb:UpdateSize()
	if InCombatLockdown() then return end
	
	local newSize = self.baseSize * self.sizeAmp
	
	self:SetSize(newSize, newSize)
	
	if HearthbagCombatAnchor then
		HearthbagCombatAnchor:SetSize(newSize, newSize)
	end
	
	if HearthDB then
		HearthDB.BagScale = newSize
	end
end

function hb:ApplyScale()
	if HearthDB and HearthDB.BagScale then
		self.sizeAmp = HearthDB.BagScale / self.baseSize
		self:UpdateSize()
	end
end

hb.bg = hb:CreateTexture(nil, "BACKGROUND")
hb.bg:SetAllPoints()
hb.cooldown = CreateFrame("Cooldown", "HearthbagCD", hb)
hb.cooldown:SetAllPoints()

hb.cooldown:SetUseCircularEdge(true)
hb.cooldown:SetSwipeColor(0.2, 0.2, 0.2, 1.0)
hb.cooldown:SetDrawEdge(true)
hb.cooldown:SetRotation(-2.22)
hb.cooldown:SetHideCountdownNumbers(true)

if Hearthbag.TexturePath then
	hb.cooldown:SetEdgeTexture(Hearthbag.TexturePath .. "Hearthstone_Cooldown_blip.blp", 1, 1, 1, 1)
end

Hearthbag.MainButton = hb;

local combatAnchor = CreateFrame("Frame", "HearthbagCombatAnchor", UIParent)
combatAnchor:SetSize(42, 42)
combatAnchor:SetMovable(true)
combatAnchor:EnableMouse(true)
combatAnchor:SetClampedToScreen(true)
combatAnchor:RegisterForDrag("LeftButton")
combatAnchor:Hide()

combatAnchor.overlay = CreateFrame("Frame", nil, combatAnchor)
combatAnchor.overlay:SetAllPoints()
combatAnchor.overlay:SetFrameLevel(9000)
combatAnchor.overlay:EnableMouse(false)

combatAnchor.tex = combatAnchor.overlay:CreateTexture(nil, "BACKGROUND")
combatAnchor.tex:SetAllPoints()
combatAnchor.tex:SetColorTexture(1, 0, 0, 0.5)

combatAnchor.text = combatAnchor.overlay:CreateFontString(nil, "OVERLAY", "GameFontNormal")
combatAnchor.text:SetPoint("CENTER")
combatAnchor.text:SetText("HB Combat")

combatAnchor:SetScript("OnDragStart", function(self)
	if InCombatLockdown() then return end
	self:StartMoving()
end)
combatAnchor:SetScript("OnDragStop", function(self)
	if InCombatLockdown() then return end
	self:StopMovingOrSizing()
	local point, _, relativePoint, x, y = self:GetPoint()
	HearthDB.CombatPos = { point, relativePoint, x, y }
end)

local function UpdateOverlayVisibility()
	if not InCombatLockdown() then -- needs to be the inverse because this check in combat is too late
		if combatAnchor:IsShown() then
			combatAnchor.overlay:Show()
		else
			combatAnchor.overlay:Hide()
			hb:Show()
		end
	else
		combatAnchor.overlay:Hide()
		
		if not combatAnchor:IsShown() then
			hb:Hide()
		end
	end
	hb:ClearAllPoints()
	hb:SetParent(UIParent)
end

local combatEventFrame = CreateFrame("Frame")
combatEventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
combatEventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
combatEventFrame:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_REGEN_DISABLED" then
		UpdateOverlayVisibility()
	elseif event == "PLAYER_REGEN_ENABLED" then
		UpdateOverlayVisibility()
	end
end)

hb:EnableMouseWheel(true)
hb:SetScript("OnMouseWheel", function(self, delta)
	if IsShiftKeyDown() then
		local step = 0.05625

		self.sizeAmp = self.sizeAmp + delta * step;
		
		if self.sizeAmp > self.maxAmp then
			self.sizeAmp = self.maxAmp;
		elseif self.sizeAmp < self.minAmp then
			self.sizeAmp = self.minAmp;
		end
		
		self:UpdateSize();
	end
end)

hb:SetMovable(true)
hb:RegisterForDrag("LeftButton")

hb:SetScript("OnDragStart", function(self)
	if IsShiftKeyDown() and not InCombatLockdown() then
		self:StartMoving()
	end
end)

hb:SetScript("OnDragStop", function(self)
	if InCombatLockdown() then return end

	self:StopMovingOrSizing()
	
	if combatAnchor:IsShown() then return end

	local parent = GetFrameByName(HearthDB.BagParent)
	if parent then
		local myX, myY = self:GetCenter()
		local parentX, parentY = parent:GetCenter()
		
		if myX and parentX then
			local x = myX - parentX
			local y = myY - parentY
			
			self:ClearAllPoints()
			self:SetPoint("CENTER", parent, "CENTER", x, y)
			
			HearthDB.BagOffset = { "CENTER", "CENTER", x, y }
		end
	end
end)

function Hearthbag:UpdateAnchor()
	if InCombatLockdown() then return end

	hb:SetScale(HearthDB.Scale or 1)

	if combatAnchor:IsShown() then
		hb:ClearAllPoints()
		hb:SetParent(combatAnchor)
		hb:SetPoint("CENTER", combatAnchor, "CENTER")
		--hb:SetFrameStrata("HIGH")
		hb:SetFrameLevel(combatAnchor:GetFrameLevel()+500)
		hb:Show()
	else
		local parent = GetFrameByName(HearthDB.BagParent)
		if parent then
			hb:ClearAllPoints()
			hb:SetParent(parent)
			local point, relPoint, x, y = unpack(HearthDB.BagOffset)
			hb:SetPoint(point, parent, relPoint, x, y)
			hb:SetFrameLevel(parent:GetFrameLevel()+500)
			if not InCombatLockdown() then
				hb:Show()
			end
		else
			Print(string.format(L["CantFindParent"],tostring(HearthDB.BagParent)))
			HearthDB.BagParent = "UIParent"
			Hearthbag:UpdateAnchor()
		end
	end
end

local menu = CreateFrame("Frame", "HearthbagMenu", hb)
menu:SetSize(250, 300)
menu:SetPoint("TOP", hb, "BOTTOM", 0, -30)
menu.bg = menu:CreateTexture(nil, "BACKGROUND")
menu.bg:SetPoint("TOPLEFT", menu, "TOPLEFT", -90, 10)
menu.bg:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", 80, 0)
menu.bg:SetTexture(HearthbagPath .. Hearthbag.SharedTextures.ItemHolderRet)
--menu.bg:SetTexCoord(.2,.8, 0, 1)
menu:Hide();

local nudgeConfig = {
	{ key = "ArrowUN", push = "ArrowUP", hl = "ArrowUHL", point = "BOTTOM", rel = "TOP", x = 0, y = 2, xDiff = 0, yDiff = 1 },
	{ key = "ArrowDN", push = "ArrowDP", hl = "ArrowDHL", point = "TOP", rel = "BOTTOM", x = 0, y = -2, xDiff = 0, yDiff = -1 },
	{ key = "ArrowLN", push = "ArrowLP", hl = "ArrowLHL", point = "RIGHT", rel = "LEFT", x = -2, y = 0, xDiff = -1, yDiff = 0 },
	{ key = "ArrowRN", push = "ArrowRP", hl = "ArrowRHL", point = "LEFT", rel = "RIGHT", x = 2, y = 0, xDiff = 1, yDiff = 0 },
};

for _, cfg in ipairs(nudgeConfig) do
	local btn = CreateFrame("Button", nil, menu)
	btn:SetSize(20, 20)
	btn:SetPoint(cfg.point, hb, cfg.rel, cfg.x, cfg.y)
	
	btn:SetNormalTexture(HearthbagPath .. Hearthbag.SharedTextures[cfg.key])
	btn:SetPushedTexture(HearthbagPath .. Hearthbag.SharedTextures[cfg.push])
	btn:SetHighlightTexture(HearthbagPath .. Hearthbag.SharedTextures[cfg.hl])
	
	btn:SetScript("OnClick", function()
		if InCombatLockdown() then return end
		if not HearthDB.BagOffset then return end
		
		HearthDB.BagOffset[3] = HearthDB.BagOffset[3] + cfg.xDiff
		HearthDB.BagOffset[4] = HearthDB.BagOffset[4] + cfg.yDiff
		
		Hearthbag:UpdateAnchor()
	end)
end

local settingsBar = CreateFrame("Frame", "HearthbagSettingsBar", menu)
settingsBar:SetSize(420, 40)
settingsBar:SetPoint("TOP", menu, "TOP", 0, 15)
settingsBar.bg = settingsBar:CreateTexture(nil, "BACKGROUND")
settingsBar.bg:SetAllPoints()
settingsBar.bg:SetTexture(HearthbagPath .. Hearthbag.SharedTextures.TitleBar)

local combatCheck = CreateFrame("Button", nil, settingsBar)
combatCheck:SetSize(24, 24)
combatCheck:SetPoint("CENTER", settingsBar, "CENTER", -24, 3)

function combatCheck:UpdateState()
	if HearthDB.UseCombatFrame then
		combatCheck:SetNormalTexture(HearthbagPath .. Hearthbag.SharedTextures.CheckUp)
	else
		combatCheck:SetNormalTexture(HearthbagPath .. Hearthbag.SharedTextures.CheckOff)
	end
end

local function UpdateCombatCheckTooltip(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP")
	GameTooltip:SetText(L["ShowCFInCombat"])
	
	if HearthDB.UseCombatFrame then
		GameTooltip:AddLine(VIDEO_OPTIONS_ENABLED, 0, 1, 0)
	else
		GameTooltip:AddLine(VIDEO_OPTIONS_DISABLED, 1, 0, 0)
	end
	
	GameTooltip:Show()
end

combatCheck:SetScript("OnEnter", UpdateCombatCheckTooltip)
combatCheck:SetScript("OnLeave", GameTooltip_Hide)

combatCheck:SetScript("OnClick", function(self)
	HearthDB.UseCombatFrame = not HearthDB.UseCombatFrame
	self:UpdateState()
	
	if GameTooltip:GetOwner() == self then
		UpdateCombatCheckTooltip(self)
	end
	if HearthDB.UseCombatFrame then
		PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\TinyButtonDown.ogg", "SFX")
	else
		PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\TinyButtonUp.ogg", "SFX")
	end
end)

combatCheck:SetScript("OnShow", function(self)
	self:UpdateState()
end)

local unlockCheck = CreateFrame("Button", nil, settingsBar)
unlockCheck:SetSize(24, 24)
unlockCheck:SetPoint("CENTER", settingsBar, "CENTER", 24, 3)

function unlockCheck:UpdateState()
	if combatAnchor:IsShown() then
		unlockCheck:SetNormalTexture(HearthbagPath .. Hearthbag.SharedTextures.CheckUp)
	else
		unlockCheck:SetNormalTexture(HearthbagPath .. Hearthbag.SharedTextures.CheckOff)
	end
end

unlockCheck:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP")
	GameTooltip:SetText(L["UnlockCombatFrame"])
	if combatAnchor:IsShown() then
		GameTooltip:AddLine(L["Unlock"], 0, 1, 0)
	else
		GameTooltip:AddLine(L["Locked"], 1, 0, 0)
	end
	GameTooltip:Show()
end)
unlockCheck:SetScript("OnLeave", GameTooltip_Hide)

unlockCheck:SetScript("OnClick", function(self)
	if InCombatLockdown() then
		Print(L["CantAnchorInCombat"])
		return
	end
	
	if combatAnchor:IsShown() then
		combatAnchor:Hide()
		hb:EnableMouse(true)
		PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\TinyButtonDown.ogg", "SFX")
	else
		combatAnchor:Show()
		hb:EnableMouse(false)
		PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\TinyButtonUp.ogg", "SFX")
	end
	
	UpdateOverlayVisibility()
	Hearthbag:UpdateAnchor()
	self:UpdateState()
	
	if GameTooltip:GetOwner() == self then
		local onEnter = self:GetScript("OnEnter")
		if onEnter then onEnter(self) end
	end
end)

unlockCheck:SetScript("OnShow", function(self) self:UpdateState() end)

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

eventFrame:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		if HearthDB and HearthDB.CombatPos then
			local point, relPoint, x, y = unpack(HearthDB.CombatPos)
			combatAnchor:ClearAllPoints()
			combatAnchor:SetPoint(point, UIParent, relPoint, x, y)
		end
		Hearthbag:UpdateAnchor()
		
	elseif event == "PLAYER_REGEN_DISABLED" then
		menu:Hide()
		combatAnchor:Hide()
		if HearthDB.UseCombatFrame then
			combatAnchor:Show()
			
			hb:SetParent(combatAnchor)
			hb:ClearAllPoints()
			hb:SetPoint("CENTER", combatAnchor, "CENTER")
			
			hb:Show()
		end
	elseif event == "PLAYER_REGEN_ENABLED" then
		combatAnchor:Hide()
		hb:EnableMouse(true)
		Hearthbag:UpdateAnchor()
	end
end)

function Hearthbag:IsOwned(data)
	if data.key == "Random" then return true end

	if data.key == "Garrison" then
		if not C_Garrison.GetGarrisonInfo(2) then
			return false
		end
	end

	if data.key == "Dalaran" then
		if not (C_QuestLog.IsQuestFlaggedCompleted(44184) or C_QuestLog.IsQuestFlaggedCompleted(44663)) then
			return false
		end
	end

	if data.raceIDs then
		local _, _, playerRaceID = UnitRace("player")
		local raceMatch = false
		for _, id in ipairs(data.raceIDs) do
			if id == playerRaceID then raceMatch = true break end
		end
		if not raceMatch then return false end
	end

	if data.itemIDs then
		for _, id in ipairs(data.itemIDs) do
			if PlayerHasToy(id) then return true end
			if C_Item.GetItemCount(id) > 0 then return true end
		end
	end

	return false
end

function Hearthbag:GetRandomValidKey()
	local validKeys = {}
	for _, data in ipairs(Hearthbag.HearthKeys) do
		if data.key ~= "Random" and not data.secondary and Hearthbag:IsOwned(data) then
			table.insert(validKeys, data.key)
		end
	end
	
	if #validKeys > 0 then
		return validKeys[fastrandom(1, #validKeys)]
	end
	return "Default"
end

function hb:RevertToPrimary()
	if InCombatLockdown() then
		self.pendingRevert = true
		return
	end
	
	if self.isTemporaryOverride then
		self.isTemporaryOverride = false
		self.pendingRevert = false
		self:UpdateSkin(Hearthbag.GetCharDB().PrimaryKey)
	end
end

function hb:UpdateSkin(key, isTemporary)
	if InCombatLockdown() then return end

	if key == "Garrison" then
		hb.cooldown:SetRotation(-5.13)
	elseif key == "Dalaran" then
		hb.cooldown:SetRotation(0)
	else
		hb.cooldown:SetRotation(-2.22)
	end

	local texBaseName
	local attrKey

	if key == "Random" then
		self.isRandomMode = true
		texBaseName = "hearthbutton_random"
		attrKey = Hearthbag:GetRandomValidKey()
	else
		self.isRandomMode = false
		attrKey = key
		local data = Hearthbag:GetDataByKey(key)
		texBaseName = data and data.Texture_Old or "Hearthstone_Default"
	end

	local charDB = Hearthbag.GetCharDB()
	charDB.SelectedKey = key
	
	if not isTemporary then
		charDB.PrimaryKey = key
		self.isTemporaryOverride = false
	else
		self.isTemporaryOverride = true
	end

	local data = Hearthbag:GetDataByKey(attrKey)

	if not data or not data.itemIDs then
		data = Hearthbag:GetDataByKey("Default")
	end
	
	--[[ debug
	print("Hearthbag: UpdateSkin")
	print("Key:", key)
	if texPaths then
		print("Texture Up:", texPaths.Up)
		print("Texture Cooldown:", texPaths.Cooldown)
	else
		print("Texture Paths: NIL")
	end
	if data then
		print("SpellID:", data.spellID)
	end
	--]]

	--HearthDB.SelectedKey = key
	--
	--if not isTemporary then
	--	HearthDB.PrimaryKey = key
	--	self.isTemporaryOverride = false
	--else
	--	self.isTemporaryOverride = true
	--end

	hb:SetAttribute("type1", "item")

	local item = Item:CreateFromItemID(data.itemIDs[1])
	item:ContinueOnItemLoad(function()
		hb:SetAttribute("item", "item:" .. data.itemIDs[1])
	end)

	local texPaths = Hearthbag:GetTexturePaths(texBaseName)
	if texPaths then
		hb:SetNormalTexture(texPaths.Up)
		hb:SetPushedTexture(texPaths.Down)
		hb.bg:SetTexture(texPaths.Up)
		hb.cooldown:SetSwipeTexture(texPaths.Cooldown)
	end

	hb.currentSpellID = data.spellID
	hb:UpdateCooldown()
end

function hb:SetHousingOverride(houseData)
	if InCombatLockdown() then return end
	
	self.isTemporaryOverride = true
	
	self:SetAttribute("type1", "visithouse")
	self:SetAttribute("item", nil) -- clear item just in case
	self:SetAttribute("house-neighborhood-guid", houseData.neighborhoodGUID)
	self:SetAttribute("house-guid", houseData.houseGUID)
	self:SetAttribute("house-plot-id", houseData.plotID)
	
	local suffix = C_Housing.GetNeighborhoodTextureSuffix(houseData.neighborhoodGUID)
	self:SetNormalTexture(HearthbagPath..Hearthbag.SharedTextures.HomestoneIcon)
	self:SetPushedTexture(HearthbagPath..Hearthbag.SharedTextures.HomestoneIcon)
	self.bg:SetTexture(HearthbagPath..Hearthbag.SharedTextures.HomestoneIcon)
	
	self.cooldown:Clear()
	self.currentSpellID = nil
end

function hb:UpdateCooldown()
	if not self.currentSpellID then return end
	
	local spellCooldownInfo = C_Spell.GetSpellCooldown(self.currentSpellID)
	local start = spellCooldownInfo.startTime
	local duration = spellCooldownInfo.duration
	
	--[[ debug
	if start and duration and duration > 0 then
		print("Hearthbag: Cooldown Active")
		print("  SpellID:", self.currentSpellID)
		print("  Start:", start)
		print("  Duration:", duration)
	end
	--]]
	if start and duration then
		self.cooldown:SetCooldown(start, duration)
	else
		self.cooldown:Clear()
	end
end

hb:RegisterEvent("SPELL_UPDATE_COOLDOWN")
hb:RegisterEvent("SPELL_UPDATE_USABLE")
hb:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
hb:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED")
hb:RegisterEvent("PLAYER_ENTERING_WORLD")

hb:SetScript("OnEvent", function(self, event, ...)
	if event == "SPELL_UPDATE_COOLDOWN" then
		self:UpdateCooldown()
	elseif event == "SPELL_UPDATE_USABLE" then
		self:UpdateCooldown()
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" or event == "UNIT_SPELLCAST_INTERRUPTED" then
		local unit, _, spellID = ...
		if unit == "player" and self.isTemporaryOverride then
			if spellID == HOUSING_SPELLID then -- player house teleport spell
				self:RevertToPrimary()
			else
				local currentData = Hearthbag:GetDataByKey(Hearthbag.GetCharDB().SelectedKey)
				if currentData and currentData.secondary and currentData.spellID == spellID then
					self:RevertToPrimary()
				end
			end
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		if self.isTemporaryOverride then
			self:RevertToPrimary()
		end
	end
end)

eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
local originalRegenEnabled = eventFrame:GetScript("OnEvent")
eventFrame:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_REGEN_ENABLED" then
		if hb.pendingRevert then
			hb:RevertToPrimary()
		end
	end
	if originalRegenEnabled then
		originalRegenEnabled(self, event, ...)
	end
end)

local neighborhoodTextures = {
	["durotar"] = {
		textureAtlas = "charactercreate-icon-horde",
	},
	["elwynn"] = {
		textureAtlas = "charactercreate-icon-alliance",
	},
};

local function OnTooltipUpdate(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP")
	
	if self.isTemporaryOverride and self:GetAttribute("type1") == "visithouse" then
		GameTooltip:SetSpellByID(HOUSING_SPELLID)

		local houseGUID = self:GetAttribute("house-guid")
		
		local houseName = "Player House"
		--local neighborhoodName = ""
		for _, houseData in ipairs(Hearthbag.HousingList) do
			if houseData.houseGUID == houseGUID then
				houseName = houseData.houseName or "Player House"
				--neighborhoodName = houseData.neighborhoodName or ""
				break
			end
		end
		
		GameTooltip:AddLine(houseName)
		--if neighborhoodName ~= "" then
		--	GameTooltip:AddLine(neighborhoodName, 1, 1, 1)
		--end
		GameTooltip:AddLine(L["TempTele"], 0.7, 0.7, 0.7)
		GameTooltip:AddLine(" ")
		GameTooltip:AddDoubleLine(L["RightClick"], L["OpenSettings"], 1, 1, 1, 1, 1, 1, true)
		GameTooltip:AddDoubleLine(L["ShiftScroll"], L["Resize"], 1, 1, 1, 1, 1, 1, true)
		GameTooltip:AddDoubleLine(L["ShiftDrag"], L["DragFrame"], 1, 1, 1, 1, 1, 1, true)
		GameTooltip:Show()
		return
	end

	if self.currentSpellID then
		GameTooltip:SetSpellByID(self.currentSpellID)
		GameTooltip:AddLine(" ")
		GameTooltip:AddDoubleLine(L["RightClick"], L["OpenSettings"], 1, 1, 1, 1, 1, 1, true)
		GameTooltip:AddDoubleLine(L["ShiftScroll"], L["Resize"], 1, 1, 1, 1, 1, 1, true)
		GameTooltip:AddDoubleLine(L["ShiftDrag"], L["DragFrame"], 1, 1, 1, 1, 1, 1, true)
		
		--[[ -- this info is shown in the spell tooltip anyway
		local spellCooldownInfo = C_Spell.GetSpellCooldown(self.currentSpellID)
		if spellCooldownInfo then
			local start = spellCooldownInfo.startTime
			local duration = spellCooldownInfo.duration
			
			if start and duration and duration > 0 then
				local remaining = (start + duration) - GetTime()
				if remaining > 0 then
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("Cooldown: " .. SecondsToTime(remaining), 1, 1, 1)
				end
			end
		end
		]]
		
		GameTooltip:Show()
	end
end

hb:SetScript("OnEnter", function(self)
	OnTooltipUpdate(self)
	self:SetScript("OnUpdate", OnTooltipUpdate)
end)

hb:SetScript("OnLeave", function(self)
	self:SetScript("OnUpdate", nil)
	GameTooltip_Hide()
end)

hb:SetScript("OnMouseDown", function(self, button)
	if button == "RightButton" then
		if not InCombatLockdown() then
			if menu:IsShown() then menu:Hide() else menu:Show() end
		end
	end

	local num = math.random(1, 4)
	PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\ButtonDown"..num..".ogg", "SFX")
end)
hb:SetScript("OnMouseUp", function(self, button)
	local num = math.random(1, 4)
	PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\Button"..num..".ogg", "SFX")
end)

hb:SetScript("PostClick", function(self)
	if not InCombatLockdown() and self.isRandomMode then
		self:UpdateSkin("Random", self.isTemporaryOverride)
	end
end)

Hearthbag.MenuButtons = {}
Hearthbag.HousingList = {}
local COLUMNS = 6
local PADDING = 5
local SIZE = 32

function Hearthbag:RebuildMenu()
	local btnIndex = 1

	local function ConfigureButton(data, isHousing)
		local btn = Hearthbag.MenuButtons[btnIndex]
		if not btn then
			btn = CreateFrame("Button", nil, menu)
			btn:SetSize(SIZE, SIZE)
			btn.status = btn:CreateTexture(nil, "OVERLAY")
			btn.status:SetSize(12, 12)
			btn.status:SetPoint("BOTTOMRIGHT")
			Hearthbag.MenuButtons[btnIndex] = btn
		end
		
		btn:Show()
		btn:SetAlpha(1)
		if btn:GetNormalTexture() then btn:GetNormalTexture():SetDesaturated(false) end

		local col = (btnIndex - 1) % COLUMNS
		local row = math.floor((btnIndex - 1) / COLUMNS)
		btn:SetPoint("TOPLEFT", menu, "TOPLEFT", (col * (SIZE + PADDING)) + 15, -(row * (SIZE + PADDING)) - 15)

		btn:SetScript("OnClick", nil)
		btn:SetScript("OnEnter", nil)
		btn:SetScript("OnLeave", GameTooltip_Hide)

		if isHousing then
			local suffix = C_Housing.GetNeighborhoodTextureSuffix(data.neighborhoodGUID)
			local texInfo = neighborhoodTextures[suffix]
			btn:SetNormalTexture(HearthbagPath..Hearthbag.SharedTextures.HomestoneIcon)
			btn:SetPushedTexture(HearthbagPath..Hearthbag.SharedTextures.HomestoneIcon)

			if texInfo and texInfo.textureAtlas then
				btn.status:SetSize(30, 30)
				btn.status:SetPoint("BOTTOMRIGHT", 8, -8)
				btn.status:SetAtlas(texInfo.textureAtlas)
			end

			btn:SetScript("OnClick", function()
				Hearthbag.MainButton:SetHousingOverride(data)
				menu:Hide()
			end)
			btn:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:AddLine(data.houseName or "Player House")
				--GameTooltip:AddLine(data.neighborhoodName, 1, 1, 1)
				GameTooltip:AddLine(L["TempTele"], 1, 1, 1)
				GameTooltip:Show()
			end)
		else
			local texPaths = Hearthbag:GetTexturePaths(data.Texture_Old)
			if texPaths then
				btn:SetNormalTexture(texPaths.Up)
				btn:SetPushedTexture(texPaths.Down)
			end

			local isOwned = Hearthbag:IsOwned(data)
			local isSecondary = data.secondary
			
			if isOwned then
				btn.status:SetTexture(HearthbagPath..Hearthbag.SharedTextures.CollectedYes)
			else
				btn.status:SetTexture(HearthbagPath..Hearthbag.SharedTextures.CollectedNo)
				btn:SetAlpha(0.5)
				btn:GetNormalTexture():SetDesaturated(true)
			end

			btn:SetScript("OnClick", function()
				if not isOwned then return end
				Hearthbag.MainButton:UpdateSkin(data.key, isSecondary)
				menu:Hide()
			end)
			btn:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				if data.key == "Random" then
					GameTooltip:AddLine(L["RandomHearthstone"])
					GameTooltip:AddLine(L["RandomHearthstoneTT"], 1, 1, 1)
				elseif data.itemIDs then
					GameTooltip:SetItemByID(data.itemIDs[1])
				end
				
				if isSecondary then
					GameTooltip:AddLine(L["TempTele"], 1, 1, 1)
				end
				GameTooltip:Show()
			end)
		end
		btnIndex = btnIndex + 1
	end

	for _, data in ipairs(Hearthbag.HearthKeys) do
		ConfigureButton(data, false)
	end

	for _, data in ipairs(Hearthbag.HousingList) do
		ConfigureButton(data, true)
	end

	for i = btnIndex, #Hearthbag.MenuButtons do
		Hearthbag.MenuButtons[i]:Hide()
	end
end

EventRegistry:RegisterFrameEventAndCallback("PLAYER_HOUSE_LIST_UPDATED", function(owner, ...)
	local houses = ...
	if houses then
		Hearthbag.HousingList = houses
		Hearthbag:RebuildMenu()
	end
end)

Hearthbag:RebuildMenu()

local itemUpdateFrame = CreateFrame("Frame")
itemUpdateFrame:RegisterEvent("BAG_UPDATE")
itemUpdateFrame:RegisterEvent("TOYS_UPDATED")
itemUpdateFrame:RegisterEvent("QUEST_TURNED_IN")
itemUpdateFrame:SetScript("OnEvent", function(self, event, ...)
	Hearthbag:RebuildMenu()
end)


local FORBIDDENFRAMES = {
	--["Minimap"] = true, -- test frame
	["ContainerFrameCombinedBagsPortraitButton"] = true,
	["WorldFrame"] = true,
}

local loginFrame = CreateFrame("Frame")
loginFrame:RegisterEvent("PLAYER_LOGIN")
loginFrame:SetScript("OnEvent", function()
	C_Housing.GetPlayerOwnedHouses()
end)

SLASH_HEARTHBAG1 = L["SLASH_HB1"]
SLASH_HEARTHBAG2 = L["SLASH_HB2"]
SLASH_HEARTHBAG3 = L["SLASH_HB3"]
SLASH_HEARTHBAG4 = L["SLASH_HB4"]

SlashCmdList["HEARTHBAG"] = function(msg)
	local cmd, arg = msg:match("^(%S*)%s*(.-)$")
	
	if cmd == L["HB_Slash_Combat1"] or cmd == L["HB_Slash_Combat2"] then
		if InCombatLockdown() then Print(L["CantMoveInCombat"]) return end
		
		if combatAnchor:IsShown() then
			combatAnchor:Hide()
			hb:EnableMouse(true)
		else
			combatAnchor:Show()
			hb:EnableMouse(false)
		end
		UpdateOverlayVisibility()
		Hearthbag:UpdateAnchor()
		
		if unlockCheck and unlockCheck:IsVisible() then
			unlockCheck:UpdateState()
		end
	elseif cmd == L["HB_Slash_Anchor1"] or cmd == L["HB_Slash_Anchor2"] then
		if InCombatLockdown() then Print(L["CantAnchorInCombat"]) return end
		
		local frame
		local fName
		
		if arg and arg ~= "" then
			fName = arg
			frame = _G[fName]
			
			if not frame then
				Print(string.format(L["FrameNotFound"], fName))
				return
			end
		else
			frame = GetMouseFoci()[1]
			if not frame or frame == WorldFrame then
				HearthDB.BagParent = "UIParent"
				HearthDB.BagOffset = { "CENTER", "CENTER", 0, 0 }
				Print(L["ResetToUIParent"])
				Hearthbag:UpdateAnchor()
				return
			end
			
			fName = frame:GetName()
		end

		if fName then
			if not frame:IsObjectType("Frame") then
				Print(string.format(L["NotAFrame"],fName))
				return
			end
			
			if FORBIDDENFRAMES[fName] then
				Print(string.format(L["RestrictedFrame"],fName))
				return
			end

			if frame == hb or frame == combatAnchor or frame == menu then
				Print(L["CantAnchorToSelf"])
				return
			end
			local parentCheck = frame:GetParent()
			while parentCheck do
				if parentCheck == hb then
					Print(L["CantAnchorToSelf"])
					return
				end
				parentCheck = parentCheck:GetParent()
			end
			HearthDB.BagParent = fName
			HearthDB.BagOffset = { "CENTER", "CENTER", 0, 0 }
			
			Print(string.format(L["AnchoredToFrame"],fName))
			Hearthbag:UpdateAnchor()
		else
			Print(string.format(L["Hearthbag"],L["FrameNoName"]))
		end
	elseif cmd == L["HB_Slash_Reset1"] or cmd == L["HB_Slash_Reset2"] then
		if InCombatLockdown() then Print(L["CantMoveInCombat"]) return end
		hb:RevertToPrimary()
		
		HearthDB.BagParent = "UIParent"
		HearthDB.BagOffset = { "CENTER", "CENTER", 0, 0 }
		Hearthbag:UpdateAnchor()
		Print(L["ResetHearthstone"])
	else
		Print(L["HBCommands"])
		Print(L["HBCMD_combat"])
		Print(L["HBCMD_anchor"])
		Print(L["HBCMD_reset"])
	end
end