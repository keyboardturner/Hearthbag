local addonName, Hearthbag = ...;

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")

f:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" and ... == addonName then
		if not Hearthbag_DB then Hearthbag_DB = {} end
		
		if not Hearthbag_DB.BagParent then Hearthbag_DB.BagParent = "UIParent" end
		if not Hearthbag_DB.BagOffset then Hearthbag_DB.BagOffset = { "CENTER", "CENTER", 0, 0 } end
		if not Hearthbag_DB.CombatPos then Hearthbag_DB.CombatPos = { "CENTER", "CENTER", 0, 0 } end
		if Hearthbag_DB.UseCombatFrame == nil then Hearthbag_DB.UseCombatFrame = false end
		if Hearthbag_DB.ShowHelpTips == nil then Hearthbag_DB.ShowHelpTips = true end
		if not Hearthbag_DB.BagScale then Hearthbag_DB.BagScale = 42 end

		if not Hearthbag_DB.Characters then Hearthbag_DB.Characters = {} end
		
		local charKey = UnitName("player") .. " - " .. GetRealmName()
		Hearthbag.CharKey = charKey
		
		if not Hearthbag_DB.Characters[charKey] then
			Hearthbag_DB.Characters[charKey] = {}
		end

		Hearthbag.GetCharDB = function()
			return Hearthbag_DB.Characters[Hearthbag.CharKey]
		end
		
		local charDB = Hearthbag.GetCharDB()
		if not charDB.PrimaryKey then charDB.PrimaryKey = "Default" end

	elseif event == "PLAYER_LOGIN" then
		if Hearthbag.MainButton then
			local charDB = Hearthbag.GetCharDB()
			Hearthbag.MainButton:UpdateSkin(charDB.PrimaryKey)
			
			if Hearthbag.MainButton.ApplyScale then Hearthbag.MainButton:ApplyScale() end
			if Hearthbag.UpdateAnchor then Hearthbag:UpdateAnchor() end
		end
	end
end)

function Hearthbag:GetDataByKey(key)
	for _, data in ipairs(Hearthbag.HearthKeys) do
		if data.key == key then return data end
	end
	return Hearthbag.HearthKeys[1]
end