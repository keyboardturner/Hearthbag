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
}

BAG = {
}

_G.SLASH_HEARTHBAG1 = '/hearthbag'
function _G.SlashCmdList.HEARTHBAG(arg)
	if UnitAffectingCombat("player") == false then
		buttonPlacer.key = 'BAG'
		buttonPlacer:Show()
	else
		print("Hearthbag: You can't do that in combat!")
	end
end

function ADDON_LOADED(_, arg1)
	if arg1 ~= 'Hearthbag' then
		return
	end

	CreateButtonPlacer()
	CreateButton'BAG'
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
	button:SetParent(settings.parent)
	button:SetPoint('CENTER', unpack(settings.position))
	button:SetScale(settings.scale)
	button:SetFrameStrata("BACKGROUND")
	button:Show()
	hearthbag:SetParent(settings.parent)
	hearthbag:SetPoint('CENTER', unpack(settings.position))
	hearthbag:SetScale(settings.scale)
	hearthbag:Show()
end

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
	local frame = CreateFrame('Frame', nil, UIParent)
	buttonPlacer = frame
	frame:EnableMouse(true)
	frame:EnableMouseWheel(true)
	frame:EnableKeyboard(true)
	frame:SetFrameStrata'FULLSCREEN_DIALOG'
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

	frame:SetScript('OnShow', function(self)
		self.scale = 1
		self.index = 1
		CollectFrames()
		target(self)
	end)
	frame:SetScript('OnKeyDown', function(self, arg1) if arg1 == 'ESCAPE' then self:Hide() end end)
	frame:SetScript('OnMouseWheel', function(self, arg1)
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
	frame:SetScript('OnMouseDown', function(self)
		self:Hide()
		local x, y = GetCursorPosition()
		local targetScale, targetX, targetY = self.target:GetEffectiveScale(), self.target:GetCenter()
		HearthDB[self.key] = {parent=self.target:GetName(), position={(x/targetScale-targetX)/self.scale, (y/targetScale-targetY)/self.scale}, scale=self.scale}
		UpdateButton(self.key)
	end)
	frame:SetScript('OnUpdate', function()
		local scale, x, y = buttonPreview:GetEffectiveScale(), GetCursorPosition()
		buttonPreview:SetPoint('CENTER', UIParent, 'BOTTOMLEFT', x/scale, y/scale)
	end)
end