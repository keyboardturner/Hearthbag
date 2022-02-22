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
    scarletSlippers = 142298,
    rubySlippersSpellID = 39937,
    darkPortal = 93672,
    darkPortalSpellID = 136508,
    brewfest = 166747,
    brewfestSpellID = 286353,
    oribos = 172179,
    oribosSpellID = 308742,
    inndaughter = 64488,
    inndaughterSpellID = 94719,
    etherealPortal = 54452,
    etherealPortalSpellID = 75136,
    midsummer = 166746,
    midsummerSpellID = 286331,
    crimbo = 162973,
    crimboSpellID = 278244,
    halloween = 163045,
    halloweenSpellID = 278559,
    mechagon = 168907,
    mechagonSpellID = 298068,
    kyrian = 184353,
    kyrianSpellID = 345393,
    necrolord = 182773,
    necrolordSpellID = 340200,
    ardenweald = 180290,
    ardenwealdSpellID = 326064,
    venthyr = 183716,
    venthyrSpellID = 342122,
    lunar = 165669,
    lunarSpellID = 285362,
    noblegarden = 165802,
    nobelgardenSpellID = 286031,
    valentine = 165670,
    valentineSpellID = 285424,
    diablo = 142542,
    diabloSpellID = 231504,
    dalaran = 140192,
    dalaranSpellID = 222695,
    garrison = 110560,
    garrisonSpellID = 171253,
    broker = 190237,
    brokerSpellID = 367013,
    torghast = 188952,
    torghastSpellID = 363799,


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
    hearthArrowParent = "Interface/AddOns/Hearthbag/Textures/ArruwButton_Parent.blp",


    hearthDarkPortalUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_darkportal.blp",
    hearthDarkPortalDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_darkportalDown.blp",
    hearthDarkPortalCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_darkportal.blp",
    hearthDarkPortalDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_darkportalDesat.blp",

    hearthKaraUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_karazhan.blp",
    hearthKaraDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_karazhanDown.blp",
    hearthKaraCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_karazhan.blp",
    hearthKaraDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_karazhanDesat.blp",

    hearthDaughterUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_daughter.blp",
    hearthDaughterDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_daughterDown.blp",
    hearthDaughterCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_daughter.blp",
    hearthDaughterDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_daughterDesat.blp",

    hearthBrewfestUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_brewfest.blp",
    hearthBrewfestDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_brewfestDown.blp",
    hearthBrewfestCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_brewfest.blp",
    hearthBrewfestDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_brewfestDesat.blp",

    hearthEtherealUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_ethereal.blp",
    hearthEtherealDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_etherealDown.blp",
    hearthEtherealCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_ethereal.blp",
    hearthEtherealDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_etherealDesat.blp",

    hearthOribosUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_oribos.blp",
    hearthOribosDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_oribosDown.blp",
    hearthOribosCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_oribos.blp",
    hearthOribosDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_oribosDesat.blp",

    hearthMidsummerUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_midsummer.blp",
    hearthMidsummerDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_midsummerDown.blp",
    hearthMidsummerCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_midsummer.blp",
    hearthMidsummerDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_midsummerDesat.blp",

    hearthCrimboUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_crimbo.blp",
    hearthCrimboDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_crimboDown.blp",
    hearthCrimboCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_crimbo.blp",
    hearthCrimboDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_crimboDesat.blp",

    hearthHalloweenUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_halloween.blp",
    hearthHalloweenDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_halloweenDown.blp",
    hearthHalloweenCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_halloween.blp",
    hearthHalloweenDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_halloweenDesat.blp",

    hearthLunarUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_lunar.blp",
    hearthLunarDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_lunarDown.blp",
    hearthLunarCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_lunar.blp",
    hearthLunarDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_lunarDesat.blp",

    hearthNobleUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_noblegarden.blp",
    hearthNobleDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_noblegardenDown.blp",
    hearthNobleCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_noblegarden.blp",
    hearthNobleDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_noblegardenDesat.blp",

    hearthMechagonUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_mechagon.blp",
    hearthMechagonDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_mechagonDown.blp",
    hearthMechagonCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_mechagon.blp",
    hearthMechagonDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_mechagonDesat.blp",

    hearthKyrianUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_kyrian.blp",
    hearthKyrianDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_kyrianDown.blp",
    hearthKyrianCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_kyrian.blp",
    hearthKyrianDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_kyrianDesat.blp",

    hearthNecroUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_necrolord.blp",
    hearthNecroDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_necrolordDown.blp",
    hearthNecroCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_necrolord.blp",
    hearthNecroDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_necrolordDesat.blp",

    hearthArdenUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_arden.blp",
    hearthArdenDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_ardenDown.blp",
    hearthArdenCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_arden.blp",
    hearthArdenDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_ardenDesat.blp",

    hearthVenthyrUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_venthyr.blp",
    hearthVenthyrDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_venthyrDown.blp",
    hearthVenthyrCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_venthyr.blp",
    hearthVenthyrDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_venthyrDesat.blp",

    hearthLoveUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_valentine.blp",
    hearthLoveDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_valentineDown.blp",
    hearthLoveCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_valentine.blp",
    hearthLoveDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_valentineDesat.blp",

    hearthDiabloUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_diablo.blp",
    hearthDiabloDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_diabloDown.blp",
    hearthDiabloCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_diablo.blp",
    hearthDiabloDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_diabloDesat.blp",

    hearthGarrisonUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_garrison.blp",
    hearthGarrisonDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_garrisonDown.blp",
    hearthGarrisonCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_garrison.blp",
    hearthGarrisonDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_garrisonDesat.blp",

    hearthDalaranUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_dalaran.blp",
    hearthDalaranDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_dalaranDown.blp",
    hearthDalaranCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_dalaran.blp",
    hearthDalaranDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_dalaranDesat.blp",

    hearthBrokerUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_broker.blp",
    hearthBrokerDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_brokerDown.blp",
    hearthBrokerCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_broker.blp",
    hearthBrokerDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_brokerDesat.blp",

    hearthTorghastUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_torghast.blp",
    hearthTorghastDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_torghastDown.blp",
    hearthTorghastCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_torghast.blp",
    hearthTorghastDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_torghastDesat.blp",


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

-- litebag
local LitebagProfile = {
    ["parent"] = "LiteBagInventoryPanelButton1",
    ["scale"] = 72,
    ["position"] = {
        -48, --[1]
        22, --[2]
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
combatTex:SetTexture(TEXTURE_LIST.hearthCombatTex);
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
    end
end);



local function UpdateItem()
    local NewItem = select(1, GetItemInfo(HearthDB.ITEM)) 
    if UnitAffectingCombat("player") == false then
        hearthbag:RegisterForClicks("LeftButtonUp", "RightButtonUp");
        hearthbag:SetAttribute("*type1", "item");   -- set to "any left click," targets an item
        hearthbag:SetAttribute("item", NewItem); -- the targetted item is now using the Item:CreateFromItemID() from before
    end
end

-- button that enables the panel the options populate on to
local scrollbackButton = CreateFrame("Button", "ScrollBackButton", hearthbag, nil);
scrollbackButton:SetSize(25, 25);
scrollbackButton:SetPoint("LEFT", -15, 0);
scrollbackButton:SetNormalTexture(TEXTURE_LIST.hearthEndUpButton);
scrollbackButton:SetPushedTexture(TEXTURE_LIST.hearthEndDownButton);
scrollbackButton:SetHighlightTexture(TEXTURE_LIST.hearthEndHighlight);


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
scrollbackendButton:SetPushedTexture(TEXTURE_LIST.hearthEndDownButton);
scrollbackendButton:SetHighlightTexture(TEXTURE_LIST.hearthEndHighlight);

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
nudgeParentTex:SetTexture(TEXTURE_LIST.hearthArrowParent);
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
    
    scrollbackButton:SetFrameLevel(550)
    if scrollbackButton:GetFrameLevel() >= hearthbag:GetFrameLevel() then
        scrollbackButton:SetFrameLevel(hearthbag:GetFrameLevel() - 1)
    end

    scrollbackFrame:SetFrameLevel(560)
    if scrollbackFrame:GetFrameLevel() <= scrollbackButton:GetFrameLevel() then
        scrollbackFrame:SetFrameLevel(scrollbackButton:GetFrameLevel() - 1)
    end

    scrollbackendButton:SetFrameLevel(550)
    if scrollbackendButton:GetFrameLevel() >= scrollbackFrame:GetFrameLevel() then
        scrollbackendButton:SetFrameLevel(scrollbackFrame:GetFrameLevel() - 1)
    end

    checkboxbg0:SetFrameLevel(570)
    if checkboxbg0:GetFrameLevel() <= scrollbackFrame:GetFrameLevel() then
        checkboxbg0:SetFrameLevel(scrollbackFrame:GetFrameLevel() +1 )
    end
    checkboxbg1:SetFrameLevel(570)
    if checkboxbg1:GetFrameLevel() <= scrollbackFrame:GetFrameLevel() then
        checkboxbg1:SetFrameLevel(scrollbackFrame:GetFrameLevel() +1 )
    end
    checkboxbg2:SetFrameLevel(570)
    if checkboxbg2:GetFrameLevel() <= scrollbackFrame:GetFrameLevel() then
        checkboxbg2:SetFrameLevel(scrollbackFrame:GetFrameLevel() +1 )
    end
    buttonContainer.FrameLevelChildren()
end

local function RandomSoundButton_Down()
    PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\ButtonDown" .. math.random(1, 4) ..  ".ogg", "SFX");
end

local function RandomSoundButton_Up()
    PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\Button" .. math.random(1, 4) ..  ".ogg", "SFX");
end

-- (PlayerHasToy(HearthDB.ITEM) == true)
-- (C_ToyBox.IsToyUsable(HearthDB.ITEM) == true)
-- controls the behaviour of Hearthbag
local function hearthBag_OnMouseDown(self, button)  -- controls the mouse down behaviour, including the "down" texture
    local duration = GetSpellCooldown(HearthDB.SPELLID);
    local CastingHearth = select(8,UnitCastingInfo("player"));  -- I refuse to use == 1 for the item count because it may be possible to glitch the game and grab 2+ hearthstones
    if ( (HearthDB.ITEM == ITEM_LIST.defaultHearthstone) or (HearthDB.ITEM == ITEM_LIST.rubySlippers) or (HearthDB.ITEM == ITEM_LIST.scarletSlippers) ) then
        if ((GetItemCount(HearthDB.ITEM) > 0) and (button == "LeftButton") and (duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DOWN);
            RandomSoundButton_Down();   -- selects from a random number of sounds
        elseif (GetItemCount(HearthDB.ITEM) > 0) then   -- if the item exists but doesn't fullfil above criteria
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
        else                                    -- if the item does not exist or turns up nil
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    else
        if ((PlayerHasToy(HearthDB.ITEM) == true) and (button == "LeftButton") and (duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DOWN);
            RandomSoundButton_Down();   -- selects from a random number of sounds
        elseif (PlayerHasToy(HearthDB.ITEM) == true) then   -- if the item exists but doesn't fullfil above criteria
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
        else                                    -- if the item does not exist or turns up nil
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    end
end
-- controls the mouse up behaviour, similar to mousedown function
local function hearthBag_OnMouseUp()
    local duration = GetSpellCooldown(HearthDB.SPELLID);
    local CastingHearth = select(8,UnitCastingInfo("player"));
    if ( (HearthDB.ITEM == ITEM_LIST.defaultHearthstone) or (HearthDB.ITEM == ITEM_LIST.rubySlippers) or (HearthDB.ITEM == ITEM_LIST.scarletSlippers) ) then
        if (GetItemCount(HearthDB.ITEM) > 0) then
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
            if ((duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
                RandomSoundButton_Up();
            end
        else
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    else
        if (PlayerHasToy(HearthDB.ITEM) == true) then
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
            if ((duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
                RandomSoundButton_Up();
            end
        else
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    end
end
-- this also sets the texture upon login
local function hearthDestroyed()
    if ( (HearthDB.ITEM == ITEM_LIST.defaultHearthstone) or (HearthDB.ITEM == ITEM_LIST.rubySlippers) or (HearthDB.ITEM == ITEM_LIST.scarletSlippers) ) then
        if (GetItemCount(HearthDB.ITEM) > 0) then
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
        else
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    else
        if (PlayerHasToy(HearthDB.ITEM) == true) then
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
        else
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
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
        hearthbag:SetPoint("TOPLEFT", combatFrame, "TOPLEFT", 5, -10);
        hearthbag:SetPoint("BOTTOMRIGHT", combatFrame, "BOTTOMRIGHT", -5, 0);
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


-- background frame for the options to parent to, but is also parented to the button and placed under it in strata
local itemHolderFrame = CreateFrame("Frame", "ItemHolderFrame", scrollbackFrame, nil);
itemHolderFrame:SetSize(220, 180);
itemHolderFrame:SetPoint("CENTER", 0, -92);

local itemHolderFrameTex = itemHolderFrame:CreateTexture("ItemHolderFrameTex", "BACKGROUND");
itemHolderFrameTex:SetPoint("CENTER");
itemHolderFrameTex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
itemHolderFrameTex:SetDrawLayer("Background", 0);
itemHolderFrameTex:SetAllPoints(itemHolderFrame);
--itemHolderFrameTex:Hide();


local function CompleteHearthTexture()
    if ( (HearthDB.ITEM == ITEM_LIST.defaultHearthstone) or (HearthDB.ITEM == ITEM_LIST.rubySlippers) or (HearthDB.ITEM == ITEM_LIST.scarletSlippers) ) then
        if (GetItemCount(HearthDB.ITEM) > 0) then   -- if the item exists but doesn't fullfil above criteria
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
        else                                    -- if the item does not exist or turns up nil
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    else
        if (PlayerHasToy(HearthDB.ITEM) == true) then   -- if the item exists but doesn't fullfil above criteria
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
        else                                    -- if the item does not exist or turns up nil
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    end
end

-- Default Hearthstone
local option0 = CreateFrame("Button", "HearthbagOption0", itemHolderFrame, nil);
option0:SetSize(25, 25);
option0:SetPoint("LEFT", 59, 57);
option0:SetNormalTexture(TEXTURE_LIST.hearthDefaultTex);
option0:SetPushedTexture(TEXTURE_LIST.hearthDownTex);

function option0:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthDefaultTex
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthDownTex
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthCooldownTex
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthDesatTex
    HearthDB.ITEM = ITEM_LIST.defaultHearthstone
    HearthDB.SPELLID = ITEM_LIST.defaultHearthstoneSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option0:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.defaultHearthstone)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption0", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option0:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option0:SetScript("OnClick", option0.SetHearthTexture_ONCLICK);
option0:SetScript("OnEnter", option0.Tooltip_OnEnter);
option0:SetScript("OnLeave", option0.Tooltip_OnLeave);

option0.collected = CreateFrame("Frame", nil, option0, nil);
option0.collected:SetSize(10, 10);
option0.collected:SetPoint("TOPLEFT", 0, 0);

option0.collected.tex = option0.collected:CreateTexture(nil, "BACKGROUND");
option0.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
option0.collected.tex:SetAllPoints(option0.collected);

function option0.collected:CollectionCheck()
    if GetItemCount(ITEM_LIST.defaultHearthstone) >= 1 then
        option0.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option0.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option0:RegisterEvent("TOYS_UPDATED");
option0:RegisterEvent("BAG_UPDATE");
option0:SetScript("OnEvent", option0.collected.CollectionCheck);


-- Dalaran Hearthstone
local dalaranHearth = CreateFrame("Button", "DalaranHearth", option0, "SecureActionButtonTemplate");
dalaranHearth:SetSize(25, 25);
dalaranHearth:SetPoint("LEFT", 27, 0);
dalaranHearth:SetNormalTexture(TEXTURE_LIST.hearthDalaranUp);
dalaranHearth:SetPushedTexture(TEXTURE_LIST.hearthDalaranDown);

function dalaranHearth:SetItem_OnEvent()
    if InCombatLockdown() == true then
        C_Timer.After(1, dalaranHearth.SetItem_OnEvent)
    else
        dalaranHearth.ItemID = select(1, GetItemInfo(ITEM_LIST.dalaran))
        dalaranHearth:SetAttribute("*type1", "item")
        dalaranHearth:SetAttribute("item", dalaranHearth.ItemID)
    end
end

function dalaranHearth:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.dalaran)
    GameTooltip:SetPoint("BOTTOMRIGHT", "DalaranHearth", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function dalaranHearth:Tooltip_OnLeave()
    GameTooltip:Hide();
end

dalaranHearth:RegisterEvent("PLAYER_ENTERING_WORLD");
dalaranHearth:SetScript("OnEnter", dalaranHearth.Tooltip_OnEnter);
dalaranHearth:SetScript("OnLeave", dalaranHearth.Tooltip_OnLeave);
dalaranHearth:SetScript("OnEvent", dalaranHearth.SetItem_OnEvent);

dalaranHearth.hearthCD = CreateFrame("Cooldown", "DalHearthCD", dalaranHearth, "CooldownFrameTemplate");
dalaranHearth.hearthCD:SetUseCircularEdge(true); -- makes the cooldown edge circular
dalaranHearth.hearthCD:SetSwipeTexture(TEXTURE_LIST.hearthDalaranCD); -- set the cooldown texture to be the rune
dalaranHearth.hearthCD:SetSwipeColor(0.2,0.2,0.2,1.0); -- set the RGB of the rune to ~20% "brightness" (makes it dark)
dalaranHearth.hearthCD:SetDrawEdge(true); -- shows the blip on the CD
dalaranHearth.hearthCD:SetEdgeTexture(HearthDB.APPEARANCE.BLIP,1.0,1.0,1.0,1.0); -- makes the blip as bright as possible
--dalaranHearth.hearthCD:SetRotation(-2.22); -- rotates the whole cooldown rune so that the tail end of the rune will fill out last. ~ -127 degrees

 -- checks the cooldown on the hearthstone spell portion of the item
function dalaranHearth.hearthCD:hearthCheck()
    local startTime, duration = GetItemCooldown(ITEM_LIST.dalaran);
    if duration ~= 0 then
        dalaranHearth.hearthCD:SetCooldown(startTime, duration);
    end
end

dalaranHearth.hearthCD:RegisterEvent("SPELL_UPDATE_COOLDOWN"); -- hearthstone effect is technically a spell
dalaranHearth.hearthCD:RegisterEvent("PLAYER_ENTERING_WORLD"); -- to ensure the cooldown is calculated upon login
dalaranHearth.hearthCD:RegisterEvent("BAG_UPDATE_COOLDOWN"); -- just in case spell doesn't do the thing
dalaranHearth.hearthCD:RegisterEvent("BAG_UPDATE"); -- this fires a lot
dalaranHearth.hearthCD:SetScript("OnEvent", dalaranHearth.hearthCD.hearthCheck);

dalaranHearth.collected = CreateFrame("Frame", nil, dalaranHearth, nil);
dalaranHearth.collected:SetSize(10, 10);
dalaranHearth.collected:SetPoint("TOPLEFT", 0, 0);

dalaranHearth.collected.tex = dalaranHearth.collected:CreateTexture(nil, "BACKGROUND");
dalaranHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
dalaranHearth.collected.tex:SetAllPoints(dalaranHearth.collected);

function dalaranHearth.collected:CollectionCheck()
    if GetItemCount(ITEM_LIST.dalaran) >= 1 then
        dalaranHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        dalaranHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

dalaranHearth:RegisterEvent("TOYS_UPDATED");
dalaranHearth:RegisterEvent("BAG_UPDATE");
dalaranHearth:HookScript("OnEvent", dalaranHearth.collected.CollectionCheck);



-- Garrison Hearthstone
local garrisonHearth = CreateFrame("Button", "GarrisonHearth", dalaranHearth, "SecureActionButtonTemplate");
garrisonHearth:SetSize(25, 25);
garrisonHearth:SetPoint("LEFT", 27, 0);
garrisonHearth:SetNormalTexture(TEXTURE_LIST.hearthGarrisonUp);
garrisonHearth:SetPushedTexture(TEXTURE_LIST.hearthGarrisonDown);

function garrisonHearth:SetItem_OnEvent()
    if InCombatLockdown() == true then
        C_Timer.After(1, dalaranHearth.SetItem_OnEvent)
    else
        garrisonHearth.ItemID = select(1, GetItemInfo(ITEM_LIST.garrison))
        garrisonHearth:SetAttribute("*type1", "item")
        garrisonHearth:SetAttribute("item", garrisonHearth.ItemID)
    end
end

function garrisonHearth:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.garrison)
    GameTooltip:SetPoint("BOTTOMRIGHT", "GarrisonHearth", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function garrisonHearth:Tooltip_OnLeave()
    GameTooltip:Hide();
end

garrisonHearth:RegisterEvent("PLAYER_ENTERING_WORLD");
garrisonHearth:SetScript("OnEnter", garrisonHearth.Tooltip_OnEnter);
garrisonHearth:SetScript("OnLeave", garrisonHearth.Tooltip_OnLeave);
garrisonHearth:SetScript("OnEvent", garrisonHearth.SetItem_OnEvent);

garrisonHearth.hearthCD = CreateFrame("Cooldown", "GarHearthCD", garrisonHearth, "CooldownFrameTemplate");
garrisonHearth.hearthCD:SetUseCircularEdge(true); -- makes the cooldown edge circular
garrisonHearth.hearthCD:SetSwipeTexture(TEXTURE_LIST.hearthGarrisonCD); -- set the cooldown texture to be the rune
garrisonHearth.hearthCD:SetSwipeColor(0.2,0.2,0.2,1.0); -- set the RGB of the rune to ~20% "brightness" (makes it dark)
garrisonHearth.hearthCD:SetDrawEdge(true); -- shows the blip on the CD
garrisonHearth.hearthCD:SetEdgeTexture(HearthDB.APPEARANCE.BLIP,1.0,1.0,1.0,1.0); -- makes the blip as bright as possible
garrisonHearth.hearthCD:SetRotation(-5.13); -- rotates the whole cooldown rune so that the tail end of the rune will fill out last. ~ -127 degrees

 -- checks the cooldown on the hearthstone spell portion of the item
function garrisonHearth.hearthCD:hearthCheck()
    local startTime, duration = GetItemCooldown(ITEM_LIST.garrison);
    if duration ~= 0 then
        garrisonHearth.hearthCD:SetCooldown(startTime, duration);
    end
end

garrisonHearth.hearthCD:RegisterEvent("SPELL_UPDATE_COOLDOWN"); -- hearthstone effect is technically a spell
garrisonHearth.hearthCD:RegisterEvent("PLAYER_ENTERING_WORLD"); -- to ensure the cooldown is calculated upon login
garrisonHearth.hearthCD:RegisterEvent("BAG_UPDATE_COOLDOWN"); -- just in case spell doesn't do the thing
garrisonHearth.hearthCD:RegisterEvent("BAG_UPDATE"); -- this fires a lot
garrisonHearth.hearthCD:SetScript("OnEvent", garrisonHearth.hearthCD.hearthCheck);


garrisonHearth.collected = CreateFrame("Frame", nil, garrisonHearth, nil);
garrisonHearth.collected:SetSize(10, 10);
garrisonHearth.collected:SetPoint("TOPLEFT", 0, 0);

garrisonHearth.collected.tex = garrisonHearth.collected:CreateTexture(nil, "BACKGROUND");
garrisonHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
garrisonHearth.collected.tex:SetAllPoints(garrisonHearth.collected);

function garrisonHearth.collected:CollectionCheck()
    if GetItemCount(ITEM_LIST.garrison) >= 1 then
        garrisonHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        garrisonHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

garrisonHearth:RegisterEvent("TOYS_UPDATED");
garrisonHearth:RegisterEvent("BAG_UPDATE");
garrisonHearth:HookScript("OnEvent", garrisonHearth.collected.CollectionCheck);


-- Covenant
local covenantHearthstone = CreateFrame("Button", "CovenantHearthstone", garrisonHearth, nil);
covenantHearthstone:SetSize(25, 25);
covenantHearthstone:SetPoint("LEFT", 27, 0);
covenantHearthstone:SetNormalTexture(TEXTURE_LIST.hearthNobleUp);
covenantHearthstone:SetPushedTexture(TEXTURE_LIST.hearthNobleDown);

local covenantID = C_Covenants.GetActiveCovenantID()
function covenantHearthstone:ButtonTexture_OnEvent()
	covenantID = C_Covenants.GetActiveCovenantID()
    if covenantID == 0 then
        covenantID = math.random(1, 4);
    end
    if covenantID == 1 then
        covenantHearthstone:SetNormalTexture(TEXTURE_LIST.hearthKyrianUp);
        covenantHearthstone:SetPushedTexture(TEXTURE_LIST.hearthKyrianDown);
    elseif covenantID == 2 then
        covenantHearthstone:SetNormalTexture(TEXTURE_LIST.hearthVenthyrUp);
        covenantHearthstone:SetPushedTexture(TEXTURE_LIST.hearthVenthyrDown);
    elseif covenantID == 3 then
        covenantHearthstone:SetNormalTexture(TEXTURE_LIST.hearthArdenUp);
        covenantHearthstone:SetPushedTexture(TEXTURE_LIST.hearthArdenDown);
    elseif covenantID == 4 then
        covenantHearthstone:SetNormalTexture(TEXTURE_LIST.hearthNecroUp);
        covenantHearthstone:SetPushedTexture(TEXTURE_LIST.hearthNecroDown);
    end
end

function covenantHearthstone:SetHearthTexture_ONCLICK()
    covenantID = C_Covenants.GetActiveCovenantID()
    if covenantID == 1 then
        HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthKyrianUp
        HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthKyrianDown
        HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthKyrianCD
        HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthKyrianDesat
        HearthDB.ITEM = ITEM_LIST.kyrian
        HearthDB.SPELLID = ITEM_LIST.kyrianSpellID
    elseif covenantID == 2 then
        HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthVenthyrUp
        HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthVenthyrDown
        HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthVenthyrCD
        HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthVenthyrDesat
        HearthDB.ITEM = ITEM_LIST.venthyr
        HearthDB.SPELLID = ITEM_LIST.venthyrSpellID
    elseif covenantID == 3 then
        HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthArdenUp
        HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthArdenDown
        HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthArdenCD
        HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthArdenDesat
        HearthDB.ITEM = ITEM_LIST.ardenweald
        HearthDB.SPELLID = ITEM_LIST.ardenwealdSpellID
    elseif covenantID == 4 then
        HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthNecroUp
        HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthNecroDown
        HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthNecroCD
        HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthNecroDesat
        HearthDB.ITEM = ITEM_LIST.necrolord
        HearthDB.SPELLID = ITEM_LIST.necrolordSpellID
    end
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function covenantHearthstone:Tooltip_OnEnter()
    covenantID = C_Covenants.GetActiveCovenantID()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    if covenantID == 1 then
            GameTooltip:SetItemByID(ITEM_LIST.kyrian);
    elseif covenantID == 2 then
            GameTooltip:SetItemByID(ITEM_LIST.venthyr);
    elseif covenantID == 3 then
            GameTooltip:SetItemByID(ITEM_LIST.ardenweald);
    elseif covenantID == 4 then
            GameTooltip:SetItemByID(ITEM_LIST.necrolord);
    end
    GameTooltip:SetPoint("BOTTOMRIGHT", "CovenantHearthstone", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function covenantHearthstone:Tooltip_OnLeave()
    GameTooltip:Hide();
end

covenantHearthstone:RegisterEvent("PLAYER_ENTERING_WORLD");
covenantHearthstone:RegisterEvent("COVENANT_CHOSEN");
covenantHearthstone:SetScript("OnClick", covenantHearthstone.SetHearthTexture_ONCLICK);
covenantHearthstone:SetScript("OnEnter", covenantHearthstone.Tooltip_OnEnter);
covenantHearthstone:SetScript("OnLeave", covenantHearthstone.Tooltip_OnLeave);
covenantHearthstone:SetScript("OnEvent", covenantHearthstone.ButtonTexture_OnEvent);

covenantHearthstone.collected = CreateFrame("Frame", nil, covenantHearthstone, nil);
covenantHearthstone.collected:SetSize(10, 10);
covenantHearthstone.collected:SetPoint("TOPLEFT", 0, 0);

covenantHearthstone.collected.tex = covenantHearthstone.collected:CreateTexture(nil, "BACKGROUND");
covenantHearthstone.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
covenantHearthstone.collected.tex:SetAllPoints(covenantHearthstone.collected);

function covenantHearthstone.collected:CollectionCheck()
    covenantID = C_Covenants.GetActiveCovenantID()
    if covenantID == 1 and PlayerHasToy(ITEM_LIST.kyrian) == true then
        covenantHearthstone.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    elseif covenantID == 2 and PlayerHasToy(ITEM_LIST.venthyr) == true then
        covenantHearthstone.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    elseif covenantID == 3 and PlayerHasToy(ITEM_LIST.ardenweald) == true then
        covenantHearthstone.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    elseif covenantID == 4 and PlayerHasToy(ITEM_LIST.necrolord) == true then
        covenantHearthstone.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        covenantHearthstone.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

covenantHearthstone:RegisterEvent("TOYS_UPDATED");
covenantHearthstone:RegisterEvent("BAG_UPDATE");
covenantHearthstone:HookScript("OnEvent", covenantHearthstone.collected.CollectionCheck);


-- Mechagon
local option10 = CreateFrame("Button", "HearthbagOption10", option0, nil);
option10:SetSize(25, 25);
option10:SetPoint("LEFT", 0, -27);
option10:SetNormalTexture(TEXTURE_LIST.hearthMechagonUp);
option10:SetPushedTexture(TEXTURE_LIST.hearthMechagonDown);

function option10:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthMechagonUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthMechagonDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthMechagonCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthMechagonDesat
    HearthDB.ITEM = ITEM_LIST.mechagon
    HearthDB.SPELLID = ITEM_LIST.mechagonSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option10:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.mechagon)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption10", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option10:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option10:SetScript("OnClick", option10.SetHearthTexture_ONCLICK);
option10:SetScript("OnEnter", option10.Tooltip_OnEnter);
option10:SetScript("OnLeave", option10.Tooltip_OnLeave);

option10.collected = CreateFrame("Frame", nil, option10, nil);
option10.collected:SetSize(10, 10);
option10.collected:SetPoint("TOPLEFT", 0, 0);

option10.collected.tex = option10.collected:CreateTexture(nil, "BACKGROUND");
option10.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option10.collected.tex:SetAllPoints(option10.collected);

function option10.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.mechagon) == true then
        option10.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option10.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option10:RegisterEvent("TOYS_UPDATED");
option10:RegisterEvent("BAG_UPDATE");
option10:HookScript("OnEvent", option10.collected.CollectionCheck);


-- Ruby Slippers
local option2 = CreateFrame("Button", "HearthbagOption2", option10, nil);
option2:SetSize(25, 25);
option2:SetPoint("LEFT", 27, 0);
option2:SetNormalTexture(TEXTURE_LIST.hearthKaraUp);
option2:SetPushedTexture(TEXTURE_LIST.hearthKaraDown);

function option2:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthKaraUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthKaraDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthKaraCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthKaraDesat
    if GetItemCount(ITEM_LIST.scarletSlippers) >= 1 then
        HearthDB.ITEM = ITEM_LIST.scarletSlippers
    else 
        HearthDB.ITEM = ITEM_LIST.rubySlippers
    end
    HearthDB.SPELLID = ITEM_LIST.rubySlippersSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option2:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    if GetItemCount(ITEM_LIST.scarletSlippers) >= 1 then
        GameTooltip:SetItemByID(ITEM_LIST.scarletSlippers)
    else
        GameTooltip:SetItemByID(ITEM_LIST.rubySlippers)
    end
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption2", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option2:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option2:SetScript("OnClick", option2.SetHearthTexture_ONCLICK);
option2:SetScript("OnEnter", option2.Tooltip_OnEnter);
option2:SetScript("OnLeave", option2.Tooltip_OnLeave);

option2.collected = CreateFrame("Frame", nil, option2, nil);
option2.collected:SetSize(10, 10);
option2.collected:SetPoint("TOPLEFT", 0, 0);

option2.collected.tex = option2.collected:CreateTexture(nil, "BACKGROUND");
option2.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option2.collected.tex:SetAllPoints(option2.collected);

function option2.collected:CollectionCheck()
    if GetItemCount(ITEM_LIST.scarletSlippers) >= 1 then
        option2.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    elseif GetItemCount(ITEM_LIST.rubySlippers) >= 1 then
        option2.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option2.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option2:RegisterEvent("TOYS_UPDATED");
option2:RegisterEvent("BAG_UPDATE");
option2:SetScript("OnEvent", option2.collected.CollectionCheck);


-- Innkeeper's Daughter
local option5 = CreateFrame("Button", "HearthbagOption5", option2, nil);
option5:SetSize(25, 25);
option5:SetPoint("LEFT", 27, 0);
option5:SetNormalTexture(TEXTURE_LIST.hearthDaughterUp);
option5:SetPushedTexture(TEXTURE_LIST.hearthDaughterDown);

function option5:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthDaughterUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthDaughterDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthDaughterCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthDaughterDesat
    HearthDB.ITEM = ITEM_LIST.inndaughter
    HearthDB.SPELLID = ITEM_LIST.inndaughterSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option5:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.inndaughter)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption5", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option5:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option5:SetScript("OnClick", option5.SetHearthTexture_ONCLICK);
option5:SetScript("OnEnter", option5.Tooltip_OnEnter);
option5:SetScript("OnLeave", option5.Tooltip_OnLeave);

option5.collected = CreateFrame("Frame", nil, option5, nil);
option5.collected:SetSize(10, 10);
option5.collected:SetPoint("TOPLEFT", 0, 0);

option5.collected.tex = option5.collected:CreateTexture(nil, "BACKGROUND");
option5.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option5.collected.tex:SetAllPoints(option5.collected);

function option5.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.inndaughter) == true then
        option5.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option5.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option5:RegisterEvent("TOYS_UPDATED");
option5:RegisterEvent("BAG_UPDATE");
option5:SetScript("OnEvent", option5.collected.CollectionCheck);


-- Oribos
local option4 = CreateFrame("Button", "HearthbagOption4", option5, nil);
option4:SetSize(25, 25);
option4:SetPoint("LEFT", 27, 0);
option4:SetNormalTexture(TEXTURE_LIST.hearthOribosUp);
option4:SetPushedTexture(TEXTURE_LIST.hearthOribosDown);

function option4:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthOribosUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthOribosDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthOribosCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthOribosDesat
    HearthDB.ITEM = ITEM_LIST.oribos
    HearthDB.SPELLID = ITEM_LIST.oribosSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option4:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.oribos)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption4", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option4:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option4:SetScript("OnClick", option4.SetHearthTexture_ONCLICK);
option4:SetScript("OnEnter", option4.Tooltip_OnEnter);
option4:SetScript("OnLeave", option4.Tooltip_OnLeave);

option4.collected = CreateFrame("Frame", nil, option4, nil);
option4.collected:SetSize(10, 10);
option4.collected:SetPoint("TOPLEFT", 0, 0);

option4.collected.tex = option4.collected:CreateTexture(nil, "BACKGROUND");
option4.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option4.collected.tex:SetAllPoints(option4.collected);

function option4.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.oribos) == true then
        option4.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option4.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option4:RegisterEvent("TOYS_UPDATED");
option4:RegisterEvent("BAG_UPDATE");
option4:SetScript("OnEvent", option4.collected.CollectionCheck);


-- Brewfest
local option3 = CreateFrame("Button", "HearthbagOption3", option10, nil);
option3:SetSize(25, 25);
option3:SetPoint("LEFT", 0, -27);
option3:SetNormalTexture(TEXTURE_LIST.hearthBrewfestUp);
option3:SetPushedTexture(TEXTURE_LIST.hearthBrewfestDown);

function option3:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthBrewfestUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthBrewfestDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthBrewfestCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthBrewfestDesat
    HearthDB.ITEM = ITEM_LIST.brewfest
    HearthDB.SPELLID = ITEM_LIST.brewfestSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option3:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.brewfest)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption3", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option3:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option3:SetScript("OnClick", option3.SetHearthTexture_ONCLICK);
option3:SetScript("OnEnter", option3.Tooltip_OnEnter);
option3:SetScript("OnLeave", option3.Tooltip_OnLeave);

option3.collected = CreateFrame("Frame", nil, option3, nil);
option3.collected:SetSize(10, 10);
option3.collected:SetPoint("TOPLEFT", 0, 0);

option3.collected.tex = option3.collected:CreateTexture(nil, "BACKGROUND");
option3.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option3.collected.tex:SetAllPoints(option3.collected);

function option3.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.brewfest) == true then
        option3.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option3.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option3:RegisterEvent("TOYS_UPDATED");
option3:RegisterEvent("BAG_UPDATE");
option3:SetScript("OnEvent", option3.collected.CollectionCheck);


-- Midsummer
local option7 = CreateFrame("Button", "HearthbagOption7", option3, nil);
option7:SetSize(25, 25);
option7:SetPoint("LEFT", 27, 0);
option7:SetNormalTexture(TEXTURE_LIST.hearthMidsummerUp);
option7:SetPushedTexture(TEXTURE_LIST.hearthMidsummerDown);

function option7:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthMidsummerUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthMidsummerDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthMidsummerCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthMidsummerDesat
    HearthDB.ITEM = ITEM_LIST.midsummer
    HearthDB.SPELLID = ITEM_LIST.midsummerSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option7:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.midsummer)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption7", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option7:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option7:SetScript("OnClick", option7.SetHearthTexture_ONCLICK);
option7:SetScript("OnEnter", option7.Tooltip_OnEnter);
option7:SetScript("OnLeave", option7.Tooltip_OnLeave);

option7.collected = CreateFrame("Frame", nil, option7, nil);
option7.collected:SetSize(10, 10);
option7.collected:SetPoint("TOPLEFT", 0, 0);

option7.collected.tex = option7.collected:CreateTexture(nil, "BACKGROUND");
option7.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option7.collected.tex:SetAllPoints(option7.collected);

function option7.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.midsummer) == true then
        option7.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option7.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option7:RegisterEvent("TOYS_UPDATED");
option7:RegisterEvent("BAG_UPDATE");
option7:SetScript("OnEvent", option7.collected.CollectionCheck);


-- Winter's Veil
local option8 = CreateFrame("Button", "HearthbagOption8", option7, nil);
option8:SetSize(25, 25);
option8:SetPoint("LEFT", 27, 0);
option8:SetNormalTexture(TEXTURE_LIST.hearthCrimboUp);
option8:SetPushedTexture(TEXTURE_LIST.hearthCrimboDown);

function option8:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthCrimboUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthCrimboDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthCrimboCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthCrimboDesat
    HearthDB.ITEM = ITEM_LIST.crimbo
    HearthDB.SPELLID = ITEM_LIST.crimboSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option8:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.crimbo)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption8", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option8:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option8:SetScript("OnClick", option8.SetHearthTexture_ONCLICK);
option8:SetScript("OnEnter", option8.Tooltip_OnEnter);
option8:SetScript("OnLeave", option8.Tooltip_OnLeave);

option8.collected = CreateFrame("Frame", nil, option8, nil);
option8.collected:SetSize(10, 10);
option8.collected:SetPoint("TOPLEFT", 0, 0);

option8.collected.tex = option8.collected:CreateTexture(nil, "BACKGROUND");
option8.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option8.collected.tex:SetAllPoints(option8.collected);

function option8.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.crimbo) == true then
        option8.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option8.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option8:RegisterEvent("TOYS_UPDATED");
option8:RegisterEvent("BAG_UPDATE");
option8:SetScript("OnEvent", option8.collected.CollectionCheck);


-- Hallow's End
local option9 = CreateFrame("Button", "HearthbagOption9", option8, nil);
option9:SetSize(25, 25);
option9:SetPoint("LEFT", 27, 0);
option9:SetNormalTexture(TEXTURE_LIST.hearthHalloweenUp);
option9:SetPushedTexture(TEXTURE_LIST.hearthHalloweenDown);

function option9:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthHalloweenUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthHalloweenDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthHalloweenCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthHalloweenDesat
    HearthDB.ITEM = ITEM_LIST.halloween
    HearthDB.SPELLID = ITEM_LIST.halloweenSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option9:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.halloween)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption9", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option9:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option9:SetScript("OnClick", option9.SetHearthTexture_ONCLICK);
option9:SetScript("OnEnter", option9.Tooltip_OnEnter);
option9:SetScript("OnLeave", option9.Tooltip_OnLeave);

option9.collected = CreateFrame("Frame", nil, option9, nil);
option9.collected:SetSize(10, 10);
option9.collected:SetPoint("TOPLEFT", 0, 0);

option9.collected.tex = option9.collected:CreateTexture(nil, "BACKGROUND");
option9.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option9.collected.tex:SetAllPoints(option9.collected);

function option9.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.halloween) == true then
        option9.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option9.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option9:RegisterEvent("TOYS_UPDATED");
option9:RegisterEvent("BAG_UPDATE");
option9:HookScript("OnEvent", option9.collected.CollectionCheck);


-- Lunar Festival
local option12 = CreateFrame("Button", "HearthbagOption12", option3, nil);
option12:SetSize(25, 25);
option12:SetPoint("LEFT", 0, -27);
option12:SetNormalTexture(TEXTURE_LIST.hearthLunarUp);
option12:SetPushedTexture(TEXTURE_LIST.hearthLunarDown);

function option12:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthLunarUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthLunarDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthLunarCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthLunarDesat
    HearthDB.ITEM = ITEM_LIST.lunar
    HearthDB.SPELLID = ITEM_LIST.lunarSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option12:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.lunar)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption12", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option12:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option12:SetScript("OnClick", option12.SetHearthTexture_ONCLICK);
option12:SetScript("OnEnter", option12.Tooltip_OnEnter);
option12:SetScript("OnLeave", option12.Tooltip_OnLeave);

option12.collected = CreateFrame("Frame", nil, option12, nil);
option12.collected:SetSize(10, 10);
option12.collected:SetPoint("TOPLEFT", 0, 0);

option12.collected.tex = option12.collected:CreateTexture(nil, "BACKGROUND");
option12.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option12.collected.tex:SetAllPoints(option12.collected);

function option12.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.lunar) == true then
        option12.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option12.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option12:RegisterEvent("TOYS_UPDATED");
option12:RegisterEvent("BAG_UPDATE");
option12:HookScript("OnEvent", option12.collected.CollectionCheck);


-- Noblegarden
local option15 = CreateFrame("Button", "HearthbagOption15", option12, nil);
option15:SetSize(25, 25);
option15:SetPoint("LEFT", 27, 0);
option15:SetNormalTexture(TEXTURE_LIST.hearthNobleUp);
option15:SetPushedTexture(TEXTURE_LIST.hearthNobleDown);

function option15:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthNobleUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthNobleDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthNobleCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthNobleDesat
    HearthDB.ITEM = ITEM_LIST.noblegarden
    HearthDB.SPELLID = ITEM_LIST.nobelgardenSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option15:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.noblegarden)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption15", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option15:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option15:SetScript("OnClick", option15.SetHearthTexture_ONCLICK);
option15:SetScript("OnEnter", option15.Tooltip_OnEnter);
option15:SetScript("OnLeave", option15.Tooltip_OnLeave);

option15.collected = CreateFrame("Frame", nil, option15, nil);
option15.collected:SetSize(10, 10);
option15.collected:SetPoint("TOPLEFT", 0, 0);

option15.collected.tex = option15.collected:CreateTexture(nil, "BACKGROUND");
option15.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option15.collected.tex:SetAllPoints(option15.collected);

function option15.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.noblegarden) == true then
        option15.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option15.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option15:RegisterEvent("TOYS_UPDATED");
option15:RegisterEvent("BAG_UPDATE");
option15:HookScript("OnEvent", option15.collected.CollectionCheck);


-- Love is in the Air
local option16 = CreateFrame("Button", "HearthbagOption16", option15, nil);
option16:SetSize(25, 25);
option16:SetPoint("LEFT", 27, 0);
option16:SetNormalTexture(TEXTURE_LIST.hearthLoveUp);
option16:SetPushedTexture(TEXTURE_LIST.hearthLoveDown);

function option16:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthLoveUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthLoveDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthLoveCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthLoveDesat
    HearthDB.ITEM = ITEM_LIST.valentine
    HearthDB.SPELLID = ITEM_LIST.valentineSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option16:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.valentine)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption16", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option16:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option16:SetScript("OnClick", option16.SetHearthTexture_ONCLICK);
option16:SetScript("OnEnter", option16.Tooltip_OnEnter);
option16:SetScript("OnLeave", option16.Tooltip_OnLeave);

option16.collected = CreateFrame("Frame", nil, option16, nil);
option16.collected:SetSize(10, 10);
option16.collected:SetPoint("TOPLEFT", 0, 0);

option16.collected.tex = option16.collected:CreateTexture(nil, "BACKGROUND");
option16.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option16.collected.tex:SetAllPoints(option16.collected);

function option16.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.valentine) == true then
        option16.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option16.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option16:RegisterEvent("TOYS_UPDATED");
option16:RegisterEvent("BAG_UPDATE");
option16:HookScript("OnEvent", option16.collected.CollectionCheck);


-- Dark Portal TCG
local option1 = CreateFrame("Button", "HearthbagOption1", option16, nil);
option1:SetSize(25, 25);
option1:SetPoint("LEFT", 27, 0);
option1:SetNormalTexture(TEXTURE_LIST.hearthDarkPortalUp);
option1:SetPushedTexture(TEXTURE_LIST.hearthDarkPortalDown);

function option1:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthDarkPortalUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthDarkPortalDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthDarkPortalCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthDarkPortalDesat
    HearthDB.ITEM = ITEM_LIST.darkPortal
    HearthDB.SPELLID = ITEM_LIST.darkPortalSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option1:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.darkPortal)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption1", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option1:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option1:SetScript("OnClick", option1.SetHearthTexture_ONCLICK);
option1:SetScript("OnEnter", option1.Tooltip_OnEnter);
option1:SetScript("OnLeave", option1.Tooltip_OnLeave);

option1.collected = CreateFrame("Frame", nil, option1, nil);
option1.collected:SetSize(10, 10);
option1.collected:SetPoint("TOPLEFT", 0, 0);

option1.collected.tex = option16.collected:CreateTexture(nil, "BACKGROUND");
option1.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option1.collected.tex:SetAllPoints(option1.collected);

function option1.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.darkPortal) == true then
        option1.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option1.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option1:RegisterEvent("TOYS_UPDATED");
option1:RegisterEvent("BAG_UPDATE");
option1:HookScript("OnEvent", option1.collected.CollectionCheck);


-- Ethereal Portal
local option6 = CreateFrame("Button", "HearthbagOption6", option12, nil);
option6:SetSize(25, 25);
option6:SetPoint("LEFT", 0, -27);
option6:SetNormalTexture(TEXTURE_LIST.hearthEtherealUp);
option6:SetPushedTexture(TEXTURE_LIST.hearthEtherealDown);

function option6:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthEtherealUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthEtherealDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthEtherealCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthEtherealDesat
    HearthDB.ITEM = ITEM_LIST.etherealPortal
    HearthDB.SPELLID = ITEM_LIST.etherealPortalSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option6:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.etherealPortal)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption6", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option6:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option6:SetScript("OnClick", option6.SetHearthTexture_ONCLICK);
option6:SetScript("OnEnter", option6.Tooltip_OnEnter);
option6:SetScript("OnLeave", option6.Tooltip_OnLeave);

option6.collected = CreateFrame("Frame", nil, option6, nil);
option6.collected:SetSize(10, 10);
option6.collected:SetPoint("TOPLEFT", 0, 0);

option6.collected.tex = option6.collected:CreateTexture(nil, "BACKGROUND");
option6.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option6.collected.tex:SetAllPoints(option6.collected);

function option6.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.etherealPortal) == true then
        option6.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option6.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option6:RegisterEvent("TOYS_UPDATED");
option6:RegisterEvent("BAG_UPDATE");
option6:HookScript("OnEvent", option6.collected.CollectionCheck);


-- Diablo
local option17 = CreateFrame("Button", "HearthbagOption17", option6, nil);
option17:SetSize(25, 25);
option17:SetPoint("LEFT", 27, 0);
option17:SetNormalTexture(TEXTURE_LIST.hearthDiabloUp);
option17:SetPushedTexture(TEXTURE_LIST.hearthDiabloDown);

function option17:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthDiabloUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthDiabloDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthDiabloCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthDiabloDesat
    HearthDB.ITEM = ITEM_LIST.diablo
    HearthDB.SPELLID = ITEM_LIST.diabloSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option17:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.diablo)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption17", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option17:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option17:SetScript("OnClick", option17.SetHearthTexture_ONCLICK);
option17:SetScript("OnEnter", option17.Tooltip_OnEnter);
option17:SetScript("OnLeave", option17.Tooltip_OnLeave);

option17.collected = CreateFrame("Frame", nil, option17, nil);
option17.collected:SetSize(10, 10);
option17.collected:SetPoint("TOPLEFT", 0, 0);

option17.collected.tex = option17.collected:CreateTexture(nil, "BACKGROUND");
option17.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option17.collected.tex:SetAllPoints(option17.collected);

function option17.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.diablo) == true then
        option17.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option17.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option17:RegisterEvent("TOYS_UPDATED");
option17:RegisterEvent("BAG_UPDATE");
option17:HookScript("OnEvent", option17.collected.CollectionCheck);



-- Broker
local option19 = CreateFrame("Button", "HearthbagOption19", option17, nil);
option19:SetSize(25, 25);
option19:SetPoint("LEFT", 27, 0);
option19:SetNormalTexture(TEXTURE_LIST.hearthBrokerUp);
option19:SetPushedTexture(TEXTURE_LIST.hearthBrokerDown);

function option19:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthBrokerUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthBrokerDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthBrokerCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthBrokerDesat
    HearthDB.ITEM = ITEM_LIST.broker
    HearthDB.SPELLID = ITEM_LIST.brokerSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option19:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.broker)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption19", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option19:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option19:SetScript("OnClick", option19.SetHearthTexture_ONCLICK);
option19:SetScript("OnEnter", option19.Tooltip_OnEnter);
option19:SetScript("OnLeave", option19.Tooltip_OnLeave);

option19.collected = CreateFrame("Frame", nil, option19, nil);
option19.collected:SetSize(10, 10);
option19.collected:SetPoint("TOPLEFT", 0, 0);

option19.collected.tex = option19.collected:CreateTexture(nil, "BACKGROUND");
option19.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option19.collected.tex:SetAllPoints(option19.collected);

function option19.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.broker) == true then
        option19.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option19.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option19:RegisterEvent("TOYS_UPDATED");
option19:RegisterEvent("BAG_UPDATE");
option19:HookScript("OnEvent", option19.collected.CollectionCheck);



-- Torghast
local option20 = CreateFrame("Button", "HearthbagOption20", option19, nil);
option20:SetSize(25, 25);
option20:SetPoint("LEFT", 27, 0);
option20:SetNormalTexture(TEXTURE_LIST.hearthTorghastUp);
option20:SetPushedTexture(TEXTURE_LIST.hearthTorghastDown);

function option20:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthTorghastUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthTorghastDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthTorghastCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthTorghastDesat
    HearthDB.ITEM = ITEM_LIST.torghast
    HearthDB.SPELLID = ITEM_LIST.torghastSpellID
    CompleteHearthTexture();
    hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    UpdateItem();
end

function option20:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetItemByID(ITEM_LIST.torghast)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption20", "BOTTOMRIGHT", -15, 15);
    GameTooltip:Show();
end

function option20:Tooltip_OnLeave()
    GameTooltip:Hide();
end

option20:SetScript("OnClick", option20.SetHearthTexture_ONCLICK);
option20:SetScript("OnEnter", option20.Tooltip_OnEnter);
option20:SetScript("OnLeave", option20.Tooltip_OnLeave);

option20.collected = CreateFrame("Frame", nil, option20, nil);
option20.collected:SetSize(10, 10);
option20.collected:SetPoint("TOPLEFT", 0, 0);

option20.collected.tex = option20.collected:CreateTexture(nil, "BACKGROUND");
option20.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
option20.collected.tex:SetAllPoints(option20.collected);

function option20.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.torghast) == true then
        option20.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        option20.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

option20:RegisterEvent("TOYS_UPDATED");
option20:RegisterEvent("BAG_UPDATE");
option20:HookScript("OnEvent", option20.collected.CollectionCheck);



function buttonContainer:FrameLevelChildren()
    -- default
    if option0.collected:GetParent():GetFrameLevel() >= option0.collected:GetFrameLevel() then
        option0.collected:SetFrameLevel(option0.collected:GetFrameLevel() + 1)
    end

    -- dalaran
    if dalaranHearth.collected:GetParent():GetFrameLevel() >= dalaranHearth.collected:GetFrameLevel() then
        dalaranHearth.collected:SetFrameLevel(dalaranHearth.collected:GetFrameLevel() + 1)
    end

    --garrison
    if garrisonHearth.collected:GetParent():GetFrameLevel() >= garrisonHearth.collected:GetFrameLevel() then
        garrisonHearth.collected:SetFrameLevel(garrisonHearth.collected:GetFrameLevel() + 1)
    end

    --covenant
    if covenantHearthstone.collected:GetParent():GetFrameLevel() >= covenantHearthstone.collected:GetFrameLevel() then
        covenantHearthstone.collected:SetFrameLevel(covenantHearthstone.collected:GetFrameLevel() + 1)
    end

    --mechagon
    if option10.collected:GetParent():GetFrameLevel() >= option10.collected:GetFrameLevel() then
        option10.collected:SetFrameLevel(option10.collected:GetFrameLevel() + 1)
    end

    --ruby slippers 
    if option2.collected:GetParent():GetFrameLevel() >= option2.collected:GetFrameLevel() then
        option2.collected:SetFrameLevel(option2.collected:GetFrameLevel() + 1)
    end

    --inndaughter
    if option5.collected:GetParent():GetFrameLevel() >= option5.collected:GetFrameLevel() then
        option5.collected:SetFrameLevel(option5.collected:GetFrameLevel() + 1)
    end

    --oribos
    if option4.collected:GetParent():GetFrameLevel() >= option4.collected:GetFrameLevel() then
        option4.collected:SetFrameLevel(option4.collected:GetFrameLevel() + 1)
    end

    --brewfest
    if option3.collected:GetParent():GetFrameLevel() >= option3.collected:GetFrameLevel() then
        option3.collected:SetFrameLevel(option3.collected:GetFrameLevel() + 1)
    end

    --midsummer
    if option7.collected:GetParent():GetFrameLevel() >= option7.collected:GetFrameLevel() then
        option7.collected:SetFrameLevel(option7.collected:GetFrameLevel() + 1)
    end

    --crimbo
    if option8.collected:GetParent():GetFrameLevel() >= option8.collected:GetFrameLevel() then
        option8.collected:SetFrameLevel(option8.collected:GetFrameLevel() + 1)
    end

    --halloween
    if option9.collected:GetParent():GetFrameLevel() >= option9.collected:GetFrameLevel() then
        option9.collected:SetFrameLevel(option9.collected:GetFrameLevel() + 1)
    end

    --lunar
    if option12.collected:GetParent():GetFrameLevel() >= option12.collected:GetFrameLevel() then
        option12.collected:SetFrameLevel(option12.collected:GetFrameLevel() + 1)
    end

    --noblegarden
    if option15.collected:GetParent():GetFrameLevel() >= option15.collected:GetFrameLevel() then
        option15.collected:SetFrameLevel(option15.collected:GetFrameLevel() + 1)
    end

    --valentine
    if option16.collected:GetParent():GetFrameLevel() >= option16.collected:GetFrameLevel() then
        option16.collected:SetFrameLevel(option16.collected:GetFrameLevel() + 1)
    end

    --darkPortal
    if option1.collected:GetParent():GetFrameLevel() >= option1.collected:GetFrameLevel() then
        option1.collected:SetFrameLevel(option1.collected:GetFrameLevel() + 1)
    end

    --etherealPortal
    if option6.collected:GetParent():GetFrameLevel() >= option6.collected:GetFrameLevel() then
        option6.collected:SetFrameLevel(option6.collected:GetFrameLevel() + 1)
    end

    --diablo
    if option17.collected:GetParent():GetFrameLevel() >= option17.collected:GetFrameLevel() then
        option17.collected:SetFrameLevel(option17.collected:GetFrameLevel() + 1)
    end

    --broker
    if option19.collected:GetParent():GetFrameLevel() >= option19.collected:GetFrameLevel() then
        option19.collected:SetFrameLevel(option19.collected:GetFrameLevel() + 1)
    end

    --torghast
    if option20.collected:GetParent():GetFrameLevel() >= option20.collected:GetFrameLevel() then
        option20.collected:SetFrameLevel(option20.collected:GetFrameLevel() + 1)
    end


end


-- stop selecting this
function buttonContainer:SetNewParent(newParent, offsetX, offsetY)
    HearthDB.BAG["parent"] = newParent:GetName()
    HearthDB.BAG["position"][1] = offsetX
    HearthDB.BAG["position"][2] = offsetY
    self:SetParent(HearthDB.BAG["parent"]);
    hearthbag:SetParent(HearthDB.BAG["parent"]);
    hearthbag:SetPoint("CENTER", HearthDB.BAG["parent"], "CENTER", HearthDB.BAG["position"][1], HearthDB.BAG["position"][2]);
    hearthbag:SetFrameStrata("FULLSCREEN_DIALOG");
    FrameLevelOrganiser();
    buttonContainer.FrameLevelChildren();
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
    elseif ( IsAddOnLoaded("Litebag") == true ) then
        HearthDB.BAG["parent"] = LitebagProfile["parent"]
        HearthDB.BAG["scale"] = LitebagProfile["scale"]
        HearthDB.BAG["position"][1] = LitebagProfile["position"][1]
        HearthDB.BAG["position"][2] = LitebagProfile["position"][2]
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
    buttonContainer.FrameLevelChildren();

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
        combatFrame:SetPoint(HearthDB.COMBAT["relative"], UIParent, "CENTER", HearthDB.COMBAT["position"][1], HearthDB.COMBAT["position"][2]);
        hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
        FrameLevelOrganiser();
        buttonContainer.FrameLevelChildren();
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
    local prefix = string.format("|T" .. TEXTURE_LIST.hearthDefaultTex .. ":14|t" .. "|cff4fe6fcH|r|cff44e7ebe|r|cff4de7d6a|r|cff62e6bfr|r|cff7be4a6t|r|cff95e08eh|r|cffafdb78b|r|cffc9d466a|r|cffe2cb5ag|r:");    
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
        combatFrame:SetParent(UIParent);
        hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
        CloseAllBags();
        FrameLevelOrganiser();
        buttonContainer.FrameLevelChildren();
        UpdateItem();
        if HearthDB.COMBATFRAME_SHOW == true then
            combatFrame:Show();
        else
            combatFrame:Hide();
        end
    end
end);

hearthbag:SetScript("OnShow", UpdateItem); -- NUCLEAR WEAPON ENGAGED BECAUSE SOMETIMES LOGGING IN DOESN'T WORK

local anchorBuddy = CreateFrame("Frame", "AnchorBuddy", UIParent, nil);
anchorBuddy:RegisterEvent("PLAYER_ENTERING_WORLD");
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
--[[local anchorTex = anchorBuddy:CreateTexture("AnchorTexture", "BACKGROUND");
anchorTex:SetAllPoints(anchorBuddy);
anchorTex:SetTexture(TEXTURE_LIST.hearthDesatTex);]]