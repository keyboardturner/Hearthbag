local addonName, Hearthbag = ...;

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")

f:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" and ... == addonName then
		if not HearthDB then HearthDB = {} end
		if not HearthDB.SelectedKey then HearthDB.SelectedKey = "Default" end
		
	elseif event == "PLAYER_LOGIN" then
		if Hearthbag.MainButton then
			Hearthbag.MainButton:UpdateSkin(HearthDB.SelectedKey)
		end
	end
end)

function Hearthbag:GetDataByKey(key)
	for _, data in ipairs(Hearthbag.HearthKeys) do
		if data.key == key then return data end
	end
	return Hearthbag.HearthKeys[1]
end