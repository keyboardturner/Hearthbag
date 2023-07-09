local function heck()
	LeaveChannelByName("Trade")
end
local darn = CreateFrame("Frame")
darn:RegisterEvent("CHANNEL_UI_UPDATE")
darn:SetScript("OnEvent", heck)