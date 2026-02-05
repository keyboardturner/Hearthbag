local addonName, Hearthbag = ...

local L = {};
Hearthbag.L = L;

local function defaultFunc(L, key)
 -- If this function was called, we have no localization for this key.
 -- We could complain loudly to allow localizers to see the error of their ways, 
 -- but, for now, just return the key as its own localization. This allows you to—avoid writing the default localization out explicitly.
 return key;
end
setmetatable(L, {__index=defaultFunc});

local LOCALE = GetLocale()


if LOCALE == "enUS" then
	-- The EU English game client also
	-- uses the US English locale code.
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "Adds a customizable hearthstone button"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/hearthbag" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Hearthbag Error: %s"
	L["Hearthbag"] = "Hearthbag: %s"
	L["CantFindParent"] = "Could not find parent frame '%s'. Resetting to UIParent."
	L["ShowCFInCombat"] = "Show Combat Frame During Combat"
	L["UnlockCombatFrame"] = "Unlock Combat Anchor Frame"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "Cannot toggle anchor in combat."
	L["TempTele"] = "Temporary Teleport"
	L["RightClick"] = "Right-Click:"
	L["ShiftScroll"] = "Shift-Scroll:"
	L["ShiftDrag"] = "Shift-Drag:"
	L["OpenSettings"] = "Open Settings"
	L["Resize"] = "Resize"
	L["DragFrame"] = "Drag Frame"
	L["RandomHearthstone"] = "Random Hearthstone"
	L["RandomHearthstoneTT"] = "Randomly selects from owned hearthstones"
	L["CantMoveInCombat"] = "Cannot move in combat."
	L["FrameNotFound"] = "Frame '%s' not found."
	L["ResetToUIParent"] = "Reset anchor to UIParent."
	L["NotAFrame"] = "Cannot anchor to '%s'. It is not a Frame."
	L["RestrictedFrame"] = "Cannot anchor to restricted frame '%s'."
	L["CantAnchorToSelf"] = "Cannot anchor to self."
	L["AnchoredToFrame"] = "Anchored to %s"
	L["FrameNoName"] = "Invalid frame. Frame has no name."
	L["ResetHearthstone"] = "Reset hearthstone to centered position."
	L["HBCommands"] = "Hearthbag Commands:"
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "combat" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "anchor" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "reset" -- localized
	L["HBCMD_combat"] = "/hearthbag combat - Toggle the moveable combat frame."
	L["HBCMD_anchor"] = "/hearthbag anchor [framename] - Set the Hearthbag Parent to the frame under your mouse or to the specified frame name."
	L["HBCMD_reset"] = "/hearthbag reset - Reset to your Hearthbag to centered position."

return end

if LOCALE == "esMX" then
	-- Spanish (Mexico) translations go here

return end

if LOCALE == "esES" then
	-- Spanish translations go here

return end

if LOCALE == "deDE" then
	-- German translations go here

return end

if LOCALE == "frFR" then
	-- French translations go here

return end

if LOCALE == "itIT" then
	-- Italian translations go here

return end

if LOCALE == "ptBR" then
	-- Brazilian Portuguese translations go here

-- Note that the EU Portuguese WoW client also
-- uses the Brazilian Portuguese locale code.
return end

if LOCALE == "ruRU" then
	-- Russian translations go here

return end

if LOCALE == "koKR" then
	-- Korean translations go here

return end

if LOCALE == "zhCN" then
	-- Simplified Chinese translations go here

return end

if LOCALE == "zhTW" then
	-- Traditional Chinese translations go here

return end
