local addonName, Hearthbag = ...;

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")

f:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" and ... == addonName then
		if not HearthDB then HearthDB = {} end
		
		if not HearthDB.BagParent then HearthDB.BagParent = "ContainerFrame1" end
		if not HearthDB.BagOffset then HearthDB.BagOffset = { "CENTER", "CENTER", -142, 30 } end
		if not HearthDB.CombatPos then HearthDB.CombatPos = { "CENTER", "CENTER", 0, 0 } end
		if HearthDB.UseCombatFrame == nil then HearthDB.UseCombatFrame = true end
		if not HearthDB.BagScale then HearthDB.BagScale = 42 end

		if not HearthDB.Characters then HearthDB.Characters = {} end
		
		local charKey = UnitName("player") .. " - " .. GetRealmName()
		Hearthbag.CharKey = charKey
		
		if not HearthDB.Characters[charKey] then
			HearthDB.Characters[charKey] = {}
		end

		Hearthbag.GetCharDB = function()
			return HearthDB.Characters[Hearthbag.CharKey]
		end
		
		local charDB = Hearthbag.GetCharDB()
		if not charDB.SelectedKey then charDB.SelectedKey = "Default" end
		if not charDB.PrimaryKey then charDB.PrimaryKey = "Default" end

	elseif event == "PLAYER_LOGIN" then
		if Hearthbag.MainButton then
			local charDB = Hearthbag.GetCharDB()
			Hearthbag.MainButton:UpdateSkin(charDB.SelectedKey)
			
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