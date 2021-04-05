local dimensionX = ContainerFrame1PortraitButton:GetWidth()
local dimensionY = ContainerFrame1PortraitButton:GetHeight()
local hearthbag = CreateFrame("Button", "Hearthbag", ContainerFrame1PortraitButton, "SecureActionButtonTemplate")	-- creates the first frame using a Secure Action Button Template
hearthbag:SetSize((dimensionX*.85),(dimensionY*.85))	-- makes the size be proportional to the frame in case frame is scaled
hearthbag:SetPoint("CENTER", ContainerFrame1PortraitButton, "CENTER", -dimensionX*0.09, dimensionY*.05)	-- anchors it proportional to frame in case also scaled

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

-- all the scripts

hearthCD:SetScript("OnEvent", hearthCheck)
hearthCD:HookScript("OnEvent", hearthDestroyed)
hearthbag:SetScript("OnEnter", ContainerFramePortraitButton_OnEnter)
hearthbag:SetScript("OnLeave", ContainerFramePortraitButton_OnLeave)
hearthbag:SetScript("OnMouseDown", hearthBag_OnMouseDown)
hearthbag:SetScript("OnMouseUp", hearthBag_OnMouseUp)


--[[local modelThingy = CreateFrame("Model", "HearthModel", UIParent)
modelThingy:SetSize(500,500)
modelThingy:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
modelThingy:SetModel("spells\\arcaneexplosion_base.m2")
modelThingy:SetModelScale(.5)]]