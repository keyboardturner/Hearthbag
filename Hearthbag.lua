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
    timewalker = 193588,
    timewalkerSpellID = 375357,
    centaur = 200630,
    centaurSpellID = 391042,


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

    hearthTimewalkerUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_timewalker.blp",
    hearthTimewalkerDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_timewalkerDown.blp",
    hearthTimewalkerCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_timewalker.blp",
    hearthTimewalkerDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_timewalkerDesat.blp",

    hearthCentaurUp = "Interface/AddOns/Hearthbag/Textures/hearthbutton_centaur.blp",
    hearthCentaurDown = "Interface/AddOns/Hearthbag/Textures/hearthbutton_centaurDown.blp",
    hearthCentaurCD = "Interface/AddOns/Hearthbag/Textures/hearthCooldown_centaur.blp",
    hearthCentaurDesat = "Interface/AddOns/Hearthbag/Textures/hearthbutton_centaurDesat.blp",


};

local hearthCleanup = CreateFrame("Frame")

hearthCleanup.xCB = -142
hearthCleanup.yCB = 30


function hearthCleanup.BagsUpdated()
    if GetCVarBool("combinedBags") == true and HearthDB.BAG["parent"] == "BagItemAutoSortButton" and HearthDB.BAG["position"][1] == -142 and HearthDB.BAG["position"][2] == 30 then
        HearthDB.BAG["position"][1] = -394
        HearthDB.BAG["position"][2] = 30
        hearthCleanup.xCB = -394
        hearthCleanup.yCB = 30
        hearthCleanup.UpdatePosition()
    elseif GetCVarBool("combinedBags") == false and HearthDB.BAG["parent"] == "BagItemAutoSortButton" and HearthDB.BAG["position"][1] == -394 and HearthDB.BAG["position"][2] == 30 then
        HearthDB.BAG["position"][1] = -142
        HearthDB.BAG["position"][2] = 30
        hearthCleanup.xCB = -142
        hearthCleanup.yCB = 30
        hearthCleanup.UpdatePosition()
        core:Print("Please be aware that sometimes going from combined bags to separate bags can taint the bag items. If this happens, do /reload.")
    end
end



-- our default savedvariables, if none exist yet. prevents nil error upon first ever addon login
HearthDB = HearthDB or {
    BAG = {
        ["parent"] = "BagItemAutoSortButton",
        ["scale"] = 42,
        ["position"] = {hearthCleanup.xCB,hearthCleanup.yCB},
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
    ["parent"] = "BagItemAutoSortButton",
    ["scale"] = 42,
    ["position"] = {
        hearthCleanup.xCB, -- [1]
        hearthCleanup.yCB, -- [2]
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
        hearthbag:RegisterForClicks("AnyUp", "AnyDown");
        hearthbag:SetAttribute("*type1", "item");   -- set to "any left click," targets an item
        hearthbag:SetAttribute("item", hearthbag.item:GetItemName()); -- the targetted item is now using the Item:CreateFromItemID() from before
        --hearthbag.UpdateCheckInherit_OnClick()
    end
end);



function hearthbag.UpdateItem()
    local NewItem = select(1, GetItemInfo(HearthDB.ITEM)) 
    if UnitAffectingCombat("player") == false then
        hearthbag:RegisterForClicks("AnyUp", "AnyDown");
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
    if GameTooltip:IsShown() == false then
        GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.checkboxbg0);
        GameTooltip:ClearAllPoints();
    end

    if HearthDB.INHERIT == true then
        hearthbag.inheritOptions.InheritValue = "True"
    else
        hearthbag.inheritOptions.InheritValue = "False"
    end
    GameTooltip:SetText("Inherit the right click options of current bag addon frame: |cff4fe6fc" .. hearthbag.inheritOptions.InheritValue .. "|r", 1, 1, 1, 1, true);
    GameTooltip:AddLine("Please be aware that sometimes going from combined bags to separate bags can taint the bag items. If this happens, do /reload.", 1, 1, 1, 1, true);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG0", "TOPLEFT", 0, 0);
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
    if GameTooltip:IsShown() == false then
        GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.combatOptions);
        GameTooltip:ClearAllPoints();
    end

    if HearthDB.COMBATFRAME_SHOW == true then
        hearthbag.combatOptions.OutOfCombatValue = "True"
    else
        hearthbag.combatOptions.OutOfCombatValue = "False"
    end
    GameTooltip:SetText("Show Combat Frame outside of Combat: |cff4fe6fc" .. hearthbag.combatOptions.OutOfCombatValue .. "|r", 1, 1, 1, 1, true);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG1", "TOPLEFT", 0, 0);
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
    if GameTooltip:IsShown() == false then
        GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.inCombatOptions);
        GameTooltip:ClearAllPoints();
    end

    if HearthDB.INCOMBATFRAME_SHOW == true then
        hearthbag.inCombatOptions.InCombatValue = "True"
    else
        hearthbag.inCombatOptions.InCombatValue = "False"
    end
    GameTooltip:SetText("Show Combat Frame during Combat: |cff4fe6fc" .. hearthbag.inCombatOptions.InCombatValue .. "|r", 1, 1, 1, 1, true);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG2", "TOPLEFT", 0, 0);
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
    if GameTooltip:IsShown() == false then
        GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.scalingOptions);
        GameTooltip:ClearAllPoints();
    end

    if HearthDB.SCALING == true then
        hearthbag.scalingOptions.Value = "True"
    else
        hearthbag.scalingOptions.Value = "False"
    end
    GameTooltip:SetText("Allow scaling the button frame: |cff4fe6fc" .. hearthbag.scalingOptions.Value .. "|r", 1, 1, 1, 1, true);
    GameTooltip:SetPoint("BOTTOMRIGHT", "CheckBoxBG3", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.CheckButton3Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.scalingOptions:SetScript("OnClick", hearthbag.CheckButton3Up_OnClick);
hearthbag.scalingOptions:SetScript("OnShow", hearthbag.CheckButton3Status_OnShow);
hearthbag.scalingOptions:SetScript("OnEnter", hearthbag.CheckButton3Tooltip_OnEnter);
hearthbag.scalingOptions:SetScript("OnLeave", hearthbag.CheckButton3Tooltip_OnLeave);











---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------


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
    buttonContainer.FrameLevelChildren()
end

function hearthbag.RandomSoundButton_Down()
    PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\ButtonDown" .. math.random(1, 4) ..  ".ogg", "SFX");
end

function hearthbag.RandomSoundButton_Up()
    PlaySoundFile("Interface\\AddOns\\Hearthbag\\Sounds\\Button" .. math.random(1, 4) ..  ".ogg", "SFX");
end

-- (PlayerHasToy(HearthDB.ITEM) == true)
-- (C_ToyBox.IsToyUsable(HearthDB.ITEM) == true)
-- controls the behaviour of Hearthbag
function hearthbag.hearthBag_OnMouseDown(self, button)  -- controls the mouse down behaviour, including the "down" texture
    local duration = GetSpellCooldown(HearthDB.SPELLID);
    local CastingHearth = select(8,UnitCastingInfo("player"));  -- I refuse to use == 1 for the item count because it may be possible to glitch the game and grab 2+ hearthstones
    if ( (HearthDB.ITEM == ITEM_LIST.defaultHearthstone) or (HearthDB.ITEM == ITEM_LIST.rubySlippers) or (HearthDB.ITEM == ITEM_LIST.scarletSlippers) ) then
        if ((GetItemCount(HearthDB.ITEM) > 0) and (button == "LeftButton") and (duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DOWN);
            hearthbag.RandomSoundButton_Down();   -- selects from a random number of sounds
        elseif (GetItemCount(HearthDB.ITEM) > 0) then   -- if the item exists but doesn't fullfil above criteria
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
        else                                    -- if the item does not exist or turns up nil
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    else
        if ((PlayerHasToy(HearthDB.ITEM) == true) and (button == "LeftButton") and (duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DOWN);
            hearthbag.RandomSoundButton_Down();   -- selects from a random number of sounds
        elseif (PlayerHasToy(HearthDB.ITEM) == true) then   -- if the item exists but doesn't fullfil above criteria
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
        else                                    -- if the item does not exist or turns up nil
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    end
    if button == "RightButton" and HearthDB.INHERIT == true then
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
        --ContainerFramePortraitButtonMixin.OnMouseDown(ContainerFrame1PortraitButton) -- also causes taint too
        --(ContainerFrame1PortraitButton:GetScript('OnMouseDown'))(ContainerFrame1PortraitButton) -- also causes taint
        --ContainerFrameCombinedBagsPortraitButton:Click()
        --ContainerFramePortraitButtonMixin:OnMouseDown()
        --ToggleDropDownMenu(1, nil, ContainerFrame1.FilterDropDown, self, 0, 0); -- causes taint
        if GetCVarBool("combinedBags") == true then
            ToggleDropDownMenu(1, nil, ContainerFrameCombinedBags.FilterDropDown, self, 0, 0); -- causes taint
        elseif GetCVarBool("combinedBags") == false then 
            ToggleDropDownMenu(1, nil, ContainerFrame1.FilterDropDown, self, 0, 0); -- causes taint
        else
            return
        end
    end
end
-- controls the mouse up behaviour, similar to mousedown function
function hearthbag.hearthBag_OnMouseUp()
    local duration = GetSpellCooldown(HearthDB.SPELLID);
    local CastingHearth = select(8,UnitCastingInfo("player"));
    if ( (HearthDB.ITEM == ITEM_LIST.defaultHearthstone) or (HearthDB.ITEM == ITEM_LIST.rubySlippers) or (HearthDB.ITEM == ITEM_LIST.scarletSlippers) ) then
        if (GetItemCount(HearthDB.ITEM) > 0) then
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
            if ((duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
                hearthbag.RandomSoundButton_Up();
            end
        else
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    else
        if (PlayerHasToy(HearthDB.ITEM) == true) then
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.UP);
            if ((duration == 0) and (CastingHearth ~= HearthDB.SPELLID) and (UnitOnTaxi("player") == false) and (IsPlayerMoving() == false) and (IsFalling() == false)) then
                hearthbag.RandomSoundButton_Up();
            end
        else
            hearthbag.background:SetTexture(HearthDB.APPEARANCE.DESAT);
        end
    end
end
-- this also sets the texture upon login
function hearthbag.hearthDestroyed()
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
        GameTooltip:AddLine(string.gsub(CLICK_BAG_SETTINGS, "Click", "Right-Click"), 1, 1, 1, true);
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
hearthbag.itemHolderFrame:SetSize(250, 180);
hearthbag.itemHolderFrame:SetPoint("CENTER", 0, -92);

hearthbag.itemHolderFrameTex = hearthbag.itemHolderFrame:CreateTexture("ItemHolderFrameTex", "BACKGROUND");
hearthbag.itemHolderFrameTex:SetPoint("CENTER");
hearthbag.itemHolderFrameTex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.itemHolderFrameTex:SetDrawLayer("Background", 0);
hearthbag.itemHolderFrameTex:SetAllPoints(hearthbag.itemHolderFrame);
--hearthbag.itemHolderFrameTex:Hide();


function hearthbag.CompleteHearthTexture()
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
hearthbag.option0 = CreateFrame("Button", "HearthbagOption0", hearthbag.itemHolderFrame, nil);
hearthbag.option0:SetSize(25, 25);
hearthbag.option0:SetPoint("LEFT", 60, 57);
hearthbag.option0:SetNormalTexture(TEXTURE_LIST.hearthDefaultTex);
hearthbag.option0:SetPushedTexture(TEXTURE_LIST.hearthDownTex);

function hearthbag.option0:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthDefaultTex
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthDownTex
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthCooldownTex
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthDesatTex
    HearthDB.ITEM = ITEM_LIST.defaultHearthstone
    HearthDB.SPELLID = ITEM_LIST.defaultHearthstoneSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.option0:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.option0);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetItemByID(ITEM_LIST.defaultHearthstone)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOption0", "TOPLEFT", 0, 0);
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





-- Dalaran Hearthstone
hearthbag.dalaranHearth = CreateFrame("Button", "DalaranHearth", hearthbag.option0, "SecureActionButtonTemplate");
hearthbag.dalaranHearth:SetSize(25, 25);
hearthbag.dalaranHearth:SetPoint("LEFT", 27, 0);
hearthbag.dalaranHearth:SetNormalTexture(TEXTURE_LIST.hearthDalaranUp);
hearthbag.dalaranHearth:SetPushedTexture(TEXTURE_LIST.hearthDalaranDown);

function hearthbag.dalaranHearth:SetItem_OnEvent()
    if InCombatLockdown() == true then
        C_Timer.After(1, hearthbag.dalaranHearth.SetItem_OnEvent)
    else
        hearthbag.dalaranHearth.ItemID = select(1, GetItemInfo(ITEM_LIST.dalaran))
        hearthbag.dalaranHearth:SetAttribute("*type1", "item")
        hearthbag.dalaranHearth:SetAttribute("item", hearthbag.dalaranHearth.ItemID)
    end
end

function hearthbag.dalaranHearth:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.dalaranHearth);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetItemByID(ITEM_LIST.dalaran)
    GameTooltip:SetPoint("BOTTOMRIGHT", "DalaranHearth", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.dalaranHearth:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.dalaranHearth:RegisterEvent("PLAYER_ENTERING_WORLD");
hearthbag.dalaranHearth:SetScript("OnEnter", hearthbag.dalaranHearth.Tooltip_OnEnter);
hearthbag.dalaranHearth:SetScript("OnLeave", hearthbag.dalaranHearth.Tooltip_OnLeave);
hearthbag.dalaranHearth:SetScript("OnEvent", hearthbag.dalaranHearth.SetItem_OnEvent);

hearthbag.dalaranHearth.hearthCD = CreateFrame("Cooldown", "DalHearthCD", hearthbag.dalaranHearth, "CooldownFrameTemplate");
hearthbag.dalaranHearth.hearthCD:SetUseCircularEdge(true); -- makes the cooldown edge circular
hearthbag.dalaranHearth.hearthCD:SetSwipeTexture(TEXTURE_LIST.hearthDalaranCD); -- set the cooldown texture to be the rune
hearthbag.dalaranHearth.hearthCD:SetSwipeColor(0.2,0.2,0.2,1.0); -- set the RGB of the rune to ~20% "brightness" (makes it dark)
hearthbag.dalaranHearth.hearthCD:SetDrawEdge(true); -- shows the blip on the CD
hearthbag.dalaranHearth.hearthCD:SetEdgeTexture(HearthDB.APPEARANCE.BLIP,1.0,1.0,1.0,1.0); -- makes the blip as bright as possible
--hearthbag.dalaranHearth.hearthCD:SetRotation(-2.22); -- rotates the whole cooldown rune so that the tail end of the rune will fill out last. ~ -127 degrees

 -- checks the cooldown on the hearthstone spell portion of the item
function hearthbag.dalaranHearth.hearthCD:hearthCheck()
    local startTime, duration = GetItemCooldown(ITEM_LIST.dalaran);
    if duration ~= 0 then
        hearthbag.dalaranHearth.hearthCD:SetCooldown(startTime, duration);
    end
end

hearthbag.dalaranHearth.hearthCD:RegisterEvent("SPELL_UPDATE_COOLDOWN"); -- hearthstone effect is technically a spell
hearthbag.dalaranHearth.hearthCD:RegisterEvent("PLAYER_ENTERING_WORLD"); -- to ensure the cooldown is calculated upon login
hearthbag.dalaranHearth.hearthCD:RegisterEvent("BAG_UPDATE_COOLDOWN"); -- just in case spell doesn't do the thing
hearthbag.dalaranHearth.hearthCD:RegisterEvent("BAG_UPDATE"); -- this fires a lot
hearthbag.dalaranHearth.hearthCD:SetScript("OnEvent", hearthbag.dalaranHearth.hearthCD.hearthCheck);

hearthbag.dalaranHearth.collected = CreateFrame("Frame", nil, hearthbag.dalaranHearth, nil);
hearthbag.dalaranHearth.collected:SetSize(10, 10);
hearthbag.dalaranHearth.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.dalaranHearth.collected.tex = hearthbag.dalaranHearth.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.dalaranHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.dalaranHearth.collected.tex:SetAllPoints(hearthbag.dalaranHearth.collected);

function hearthbag.dalaranHearth.collected:CollectionCheck()
    if GetItemCount(ITEM_LIST.dalaran) >= 1 then
        hearthbag.dalaranHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.dalaranHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.dalaranHearth:RegisterEvent("TOYS_UPDATED");
hearthbag.dalaranHearth:RegisterEvent("BAG_UPDATE");
hearthbag.dalaranHearth:HookScript("OnEvent", hearthbag.dalaranHearth.collected.CollectionCheck);





-- Garrison Hearthstone
hearthbag.garrisonHearth = CreateFrame("Button", "GarrisonHearth", hearthbag.dalaranHearth, "SecureActionButtonTemplate");
hearthbag.garrisonHearth:SetSize(25, 25);
hearthbag.garrisonHearth:SetPoint("LEFT", 27, 0);
hearthbag.garrisonHearth:SetNormalTexture(TEXTURE_LIST.hearthGarrisonUp);
hearthbag.garrisonHearth:SetPushedTexture(TEXTURE_LIST.hearthGarrisonDown);

function hearthbag.garrisonHearth:SetItem_OnEvent()
    if InCombatLockdown() == true then
        C_Timer.After(1, hearthbag.garrisonHearth.SetItem_OnEvent)
    else
        hearthbag.garrisonHearth.ItemID = select(1, GetItemInfo(ITEM_LIST.garrison))
        hearthbag.garrisonHearth:SetAttribute("*type1", "item")
        hearthbag.garrisonHearth:SetAttribute("item", hearthbag.garrisonHearth.ItemID)
    end
end

function hearthbag.garrisonHearth:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.garrisonHearth);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetItemByID(ITEM_LIST.garrison)
    GameTooltip:SetPoint("BOTTOMRIGHT", "GarrisonHearth", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.garrisonHearth:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.garrisonHearth:RegisterEvent("PLAYER_ENTERING_WORLD");
hearthbag.garrisonHearth:SetScript("OnEnter", hearthbag.garrisonHearth.Tooltip_OnEnter);
hearthbag.garrisonHearth:SetScript("OnLeave", hearthbag.garrisonHearth.Tooltip_OnLeave);
hearthbag.garrisonHearth:SetScript("OnEvent", hearthbag.garrisonHearth.SetItem_OnEvent);

hearthbag.garrisonHearth.hearthCD = CreateFrame("Cooldown", "GarHearthCD", hearthbag.garrisonHearth, "CooldownFrameTemplate");
hearthbag.garrisonHearth.hearthCD:SetUseCircularEdge(true); -- makes the cooldown edge circular
hearthbag.garrisonHearth.hearthCD:SetSwipeTexture(TEXTURE_LIST.hearthGarrisonCD); -- set the cooldown texture to be the rune
hearthbag.garrisonHearth.hearthCD:SetSwipeColor(0.2,0.2,0.2,1.0); -- set the RGB of the rune to ~20% "brightness" (makes it dark)
hearthbag.garrisonHearth.hearthCD:SetDrawEdge(true); -- shows the blip on the CD
hearthbag.garrisonHearth.hearthCD:SetEdgeTexture(HearthDB.APPEARANCE.BLIP,1.0,1.0,1.0,1.0); -- makes the blip as bright as possible
hearthbag.garrisonHearth.hearthCD:SetRotation(-5.13); -- rotates the whole cooldown rune so that the tail end of the rune will fill out last. ~ -127 degrees

 -- checks the cooldown on the hearthstone spell portion of the item
function hearthbag.garrisonHearth.hearthCD:hearthCheck()
    local startTime, duration = GetItemCooldown(ITEM_LIST.garrison);
    if duration ~= 0 then
        hearthbag.garrisonHearth.hearthCD:SetCooldown(startTime, duration);
    end
end

hearthbag.garrisonHearth.hearthCD:RegisterEvent("SPELL_UPDATE_COOLDOWN"); -- hearthstone effect is technically a spell
hearthbag.garrisonHearth.hearthCD:RegisterEvent("PLAYER_ENTERING_WORLD"); -- to ensure the cooldown is calculated upon login
hearthbag.garrisonHearth.hearthCD:RegisterEvent("BAG_UPDATE_COOLDOWN"); -- just in case spell doesn't do the thing
hearthbag.garrisonHearth.hearthCD:RegisterEvent("BAG_UPDATE"); -- this fires a lot
hearthbag.garrisonHearth.hearthCD:SetScript("OnEvent", hearthbag.garrisonHearth.hearthCD.hearthCheck);


hearthbag.garrisonHearth.collected = CreateFrame("Frame", nil, hearthbag.garrisonHearth, nil);
hearthbag.garrisonHearth.collected:SetSize(10, 10);
hearthbag.garrisonHearth.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.garrisonHearth.collected.tex = hearthbag.garrisonHearth.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.garrisonHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.garrisonHearth.collected.tex:SetAllPoints(hearthbag.garrisonHearth.collected);

function hearthbag.garrisonHearth.collected:CollectionCheck()
    if GetItemCount(ITEM_LIST.garrison) >= 1 then
        hearthbag.garrisonHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.garrisonHearth.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.garrisonHearth:RegisterEvent("TOYS_UPDATED");
hearthbag.garrisonHearth:RegisterEvent("BAG_UPDATE");
hearthbag.garrisonHearth:HookScript("OnEvent", hearthbag.garrisonHearth.collected.CollectionCheck);





-- Ruby Slippers
hearthbag.rubySlippers = CreateFrame("Button", "HearthbagRubySlippers", hearthbag.garrisonHearth, nil);
hearthbag.rubySlippers:SetSize(25, 25);
hearthbag.rubySlippers:SetPoint("LEFT", 27, 0);
hearthbag.rubySlippers:SetNormalTexture(TEXTURE_LIST.hearthKaraUp);
hearthbag.rubySlippers:SetPushedTexture(TEXTURE_LIST.hearthKaraDown);

function hearthbag.rubySlippers:SetHearthTexture_ONCLICK()
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
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.rubySlippers:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.rubySlippers);
    GameTooltip:ClearAllPoints();
    if GetItemCount(ITEM_LIST.scarletSlippers) >= 1 then
        GameTooltip:SetItemByID(ITEM_LIST.scarletSlippers)
    else
        GameTooltip:SetItemByID(ITEM_LIST.rubySlippers)
    end
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagRubySlippers", "TOPLEFT", 0, 0);
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
hearthbag.rubySlippers.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.rubySlippers.collected.tex:SetAllPoints(hearthbag.rubySlippers.collected);

function hearthbag.rubySlippers.collected:CollectionCheck()
    if GetItemCount(ITEM_LIST.scarletSlippers) >= 1 then
        hearthbag.rubySlippers.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    elseif GetItemCount(ITEM_LIST.rubySlippers) >= 1 then
        hearthbag.rubySlippers.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.rubySlippers.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.rubySlippers:RegisterEvent("TOYS_UPDATED");
hearthbag.rubySlippers:RegisterEvent("BAG_UPDATE");
hearthbag.rubySlippers:SetScript("OnEvent", hearthbag.rubySlippers.collected.CollectionCheck);





-- Timewalker (Dragonflight Preorder)
hearthbag.timewalker = CreateFrame("Button", "HearthbagTimewalker", hearthbag.rubySlippers, nil);
hearthbag.timewalker:SetSize(25, 25);
hearthbag.timewalker:SetPoint("LEFT", 27, 0);
hearthbag.timewalker:SetNormalTexture(TEXTURE_LIST.hearthTimewalkerUp);
hearthbag.timewalker:SetPushedTexture(TEXTURE_LIST.hearthTimewalkerDown);

function hearthbag.timewalker:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthTimewalkerUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthTimewalkerDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthTimewalkerCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthTimewalkerDesat
    HearthDB.ITEM = ITEM_LIST.timewalker
    HearthDB.SPELLID = ITEM_LIST.timewalkerSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.timewalker:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.timewalker);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.timewalker)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagTimewalker", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.timewalker:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.timewalker:SetScript("OnClick", hearthbag.timewalker.SetHearthTexture_ONCLICK);
hearthbag.timewalker:SetScript("OnEnter", hearthbag.timewalker.Tooltip_OnEnter);
hearthbag.timewalker:SetScript("OnLeave", hearthbag.timewalker.Tooltip_OnLeave);

hearthbag.timewalker.collected = CreateFrame("Frame", nil, hearthbag.timewalker, nil);
hearthbag.timewalker.collected:SetSize(10, 10);
hearthbag.timewalker.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.timewalker.collected.tex = hearthbag.timewalker.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.timewalker.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.timewalker.collected.tex:SetAllPoints(hearthbag.timewalker.collected);

function hearthbag.timewalker.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.timewalker) == true then
        hearthbag.timewalker.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.timewalker.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.timewalker:RegisterEvent("TOYS_UPDATED");
hearthbag.timewalker:RegisterEvent("BAG_UPDATE");
hearthbag.timewalker:HookScript("OnEvent", hearthbag.timewalker.collected.CollectionCheck);





-- Covenants Updated - Kyrian
hearthbag.kyrian = CreateFrame("Button", "HearthbagKyrian", hearthbag.option0, nil);
hearthbag.kyrian:SetSize(25, 25);
hearthbag.kyrian:SetPoint("LEFT", 0, -27);
hearthbag.kyrian:SetNormalTexture(TEXTURE_LIST.hearthKyrianUp);
hearthbag.kyrian:SetPushedTexture(TEXTURE_LIST.hearthKyrianDown);

function hearthbag.kyrian:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthKyrianUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthKyrianDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthKyrianCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthKyrianDesat
    HearthDB.ITEM = ITEM_LIST.kyrian
    HearthDB.SPELLID = ITEM_LIST.kyrianSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.kyrian:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.kyrian);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.kyrian)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagKyrian", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.kyrian:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.kyrian:SetScript("OnClick", hearthbag.kyrian.SetHearthTexture_ONCLICK);
hearthbag.kyrian:SetScript("OnEnter", hearthbag.kyrian.Tooltip_OnEnter);
hearthbag.kyrian:SetScript("OnLeave", hearthbag.kyrian.Tooltip_OnLeave);

hearthbag.kyrian.collected = CreateFrame("Frame", nil, hearthbag.kyrian, nil);
hearthbag.kyrian.collected:SetSize(10, 10);
hearthbag.kyrian.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.kyrian.collected.tex = hearthbag.kyrian.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.kyrian.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.kyrian.collected.tex:SetAllPoints(hearthbag.kyrian.collected);

function hearthbag.kyrian.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.kyrian) == true then
        hearthbag.kyrian.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.kyrian.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.kyrian:RegisterEvent("TOYS_UPDATED");
hearthbag.kyrian:RegisterEvent("BAG_UPDATE");
hearthbag.kyrian:HookScript("OnEvent", hearthbag.kyrian.collected.CollectionCheck);





-- Covenants Updated - Necrolord
hearthbag.necrolord = CreateFrame("Button", "HearthbagNecro", hearthbag.kyrian, nil);
hearthbag.necrolord:SetSize(25, 25);
hearthbag.necrolord:SetPoint("LEFT", 27, 0);
hearthbag.necrolord:SetNormalTexture(TEXTURE_LIST.hearthNecroUp);
hearthbag.necrolord:SetPushedTexture(TEXTURE_LIST.hearthNecroDown);

function hearthbag.necrolord:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthNecroUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthNecroDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthNecroCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthNecroDesat
    HearthDB.ITEM = ITEM_LIST.necrolord
    HearthDB.SPELLID = ITEM_LIST.necrolordSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.necrolord:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.necrolord);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.necrolord)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagNecro", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.necrolord:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.necrolord:SetScript("OnClick", hearthbag.necrolord.SetHearthTexture_ONCLICK);
hearthbag.necrolord:SetScript("OnEnter", hearthbag.necrolord.Tooltip_OnEnter);
hearthbag.necrolord:SetScript("OnLeave", hearthbag.necrolord.Tooltip_OnLeave);

hearthbag.necrolord.collected = CreateFrame("Frame", nil, hearthbag.necrolord, nil);
hearthbag.necrolord.collected:SetSize(10, 10);
hearthbag.necrolord.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.necrolord.collected.tex = hearthbag.necrolord.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.necrolord.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.necrolord.collected.tex:SetAllPoints(hearthbag.necrolord.collected);

function hearthbag.necrolord.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.necrolord) == true then
        hearthbag.necrolord.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.necrolord.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.necrolord:RegisterEvent("TOYS_UPDATED");
hearthbag.necrolord:RegisterEvent("BAG_UPDATE");
hearthbag.necrolord:HookScript("OnEvent", hearthbag.necrolord.collected.CollectionCheck);





-- Covenants Updated - Ardenweald
hearthbag.ardenweald = CreateFrame("Button", "HearthbagArden", hearthbag.necrolord, nil);
hearthbag.ardenweald:SetSize(25, 25);
hearthbag.ardenweald:SetPoint("LEFT", 27, 0);
hearthbag.ardenweald:SetNormalTexture(TEXTURE_LIST.hearthArdenUp);
hearthbag.ardenweald:SetPushedTexture(TEXTURE_LIST.hearthArdenDown);

function hearthbag.ardenweald:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthArdenUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthArdenDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthArdenCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthArdenDesat
    HearthDB.ITEM = ITEM_LIST.ardenweald
    HearthDB.SPELLID = ITEM_LIST.ardenwealdSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.ardenweald:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.ardenweald);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.ardenweald)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagArden", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.ardenweald:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.ardenweald:SetScript("OnClick", hearthbag.ardenweald.SetHearthTexture_ONCLICK);
hearthbag.ardenweald:SetScript("OnEnter", hearthbag.ardenweald.Tooltip_OnEnter);
hearthbag.ardenweald:SetScript("OnLeave", hearthbag.ardenweald.Tooltip_OnLeave);

hearthbag.ardenweald.collected = CreateFrame("Frame", nil, hearthbag.ardenweald, nil);
hearthbag.ardenweald.collected:SetSize(10, 10);
hearthbag.ardenweald.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.ardenweald.collected.tex = hearthbag.ardenweald.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.ardenweald.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.ardenweald.collected.tex:SetAllPoints(hearthbag.ardenweald.collected);

function hearthbag.ardenweald.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.ardenweald) == true then
        hearthbag.ardenweald.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.ardenweald.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.ardenweald:RegisterEvent("TOYS_UPDATED");
hearthbag.ardenweald:RegisterEvent("BAG_UPDATE");
hearthbag.ardenweald:HookScript("OnEvent", hearthbag.ardenweald.collected.CollectionCheck);





-- Covenants Updated - Venthyr
hearthbag.venthyr = CreateFrame("Button", "HearthbagVenthyr", hearthbag.ardenweald, nil);
hearthbag.venthyr:SetSize(25, 25);
hearthbag.venthyr:SetPoint("LEFT", 27, 0);
hearthbag.venthyr:SetNormalTexture(TEXTURE_LIST.hearthVenthyrUp);
hearthbag.venthyr:SetPushedTexture(TEXTURE_LIST.hearthVenthyrDown);

function hearthbag.venthyr:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthVenthyrUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthVenthyrDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthVenthyrCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthVenthyrDesat
    HearthDB.ITEM = ITEM_LIST.venthyr
    HearthDB.SPELLID = ITEM_LIST.venthyrSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.venthyr:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.venthyr);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.venthyr)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagVenthyr", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.venthyr:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.venthyr:SetScript("OnClick", hearthbag.venthyr.SetHearthTexture_ONCLICK);
hearthbag.venthyr:SetScript("OnEnter", hearthbag.venthyr.Tooltip_OnEnter);
hearthbag.venthyr:SetScript("OnLeave", hearthbag.venthyr.Tooltip_OnLeave);

hearthbag.venthyr.collected = CreateFrame("Frame", nil, hearthbag.venthyr, nil);
hearthbag.venthyr.collected:SetSize(10, 10);
hearthbag.venthyr.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.venthyr.collected.tex = hearthbag.venthyr.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.venthyr.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.venthyr.collected.tex:SetAllPoints(hearthbag.venthyr.collected);

function hearthbag.venthyr.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.venthyr) == true then
        hearthbag.venthyr.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.venthyr.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.venthyr:RegisterEvent("TOYS_UPDATED");
hearthbag.venthyr:RegisterEvent("BAG_UPDATE");
hearthbag.venthyr:HookScript("OnEvent", hearthbag.venthyr.collected.CollectionCheck);





-- Torghast
hearthbag.torghast = CreateFrame("Button", "HearthbagTorghast", hearthbag.venthyr, nil);
hearthbag.torghast:SetSize(25, 25);
hearthbag.torghast:SetPoint("LEFT", 27, 0);
hearthbag.torghast:SetNormalTexture(TEXTURE_LIST.hearthTorghastUp);
hearthbag.torghast:SetPushedTexture(TEXTURE_LIST.hearthTorghastDown);

function hearthbag.torghast:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthTorghastUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthTorghastDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthTorghastCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthTorghastDesat
    HearthDB.ITEM = ITEM_LIST.torghast
    HearthDB.SPELLID = ITEM_LIST.torghastSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.torghast:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.torghast);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.torghast)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagTorghast", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.torghast:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.torghast:SetScript("OnClick", hearthbag.torghast.SetHearthTexture_ONCLICK);
hearthbag.torghast:SetScript("OnEnter", hearthbag.torghast.Tooltip_OnEnter);
hearthbag.torghast:SetScript("OnLeave", hearthbag.torghast.Tooltip_OnLeave);

hearthbag.torghast.collected = CreateFrame("Frame", nil, hearthbag.torghast, nil);
hearthbag.torghast.collected:SetSize(10, 10);
hearthbag.torghast.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.torghast.collected.tex = hearthbag.torghast.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.torghast.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.torghast.collected.tex:SetAllPoints(hearthbag.torghast.collected);

function hearthbag.torghast.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.torghast) == true then
        hearthbag.torghast.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.torghast.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.torghast:RegisterEvent("TOYS_UPDATED");
hearthbag.torghast:RegisterEvent("BAG_UPDATE");
hearthbag.torghast:HookScript("OnEvent", hearthbag.torghast.collected.CollectionCheck);



-- Centaur
hearthbag.centaur = CreateFrame("Button", "HearthbagCentaur", hearthbag.kyrian, nil);
hearthbag.centaur:SetSize(25, 25);
hearthbag.centaur:SetPoint("LEFT", 0, -27);
hearthbag.centaur:SetNormalTexture(TEXTURE_LIST.hearthCentaurUp);
hearthbag.centaur:SetPushedTexture(TEXTURE_LIST.hearthCentaurDown);

function hearthbag.centaur:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthCentaurUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthCentaurDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthCentaurCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthCentaurDesat
    HearthDB.ITEM = ITEM_LIST.centaur
    HearthDB.SPELLID = ITEM_LIST.centaurSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.centaur:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.centaur);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.centaur)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagCentaur", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.centaur:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.centaur:SetScript("OnClick", hearthbag.centaur.SetHearthTexture_ONCLICK);
hearthbag.centaur:SetScript("OnEnter", hearthbag.centaur.Tooltip_OnEnter);
hearthbag.centaur:SetScript("OnLeave", hearthbag.centaur.Tooltip_OnLeave);

hearthbag.centaur.collected = CreateFrame("Frame", nil, hearthbag.centaur, nil);
hearthbag.centaur.collected:SetSize(10, 10);
hearthbag.centaur.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.centaur.collected.tex = hearthbag.centaur.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.centaur.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.centaur.collected.tex:SetAllPoints(hearthbag.centaur.collected);

function hearthbag.centaur.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.centaur) == true then
        hearthbag.centaur.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.centaur.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.centaur:RegisterEvent("TOYS_UPDATED");
hearthbag.centaur:RegisterEvent("BAG_UPDATE");
hearthbag.centaur:HookScript("OnEvent", hearthbag.centaur.collected.CollectionCheck);




-- Broker
hearthbag.broker = CreateFrame("Button", "HearthbagBroker", hearthbag.centaur, nil);
hearthbag.broker:SetSize(25, 25);
hearthbag.broker:SetPoint("LEFT", 27, 0);
hearthbag.broker:SetNormalTexture(TEXTURE_LIST.hearthBrokerUp);
hearthbag.broker:SetPushedTexture(TEXTURE_LIST.hearthBrokerDown);

function hearthbag.broker:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthBrokerUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthBrokerDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthBrokerCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthBrokerDesat
    HearthDB.ITEM = ITEM_LIST.broker
    HearthDB.SPELLID = ITEM_LIST.brokerSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.broker:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.broker);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.broker)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagBroker", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.broker:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.broker:SetScript("OnClick", hearthbag.broker.SetHearthTexture_ONCLICK);
hearthbag.broker:SetScript("OnEnter", hearthbag.broker.Tooltip_OnEnter);
hearthbag.broker:SetScript("OnLeave", hearthbag.broker.Tooltip_OnLeave);

hearthbag.broker.collected = CreateFrame("Frame", nil, hearthbag.broker, nil);
hearthbag.broker.collected:SetSize(10, 10);
hearthbag.broker.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.broker.collected.tex = hearthbag.broker.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.broker.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.broker.collected.tex:SetAllPoints(hearthbag.broker.collected);

function hearthbag.broker.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.broker) == true then
        hearthbag.broker.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.broker.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.broker:RegisterEvent("TOYS_UPDATED");
hearthbag.broker:RegisterEvent("BAG_UPDATE");
hearthbag.broker:HookScript("OnEvent", hearthbag.broker.collected.CollectionCheck);




-- Oribos
hearthbag.oribos = CreateFrame("Button", "HearthbagOribos", hearthbag.broker, nil);
hearthbag.oribos:SetSize(25, 25);
hearthbag.oribos:SetPoint("LEFT", 27, 0);
hearthbag.oribos:SetNormalTexture(TEXTURE_LIST.hearthOribosUp);
hearthbag.oribos:SetPushedTexture(TEXTURE_LIST.hearthOribosDown);

function hearthbag.oribos:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthOribosUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthOribosDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthOribosCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthOribosDesat
    HearthDB.ITEM = ITEM_LIST.oribos
    HearthDB.SPELLID = ITEM_LIST.oribosSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.oribos:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.oribos);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.oribos)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagOribos", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.oribos:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.oribos:SetScript("OnClick", hearthbag.oribos.SetHearthTexture_ONCLICK);
hearthbag.oribos:SetScript("OnEnter", hearthbag.oribos.Tooltip_OnEnter);
hearthbag.oribos:SetScript("OnLeave", hearthbag.oribos.Tooltip_OnLeave);

hearthbag.oribos.collected = CreateFrame("Frame", nil, hearthbag.oribos, nil);
hearthbag.oribos.collected:SetSize(10, 10);
hearthbag.oribos.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.oribos.collected.tex = hearthbag.oribos.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.oribos.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.oribos.collected.tex:SetAllPoints(hearthbag.oribos.collected);

function hearthbag.oribos.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.oribos) == true then
        hearthbag.oribos.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.oribos.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.oribos:RegisterEvent("TOYS_UPDATED");
hearthbag.oribos:RegisterEvent("BAG_UPDATE");
hearthbag.oribos:SetScript("OnEvent", hearthbag.oribos.collected.CollectionCheck);





-- Mechagon
hearthbag.mechagon = CreateFrame("Button", "HearthbagMechagon", hearthbag.oribos, nil);
hearthbag.mechagon:SetSize(25, 25);
hearthbag.mechagon:SetPoint("LEFT", 27, 0);
hearthbag.mechagon:SetNormalTexture(TEXTURE_LIST.hearthMechagonUp);
hearthbag.mechagon:SetPushedTexture(TEXTURE_LIST.hearthMechagonDown);

function hearthbag.mechagon:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthMechagonUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthMechagonDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthMechagonCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthMechagonDesat
    HearthDB.ITEM = ITEM_LIST.mechagon
    HearthDB.SPELLID = ITEM_LIST.mechagonSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.mechagon:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.mechagon);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.mechagon)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagMechagon", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.mechagon:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.mechagon:SetScript("OnClick", hearthbag.mechagon.SetHearthTexture_ONCLICK);
hearthbag.mechagon:SetScript("OnEnter", hearthbag.mechagon.Tooltip_OnEnter);
hearthbag.mechagon:SetScript("OnLeave", hearthbag.mechagon.Tooltip_OnLeave);

hearthbag.mechagon.collected = CreateFrame("Frame", nil, hearthbag.mechagon, nil);
hearthbag.mechagon.collected:SetSize(10, 10);
hearthbag.mechagon.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.mechagon.collected.tex = hearthbag.mechagon.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.mechagon.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.mechagon.collected.tex:SetAllPoints(hearthbag.mechagon.collected);

function hearthbag.mechagon.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.mechagon) == true then
        hearthbag.mechagon.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.mechagon.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.mechagon:RegisterEvent("TOYS_UPDATED");
hearthbag.mechagon:RegisterEvent("BAG_UPDATE");
hearthbag.mechagon:HookScript("OnEvent", hearthbag.mechagon.collected.CollectionCheck);





-- Innkeeper's Daughter
hearthbag.inndaughter = CreateFrame("Button", "HearthbagInndaughter", hearthbag.mechagon, nil);
hearthbag.inndaughter:SetSize(25, 25);
hearthbag.inndaughter:SetPoint("LEFT", 27, 0);
hearthbag.inndaughter:SetNormalTexture(TEXTURE_LIST.hearthDaughterUp);
hearthbag.inndaughter:SetPushedTexture(TEXTURE_LIST.hearthDaughterDown);

function hearthbag.inndaughter:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthDaughterUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthDaughterDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthDaughterCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthDaughterDesat
    HearthDB.ITEM = ITEM_LIST.inndaughter
    HearthDB.SPELLID = ITEM_LIST.inndaughterSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.inndaughter:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.inndaughter);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.inndaughter)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagInndaughter", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.inndaughter:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.inndaughter:SetScript("OnClick", hearthbag.inndaughter.SetHearthTexture_ONCLICK);
hearthbag.inndaughter:SetScript("OnEnter", hearthbag.inndaughter.Tooltip_OnEnter);
hearthbag.inndaughter:SetScript("OnLeave", hearthbag.inndaughter.Tooltip_OnLeave);

hearthbag.inndaughter.collected = CreateFrame("Frame", nil, hearthbag.inndaughter, nil);
hearthbag.inndaughter.collected:SetSize(10, 10);
hearthbag.inndaughter.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.inndaughter.collected.tex = hearthbag.inndaughter.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.inndaughter.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.inndaughter.collected.tex:SetAllPoints(hearthbag.inndaughter.collected);

function hearthbag.inndaughter.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.inndaughter) == true then
        hearthbag.inndaughter.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.inndaughter.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.inndaughter:RegisterEvent("TOYS_UPDATED");
hearthbag.inndaughter:RegisterEvent("BAG_UPDATE");
hearthbag.inndaughter:SetScript("OnEvent", hearthbag.inndaughter.collected.CollectionCheck);





-- Lunar Festival
hearthbag.lunar = CreateFrame("Button", "HearthbagLunar", hearthbag.centaur, nil);
hearthbag.lunar:SetSize(25, 25);
hearthbag.lunar:SetPoint("LEFT", 0, -27);
hearthbag.lunar:SetNormalTexture(TEXTURE_LIST.hearthLunarUp);
hearthbag.lunar:SetPushedTexture(TEXTURE_LIST.hearthLunarDown);

function hearthbag.lunar:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthLunarUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthLunarDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthLunarCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthLunarDesat
    HearthDB.ITEM = ITEM_LIST.lunar
    HearthDB.SPELLID = ITEM_LIST.lunarSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.lunar:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.lunar);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.lunar)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagLunar", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.lunar:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.lunar:SetScript("OnClick", hearthbag.lunar.SetHearthTexture_ONCLICK);
hearthbag.lunar:SetScript("OnEnter", hearthbag.lunar.Tooltip_OnEnter);
hearthbag.lunar:SetScript("OnLeave", hearthbag.lunar.Tooltip_OnLeave);

hearthbag.lunar.collected = CreateFrame("Frame", nil, hearthbag.lunar, nil);
hearthbag.lunar.collected:SetSize(10, 10);
hearthbag.lunar.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.lunar.collected.tex = hearthbag.lunar.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.lunar.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.lunar.collected.tex:SetAllPoints(hearthbag.lunar.collected);

function hearthbag.lunar.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.lunar) == true then
        hearthbag.lunar.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.lunar.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.lunar:RegisterEvent("TOYS_UPDATED");
hearthbag.lunar:RegisterEvent("BAG_UPDATE");
hearthbag.lunar:HookScript("OnEvent", hearthbag.lunar.collected.CollectionCheck);





-- Love is in the Air
hearthbag.love = CreateFrame("Button", "HearthbagLove", hearthbag.lunar, nil);
hearthbag.love:SetSize(25, 25);
hearthbag.love:SetPoint("LEFT", 27, 0);
hearthbag.love:SetNormalTexture(TEXTURE_LIST.hearthLoveUp);
hearthbag.love:SetPushedTexture(TEXTURE_LIST.hearthLoveDown);

function hearthbag.love:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthLoveUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthLoveDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthLoveCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthLoveDesat
    HearthDB.ITEM = ITEM_LIST.valentine
    HearthDB.SPELLID = ITEM_LIST.valentineSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.love:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.love);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.valentine)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagLove", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.love:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.love:SetScript("OnClick", hearthbag.love.SetHearthTexture_ONCLICK);
hearthbag.love:SetScript("OnEnter", hearthbag.love.Tooltip_OnEnter);
hearthbag.love:SetScript("OnLeave", hearthbag.love.Tooltip_OnLeave);

hearthbag.love.collected = CreateFrame("Frame", nil, hearthbag.love, nil);
hearthbag.love.collected:SetSize(10, 10);
hearthbag.love.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.love.collected.tex = hearthbag.love.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.love.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.love.collected.tex:SetAllPoints(hearthbag.love.collected);

function hearthbag.love.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.valentine) == true then
        hearthbag.love.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.love.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.love:RegisterEvent("TOYS_UPDATED");
hearthbag.love:RegisterEvent("BAG_UPDATE");
hearthbag.love:HookScript("OnEvent", hearthbag.love.collected.CollectionCheck);





-- Noblegarden
hearthbag.noble = CreateFrame("Button", "HearthbagNoble", hearthbag.love, nil);
hearthbag.noble:SetSize(25, 25);
hearthbag.noble:SetPoint("LEFT", 27, 0);
hearthbag.noble:SetNormalTexture(TEXTURE_LIST.hearthNobleUp);
hearthbag.noble:SetPushedTexture(TEXTURE_LIST.hearthNobleDown);

function hearthbag.noble:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthNobleUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthNobleDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthNobleCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthNobleDesat
    HearthDB.ITEM = ITEM_LIST.noblegarden
    HearthDB.SPELLID = ITEM_LIST.nobelgardenSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.noble:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.noble);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.noblegarden)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagNoble", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.noble:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.noble:SetScript("OnClick", hearthbag.noble.SetHearthTexture_ONCLICK);
hearthbag.noble:SetScript("OnEnter", hearthbag.noble.Tooltip_OnEnter);
hearthbag.noble:SetScript("OnLeave", hearthbag.noble.Tooltip_OnLeave);

hearthbag.noble.collected = CreateFrame("Frame", nil, hearthbag.noble, nil);
hearthbag.noble.collected:SetSize(10, 10);
hearthbag.noble.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.noble.collected.tex = hearthbag.noble.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.noble.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.noble.collected.tex:SetAllPoints(hearthbag.noble.collected);

function hearthbag.noble.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.noblegarden) == true then
        hearthbag.noble.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.noble.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.noble:RegisterEvent("TOYS_UPDATED");
hearthbag.noble:RegisterEvent("BAG_UPDATE");
hearthbag.noble:HookScript("OnEvent", hearthbag.noble.collected.CollectionCheck);





-- Midsummer
hearthbag.midsummer = CreateFrame("Button", "HearthbagMidsummer", hearthbag.noble, nil);
hearthbag.midsummer:SetSize(25, 25);
hearthbag.midsummer:SetPoint("LEFT", 27, 0);
hearthbag.midsummer:SetNormalTexture(TEXTURE_LIST.hearthMidsummerUp);
hearthbag.midsummer:SetPushedTexture(TEXTURE_LIST.hearthMidsummerDown);

function hearthbag.midsummer:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthMidsummerUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthMidsummerDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthMidsummerCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthMidsummerDesat
    HearthDB.ITEM = ITEM_LIST.midsummer
    HearthDB.SPELLID = ITEM_LIST.midsummerSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.midsummer:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.midsummer);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.midsummer)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagMidsummer", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.midsummer:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.midsummer:SetScript("OnClick", hearthbag.midsummer.SetHearthTexture_ONCLICK);
hearthbag.midsummer:SetScript("OnEnter", hearthbag.midsummer.Tooltip_OnEnter);
hearthbag.midsummer:SetScript("OnLeave", hearthbag.midsummer.Tooltip_OnLeave);

hearthbag.midsummer.collected = CreateFrame("Frame", nil, hearthbag.midsummer, nil);
hearthbag.midsummer.collected:SetSize(10, 10);
hearthbag.midsummer.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.midsummer.collected.tex = hearthbag.midsummer.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.midsummer.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.midsummer.collected.tex:SetAllPoints(hearthbag.midsummer.collected);

function hearthbag.midsummer.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.midsummer) == true then
        hearthbag.midsummer.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.midsummer.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.midsummer:RegisterEvent("TOYS_UPDATED");
hearthbag.midsummer:RegisterEvent("BAG_UPDATE");
hearthbag.midsummer:SetScript("OnEvent", hearthbag.midsummer.collected.CollectionCheck);





-- Brewfest
hearthbag.brewfest = CreateFrame("Button", "HearthbagBrewfest", hearthbag.midsummer, nil);
hearthbag.brewfest:SetSize(25, 25);
hearthbag.brewfest:SetPoint("LEFT", 27, 0);
hearthbag.brewfest:SetNormalTexture(TEXTURE_LIST.hearthBrewfestUp);
hearthbag.brewfest:SetPushedTexture(TEXTURE_LIST.hearthBrewfestDown);

function hearthbag.brewfest:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthBrewfestUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthBrewfestDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthBrewfestCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthBrewfestDesat
    HearthDB.ITEM = ITEM_LIST.brewfest
    HearthDB.SPELLID = ITEM_LIST.brewfestSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.brewfest:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.brewfest);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.brewfest)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagBrewfest", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.brewfest:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.brewfest:SetScript("OnClick", hearthbag.brewfest.SetHearthTexture_ONCLICK);
hearthbag.brewfest:SetScript("OnEnter", hearthbag.brewfest.Tooltip_OnEnter);
hearthbag.brewfest:SetScript("OnLeave", hearthbag.brewfest.Tooltip_OnLeave);

hearthbag.brewfest.collected = CreateFrame("Frame", nil, hearthbag.brewfest, nil);
hearthbag.brewfest.collected:SetSize(10, 10);
hearthbag.brewfest.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.brewfest.collected.tex = hearthbag.brewfest.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.brewfest.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.brewfest.collected.tex:SetAllPoints(hearthbag.brewfest.collected);

function hearthbag.brewfest.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.brewfest) == true then
        hearthbag.brewfest.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.brewfest.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.brewfest:RegisterEvent("TOYS_UPDATED");
hearthbag.brewfest:RegisterEvent("BAG_UPDATE");
hearthbag.brewfest:SetScript("OnEvent", hearthbag.brewfest.collected.CollectionCheck);





-- Hallow's End
hearthbag.halloween = CreateFrame("Button", "HearthbagHalloween", hearthbag.lunar, nil);
hearthbag.halloween:SetSize(25, 25);
hearthbag.halloween:SetPoint("LEFT", 0, -27);
hearthbag.halloween:SetNormalTexture(TEXTURE_LIST.hearthHalloweenUp);
hearthbag.halloween:SetPushedTexture(TEXTURE_LIST.hearthHalloweenDown);

function hearthbag.halloween:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthHalloweenUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthHalloweenDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthHalloweenCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthHalloweenDesat
    HearthDB.ITEM = ITEM_LIST.halloween
    HearthDB.SPELLID = ITEM_LIST.halloweenSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.halloween:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.halloween);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.halloween)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagHalloween", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.halloween:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.halloween:SetScript("OnClick", hearthbag.halloween.SetHearthTexture_ONCLICK);
hearthbag.halloween:SetScript("OnEnter", hearthbag.halloween.Tooltip_OnEnter);
hearthbag.halloween:SetScript("OnLeave", hearthbag.halloween.Tooltip_OnLeave);

hearthbag.halloween.collected = CreateFrame("Frame", nil, hearthbag.halloween, nil);
hearthbag.halloween.collected:SetSize(10, 10);
hearthbag.halloween.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.halloween.collected.tex = hearthbag.halloween.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.halloween.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.halloween.collected.tex:SetAllPoints(hearthbag.halloween.collected);

function hearthbag.halloween.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.halloween) == true then
        hearthbag.halloween.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.halloween.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.halloween:RegisterEvent("TOYS_UPDATED");
hearthbag.halloween:RegisterEvent("BAG_UPDATE");
hearthbag.halloween:HookScript("OnEvent", hearthbag.halloween.collected.CollectionCheck);





-- Winter's Veil
hearthbag.crimbo = CreateFrame("Button", "HearthbagCrimbo", hearthbag.halloween, nil);
hearthbag.crimbo:SetSize(25, 25);
hearthbag.crimbo:SetPoint("LEFT", 27, 0);
hearthbag.crimbo:SetNormalTexture(TEXTURE_LIST.hearthCrimboUp);
hearthbag.crimbo:SetPushedTexture(TEXTURE_LIST.hearthCrimboDown);

function hearthbag.crimbo:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthCrimboUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthCrimboDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthCrimboCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthCrimboDesat
    HearthDB.ITEM = ITEM_LIST.crimbo
    HearthDB.SPELLID = ITEM_LIST.crimboSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.crimbo:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.crimbo);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.crimbo)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagCrimbo", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.crimbo:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.crimbo:SetScript("OnClick", hearthbag.crimbo.SetHearthTexture_ONCLICK);
hearthbag.crimbo:SetScript("OnEnter", hearthbag.crimbo.Tooltip_OnEnter);
hearthbag.crimbo:SetScript("OnLeave", hearthbag.crimbo.Tooltip_OnLeave);

hearthbag.crimbo.collected = CreateFrame("Frame", nil, hearthbag.crimbo, nil);
hearthbag.crimbo.collected:SetSize(10, 10);
hearthbag.crimbo.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.crimbo.collected.tex = hearthbag.crimbo.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.crimbo.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.crimbo.collected.tex:SetAllPoints(hearthbag.crimbo.collected);

function hearthbag.crimbo.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.crimbo) == true then
        hearthbag.crimbo.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.crimbo.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.crimbo:RegisterEvent("TOYS_UPDATED");
hearthbag.crimbo:RegisterEvent("BAG_UPDATE");
hearthbag.crimbo:SetScript("OnEvent", hearthbag.crimbo.collected.CollectionCheck);





-- Dark Portal TCG
hearthbag.darkportal = CreateFrame("Button", "HearthbagDarkportal", hearthbag.crimbo, nil);
hearthbag.darkportal:SetSize(25, 25);
hearthbag.darkportal:SetPoint("LEFT", 27, 0);
hearthbag.darkportal:SetNormalTexture(TEXTURE_LIST.hearthDarkPortalUp);
hearthbag.darkportal:SetPushedTexture(TEXTURE_LIST.hearthDarkPortalDown);

function hearthbag.darkportal:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthDarkPortalUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthDarkPortalDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthDarkPortalCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthDarkPortalDesat
    HearthDB.ITEM = ITEM_LIST.darkPortal
    HearthDB.SPELLID = ITEM_LIST.darkPortalSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.darkportal:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.darkportal);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.darkPortal)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagDarkportal", "TOPLEFT", 0, 0);
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
hearthbag.darkportal.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.darkportal.collected.tex:SetAllPoints(hearthbag.darkportal.collected);

function hearthbag.darkportal.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.darkPortal) == true then
        hearthbag.darkportal.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.darkportal.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.darkportal:RegisterEvent("TOYS_UPDATED");
hearthbag.darkportal:RegisterEvent("BAG_UPDATE");
hearthbag.darkportal:HookScript("OnEvent", hearthbag.darkportal.collected.CollectionCheck);




-- Diablo
hearthbag.diablo = CreateFrame("Button", "HearthbagDiablo", hearthbag.darkportal, nil);
hearthbag.diablo:SetSize(25, 25);
hearthbag.diablo:SetPoint("LEFT", 27, 0);
hearthbag.diablo:SetNormalTexture(TEXTURE_LIST.hearthDiabloUp);
hearthbag.diablo:SetPushedTexture(TEXTURE_LIST.hearthDiabloDown);

function hearthbag.diablo:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthDiabloUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthDiabloDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthDiabloCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthDiabloDesat
    HearthDB.ITEM = ITEM_LIST.diablo
    HearthDB.SPELLID = ITEM_LIST.diabloSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.diablo:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.diablo);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.diablo)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagDiablo", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.diablo:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.diablo:SetScript("OnClick", hearthbag.diablo.SetHearthTexture_ONCLICK);
hearthbag.diablo:SetScript("OnEnter", hearthbag.diablo.Tooltip_OnEnter);
hearthbag.diablo:SetScript("OnLeave", hearthbag.diablo.Tooltip_OnLeave);

hearthbag.diablo.collected = CreateFrame("Frame", nil, hearthbag.diablo, nil);
hearthbag.diablo.collected:SetSize(10, 10);
hearthbag.diablo.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.diablo.collected.tex = hearthbag.diablo.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.diablo.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.diablo.collected.tex:SetAllPoints(hearthbag.diablo.collected);

function hearthbag.diablo.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.diablo) == true then
        hearthbag.diablo.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.diablo.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.diablo:RegisterEvent("TOYS_UPDATED");
hearthbag.diablo:RegisterEvent("BAG_UPDATE");
hearthbag.diablo:HookScript("OnEvent", hearthbag.diablo.collected.CollectionCheck);




-- Ethereal Portal
hearthbag.ethereal = CreateFrame("Button", "HearthbagEthereal", hearthbag.diablo, nil);
hearthbag.ethereal:SetSize(25, 25);
hearthbag.ethereal:SetPoint("LEFT", 27, 0);
hearthbag.ethereal:SetNormalTexture(TEXTURE_LIST.hearthEtherealUp);
hearthbag.ethereal:SetPushedTexture(TEXTURE_LIST.hearthEtherealDown);

function hearthbag.ethereal:SetHearthTexture_ONCLICK()
    HearthDB.APPEARANCE.UP = TEXTURE_LIST.hearthEtherealUp
    HearthDB.APPEARANCE.DOWN = TEXTURE_LIST.hearthEtherealDown
    HearthDB.APPEARANCE.COOLDOWN = TEXTURE_LIST.hearthEtherealCD
    HearthDB.APPEARANCE.DESAT = TEXTURE_LIST.hearthEtherealDesat
    HearthDB.ITEM = ITEM_LIST.etherealPortal
    HearthDB.SPELLID = ITEM_LIST.etherealPortalSpellID
    hearthbag.CompleteHearthTexture();
    hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
    hearthbag.UpdateItem();
end

function hearthbag.ethereal:Tooltip_OnEnter()
    GameTooltip_SetDefaultAnchor(GameTooltip, hearthbag.ethereal);
    GameTooltip:ClearAllPoints();
    GameTooltip:SetToyByItemID(ITEM_LIST.etherealPortal)
    GameTooltip:SetPoint("BOTTOMRIGHT", "HearthbagEthereal", "TOPLEFT", 0, 0);
    GameTooltip:Show();
end

function hearthbag.ethereal:Tooltip_OnLeave()
    GameTooltip:Hide();
end

hearthbag.ethereal:SetScript("OnClick", hearthbag.ethereal.SetHearthTexture_ONCLICK);
hearthbag.ethereal:SetScript("OnEnter", hearthbag.ethereal.Tooltip_OnEnter);
hearthbag.ethereal:SetScript("OnLeave", hearthbag.ethereal.Tooltip_OnLeave);

hearthbag.ethereal.collected = CreateFrame("Frame", nil, hearthbag.ethereal, nil);
hearthbag.ethereal.collected:SetSize(10, 10);
hearthbag.ethereal.collected:SetPoint("TOPLEFT", 0, 0);

hearthbag.ethereal.collected.tex = hearthbag.ethereal.collected:CreateTexture(nil, "BACKGROUND");
hearthbag.ethereal.collected.tex:SetTexture(TEXTURE_LIST.hearthItemHolderRet);
hearthbag.ethereal.collected.tex:SetAllPoints(hearthbag.ethereal.collected);

function hearthbag.ethereal.collected:CollectionCheck()
    if PlayerHasToy(ITEM_LIST.etherealPortal) == true then
        hearthbag.ethereal.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedYes);
    else
        hearthbag.ethereal.collected.tex:SetTexture(TEXTURE_LIST.hearthCollectedNo);
    end
end

hearthbag.ethereal:RegisterEvent("TOYS_UPDATED");
hearthbag.ethereal:RegisterEvent("BAG_UPDATE");
hearthbag.ethereal:HookScript("OnEvent", hearthbag.ethereal.collected.CollectionCheck);








function buttonContainer:FrameLevelChildren()
    -- default
    if hearthbag.option0.collected:GetParent():GetFrameLevel() >= hearthbag.option0.collected:GetFrameLevel() then
        hearthbag.option0.collected:SetFrameLevel(hearthbag.option0.collected:GetFrameLevel() + 1)
    end

    -- dalaran
    if hearthbag.dalaranHearth.collected:GetParent():GetFrameLevel() >= hearthbag.dalaranHearth.collected:GetFrameLevel() then
        hearthbag.dalaranHearth.collected:SetFrameLevel(hearthbag.dalaranHearth.collected:GetFrameLevel() + 1)
    end

    --garrison
    if hearthbag.garrisonHearth.collected:GetParent():GetFrameLevel() >= hearthbag.garrisonHearth.collected:GetFrameLevel() then
        hearthbag.garrisonHearth.collected:SetFrameLevel(hearthbag.garrisonHearth.collected:GetFrameLevel() + 1)
    end

    --ruby slippers
    if hearthbag.rubySlippers.collected:GetParent():GetFrameLevel() >= hearthbag.rubySlippers.collected:GetFrameLevel() then
        hearthbag.rubySlippers.collected:SetFrameLevel(hearthbag.rubySlippers.collected:GetFrameLevel() + 1)
    end

    --timewalker
    if hearthbag.timewalker.collected:GetParent():GetFrameLevel() >= hearthbag.timewalker.collected:GetFrameLevel() then
        hearthbag.timewalker.collected:SetFrameLevel(hearthbag.timewalker.collected:GetFrameLevel() + 1)
    end

    --kyrian
    if hearthbag.kyrian.collected:GetParent():GetFrameLevel() >= hearthbag.kyrian.collected:GetFrameLevel() then
        hearthbag.kyrian.collected:SetFrameLevel(hearthbag.kyrian.collected:GetFrameLevel() + 1)
    end

    --necrolord
    if hearthbag.necrolord.collected:GetParent():GetFrameLevel() >= hearthbag.necrolord.collected:GetFrameLevel() then
        hearthbag.necrolord.collected:SetFrameLevel(hearthbag.necrolord.collected:GetFrameLevel() + 1)
    end

    --ardenweald
    if hearthbag.ardenweald.collected:GetParent():GetFrameLevel() >= hearthbag.ardenweald.collected:GetFrameLevel() then
        hearthbag.ardenweald.collected:SetFrameLevel(hearthbag.ardenweald.collected:GetFrameLevel() + 1)
    end

    --venthyr
    if hearthbag.venthyr.collected:GetParent():GetFrameLevel() >= hearthbag.venthyr.collected:GetFrameLevel() then
        hearthbag.venthyr.collected:SetFrameLevel(hearthbag.venthyr.collected:GetFrameLevel() + 1)
    end

    --torghast
    if hearthbag.torghast.collected:GetParent():GetFrameLevel() >= hearthbag.torghast.collected:GetFrameLevel() then
        hearthbag.torghast.collected:SetFrameLevel(hearthbag.torghast.collected:GetFrameLevel() + 1)
    end

    --centaur
    if hearthbag.centaur.collected:GetParent():GetFrameLevel() >= hearthbag.centaur.collected:GetFrameLevel() then
        hearthbag.centaur.collected:SetFrameLevel(hearthbag.centaur.collected:GetFrameLevel() + 1)
    end

    --broker
    if hearthbag.broker.collected:GetParent():GetFrameLevel() >= hearthbag.broker.collected:GetFrameLevel() then
        hearthbag.broker.collected:SetFrameLevel(hearthbag.broker.collected:GetFrameLevel() + 1)
    end

    --oribos
    if hearthbag.oribos.collected:GetParent():GetFrameLevel() >= hearthbag.oribos.collected:GetFrameLevel() then
        hearthbag.oribos.collected:SetFrameLevel(hearthbag.oribos.collected:GetFrameLevel() + 1)
    end

    --mechagon
    if hearthbag.mechagon.collected:GetParent():GetFrameLevel() >= hearthbag.mechagon.collected:GetFrameLevel() then
        hearthbag.mechagon.collected:SetFrameLevel(hearthbag.mechagon.collected:GetFrameLevel() + 1)
    end

    --inndaughter
    if hearthbag.inndaughter.collected:GetParent():GetFrameLevel() >= hearthbag.inndaughter.collected:GetFrameLevel() then
        hearthbag.inndaughter.collected:SetFrameLevel(hearthbag.inndaughter.collected:GetFrameLevel() + 1)
    end

    --lunar
    if hearthbag.lunar.collected:GetParent():GetFrameLevel() >= hearthbag.lunar.collected:GetFrameLevel() then
        hearthbag.lunar.collected:SetFrameLevel(hearthbag.lunar.collected:GetFrameLevel() + 1)
    end

    --valentine
    if hearthbag.love.collected:GetParent():GetFrameLevel() >= hearthbag.love.collected:GetFrameLevel() then
        hearthbag.love.collected:SetFrameLevel(hearthbag.love.collected:GetFrameLevel() + 1)
    end

    --noblegarden
    if hearthbag.noble.collected:GetParent():GetFrameLevel() >= hearthbag.noble.collected:GetFrameLevel() then
        hearthbag.noble.collected:SetFrameLevel(hearthbag.noble.collected:GetFrameLevel() + 1)
    end

    --midsummer
    if hearthbag.midsummer.collected:GetParent():GetFrameLevel() >= hearthbag.midsummer.collected:GetFrameLevel() then
        hearthbag.midsummer.collected:SetFrameLevel(hearthbag.midsummer.collected:GetFrameLevel() + 1)
    end

    --brewfest
    if hearthbag.brewfest.collected:GetParent():GetFrameLevel() >= hearthbag.brewfest.collected:GetFrameLevel() then
        hearthbag.brewfest.collected:SetFrameLevel(hearthbag.brewfest.collected:GetFrameLevel() + 1)
    end

    --halloween
    if hearthbag.halloween.collected:GetParent():GetFrameLevel() >= hearthbag.halloween.collected:GetFrameLevel() then
        hearthbag.halloween.collected:SetFrameLevel(hearthbag.halloween.collected:GetFrameLevel() + 1)
    end

    --crimbo
    if hearthbag.crimbo.collected:GetParent():GetFrameLevel() >= hearthbag.crimbo.collected:GetFrameLevel() then
        hearthbag.crimbo.collected:SetFrameLevel(hearthbag.crimbo.collected:GetFrameLevel() + 1)
    end

    --darkPortal
    if hearthbag.darkportal.collected:GetParent():GetFrameLevel() >= hearthbag.darkportal.collected:GetFrameLevel() then
        hearthbag.darkportal.collected:SetFrameLevel(hearthbag.darkportal.collected:GetFrameLevel() + 1)
    end

    --diablo
    if hearthbag.diablo.collected:GetParent():GetFrameLevel() >= hearthbag.diablo.collected:GetFrameLevel() then
        hearthbag.diablo.collected:SetFrameLevel(hearthbag.diablo.collected:GetFrameLevel() + 1)
    end

    --etherealPortal
    if hearthbag.ethereal.collected:GetParent():GetFrameLevel() >= hearthbag.ethereal.collected:GetFrameLevel() then
        hearthbag.ethereal.collected:SetFrameLevel(hearthbag.ethereal.collected:GetFrameLevel() + 1)
    end

end


-- stop selecting this
function buttonContainer:SetNewParent(newParent, offsetX, offsetY)
    HearthDB.BAG["parent"] = newParent:GetName()
    HearthDB.BAG["position"][1] = offsetX
    HearthDB.BAG["position"][2] = offsetY
    self:SetParent(_G[HearthDB.BAG["parent"]]);
    hearthbag:SetParent(_G[HearthDB.BAG["parent"]]);
    hearthCleanup.UpdatePosition()
    hearthbag:SetFrameStrata("FULLSCREEN_DIALOG");
    hearthbag.FrameLevelOrganiser();
    buttonContainer.FrameLevelChildren();
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

        if GetCVarBool("combinedBags") == true then
            HearthDB.BAG["position"][1] = -394
            HearthDB.BAG["position"][2] = 30
        elseif GetCVarBool("combinedBags") == false then
            HearthDB.BAG["position"][1] = -142
            HearthDB.BAG["position"][2] = 30
        else
            HearthDB.BAG["position"][1] = hearthCleanup.defaultProfile["position"][1]
            HearthDB.BAG["position"][2] = hearthCleanup.defaultProfile["position"][2]
        end
    end
    hearthCleanup.UpdatePosition()
    hearthbag:SetParent(_G[HearthDB.BAG["parent"]]);
    hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
    hearthbag.UpdateCheckInherit_OnClick();
    hearthbag.FrameLevelOrganiser();
    buttonContainer.FrameLevelChildren();

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
        hearthbag:SetParent(_G[HearthDB.BAG["parent"]]);
        hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
        hearthbag.UpdateCheckInherit_OnClick();
        combatFrame:SetPoint(HearthDB.COMBAT["relative"], UIParent, "CENTER", HearthDB.COMBAT["position"][1], HearthDB.COMBAT["position"][2]);
        hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
        hearthbag.FrameLevelOrganiser();
        buttonContainer.FrameLevelChildren();
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
    local prefix = string.format("|T" .. TEXTURE_LIST.hearthDefaultTex .. ":14|t" .. hearthbag.coloredText .. ":");    
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

function hearthCleanup.DFCompat()
    --fix for compatibility
    if HearthDB.BAG["parent"] == "ContainerFrame1PortraitButton" then
        HearthDB.BAG["parent"] = "BagItemAutoSortButton"
        HearthDB.BAG["position"][1] = -142
        HearthDB.BAG["position"][2] = 30
        hearthCleanup.BagsUpdated()
    end
end

hearthbag:HookScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        --OpenAllBags(); -- broken in dragonflight, don't use ever
        hearthbag:ClearAllPoints();
        combatFrame:ClearAllPoints();
        hearthCleanup.DFCompat()
        hearthCleanup.UpdatePosition()
        hearthbag:SetParent(_G[HearthDB.BAG["parent"]]);
        hearthbag:SetSize(HearthDB.BAG["scale"], HearthDB.BAG["scale"]);
        hearthbag.UpdateCheckInherit_OnClick();
        combatFrame:SetPoint(HearthDB.COMBAT["relative"], HearthDB.COMBAT["position"][1], HearthDB.COMBAT["position"][2]);
        combatFrame:SetParent(UIParent);
        hearthbag.hearthCD:SetSwipeTexture(HearthDB.APPEARANCE.COOLDOWN);
        --CloseAllBags(); -- broken in dragonflight, don't use ever
        hearthbag.FrameLevelOrganiser();
        buttonContainer.FrameLevelChildren();
        hearthbag.UpdateItem();
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
anchorBuddy:RegisterEvent("USE_COMBINED_BAGS_CHANGED");
anchorBuddy:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        if IsAddOnLoaded("AdiBags") == true then
            --OpenAllBags(); -- broken in dragonflight, don't use ever
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
            --CloseAllBags(); -- broken in dragonflight, don't use ever
        end
    end
    if event == "USE_COMBINED_BAGS_CHANGED" then
        hearthCleanup.BagsUpdated()
    end
end);
--[[local anchorTex = anchorBuddy:CreateTexture("AnchorTexture", "BACKGROUND");
anchorTex:SetAllPoints(anchorBuddy);
anchorTex:SetTexture(TEXTURE_LIST.hearthDesatTex);]]