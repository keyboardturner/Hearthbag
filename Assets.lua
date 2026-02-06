local addonName, Hearthbag = ...;

local HearthbagPath = "Interface\\AddOns\\Hearthbag\\Textures\\";
Hearthbag.TexturePath = HearthbagPath;

function Hearthbag:GetTexturePaths(baseTextureName)
	if not baseTextureName then return nil end
	return {
		Up = HearthbagPath .. baseTextureName .. ".blp",
		Down = HearthbagPath .. baseTextureName .. "Down.blp",
		Cooldown = HearthbagPath .. "hearthCooldown_" .. baseTextureName:gsub("hearthbutton_", "") .. ".blp",
		Desat = HearthbagPath .. baseTextureName .. "Desat.blp",
	}
end

local HearthKeys = {
	[1] =	{
		key = "Default",
		Texture_Old = "Hearthstone_Default",
		itemIDs = {6948},
		spellID = 8690,
		type = "item",
	},
	[2] =	{
		key = "DarkPortal",
		Texture_Old = "hearthbutton_darkportal",
		itemIDs = {93672},
		spellID = 136508,
		type = "toy",
	},
	[3] =	{
		key = "Karazhan",
		Texture_Old = "hearthbutton_karazhan",
		itemIDs = {28585, 142298},
		spellID = 39937,
		type = "item",
	},
	[4] =	{
		key = "Daughter",
		Texture_Old = "hearthbutton_daughter",
		itemIDs = {64488},
		spellID = 94719,
		type = "toy",
	},
	[5] =	{
		key = "Brewfest",
		Texture_Old = "hearthbutton_brewfest",
		itemIDs = {166747},
		spellID = 286353,
		type = "toy",
	},
	[6] =	{
		key = "Ethereal",
		Texture_Old = "hearthbutton_ethereal",
		itemIDs = {54452},
		spellID = 75136,
		type = "toy",
	},
	[7] =	{
		key = "Oribos",
		Texture_Old = "hearthbutton_oribos",
		itemIDs = {172179},
		spellID = 308742,
		type = "toy",
	},
	[8] =	{
		key = "Midsummer",
		Texture_Old = "hearthbutton_midsummer",
		itemIDs = {166746},
		spellID = 286331,
		type = "toy",
	},
	[9] =	{
		key = "Crimbo",
		Texture_Old = "hearthbutton_crimbo",
		itemIDs = {162973},
		spellID = 278244,
		type = "toy",
	},
	[10] =	{
		key = "Halloween",
		Texture_Old = "hearthbutton_halloween",
		itemIDs = {163045},
		spellID = 278559,
		type = "toy",
	},
	[11] =	{
		key = "LunarNewYear",
		Texture_Old = "hearthbutton_lunar",
		itemIDs = {165669},
		spellID = 285362,
		type = "toy",
	},
	[12] =	{
		key = "NobleGarden",
		Texture_Old = "hearthbutton_noblegarden",
		itemIDs = {165802},
		spellID = 286031,
		type = "toy",
	},
	[13] =	{
		key = "Mechagon",
		Texture_Old = "hearthbutton_mechagon",
		itemIDs = {168907},
		spellID = 298068,
		type = "toy",
	},
	[14] =	{
		key = "Kyrian",
		Texture_Old = "hearthbutton_kyrian",
		itemIDs = {184353},
		spellID = 345393,
		type = "toy",
	},
	[15] =	{
		key = "Necrolord",
		Texture_Old = "hearthbutton_necrolord",
		itemIDs = {182773},
		spellID = 340200,
		type = "toy",
	},
	[16] =	{
		key = "Ardenweald",
		Texture_Old = "hearthbutton_arden",
		itemIDs = {180290},
		spellID = 326064,
		type = "toy",
	},
	[17] =	{
		key = "Venthyr",
		Texture_Old = "hearthbutton_venthyr",
		itemIDs = {183716},
		spellID = 342122,
		type = "toy",
	},
	[18] =	{
		key = "Valentine",
		Texture_Old = "hearthbutton_valentine",
		itemIDs = {165670},
		spellID = 285424,
		type = "toy",
	},
	[19] =	{
		key = "Diablo",
		Texture_Old = "hearthbutton_diablo",
		itemIDs = {142542},
		spellID = 231504,
		type = "toy",
	},
	[20] =	{ -- convert to separate buttons
		key = "Garrison",
		Texture_Old = "hearthbutton_garrison",
		itemIDs = {110560},
		spellID = 171253,
		type = "toy",
		secondary = true,
	},
	[21] =	{ -- convert to separate buttons
		key = "Dalaran",
		Texture_Old = "hearthbutton_dalaran",
		itemIDs = {140192},
		spellID = 222695,
		type = "toy",
		secondary = true,
	},
	[22] =	{
		key = "Broker",
		Texture_Old = "hearthbutton_broker",
		itemIDs = {190237},
		spellID = 367013,
		type = "toy",
	},
	[23] =	{
		key = "Torghast",
		Texture_Old = "hearthbutton_torghast",
		itemIDs = {188952},
		spellID = 363799,
		type = "toy",
	},
	[24] =	{
		key = "Timewalker",
		Texture_Old = "hearthbutton_timewalker",
		itemIDs = {193588},
		spellID = 375357,
		type = "toy",
	},
	[25] =	{
		key = "Centaur",
		Texture_Old = "hearthbutton_centaur",
		itemIDs = {200630},
		spellID = 391042,
		type = "toy",
	},
	[26] =	{ -- racially locked
		key = "Draenei",
		Texture_Old = "hearthbutton_draenei",
		itemIDs = {210455},
		spellID = 438606,
		raceIDs = {11, 30},
		type = "toy",
	},
	[27] =	{
		key = "EDRaid",
		Texture_Old = "hearthbutton_EDRaid",
		itemIDs = {209035},
		spellID = 422284,
		type = "toy",
	},
	[28] =	{
		key = "Enlightened",
		Texture_Old = "hearthbutton_enlightened",
		itemIDs = {190196},
		spellID = 366945,
		type = "toy",
	},
	[29] =	{
		key = "Naaru",
		Texture_Old = "hearthbutton_naaru",
		itemIDs = {206195},
		spellID = 412555,
		type = "toy",
	},
	[30] =	{
		key = "Storm",
		Texture_Old = "hearthbutton_storm",
		itemIDs = {208704},
		spellID = 420418,
		type = "toy",
	},
	[31] =	{
		key = "Anniversary",
		Texture_Old = "hearthbutton_anniversary",
		itemIDs = {212337},
		spellID = 401802,
		type = "toy",
	},
	[32] =	{
		key = "Random",
		Texture_Old = "hearthbutton_random",
	},
};

Hearthbag.HearthKeys = HearthKeys;

-- Hearthbag_DB.APPEARANCE.UP convert to ID


local SharedTextures = {
	CombatTex = "combatframe",

	EndUpButton = "ArrowButton_HB",
	EndDownButton = "ArrowButton_HBDown",
	EndHighlight = "ArrowButton_HBHL",

	TitleBar = "TitleBar",
	ItemHolderTBC = "ItemHolderTBC",
	ItemHolderRet = "ItemHolderRetail",

	CheckUp = "CheckButton_Enabled",
	CheckDown = "CheckButton_Disabled",
	CheckOff = "CheckButton_Off",

	CollectedYes = "Collected_Yes",
	CollectedNo = "Collected_No",

	ArrowRN = "ArrowButtonRight_Norm",
	ArrowLN = "ArrowButtonLeft_Norm",
	ArrowDN = "ArrowButtonDown_Norm",
	ArrowUN = "ArrowButtonUp_Norm",
	ArrowRP = "ArrowButtonRight_Pressed",
	ArrowLP = "ArrowButtonLeft_Pressed",
	ArrowDP = "ArrowButtonDown_Pressed",
	ArrowUP = "ArrowButtonUp_Pressed",
	ArrowRHL = "ArrowButtonRight_HL",
	ArrowLHL = "ArrowButtonLeft_HL",
	ArrowDHL = "ArrowButtonDown_HL",
	ArrowUHL = "ArrowButtonUp_HL",

	ArrowParent = "ArrowButton_Parent",

	HomestoneIcon = "HomestoneIcon",
	HomestoneIcon_Cooldown = "HomestoneIcon_Cooldown",
};

Hearthbag.SharedTextures = SharedTextures;


local SharedSounds = {
	ButtonUp = {
		[1] = "Button1.ogg",
		[2] = "Button2.ogg",
		[3] = "Button3.ogg",
		[4] = "Button4.ogg",
	},
	ButtonDown = {
		[1] = "ButtonDown1.ogg",
		[2] = "ButtonDown2.ogg",
		[3] = "ButtonDown3.ogg",
		[4] = "ButtonDown4.ogg",
	},
	TinyButtonDown = {
		[1] = "TinyButtonDown.ogg",
	},
	TinyButtonUp = {
		[1] = "TinyButtonUp.ogg",
	},
};

Hearthbag.SharedSounds = SharedSounds;