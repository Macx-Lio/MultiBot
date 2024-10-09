-- MULTIBAR --

local tMultiBar = MultiBot.addFrame("MultiBar", -262, 144, 36)

-- LEFT --

local tLeft = tMultiBar.addFrame("Left", -76, 2, 32)

-- TANKER --

MultiBot.tips.tanker = {}
MultiBot.tips.tanker.master = 
"Tank-Attack\n|cffffffff"..
"With this Button the Tanks starting to attack your target.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to execute Tank-Attack|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

tLeft.addButton("Tanker", -204, 0, "ability_warrior_shieldbash", MultiBot.tips.tanker.master)
.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@tank do attack my target") end
end

-- ATTACK --

MultiBot.tips.attack = {}
MultiBot.tips.attack.master = 
"Attack-Control\n|cffffffff"..
"With this Control you can give the Command to attack.\n"..
"Right-Click the Options to define a new default Action.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to execute the default Action|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to show or hide the Options|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.attack.attack = 
"Attack\n|cffffffff"..
"With this Command the hole Raid or Party starting to attack your target.|r\n\n"..
"|cffff0000Left-Click to execute Attack|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.attack.ranged = 
"Ranged-Attack\n|cffffffff"..
"With this Command the Ranged-Fighters starting to attack your target.|r\n\n"..
"|cffff0000Left-Click to execute Ranged-Attack|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.attack.melee = 
"Ranged-Attack\n|cffffffff"..
"With this Command the Melee-Fighters starting to attack your target.|r\n\n"..
"|cffff0000Left-Click to execute Melee-Attack|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.attack.healer = 
"Healer-Attack\n|cffffffff"..
"With this Command the Healers starting to attack your target.|r\n\n"..
"|cffff0000Left-Click to execute Healer-Attack|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.attack.dps = 
"DPS-Attack\n|cffffffff"..
"With this Command the DPS starting to attack your target.|r\n\n"..
"|cffff0000Left-Click to execute DPS-Attack|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.attack.tank = 
"Tank-Attack\n|cffffffff"..
"With this Command the Tanks starting to attack your target.|r\n\n"..
"|cffff0000Left-Click to execute Tank-Attack|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

local tButton = tLeft.addButton("Attack", -170, 0, "Interface\\AddOns\\MultiBot\\Icons\\attack.blp", MultiBot.tips.attack.master)
tButton.doRight = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Attack"])
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("do attack my target") end
end

local tAttack = tLeft.addFrame("Attack", -172, 34)
tAttack:Hide()

local tButton = tAttack.addButton("Attack", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\attack.blp", MultiBot.tips.attack.attack)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("do attack my target") end
end

local tButton = tAttack.addButton("Ranged", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\attack_ranged.blp", MultiBot.tips.attack.ranged)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "@ranged do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@ranged do attack my target") end
end

local tButton = tAttack.addButton("Melee", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\attack_melee.blp", MultiBot.tips.attack.melee)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "@melee do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@melee do attack my target") end
end

local tButton = tAttack.addButton("Healer", 0, 90, "Interface\\AddOns\\MultiBot\\Icons\\attack_healer.blp", MultiBot.tips.attack.healer)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "@healer do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@healer do attack my target") end
end

local tButton = tAttack.addButton("Dps", 0, 120, "Interface\\AddOns\\MultiBot\\Icons\\attack_dps.blp", MultiBot.tips.attack.dps)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "@dps do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@dps do attack my target") end
end

local tButton = tAttack.addButton("Tank", 0, 150, "Interface\\AddOns\\MultiBot\\Icons\\attack_tank.blp", MultiBot.tips.attack.tank)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "@tank do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@tank do attack my target") end
end

-- MODE --

MultiBot.tips.mode = {}
MultiBot.tips.mode.master = 
"Mode-Control\n|cffffffff"..
"This Control allows you to switch a Combat-Mode on and off.\n"..
"Left-Click the Options to select another Combat-Mode.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to switch the Combat-Mode|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to show or hide Options|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.mode.passive = 
"Passive-Mode\n|cffffffff"..
"In the Passive-Mode, your Bots wont attack any Opponent.\n"..
"This Mode is useful to keep the Tank from running into the Opponents during a pull.|r\n\n"..
"|cffff0000Left-Click to selet and activate Passive-Mode|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

MultiBot.tips.mode.grind = 
"Grind-Mode\n|cffffffff"..
"In the Grind-Mode, your Bots attack each Opponent at random.\n"..
"This Mode is usefull if you under attack of to much Opponents.|r\n\n"..
"|cffff0000Left-Click to selet and activate Grind-Mode|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

local tButton = tLeft.addButton("Mode", -136, 0, "Interface\\AddOns\\MultiBot\\Icons\\mode_passive.blp", MultiBot.tips.mode.master).setDisable()
tButton.doRight = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Mode"])
end
tButton.doLeft = function(pButton)
	if(MultiBot.OnOffSwitch(pButton))
	then MultiBot.ActionToGroup("co +passive,?")
	else MultiBot.ActionToGroup("co -passive,-grind,?")
	end
end

local tMode = tLeft.addFrame("Mode", -138, 34)
tMode:Hide()

tMode.addButton("Passive", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\mode_passive.blp", MultiBot.tips.mode.passive)
.doLeft = function(pButton)
	if(MultiBot.SelectToGroup(pButton.parent.parent, "Mode", pButton.texture, "co +passive,?")) then
		pButton.parent.parent.buttons["Mode"].setEnable().doLeft = function(pButton)
			if(MultiBot.OnOffSwitch(pButton))
			then MultiBot.ActionToGroup("co +passive,?")
			else MultiBot.ActionToGroup("co -passive,-grind,?")
			end
		end
	end
end

tMode.addButton("Passive", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\mode_grind.blp", MultiBot.tips.mode.grind)
.doLeft = function(pButton)
	if(MultiBot.SelectToGroup(pButton.parent.parent, "Mode", pButton.texture, "co +grind,?")) then
		pButton.parent.parent.buttons["Mode"].setEnable().doLeft = function(pButton)
			if(MultiBot.OnOffSwitch(pButton))
			then MultiBot.ActionToGroup("co +grind,?")
			else MultiBot.ActionToGroup("co -passive,-grind,?")
			end
		end
	end
end

-- STAY|FOLLOW --

MultiBot.tips.stallow = {}
MultiBot.tips.stallow.stay = 
"Stay|Follow\n|cffffffff"..
"With this Button you can give right now the Command to Stay.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to execute Stay|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

MultiBot.tips.stallow.follow = 
"Stay|Follow\n|cffffffff"..
"With this Button you can give right now the Command to Follow.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to execute Follow|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

tLeft.addButton("Stay", -102, 0, "Interface\\AddOns\\MultiBot\\Icons\\command_follow.blp", MultiBot.tips.stallow.stay)
.doLeft = function(pButton)
	if(MultiBot.ActionToGroup("stay")) then
		pButton.parent.buttons["Follow"].doShow()
		pButton:doHide()
	end
end

tLeft.addButton("Follow", -102, 0, "Interface\\AddOns\\MultiBot\\Icons\\command_stay.blp", MultiBot.tips.stallow.follow).doHide()
.doLeft = function(pButton)
	if(MultiBot.ActionToGroup("follow")) then
		pButton.parent.buttons["Stay"].doShow()
		pButton:doHide()
	end
end

-- FLEE --

MultiBot.tips.flee = {}
MultiBot.tips.flee.master = 
"Flee-Control\n|cffffffff"..
"With this Control you can give the Command to flee.\n"..
"Right-Click the Options to define a new default Action.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to execute the default Action|r\n"..
"|cff999999(Execution-Order: 'Target', Raid, Party)|r\n\n"..
"|cffff0000Right-Click to show or hide the Options|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.flee.flee = 
"Flee\n|cffffffff"..
"With this Command the hole Raid or Party starting to flee.|r\n\n"..
"|cffff0000Left-Click to execute Flee|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.flee.ranged = 
"Ranged-Flee\n|cffffffff"..
"With this Command the Ranged-Fighters starting to flee.|r\n\n"..
"|cffff0000Left-Click to execute Ranged-Flee|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.flee.melee = 
"Ranged-Flee\n|cffffffff"..
"With this Command the Melee-Fighters starting to flee.|r\n\n"..
"|cffff0000Left-Click to execute Melee-Flee|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.flee.healer = 
"Healer-Flee\n|cffffffff"..
"With this Command the Healers starting to flee.|r\n\n"..
"|cffff0000Left-Click to execute Healer-Flee|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.flee.dps = 
"DPS-Flee\n|cffffffff"..
"With this Command the DPS starting to flee.|r\n\n"..
"|cffff0000Left-Click to execute DPS-Flee|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.flee.tank = 
"Tank-Flee\n|cffffffff"..
"With this Command the Tanks starting to flee.|r\n\n"..
"|cffff0000Left-Click to execute Tank-Flee|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.flee.target = 
"Target-Flee\n|cffffffff"..
"With this Command the Target starting to flee.|r\n\n"..
"|cffff0000Left-Click to execute Target-Flee|r\n"..
"|cff999999(Execution-Order: Target)|r\n\n"..
"|cffff0000Right-Click to define as default Action|r\n"..
"|cff999999(Execution-Order: System)|r";

local tButton = tLeft.addButton("Flee", -68, 0, "Interface\\AddOns\\MultiBot\\Icons\\flee.blp", MultiBot.tips.flee.master)
tButton.doRight = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Flee"])
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("flee")
end

local tFlee = tLeft.addFrame("Flee", -70, 34)
tFlee:Hide()

local tButton = tFlee.addButton("Flee", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\flee.blp", MultiBot.tips.flee.flee)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("flee")
end

local tButton = tFlee.addButton("Ranged", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\flee_ranged.blp", MultiBot.tips.flee.ranged)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "@ranged flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("@ranged flee")
end

local tButton = tFlee.addButton("Melee", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\flee_melee.blp", MultiBot.tips.flee.melee)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "@melee flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("@melee flee")
end

local tButton = tFlee.addButton("Healer", 0, 90, "Interface\\AddOns\\MultiBot\\Icons\\flee_healer.blp", MultiBot.tips.flee.healer)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "@healer flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("@healer flee")
end

local tButton = tFlee.addButton("Dps", 0, 120, "Interface\\AddOns\\MultiBot\\Icons\\flee_dps.blp", MultiBot.tips.flee.dps)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "@dps flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("@dps flee")
end

local tButton = tFlee.addButton("Tank", 0, 150, "Interface\\AddOns\\MultiBot\\Icons\\flee_tank.blp", MultiBot.tips.flee.tank)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "@tank flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("@tank flee")
end

local tButton = tFlee.addButton("Target", 0, 180, "Interface\\AddOns\\MultiBot\\Icons\\flee_target.blp", MultiBot.tips.flee.target)
tButton.doRight = function(pButton)
	MultiBot.SelectToTargetButton(pButton.parent.parent, "Flee", pButton.texture, "flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToTarget("flee")
end

-- FORMATION --

MultiBot.tips.format = {}
MultiBot.tips.format.master = 
"Formation-Control\n|cffffffff"..
"This Control allows you to change the Formation of your Bots.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to show or hide the Options|r\n"..
"|cff999999(Execution-Order: System)|r\n\n"..
"|cffff0000Right-Click to ask for the current Formation|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

MultiBot.tips.format.arrow = 
"Arrow-Formation\n|cffffffff"..
"The Bots line up in an arrow formation.\n"..
"The Bots line of sight is in your direction.\n\n"..
"1. Line are Tanks\n"..
"2. Line are Melee-Fighters\n"..
"3. Line are Ranged-Fighters\n"..
"4. Line are Healers|r\n\n"..
"|cffff0000Left-Click to select the Arrow-Formation|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

MultiBot.tips.format.queue = 
"Queue-Formation\n|cffffffff"..
"The Bots line up in an defensive formation.\n"..
"The Bots line of sight is in your direction.|r\n\n"..
"|cffff0000Left-Click to select the Queue-Formation|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

MultiBot.tips.format.near = 
"Near-Formation\n|cffffffff"..
"The Bots line up near by.\n"..
"The Bots line of sight is in your direction.|r\n\n"..
"|cffff0000Left-Click to select the Near-Formation|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

MultiBot.tips.format.melee = 
"Near-Formation\n|cffffffff"..
"The Bots line up for melee fights.\n"..
"The Bots line of sight is in your direction.|r\n\n"..
"|cffff0000Left-Click to select the Melee-Formation|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

MultiBot.tips.format.line = 
"Near-Formation\n|cffffffff"..
"The Bots line up on the left and right side in a parallel line.\n"..
"The Bots line of sight is in your direction.|r\n\n"..
"|cffff0000Left-Click to select the Line-Formation|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

MultiBot.tips.format.circle = 
"Circle-Formation\n|cffffffff"..
"The Bots line up in a circle around you.\n"..
"The Bots line of sight is directed outwards.|r\n\n"..
"|cffff0000Left-Click to select the Circle-Formation|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

MultiBot.tips.format.chaos = 
"Chaos-Formation\n|cffffffff"..
"Each Bot follows you by its own.\n"..
"They line up everywhere they wont.\n"..
"The line of sight could be every direction.|r\n\n"..
"|cffff0000Left-Click to select the Chaos-Formation|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

MultiBot.tips.format.shield = 
"Shield-Formation\n|cffffffff"..
"The Bots line up in the front, on the left and right side.\n"..
"The Bots line of sight is in your direction.|r\n\n"..
"|cffff0000Left-Click to select the Shield-Formation|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

local tButton = tLeft.addButton("Format", -34, 0, "Interface\\AddOns\\MultiBot\\Icons\\formation_near.blp", MultiBot.tips.format.master)
tButton.doRight = function(pButton)
	MultiBot.ActionToGroup("formation")
end
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Format"])
end

local tFormat = tLeft.addFrame("Format", -36, 34)
tFormat:Hide()

tFormat.addButton("Arrow", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\formation_arrow.blp", MultiBot.tips.format.arrow)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation arrow")
end

tFormat.addButton("Queue", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\formation_queue.blp", MultiBot.tips.format.queue)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation queue")
end

tFormat.addButton("Near", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\formation_near.blp", MultiBot.tips.format.near)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation near")
end

tFormat.addButton("Melee", 0, 90, "Interface\\AddOns\\MultiBot\\Icons\\formation_melee.blp", MultiBot.tips.format.melee)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation melee")
end

tFormat.addButton("Line", 0, 120, "Interface\\AddOns\\MultiBot\\Icons\\formation_line.blp", MultiBot.tips.format.line)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation line")
end

tFormat.addButton("Circle", 0, 150, "Interface\\AddOns\\MultiBot\\Icons\\formation_circle.blp", MultiBot.tips.format.circle)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation circle")
end

tFormat.addButton("Chaos", 0, 180, "Interface\\AddOns\\MultiBot\\Icons\\formation_chaos.blp", MultiBot.tips.format.chaos)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation chaos")
end

tFormat.addButton("Shield", 0, 210, "Interface\\AddOns\\MultiBot\\Icons\\formation_shield.blp", MultiBot.tips.format.shield)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation shield")
end

-- BEAST --

MultiBot.tips.beast = {}
MultiBot.tips.beast.master = 
"Beastmaster-Control\n|cffffffff"..
"This Control is for the Mod-Beastmaster of the Azerothcore.\n"..
"Mod-Beastmaster allows every Character to have a Pet like Hunters.\n"..
"Your Charaters can learn the nessasary Spells from White Fang.\n"..
"White Fang must be placed into the World by the GameMaster.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to show or hide the Options|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.beast.release =
"Release the Beast\n|cffffffff"..
"This Command will release the Beast.|r\n\n"..
"|cffff0000Left-Click to release the Beast|r\n"..
"|cff999999(Execution-Order: Target, Raid, Party)|r";

MultiBot.tips.beast.revive =
"Revive the Beast\n|cffffffff"..
"This Command will revive the Beast.|r\n\n"..
"|cffff0000Left-Click to revive the Beast|r\n"..
"|cff999999(Execution-Order: Target, Raid, Party)|r";

MultiBot.tips.beast.heal =
"Heal the Beast\n|cffffffff"..
"This Command will heal the Beast.|r\n\n"..
"|cffff0000Left-Click to heal the Beast|r\n"..
"|cff999999(Execution-Order: Target, Raid, Party)|r";

MultiBot.tips.beast.feed =
"Feed the Beast\n|cffffffff"..
"This Command will feed the Beast.|r\n\n"..
"|cffff0000Left-Click to feed the Beast|r\n"..
"|cff999999(Execution-Order: Target, Raid, Party)|r";

MultiBot.tips.beast.call =
"Call the Beast\n|cffffffff"..
"This Command will call the Beast.|r\n\n"..
"|cffff0000Left-Click to call the Beast|r\n"..
"|cff999999(Execution-Order: Target, Raid, Party)|r";

tLeft.addButton("Beast", 0, 0, "ability_mount_swiftredwindrider", MultiBot.tips.beast.master)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Beast"])
end

local tBeast = tLeft.addFrame("Beast", -2, 34)
tBeast:Hide()

tBeast.addButton("Release", 0, 0, "spell_nature_spiritwolf", MultiBot.tips.beast.release)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("cast 2641")
end

tBeast.addButton("Revive", 0, 30, "ability_hunter_beastsoothe", MultiBot.tips.beast.revive)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("cast 982")
end

tBeast.addButton("Heal", 0, 60, "ability_hunter_mendpet", MultiBot.tips.beast.heal)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("cast 48990")
end

tBeast.addButton("Feed", 0, 90, "ability_hunter_beasttraining", MultiBot.tips.beast.feed)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("cast 6991")
end

tBeast.addButton("Call", 0, 120, "ability_hunter_beastcall", MultiBot.tips.beast.call)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("cast 883")
end

-- UNITS --

MultiBot.tips.units = {}
MultiBot.tips.units.master =
"Unit-Control\n|cffffffff"..
"In this Control you will find the Playerbots.\n"..
"Each Button stands for one of your Characters, Guild-Members or Friends.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to show or hide the Units|r\n"..
"|cff999999(Execution-Order: System)|r\n\n"..
"|cffff0000Right-Click to refresh the Units|r\n"..
"|cff999999(Execution-Order: System)|r";

local tButton = tMultiBar.addButton("Units", -38, 0, "inv_scroll_04", MultiBot.tips.units.master)
tButton.roster = "players"
tButton.filter = "none"

tButton.doRight = function(pButton)
end

tButton.doLeft = function(pButton, oRoster, oFilter)
	local tUnits = pButton.parent.frames["Units"]
	local tTable = nil
	
	for key, value in pairs(tUnits.buttons) do value:Hide() end
	for key, value in pairs(tUnits.frames) do value:Hide() end
	tUnits.frames["Control"]:Show()
	
	if(oRoster == nil and oFilter == nil) then MultiBot.ShowHideSwitch(tUnits)
	elseif(oRoster ~= nil) then pButton.roster = oRoster
	elseif(oFilter ~= nil) then pButton.filter = oFilter
	end
	
	if(pButton.filter ~= "none")
	then tTable = MultiBot.index.classes[pButton.roster][pButton.filter]
	else tTable = MultiBot.index[pButton.roster]
	end
	
	local tButton = nil
	local tFrame = nil
	local tIndex = 0
	
	if(tTable ~= nil)
	then pButton.limit = table.getn(tTable)
	else pButton.limit = 0
	end
	
	pButton.from = 1
	pButton.to = 10
	
	for i = 1, pButton.limit do
		tIndex = (i - 1)%10 + 1
		tFrame = tUnits.frames[tTable[i]]
		tButton = tUnits.buttons[tTable[i]]
		tButton.setPoint(0, (tUnits.size + 2) * (tIndex - 1))
		if(tFrame ~=nil) then tFrame.setPoint(-34, (tUnits.size + 2) * (tIndex - 1) + 2) end
		
		if(pButton.from <= i and pButton.to >= i) then
			if(tFrame ~= nil and tButton.state) then tFrame:Show() end
			tButton:Show()
		end
	end
	
	if(pButton.limit < pButton.to)
	then tUnits.frames["Control"].setPoint(-2, (tUnits.size + 2) * pButton.limit)
	else tUnits.frames["Control"].setPoint(-2, (tUnits.size + 2) * pButton.to)
	end
	
	if(pButton.limit < 10)
	then tUnits.frames["Control"].buttons["Browse"]:Hide()
	else tUnits.frames["Control"].buttons["Browse"]:Show()
	end
end

local tUnits = tMultiBar.addFrame("Units", -40, 38)
tUnits:Hide()

local tControl = tUnits.addFrame("Control", -2, 0)
tControl:Show()

-- UNIT:FILTER --

MultiBot.tips.units.filter =
"Class-Filter\n|cffffffff"..
"With the Class-Filter you can filter the Units by Classes.|r\n\n"..
"|cffff0000Left-Click to show or hide the Options|r\n"..
"|cff999999(Execution-Order: System)|r\n\n"..
"|cffff0000Right-Click to reset the Filter|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.deathknight =
"Class-Filter\n|cffffffff"..
"Filters the Units for Death Knights.|r\n\n"..
"|cffff0000Left-Click to filter for Death Knights|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.druid =
"Class-Filter\n|cffffffff"..
"Filters the Units for Druids.|r\n\n"..
"|cffff0000Left-Click to filter for Druids|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.hunter =
"Class-Filter\n|cffffffff"..
"Filters the Units for Hunters.|r\n\n"..
"|cffff0000Left-Click to filter for Hunters|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.mage =
"Class-Filter\n|cffffffff"..
"Filters the Units for Mages.|r\n\n"..
"|cffff0000Left-Click to filter for Mages|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.paladin =
"Class-Filter\n|cffffffff"..
"Filters the Units for Paladins.|r\n\n"..
"|cffff0000Left-Click to filter for Paladins|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.priest =
"Class-Filter\n|cffffffff"..
"Filters the Units for Priests.|r\n\n"..
"|cffff0000Left-Click to filter for Priests|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.rogue =
"Class-Filter\n|cffffffff"..
"Filters the Units for Rogues.|r\n\n"..
"|cffff0000Left-Click to filter for Rogues|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.shaman =
"Class-Filter\n|cffffffff"..
"Filters the Units for Shamans.|r\n\n"..
"|cffff0000Left-Click to filter for Shamans|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.warlock =
"Class-Filter\n|cffffffff"..
"Filters the Units for Warlocks.|r\n\n"..
"|cffff0000Left-Click to filter for Warlocks|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.warrior =
"Class-Filter\n|cffffffff"..
"Filters the Units for Warriors.|r\n\n"..
"|cffff0000Left-Click to filter for Warriors|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.none =
"Class-Filter\n|cffffffff"..
"Removes the Class-Filter from the Units.|r\n\n"..
"|cffff0000Left-Click to remove the Filter|r\n"..
"|cff999999(Execution-Order: System)|r";

local tButton = tControl.addButton("Filter", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", MultiBot.tips.units.filter)
tButton.doRight = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent, "Filter", "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp")
	tButton.doLeft(tButton, nil, "none")
end
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Filter"])
end

local tFilter = tControl.addFrame("Filter", -30, 2)
tFilter:Hide()

tFilter.addButton("DeathKnight", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_deathknight.blp", MultiBot.tips.units.deathknight)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "DeathKnight")
end

tFilter.addButton("Druid", -26, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_druid.blp", MultiBot.tips.units.druid)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Druid")
end

tFilter.addButton("Hunter", -52, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_hunter.blp", MultiBot.tips.units.hunter)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Hunter")
end

tFilter.addButton("Mage", -78, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_mage.blp", MultiBot.tips.units.mage)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Mage")
end

tFilter.addButton("Paladin", -104, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_paladin.blp", MultiBot.tips.units.paladin)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Paladin")
end

tFilter.addButton("Priest", -130, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_priest.blp", MultiBot.tips.units.priest)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Priest")
end

tFilter.addButton("Rogue", -156, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_rogue.blp", MultiBot.tips.units.rogue)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Rogue")
end

tFilter.addButton("Shaman", -182, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_shaman.blp", MultiBot.tips.units.shaman)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Shaman")
end

tFilter.addButton("Warlock", -208, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_warlock.blp", MultiBot.tips.units.warlock)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Warlock")
end

tFilter.addButton("Warrior", -234, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_warrior.blp", MultiBot.tips.units.warrior)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Warrior")
end

tFilter.addButton("None", -260, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", MultiBot.tips.units.none)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "none")
end

-- UNITS:ROSTER --

MultiBot.tips.units.roster =
"Roster-Filter\n|cffffffff"..
"With the Roster-Filter you can switch between differned Rosters.|r\n\n"..
"|cffff0000Left-Click to show or hide the Options|r\n"..
"|cff999999(Execution-Order: System)|r\n\n"..
"|cffff0000Right-Click to reset the Filter|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.actives =
"Roster-Filter\n|cffffffff"..
"Shows the Active-Roster.|r\n\n"..
"|cffff0000Left-Click to select Active-Roster|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.players =
"Roster-Filter\n|cffffffff"..
"Shows the Playerbot-Roster.\n"..
"Normaly your Characters and Others which stayed in your Group.|r\n\n"..
"|cffff0000Left-Click to select Playerbot-Roster|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.members =
"Roster-Filter\n|cffffffff"..
"Shows the Guild-Roster.\n"..
"The Guild-Roster does not show your Characters.|r\n\n"..
"|cffff0000Left-Click to select Guild-Roster|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.friends =
"Roster-Filter\n|cffffffff"..
"Shows the Friend-Roster.\n"..
"The Friend-Roster does not show your Characters or Guild-Members.|r\n\n"..
"|cffff0000Left-Click to select Friend-Roster|r\n"..
"|cff999999(Execution-Order: System)|r";

local tButton = tControl.addButton("Roster", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\roster_players.blp", MultiBot.tips.units.roster)
tButton.doRight = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent, "Roster", "Interface\\AddOns\\MultiBot\\Icons\\roster_players.blp")
	tButton.doLeft(tButton, "players")
end
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Roster"])
end

local tRoster = tControl.addFrame("Roster", -30, 32)
tRoster:Hide()

tRoster.addButton("Friends", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_friends.blp", MultiBot.tips.units.friends)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	tButton.doLeft(tButton, "friends")
end

tRoster.addButton("Members", -26, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_members.blp", MultiBot.tips.units.members)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	tButton.doLeft(tButton, "members")
end

tRoster.addButton("Players", -52, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_players.blp", MultiBot.tips.units.players)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	tButton.doLeft(tButton, "players")
end

tRoster.addButton("Actives", -78, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_actives.blp", MultiBot.tips.units.actives)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	tButton.doLeft(tButton, "actives")
end

-- UNIT:BROWSE --

MultiBot.tips.units.browse =
"Browse\n|cffffffff"..
"With this Button you can browse through the Rosters.\n"..
"It will be hidden if the Roster has less then 10 Units.|r\n\n"..
"|cffff0000Left-Click to browse the Roster|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.invite =
"Invite-Control\n|cffffffff"..
"With this Control you can automaticaly fill up your Group.\n"..
"The left Button is for 'Party-Invite', the right Buttons are for 'Raid-Invite'.|r\n\n"..
"|cffff0000Left-Click to show or hide the Control|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.inviteParty5 =
"Party of Five\n|cffffffff"..
"With this Button you can fill up your Party.\n"..
"This Feature takes the Units form the selected Roster ignoring the Class-Filter.\n"..
"It stops at the End of the Roster or until the Group reached 5 Members.|r\n\n"..
"|cffff0000Left-Click to invite Party-Members|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.inviteRaid10 =
"Raid of Ten\n|cffffffff"..
"With this Button you can fill up your Raid.\n"..
"This Feature takes the Units form the selected Roster ignoring the Class-Filter.\n"..
"It stops at the End of the Roster or until the Group reached 10 Members.|r\n\n"..
"|cffff0000Left-Click to invite Raid-Members|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.inviteRaid25 =
"Raid of Twenty-Five\n|cffffffff"..
"With this Button you can fill up your Raid.\n"..
"This Feature takes the Units form the selected Roster ignoring the Class-Filter.\n"..
"It stops at the End of the Roster or until the Group reached 25 Members.|r\n\n"..
"|cffff0000Left-Click to invite Raid-Members|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.units.inviteRaid40 =
"Raid of Forty\n|cffffffff"..
"With this Button you can fill up your Raid.\n"..
"This Feature takes the Units form the selected Roster ignoring the Class-Filter.\n"..
"It stops at the End of the Roster or until the Group reached 40 Members.|r\n\n"..
"|cffff0000Left-Click to invite Raid-Members|r\n"..
"|cff999999(Execution-Order: System)|r";

tControl.addButton("Invite", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\invite.blp", MultiBot.tips.units.invite)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Invite"])
end

local tInvite = tControl.addFrame("Invite", -30, 62)
tInvite:Hide()

tInvite.addButton("Party+5", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_party_5.blp", MultiBot.tips.units.inviteParty5)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage("I already invite Members, please wait until I am done.", "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 5 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage("Starting to invite Members.", "SAY")
end

tInvite.addButton("Raid+10", 56, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_raid_10.blp", MultiBot.tips.units.inviteRaid10)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage("I already invite Members, please wait until I am done.", "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 10 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage("Starting to invite Members.", "SAY")
end

tInvite.addButton("Raid+25", 82, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_raid_25.blp", MultiBot.tips.units.inviteRaid25)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage("I already invite Members, please wait until I am done.", "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 25 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage("Starting to invite Members.", "SAY")
end

tInvite.addButton("Raid+40", 108, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_raid_40.blp", MultiBot.tips.units.inviteRaid40)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage("I already invite Members, please wait until I am done.", "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 40 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage("Starting to invite Members.", "SAY")
end

tControl.addButton("Browse", 0, 90, "Interface\\AddOns\\MultiBot\\Icons\\browse.blp", MultiBot.tips.units.browse)
.doLeft = function(pButton)
	local tMaster = MultiBot.frames["MultiBar"].buttons["Units"]
	local tFrom = tMaster.from + 10
	local tTo = tMaster.to + 10
	
	if(tMaster.filter ~= "none")
	then tTable = MultiBot.index.classes[tMaster.roster][tMaster.filter]
	else tTable = MultiBot.index[tMaster.roster]
	end
	
	local tUnits = tMaster.parent.frames["Units"]
	local tButton = nil
	local tFrame = nil
	local tIndex = 0
	
	if(tFrom > tMaster.limit) then
		tFrom = 1
		tTo = 10
	end
	
	if(tTo > tMaster.limit) then
		tTo = tMaster.limit
	end
	
	for i = 1, tMaster.limit do
		tFrame = tUnits.frames[tTable[i]]
		tButton = tUnits.buttons[tTable[i]]
		
		if(tMaster.from <= i and tMaster.to >= i) then
			if(tFrame ~= nil) then tFrame:Hide() end
			tButton:Hide()
		end
		
		if(tFrom <= i and tTo >= i) then
			tIndex = tIndex + 1
			if(tFrame ~= nil and tButton.state) then tFrame:Show() end 
			tButton:Show()
		end
	end
	
	tMaster.from = tFrom
	tMaster.to = tTo
	
	tUnits.frames["Control"].setPoint(-2, (tUnits.size + 2) * tIndex)
end

-- MAIN --

MultiBot.tips.main = {}
MultiBot.tips.main.master =
"Main-Control\n|cffffffff"..
"In this Control you will find the Auto-Switches, Special-Strategies and Reset-Commands.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to show or hide the Options|r\n"..
"|cff999999(Execution-Order: System)|r\n\n"..
"|cffff0000Right-Click to close MultiBot|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.main.release =
"Auto-Release\n|cffffffff"..
"This Feature detects the Death of Bots.\n"..
"Dead Bots are automatically released and summoned.|r\n\n"..
"|cffff0000Left-Click to enable or disable Auto-Release|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.main.stats =
"Auto-Stats\n|cffffffff"..
"This Feature visualizes the Stats.\n"..
"The Stats are updated every minute.|r\n\n"..
"|cffff0000Left-Click to enable or disable Auto-Stats|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.main.naxx =
"Naxx-Strategies\n|cffffffff"..
"This Button will activate the Naxx-Strategies of your Bots.|r\n\n"..
"|cffff0000Left-Click to activate Naxx-Strategies|r\n"..
"|cff999999(Execution-Order: Target, Raid, Party)|r";

MultiBot.tips.main.reset =
"Reset-Bots\n|cffffffff"..
"This Button will reset the Artificial-Intelligence of your Bots.|r\n\n"..
"|cffff0000Left-Click to reset the Artificial-Intelligence|r\n"..
"|cff999999(Execution-Order: Target, Raid, Party)|r";

MultiBot.tips.main.action =
"Reset-Action\n|cffffffff"..
"This Button will reset the current Action of your Bots.\n\n"..
"|cffff0000Left-Click to reset the Action|r\n"..
"|cff999999(Execution-Order: Target, Raid, Party)|r";

local tButton = tMultiBar.addButton("Main", 0, 0, "inv_gizmo_02", MultiBot.tips.main.master)
tButton.doRight = function(pButton)
	MultiBot.doSlash("/MultiBot", "")
end
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Main"])
end

local tMain = tMultiBar.addFrame("Main", -2, 38)
tMain:Hide()

tMain.addButton("Release", 0, 0, "achievement_bg_xkills_avgraveyard", MultiBot.tips.main.release).setDisable()
.doLeft = function(pButton)
	if(MultiBot.OnOffSwitch(pButton)) then
		MultiBot.auto.release = true
	else
		MultiBot.auto.release = false
	end
end

tMain.addButton("Stats", 0, 34, "inv_scroll_08", MultiBot.tips.main.stats).setDisable()
.doLeft = function(pButton)
	if(MultiBot.OnOffSwitch(pButton)) then
		MultiBot.auto.stats = true
		for i = 1, GetNumPartyMembers() do SendChatMessage("stats", "WHISPER", nil, UnitName("party" .. i)) end
	else
		MultiBot.auto.stats = false
		for key, value in pairs(MultiBot.stats.frames) do value:Hide() end
	end
end

tMain.addButton("Naxx", 0, 68, "achievement_boss_kelthuzad_01", MultiBot.tips.main.naxx)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("naxx")
end

tMain.addButton("Reset", 0, 102, "inv_misc_tournaments_symbol_gnome", MultiBot.tips.main.reset)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("reset botAI")
end

tMain.addButton("Actions", 0, 136, "inv_helmet_02", MultiBot.tips.main.action)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("reset")
end

-- MASTERS --

MultiBot.tips.game = {}
MultiBot.tips.game.master =
"GameMaster-Control\n|cffffffff"..
"In this Control you will find useful GameMaster-Commands.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to show or hide the Options|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.game.summon =
"Summon\n|cffffffff"..
"Summons your Target to your Position.\n"..
"You need GameMaster-Rights to use this Button.|r\n\n"..
"|cffff0000Left-Click to summon your Target|r\n"..
"|cff999999(Execution-Order: Target)|r";

MultiBot.tips.game.appear =
"Appear\n|cffffffff"..
"You will appear at the Position of your Target.\n"..
"You need GameMaster-Rights to use this Button.|r\n\n"..
"|cffff0000Left-Click to appear at your Target|r\n"..
"|cff999999(Execution-Order: Target)|r";

tMultiBar.addButton("Masters", 38, 0, "mail_gmicon", MultiBot.tips.game.master)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Masters"])
end

local tMasters = tMultiBar.addFrame("Masters", 36, 38)
tMasters:Hide()

tMasters.addButton("Summon", 0, 34, "spell_holy_prayerofspirit", MultiBot.tips.game.summon)
.doLeft = function(pButton)
	MultiBot.doDotWithTarget(".summon")
end

tMasters.addButton("Appear", 0, 68, "spell_holy_divinespirit", MultiBot.tips.game.appear)
.doLeft = function(pButton)
	MultiBot.doDotWithTarget(".appear")
end

-- MASTERS:PORTAL --

MultiBot.tips.game.portal =
"Memory-Portal\n|cffffffff"..
"In this Box you will find the Memory-Gems.\n"..
"Use the Memory-Gems to store your current Location.\n"..
"You can teleport yourself to stored Locations by using the Memory-Gems.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to show or hide the Soulgems|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.game.memory =
"Memory-Gem\n|cffffffff"..
"This Memory-Gem ABOUT.\n"..
"You need GameMaster-Rights to use this Button.|r\n\n"..
"|cffff0000Left-Click to store or teleport to the Location|r\n"..
"|cff999999(Execution-Order: Target)|r\n\n"..
"|cffff0000Right-Click to forget the Location|r\n"..
"|cff999999(Execution-Order: Target)|r";

tMasters.addButton("Portal", 0, 0, "inv_box_04", MultiBot.tips.game.portal)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Portal"])
end

local tPortal = tMasters.addFrame("Portal", 30, 2)
tPortal:Hide()

local tButton = tPortal.addButton("Red", 0, 0, "inv_jewelcrafting_gem_16", MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside.")).setDisable()
tButton.doRight = function(pButton)
	if(pButton.state == false) then return SendChatMessage("It has no Location stored inside.", "SAY") end
	pButton.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside.")
	pButton.setDisable()
end
tButton.doLeft = function(pButton)
	local tPlayer = MultiBot.getBot(UnitName("player"))
	if(tPlayer.waitFor == nil) then tPlayer.waitFor = "" end
	if(tPlayer.waitFor ~= "") then return SendChatMessage("I am still in the process of saving my position.", "SAY") end
	if(pButton.state) then return SendChatMessage(".go xyz " .. pButton.goX .. " " .. pButton.goY .. " " .. pButton.goZ .. " " .. pButton.goMap, "SAY")	end
	tPlayer.memory = pButton
	tPlayer.waitFor = "COORDS"
	SendChatMessage(".gps", "SAY")
end

local tButton = tPortal.addButton("Green", 30, 0, "inv_jewelcrafting_gem_13", MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside.")).setDisable()
tButton.doRight = function(pButton)
	if(pButton.state == false) then return SendChatMessage("It has no Location stored inside.", "SAY") end
	pButton.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside.")
	pButton.setDisable()
end
tButton.doLeft = function(pButton)
	local tPlayer = MultiBot.getBot(UnitName("player"))
	if(tPlayer.waitFor == nil) then tPlayer.waitFor = "" end
	if(tPlayer.waitFor ~= "") then return SendChatMessage("I am still in the process of saving my position.", "SAY") end
	if(pButton.state) then return SendChatMessage(".go xyz " .. pButton.goX .. " " .. pButton.goY .. " " .. pButton.goZ .. " " .. pButton.goMap, "SAY")	end
	tPlayer.memory = pButton
	tPlayer.waitFor = "COORDS"
	SendChatMessage(".gps", "SAY")
end

local tButton = tPortal.addButton("Blue", 60, 0, "inv_jewelcrafting_gem_17", MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside.")).setDisable()
tButton.doRight = function(pButton)
	if(pButton.state == false) then return SendChatMessage("It has no Location stored inside.", "SAY") end
	pButton.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside.")
	pButton.setDisable()
end
tButton.doLeft = function(pButton)
	local tPlayer = MultiBot.getBot(UnitName("player"))
	if(tPlayer.waitFor == nil) then tPlayer.waitFor = "" end
	if(tPlayer.waitFor ~= "") then return SendChatMessage("I am still in the process of saving my position.", "SAY") end
	if(pButton.state) then return SendChatMessage(".go xyz " .. pButton.goX .. " " .. pButton.goY .. " " .. pButton.goZ .. " " .. pButton.goMap, "SAY")	end
	tPlayer.memory = pButton
	tPlayer.waitFor = "COORDS"
	SendChatMessage(".gps", "SAY")
end

-- RIGHT --

local tRight = tMultiBar.addFrame("Right", 72, 2, 32)

-- DRINK --

MultiBot.tips.drink = {}
MultiBot.tips.drink.group = 
"Group-Drink\n|cffffffff"..
"With this Button you order the Group to drink.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to execute Group-Drink|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

tRight.addButton("Drink", 0, 0, "inv_drink_24_sealwhey", MultiBot.tips.drink.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("drink")
end

-- RELEASE --

MultiBot.tips.release = {}
MultiBot.tips.release.group = 
"Group-Release\n|cffffffff"..
"With this Button the dead Bots will release there Ghosts to the next Graveyard.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to execute Group-Release|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

tRight.addButton("Release", 34, 0, "achievement_bg_xkills_avgraveyard", MultiBot.tips.release.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("release")
end

-- REVIVE --

MultiBot.tips.revive = {}
MultiBot.tips.revive.group = 
"Group-Revive\n|cffffffff"..
"With this Button the Ghost-Bots will revive on the next Graveyard.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to execute Group-Revive|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

tRight.addButton("Revive", 68, 0, "spell_holy_guardianspirit", MultiBot.tips.revive.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("revive")
end

-- SUMALL --

MultiBot.tips.summon = {}
MultiBot.tips.summon.group = 
"Group-Summon\n|cffffffff"..
"With this Button you summon the Group to your Position.\n"..
"The Execution-Order shows the Receiver for Commandos.|r\n\n"..
"|cffff0000Left-Click to execute Group-Summon|r\n"..
"|cff999999(Execution-Order: Raid, Party)|r";

tRight.addButton("Summon", 102, 0, "ability_hunter_beastcall", MultiBot.tips.summon.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("summon")
end

-- INVENTORY --

MultiBot.tips.inventory = {}

MultiBot.tips.inventory.sell =
"Sell-Items|cffffffff\n"..
"It enables the Sell-Mode of the Inventory.\n"..
"You must have a Merchent as Target.|r\n\n"..
"|cffff0000Left-Click to sell a Item|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.inventory.equip =
"Equip-Items|cffffffff\n"..
"It enables the Equip-Mode of the Inventory.|r\n\n"..
"|cffff0000Left-Click to equip a Item|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.inventory.use =
"Use-Items|cffffffff\n"..
"It enables the Use-Mode of the Inventory.|r\n\n"..
"|cffff0000Left-Click to use a Item|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.inventory.drop =
"Drop-Items|cffffffff\n"..
"It enables the Drop-Mode of the Inventory.\n"..
"For security Resons your Bot will not drop:\n"..
"- every Item with a Quality of Epic or higher\n"..
"- every Item with 'Key' in its Name\n"..
"- the Hearthstone|r\n\n"..
"|cffff0000Left-Click to drop a Item|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.inventory = MultiBot.newFrame(MultiBot, -700, -144, 32, 442, 884)
MultiBot.inventory.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Inventory.blp")
MultiBot.inventory.action = "s"
MultiBot.inventory:Hide()

MultiBot.inventory.addButton("Sell", -94, 806, "inv_misc_coin_16", MultiBot.tips.inventory.sell).setEnable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
	else
		MultiBot.inventory.action = "s"
		pButton.getButton("Destroy").setDisable()
		pButton.getButton("Equip").setDisable()
		pButton.getButton("Use").setDisable()
		pButton.setEnable()
	end
end

MultiBot.inventory.addButton("Equip", -94, 768, "inv_helmet_22", MultiBot.tips.inventory.equip).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
	else
		MultiBot.inventory.action = "e"
		pButton.getButton("Destroy").setDisable()
		pButton.getButton("Sell").setDisable()
		pButton.getButton("Use").setDisable()
		pButton.setEnable()
	end
end

MultiBot.inventory.addButton("Use", -94, 731, "inv_gauntlets_25", MultiBot.tips.inventory.use).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
	else
		MultiBot.inventory.action = "u"
		pButton.getButton("Destroy").setDisable()
		pButton.getButton("Equip").setDisable()
		pButton.getButton("Sell").setDisable()
		pButton.setEnable()
	end
end

MultiBot.inventory.addButton("Destroy", -94, 694, "inv_hammer_15", MultiBot.tips.inventory.drop).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
	else
		MultiBot.inventory.action = "drop"
		pButton.getButton("Equip").setDisable()
		pButton.getButton("Sell").setDisable()
		pButton.getButton("Use").setDisable()
		pButton.setEnable()
	end
end

local tFrame = MultiBot.inventory.addFrame("Items", -397, 807, 32)
tFrame:Show()

-- STATS --

MultiBot.stats = MultiBot.newFrame(MultiBot, -60, 560, 32)
MultiBot.addStats(MultiBot.stats, "party1", 0,    0, 32, 192, 96)
MultiBot.addStats(MultiBot.stats, "party2", 0,  -60, 32, 192, 96)
MultiBot.addStats(MultiBot.stats, "party3", 0, -120, 32, 192, 96)
MultiBot.addStats(MultiBot.stats, "party4", 0, -180, 32, 192, 96)

-- FINISH --

MultiBot.state = true
print("MultiBot")