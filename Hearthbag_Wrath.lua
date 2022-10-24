local _dummy, core = ...; -- handles slash commands

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
    rubySlippers = 28585,
    rubySlippersSpellID = 39937,
    darkPortal = 184871,
    darkPortalSpellID = 348699,

};

-- texture list
local TEXTURE_LIST = {
    hearthDefaultTex = "Interface/AddOns/Hearthbag/Textures/Hearthstone_Default.blp",
    hearthCooldownTex = "Interface/AddOns/Hearthbag/Textures/Hearthstone_Cooldown.blp",
    hearthCooldownBlip = "Interface/AddOns/Hearthbag/Textures/Hearthstone_Cooldown_blip.blp",
    hearthDesatTex = "Interface/AddOns/Hearthbag/Textures/Hearthstone_Desat.blp",
    hearthDownTex = "Interface/AddOns/Hearthbag/Textures/Hearthstone_Down.blp",
    hearthCombatTex = "Interface/AddOns/Hearthbag/Textures/combatframe.blp",

    hearthEndUpButton = "Interface/AddOns/Hearthbag/Textures/ArrowButton_HB.blp",
    hearthEndDownButton = "Interface/AddOns/Hearthbag/Textures/ArrowButton_HBDown.blp",
    hearthEndHighlight = "Interface/AddOns/Hearthbag/Textures/ArrowButton_HBHL.blp",
    hearthTitleBar = "Interface/AddOns/Hearthbag/Textures/TitleBar.blp",
    hearthItemHolderTBC = "Interface/AddOns/Hearthbag/Textures/ItemHolderTBC.blp",
    hearthItemHolderRet = "Interface/AddOns/Hearthbag/Textures/ItemHolderRetail.blp",

    hearthCheckUp = "Interface/AddOns/Hearthbag/Textures/CheckButton_Enabled.blp",
    hearthCheckDown = "Interface/AddOns/Hearthbag/Textures/CheckButton_Disabled.blp",
    hearthCheckOff = "Interface/AddOns/Hearthbag/Textures/CheckButton_Off.blp",

    hearthCollectedYes = "Interface/AddOns/Hearthbag/Textures/Collected_Yes.blp",
    hearthCollectedNo = "Interface/AddOns/Hearthbag/Textures/Collected_No.blp",

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
    hearthArrowParent = "Interface/AddOns/Hearthbag/Textures/ArrowButton_Parent.blp",


    hearthDarkPortalUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_darkportal.blp",
    hearthDarkPortalDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_darkportalDown.blp",
    hearthDarkPortalCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_darkportal.blp",
    hearthDarkPortalDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_darkportalDesat.blp",

    hearthKaraUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_karazhan.blp",
    hearthKaraDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_karazhanDown.blp",
    hearthKaraCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_karazhan.blp",
    hearthKaraDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_karazhanDesat.blp",


};

local hearthCleanup = CreateFrame("Frame")

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
    SCALING = false,
};

-- adibags
-- this is the bag frame, but don't replace it. It's too small (maybe). Scaling with the bag frame seems to be fine with its settings.

hearthCleanup.AdiBagsProfile = {
    ["parent"] = "AdiBagsSimpleLayeredRegion1",
    ["scale"] = 45,
    ["position"] = {
        -41, -- [1]
        -6, -- [2]
    },
};


-- arkinventory
-- has the same menu for both left / right, so either can be used. scaling and resizing settings seem fine.

hearthCleanup.ArkinventoryProfile = {
    ["parent"] = "ARKINV_Frame1TitleActionButton0",
    ["scale"] = 62,
    ["position"] = {
        0, -- [1]
        0, -- [2]
    },
};


-- inventorian
-- requires special work on right / left click functionality. couldn't find resizing settings
hearthCleanup.InventorianProfile = {
    ["parent"] = "InventorianBagFrameIconButton",
    ["scale"] = 67,
    ["position"] = {
        0, -- [1]
        2, -- [2]
    },
};



-- baggins
-- left / right click should be fine - base frame has right click functionality but not the icon. thinner columns setting may break it

hearthCleanup.BagginsProfile = {
    ["parent"] = "BagginsBag1Section2",
    ["scale"] = 42,
    ["position"] = {
        -32, -- [1]
        55, -- [2]
    },
};

-- combuctor
-- both left nad right click are consumed, do not use portrait (this one is neat and has a lot of utility). Settings seem fine.

hearthCleanup.CombuctorProfile = {
    ["parent"] = "CombuctorInventoryFrame1",
    ["scale"] = 45,
    ["position"] = {
        -211, -- [1]
        165, -- [2]
    },
};

-- bagnon
-- anchored to the money frame because scaling and reshaping the frame breaks the addon.

hearthCleanup.BagnonProfile = {
    ["parent"] = "ContainerFrame1Item2",
    ["scale"] = 45,
    ["position"] = {
        -48, -- [1]
        27, -- [2]
    },
};

-- baudbag
-- anchoring to the sfirst inventory slot itself because it scales best and is compatible with the background options.

hearthCleanup.BaudbagProfile = {
    ["parent"] = "BaudBagSubBag0Item1",
    ["scale"] = 42,
    ["position"] = {
        -12, -- [1]
        43, -- [2]
    },
};

-- sorted
-- very nice look / feel to it. Left click has settings functionality, will need to inherit it.
hearthCleanup.SortedProfile = {
    ["parent"] = "SortedFramePortraitButton",
    ["scale"] = 67,
    ["position"] = {
        -1, -- [1]
        0, -- [2]
    },
};

-- litebag
hearthCleanup.LitebagProfile = {
    ["parent"] = "LiteBagInventoryPanelButton1",
    ["scale"] = 72,
    ["position"] = {
        -48, --[1]
        22, --[2]
    },
};


-- elvUI
-- style doesn't fit very well, have to anchor to bag slot
hearthCleanup.ElvuiProfile = {
        ["parent"] = "ElvUI_ContainerFrameBag0Slot1",
        ["scale"] = 45,
        ["position"] = {
            -47, -- [1]
            46, -- [2]
        },
};

-- GW2 UI
-- style somewhat fits, anchoring to a bag button that may not exist on retail
hearthCleanup.GW2Profile = {
    ["parent"] = "MainMenuBarBackpackButton",
    ["scale"] = 42,
    ["position"] = {
        -1, -- [1]
        44, -- [2]
    },
};

-- default profile
hearthCleanup.defaultProfile = {
    ["parent"] = "ContainerFrame1PortraitButton",
    ["scale"] = 45,
    ["position"] = {
        -3, -- [1]
        2, -- [2]
    },
};

-- default combat frame profile
hearthCleanup.defaultCombatFrame = {
    ["relative"] = "CENTER",
    ["scale"] = 45,
    ["position"] = {
        0, -- [1]
        0, -- [2]
    },
};


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
combatFrame.combatTex = combatFrame:CreateTexture("CombatTexture", "BACKGROUND");
combatFrame.combatTex:SetAllPoints(combatFrame);
combatFrame.combatTex:SetTexture(TEXTURE_LIST.hearthCombatTex);
combatFrame.combatTex:SetAlpha(0.5);
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

hearthbag.coloredText = "|cff4fe6fcH|r|cff44e7ebe|r|cff4de7d6a|r|cff62e6bfr|r|cff7be4a6t|r|cff95e08eh|r|cffafdb78b|r|cffc9d466a|r|cffe2cb5ag|r"

function hearthCleanup.UpdatePosition()
    if UnitAffectingCombat("player") == false then
        hearthbag:SetPoint("CENTER", _G[HearthDB.BAG["parent"]], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);

    end
end

-- magical code stuff, basically will call upon the hearthstone item ID
hearthbag.item = Item:CreateFromItemID(HearthDB.ITEM)
hearthbag.item:ContinueOnItemLoad(function()  -- this is friend. ensures the item is loaded with a mixin so you don't get item = nil  
    if UnitAffectingCombat("player") == false then
        hearthbag:RegisterForClicks("LeftButtonUp", "RightButtonUp");
        hearthbag:SetAttribute("*type1", "item");   -- set to "any left click," targets an item
        hearthbag:SetAttribute("item", hearthbag.item:GetItemName()); -- the targetted item is now using the Item:CreateFromItemID() from before
        --hearthbag.UpdateCheckInherit_OnClick()
    else
        core:Print("Cannot set button functions in combat!");
    end
end);



function hearthbag.UpdateItem()
    local NewItem = select(1, GetItemInfo(HearthDB.ITEM)) 
    if UnitAffectingCombat("player") == false then
        hearthbag:RegisterForClicks("LeftButtonUp", "RightButtonUp");
        hearthbag:SetAttribute("*type1", "item");   -- set to "any left click," targets an item
        hearthbag:SetAttribute("item", NewItem); -- the targetted item is now using the Item:CreateFromItemID() from before
    end
end

-- button that enables the panel the options populate on to
hearthbag.scrollbackButton = CreateFrame("Button", "ScrollBackButton", hearthbag, nil);
hearthbag.scrollbackButton:SetSize(25, 25);
hearthbag.scrollbackButton:SetPoint("LEFT", -15, 0);
hearthbag.scrollbackButton:SetNormalTexture(TEXTURE_LIST.hearthEndUpButton);
hearthbag.scrollbackButton:SetPushedTexture(TEXTURE_LIST.hearthEndDownButton);
hearthbag.scrollbackButton:SetHighlightTexture(TEXTURE_LIST.hearthEndHighlight);


-- background frame for the options to parent to, but is also parented to the button and placed under it in strata
hearthbag.scrollbackFrame = CreateFrame("Frame", "ScrollBackFrame", hearthbag.scrollbackButton, nil);
hearthbag.scrollbackFrame:SetSize(230, 30);
hearthbag.scrollbackFrame:SetPoint("CENTER", -68, 0);
--hearthbag.scrollbackFrame:SetScale(2)

hearthbag.scrollbackTex = hearthbag.scrollbackFrame:CreateTexture("ScrollBackTex", "BACKGROUND");
hearthbag.scrollbackTex:SetPoint("CENTER");
hearthbag.scrollbackTex:SetTexture(TEXTURE_LIST.hearthTitleBar);
hearthbag.scrollbackTex:SetDrawLayer("Background", 0);
hearthbag.scrollbackTex:SetAllPoints(hearthbag.scrollbackFrame);
hearthbag.scrollbackFrame:Hide();

-- the "end" button that can close the menu, works essentially the same as the background enabler button
hearthbag.scrollbackendButton = CreateFrame("Button", "ScrollBackEndButton", hearthbag.scrollbackFrame, nil);
hearthbag.scrollbackendButton:SetSize(25, 25);
hearthbag.scrollbackendButton:SetPoint("LEFT", 43, 1);


hearthbag.scrollbackendButton:SetNormalTexture(TEXTURE_LIST.hearthEndUpButton);
hearthbag.scrollbackendButton:SetPushedTexture(TEXTURE_LIST.hearthEndDownButton);
hearthbag.scrollbackendButton:SetHighlightTexture(TEXTURE_LIST.hearthEndHighlight);

-- function that handles showing / hiding options panel
function hearthbag.SBBTEX_ONCLICK()
    if hearthbag.scrollbackFrame:IsVisible() == true then
        hearthbag.scrollbackFrame:Hide();
    else
        hearthbag.scrollbackFrame:Show();
    end
end

function hearthbag.smallbuttondown_ONMOUSEDOWN()
    PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\TinyButtonDown.ogg", "SFX");
end

function hearthbag.smallbuttonup_ONMOUSEUP()
    PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\TinyButtonUp.ogg", "SFX");
end

hearthbag.scrollbackButton:SetScript("OnClick", hearthbag.SBBTEX_ONCLICK);
hearthbag.scrollbackendButton:SetScript("OnClick", hearthbag.SBBTEX_ONCLICK);
hearthbag.scrollbackButton:SetScript("OnMouseDown", hearthbag.smallbuttondown_ONMOUSEDOWN);
hearthbag.scrollbackendButton:SetScript("OnMouseDown", hearthbag.smallbuttondown_ONMOUSEDOWN);
hearthbag.scrollbackButton:SetScript("OnMouseUp", hearthbag.smallbuttonup_ONMOUSEUP);
hearthbag.scrollbackendButton:SetScript("OnMouseUp", hearthbag.smallbuttonup_ONMOUSEUP);


-- true/false inherit options
hearthbag.checkboxbg0 = CreateFrame("Frame", "CheckBoxBG0", hearthbag.scrollbackFrame, nil);
hearthbag.checkboxbg0:SetSize(15, 15);
hearthbag.checkboxbg0:SetPoint("CENTER", -37, 3);

hearthbag.checkboxbg0Tex = hearthbag.checkboxbg0:CreateTexture("ScrollBackTex0", "BACKGROUND");
hearthbag.checkboxbg0Tex:SetTexture(TEXTURE_LIST.hearthCheckDown);
hearthbag.checkboxbg0Tex:SetDrawLayer("Background", 0);
hearthbag.checkboxbg0Tex:SetAllPoints(hearthbag.checkboxbg0);

-- button frame that handles the true/false of inheriting addon right click frame
hearthbag.inheritOptions = CreateFrame("CheckButton", "HearthAddons", hearthbag.checkboxbg0);
hearthbag.inheritOptions:SetAllPoints(hearthbag.checkboxbg0);
hearthbag.inheritOptions:SetPoint("CENTER", 0, 0);
hearthbag.inheritOptions:SetCheckedTexture(TEXTURE_LIST.hearthCheckUp);
hearthbag.inheritOptions:SetDisabledCheckedTexture(TEXTURE_LIST.hearthCheckOff);


-- handles what frame to "right click" per addon
function hearthbag.UpdateCheckInherit_OnClick()
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
                hearthbag:SetAttribute("item", hearthbag.item:GetItemName()); -- the targetted item is now using the Item:CreateFromItemID() from before
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
function hearthbag.CheckButton0Up_OnClick()
    if HearthDB.INHERIT == true then
        HearthDB.INHERIT = false
        hearthbag.inheritOptions:SetChecked(false)
        hearthbag.UpdateCheckInherit_OnClick(); 
    elseif HearthDB.INHERIT == false then
        HearthDB.INHERIT = true
        hearthbag.inheritOptions:SetChecked(true)
        hearthbag.UpdateCheckInherit_OnClick();
    end
    if HearthDB.INHERIT == nil then
        HearthDB.INHERIT = true
        hearthbag.UpdateCheckInherit_OnClick();
    end
    hearthbag.CheckButton0Tooltip_OnEnter();
end

-- grabs from savedvariables to make button "remember" what the user chose
function hearthbag.CheckButton0Status_OnShow()
    if HearthDB.INHERIT == true then
        hearthbag.inheritOptions:SetChecked(true);
    elseif HearthDB.INHERIT == false then
        hearthbag.inheritOptions:SetChecked(false);
    end
end

function hearthbag.CheckButton0Combat_OnEvent()
    if UnitAffectingCombat("player") == true then
        hearthbag.inheritOptions:SetEnabled(false);
    else
        hearthbag.inheritOptions:SetEnabled(true);
    end
end

hearthbag.inheritOptions.InheritValue = "True"
function hearthbag.CheckButton0Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);

    if HearthDB.INHERIT == true then
        hearthbag.inheritOptions.InheritValue = "True"
    else
        hearthbag.inheritOptions.InheritValue = "False"
    end
    GameTooltip:AddLine("Inherit the right click options of current bag addon frame: |cff4fe6fc" .. hearthbag.inheritOptions.InheritValue .. "|r", 1, 1, 1, 1);
    --GameTooltip:AddLine("Please be aware that sometimes going from combined bags to separate bags can taint the bag items. If this happens, do /reload.", 1, 1, 1, 1);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG0", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function hearthbag.CheckButton0Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.inheritOptions:RegisterEvent("PLAYER_REGEN_DISABLED");
hearthbag.inheritOptions:RegisterEvent("PLAYER_REGEN_ENABLED");
hearthbag.inheritOptions:SetScript("OnClick", hearthbag.CheckButton0Up_OnClick);
hearthbag.inheritOptions:SetScript("OnShow", hearthbag.CheckButton0Status_OnShow);
hearthbag.inheritOptions:SetScript("OnEvent", hearthbag.CheckButton0Combat_OnEvent);
hearthbag.inheritOptions:SetScript("OnEnter", hearthbag.CheckButton0Tooltip_OnEnter);
hearthbag.inheritOptions:SetScript("OnLeave", hearthbag.CheckButton0Tooltip_OnLeave);



-- true/false to show the combat frame out of combat
hearthbag.checkboxbg1 = CreateFrame("Frame", "CheckBoxBG1", hearthbag.checkboxbg0, nil);
hearthbag.checkboxbg1:SetSize(15, 15);
hearthbag.checkboxbg1:SetPoint("CENTER", 25, 0);

hearthbag.checkboxbg1Tex = hearthbag.checkboxbg1:CreateTexture("ScrollBackTex1", "BACKGROUND");
hearthbag.checkboxbg1Tex:SetTexture(TEXTURE_LIST.hearthCheckDown);
hearthbag.checkboxbg1Tex:SetDrawLayer("Background", 0);
hearthbag.checkboxbg1Tex:SetAllPoints(hearthbag.checkboxbg1);

hearthbag.combatOptions = CreateFrame("CheckButton", "HearthCombat", hearthbag.checkboxbg1);
hearthbag.combatOptions:SetAllPoints(hearthbag.checkboxbg1);
hearthbag.combatOptions:SetPoint("CENTER", 0, 0);
hearthbag.combatOptions:SetCheckedTexture(TEXTURE_LIST.hearthCheckUp);
hearthbag.combatOptions:SetDisabledCheckedTexture(TEXTURE_LIST.hearthCheckOff);


function hearthbag.UpdateCheckCombat_OnClick()
    if (HearthDB.COMBATFRAME_SHOW == true) then 
        combatFrame:Show();
    elseif (HearthDB.COMBATFRAME_SHOW == false) then
        combatFrame:Hide();
    end
end

-- true/false of inheriting addon right click functions
function hearthbag.CheckButton1Up_OnClick()
    if HearthDB.COMBATFRAME_SHOW == true then
        HearthDB.COMBATFRAME_SHOW = false
        hearthbag.combatOptions:SetChecked(false)
        hearthbag.UpdateCheckCombat_OnClick(); 
        if HearthDB.BAG["parent"] == "CombatFrame" then
            hearthbag:buttonResetter()
        end
    elseif HearthDB.COMBATFRAME_SHOW == false then
        HearthDB.COMBATFRAME_SHOW = true
        hearthbag.combatOptions:SetChecked(true)
        hearthbag.UpdateCheckCombat_OnClick();
    end
    if HearthDB.COMBATFRAME_SHOW == nil then
        HearthDB.COMBATFRAME_SHOW = true
        hearthbag.UpdateCheckCombat_OnClick();
    end
    hearthbag.CheckButton1Tooltip_OnEnter();
end

-- grabs from savedvariables to make button "remember" what the user chose
function hearthbag.CheckButton1Status_OnShow()
    if HearthDB.COMBATFRAME_SHOW == true then
        hearthbag.combatOptions:SetChecked(true);
    elseif HearthDB.COMBATFRAME_SHOW == false then
        hearthbag.combatOptions:SetChecked(false);
    end
end

hearthbag.combatOptions.OutOfCombatValue = "False"
function hearthbag.CheckButton1Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);

    if HearthDB.COMBATFRAME_SHOW == true then
        hearthbag.combatOptions.OutOfCombatValue = "True"
    else
        hearthbag.combatOptions.OutOfCombatValue = "False"
    end
    GameTooltip:AddLine("Show Combat Frame outside of Combat: |cff4fe6fc" .. hearthbag.combatOptions.OutOfCombatValue .. "|r", 1, 1, 1, 1);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG1", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function hearthbag.CheckButton1Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.combatOptions:SetScript("OnClick", hearthbag.CheckButton1Up_OnClick);
hearthbag.combatOptions:SetScript("OnShow", hearthbag.CheckButton1Status_OnShow);
hearthbag.combatOptions:SetScript("OnEnter", hearthbag.CheckButton1Tooltip_OnEnter);
hearthbag.combatOptions:SetScript("OnLeave", hearthbag.CheckButton1Tooltip_OnLeave);




-- true/false to show the combat frame out of combat
hearthbag.checkboxbg2 = CreateFrame("Frame", "CheckBoxBG2", hearthbag.checkboxbg1, nil);
hearthbag.checkboxbg2:SetSize(15, 15);
hearthbag.checkboxbg2:SetPoint("CENTER", 25, 0);

hearthbag.checkboxbg2Tex = hearthbag.checkboxbg2:CreateTexture("ScrollBackTex1", "BACKGROUND");
hearthbag.checkboxbg2Tex:SetTexture(TEXTURE_LIST.hearthCheckDown);
hearthbag.checkboxbg2Tex:SetDrawLayer("Background", 0);
hearthbag.checkboxbg2Tex:SetAllPoints(hearthbag.checkboxbg2);

hearthbag.inCombatOptions = CreateFrame("CheckButton", "HearthInCombat", hearthbag.checkboxbg2);
hearthbag.inCombatOptions:SetAllPoints(hearthbag.checkboxbg2);
hearthbag.inCombatOptions:SetPoint("CENTER", 0, 0);
hearthbag.inCombatOptions:SetCheckedTexture(TEXTURE_LIST.hearthCheckUp);
hearthbag.inCombatOptions:SetDisabledCheckedTexture(TEXTURE_LIST.hearthCheckOff);

-- true/false of inheriting addon right click functions
function hearthbag.CheckButton2Up_OnClick()
    if HearthDB.INCOMBATFRAME_SHOW == true then
        HearthDB.INCOMBATFRAME_SHOW = false
        hearthbag.inCombatOptions:SetChecked(false)
    elseif HearthDB.INCOMBATFRAME_SHOW == false then
        HearthDB.INCOMBATFRAME_SHOW = true
        hearthbag.inCombatOptions:SetChecked(true)
    end
    if HearthDB.INCOMBATFRAME_SHOW == nil then
        HearthDB.INCOMBATFRAME_SHOW = true
    end
    hearthbag.CheckButton2Tooltip_OnEnter();
end

-- grabs from savedvariables to make button "remember" what the user chose
function hearthbag.CheckButton2Status_OnShow()
    if HearthDB.INCOMBATFRAME_SHOW == true then
        hearthbag.inCombatOptions:SetChecked(true);
    elseif HearthDB.INCOMBATFRAME_SHOW == false then
        hearthbag.inCombatOptions:SetChecked(false);
    end
end

hearthbag.inCombatOptions.InCombatValue = "True"
function hearthbag.CheckButton2Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);

    if HearthDB.INCOMBATFRAME_SHOW == true then
        hearthbag.inCombatOptions.InCombatValue = "True"
    else
        hearthbag.inCombatOptions.InCombatValue = "False"
    end
    GameTooltip:AddLine("Show Combat Frame during Combat: |cff4fe6fc" .. hearthbag.inCombatOptions.InCombatValue .. "|r", 1, 1, 1, 1);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG2", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function hearthbag.CheckButton2Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.inCombatOptions:SetScript("OnClick", hearthbag.CheckButton2Up_OnClick);
hearthbag.inCombatOptions:SetScript("OnShow", hearthbag.CheckButton2Status_OnShow);
hearthbag.inCombatOptions:SetScript("OnEnter", hearthbag.CheckButton2Tooltip_OnEnter);
hearthbag.inCombatOptions:SetScript("OnLeave", hearthbag.CheckButton2Tooltip_OnLeave);



---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------




-- true/false to show lock scaling
hearthbag.checkboxbg3 = CreateFrame("Frame", "CheckBoxBG3", hearthbag.checkboxbg2, nil);
hearthbag.checkboxbg3:SetSize(15, 15);
hearthbag.checkboxbg3:SetPoint("CENTER", 25, 0);

hearthbag.checkboxbg3Tex = hearthbag.checkboxbg3:CreateTexture("ScrollBackTex1", "BACKGROUND");
hearthbag.checkboxbg3Tex:SetTexture(TEXTURE_LIST.hearthCheckDown);
hearthbag.checkboxbg3Tex:SetDrawLayer("Background", 0);
hearthbag.checkboxbg3Tex:SetAllPoints(hearthbag.checkboxbg3);

hearthbag.scalingOptions = CreateFrame("CheckButton", "HearthInCombat", hearthbag.checkboxbg3);
hearthbag.scalingOptions:SetAllPoints(hearthbag.checkboxbg3);
hearthbag.scalingOptions:SetPoint("CENTER", 0, 0);
hearthbag.scalingOptions:SetCheckedTexture(TEXTURE_LIST.hearthCheckUp);
hearthbag.scalingOptions:SetDisabledCheckedTexture(TEXTURE_LIST.hearthCheckOff);

-- true/false of scaling functions
function hearthbag.CheckButton3Up_OnClick()
    if HearthDB.SCALING == true then
        HearthDB.SCALING = false
        hearthbag.scalingOptions:SetChecked(false)
    elseif HearthDB.SCALING == false then
        HearthDB.SCALING = true
        hearthbag.scalingOptions:SetChecked(true)
    end
    if HearthDB.SCALING == nil then
        HearthDB.SCALING = false
    end
    hearthbag.CheckButton3Tooltip_OnEnter();
end

-- grabs from savedvariables to make button "remember" what the user chose
function hearthbag.CheckButton3Status_OnShow()
    if HearthDB.SCALING == true then
        hearthbag.scalingOptions:SetChecked(true);
    elseif HearthDB.SCALING == false then
        hearthbag.scalingOptions:SetChecked(false);
    end
end

hearthbag.scalingOptions.Value = "False"
function hearthbag.CheckButton3Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);

    if HearthDB.SCALING == true then
        hearthbag.scalingOptions.Value = "True"
    else
        hearthbag.scalingOptions.Value = "False"
    end
    GameTooltip:AddLine("Allow scaling the button frame: |cff4fe6fc" .. hearthbag.scalingOptions.Value .. "|r", 1, 1, 1, 1);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG3", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function hearthbag.CheckButton2Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.scalingOptions:SetScript("OnClick", hearthbag.CheckButton3Up_OnClick);
hearthbag.scalingOptions:SetScript("OnShow", hearthbag.CheckButton3Status_OnShow);
hearthbag.scalingOptions:SetScript("OnEnter", hearthbag.CheckButton3Tooltip_OnEnter);
hearthbag.scalingOptions:SetScript("OnLeave", hearthbag.CheckButton3Tooltip_OnLeave);


hearthbag.nudgeParent = CreateFrame("Frame", "NudgeParent", hearthbag.scrollbackFrame, nil);
hearthbag.nudgeParent:SetSize(30, 30);
hearthbag.nudgeParent:SetPoint("CENTER", 0, 50);
hearthbag.nudgeParentTex = hearthbag.nudgeParent:CreateTexture("NudgeParentTex", "BACKGROUND");
hearthbag.nudgeParentTex:SetTexture(TEXTURE_LIST.hearthArrowParent);
hearthbag.nudgeParentTex:SetDrawLayer("Background", 0);
hearthbag.nudgeParentTex:SetAllPoints(hearthbag.nudgeParent);

-- nudge right
hearthbag.microMovementR = CreateFrame("Button", "HearthArrowR", hearthbag.nudgeParent);
hearthbag.microMovementR:SetSize(25,25);
hearthbag.microMovementR:SetNormalTexture(TEXTURE_LIST.hearthArrowRN);
hearthbag.microMovementR:SetPushedTexture(TEXTURE_LIST.hearthArrowRP);
hearthbag.microMovementR:SetHighlightTexture(TEXTURE_LIST.hearthArrowRHL);
hearthbag.microMovementR:SetPoint("RIGHT", 15, 0);

function hearthbag.UpdatePositionRight_OnClick()
    if UnitAffectingCombat("player") == false then
        HearthDB.BAG["position"][1] = HearthDB.BAG["position"][1] + 1
        hearthbag:SetPoint("CENTER", _G[HearthDB.BAG["parent"]], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    else
        core:Print("Cannot set position in combat!");
    end
end

hearthbag.microMovementR:SetScript("OnClick", hearthbag.UpdatePositionRight_OnClick);

-- nudge left
hearthbag.microMovementL = CreateFrame("Button", "HearthArrowL", hearthbag.nudgeParent);
hearthbag.microMovementL:SetSize(25,25);
hearthbag.microMovementL:SetNormalTexture(TEXTURE_LIST.hearthArrowLN);
hearthbag.microMovementL:SetPushedTexture(TEXTURE_LIST.hearthArrowLP);
hearthbag.microMovementL:SetHighlightTexture(TEXTURE_LIST.hearthArrowLHL);
hearthbag.microMovementL:SetPoint("LEFT", -15, 0);

function hearthbag.UpdatePositionLeft_OnClick()
    if UnitAffectingCombat("player") == false then
        HearthDB.BAG["position"][1] = HearthDB.BAG["position"][1] - 1
        hearthbag:SetPoint("CENTER", _G[HearthDB.BAG["parent"]], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    else
        core:Print("Cannot set position in combat!");
    end
end

hearthbag.microMovementL:SetScript("OnClick", hearthbag.UpdatePositionLeft_OnClick);

-- nudge down
hearthbag.microMovementD = CreateFrame("Button", "HearthArrowD", hearthbag.nudgeParent);
hearthbag.microMovementD:SetSize(25,25);
hearthbag.microMovementD:SetNormalTexture(TEXTURE_LIST.hearthArrowDN);
hearthbag.microMovementD:SetPushedTexture(TEXTURE_LIST.hearthArrowDP);
hearthbag.microMovementD:SetHighlightTexture(TEXTURE_LIST.hearthArrowDHL);
hearthbag.microMovementD:SetPoint("BOTTOM", 0, -15);

function hearthbag.UpdatePositionDown_OnClick()
    if UnitAffectingCombat("player") == false then
        HearthDB.BAG["position"][2] = HearthDB.BAG["position"][2] - 1
        hearthbag:SetPoint("CENTER", _G[HearthDB.BAG["parent"]], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    else
        core:Print("Cannot set position in combat!");
    end
end

hearthbag.microMovementD:SetScript("OnClick", hearthbag.UpdatePositionDown_OnClick);

-- nudge up
hearthbag.microMovementU = CreateFrame("Button", "HearthArrowU", hearthbag.nudgeParent);
hearthbag.microMovementU:SetSize(25,25);
hearthbag.microMovementU:SetNormalTexture(TEXTURE_LIST.hearthArrowUN);
hearthbag.microMovementU:SetPushedTexture(TEXTURE_LIST.hearthArrowUP);
hearthbag.microMovementU:SetHighlightTexture(TEXTURE_LIST.hearthArrowUHL);
hearthbag.microMovementU:SetPoint("TOP", 0, 15);

function hearthbag.UpdatePositionUp_OnClick()
    if UnitAffectingCombat("player") == false then
        HearthDB.BAG["position"][2] = HearthDB.BAG["position"][2] + 1
        hearthbag:SetPoint("CENTER", _G[HearthDB.BAG["parent"]], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    else
        core:Print("Cannot set position in combat!");
    end
end

hearthbag.microMovementU:SetScript("OnClick", hearthbag.UpdatePositionUp_OnClick);

function hearthbag.FrameLevelOrganiser()

    hearthbag:SetFrameLevel(600)
    if hearthbag:GetFrameLevel() >= 9000 then
        hearthbag:SetFrameLevel(hearthbag:GetFrameLevel() - 1000)
    end
    if hearthbag:GetFrameLevel() <= hearthbag:GetParent():GetFrameLevel() then
        hearthbag:SetFrameLevel(hearthbag:GetParent():GetFrameLevel() + 1)
    end
    if hearthbag:GetFrameLevel() >= 9000 then
        hearthbag:SetFrameLevel(hearthbag:GetFrameLevel() - 1000)
    end
    
    hearthbag.scrollbackButton:SetFrameLevel(550)
    if hearthbag.scrollbackButton:GetFrameLevel() >= hearthbag:GetFrameLevel() then
        hearthbag.scrollbackButton:SetFrameLevel(hearthbag:GetFrameLevel() - 1)
    end

    hearthbag.scrollbackFrame:SetFrameLevel(560)
    if hearthbag.scrollbackFrame:GetFrameLevel() <= hearthbag.scrollbackButton:GetFrameLevel() then
        hearthbag.scrollbackFrame:SetFrameLevel(hearthbag.scrollbackButton:GetFrameLevel() - 1)
    end

    hearthbag.scrollbackendButton:SetFrameLevel(550)
    if hearthbag.scrollbackendButton:GetFrameLevel() >= hearthbag.scrollbackFrame:GetFrameLevel() then
        hearthbag.scrollbackendButton:SetFrameLevel(hearthbag.scrollbackFrame:GetFrameLevel() - 1)
    end

    hearthbag.checkboxbg0:SetFrameLevel(570)
    if hearthbag.checkboxbg0:GetFrameLevel() <= hearthbag.scrollbackFrame:GetFrameLevel() then
        hearthbag.checkboxbg0:SetFrameLevel(hearthbag.scrollbackFrame:GetFrameLevel() +1 )
    end
    hearthbag.checkboxbg1:SetFrameLevel(570)
    if hearthbag.checkboxbg1:GetFrameLevel() <= hearthbag.scrollbackFrame:GetFrameLevel() then
        hearthbag.checkboxbg1:SetFrameLevel(hearthbag.scrollbackFrame:GetFrameLevel() +1 )
    end
    hearthbag.checkboxbg2:SetFrameLevel(570)
    if hearthbag.checkboxbg2:GetFrameLevel() <= hearthbag.scrollbackFrame:GetFrameLevel() then
        hearthbag.checkboxbg2:SetFrameLevel(hearthbag.scrollbackFrame:GetFrameLevel() +1 )
    end
    hearthbag.checkboxbg3:SetFrameLevel(570)
    if hearthbag.checkboxbg3:GetFrameLevel() <= hearthbag.scrollbackFrame:GetFrameLevel() then
        hearthbag.checkboxbg3:SetFrameLevel(hearthbag.scrollbackFrame:GetFrameLevel() +1 )
    end
end

function hearthbag.RandomSoundButton_Down()
    PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\ButtonDown" .. math.random(1, 4) ..  ".ogg", "SFX");
end

function hearthbag.RandomSoundButton_Up()
    PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\Button" .. math.random(1, 4) ..  ".ogg", "SFX");
end


-- controls the behaviour of Hearthbag
function hearthbag.hearthBag_OnMouseDown(self, button)  -- controls the mouse down behaviour, including the "down" texture
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
function hearthbag.hearthBag_OnMouseUp()
    local duration = GetSpellCooldown(HearthDB.SPELLID);
    local CastingHearth = select(8,CastingInfo("player"));
    if (GetItemCount(HearthDB.ITEM) > 0) then
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
        if ((duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
            hearthbag.RandomSoundButton_Up();
        end
    else
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
    end
end
-- this also sets the texture upon login
function hearthbag.hearthDestroyed()
    if GetItemCount(HearthDB.ITEM) > 0 then
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
    else
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
    end
end

function hearthbag.hearthMouseOver_ONENTER()
    GameTooltip:SetOwner(hearthbag, "ANCHOR_LEFT");
    if IsAddOnLoaded("Arkinventory") == true and HearthDB.INHERIT == true then
        GameTooltip:AddLine(ArkInventory.Localise["MENU"], 1, 1, 1, true);

    elseif IsAddOnLoaded("Inventorian") == true and HearthDB.INHERIT == true then
        local ItemCache = LibStub("LibItemCache-1.1")
        GameTooltip:SetOwner(hearthbag, "ANCHOR_RIGHT");
        GameTooltip:AddLine((GetUnitName("player", false)), 1, 1, 1, true);
        if ItemCache:HasCache() then
            GameTooltip:AddLine("<Right-Click> to switch characters", 1, 1, 1, true);
        else
            GameTooltip:AddLine("Install BagBrother to get access to the inventory of other characters.", 1, 1, 1, true);
        end
        GameTooltip:Show();

    elseif IsAddOnLoaded("Sorted") == true and HearthDB.BAG["parent"] == "SortedFramePortraitButton" then
        SortedTooltip.CreateLocalized(hearthbag, "ANCHOR_TOP", "TOOLTIP_CONFIG")

    elseif HearthDB.INHERIT == true then
        GameTooltip:AddLine(BACKPACK_TOOLTIP, 1, 1, 1, true);
        if (GetBindingKey("TOGGLEBACKPACK")) then
            GameTooltip:AppendText(" "..NORMAL_FONT_COLOR_CODE.."("..GetBindingKey("TOGGLEBACKPACK")..")"..FONT_COLOR_CODE_CLOSE)
        end
        --GameTooltip:AddLine(string.gsub(CLICK_BAG_SETTINGS, "Click", "Right-Click"), 1, 1, 1, true);
    end

    local start, duration, enabled, modRate = GetSpellCooldown(HearthDB.SPELLID);
    local desc = GetSpellDescription(HearthDB.SPELLID)
    if duration ~= 0 then
        GameTooltip:AddLine("Cooldown Remaining: " .. SecondsToClock(start+duration-GetTime()), false);
    end
    GameTooltip:AddLine(hearthbag.coloredText .. ": " .. desc, 1, 1, 1, true)
    GameTooltip:Show();

    if MouseIsOver(hearthbag) then
        C_Timer.After(1, hearthbag.hearthMouseOver_ONENTER)
    else
        GameTooltip:Hide()
    end
end

function hearthbag.hearthMouseOver_ONLEAVE()
    GameTooltip:Hide();
end

hearthbag:SetScript("OnMouseDown", hearthbag.hearthBag_OnMouseDown);
hearthbag:SetScript("OnMouseUp", hearthbag.hearthBag_OnMouseUp);
hearthbag:SetScript("OnEnter", hearthbag.hearthMouseOver_ONENTER);
hearthbag:SetScript("OnLeave", hearthbag.hearthMouseOver_ONLEAVE);

hearthbag:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        combatFrame:Show();
        hearthbag:ClearAllPoints();
        hearthbag:SetParent(combatFrame);
        hearthbag:SetPoint("TOPLEFT", combatFrame, "TOPLEFT", 5, -10);
        hearthbag:SetPoint("BOTTOMRIGHT", combatFrame, "BOTTOMRIGHT", -5, 0);
        hearthbag:SetMovable(true);
        hearthbag.scrollbackButton:Hide();
        if HearthDB.INCOMBATFRAME_SHOW == true then
            combatFrame:Show();
        else
            combatFrame:Hide();
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
        hearthbag:ClearAllPoints();
        hearthbag:SetPoint("CENTER", _G[HearthDB.BAG["parent"]], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
        hearthbag:SetParent(_G[HearthDB.BAG["parent"]]);
        hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
        if HearthDB.COMBATFRAME_SHOW == true then
            combatFrame:Show();
        else
            combatFrame:Hide();
        end
        hearthbag.scrollbackButton:Show();
        hearthbag.FrameLevelOrganiser();
    end
end);

--hearthbag:RegisterEvent("PLAYER_LOGIN");
hearthbag:RegisterEvent("PLAYER_ENTERING_WORLD");
hearthbag:RegisterEvent("ADDON_LOADED");
hearthbag:RegisterEvent("PLAYER_REGEN_DISABLED");
hearthbag:RegisterEvent("PLAYER_REGEN_ENABLED");

-- the cooldown texture itself (the rune)
hearthbag.hearthCD = CreateFrame("Cooldown", "HearthCD", Hearthbag, "CooldownFrameTemplate");
hearthbag.hearthCD:SetUseCircularEdge(true); -- makes the cooldown edge circular
hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN); -- set the cooldown texture to be the rune
hearthbag.hearthCD:SetSwipeColor(0.2,0.2,0.2,1.0); -- set the RGB of the rune to ~20% "brightness" (makes it dark)
hearthbag.hearthCD:SetDrawEdge(true); -- shows the blip on the CD
hearthbag.hearthCD:SetEdgeTexture(HearthDB.APPEARANCE.BLIP,1.0,1.0,1.0,1.0); -- makes the blip as bright as possible
hearthbag.hearthCD:SetRotation(-2.22); -- rotates the whole cooldown rune so that the tail end of the rune will fill out last. ~ -127 degrees

 -- checks the cooldown on the hearthstone spell portion of the item
function hearthbag.hearthCheck()
    local start, duration = GetSpellCooldown(HearthDB.SPELLID);
    if duration ~= 0 then
        hearthbag.hearthCD:SetCooldown(start, duration);
    end
end

hearthbag.hearthCD:SetScript("OnEvent", hearthbag.hearthCheck);
hearthbag.hearthCD:HookScript("OnEvent", hearthbag.hearthDestroyed);

hearthbag.hearthCD:RegisterEvent("SPELL_UPDATE_COOLDOWN"); -- hearthstone effect is technically a spell
hearthbag.hearthCD:RegisterEvent("PLAYER_ENTERING_WORLD"); -- to ensure the cooldown is calculated upon login
hearthbag.hearthCD:RegisterEvent("BAG_UPDATE_COOLDOWN"); -- just in case spell doesn't do the thing
hearthbag.hearthCD:RegisterEvent("BAG_UPDATE"); -- this fires a lot


-- updates the scale of the hearthbag frame
function hearthbag:UpdateSize()
    if not InCombatLockdown() then
        HearthDB.BAG["scale"] = self.size*self.sizeAmp
        self:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
    end
end

-- scales the size when doing mousewheel
hearthbag:SetScript("OnMouseWheel", function(self, delta)
    if HearthDB.SCALING == true then
        self.sizeAmp = self.sizeAmp + delta * 0.15625;
        if self.sizeAmp > self.maxAmp then
            self.sizeAmp = self.maxAmp;
        elseif self.sizeAmp < self.minAmp then
            self.sizeAmp = self.minAmp;
        end
        self:UpdateSize();
    end
end);

-- background frame for the options to parent to, but is also parented to the button and placed under it in strata
hearthbag.itemHolderFrame = CreateFrame("Frame", "ItemHolderFrame", hearthbag.scrollbackFrame, nil);
hearthbag.itemHolderFrame:SetSize(170, 85);
hearthbag.itemHolderFrame:SetPoint("CENTER", 0, -32);

hearthbag.itemHolderFrameTex = hearthbag.itemHolderFrame:CreateTexture("ItemHolderFrameTex", "BACKGROUND");
hearthbag.itemHolderFrameTex:SetPoint("CENTER");
hearthbag.itemHolderFrameTex:SetTexture(TEXTURE_LIST.hearthItemHolderTBC);
hearthbag.itemHolderFrameTex:SetDrawLayer("Background", 0);
hearthbag.itemHolderFrameTex:SetAllPoints(hearthbag.itemHolderFrame);
--hearthbag.itemHolderFrameTex:Hide();


-- default hearthstone
hearthbag.option0 = CreateFrame("Button", "HearthbagOption0", hearthbag.itemHolderFrame, nil);
hearthbag.option0:SetSize(25, 25);
hearthbag.option0:SetPoint("LEFT", 47.5, 2);
hearthbag.option0:SetNormalTexture(TEXTURE_LIST.hearthDefaultTex);
hearthbag.option0:SetPushedTexture(TEXTURE_LIST.hearthDownTex);

function hearthbag.option0:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthDefaultTex
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthDownTex
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthCooldownTex
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthDesatTex
    HearthDB.ITEM = ITEM_LIST.defaultHearthstone
    HearthDB.SPELLID = ITEM_LIST.defaultHearthstoneSpellID
    if (GetItemCount(HearthDB.ITEM) > 0) then   -- if the item exists but doesn't fullfil above criteria
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
    else                                    -- if the item does not exist or turns up nil
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
    end
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.option0:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.defaultHearthstone)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption0", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function hearthbag.option0:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.option0:SetScript("OnClick", hearthbag.option0.SetHearthTexture_ONCLICK);
hearthbag.option0:SetScript("OnEnter", hearthbag.option0.Tooltip_OnEnter);
hearthbag.option0:SetScript("OnLeave", hearthbag.option0.Tooltip_OnLeave);

hearthbag.option0.collected = CreateFrame("Frame", nil, hearthbag.option0, nil);
hearthbag.option0.collected:SetSize(10, 10);
hearthbag.option0.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.option0.collected.tex = hearthbag.option0.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.option0.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
hearthbag.option0.collected.tex:SetAllPoints(hearthbag.option0.collected);

function hearthbag.option0.collected:CollectionCheck()
    if GetItemCount(ITEM_LIST.defaultHearthstone) >= 1 then
        hearthbag.option0.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.option0.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.option0:RegisterEvent("TOYS_UPDATED");
hearthbag.option0:RegisterEvent("BAG_UPDATE");
hearthbag.option0:SetScript("OnEvent", hearthbag.option0.collected.CollectionCheck);




-- Dark Portal TCG
hearthbag.darkportal = CreateFrame("Button", "HearthbagDarkPortal", hearthbag.option0, nil);
hearthbag.darkportal:SetSize(25, 25);
hearthbag.darkportal:SetPoint("LEFT", 27, 0);
hearthbag.darkportal:SetNormalTexture(TEXTURE_LIST.hearthDarkPortalUp);
hearthbag.darkportal:SetPushedTexture(TEXTURE_LIST.hearthDarkPortalDown);
--hearthbag.darkportal:SetHighlightTexture(GetItemIcon(darkPortal));


function hearthbag.darkportal:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthDarkPortalUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthDarkPortalDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthDarkPortalCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthDarkPortalDesat
    HearthDB.ITEM = ITEM_LIST.darkPortal
    HearthDB.SPELLID = ITEM_LIST.darkPortalSpellID
    if (GetItemCount(HearthDB.ITEM) > 0) then   -- if the item exists but doesn't fullfil above criteria
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
    else                                    -- if the item does not exist or turns up nil
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
    end
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end


function hearthbag.darkportal:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.darkPortal)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagDarkPortal", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function hearthbag.darkportal:Tooltip_OnLeave()
    GameTooltip:Hide();
end


hearthbag.darkportal:SetScript("OnClick", hearthbag.darkportal.SetHearthTexture_ONCLICK);
hearthbag.darkportal:SetScript("OnEnter", hearthbag.darkportal.Tooltip_OnEnter);
hearthbag.darkportal:SetScript("OnLeave", hearthbag.darkportal.Tooltip_OnLeave);

hearthbag.darkportal.collected = CreateFrame("Frame", nil, hearthbag.darkportal, nil);
hearthbag.darkportal.collected:SetSize(10, 10);
hearthbag.darkportal.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.darkportal.collected.tex = hearthbag.darkportal.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.darkportal.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
hearthbag.darkportal.collected.tex:SetAllPoints(hearthbag.darkportal.collected);

function hearthbag.darkportal.collected:CollectionCheck()
    if GetItemCount(ITEM_LIST.darkPortal) >= 1 then
        hearthbag.darkportal.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.darkportal.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.darkportal:RegisterEvent("TOYS_UPDATED");
hearthbag.darkportal:RegisterEvent("BAG_UPDATE");
hearthbag.darkportal:SetScript("OnEvent", hearthbag.darkportal.collected.CollectionCheck);


-- Karazhan
hearthbag.rubySlippers = CreateFrame("Button", "HearthbagRubySlippers", hearthbag.darkportal, nil);
hearthbag.rubySlippers:SetSize(25, 25);
hearthbag.rubySlippers:SetPoint("LEFT", 27, 0);
hearthbag.rubySlippers:SetNormalTexture(TEXTURE_LIST.hearthKaraUp);
hearthbag.rubySlippers:SetPushedTexture(TEXTURE_LIST.hearthKaraDown);
--hearthbag.darkportal:SetHighlightTexture(GetItemIcon(darkPortal));

function hearthbag.rubySlippers:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthKaraUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthKaraDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthKaraCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthKaraDesat
    HearthDB.ITEM = ITEM_LIST.rubySlippers
    HearthDB.SPELLID = ITEM_LIST.rubySlippersSpellID
    if (GetItemCount(HearthDB.ITEM) > 0) then   -- if the item exists but doesn't fullfil above criteria
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
    else                                    -- if the item does not exist or turns up nil
        hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
    end
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.rubySlippers:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.rubySlippers)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagRubySlippers", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function hearthbag.rubySlippers:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.rubySlippers:SetScript("OnClick", hearthbag.rubySlippers.SetHearthTexture_ONCLICK);
hearthbag.rubySlippers:SetScript("OnEnter", hearthbag.rubySlippers.Tooltip_OnEnter);
hearthbag.rubySlippers:SetScript("OnLeave", hearthbag.rubySlippers.Tooltip_OnLeave);

hearthbag.rubySlippers.collected = CreateFrame("Frame", nil, hearthbag.rubySlippers, nil);
hearthbag.rubySlippers.collected:SetSize(10, 10);
hearthbag.rubySlippers.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.rubySlippers.collected.tex = hearthbag.rubySlippers.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.rubySlippers.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
hearthbag.rubySlippers.collected.tex:SetAllPoints(hearthbag.rubySlippers.collected);

function hearthbag.rubySlippers.collected:CollectionCheck()
    if GetItemCount(ITEM_LIST.rubySlippers) >= 1 then
        hearthbag.rubySlippers.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.rubySlippers.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.rubySlippers:RegisterEvent("TOYS_UPDATED");
hearthbag.rubySlippers:RegisterEvent("BAG_UPDATE");
hearthbag.rubySlippers:SetScript("OnEvent", hearthbag.rubySlippers.collected.CollectionCheck);

function buttonContainer:FrameLevelChildren()
    -- default
    if hearthbag.option0.collected:GetParent():GetFrameLevel() >= hearthbag.option0.collected:GetFrameLevel() then
        hearthbag.option0.collected:SetFrameLevel(hearthbag.option0.collected:GetFrameLevel() + 1)
    end

    --ruby slippers 
    if hearthbag.rubySlippers.collected:GetParent():GetFrameLevel() >= hearthbag.rubySlippers.collected:GetFrameLevel() then
        hearthbag.rubySlippers.collected:SetFrameLevel(hearthbag.rubySlippers.collected:GetFrameLevel() + 1)
    end

    --darkPortal
    if hearthbag.darkportal.collected:GetParent():GetFrameLevel() >= hearthbag.darkportal.collected:GetFrameLevel() then
        hearthbag.darkportal.collected:SetFrameLevel(hearthbag.darkportal.collected:GetFrameLevel() + 1)
    end
end


function buttonContainer:SetNewParent(newParent, offsetX, offsetY)
    HearthDB.BAG["parent"] = newParent:GetName()
    HearthDB.BAG["position"][1] = offsetX
    HearthDB.BAG["position"][2] = offsetY
    self:SetParent(HearthDB.BAG["parent"]);
    hearthbag:SetParent(HearthDB.BAG["parent"]);
    hearthCleanup.UpdatePosition()
    hearthbag:SetFrameStrata("FULLSCREEN_DIALOG");
    hearthbag.FrameLevelOrganiser();
end


hearthbag.frameSelector = CreateFrame("Frame", "FrameSelector", UIParent);    --frame selector
hearthbag.frameSelector:SetFrameStrata("FULLSCREEN_DIALOG");
hearthbag.frameSelector:SetIgnoreParentScale(true);

hearthbag.frameSelector.placerTexture = hearthbag.frameSelector:CreateTexture(nil, "OVERLAY", nil, 1);
hearthbag.frameSelector.placerTexture:SetTexture(TEXTURE_LIST.hearthDesatTex);
hearthbag.frameSelector.placerTexture:SetSize(32, 32);
hearthbag.frameSelector.placerTexture:SetAlpha(0.6);
hearthbag.frameSelector.placerTexture:SetPoint("CENTER", 0, 0);

hearthbag.frameSelector.focusTexture = hearthbag.frameSelector:CreateTexture(nil, "OVERLAY");
hearthbag.frameSelector.focusTexture:SetSize(32, 32);
hearthbag.frameSelector.focusTexture:SetColorTexture(1, 0.82, 0, 0.5);

hearthbag.frameSelector:Hide();
hearthbag.frameSelector.cycle = 0.1;

hearthbag.frameSelector:SetScript("OnUpdate", function(self, elapsed)
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

function hearthbag.frameSelector:UpdatePlacer()
    self.cursorX, self.cursorY = GetCursorPosition();
    self.placerTexture:SetPoint("CENTER", UIParent, "BOTTOMLEFT", self.cursorX, self.cursorY);
end

function hearthbag.frameSelector:UpdateAnchorPosition()
    local focus = GetMouseFocus();
    if focus then
        local frameName = focus:GetName();
        if not frameName or INVALID_FRAME[frameName] then
            focus = UIParent;
            frameName = "UIParent";
            hearthbag.frameSelector.focusTexture:Hide();
        else
            hearthbag.frameSelector.focusTexture:ClearAllPoints();
            hearthbag.frameSelector.focusTexture:SetPoint("TOPLEFT", focus, "TOPLEFT", 0, 0);
            hearthbag.frameSelector.focusTexture:SetPoint("BOTTOMRIGHT", focus, "BOTTOMRIGHT", 0, 0);
            hearthbag.frameSelector.focusTexture:Show();
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
    hearthbag.frameSelector.focusTexture:Hide();
end

function hearthbag.frameSelector:Start()
    self.isActive = true;
    self:Hide();
    hearthbag.frameSelector.t = 0;
    self.uiScale = UIParent:GetEffectiveScale();
    self:Show();
    --print("Start");
end

--[[function hearthbag.frameSelector:Cancel()
    self.isActive = nil;
    self:Hide();
    --print("Stop Repositioning");
end]]

function hearthbag.frameSelector:Stop()
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

function hearthbag.frameSelector:Toggle()
    if self.isActive then
        self:Stop();
    else
        self:Start();
    end
end

--[[hearthbag.frameSelector:SetScript("OnKeyDown", function(self, arg1)
    if arg1 == "ESCAPE" then
        hearthbag.frameSelector:Cancel();
    else
        hearthbag.frameSelector:Stop();
    end
end)]]

function hearthbag:buttonResetter()
    hearthbag:ClearAllPoints();
    if ( IsAddOnLoaded("ElvUI") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.ElvuiProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.ElvuiProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.ElvuiProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.ElvuiProfile["position"][2]
    elseif ( IsAddOnLoaded("GW2_UI") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.GW2Profile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.GW2Profile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.GW2Profile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.GW2Profile["position"][2]
    elseif ( IsAddOnLoaded("AdiBags") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.AdiBagsProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.AdiBagsProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.AdiBagsProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.AdiBagsProfile["position"][2]
    elseif ( IsAddOnLoaded("Arkinventory") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.ArkinventoryProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.ArkinventoryProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.ArkinventoryProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.ArkinventoryProfile["position"][2]
    elseif ( IsAddOnLoaded("Inventorian") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.InventorianProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.InventorianProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.InventorianProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.InventorianProfile["position"][2]
    elseif ( IsAddOnLoaded("Baggins") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.BagginsProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.BagginsProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.BagginsProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.BagginsProfile["position"][2]
    elseif ( IsAddOnLoaded("Combuctor") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.CombuctorProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.CombuctorProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.CombuctorProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.CombuctorProfile["position"][2]
    elseif ( IsAddOnLoaded("Bagnon") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.BagnonProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.BagnonProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.BagnonProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.BagnonProfile["position"][2]
    elseif ( IsAddOnLoaded("BaudBag") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.BaudbagProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.BaudbagProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.BaudbagProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.BaudbagProfile["position"][2]
    elseif ( IsAddOnLoaded("Sorted") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.SortedProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.SortedProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.SortedProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.SortedProfile["position"][2]
    elseif ( IsAddOnLoaded("Litebag") == true ) then
        HearthDB.BAG["parent"] = hearthCleanup.LitebagProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.LitebagProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.LitebagProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.LitebagProfile["position"][2]
    else
        HearthDB.BAG["parent"] = hearthCleanup.defaultProfile["parent"]
        HearthDB.BAG["scale"] = hearthCleanup.defaultProfile["scale"]
        HearthDB.BAG["position"][1] = hearthCleanup.defaultProfile["position"][1]
        HearthDB.BAG["position"][2] = hearthCleanup.defaultProfile["position"][2]
    end
    hearthCleanup.UpdatePosition()
    hearthbag:SetParent(HearthDB.BAG["parent"]);
    hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
    hearthbag.UpdateCheckInherit_OnClick();
    hearthbag.FrameLevelOrganiser();

    HearthDB.COMBAT["relative"] = hearthCleanup.defaultCombatFrame["relative"]
    HearthDB.COMBAT["position"][1] = hearthCleanup.defaultCombatFrame["position"][1]
    HearthDB.COMBAT["position"][2] = hearthCleanup.defaultCombatFrame["position"][2]
    combatFrame:SetPoint(HearthDB.COMBAT["relative"], HearthDB.COMBAT["position"][1], HearthDB.COMBAT["position"][2]);
end

hearthbag.frames = {}
-- snapshots all frames at the current time of executing this function
function hearthbag.CollectFrames()
    local f
    while true do
        f = EnumerateFrames(f);
        if not f then break end
        if f.GetName and f:GetName() and f.IsVisible and f:IsVisible() and f.GetCenter and f:GetCenter() then
            tinsert(hearthbag.frames, f);
        end
    end 
end

hearthbag.previewFrame = CreateFrame("Frame", "PreviewFrame", UIParent, nil);
hearthbag.previewFrame:SetSize(25, 25);
hearthbag.previewFrame:SetPoint("CENTER", 0, 0);
hearthbag.previewFrame:SetScale(1);
hearthbag.previewFrame:SetFrameStrata("FULLSCREEN_DIALOG");
hearthbag.previewFrameTex = hearthbag.previewFrame:CreateTexture("PreviewFrameTex", "BACKGROUND");
hearthbag.previewFrameTex:SetTexture(TEXTURE_LIST.hearthDesatTex);
hearthbag.previewFrameTex:SetAllPoints(hearthbag.previewFrame);
hearthbag.previewFrame:Hide();

--the "yellow frame" placer similar to fstack
function hearthbag.previewFrame:CreateButtonPlacer()
    local frame = CreateFrame("Frame", nil, UIParent)
    hearthbag.previewFrame.buttonPlacer = frame
    frame:EnableMouse(true);
    frame:EnableMouseWheel(true);
    frame:EnableKeyboard(true);
    frame:SetFrameStrata("FULLSCREEN_DIALOG");
    frame:SetAllPoints();
    frame:Hide();
    local targetMarker = frame:CreateTexture();
    targetMarker:SetColorTexture(1, 1, 0, .5);

    --local buttonPreview = CleanupButton(frame)
    hearthbag.previewFrame:EnableMouse(false);
    hearthbag.previewFrame:SetAlpha(.5);

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
        hearthbag.CollectFrames();
        target(self);
        hearthbag.previewFrame:Show();
        hearthbag.previewFrame:SetScale(1);
    end)

    --press escape to cancel
    frame:SetScript("OnKeyDown", function(self, arg1)
        if arg1 == "ESCAPE" then
            self:Hide(); 
            hearthbag.previewFrame:Hide();
        end
    end)

    --mousewheel will cycle through frame selected
    frame:SetScript("OnMouseWheel", function(self, arg1)
        --[[if IsControlKeyDown() then
            self.scale = max(0, self.scale + arg1 * .05);
            hearthbag.previewFrame:SetScale(self.target:GetEffectiveScale() * self.scale);
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
        hearthbag.previewFrame:Hide();
        local x, y = GetCursorPosition();
        local targetScale, targetX, targetY = self.target:GetEffectiveScale(), self.target:GetCenter();

        -- grabs the values stored and sets them as the SavedVars
        HearthDB.BAG = {parent=self.target:GetName(), position={(x/targetScale-targetX)/self.scale, (y/targetScale-targetY)/self.scale}, scale=HearthDB.BAG["scale"]}
        
        
        hearthCleanup.UpdatePosition()
        hearthbag:SetParent(HearthDB.BAG["parent"]);
        hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
        hearthbag.UpdateCheckInherit_OnClick();
        combatFrame:SetPoint(HearthDB.COMBAT["relative"], UIParent, "CENTER", HearthDB.COMBAT["position"][1], HearthDB.COMBAT["position"][2]);
        hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
        hearthbag.FrameLevelOrganiser();
    end)

    -- handles the position of the preview on the cursor using OnUpdate, currently unused for simplicity
    frame:SetScript("OnUpdate", function()
        local scale, x, y = hearthbag.previewFrame:GetEffectiveScale(), GetCursorPosition()
        hearthbag.previewFrame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x/scale, y/scale);
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
            hearthbag.frameSelector:Toggle();
            core:Print("Type '/hearthbag placer' again to place the frame.")
        else
            core:Print("You can't do that in combat!");
        end
    end,

    ["cycler"] = function()
        if UnitAffectingCombat("player") == false then
            hearthbag.previewFrame.CreateButtonPlacer();
            hearthbag.previewFrame.buttonPlacer:Show();
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
    local prefix = string.format("|T" .. TEXTURE_LIST.hearthDefaultTex .. ":14|t" .. "|TTEXTURE_LIST.hearthDefaultTex|t" .. hearthbag.coloredText .. ":");    
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
        hearthCleanup.UpdatePosition()
        hearthbag:SetParent(HearthDB.BAG["parent"]);
        hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
        hearthbag.UpdateCheckInherit_OnClick();
        combatFrame:SetPoint(HearthDB.COMBAT["relative"], HearthDB.COMBAT["position"][1], HearthDB.COMBAT["position"][2]);
        combatFrame:SetParent(UIParent);
        hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
        CloseAllBags();
        hearthbag.FrameLevelOrganiser();
        hearthbag.UpdateItem()
        if HearthDB.COMBATFRAME_SHOW == true then
            combatFrame:Show();
        else
            combatFrame:Hide();
        end
    end
end);

hearthbag:SetScript("OnShow", hearthbag.UpdateItem); -- NUCLEAR WEAPON ENGAGED BECAUSE SOMETIMES LOGGING IN DOESN'T WORK

local anchorBuddy = CreateFrame("Frame", "AnchorBuddy", UIParent, nil);
anchorBuddy:RegisterEvent("PLAYER_ENTERING_WORLD");
anchorBuddy:RegisterEvent("ADDON_LOADED");
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
