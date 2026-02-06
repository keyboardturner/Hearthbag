# 1.0.0

Large redesign to addon functionality and efficiency for retail

Reworked how saved data is handled:
 - Position / anchor data is now account-wide data
 - Chosen hearthstone style remains as character-specific data

As a result, the previous addon data format is now incompatible and will no longer be used (you will have to set up the addon again).

Certain hearthstones are now flagged as "Temporary Teleports", where your primary hearthstone will be chosen once the cast is finished.

Added 2 new buttons to select from:
 - Random Hearthstone: Randomly selects from your collection of hearthstones that you've collected. Does not include temporary teleports.
 - Housing Teleport: Allows teleporting to your house in your respective neighborhood. This acts as a temporary teleport.

Garrison and Dalaran hearthstones are now temporary teleports.

The settings menu is now accessible via right clicking the Hearthbag button:
 - Nudge buttons have been moved to each side of the Hearthbag frame, and will now only display when the menu is open.
 - 3 Settings are now accessible:
   - Shows combat frame during combat (necessary to display Hearthbag in combat, attempting to prevent taint on frames that it's anchored to such as as the bag frame)
   - Unlock Combat Anchor Frame (move the combat frame, only when outside of combat)
   - Display chat commands in Hearthbag tooltip

The Hearthbag button may now be resized via Shift+Scroll.

The Hearthbag button may now be moved via Shift+Drag.

New chat commands are now available, via /hearthbag anchor:
 - `/hearthbag anchor [FrameName]` - allows you to choose a specified frame, such as `/hearthbag anchor Minimap`. This will keep the button tied to the specified frame (for example, `BagItemSearchBox` for the bag frame, which will hide if you close your bags, and show when the bags are open.)
 - `/hearthbag anchor` - Will attempt to choose the frame under your current mouse focus location. Not all frames are eligible, and some may break, so this is a bit experimental. Any problematic frames can be reported to add to a list of forbidden frames.

Some chat commands are now reworked:
 - `/hearthbag reset` - No longer clears the appearance of your chosen hearthstone. It only resets the positioning to the screen center.
 - `/hearthbag combat` - Functions the same as the menu settings button to temporarily display the movable combat button location.

The checkbox setting to inherit right click functions of certain bag addon frames has been removed for now, as this is no longer a current functionality and interferes with the left / right click functionality of the addon. This may be added back in at a later date.

The checkbox setting to allow rescaling the Hearthbag button frame has been removed, as this is now handled by the Shift+Scroll functionality.

An update to the rest of the newer hearthstones is planned for a later update.


# 0.4.1

12.0.0 toc update

# 0.4.0

11.2.7 toc update

# 0.3.9

11.2.5 toc update

# 0.3.8

11.2.0 toc update

# 0.3.7

Classic version fixes

# 0.3.6

11.1.7 toc update

# 0.3.5

11.1.5 toc update & addon category

# 0.3.4

11.1.0 toc update

# 0.3.3

11.0.7 toc update

# 0.3.2

11.0.5 toc update

# 0.3.1

TOC updates for TWW, fixes to some code. migrated API to C_Item, C_Spell, and C_AddOns. Fixed a dropdown frame (sort of).

# 0.3.0

i forgor the textures

# 0.2.9

Added options for the following: Stone of the Hearth, Draenic Hologem, Hearthstone of the Flame, Enlightened Hearthstone, Path of the Naaru, and Deepdweller's Earthen Hearthstone. Rework still pending.

# 0.2.8

Fix to Cataclysm Suffix

# 0.2.7

toc bump to 10.2.7/1.15.2/4.4.0

# 0.2.6

toc bump to 10.2.6

# 0.2.5

10.2.5 toc bump

# 0.2.4

Inventorian Fix, Classic TOC Bump


# 0.2.3

Packager Testing

10.2 toc bump