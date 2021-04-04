local dimensionX = ContainerFrame1PortraitButton:GetWidth()
local dimensionY = ContainerFrame1PortraitButton:GetHeight()
local hearthbag = CreateFrame("Button", "Hearthbag", ContainerFrame1PortraitButton, "SecureActionButtonTemplate")
hearthbag:SetSize((dimensionX*.85),(dimensionY*.85))
hearthbag:SetPoint("CENTER", ContainerFrame1PortraitButton, "CENTER", -dimensionX*0.09, dimensionY*.05)

local hearthDefaultTex = "Interface/AddOns/Hearthbag/Hearthstone_Default.blp"
local hearthCooldownTex = "Interface/AddOns/Hearthbag/Hearthstone_Cooldown.blp"
local hearthCooldownBlip = "Interface/AddOns/Hearthbag/Hearthstone_Cooldown_blip.blp"
local hearthDesatTex = "Interface/AddOns/Hearthbag/Hearthstone_Desat.blp"
local hearthDownTex = "Interface/AddOns/Hearthbag/Hearthstone_Down.blp"

local item = Item:CreateFromItemID(6948)

item:ContinueOnItemLoad(function()
	hearthbag:SetAttribute("*type1", "item")
	hearthbag:SetAttribute("item", item:GetItemName())
end)

local icon = hearthbag:CreateTexture("yeehaw", "ARTWORK")
icon:SetAllPoints(true)

local hearthCD = CreateFrame("Cooldown", "HearthCD", Hearthbag, "CooldownFrameTemplate")
hearthCD:RegisterEvent("SPELL_UPDATE_COOLDOWN")
hearthCD:RegisterEvent("PLAYER_ENTERING_WORLD")
hearthCD:RegisterEvent("BAG_UPDATE_COOLDOWN")
hearthCD:RegisterEvent("BAG_UPDATE")
hearthCD:SetUseCircularEdge(true)
hearthCD:SetSwipeTexture(hearthCooldownTex)
hearthCD:SetSwipeColor(0.2,0.2,0.2,1.0)
hearthCD:SetDrawEdge(true)
hearthCD:SetEdgeTexture(hearthCooldownBlip,1.0,1.0,1.0,1.0)
hearthCD:SetRotation(-2.22)

local function hearthCheck()
    local start, duration = GetSpellCooldown(8690)
    if duration ~= 0 then
        hearthCD:SetCooldown(start, duration)
    end
end

local function hearthBag_OnMouseDown(self, button)
    local start, duration = GetSpellCooldown(8690)
    local CastingHearth = select(8,UnitCastingInfo("player"))
	if ((GetItemCount(6948) > 0) and (button == "LeftButton") and (duration == 0) and (CastingHearth ~= 8690) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
		icon:SetTexture(hearthDownTex)
		PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\ButtonDown" .. math.random(1, 4) ..  ".ogg", "SFX")
	elseif (GetItemCount(6948) > 0) then
		icon:SetTexture(hearthDefaultTex)
	else
		icon:SetTexture(hearthDesatTex)
	end
end
local function hearthBag_OnMouseUp()
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