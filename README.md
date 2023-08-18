<hr />
<p>It initially started with a <a href="https://twitter.com/keyboardturn/status/1275546863601479680">concept I developed and shared on twitter</a>. I've now decided that I can just... make this into an addon. <del>It's still in heavy development, but a working prototype is now available for others to test and play around with. I can't guarantee this'll be in full working order any time soon, especially for custom bag addons that replace the bag entirely, but it's a proof of concept that works.</del></p>
<hr />

A link to my discord for addon projects and other things can be found [here](https://discord.gg/tA4rrmjPp8).

<h2>Commands</h2>
<p>All commands begin with '/hearthbag' or '/hb' followed by the command.</p>
<ul>
<li>/hb reset</li>
</ul>
<p style="padding-left: 30px;">automatically place the hearthbag on a preset location, depending on whether or not you have a bag addon supported by this addon.</p>
<ul>
<li>/hb combat</li>
</ul>
<p style="padding-left: 30px;">Show the combat placement frame so it can be moved and placed to a custom location, or even assigned as a hearthbag anchor.</p>
<ul>
<li>/hb placer</li>
</ul>
<p style="padding-left: 30px;">A frame selection to directly place the hearthbag on to. Use /hb placer again to assign the location selected.</p>
<ul>
<li>/hb cycler</li>
</ul>
<p style="padding-left: 30px;">A frame selection with more freedom but also opens possibility to anchor to unstable frames.</p>
<ul>
<li>/hb help</li>
</ul>
<p style="padding-left: 30px;">Bring up the selection of aforementioned commands.</p>
<hr />
<h2>Limitations</h2>
<p>Due to certain in-combat limitations, this addon can't always be parented to frames in combat, as during combat the parented frame will become "Protected" if not properly designed. To work around this, I made the Combat Frame, which switches the Hearthbag into an accessible and useable frame during combat. The combat frame can be hidden in combat if desired, or optionally shown out of combat as well.</p>
<p>The purpose of Hearthbag is to provide a clickable hearthstone on the main bag button. I don't plan on adding other spells in the selection such as Mage Portals or Astral Recall as they share different cooldowns and serve a different purpose. This is meant to encompass Hearthstones and relating Hearthstone toy items. I don't want to add anything that'd be considered "bloatware" or "feature creep" - that's not what I originally had in mind. Other plugin addons can serve that purpose instead if so desired, but I'm not going to make that for this addon.</p>
<p>In the case of finding frames which can't be parented to or knowing why something doesn't work, I highly recommend using <a href="https://www.curseforge.com/wow/addons/bug-grabber">BugGrabber</a> + <a href="https://www.curseforge.com/wow/addons/bugsack">Bugsack</a>. You can turn off the "fatality" sound in the options.</p>
<p>Due to simply how addons work, if you parent Hearthbag to a frame that no longer exists upon reloading (parented to addon that you disabled) it'll throw an error.</p>
<hr />
<h2>Items Supported</h2>
<div class="spoiler">
<h3>Retail</h3>
<p>(Work in Progress, updating as time goes on)</p>
<p><a href="https://www.wowhead.com/item=6948/hearthstone">Default Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=140192/dalaran-hearthstone">Dalaran Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=110560/garrison-hearthstone">Garrison Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=28585/ruby-slippers">Ruby Slippers</a> / <a href="https://www.wowhead.com/item=142298/astonishingly-scarlet-slippers?bonus=1826:1472">Astonishingly Scarlet Slippers</a> (will prioritize the higher level version).</p>
<p><a href="https://www.wowhead.com/item=193588/timewalkers-hearthstone">Timewalker's Hearthstone</a>&nbsp;(Dragonflight Epic Edition Preorder)</p>
<p><a href="https://www.wowhead.com/item=184353/kyrian-hearthstone">Kyrian Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=180290/night-fae-hearthstone">Night Fae Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=183716/venthyr-sinstone">Venthyr Sinstone</a></p>
<p><a href="https://www.wowhead.com/item=182773/necrolord-hearthstone">Necrolord Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=188952/dominated-hearthstone">Dominated Herathstone</a></p>
<p><a href="https://www.wowhead.com/item=200630/ohnir-windsages-hearthstone">Ohn'ir Windsage's Hearthstone</a></p>
<p><a href="https://www.wowhead.com/beta/item=190237/broker-translocation-matrix">Broker Translocation Matrix</a></p>
<p><a href="https://www.wowhead.com/item=172179/eternal-travelers-hearthstone">Eternal Traveler's Hearthstone</a>&nbsp;(Shadowlands Epic Edition Preorder)</p>
<p><a href="https://www.wowhead.com/item=168907/holographic-digitalization-hearthstone">Holographic Digitalization Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=64488/the-innkeepers-daughter">The Innkeeper's Daughter</a></p>
<p><a href="https://www.wowhead.com/item=165669/lunar-elders-hearthstone">Lunar Elder's Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=165670/peddlefeets-lovely-hearthstone">Peddlefeet's Lovely Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=165802/noble-gardeners-hearthstone">Noble Gardener's Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=166746/fire-eaters-hearthstone">Fire Eater's Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=166747/brewfest-revelers-hearthstone">Brewfest Reveler's Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=163045/headless-horsemans-hearthstone">Headless Horseman's Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=162973/greatfather-winters-hearthstone">Greatfather Winter's Hearthstone</a></p>
<p><a href="https://www.wowhead.com/item=93672/dark-portal">Dark Portal</a> (TCG Toy)</p>
<p><a href="https://www.wowhead.com/item=142542/tome-of-town-portal">Tome of Town Portal</a> (Diablo Event)</p>
<p><a href="https://www.wowhead.com/item=54452/ethereal-portal">Ethereal Portal</a> (TCG Toy)</p>
<p>&nbsp;</p>
<h3>Wrath Classic</h3>
<p><a href="https://tbc.wowhead.com/item=6948/hearthstone">Default Hearthstone</a></p>
<p><a href="https://tbc.wowhead.com/item=184871/dark-portal">Dark Portal</a> (TBC Deluxe Edition)</p>
<p><a href="https://tbc.wowhead.com/item=28585/ruby-slippers">Ruby Slippers</a></p>
<p>&nbsp;</p>
<h3>Classic</h3>
<p><a href="https://classic.wowhead.com/item=6948/hearthstone">Default Hearthstone</a></p>
</div>
<hr />
<h2>Addons Supported</h2>
<p>Addons which have preset profiles that work with the `/hb reset` command:</p>
<ul>
<li><a href="https://www.curseforge.com/wow/addons/adibags?__cf_chl_captcha_tk__=27d8af8ca1a89a4b01919a5db4a98c6318693d9b-1618795562-0-AR4xaNJAjvVernrrKFtVLl8fhnfB7g2mU9iWl361sKJqfwee_ibJDY5_icEwergqdmiV8IVvvJpYFrpBxrpSP7vU2JZ7rJzHNhE5vOyDpDFP498ulro6MI8S2-11GJed9Cu5iV1xkjEAnNK6edphjTQuhnCvF_1RrzZmXRKrEqs1VbbF85D4njlrvJrf2ccSMS0IDkrk3rS6LGSMmNddFL_kOJtUk2AvWq6XOUMW9X_JreO5bDJpU0uwk4ryds3mKWbDGK2AsqMmqywo5tTIHAheNiazcO19BcAm7nVXxJhVe2fXENxIbkvQ4aXKZpmGiWrnjVbqTYeww_LjxL5HisaKcarkSNBhC5KjXefX4APCXntwsEYzlKeHYXZHzxi7hKpjMamAU5YTenm0vWY8JMtFGLjAwEj3A_yduri1bUDNZUnW434a6Z8royoY1R2GLSauh6OBG-e-_1R52BQayM4y80X7HSrEMMqckv_SlgNeYUOD52K4dP4tzkEREdfDZtWOG_zTqzZr4NgiQH9AUBioFtAqH2ZDz1K4a-8KbrTEqnfS8zXSpCNDhSXMuU7EHDScIr0TsWmRWAtBMW4o7aglftyRMjQJIxhWqi7QUI1-2atEELDCkPeaKeYor8bVtjWE9kO3VsT2CvVVQzhjSK3WM1kmOBJMd8D24_VgNHgq">AdiBags</a></li>
<li><a href="https://www.curseforge.com/wow/addons/ark-inventory">ArkInventory</a></li>
<li><a href="https://www.curseforge.com/wow/addons/inventorian">Inventorian</a></li>
<li><a href="https://www.curseforge.com/wow/addons/baggins">Baggins</a></li>
<li><a href="https://www.curseforge.com/wow/addons/combuctor">Combuctor</a></li>
<li><a href="https://www.curseforge.com/wow/addons/bagnon">Bagnon</a></li>
<li><a href="https://www.curseforge.com/wow/addons/baud-bag">Baud Bag</a></li>
<li><a href="https://www.curseforge.com/wow/addons/sorted">Sorted.</a></li>
<li><a href="https://www.curseforge.com/wow/addons/litebag">LiteBag</a></li>
<li><a href="https://www.tukui.org/download.php?ui=elvui">ElvUI</a></li>
<li><a href="https://www.curseforge.com/wow/addons/gw2-ui">GW2 UI</a></li>
</ul>
<p>&nbsp;</p>
<p>If there are other bag addons to support try to leave a comment below. I don't think I can possibly get them all but I'll certainly try where I can. Keep in mind though this is what the custom placement of the addon is for.</p>
<p>&nbsp;</p>
<p>Also a special thanks to Peterodox for helping me figure out some code when I got stuck, I'd definitely recommend taking a look at his addon <a href="https://www.curseforge.com/wow/addons/narcissus">Narcissus</a>.</p>
<p>&nbsp;</p>
<h3>Known Issues:</h3>
<p>Dragonflight comes with a few issues, particularly with <a href="https://wowpedia.fandom.com/wiki/Secure_Execution_and_Tainting">Taint</a>. There's not much that can necessarily be done except try to avoid it. The main cause right now seems to be the "inherit the right click function" feature, particularly when selecting the "Convert to separate bags" option in the dropdown menu. Chances are disabling this will probably prevent most taint issues.</p>
<p>There was also an older function, CloseAllBags() and OpenAllBags() that was used in previous iterations of the addon. I originally used this as a fallback to make sure the button hooked on to the bag frame upon login (particularly for other addons), but for the time being I've removed it. I'll see what I can fix during prepatch.</p>
<p><img src="https://i.imgur.com/Co911p4.png" alt="an example of taint" width="576" height="180" /></p>
