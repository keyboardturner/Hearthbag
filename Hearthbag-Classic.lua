-- these frames cannot be parented to
local INVALID_FRAME = {
    WorldFrame = true,
    Hearthbag = true,
    TestHearthStone = true,
    InventorianBagFrameTitle = true,
    SkillFrameCollapseAllButton = true,
    FriendsFrameStatusDropDownButton = true,
    WorldMapZoneDropDownButton = true,
    HelpFrameCharacterStuckHearthstone = true,
    Display_DisplayModeDropDownButton = true,
    Display_PrimaryMonitorDropDownButton = true,
    Display_ResolutionDropDownButton = true,
    Display_AntiAliasingDropDownButton = true,
    Display_VerticalSyncDropDownButton = true,
    Display_RenderScaleSlider = true,
    Display_RaidSettingsEnabledCheckBox = true,
    Graphics_TextureResolutionDropDownButton = true,
    Graphics_ProjectedTexturesDropDownButton = true,
    Graphics_ShadowsDropDownButton = true,
    Graphics_LiquidDetailDropDownButton = true,
    Graphics_SunshaftsDropDownButton = true,
    Graphics_ParticleDensityDropDownButton = true,
    Graphics_SSAODropDownButton = true,
    Graphics_EnvironmentalDetailSlider = true,
    Graphics_GroundClutterSlider = true,
    Advanced_BufferingDropDownButton = true,
    Advanced_FilteringDropDownButton = true,
    Advanced_RTShadowQualityDropDownButton = true,
    Advanced_MultisampleAntiAliasingDropDownButton = true,
    Advanced_PostProcessAntiAliasingDropDownButton = true,
    Advanced_ResampleQualityDropDownButton = true,
    Advanced_GraphicsAPIDropDownButton = true,
    Advanced_AdapterDropDownButton = true,
    Advanced_MaxFPSSlider = true,
    Advanced_MaxFPSBKSlider = true,
    Advanced_ContrastSlider = true,
    Advanced_BrightnessSlider = true,
    Advanced_GammaSlider = true,
    Advanced_UIScaleSlider = true,
    Advanced_UseUIScale = true,
    NetworkOptionsPanelOptimizeSpeed = true,
    NetworkOptionsPanelUseIPv6 = true,
    NetworkOptionsPanelAdvancedCombatLogging = true,
    InterfaceOptionsLanguagesPanelLocaleDropDownButton = true,
    InterfaceOptionsLanguagePanelAudioLocaleDropDown = true,
    AudioOptionsSoundPanelHardwareDropDownButton = true,
    AudioOptionsSoundPanelSoundChannelsDropDownButton = true,
    AudioOptionsSoundPanelSoundCacheSizeDropDownButton = true,
    AudioOptionsVoicePanelOutputDeviceDropdownButton = true,
    AudioOptionsVoicePanelVoiceChatVolume = true,
    AudioOptionsVoicePanelVoiceChatDucking = true,
    AudioOptionsVoicePanelMicDeviceDropdownButton = true,
    AudioOptionsVoicePanelVoiceChatMicVolume = true,
    AudioOptionsVoicePanelVoiceChatMicSensitivity = true,
    AudioOptionsVoicePanelChatModeDropdownButton = true,
    ACP_AddonListSortDropDownButton = true,
};

local ITEM_LIST = {
	defaultHearthstone = 6948,
	defaultHearthstoneSpellID = 8690,

};

-- texture list
local TEXTURE_LIST = {
	hearthDefaultTex = "Interface/AddOns/Hearthbag/Textures/Hearthstone_Default.blp",
	hearthCooldownTex = "Interface/AddOns/Hearthbag/Textures/Hearthstone_Cooldown.blp",
	hearthCooldownBlip = "Interface/AddOns/Hearthbag/Textures/Hearthstone_Cooldown_blip.blp",
	hearthDesatTex = "Interface/AddOns/Hearthbag/Textures/Hearthstone_Desat.blp",
	hearthDownTex = "Interface/AddOns/Hearthbag/Textures/Hearthstone_Down.blp",

	hearthEndUpButton = "Interface/AddOns/Hearthbag/Textures/ArrowButton_HB.blp",
	hearthTitleBar = "Interface/AddOns/Hearthbag/Textures/TitleBar.blp",

	hearthCheckUp = "Interface/AddOns/Hearthbag/Textures/CheckButton_Enabled.blp",
	hearthCheckDown = "Interface/AddOns/Hearthbag/Textures/CheckButton_Disabled.blp",
	hearthCheckOff = "Interface/AddOns/Hearthbag/Textures/CheckButton_Off.blp",

	hearthArrowRN = "Interface/AddOns/Hearthbag/Textures/ArrowButtonRight_Norm.blp",
	hearthArrowLN = "Interface/AddOns/Hearthbag/Textures/ArrowButtonLeft_Norm.blp",
	hearthArrowDN = "Interface/AddOns/Hearthbag/Textures/ArrowButtonDown_Norm.blp",
	hearthArrowUN = "Interface/AddOns/Hearthbag/Textures/ArrowButtonUp_Norm.blp",
	hearthArrowRP = "Interface/AddOns/Hearthbag/Textures/ArrowButtonRight_Pressed.blp",
	hearthArrowLP = "Interface/AddOns/Hearthbag/Textures/ArrowButtonLeft_Pressed.blp",
	hearthArrowDP = "Interface/AddOns/Hearthbag/Textures/ArrowButtonDown_Pressed.blp",
	hearthArrowUP = "Interface/AddOns/Hearthbag/Textures/ArrowButtonUp_Pressed.blp",
	hearthArrowRHL = "Interface/AddOns/Hearthbag/Textures/ArrowButtonRight_HL.blp",
	hearthArrowLHL = "Interface/AddOns/Hearthbag/Textures/ArrowButtonLeft_HL.blp",
	hearthArrowDHL = "Interface/AddOns/Hearthbag/Textures/ArrowButtonDown_HL.blp",
	hearthArrowUHL = "Interface/AddOns/Hearthbag/Textures/ArrowButtonUp_HL.blp",
	haerthArrowParent = "Interface/AddOns/Hearthbag/Textures/ArruwButton_Parent.blp",

};

-- our default savedvariables, if none exist yet. prevents nil error upon first ever addon login
HearthDB = HearthDB or {
    BAG = {
        ["parent"] = "ContainerFrame1PortraitButton",
        ["scale"] = 45,
        ["position"] = {-3,2},
    },
    INHERIT = true,
    ITEM = ITEM_LIST.defaultHearthstone,
    SPELLID = ITEM_LIST.defaultHearthstoneSpellID,
    APPEARANCE = {
        UP = TEXTURE_LIST.hearthDefaultTex,
        DOWN = TEXTURE_LIST.hearthDownTex,
        COOLDOWN = TEXTURE_LIST.hearthCooldownTex,
        BLIP = TEXTURE_LIST.hearthCooldownBlip,
        DESAT = TEXTURE_LIST.hearthDesatTex,
    },
    COMBAT = {
        ["relative"] = "CENTER",
        ["scale"] = 45,
        ["position"] = {0,0},
    },
    COMBATFRAME_SHOW = false,
    INCOMBATFRAME_SHOW = true,
};

-- adibags
-- this is the bag frame, but don't replace it. It's too small (maybe). Scaling with the bag frame seems to be fine with its settings.

local AdiBagsProfile = {
    ["parent"] = "AdiBagsSimpleLayeredRegion1",
    ["scale"] = 45,
    ["position"] = {
        -41, -- [1]
        -6, -- [2]
    },
};


-- arkinventory
-- has the same menu for both left / right, so either can be used. scaling and resizing settings seem fine.

local ArkinventoryProfile = {
    ["parent"] = "ARKINV_Frame1TitleActionButton0",
    ["scale"] = 62,
    ["position"] = {
        0, -- [1]
        0, -- [2]
    },
};


-- inventorian
-- requires special work on right / left click functionality. couldn't find resizing settings
local InventorianProfile = {
    ["parent"] = "InventorianBagFrameIconButton",
    ["scale"] = 67,
    ["position"] = {
        0, -- [1]
        2, -- [2]
    },
};



-- baggins
-- left / right click should be fine - base frame has right click functionality but not the icon. thinner columns setting may break it

local BagginsProfile = {
    ["parent"] = "BagginsBag1Section2",
    ["scale"] = 42,
    ["position"] = {
        -32, -- [1]
        55, -- [2]
    },
};

-- combuctor
-- both left nad right click are consumed, do not use portrait (this one is neat and has a lot of utility). Settings seem fine.

local CombuctorProfile = {
    ["parent"] = "CombuctorInventoryFrame1",
    ["scale"] = 45,
    ["position"] = {
        -211, -- [1]
        165, -- [2]
    },
};

-- bagnon
-- anchored to the money frame because scaling and reshaping the frame breaks the addon.

local BagnonProfile = {
    ["parent"] = "ContainerFrame1Item2",
    ["scale"] = 45,
    ["position"] = {
        -48, -- [1]
        27, -- [2]
    },
};

-- baudbag
-- anchoring to the sfirst inventory slot itself because it scales best and is compatible with the background options.

local BaudbagProfile = {
    ["parent"] = "BaudBagSubBag0Item1",
    ["scale"] = 42,
    ["position"] = {
        -12, -- [1]
        43, -- [2]
    },
};

-- sorted
-- very nice look / feel to it. Left click has settings functionality, will need to inherit it.
local SortedProfile = {
    ["parent"] = "SortedFramePortraitButton",
    ["scale"] = 67,
    ["position"] = {
        -1, -- [1]
        0, -- [2]
    },
};

-- elvUI
-- style doesn't fit very well, have to anchor to bag slot
local ElvuiProfile = {
        ["parent"] = "ElvUI_ContainerFrameBag0Slot1",
        ["scale"] = 45,
        ["position"] = {
            -47, -- [1]
            46, -- [2]
        },
};

-- GW2 UI
-- style somewhat fits, anchoring to a bag button that may not exist on retail
local GW2Profile = {
    ["parent"] = "MainMenuBarBackpackButton",
    ["scale"] = 42,
    ["position"] = {
        -1, -- [1]
        44, -- [2]
    },
};

-- default profile
local defaultProfile = {
    ["parent"] = "ContainerFrame1PortraitButton",
    ["scale"] = 45,
    ["position"] = {
        -3, -- [1]
        2, -- [2]
    },
};

-- default combat frame profile
local defaultCombatFrame = {
    ["relative"] = "CENTER",
    ["scale"] = 45,
    ["position"] = {
        0, -- [1]
        0, -- [2]
    },
};

local _dummy, core = ...; -- handles slash commands

-- this is where hearthbag will jump to in combat
local combatFrame = CreateFrame("Frame", "CombatFrame", UIParent, nil);
combatFrame:SetMovable(true);
combatFrame:EnableMouse(true);
combatFrame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and not self.isMoving then
        self:StartMoving();
        self.isMoving = true;
    end
end)
combatFrame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and self.isMoving then
        self:StopMovingOrSizing();
        self.isMoving = false;
        local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint() -- I don't remember why but if I change this it explodes
        HearthDB.COMBAT["relative"] = point
        HearthDB.COMBAT["position"][1] = xOfs
        HearthDB.COMBAT["position"][2] = yOfs
    end
end)
combatFrame:SetScript("OnHide", function(self)
    if ( self.isMoving ) then
        self:StopMovingOrSizing();
        self.isMoving = false;
    end
end)
combatFrame:SetPoint(HearthDB.COMBAT["relative"], HearthDB.COMBAT["position"][1], HearthDB.COMBAT["position"][2]);
combatFrame:SetSize(HearthDB.COMBAT["scale"],HearthDB.COMBAT["scale"]);
combatFrame:SetClampedToScreen(true);
--combatFrame:SetScale(1.5);
local combatTex = combatFrame:CreateTexture("CombatTexture", "BACKGROUND");
combatTex:SetAllPoints(combatFrame);
combatTex:SetTexture(TEXTURE_LIST.hearthDesatTex);
combatTex:SetAlpha(0.5);
combatFrame:Hide();


local buttonContainer = CreateFrame("Frame", "ButtonContainer", UIParent);
buttonContainer:SetIgnoreParentScale(true);

local hearthbag = CreateFrame("Button", "Hearthbag", buttonContainer, "SecureActionButtonTemplate");
hearthbag.sizeAmp = 1;
hearthbag.minAmp = 1;
hearthbag.maxAmp = 4;
hearthbag.size = 32;
hearthbag:SetSize(32, 32);
hearthbag.background = hearthbag:CreateTexture(nil, "OVERLAY");
hearthbag.background:SetAllPoints(true);
hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);

-- magical code stuff, basically will call upon the hearthstone item ID
local item = Item:CreateFromItemID(HearthDB.ITEM)
item:ContinueOnItemLoad(function()  -- this is friend. ensures the item is loaded with a mixin so you don't get item = nil  
    if UnitAffectingCombat("player") == false then
        hearthbag:RegisterForClicks("LeftButtonUp", "RightButtonUp");
        hearthbag:SetAttribute("*type1", "item");   -- set to "any left click," targets an item
        hearthbag:SetAttribute("item", item:GetItemName()); -- the targetted item is now using the Item:CreateFromItemID() from before
        --UpdateCheckInherit_OnClick()
    else
        core:Print("Cannot set button functions in combat!");
    end
end);

-- button that enables the panel the options populate on to
local scrollbackButton = CreateFrame("Button", "ScrollBackButton", hearthbag, nil);
scrollbackButton:SetSize(25, 25);
scrollbackButton:SetPoint("LEFT", -15, 0);
scrollbackButton:SetNormalTexture(TEXTURE_LIST.hearthEndUpButton);
scrollbackButton:SetPushedTexture(hearthEndDownButton);
scrollbackButton:SetHighlightTexture(hearthEndHighlight);


-- background frame for the options to parent to, but is also parented to the button and placed under it in strata
local scrollbackFrame = CreateFrame("Frame", "ScrollBackFrame", scrollbackButton, nil);
scrollbackFrame:SetSize(180, 30);
scrollbackFrame:SetPoint("CENTER", -60, 0);

local scrollbackTex = scrollbackFrame:CreateTexture("ScrollBackTex", "BACKGROUND");
scrollbackTex:SetPoint("CENTER");
scrollbackTex:SetTexture(TEXTURE_LIST.hearthTitleBar);
scrollbackTex:SetDrawLayer("Background", 0);
scrollbackTex:SetAllPoints(scrollbackFrame);
scrollbackFrame:Hide();

-- the "end" button that can close the menu, works essentially the same as the background enabler button
local scrollbackendButton = CreateFrame("Button", "ScrollBackEndButton", scrollbackFrame, nil);
scrollbackendButton:SetSize(25, 25);
scrollbackendButton:SetPoint("LEFT", 30, 1);


scrollbackendButton:SetNormalTexture(TEXTURE_LIST.hearthEndUpButton);
scrollbackendButton:SetPushedTexture(hearthEndDownButton);
scrollbackendButton:SetHighlightTexture(hearthEndHighlight);

-- function that handles showing / hiding options panel
local function SBBTEX_ONCLICK()
    if scrollbackFrame:IsVisible() == true then
        scrollbackFrame:Hide();
    else
        scrollbackFrame:Show();
    end
end

local function smallbuttondown_ONMOUSEDOWN()
    PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\TinyButtonDown.ogg", "SFX");
end

local function smallbuttonup_ONMOUSEUP()
    PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\TinyButtonUp.ogg", "SFX");
end

scrollbackButton:SetScript("OnClick", SBBTEX_ONCLICK);
scrollbackendButton:SetScript("OnClick", SBBTEX_ONCLICK);
scrollbackButton:SetScript("OnMouseDown", smallbuttondown_ONMOUSEDOWN);
scrollbackendButton:SetScript("OnMouseDown", smallbuttondown_ONMOUSEDOWN);
scrollbackButton:SetScript("OnMouseUp", smallbuttonup_ONMOUSEUP);
scrollbackendButton:SetScript("OnMouseUp", smallbuttonup_ONMOUSEUP);


-- true/false inherit options
local checkboxbg0 = CreateFrame("Frame", "CheckBoxBG0", scrollbackFrame, nil);
checkboxbg0:SetSize(15, 15);
checkboxbg0:SetPoint("CENTER", -25, 3);

local checkboxbg0Tex = checkboxbg0:CreateTexture("ScrollBackTex0", "BACKGROUND");
checkboxbg0Tex:SetTexture(TEXTURE_LIST.hearthCheckDown);
checkboxbg0Tex:SetDrawLayer("Background", 0);
checkboxbg0Tex:SetAllPoints(checkboxbg0);

-- button frame that handles the true/false of inheriting addon right click frame
local InheritOptions = CreateFrame("CheckButton", "HearthAddons", checkboxbg0);
InheritOptions:SetAllPoints(checkboxbg0);
InheritOptions:SetPoint("CENTER", 0, 0);
InheritOptions:SetCheckedTexture(TEXTURE_LIST.hearthCheckUp);
InheritOptions:SetDisabledCheckedTexture(TEXTURE_LIST.hearthCheckOff);


-- handles what frame to "right click" per addon
local function UpdateCheckInherit_OnClick()
    if (HearthDB.INHERIT == true) then 
        if UnitAffectingCombat("player") == false then
            if (IsAddOnLoaded("Arkinventory") == true) then
                hearthbag:SetAttribute("*type2", "click");
                hearthbag:SetAttribute("clickbutton", ARKINV_Frame1TitleActionButton0);
            elseif (IsAddOnLoaded("Inventorian") == true) then
                hearthbag:SetAttribute("*type2", "macro");
                hearthbag:SetAttribute("macrotext", "/click InventorianBagFrameIconButton"); -- this is ugly and I hate it but it works and click / clickbutton / frame do not. I DON'T KNOW WHY. But this works.
            elseif (IsAddOnLoaded("Sorted") == true) then
                hearthbag:SetAttribute("*type2", "click");
                hearthbag:SetAttribute("clickbutton", SortedFramePortraitButton);
            else
                hearthbag:SetAttribute("*type1", "item");   -- set to "any left click," targets an item
                hearthbag:SetAttribute("item", item:GetItemName()); -- the targetted item is now using the Item:CreateFromItemID() from before
            end
        else
            core:Print("Cannot set button functions in combat!");
        end
    elseif (HearthDB.INHERIT == false) then
        if UnitAffectingCombat("player") == false then
            hearthbag:SetAttribute("*type2", nil);
        else
            core:Print("Cannot set button functions in combat!");
        end
    end
end

-- true/false of inheriting addon right click functions
local function CheckButton0Up_OnClick()
    if HearthDB.INHERIT == true then
        HearthDB.INHERIT = false
        InheritOptions:SetChecked(false)
        UpdateCheckInherit_OnClick(); 
    elseif HearthDB.INHERIT == false then
        HearthDB.INHERIT = true
        InheritOptions:SetChecked(true)
        UpdateCheckInherit_OnClick();
    end
    if HearthDB.INHERIT == nil then
        HearthDB.INHERIT = true
        UpdateCheckInherit_OnClick();
    end
end

-- grabs from savedvariables to make button "remember" what the user chose
local function CheckButton0Status_OnShow()
    if HearthDB.INHERIT == true then
        InheritOptions:SetChecked(true);
    elseif HearthDB.INHERIT == false then
        InheritOptions:SetChecked(false);
    end
end

local function CheckButton0Combat_OnEvent()
    if UnitAffectingCombat("player") == true then
        InheritOptions:SetEnabled(false);
    else
        InheritOptions:SetEnabled(true);
    end
end

InheritOptions.InheritValue = "True"
local function CheckButton0Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);

    if HearthDB.INHERIT == true then
        InheritOptions.InheritValue = "True"
    else
        InheritOptions.InheritValue = "False"
    end
    GameTooltip:AddLine("Inherit the right click options of current bag addon frame: |cff4fe6fc" .. InheritOptions.InheritValue .. "|r", 1, 1, 1, 1);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG0", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

local function CheckButton0Tooltip_OnLeave()
    GameTooltip:Hide();
end

InheritOptions:RegisterEvent("PLAYER_REGEN_DISABLED");
InheritOptions:RegisterEvent("PLAYER_REGEN_ENABLED");
InheritOptions:SetScript("OnClick", CheckButton0Up_OnClick);
InheritOptions:SetScript("OnShow", CheckButton0Status_OnShow);
InheritOptions:SetScript("OnEvent", CheckButton0Combat_OnEvent);
InheritOptions:SetScript("OnEnter", CheckButton0Tooltip_OnEnter);
InheritOptions:SetScript("OnLeave", CheckButton0Tooltip_OnLeave);



-- true/false to show the combat frame out of combat
local checkboxbg1 = CreateFrame("Frame", "CheckBoxBG1", scrollbackFrame, nil);
checkboxbg1:SetSize(15, 15);
checkboxbg1:SetPoint("CENTER", 0, 3);

local checkboxbg1Tex = checkboxbg1:CreateTexture("ScrollBackTex1", "BACKGROUND");
checkboxbg1Tex:SetTexture(TEXTURE_LIST.hearthCheckDown);
checkboxbg1Tex:SetDrawLayer("Background", 0);
checkboxbg1Tex:SetAllPoints(checkboxbg1);

local CombatOptions = CreateFrame("CheckButton", "HearthCombat", checkboxbg1);
CombatOptions:SetAllPoints(checkboxbg1);
CombatOptions:SetPoint("CENTER", 0, 0);
CombatOptions:SetCheckedTexture(TEXTURE_LIST.hearthCheckUp);
CombatOptions:SetDisabledCheckedTexture(TEXTURE_LIST.hearthCheckOff);


local function UpdateCheckCombat_OnClick()
    if (HearthDB.COMBATFRAME_SHOW == true) then 
        combatFrame:Show();
    elseif (HearthDB.COMBATFRAME_SHOW == false) then
        combatFrame:Hide();
    end
end

-- true/false of inheriting addon right click functions
local function CheckButton1Up_OnClick()
    if HearthDB.COMBATFRAME_SHOW == true then
        HearthDB.COMBATFRAME_SHOW = false
        CombatOptions:SetChecked(false)
        UpdateCheckCombat_OnClick(); 
    elseif HearthDB.COMBATFRAME_SHOW == false then
        HearthDB.COMBATFRAME_SHOW = true
        CombatOptions:SetChecked(true)
        UpdateCheckCombat_OnClick();
    end
    if HearthDB.COMBATFRAME_SHOW == nil then
        HearthDB.COMBATFRAME_SHOW = true
        UpdateCheckCombat_OnClick();
    end
end

-- grabs from savedvariables to make button "remember" what the user chose
local function CheckButton1Status_OnShow()
    if HearthDB.COMBATFRAME_SHOW == true then
        CombatOptions:SetChecked(true);
    elseif HearthDB.COMBATFRAME_SHOW == false then
        CombatOptions:SetChecked(false);
    end
end

CombatOptions.OutOfCombatValue = "False"
local function CheckButton1Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);

    if HearthDB.COMBATFRAME_SHOW == true then
        CombatOptions.OutOfCombatValue = "True"
    else
        CombatOptions.OutOfCombatValue = "False"
    end
    GameTooltip:AddLine("Show Combat Frame outside of Combat: |cff4fe6fc" .. CombatOptions.OutOfCombatValue .. "|r", 1, 1, 1, 1);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG1", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

local function CheckButton1Tooltip_OnLeave()
    GameTooltip:Hide();
end

CombatOptions:SetScript("OnClick", CheckButton1Up_OnClick);
CombatOptions:SetScript("OnShow", CheckButton1Status_OnShow);
CombatOptions:SetScript("OnEnter", CheckButton1Tooltip_OnEnter);
CombatOptions:SetScript("OnLeave", CheckButton1Tooltip_OnLeave);




-- true/false to show the combat frame out of combat
local checkboxbg2 = CreateFrame("Frame", "CheckBoxBG2", scrollbackFrame, nil);
checkboxbg2:SetSize(15, 15);
checkboxbg2:SetPoint("CENTER", 25, 3);

local checkboxbg2Tex = checkboxbg2:CreateTexture("ScrollBackTex1", "BACKGROUND");
checkboxbg2Tex:SetTexture(TEXTURE_LIST.hearthCheckDown);
checkboxbg2Tex:SetDrawLayer("Background", 0);
checkboxbg2Tex:SetAllPoints(checkboxbg2);

local InCombatOptions = CreateFrame("CheckButton", "HearthInCombat", checkboxbg2);
InCombatOptions:SetAllPoints(checkboxbg2);
InCombatOptions:SetPoint("CENTER", 0, 0);
InCombatOptions:SetCheckedTexture(TEXTURE_LIST.hearthCheckUp);
InCombatOptions:SetDisabledCheckedTexture(TEXTURE_LIST.hearthCheckOff);

-- true/false of inheriting addon right click functions
local function CheckButton2Up_OnClick()
    if HearthDB.INCOMBATFRAME_SHOW == true then
        HearthDB.INCOMBATFRAME_SHOW = false
        InCombatOptions:SetChecked(false)
    elseif HearthDB.INCOMBATFRAME_SHOW == false then
        HearthDB.INCOMBATFRAME_SHOW = true
        InCombatOptions:SetChecked(true)
    end
    if HearthDB.INCOMBATFRAME_SHOW == nil then
        HearthDB.INCOMBATFRAME_SHOW = true
    end
end

-- grabs from savedvariables to make button "remember" what the user chose
local function CheckButton2Status_OnShow()
    if HearthDB.INCOMBATFRAME_SHOW == true then
        InCombatOptions:SetChecked(true);
    elseif HearthDB.INCOMBATFRAME_SHOW == false then
        InCombatOptions:SetChecked(false);
    end
end

InCombatOptions.InCombatValue = "True"
local function CheckButton2Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);

    if HearthDB.INCOMBATFRAME_SHOW == true then
        InCombatOptions.InCombatValue = "True"
    else
        InCombatOptions.InCombatValue = "False"
    end
    GameTooltip:AddLine("Show Combat Frame during Combat: |cff4fe6fc" .. InCombatOptions.InCombatValue .. "|r", 1, 1, 1, 1);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG2", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

local function CheckButton2Tooltip_OnLeave()
    GameTooltip:Hide();
end

InCombatOptions:SetScript("OnClick", CheckButton2Up_OnClick);
InCombatOptions:SetScript("OnShow", CheckButton2Status_OnShow);
InCombatOptions:SetScript("OnEnter", CheckButton2Tooltip_OnEnter);
InCombatOptions:SetScript("OnLeave", CheckButton2Tooltip_OnLeave);


local nudgeParent = CreateFrame("Frame", "NudgeParent", scrollbackFrame, nil);
nudgeParent:SetSize(30, 30);
nudgeParent:SetPoint("CENTER", 0, 50);
local nudgeParentTex = nudgeParent:CreateTexture("NudgeParentTex", "BACKGROUND");
nudgeParentTex:SetTexture(TEXTURE_LIST.haerthArrowParent);
nudgeParentTex:SetDrawLayer("Background", 0);
nudgeParentTex:SetAllPoints(nudgeParent);

-- nudge right
local microMovementR = CreateFrame("Button", "HearthArrowR", nudgeParent);
microMovementR:SetSize(25,25);
microMovementR:SetNormalTexture(TEXTURE_LIST.hearthArrowRN);
microMovementR:SetPushedTexture(TEXTURE_LIST.hearthArrowRP);
microMovementR:SetHighlightTexture(TEXTURE_LIST.hearthArrowRHL);
microMovementR:SetPoint("RIGHT", 15, 0);

local function UpdatePositionRight_OnClick()
    if UnitAffectingCombat("player") == false then
        HearthDB.BAG["position"][1] = HearthDB.BAG["position"][1] + 1
        hearthbag:SetPoint("CENTER", HearthDB.BAG["parent"], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    else
        core:Print("Cannot set position in combat!");
    end
end

microMovementR:SetScript("OnClick", UpdatePositionRight_OnClick);

-- nudge left
local microMovementL = CreateFrame("Button", "HearthArrowL", nudgeParent);
microMovementL:SetSize(25,25);
microMovementL:SetNormalTexture(TEXTURE_LIST.hearthArrowLN);
microMovementL:SetPushedTexture(TEXTURE_LIST.hearthArrowLP);
microMovementL:SetHighlightTexture(TEXTURE_LIST.hearthArrowLHL);
microMovementL:SetPoint("LEFT", -15, 0);

local function UpdatePositionLeft_OnClick()
    if UnitAffectingCombat("player") == false then
        HearthDB.BAG["position"][1] = HearthDB.BAG["position"][1] - 1
        hearthbag:SetPoint("CENTER", HearthDB.BAG["parent"], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    else
        core:Print("Cannot set position in combat!");
    end
end

microMovementL:SetScript("OnClick", UpdatePositionLeft_OnClick);

-- nudge down
local microMovementD = CreateFrame("Button", "HearthArrowD", nudgeParent);
microMovementD:SetSize(25,25);
microMovementD:SetNormalTexture(TEXTURE_LIST.hearthArrowDN);
microMovementD:SetPushedTexture(TEXTURE_LIST.hearthArrowDP);
microMovementD:SetHighlightTexture(TEXTURE_LIST.hearthArrowDHL);
microMovementD:SetPoint("BOTTOM", 0, -15);

local function UpdatePositionDown_OnClick()
    if UnitAffectingCombat("player") == false then
        HearthDB.BAG["position"][2] = HearthDB.BAG["position"][2] - 1
        hearthbag:SetPoint("CENTER", HearthDB.BAG["parent"], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    else
        core:Print("Cannot set position in combat!");
    end
end

microMovementD:SetScript("OnClick", UpdatePositionDown_OnClick);

-- nudge up
local microMovementU = CreateFrame("Button", "HearthArrowU", nudgeParent);
microMovementU:SetSize(25,25);
microMovementU:SetNormalTexture(TEXTURE_LIST.hearthArrowUN);
microMovementU:SetPushedTexture(TEXTURE_LIST.hearthArrowUP);
microMovementU:SetHighlightTexture(TEXTURE_LIST.hearthArrowUHL);
microMovementU:SetPoint("TOP", 0, 15);

local function UpdatePositionUp_OnClick()
    if UnitAffectingCombat("player") == false then
        HearthDB.BAG["position"][2] = HearthDB.BAG["position"][2] + 1
        hearthbag:SetPoint("CENTER", HearthDB.BAG["parent"], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    else
        core:Print("Cannot set position in combat!");
    end
end

microMovementU:SetScript("OnClick", UpdatePositionUp_OnClick);

local function FrameLevelOrganiser()

    hearthbag:SetFrameLevel(50)
    if hearthbag:GetFrameLevel() >= 9000 then
        hearthbag:SetFrameLevel(hearthbag:GetFrameLevel() - 1000)
    end
    if hearthbag:GetFrameLevel() <= hearthbag:GetParent():GetFrameLevel() then
        hearthbag:SetFrameLevel(hearthbag:GetParent():GetFrameLevel() + 1)
    end
    if hearthbag:GetFrameLevel() >= 9000 then
        hearthbag:SetFrameLevel(hearthbag:GetFrameLevel() - 1000)
    end
    
    scrollbackButton:SetFrameLevel(45)
    if scrollbackButton:GetFrameLevel() >= hearthbag:GetFrameLevel() then
        scrollbackButton:SetFrameLevel(hearthbag:GetFrameLevel() - 1)
    end

    scrollbackFrame:SetFrameLevel(46)
    if scrollbackFrame:GetFrameLevel() <= scrollbackButton:GetFrameLevel() then
        scrollbackFrame:SetFrameLevel(scrollbackButton:GetFrameLevel() - 1)
    end

    scrollbackendButton:SetFrameLevel(45)
    if scrollbackendButton:GetFrameLevel() >= scrollbackFrame:GetFrameLevel() then
        scrollbackendButton:SetFrameLevel(scrollbackFrame:GetFrameLevel() - 1)
    end

    checkboxbg0:SetFrameLevel(47)
    if checkboxbg0:GetFrameLevel() <= scrollbackFrame:GetFrameLevel() then
        checkboxbg0:SetFrameLevel(scrollbackFrame:GetFrameLevel() +1 )
    end
    checkboxbg1:SetFrameLevel(47)
    if checkboxbg1:GetFrameLevel() <= scrollbackFrame:GetFrameLevel() then
        checkboxbg1:SetFrameLevel(scrollbackFrame:GetFrameLevel() +1 )
    end
    checkboxbg2:SetFrameLevel(47)
    if checkboxbg2:GetFrameLevel() <= scrollbackFrame:GetFrameLevel() then
        checkboxbg2:SetFrameLevel(scrollbackFrame:GetFrameLevel() +1 )
    end
end


-- controls the behaviour of Hearthbag
local function hearthBag_OnMouseDown(self, button)  -- controls the mouse down behaviour, including the "down" texture
    local duration = GetSpellCooldown(HearthDB.SPELLID);
    local CastingHearth = select(8,CastingInfo("player"));  -- I refuse to use == 1 for the item count because it may be possible to glitch the game and grab 2+ hearthstones
    if ((GetItemCount(HearthDB.ITEM) > 0) and (button == "LeftButton") and (duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.DOWN);
        PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\ButtonDown" .. math.random(1, 4) ..  ".ogg", "SFX");   -- selects from a random number of sounds
    elseif (GetItemCount(HearthDB.ITEM) > 0) then   -- if the item exists but doesn't fullfil above criteria
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
    else                                    -- if the item does not exist or turns up nil
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
    end
end
-- controls the mouse up behaviour, similar to mousedown function
local function hearthBag_OnMouseUp()
    local duration = GetSpellCooldown(HearthDB.SPELLID);
    local CastingHearth = select(8,CastingInfo("player"));
    if (GetItemCount(HearthDB.ITEM) > 0) then
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
        if ((duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
            PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\Button" .. math.random(1, 4) ..  ".ogg", "SFX");
        end
    else
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
    end
end
-- this also sets the texture upon login
local function hearthDestroyed()
    if GetItemCount(HearthDB.ITEM) > 0 then
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
    else
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
    end
end

local function hearthMouseOver_ONENTER()
    if IsAddOnLoaded("Arkinventory") == true and HearthDB.BAG["parent"] == "ARKINV_Frame1TitleActionButton0" then
        if ( ( HearthDB.BAG["position"][1] <= ( (ArkinventoryProfile["position"][1] + HearthDB.BAG["scale"])/2 ) ) and ( HearthDB.BAG["position"][1] >= ( (ArkinventoryProfile["position"][1] - HearthDB.BAG["scale"])/2 ) ) ) and ( ( HearthDB.BAG["position"][2] <= ( (ArkinventoryProfile["position"][2] + HearthDB.BAG["scale"])/2 ) ) and ( HearthDB.BAG["position"][2] >= ( (ArkinventoryProfile["position"][2] - HearthDB.BAG["scale"])/2 ) ) ) then
            GameTooltip:SetOwner(hearthbag, "ANCHOR_LEFT");
            GameTooltip:SetText(ArkInventory.Localise["MENU"], 1.0, 1.0, 1.0);
        end

    elseif IsAddOnLoaded("Inventorian") == true and HearthDB.BAG["parent"] == "InventorianBagFrameIconButton" then
        if ( ( HearthDB.BAG["position"][1] <= ( (InventorianProfile["position"][1] + HearthDB.BAG["scale"])/2 ) ) and ( HearthDB.BAG["position"][1] >= ( (InventorianProfile["position"][1] - HearthDB.BAG["scale"])/2 ) ) ) and ( ( HearthDB.BAG["position"][2] <= ( (InventorianProfile["position"][2] + HearthDB.BAG["scale"])/2 ) ) and ( HearthDB.BAG["position"][2] >= ( (InventorianProfile["position"][2] - HearthDB.BAG["scale"])/2 ) ) ) then
            local ItemCache = LibStub("LibItemCache-1.1")
            GameTooltip:SetOwner(hearthbag, "ANCHOR_RIGHT");
            GameTooltip:SetText((GetUnitName("player", false)), 1, 1, 1);
            if ItemCache:HasCache() then
                GameTooltip:AddLine("<Right-Click> to switch characters");
            else
                GameTooltip:AddLine("Install BagBrother to get access to the inventory of other characters.");
            end
            GameTooltip:Show();
        end

    elseif IsAddOnLoaded("Sorted") == true and HearthDB.BAG["parent"] == "SortedFramePortraitButton" then
        if ( ( HearthDB.BAG["position"][1] <= ( (SortedProfile["position"][1] + HearthDB.BAG["scale"])/2 ) ) and ( HearthDB.BAG["position"][1] >= ( (SortedProfile["position"][1] - HearthDB.BAG["scale"])/2 ) ) ) and ( ( HearthDB.BAG["position"][2] <= ( (SortedProfile["position"][2] + HearthDB.BAG["scale"])/2 ) ) and ( HearthDB.BAG["position"][2] >= ( (SortedProfile["position"][2] - HearthDB.BAG["scale"])/2 ) ) ) then
            SortedTooltip.CreateLocalized(hearthbag, "ANCHOR_TOP", "TOOLTIP_CONFIG")
        end
    elseif HearthDB.BAG["parent"] == "ContainerFrame1PortraitButton" then
        if ( ( HearthDB.BAG["position"][1] <= ( (defaultProfile["position"][1] + HearthDB.BAG["scale"])/2 ) ) and ( HearthDB.BAG["position"][1] >= ( (defaultProfile["position"][1] - HearthDB.BAG["scale"])/2 ) ) ) and ( ( HearthDB.BAG["position"][2] <= ( (defaultProfile["position"][2] + HearthDB.BAG["scale"])/2 ) ) and ( HearthDB.BAG["position"][2] >= ( (defaultProfile["position"][2] - HearthDB.BAG["scale"])/2 ) ) ) then
            GameTooltip:SetOwner(hearthbag, "ANCHOR_LEFT");
            if ( hearthbag:GetID() == 0 ) then
                GameTooltip:SetText(BACKPACK_TOOLTIP, 1.0, 1.0, 1.0);
                if (GetBindingKey("TOGGLEBACKPACK")) then
                    GameTooltip:AppendText(" "..NORMAL_FONT_COLOR_CODE.."("..GetBindingKey("TOGGLEBACKPACK")..")"..FONT_COLOR_CODE_CLOSE)
                end
            end
            GameTooltip:Show();
        end
    end
end

local function hearthMouseOver_ONLEAVE()
    GameTooltip:Hide();
end

hearthbag:SetScript("OnMouseDown", hearthBag_OnMouseDown);
hearthbag:SetScript("OnMouseUp", hearthBag_OnMouseUp);
hearthbag:SetScript("OnEnter", hearthMouseOver_ONENTER);
hearthbag:SetScript("OnLeave", hearthMouseOver_ONLEAVE);

hearthbag:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        combatFrame:Show();
        hearthbag:ClearAllPoints();
        hearthbag:SetParent(combatFrame);
        hearthbag:SetPoint("TOPLEFT", combatFrame, "TOPLEFT", 5, -5);
        hearthbag:SetPoint("BOTTOMRIGHT", combatFrame, "BOTTOMRIGHT", -5, 5);
        hearthbag:SetMovable(true);
        scrollbackButton:Hide();
        if HearthDB.INCOMBATFRAME_SHOW == true then
            combatFrame:Show();
        else
            combatFrame:Hide();
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
        hearthbag:ClearAllPoints();
        hearthbag:SetPoint("CENTER", HearthDB.BAG["parent"], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
        hearthbag:SetParent(HearthDB.BAG["parent"]);
        hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
        if HearthDB.COMBATFRAME_SHOW == true then
            combatFrame:Show();
        else
            combatFrame:Hide();
        end
        scrollbackButton:Show();
        FrameLevelOrganiser();
    end
end);

--hearthbag:RegisterEvent("PLAYER_LOGIN");
hearthbag:RegisterEvent("PLAYER_ENTERING_WORLD");
hearthbag:RegisterEvent("ADDON_LOADED");
hearthbag:RegisterEvent("PLAYER_REGEN_DISABLED");
hearthbag:RegisterEvent("PLAYER_REGEN_ENABLED");

-- the cooldown texture itself (the rune)
local hearthCD = CreateFrame("Cooldown", "HearthCD", Hearthbag, "CooldownFrameTemplate");
hearthCD:SetUseCircularEdge(true); -- makes the cooldown edge circular
hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN); -- set the cooldown texture to be the rune
hearthCD:SetSwipeColor(0.2,0.2,0.2,1.0); -- set the RGB of the rune to ~20% "brightness" (makes it dark)
hearthCD:SetDrawEdge(true); -- shows the blip on the CD
hearthCD:SetEdgeTexture(HearthDB.APPEARANCE.BLIP,1.0,1.0,1.0,1.0); -- makes the blip as bright as possible
hearthCD:SetRotation(-2.22); -- rotates the whole cooldown rune so that the tail end of the rune will fill out last. ~ -127 degrees

 -- checks the cooldown on the hearthstone spell portion of the item
local function hearthCheck()
    local start, duration = GetSpellCooldown(HearthDB.SPELLID);
    if duration ~= 0 then
        hearthCD:SetCooldown(start, duration);
    end
end

hearthCD:SetScript("OnEvent", hearthCheck);
hearthCD:HookScript("OnEvent", hearthDestroyed);

hearthCD:RegisterEvent("SPELL_UPDATE_COOLDOWN"); -- hearthstone effect is technically a spell
hearthCD:RegisterEvent("PLAYER_ENTERING_WORLD"); -- to ensure the cooldown is calculated upon login
hearthCD:RegisterEvent("BAG_UPDATE_COOLDOWN"); -- just in case spell doesn't do the thing
hearthCD:RegisterEvent("BAG_UPDATE"); -- this fires a lot


-- updates the scale of the hearthbag frame
function hearthbag:UpdateSize()
    if not InCombatLockdown() then
        HearthDB.BAG["scale"] = self.size*self.sizeAmp
        self:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
    end
end

-- scales the size when doing mousewheel
hearthbag:SetScript("OnMouseWheel", function(self, delta)
    self.sizeAmp = self.sizeAmp + delta * 0.15625;
    if self.sizeAmp > self.maxAmp then
        self.sizeAmp = self.maxAmp;
    elseif self.sizeAmp < self.minAmp then
        self.sizeAmp = self.minAmp;
    end
    self:UpdateSize();
end);


function buttonContainer:SetNewParent(newParent, offsetX, offsetY)
    HearthDB.BAG["parent"] = newParent:GetName()
    HearthDB.BAG["position"][1] = offsetX
    HearthDB.BAG["position"][2] = offsetY
    self:SetParent(HearthDB.BAG["parent"]);
    hearthbag:SetParent(HearthDB.BAG["parent"]);
    hearthbag:SetPoint("CENTER", HearthDB.BAG["parent"], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    hearthbag:SetFrameStrata("FULLSCREEN_DIALOG");
    FrameLevelOrganiser();
end


local frameSelector = CreateFrame("Frame", "FrameSelector", UIParent);    --frame selector
frameSelector:SetFrameStrata("FULLSCREEN_DIALOG");
frameSelector:SetIgnoreParentScale(true);

frameSelector.placerTexture = frameSelector:CreateTexture(nil, "OVERLAY", nil, 1);
frameSelector.placerTexture:SetTexture(TEXTURE_LIST.hearthDesatTex);
frameSelector.placerTexture:SetSize(32, 32);
frameSelector.placerTexture:SetAlpha(0.6);
frameSelector.placerTexture:SetPoint("CENTER", 0, 0);

frameSelector.focusTexture = frameSelector:CreateTexture(nil, "OVERLAY");
frameSelector.focusTexture:SetSize(32, 32);
frameSelector.focusTexture:SetColorTexture(1, 0.82, 0, 0.5);

frameSelector:Hide();
frameSelector.cycle = 0.1;

frameSelector:SetScript("OnUpdate", function(self, elapsed)
    if UnitAffectingCombat("player") == false then
        self.t = self.t + elapsed;
        self:UpdatePlacer();
        if self.t > self.cycle then
            self.t = 0;
            self:UpdateAnchorPosition();
        end
    else
        self:Hide();
        core:Print("You can't do that in combat!");
    end
end);

function frameSelector:UpdatePlacer()
    self.cursorX, self.cursorY = GetCursorPosition();
    self.placerTexture:SetPoint("CENTER", UIParent, "BOTTOMLEFT", self.cursorX, self.cursorY);
end

function frameSelector:UpdateAnchorPosition()
    local focus = GetMouseFocus();
    if focus then
        local frameName = focus:GetName();
        if not frameName or INVALID_FRAME[frameName] then
            focus = UIParent;
            frameName = "UIParent";
            frameSelector.focusTexture:Hide();
        else
            frameSelector.focusTexture:ClearAllPoints();
            frameSelector.focusTexture:SetPoint("TOPLEFT", focus, "TOPLEFT", 0, 0);
            frameSelector.focusTexture:SetPoint("BOTTOMRIGHT", focus, "BOTTOMRIGHT", 0, 0);
            frameSelector.focusTexture:Show();
        end
        
        if frameName ~= self.lastFrameName then
            self.lastFrameName = frameName;
            --print("Current Focus: |cffffd200"..frameName.."|r");
        end
        local focusX, focusY = focus:GetCenter();
        self.targetFrame = focus;
        self.relativePosition = {self.cursorX/self.uiScale - focusX, self.cursorY/self.uiScale - focusY};
        return
    end
    frameSelector.focusTexture:Hide();
end

function frameSelector:Start()
    self.isActive = true;
    self:Hide();
    frameSelector.t = 0;
    self.uiScale = UIParent:GetEffectiveScale();
    self:Show();
    --print("Start");
end

--[[function frameSelector:Cancel()
    self.isActive = nil;
    self:Hide();
    --print("Stop Repositioning");
end]]

function frameSelector:Stop()
    self.isActive = nil;
    self:Hide();
    if self.relativePosition and self.targetFrame then
        --print("Target: "..self.targetFrame:GetName())
        local offsetX, offsetY = unpack(self.relativePosition);
        local targetScale = self.targetFrame:GetEffectiveScale();
        buttonContainer:SetNewParent(self.targetFrame, offsetX * targetScale, offsetY * targetScale);
    end
    --print("Stop Repositioning");
end

function frameSelector:Toggle()
    if self.isActive then
        self:Stop();
    else
        self:Start();
    end
end

--[[frameSelector:SetScript("OnKeyDown", function(self, arg1)
    if arg1 == "ESCAPE" then
        frameSelector:Cancel();
    else
        frameSelector:Stop();
    end
end)]]

function hearthbag:buttonResetter()
    hearthbag:ClearAllPoints();
    if ( IsAddOnLoaded("ElvUI") == true ) then
        HearthDB.BAG["parent"] = ElvuiProfile["parent"]
        HearthDB.BAG["scale"] = ElvuiProfile["scale"]
        HearthDB.BAG["position"][1] = ElvuiProfile["position"][1]
        HearthDB.BAG["position"][2] = ElvuiProfile["position"][2]
    elseif ( IsAddOnLoaded("GW2_UI") == true ) then
        HearthDB.BAG["parent"] = GW2Profile["parent"]
        HearthDB.BAG["scale"] = GW2Profile["scale"]
        HearthDB.BAG["position"][1] = GW2Profile["position"][1]
        HearthDB.BAG["position"][2] = GW2Profile["position"][2]
    elseif ( IsAddOnLoaded("AdiBags") == true ) then
        HearthDB.BAG["parent"] = AdiBagsProfile["parent"]
        HearthDB.BAG["scale"] = AdiBagsProfile["scale"]
        HearthDB.BAG["position"][1] = AdiBagsProfile["position"][1]
        HearthDB.BAG["position"][2] = AdiBagsProfile["position"][2]
    elseif ( IsAddOnLoaded("Arkinventory") == true ) then
        HearthDB.BAG["parent"] = ArkinventoryProfile["parent"]
        HearthDB.BAG["scale"] = ArkinventoryProfile["scale"]
        HearthDB.BAG["position"][1] = ArkinventoryProfile["position"][1]
        HearthDB.BAG["position"][2] = ArkinventoryProfile["position"][2]
    elseif ( IsAddOnLoaded("Inventorian") == true ) then
        HearthDB.BAG["parent"] = InventorianProfile["parent"]
        HearthDB.BAG["scale"] = InventorianProfile["scale"]
        HearthDB.BAG["position"][1] = InventorianProfile["position"][1]
        HearthDB.BAG["position"][2] = InventorianProfile["position"][2]
    elseif ( IsAddOnLoaded("Baggins") == true ) then
        HearthDB.BAG["parent"] = BagginsProfile["parent"]
        HearthDB.BAG["scale"] = BagginsProfile["scale"]
        HearthDB.BAG["position"][1] = BagginsProfile["position"][1]
        HearthDB.BAG["position"][2] = BagginsProfile["position"][2]
    elseif ( IsAddOnLoaded("Combuctor") == true ) then
        HearthDB.BAG["parent"] = CombuctorProfile["parent"]
        HearthDB.BAG["scale"] = CombuctorProfile["scale"]
        HearthDB.BAG["position"][1] = CombuctorProfile["position"][1]
        HearthDB.BAG["position"][2] = CombuctorProfile["position"][2]
    elseif ( IsAddOnLoaded("Bagnon") == true ) then
        HearthDB.BAG["parent"] = BagnonProfile["parent"]
        HearthDB.BAG["scale"] = BagnonProfile["scale"]
        HearthDB.BAG["position"][1] = BagnonProfile["position"][1]
        HearthDB.BAG["position"][2] = BagnonProfile["position"][2]
    elseif ( IsAddOnLoaded("BaudBag") == true ) then
        HearthDB.BAG["parent"] = BaudbagProfile["parent"]
        HearthDB.BAG["scale"] = BaudbagProfile["scale"]
        HearthDB.BAG["position"][1] = BaudbagProfile["position"][1]
        HearthDB.BAG["position"][2] = BaudbagProfile["position"][2]
    elseif ( IsAddOnLoaded("Sorted") == true ) then
        HearthDB.BAG["parent"] = SortedProfile["parent"]
        HearthDB.BAG["scale"] = SortedProfile["scale"]
        HearthDB.BAG["position"][1] = SortedProfile["position"][1]
        HearthDB.BAG["position"][2] = SortedProfile["position"][2]
    else
        HearthDB.BAG["parent"] = defaultProfile["parent"]
        HearthDB.BAG["scale"] = defaultProfile["scale"]
        HearthDB.BAG["position"][1] = defaultProfile["position"][1]
        HearthDB.BAG["position"][2] = defaultProfile["position"][2]
    end
    hearthbag:SetPoint("CENTER", HearthDB.BAG["parent"], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    hearthbag:SetParent(HearthDB.BAG["parent"]);
    hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
    UpdateCheckInherit_OnClick();
    FrameLevelOrganiser();

    HearthDB.COMBAT["relative"] = defaultCombatFrame["relative"]
    HearthDB.COMBAT["position"][1] = defaultCombatFrame["position"][1]
    HearthDB.COMBAT["position"][2] = defaultCombatFrame["position"][2]
    combatFrame:SetPoint(HearthDB.COMBAT["relative"], HearthDB.COMBAT["position"][1], HearthDB.COMBAT["position"][2]);
end

hearthbag.frames = {}
-- snapshots all frames at the current time of executing this function
local function CollectFrames()
    local f
    while true do
        f = EnumerateFrames(f);
        if not f then break end
        if f.GetName and f:GetName() and f.IsVisible and f:IsVisible() and f.GetCenter and f:GetCenter() then
            tinsert(hearthbag.frames, f);
        end
    end 
end

local previewFrame = CreateFrame("Frame", "PreviewFrame", UIParent, nil);
previewFrame:SetSize(25, 25);
previewFrame:SetPoint("CENTER", 0, 0);
previewFrame:SetScale(1);
previewFrame:SetFrameStrata("FULLSCREEN_DIALOG");
local previewFrameTex = previewFrame:CreateTexture("PreviewFrameTex", "BACKGROUND");
previewFrameTex:SetTexture(TEXTURE_LIST.hearthDesatTex);
previewFrameTex:SetAllPoints(previewFrame);
previewFrame:Hide();

--the "yellow frame" placer similar to fstack
function previewFrame:CreateButtonPlacer()
    local frame = CreateFrame("Frame", nil, UIParent)
    previewFrame.buttonPlacer = frame
    frame:EnableMouse(true);
    frame:EnableMouseWheel(true);
    frame:EnableKeyboard(true);
    frame:SetFrameStrata("FULLSCREEN_DIALOG");
    frame:SetAllPoints();
    frame:Hide();
    local targetMarker = frame:CreateTexture();
    targetMarker:SetColorTexture(1, 1, 0, .5);

    --local buttonPreview = CleanupButton(frame)
    previewFrame:EnableMouse(false);
    previewFrame:SetAlpha(.5);

    -- grabs info on the currently selected frame
    local function target(self)
        local f = hearthbag.frames[frame.index]
        frame.target = f
        targetMarker:SetAllPoints(f);
        --buttonPreview:SetScale(scale * self.scale);
        RaidNotice_Clear(RaidWarningFrame);
        RaidNotice_AddMessage(RaidWarningFrame, f:GetName(), ChatTypeInfo["SAY"]);
    end

    -- executes function to snapshot current frames
    frame:SetScript("OnShow", function(self)
        self.scale = 1
        self.index = 1
        CollectFrames();
        target(self);
        previewFrame:Show();
        previewFrame:SetScale(1);
    end)

    --press escape to cancel
    frame:SetScript("OnKeyDown", function(self, arg1)
        if arg1 == "ESCAPE" then
            self:Hide(); 
            previewFrame:Hide();
        end
    end)

    --mousewheel will cycle through frame selected
    frame:SetScript("OnMouseWheel", function(self, arg1)
        --[[if IsControlKeyDown() then
            self.scale = max(0, self.scale + arg1 * .05);
            previewFrame:SetScale(self.target:GetEffectiveScale() * self.scale);
        else]] --old code but will keep maybe for later
        self.index = self.index + arg1
        if self.index < 1 then
            self.index = #hearthbag.frames
        elseif self.index > #hearthbag.frames then
            self.index = 1
        end
        target(self);
    end)


    frame:SetScript("OnMouseDown", function(self)
        self:Hide();
        previewFrame:Hide();
        local x, y = GetCursorPosition();
        local targetScale, targetX, targetY = self.target:GetEffectiveScale(), self.target:GetCenter();

        -- grabs the values stored and sets them as the SavedVars
        HearthDB.BAG = {parent=self.target:GetName(), position={(x/targetScale-targetX)/self.scale, (y/targetScale-targetY)/self.scale}, scale=HearthDB.BAG["scale"]}
        
        
        hearthbag:SetPoint("CENTER", HearthDB.BAG["parent"], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
        hearthbag:SetParent(HearthDB.BAG["parent"]);
        hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
        UpdateCheckInherit_OnClick();
        combatFrame:SetPoint(HearthDB.COMBAT["relative"], HearthDB.COMBAT["position"][1], HearthDB.COMBAT["position"][2]);
        hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
        FrameLevelOrganiser();
    end)

    -- handles the position of the preview on the cursor using OnUpdate, currently unused for simplicity
    frame:SetScript("OnUpdate", function()
        local scale, x, y = previewFrame:GetEffectiveScale(), GetCursorPosition()
        previewFrame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x/scale, y/scale);
    end)
end

core.commands = {
    ["reset"] = function()
        if UnitAffectingCombat("player") == false then
            --buttonResetter.key = 'BAG'
            hearthbag:buttonResetter()
            core:Print("Placement has been reset. Anchoring to: " .. HearthDB.BAG["parent"]);
            --HearthDB.BAG = {parent="ContainerFrame1PortraitButton",scale=1,position={[1]=-3,[2]=2}}
            --UpdateButton(HearthDB.BAG)
        else
            core:Print("You can't do that in combat!");
        end
    end,

    ["combat"] = function()
        if UnitAffectingCombat("player") == false then
            if combatFrame:IsVisible() == false then
                combatFrame:Show();
                core:Print("Now showing combat placement frame. Type '/hb combat' to disable the frame placer.")
            elseif combatFrame:IsVisible() == true then
                combatFrame:Hide();
            end
        else
            core:Print("You can't do that in combat!");
        end
    end,

    ["placer"] = function()
        if UnitAffectingCombat("player") == false then
            frameSelector:Toggle();
            core:Print("Type '/hearthbag placer' again to place the frame.")
        else
            core:Print("You can't do that in combat!");
        end
    end,

    ["cycler"] = function()
        if UnitAffectingCombat("player") == false then
            previewFrame.CreateButtonPlacer();
            previewFrame.buttonPlacer:Show();
            core:Print("Highlight the frame and click where you want your frame to be placed.")
        else
            core:Print("You can't do that in combat!");
        end
    end,

    ["help"] = function()
        --core:Print("this is a temporary message for testing - type '/hb placer' to execute the frame selector. The preview frame won't show.")
        core:Print("Type '/hearthbag placer' or '/hb placer' to place the button on a highlighted frame, or use '/hb cycler' and select a frame with ScrollWheel for a more free (but possibly buggy) anchor selection. Use ScrollWheel on the Hearthbag frame to control the size.\n'/hb reset' will reset to a preset location, depending on your addons loaded.\n'/hb combat' will temporarily show the moveable combat frame for the Hearthbag.")
    end
};

local function HandleSlashCommands(str)
    if (#str == 0) and UnitAffectingCombat("player") == false then
        core.commands.help();
        return; 
    elseif UnitAffectingCombat("player") == true then
        core:Print("You can't do that in combat!");
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
                core.commands.help();
                return;
            end
        end
    end
end

function core:Print(...)
    local prefix = string.format("|T" .. TEXTURE_LIST.hearthDefaultTex .. ":14|t" .. "|TTEXTURE_LIST.hearthDefaultTex|t" .. "|cff4fe6fcH|r|cff44e7ebe|r|cff4de7d6a|r|cff62e6bfr|r|cff7be4a6t|r|cff95e08eh|r|cffafdb78b|r|cffc9d466a|r|cffe2cb5ag|r:");    
    DEFAULT_CHAT_FRAME:AddMessage(string.join(" ", prefix, ...));
end

function core:init(event, name)
    if (name ~= "Hearthbag") then return end 

    SLASH_HEARTHBAG1 = "/hearthbag"
    SLASH_HEARTHBAG2 = "/hb"
    SlashCmdList.HEARTHBAG = HandleSlashCommands;
end

local events = CreateFrame("Frame");
events:RegisterEvent("ADDON_LOADED");
events:SetScript("OnEvent", core.init);

hearthbag:HookScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        OpenAllBags();
        hearthbag:ClearAllPoints();
        combatFrame:ClearAllPoints();
        hearthbag:SetPoint("CENTER", HearthDB.BAG["parent"], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
		hearthbag:SetParent(HearthDB.BAG["parent"]);
        hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
        UpdateCheckInherit_OnClick();
        combatFrame:SetPoint(HearthDB.COMBAT["relative"], HearthDB.COMBAT["position"][1], HearthDB.COMBAT["position"][2]);
        hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
        CloseAllBags();
        FrameLevelOrganiser();
        if HearthDB.COMBATFRAME_SHOW == true then
            combatFrame:Show();
        else
            combatFrame:Hide();
        end
    end
end);

local anchorBuddy = CreateFrame("Frame", "AnchorBuddy", UIParent, nil);
anchorBuddy:SetSize(25,25);
anchorBuddy:SetFrameStrata("HIGH");
anchorBuddy:RegisterEvent("PLAYER_ENTERING_WORLD");
anchorBuddy:SetPoint("CENTER", UIParent, "CENTER", 0, 0);
anchorBuddy:RegisterEvent("ADDON_LOADED")
anchorBuddy:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        if IsAddOnLoaded("AdiBags") == true then
            OpenAllBags()
            if (AdiBagsContainer1.BagSlotButton:IsVisible() == true) then
                anchorBuddy:SetParent(AdiBagsContainer1.BagSlotButton)
                anchorBuddy:SetPoint("CENTER", AdiBagsContainer1.BagSlotButton, "CENTER", 0, 0);
            elseif AdiBagsContainer1.BagSlotButton:GetParent() == UIParent then
                AdiBagsContainer1.BagSlotButton:Show()
                anchorBuddy:SetParent(AdiBagsContainer1.BagSlotButton)
                anchorBuddy:SetPoint("CENTER", AdiBagsContainer1.BagSlotButton, "CENTER", 0, 0);
            else
                AdiBagsContainer1.BagSlotButton:GetParent():Show()
                anchorBuddy:SetParent(AdiBagsContainer1.BagSlotButton)
                anchorBuddy:SetPoint("CENTER", AdiBagsContainer1.BagSlotButton, "CENTER", 0, 0);
            end
            CloseAllBags()
        end
    end
end);