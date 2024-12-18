-- MULTIBAR --

local tMultiBar = MultiBot.addFrame("MultiBar", -262, 144, 36)
tMultiBar:SetMovable(true)

-- LEFT --

local tLeft = tMultiBar.addFrame("Left", -76, 2, 32)

-- TANKER --

tLeft.addButton("Tanker", -170, 0, "ability_warrior_shieldbash", MultiBot.tips.tanker.master)
.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@tank do attack my target") end
end

-- ATTACK --

local tButton = tLeft.addButton("Attack", -136, 0, "Interface\\AddOns\\MultiBot\\Icons\\attack.blp", MultiBot.tips.attack.master)
tButton.doRight = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Attack"])
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("do attack my target") end
end

local tAttack = tLeft.addFrame("Attack", -138, 34)
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

local tButton = tLeft.addButton("Mode", -102, 0, "Interface\\AddOns\\MultiBot\\Icons\\mode_passive.blp", MultiBot.tips.mode.master).setDisable()
tButton.doRight = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Mode"])
end
tButton.doLeft = function(pButton)
	if(MultiBot.OnOffSwitch(pButton)) then
		MultiBot.ActionToGroup("co +passive,?")
	else
		MultiBot.ActionToGroup("co -passive,?")
	end
end

local tMode = tLeft.addFrame("Mode", -104, 34)
tMode:Hide()

tMode.addButton("Passive", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\mode_passive.blp", MultiBot.tips.mode.passive)
.doLeft = function(pButton)
	if(MultiBot.SelectToGroup(pButton.parent.parent, "Mode", pButton.texture, "co +passive,?")) then
		pButton.parent.parent.buttons["Mode"].setEnable().doLeft = function(pButton)
			if(MultiBot.OnOffSwitch(pButton)) then
				MultiBot.ActionToGroup("co +passive,?")
			else
				MultiBot.ActionToGroup("co -passive,?")
			end
		end
	end
end

tMode.addButton("Grind", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\mode_grind.blp", MultiBot.tips.mode.grind)
.doLeft = function(pButton)
	if(MultiBot.SelectToGroup(pButton.parent.parent, "Mode", pButton.texture, "grind")) then
		pButton.parent.parent.buttons["Mode"].setEnable().doLeft = function(pButton)
			if(MultiBot.OnOffSwitch(pButton)) then
				MultiBot.ActionToGroup("grind")
			else
				MultiBot.ActionToGroup("follow")
			end
		end
	end
end

-- STAY|FOLLOW --

tLeft.addButton("Stay", -68, 0, "Interface\\AddOns\\MultiBot\\Icons\\command_follow.blp", MultiBot.tips.stallow.stay)
.doLeft = function(pButton)
	if(MultiBot.ActionToGroup("stay")) then
		pButton.parent.buttons["Follow"].doShow()
		pButton.doHide()
	end
end

tLeft.addButton("Follow", -68, 0, "Interface\\AddOns\\MultiBot\\Icons\\command_stay.blp", MultiBot.tips.stallow.follow).doHide()
.doLeft = function(pButton)
	if(MultiBot.ActionToGroup("follow")) then
		pButton.parent.buttons["Stay"].doShow()
		pButton.doHide()
	end
end

-- FLEE --

local tButton = tLeft.addButton("Flee", -34, 0, "Interface\\AddOns\\MultiBot\\Icons\\flee.blp", MultiBot.tips.flee.master)
tButton.doRight = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Flee"])
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("flee")
end

local tFlee = tLeft.addFrame("Flee", -36, 34)
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

local tButton = tLeft.addButton("Format", -0, 0, "Interface\\AddOns\\MultiBot\\Icons\\formation_near.blp", MultiBot.tips.format.master)
tButton.doRight = function(pButton)
	MultiBot.ActionToGroup("formation")
end
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Format"])
end

local tFormat = tLeft.addFrame("Format", -2, 34)
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

-- BEASTMASTER --

tLeft.addButton("Beast", -0, 0, "ability_mount_swiftredwindrider", MultiBot.tips.beast.master).doHide()
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

-- CREATOR --

tLeft.addButton("Creator", -0, 0, "inv_helmet_145a", MultiBot.tips.creator.master).doHide()
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Creator"])
	MultiBot.frames["MultiBar"].frames["Units"]:Hide()
end

local tCreator = tLeft.addFrame("Creator", -2, 34)
tCreator:Hide()

tCreator.addButton("Warrior", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\addclass_warrior.blp", MultiBot.tips.creator.warrior)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass warrior", "SAY")
end

tCreator.addButton("Warlock", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\addclass_warlock.blp", MultiBot.tips.creator.warlock)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass warlock", "SAY")
end

tCreator.addButton("Shaman", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\addclass_shaman.blp", MultiBot.tips.creator.shaman)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass shaman", "SAY")
end

tCreator.addButton("Rogue", 0, 90, "Interface\\AddOns\\MultiBot\\Icons\\addclass_rogue.blp", MultiBot.tips.creator.rogue)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass rogue", "SAY")
end

tCreator.addButton("Priest", 0, 120, "Interface\\AddOns\\MultiBot\\Icons\\addclass_priest.blp", MultiBot.tips.creator.priest)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass priest", "SAY")
end

tCreator.addButton("Paladin", 0, 150, "Interface\\AddOns\\MultiBot\\Icons\\addclass_paladin.blp", MultiBot.tips.creator.paladin)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass paladin", "SAY")
end

tCreator.addButton("Mage", 0, 180, "Interface\\AddOns\\MultiBot\\Icons\\addclass_mage.blp", MultiBot.tips.creator.mage)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass mage", "SAY")
end

tCreator.addButton("Hunter", 0, 210, "Interface\\AddOns\\MultiBot\\Icons\\addclass_hunter.blp", MultiBot.tips.creator.hunter)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass hunter", "SAY")
end

tCreator.addButton("Druid", 0, 240, "Interface\\AddOns\\MultiBot\\Icons\\addclass_druid.blp", MultiBot.tips.creator.druid)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass druid", "SAY")
end

tCreator.addButton("DeathKnight", 0, 270, "Interface\\AddOns\\MultiBot\\Icons\\addclass_deathknight.blp", MultiBot.tips.creator.deathknight)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass dk", "SAY")
end

tCreator.addButton("Inspect", 0, 300, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", MultiBot.tips.creator.inspect)
.doLeft = function(pButton)
	local tName = UnitName("target")
	if(tName == nil or tName == "Unknown Entity") then return SendChatMessage("I dont have a Target.", "SAY") end
	InspectUnit(tName)
end

local tButton = tCreator.addButton("Init", 0, 330, "inv_misc_enggizmos_27", MultiBot.tips.creator.init)
tButton.doRight = function(pButton)
	if(GetNumRaidMembers() > 0) then
		for i = 1, GetNumRaidMembers() do
			local tName = UnitName("raid" .. i)
			if(MultiBot.isRoster("players", tName))	then SendChatMessage(MultiBot.doReplace(MultiBot.info.player, "NAME", tName), "SAY")
			elseif(MultiBot.isRoster("members", tName)) then SendChatMessage(MultiBot.doReplace(MultiBot.info.member, "NAME", tName), "SAY")
			elseif(tName ~= UnitName("player")) then SendChatMessage(".playerbot bot init=auto " .. tName, "SAY")
			end
		end
		
		return
	end
	
	if(GetNumPartyMembers() > 0) then
		for i = 1, GetNumPartyMembers() do
			local tName = UnitName("party" .. i)
			if(MultiBot.isRoster("players", tName))	then SendChatMessage(MultiBot.doReplace(MultiBot.info.player, "NAME", tName), "SAY")
			elseif(MultiBot.isRoster("members", tName)) then SendChatMessage(MultiBot.doReplace(MultiBot.info.member, "NAME", tName), "SAY")
			elseif(tName ~= UnitName("player")) then SendChatMessage(".playerbot bot init=auto " .. tName, "SAY")
			end
		end
		
		return
	end
	
	SendChatMessage(MultiBot.info.group, "SAY")
end
tButton.doLeft = function(pButton)
	local tName = UnitName("target")
	if(tName == nil or tName == "Unknown Entity") then return SendChatMessage(MultiBot.info.target, "SAY") end
	if(MultiBot.isRoster("players", tName)) then return SendChatMessage(MultiBot.info.players, "SAY") end
	if(MultiBot.isRoster("members", tName)) then return SendChatMessage(MultiBot.info.members, "SAY") end
	SendChatMessage(".playerbot bot init=auto " .. tName, "SAY")
end

-- UNITS --

local tButton = tMultiBar.addButton("Units", -38, 0, "inv_scroll_04", MultiBot.tips.units.master)
tButton.roster = "players"
tButton.filter = "none"

tButton.doRight = function(pButton)
	-- MEMBERBOTS --
	
	for i = 1, 50 do
		local tName, tRank, tIndex, tLevel, tClass = GetGuildRosterInfo(i)
		
		-- Ensure that the Counter is not bigger than the Amount of Members in Guildlist
		if(tName ~= nil and tLevel ~= nil and tClass ~= nil and tName ~= UnitName("player")) then
			local tMember = MultiBot.addMember(tClass, tLevel, tName)
			
			if(tMember.state == false)
			then tMember.setDisable()
			else tMember.setEnable()
			end
			
			tMember.doRight = function(pButton)
				if(pButton.state == false) then return end
				SendChatMessage(".playerbot bot remove " .. pButton.name, "SAY")
				if(pButton.parent.frames[pButton.name] ~= nil) then pButton.parent.frames[pButton.name]:Hide() end
				pButton.setDisable()
			end
			
			tMember.doLeft = function(pButton)
				if(pButton.state) then
					if(pButton.parent.frames[pButton.name] ~= nil) then MultiBot.ShowHideSwitch(pButton.parent.frames[pButton.name]) end
				else
					SendChatMessage(".playerbot bot add " .. pButton.name, "SAY")
					pButton.setEnable()
				end
			end
		else
			break
		end
	end
	
	-- FRIENDBOTS --
	
	for i = 1, 50 do
		local tName, tLevel, tClass = GetFriendInfo(i)
		
		-- Ensure that the Counter is not bigger than the Amount of Members in Friendlist
		if(tName ~= nil and tLevel ~= nil and tClass ~= nil and tName ~= UnitName("player")) then
			local tFriend = MultiBot.addFriend(tClass, tLevel, tName)
			
			if(tFriend.state == false)
			then tFriend.setDisable()
			else tFriend.setEnable()
			end
			
			tFriend.doRight = function(pButton)
				if(pButton.state == false) then return end
				SendChatMessage(".playerbot bot remove " .. pButton.name, "SAY")
				if(pButton.parent.frames[pButton.name] ~= nil) then pButton.parent.frames[pButton.name]:Hide() end
				pButton.setDisable()
			end
			
			tFriend.doLeft = function(pButton)
				if(pButton.state) then
					if(pButton.parent.frames[pButton.name] ~= nil) then MultiBot.ShowHideSwitch(pButton.parent.frames[pButton.name]) end
				else
					SendChatMessage(".playerbot bot add " .. pButton.name, "SAY")
					pButton.setEnable()
				end
			end
		else
			break
		end
	end
	
	pButton.doLeft(pButton, pButton.roster, pButton.filter)
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
	
	if(pButton.limit < 11)
	then tUnits.frames["Control"].buttons["Browse"]:Hide()
	else tUnits.frames["Control"].buttons["Browse"]:Show()
	end
end

local tUnits = tMultiBar.addFrame("Units", -40, 38)
tUnits:Hide()

local tControl = tUnits.addFrame("Control", -2, 0)
tControl:Show()

-- UNITS:FILTER --

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
	pButton.parent.parent.buttons["Invite"].setEnable()
	pButton.parent.parent.frames["Invite"]:Hide()
	tButton.doLeft(tButton, "friends")
end

tRoster.addButton("Members", -26, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_members.blp", MultiBot.tips.units.members)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	pButton.parent.parent.buttons["Invite"].setEnable()
	pButton.parent.parent.frames["Invite"]:Hide()
	tButton.doLeft(tButton, "members")
end

tRoster.addButton("Players", -52, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_players.blp", MultiBot.tips.units.players)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	pButton.parent.parent.buttons["Invite"].setEnable()
	pButton.parent.parent.frames["Invite"]:Hide()
	tButton.doLeft(tButton, "players")
end

tRoster.addButton("Actives", -78, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_actives.blp", MultiBot.tips.units.actives)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	pButton.parent.parent.buttons["Invite"].setDisable()
	pButton.parent.parent.frames["Invite"]:Hide()
	tButton.doLeft(tButton, "actives")
end

-- UNITS:BROWSE --

local tButton = tControl.addButton("Invite", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\invite.blp", MultiBot.tips.units.invite).setEnable()
tButton.doRight = function(pButton)
	if(GetNumRaidMembers() > 0 or GetNumPartyMembers() > 0) then
		return SendChatMessage(".playerbot bot remove *", "SAY")
	else
		MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
		MultiBot.timer.invite.needs = table.getn(MultiBot.index[MultiBot.timer.invite.roster])
		MultiBot.timer.invite.index = 1
		MultiBot.auto.invite = true
		SendChatMessage(MultiBot.info.starting, "SAY")
	end
end
tButton.doLeft = function(pButton)
	if(pButton.state) then MultiBot.ShowHideSwitch(pButton.parent.frames["Invite"]) end
end

local tInvite = tControl.addFrame("Invite", -30, 62)
tInvite:Hide()

tInvite.addButton("Party+5", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_party_5.blp", MultiBot.tips.units.inviteParty5)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage(MultiBot.info.wait, "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = MultiBot.IF(tRaid > 0, 5 - tRaid, MultiBot.IF(tParty > 0, 4 - tParty, 4))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage(MultiBot.info.starting, "SAY")
end

tInvite.addButton("Raid+10", 56, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_raid_10.blp", MultiBot.tips.units.inviteRaid10)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage(MultiBot.info.wait, "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 10 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage(MultiBot.info.starting, "SAY")
end

tInvite.addButton("Raid+25", 82, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_raid_25.blp", MultiBot.tips.units.inviteRaid25)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage(MultiBot.info.wait, "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 25 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage(MultiBot.info.starting, "SAY")
end

tInvite.addButton("Raid+40", 108, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_raid_40.blp", MultiBot.tips.units.inviteRaid40)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage(MultiBot.info.wait, "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 40 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage(MultiBot.info.starting, "SAY")
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

local tButton = tMultiBar.addButton("Main", 0, 0, "inv_gizmo_02", MultiBot.tips.main.master)
tButton:RegisterForDrag("RightButton")
tButton:SetScript("OnDragStart", function()
	MultiBot.frames["MultiBar"]:StartMoving()
end)
tButton:SetScript("OnDragStop", function()
	MultiBot.frames["MultiBar"]:StopMovingOrSizing()
end)
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Main"])
end

local tMain = tMultiBar.addFrame("Main", -2, 38)
tMain:Hide()

tMain.addButton("Coords", 0, 0, "inv_gizmo_03", MultiBot.tips.main.coords)
.doLeft = function(pButton)
	MultiBot.frames["MultiBar"].setPoint(-262, 144)
	MultiBot.inventory.setPoint(-700, -144)
	MultiBot.spellbook.setPoint(-802, 302)
	MultiBot.talent.setPoint(-104, -276)
	MultiBot.reward.setPoint(-754,  238)
	MultiBot.itemus.setPoint(-860, -144)
	MultiBot.iconos.setPoint(-860, -144)
	MultiBot.stats.setPoint(-60, 560)
end

tMain.addButton("Masters", 0, 34, "mail_gmicon", MultiBot.tips.main.masters).setDisable()
.doLeft = function(pButton)
	if(MultiBot.GM == false) then return SendChatMessage(MultiBot.info.rights, "SAY") end
	if(MultiBot.OnOffSwitch(pButton)) then
		MultiBot.doRepos("Right", 38)
		MultiBot.frames["MultiBar"].frames["Masters"]:Hide()
		MultiBot.frames["MultiBar"].buttons["Masters"]:Show()
	else
		MultiBot.doRepos("Right", -38)
		MultiBot.frames["MultiBar"].frames["Masters"]:Hide()
		MultiBot.frames["MultiBar"].buttons["Masters"]:Hide()
	end
end

tMain.addButton("Creator", 0, 68, "inv_helmet_145a", MultiBot.tips.main.creator).setDisable()
.doLeft = function(pButton)
	if(MultiBot.OnOffSwitch(pButton)) then
		MultiBot.doRepos("Tanker", -34)
		MultiBot.doRepos("Attack", -34)
		MultiBot.doRepos("Mode", -34)
		MultiBot.doRepos("Stay", -34)
		MultiBot.doRepos("Follow", -34)
		MultiBot.doRepos("Flee", -34)
		MultiBot.doRepos("Format", -34)
		MultiBot.doRepos("Beast", -34)
		MultiBot.frames["MultiBar"].frames["Left"].frames["Creator"]:Hide()
		MultiBot.frames["MultiBar"].frames["Left"].buttons["Creator"]:Show()
	else
		MultiBot.doRepos("Tanker", 34)
		MultiBot.doRepos("Attack", 34)
		MultiBot.doRepos("Mode", 34)
		MultiBot.doRepos("Stay", 34)
		MultiBot.doRepos("Follow", 34)
		MultiBot.doRepos("Flee", 34)
		MultiBot.doRepos("Format", 34)
		MultiBot.doRepos("Beast", 34)
		MultiBot.frames["MultiBar"].frames["Left"].frames["Creator"]:Hide()
		MultiBot.frames["MultiBar"].frames["Left"].buttons["Creator"]:Hide()
	end
end

tMain.addButton("Beast", 0, 102, "ability_mount_swiftredwindrider", MultiBot.tips.main.beast).setDisable()
.doLeft = function(pButton)
	if(MultiBot.OnOffSwitch(pButton)) then
		MultiBot.doRepos("Tanker", -34)
		MultiBot.doRepos("Attack", -34)
		MultiBot.doRepos("Mode", -34)
		MultiBot.doRepos("Stay", -34)
		MultiBot.doRepos("Follow", -34)
		MultiBot.doRepos("Flee", -34)
		MultiBot.doRepos("Format", -34)
		MultiBot.frames["MultiBar"].frames["Left"].frames["Beast"]:Hide()
		MultiBot.frames["MultiBar"].frames["Left"].buttons["Beast"]:Show()
	else
		MultiBot.doRepos("Tanker", 34)
		MultiBot.doRepos("Attack", 34)
		MultiBot.doRepos("Mode", 34)
		MultiBot.doRepos("Stay", 34)
		MultiBot.doRepos("Follow", 34)
		MultiBot.doRepos("Flee", 34)
		MultiBot.doRepos("Format", 34)
		MultiBot.frames["MultiBar"].frames["Left"].frames["Beast"]:Hide()
		MultiBot.frames["MultiBar"].frames["Left"].buttons["Beast"]:Hide()
	end
end

--[[
local tButton = tMain.addButton("Language", 0, 34, "Interface\\AddOns\\MultiBot\\Icons\\language_none.blp", MultiBot.tips.main.lang.master).setDisable()
tButton.doRight = function(pButton)
	MultiBot.auto.language = MultiBot.OnOffSwitch(pButton) == false
end
tButton.doLeft = function(pButton)
	if(MultiBot.auto.language == true) then return SendChatMessage(MultiBot.info.language, "SAY") end
	MultiBot.ShowHideSwitch(pButton.parent.frames["Language"])
end

local tFrame = tMain.addFrame("Language", -36, 36)
tFrame:Hide()

tFrame.addButton("deDE", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\language_deDE.blp", MultiBot.tips.main.lang.deDE)
.doLeft = function(pButton)
	MultiBot.Select(pButton.parent.parent, "Language", pButton.texture)
	MultiBot.doSlash("/reload")
	MultiBot.language = "deDE"
end

tFrame.addButton("enGB", -30, 0, "Interface\\AddOns\\MultiBot\\Icons\\language_enGB.blp", MultiBot.tips.main.lang.enGB)
.doLeft = function(pButton)
	MultiBot.Select(pButton.parent.parent, "Language", pButton.texture)
	MultiBot.doSlash("/reload")
	MultiBot.language = "enGB"
end

tFrame.addButton("None", -60, 0, "Interface\\AddOns\\MultiBot\\Icons\\language_none.blp", MultiBot.tips.main.lang.none)
.doLeft = function(pButton)
	MultiBot.Select(pButton.parent.parent, "Language", pButton.texture)
	MultiBot.doSlash("/reload")
	MultiBot.language = "none"
end
]]--

tMain.addButton("Release", 0, 136, "achievement_bg_xkills_avgraveyard", MultiBot.tips.main.release).setDisable()
.doLeft = function(pButton)
	if(MultiBot.OnOffSwitch(pButton)) then
		MultiBot.auto.release = true
	else
		MultiBot.auto.release = false
	end
end

tMain.addButton("Stats", 0, 170, "inv_scroll_08", MultiBot.tips.main.stats).setDisable()
.doLeft = function(pButton)
	if(GetNumRaidMembers() > 0) then return SendChatMessage(MultiBot.info.stats, "SAY") end
	if(MultiBot.OnOffSwitch(pButton)) then
		MultiBot.auto.stats = true
		for i = 1, GetNumPartyMembers() do SendChatMessage("stats", "WHISPER", nil, UnitName("party" .. i)) end
		MultiBot.stats:Show()
	else
		MultiBot.auto.stats = false
		for key, value in pairs(MultiBot.stats.frames) do value:Hide() end
		MultiBot.stats:Hide()
	end
end

local tButton = tMain.addButton("Reward", 0, 204, "Interface\\AddOns\\MultiBot\\Icons\\reward.blp", MultiBot.tips.main.reward).setDisable()
tButton.doRight = function(pButton)
	if(table.getn(MultiBot.reward.rewards) > 0 and table.getn(MultiBot.reward.units) > 0) then MultiBot.reward:Show() end
end
tButton.doLeft = function(pButton)
	MultiBot.reward.state = MultiBot.OnOffSwitch(pButton)
end

tMain.addButton("Reset", 0, 238, "inv_misc_tournaments_symbol_gnome", MultiBot.tips.main.reset)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("reset botAI")
end

tMain.addButton("Actions", 0, 272, "inv_helmet_02", MultiBot.tips.main.action)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("reset")
end

-- GAMEMASTER --

local tButton = tMultiBar.addButton("Masters", 38, 0, "mail_gmicon", MultiBot.tips.game.master).doHide()
tButton.doRight = function(pButton)
	MultiBot.doSlash("/MultiBot", "")
end
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Masters"])
end

local tMasters = tMultiBar.addFrame("Masters", 36, 38)
tMasters:Hide()

tMasters.addButton("NecroNet", 0, 0, "achievement_bg_xkills_avgraveyard", MultiBot.tips.game.necronet).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.necronet.state = false
		for key, value in pairs(MultiBot.necronet.buttons) do value:Hide() end
		pButton.setDisable()
	else
		MultiBot.necronet.cont = 0
		MultiBot.necronet.area = 0
		MultiBot.necronet.zone = 0
		MultiBot.necronet.state = true
		pButton.setEnable()
	end
end

tMasters.addButton("Portal", 0, 34, "inv_box_02", MultiBot.tips.game.portal)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Portal"])
end

local tPortal = tMasters.addFrame("Portal", 30, 36)
tPortal:Hide()

local tButton = tPortal.addButton("Red", 0, 0, "inv_jewelcrafting_gem_16", MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", MultiBot.info.location)).setDisable()
tButton.goMap = ""
tButton.goX = 0
tButton.goY = 0
tButton.goZ = 0

tButton.doRight = function(pButton)
	if(pButton.state == false) then return SendChatMessage(MultiBot.info.itlocation, "SAY") end
	pButton.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", MultiBot.info.location)
	pButton.setDisable()
end
tButton.doLeft = function(pButton)
	local tPlayer = MultiBot.getBot(UnitName("player"))
	if(tPlayer.waitFor == nil) then tPlayer.waitFor = "" end
	if(tPlayer.waitFor ~= "") then return SendChatMessage(MultiBot.info.saving, "SAY") end
	if(pButton.state) then return SendChatMessage(".go xyz " .. pButton.goX .. " " .. pButton.goY .. " " .. pButton.goZ .. " " .. pButton.goMap, "SAY")	end
	tPlayer.memory = pButton
	tPlayer.waitFor = "COORDS"
	SendChatMessage(".gps", "SAY")
end

local tButton = tPortal.addButton("Green", 30, 0, "inv_jewelcrafting_gem_13", MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", MultiBot.info.location)).setDisable()
tButton.goMap = ""
tButton.goX = 0
tButton.goY = 0
tButton.goZ = 0

tButton.doRight = function(pButton)
	if(pButton.state == false) then return SendChatMessage(MultiBot.info.itlocation, "SAY") end
	pButton.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", MultiBot.info.location)
	pButton.setDisable()
end
tButton.doLeft = function(pButton)
	local tPlayer = MultiBot.getBot(UnitName("player"))
	if(tPlayer.waitFor == nil) then tPlayer.waitFor = "" end
	if(tPlayer.waitFor ~= "") then return SendChatMessage(MultiBot.info.saving, "SAY") end
	if(pButton.state) then return SendChatMessage(".go xyz " .. pButton.goX .. " " .. pButton.goY .. " " .. pButton.goZ .. " " .. pButton.goMap, "SAY")	end
	tPlayer.memory = pButton
	tPlayer.waitFor = "COORDS"
	SendChatMessage(".gps", "SAY")
end

local tButton = tPortal.addButton("Blue", 60, 0, "inv_jewelcrafting_gem_17", MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", MultiBot.info.location)).setDisable()
tButton.goMap = ""
tButton.goX = 0
tButton.goY = 0
tButton.goZ = 0

tButton.doRight = function(pButton)
	if(pButton.state == false) then return SendChatMessage(MultiBot.info.itlocation, "SAY") end
	pButton.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", MultiBot.info.location)
	pButton.setDisable()
end
tButton.doLeft = function(pButton)
	local tPlayer = MultiBot.getBot(UnitName("player"))
	if(tPlayer.waitFor == nil) then tPlayer.waitFor = "" end
	if(tPlayer.waitFor ~= "") then return SendChatMessage(MultiBot.info.saving, "SAY") end
	if(pButton.state) then return SendChatMessage(".go xyz " .. pButton.goX .. " " .. pButton.goY .. " " .. pButton.goZ .. " " .. pButton.goMap, "SAY")	end
	tPlayer.memory = pButton
	tPlayer.waitFor = "COORDS"
	SendChatMessage(".gps", "SAY")
end

tMasters.addButton("Itemus", 0, 68, "inv_box_01", MultiBot.tips.game.itemus)
.doLeft = function(pButton)
	if(MultiBot.ShowHideSwitch(MultiBot.itemus)) then
		MultiBot.itemus.addItems()
	end
end

tMasters.addButton("Iconos", 0, 102, "inv_mask_01", MultiBot.tips.game.iconos)
.doLeft = function(pButton)
	if(MultiBot.ShowHideSwitch(MultiBot.iconos)) then
		MultiBot.iconos.addIcons()
	end
end

tMasters.addButton("Summon", 0, 136, "spell_holy_prayerofspirit", MultiBot.tips.game.summon)
.doLeft = function(pButton)
	MultiBot.doDotWithTarget(".summon")
end

tMasters.addButton("Appear", 0, 170, "spell_holy_divinespirit", MultiBot.tips.game.appear)
.doLeft = function(pButton)
	MultiBot.doDotWithTarget(".appear")
end

-- RIGHT --

local tRight = tMultiBar.addFrame("Right", 34, 2, 32)

-- QUEST --

local tButton = tRight.addButton("Quests", 0, 0, "inv_misc_book_07", MultiBot.tips.quests.master)
tButton.doRight = function(pButton)
	local tEntries, tQuests = GetNumQuestLogEntries()
	local tFrame = pButton.parent.frames["Quests"]
	local tIndex = 0
	
	for key, value in pairs(tFrame.buttons) do value:Hide() end
	for key, value in pairs(tFrame.texts) do value:Hide() end
	tFrame.buttons = {}
	tFrame.texts = {}
		
	for i = 1, tEntries do
		local tLink = GetQuestLink(i)
		local tTitle, tLevel, tGroup, tHeader, tCollapsed, tComplete = GetQuestLogTitle(i)
		
		if(tCollapsed == nil) then
			local tButton = tFrame.addButton("Quest" .. i, 0, tIndex * 30, "inv_misc_note_01", tLink)
			tButton.link = tLink
			tButton.id = i
			
			tButton.doRight = function(pButton)
				if(GetNumPartyMembers() > 0) then SendChatMessage("drop " .. pButton.link, "PARTY") end
				if(GetNumRaidMembers() > 0) then SendChatMessage("drop " .. pButton.link, "RAID") end
				SelectQuestLogEntry(pButton.id)
				SetAbandonQuest()
				AbandonQuest()
			end
			
			tButton.doLeft = function(pButton)
				SelectQuestLogEntry(pButton.id)
				QuestLogPushQuest()
			end
			
			tFrame.addText("Title" .. i, tTitle, "BOTTOMLEFT", 30, tIndex * 30 + 14, 12)
			tIndex = tIndex + 1
		end
	end
end
tButton.doLeft = function(pButton)
	if(MultiBot.ShowHideSwitch(pButton.parent.frames["Quests"])) then pButton.doRight(pButton) end
end

local tQuests = tRight.addFrame("Quests", -2, 34)
tQuests:Hide()

-- DRINK --

tRight.addButton("Drink", 34, 0, "inv_drink_24_sealwhey", MultiBot.tips.drink.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("drink")
end

-- RELEASE --

tRight.addButton("Release", 68, 0, "achievement_bg_xkills_avgraveyard", MultiBot.tips.release.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("release")
end

-- REVIVE --

tRight.addButton("Revive", 102, 0, "spell_holy_guardianspirit", MultiBot.tips.revive.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("revive")
end

-- SUMALL --

tRight.addButton("Summon", 136, 0, "ability_hunter_beastcall", MultiBot.tips.summon.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("summon")
end

-- INVENTORY --

MultiBot.inventory = MultiBot.newFrame(MultiBot, -700, -144, 32, 442, 884)
MultiBot.inventory.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Inventory.blp")
MultiBot.inventory.addText("Title", "Inventory", "CENTER", -58, 429, 12)
MultiBot.inventory.action = "s"
MultiBot.inventory:SetMovable(true)
MultiBot.inventory:Hide()

MultiBot.inventory.movButton("Move", -406, 849, 34, MultiBot.tips.move.inventory)

MultiBot.inventory.wowButton("X", -126, 862, 15, 18, 13)
.doLeft = function(pButton)
	local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
	local tButton = tUnits.frames[MultiBot.inventory.name].buttons["Inventory"]
	tButton.doLeft(tButton)
end

MultiBot.inventory.addButton("Sell", -94, 806, "inv_misc_coin_16", MultiBot.tips.inventory.sell).setEnable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
	else
		CancelTrade()
		MultiBot.inventory.action = "s"
		pButton.getButton("Destroy").setDisable()
		pButton.getButton("Equip").setDisable()
		pButton.getButton("Trade").setDisable()
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
		CancelTrade()
		MultiBot.inventory.action = "e"
		pButton.getButton("Destroy").setDisable()
		pButton.getButton("Trade").setDisable()
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
		CancelTrade()
		MultiBot.inventory.action = "u"
		pButton.getButton("Destroy").setDisable()
		pButton.getButton("Equip").setDisable()
		pButton.getButton("Trade").setDisable()
		pButton.getButton("Sell").setDisable()
		pButton.setEnable()
	end
end

MultiBot.inventory.addButton("Trade", -94, 694, "achievement_reputation_01", MultiBot.tips.inventory.trade).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
		CancelTrade()
	else
		InitiateTrade(pButton.getName())
		MultiBot.inventory.action = "give"
		pButton.getButton("Destroy").setDisable()
		pButton.getButton("Equip").setDisable()
		pButton.getButton("Sell").setDisable()
		pButton.getButton("Use").setDisable()
		pButton.setEnable()
	end
end

MultiBot.inventory.addButton("Destroy", -94, 657, "inv_hammer_15", MultiBot.tips.inventory.drop).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
	else
		CancelTrade()
		MultiBot.inventory.action = "destroy"
		pButton.getButton("Equip").setDisable()
		pButton.getButton("Trade").setDisable()
		pButton.getButton("Sell").setDisable()
		pButton.getButton("Use").setDisable()
		pButton.setEnable()
	end
end

MultiBot.inventory.addButton("Open", -94, 322.5, "inv_misc_gift_05", MultiBot.tips.inventory.open)
.doLeft = function(pButton)
	SendChatMessage("open items", "WHISPER", nil, pButton.getName())
end

local tFrame = MultiBot.inventory.addFrame("Items", -397, 807, 32)
tFrame:Show()

-- STATS --

MultiBot.stats = MultiBot.newFrame(MultiBot, -60, 560, 32)
MultiBot.stats:SetMovable(true)
MultiBot.stats:Hide()

MultiBot.stats.movButton("Move", 0, -80, 160, MultiBot.tips.move.stats)

MultiBot.addStats(MultiBot.stats, "party1", 0,    0, 32, 192, 96)
MultiBot.addStats(MultiBot.stats, "party2", 0,  -60, 32, 192, 96)
MultiBot.addStats(MultiBot.stats, "party3", 0, -120, 32, 192, 96)
MultiBot.addStats(MultiBot.stats, "party4", 0, -180, 32, 192, 96)

-- ITEMUS --

MultiBot.itemus = MultiBot.newFrame(MultiBot, -860, -144, 32, 442, 884)
MultiBot.itemus.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Inventory.blp")
MultiBot.itemus.addText("Title", "Itemus", "CENTER", -57, 429, 13)
MultiBot.itemus.addText("Pages", "0/0", "CENTER", -57, 409, 13)
MultiBot.itemus.name = UnitName("Player")
MultiBot.itemus.index = {}
MultiBot.itemus.color = "cff9d9d9d"
MultiBot.itemus.level = "L10"
MultiBot.itemus.rare = "R00"
MultiBot.itemus.slot = "S00"
MultiBot.itemus.type = "PC"
MultiBot.itemus.max = 1
MultiBot.itemus.now = 1
MultiBot.itemus:SetMovable(true)
MultiBot.itemus:Hide()

MultiBot.itemus.movButton("Move", -407, 850, 32, MultiBot.tips.move.itemus)

MultiBot.itemus.wowButton("<", -319, 841, 15, 18, 13).doHide()
.doLeft = function(pButton)
	MultiBot.itemus.now = MultiBot.itemus.now - 1
	MultiBot.itemus.addItems()
end

MultiBot.itemus.wowButton(">", -225, 841, 15, 18, 13).doHide()
.doLeft = function(pButton)
	MultiBot.itemus.now = MultiBot.itemus.now + 1
	MultiBot.itemus.addItems()
end

MultiBot.itemus.wowButton("X", -126, 862, 15, 18, 13)
.doLeft = function(pButton)
	MultiBot.itemus:Hide()
end

local tFrame = MultiBot.itemus.addFrame("Items", -397, 807, 32)
tFrame:Show()

-- ITEMUS:LEVEL --

MultiBot.itemus.addButton("Level", -94, 806, "achievement_level_10", MultiBot.tips.itemus.level.master).setEnable()
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Level"])
end

local tFrame = MultiBot.itemus.addFrame("Level", -61, 808, 28)
tFrame:Hide()

tFrame.addButton("L10", 0, 0, "achievement_level_10", MultiBot.tips.itemus.level.L10)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L10"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L20", 30, 0, "achievement_level_20", MultiBot.tips.itemus.level.L20)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L20"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L30", 60, 0, "achievement_level_30", MultiBot.tips.itemus.level.L30)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L30"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L40", 90, 0, "achievement_level_40", MultiBot.tips.itemus.level.L40)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L40"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L50", 120, 0, "achievement_level_50", MultiBot.tips.itemus.level.L50)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L50"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L60", 150, 0, "achievement_level_60", MultiBot.tips.itemus.level.L60)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L60"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L70", 180, 0, "achievement_level_70", MultiBot.tips.itemus.level.L70)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L70"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L80", 210, 0, "achievement_level_80", MultiBot.tips.itemus.level.L80)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L80"
	MultiBot.itemus.addItems(1)
end

-- ITEMUS:RARE --

MultiBot.itemus.addButton("Rare", -94, 768, "achievement_quests_completed_01", MultiBot.tips.itemus.rare.master)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Rare"])
end

local tFrame = MultiBot.itemus.addFrame("Rare", -61, 770)
tFrame:Hide()

tFrame.addButton("R00", 0, 0, "achievement_quests_completed_01", MultiBot.tips.itemus.rare.R00)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cff9d9d9d"
	MultiBot.itemus.rare = "R00"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R01", 30, 0, "achievement_quests_completed_02", MultiBot.tips.itemus.rare.R01)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cffffffff"
	MultiBot.itemus.rare = "R01"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R02", 60, 0, "achievement_quests_completed_03", MultiBot.tips.itemus.rare.R02)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cff1eff00"
	MultiBot.itemus.rare = "R02"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R03", 90, 0, "achievement_quests_completed_04", MultiBot.tips.itemus.rare.R03)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cff0070dd"
	MultiBot.itemus.rare = "R03"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R04", 120, 0, "achievement_quests_completed_05", MultiBot.tips.itemus.rare.R04)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cffa335ee"
	MultiBot.itemus.rare = "R04"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R05", 150, 0, "achievement_quests_completed_06", MultiBot.tips.itemus.rare.R05)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cffff8000"
	MultiBot.itemus.rare = "R05"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R06", 180, 0, "achievement_quests_completed_07", MultiBot.tips.itemus.rare.R06)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cffff0000"
	MultiBot.itemus.rare = "R06"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R07", 210, 0, "achievement_quests_completed_08", MultiBot.tips.itemus.rare.R07)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cffe6cc80"
	MultiBot.itemus.rare = "R07"
	MultiBot.itemus.addItems(1)
end

-- ITEMUS:SLOT --

MultiBot.itemus.addButton("Slot", -94, 731, "inv_drink_18", MultiBot.tips.itemus.slot.master)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Slot"])
end

local tFrame = MultiBot.itemus.addFrame("Slot", -61, 733)
tFrame:Hide()

tFrame.addButton("S00", 0, 0, "inv_drink_18", MultiBot.tips.itemus.slot.S00)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S00"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S01", 30, 0, "inv_misc_desecrated_platehelm", MultiBot.tips.itemus.slot.S01)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S01"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S02", 60, 0, "inv_jewelry_necklace_22", MultiBot.tips.itemus.slot.S02)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S02"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S03", 90, 0, "inv_misc_desecrated_plateshoulder", MultiBot.tips.itemus.slot.S03)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S03"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S04", 120, 0, "inv_shirt_grey_01", MultiBot.tips.itemus.slot.S04)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S04"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S05", 150, 0, "inv_misc_desecrated_platechest", MultiBot.tips.itemus.slot.S05)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S05"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S06", 180, 0, "inv_misc_desecrated_platebelt", MultiBot.tips.itemus.slot.S06)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S06"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S07", 210, 0, "inv_misc_desecrated_platepants", MultiBot.tips.itemus.slot.S07)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S07"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S08", 0, -30, "inv_misc_desecrated_plateboots", MultiBot.tips.itemus.slot.S08)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S08"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S09", 30, -30, "inv_misc_desecrated_platebracer", MultiBot.tips.itemus.slot.S09)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S09"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S10", 60, -30, "inv_misc_desecrated_plategloves", MultiBot.tips.itemus.slot.S10)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S10"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S11", 90, -30, "inv_jewelry_ring_19", MultiBot.tips.itemus.slot.S11)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S11"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S12", 120, -30, "inv_jewelry_ring_07", MultiBot.tips.itemus.slot.S12)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S12"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S13", 150, -30, "inv_sword_23", MultiBot.tips.itemus.slot.S13)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S13"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S14", 180, -30, "inv_shield_04", MultiBot.tips.itemus.slot.S14)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S14"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S15", 210, -30, "inv_weapon_bow_05", MultiBot.tips.itemus.slot.S15)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S15"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S16", 0, -60, "inv_misc_cape_20", MultiBot.tips.itemus.slot.S16)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S16"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S17", 30, -60, "inv_axe_14", MultiBot.tips.itemus.slot.S17)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S17"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S18", 60, -60, "inv_misc_bag_07_black", MultiBot.tips.itemus.slot.S18)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S18"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S19", 90, -60, "inv_shirt_guildtabard_01", MultiBot.tips.itemus.slot.S19)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S19"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S20", 120, -60, "inv_misc_desecrated_clothchest", MultiBot.tips.itemus.slot.S20)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S20"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S21", 150, -60, "inv_hammer_07", MultiBot.tips.itemus.slot.S21)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S21"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S22", 180, -60, "inv_sword_15", MultiBot.tips.itemus.slot.S22)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S22"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S23", 210, -60, "inv_misc_book_09", MultiBot.tips.itemus.slot.S23)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S23"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S24", 0, -90, "inv_misc_ammo_arrow_01", MultiBot.tips.itemus.slot.S24)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S24"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S25", 30, -90, "inv_throwingknife_02", MultiBot.tips.itemus.slot.S25)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S25"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S26", 60, -90, "inv_wand_07", MultiBot.tips.itemus.slot.S26)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S26"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S27", 90, -90, "inv_misc_quiver_07", MultiBot.tips.itemus.slot.S27)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S26"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S28", 120, -90, "inv_relics_idolofrejuvenation", MultiBot.tips.itemus.slot.S28)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S28"
	MultiBot.itemus.addItems(1)
end

-- ITEMUS:TYPE --

MultiBot.itemus.addButton("Type", -94, 694, "inv_misc_head_clockworkgnome_01", MultiBot.tips.itemus.type).setDisable()
.doLeft = function(pButton)
	MultiBot.itemus.type = MultiBot.IF(MultiBot.OnOffSwitch(pButton), "NPC", "PC")
	MultiBot.itemus.addItems(1)
end

-- ICONOS --

MultiBot.iconos = MultiBot.newFrame(MultiBot, -860, -144, 32, 442, 884)
MultiBot.iconos.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Iconos.blp")
MultiBot.iconos.addText("Title", "Iconos", "CENTER", -57, 429, 13)
MultiBot.iconos.addText("Pages", "0/0", "CENTER", -57, 409, 13)
MultiBot.iconos.max = 1
MultiBot.iconos.now = 1
MultiBot.iconos:SetMovable(true)
MultiBot.iconos:Hide()

MultiBot.iconos.movButton("Move", -407, 850, 32, MultiBot.tips.move.iconos)

MultiBot.iconos.wowButton("<", -319, 841, 15, 18, 13).doHide()
.doLeft = function(pButton)
	MultiBot.iconos.now = MultiBot.iconos.now - 1
	MultiBot.iconos.addIcons()
end

MultiBot.iconos.wowButton(">", -225, 841, 15, 18, 13).doHide()
.doLeft = function(pButton)
	MultiBot.iconos.now = MultiBot.iconos.now + 1
	MultiBot.iconos.addIcons()
end

MultiBot.iconos.wowButton("X", -126, 862, 15, 18, 13)
.doLeft = function(pButton)
	MultiBot.iconos:Hide()
end

local tFrame = MultiBot.iconos.addFrame("Icons", -397, 807, 32)
tFrame:Show()

-- SPELLBOOK --

MultiBot.spellbook = MultiBot.newFrame(MultiBot, -802, 302, 28, 336, 448)
MultiBot.spellbook.spells = {}
MultiBot.spellbook.icons = {}
MultiBot.spellbook.max = 1
MultiBot.spellbook.now = 1
MultiBot.spellbook:SetMovable(true)
MultiBot.spellbook:Hide()

for i = 1, GetNumMacroIcons() do MultiBot.spellbook.icons[GetMacroIconInfo(i)] = i end

local tFrame = MultiBot.spellbook.addFrame("Icon", -276, 392, 28, 50, 50)
tFrame.addTexture("Interface/Spellbook/Spellbook-Icon")
tFrame:SetFrameLevel(0)

local tFrame = MultiBot.spellbook.addFrame("TopLeft", -112, 224, 28, 224, 224)
tFrame.addTexture("Interface/ItemTextFrame/UI-ItemText-TopLeft")
tFrame:SetFrameLevel(1)

local tFrame = MultiBot.spellbook.addFrame("TopRight", -0, 224, 28, 112, 224)
tFrame.addTexture("Interface/Spellbook/UI-SpellbookPanel-TopRight")
tFrame:SetFrameLevel(2)

local tFrame = MultiBot.spellbook.addFrame("BottomLeft", -112, 0, 28, 224, 224)
tFrame.addTexture("Interface/ItemTextFrame/UI-ItemText-BotLeft")
tFrame:SetFrameLevel(3)

local tFrame = MultiBot.spellbook.addFrame("BottomRight", -0, 0, 28, 112, 224)
tFrame.addTexture("Interface/Spellbook/UI-SpellbookPanel-BotRight")
tFrame:SetFrameLevel(4)

local tOverlay = MultiBot.spellbook.addFrame("Overlay", -47, 81, 28, 258, 292)
tOverlay.addText("Title", "Spellbook", "CENTER", 14, 200, 13)
tOverlay.addText("Pages", "0/0", "CENTER", 14, 173, 13)
tOverlay:SetFrameLevel(5)

tOverlay.movButton("Move", -226, 310, 50, MultiBot.tips.move.spellbook, MultiBot.spellbook)

tOverlay.wowButton("<", -159, 309, 15, 18, 13)
.doLeft = function(pButton)
	MultiBot.spellbook.to = MultiBot.spellbook.to - 16
	MultiBot.spellbook.now = MultiBot.spellbook.now - 1
	MultiBot.spellbook.from = MultiBot.spellbook.from - 16
	MultiBot.spellbook.frames["Overlay"].setText("Pages", MultiBot.spellbook.now .. "/" .. MultiBot.spellbook.max)
	MultiBot.spellbook.frames["Overlay"].buttons[">"].doShow()
	
	if(MultiBot.spellbook.now == 1) then pButton.doHide() end
	local tIndex = 1
	
	for i = MultiBot.spellbook.from, MultiBot.spellbook.to do
		MultiBot.setSpell(tIndex, MultiBot.spellbook.spells[i])
		tIndex = tIndex + 1
	end
end

tOverlay.wowButton(">", -59, 309, 15, 18, 11)
.doLeft = function(pButton)
	MultiBot.spellbook.to = MultiBot.spellbook.to + 16
	MultiBot.spellbook.now = MultiBot.spellbook.now + 1
	MultiBot.spellbook.from = MultiBot.spellbook.from + 16
	MultiBot.spellbook.frames["Overlay"].setText("Pages", MultiBot.spellbook.now .. "/" .. MultiBot.spellbook.max)
	MultiBot.spellbook.frames["Overlay"].buttons["<"].doShow()
	
	if(MultiBot.spellbook.now == MultiBot.spellbook.max) then pButton.doHide() end
	local tIndex = 1
	
	for i = MultiBot.spellbook.from, MultiBot.spellbook.to do
		MultiBot.setSpell(tIndex, MultiBot.spellbook.spells[i])
		tIndex = tIndex + 1
	end
end

tOverlay.wowButton("X", 16, 336, 15, 18, 11)
.doLeft = function(pButton)
	local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
	local tButton = tUnits.frames[MultiBot.spellbook.name].buttons["Spellbook"]
	tButton.doLeft(tButton)
end

tOverlay.addText("R01", "|cff402000Rank|r", "TOPLEFT", 30, -16, 11)
tOverlay.addText("T01", "|cffffcc00Title|r", "TOPLEFT", 30, -2, 12)
local tButton = tOverlay.addButton("S01", -230, 264, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R02", "|cff402000Rank|r", "TOPLEFT", 159, -16, 11)
tOverlay.addText("T02", "|cffffcc00Title|r", "TOPLEFT", 159, -2, 12)
local tButton = tOverlay.addButton("S02", -101, 264, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R03", "|cff402000Rank|r", "TOPLEFT", 30, -52, 11)
tOverlay.addText("T03", "|cffffcc00Title|r", "TOPLEFT", 30, -38, 12)
local tButton = tOverlay.addButton("S03", -230, 228, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R04", "|cff402000Rank|r", "TOPLEFT", 159, -52, 11)
tOverlay.addText("T04", "|cffffcc00Title|r", "TOPLEFT", 159, -38, 12)
local tButton = tOverlay.addButton("S04", -101, 228, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R05", "|cff402000Rank|r", "TOPLEFT", 30, -88, 11)
tOverlay.addText("T05", "|cffffcc00Title|r", "TOPLEFT", 30, -74, 12)
local tButton = tOverlay.addButton("S05", -230, 192, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R06", "|cff402000Rank|r", "TOPLEFT", 159, -88, 11)
tOverlay.addText("T06", "|cffffcc00Title|r", "TOPLEFT", 159, -74, 12)
local tButton = tOverlay.addButton("S06", -101, 192, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R07", "|cff402000Rank|r", "TOPLEFT", 30, -124, 11)
tOverlay.addText("T07", "|cffffcc00Title|r", "TOPLEFT", 30, -110, 12)
local tButton = tOverlay.addButton("S07", -230, 156, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R08", "|cff402000Rank|r", "TOPLEFT", 159, -124, 11)
tOverlay.addText("T08", "|cffffcc00Title|r", "TOPLEFT", 159, -110, 12)
local tButton = tOverlay.addButton("S08", -101, 156, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R09", "|cff402000Rank|r", "TOPLEFT", 30, -160, 11)
tOverlay.addText("T09", "|cffffcc00Title|r", "TOPLEFT", 30, -146, 12)
local tButton = tOverlay.addButton("S09", -230, 120, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R10", "|cff402000Rank|r", "TOPLEFT", 159, -160, 11)
tOverlay.addText("T10", "|cffffcc00Title|r", "TOPLEFT", 159, -146, 12)
local tButton = tOverlay.addButton("S10", -101, 120, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R11", "|cff402000Rank|r", "TOPLEFT", 30, -196, 11)
tOverlay.addText("T11", "|cffffcc00Title|r", "TOPLEFT", 30, -182, 12)
local tButton = tOverlay.addButton("S11", -230, 84, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R12", "|cff402000Rank|r", "TOPLEFT", 159, -196, 11)
tOverlay.addText("T12", "|cffffcc00Title|r", "TOPLEFT", 159, -182, 12)
local tButton = tOverlay.addButton("S12", -101, 84, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R13", "|cff402000Rank|r", "TOPLEFT", 30, -232, 11)
tOverlay.addText("T13", "|cffffcc00Title|r", "TOPLEFT", 30, -218, 12)
local tButton = tOverlay.addButton("S13", -230, 48, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R14", "|cff402000Rank|r", "TOPLEFT", 159, -232, 11)
tOverlay.addText("T14", "|cffffcc00Title|r", "TOPLEFT", 159, -218, 12)
local tButton = tOverlay.addButton("S14", -101, 48, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R15", "|cff402000Rank|r", "TOPLEFT", 30, -268, 11)
tOverlay.addText("T15", "|cffffcc00Title|r", "TOPLEFT", 30, -254, 12)
local tButton = tOverlay.addButton("S15", -230, 12, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

tOverlay.addText("R16", "|cff402000Rank|r", "TOPLEFT", 159, -268, 11)
tOverlay.addText("T16", "|cffffcc00Title|r", "TOPLEFT", 159, -254, 12)
local tButton = tOverlay.addButton("S16", -101, 12, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

-- REWARD --

MultiBot.reward = MultiBot.newFrame(MultiBot, -754, 238, 28, 384, 512)
MultiBot.reward.rewards = {}
MultiBot.reward.units = {}
MultiBot.reward.from = 1
MultiBot.reward.max = 1
MultiBot.reward.now = 1
MultiBot.reward.to = 12
MultiBot.reward:SetMovable(true)
MultiBot.reward:Hide()

MultiBot.reward.doClose = function()
	local tOverlay = MultiBot.reward.frames["Overlay"]
	for key, value in pairs(MultiBot.reward.units) do if(value.rewarded == false) then return end end
	MultiBot.reward:Hide()
end

local tFrame = MultiBot.reward.addFrame("Icon", -313, 443, 28, 64, 64)
tFrame.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Reward.blp")
tFrame:SetFrameLevel(0)

local tFrame = MultiBot.reward.addFrame("TopLeft", -128, 256, 28, 256, 256)
tFrame.addTexture("Interface/ItemTextFrame/UI-ItemText-TopLeft")
tFrame:SetFrameLevel(1)

local tFrame = MultiBot.reward.addFrame("TopRight", -0, 256, 28, 128, 256)
tFrame.addTexture("Interface/Spellbook/UI-SpellbookPanel-TopRight")
tFrame:SetFrameLevel(2)

local tFrame = MultiBot.reward.addFrame("BottomLeft", -128, 0, 28, 256, 256)
tFrame.addTexture("Interface/ItemTextFrame/UI-ItemText-BotLeft")
tFrame:SetFrameLevel(3)

local tFrame = MultiBot.reward.addFrame("BottomRight", -0, 0, 28, 128, 256)
tFrame.addTexture("Interface/Spellbook/UI-SpellbookPanel-BotRight")
tFrame:SetFrameLevel(4)

local tOverlay = MultiBot.reward.addFrame("Overlay", -48, 97, 28, 310, 330)
tOverlay.addText("Title", MultiBot.info.reward, "CENTER", 16, 226, 13)
tOverlay.addText("Pages", "0/0", "CENTER", 16, 196, 13)
tOverlay:SetFrameLevel(5)

tOverlay.movButton("Move", -270, 354, 50, MultiBot.tips.move.reward, MultiBot.reward)

tOverlay.wowButton("<", -182, 351, 15, 18, 13)
.doLeft = function(pButton)
	local tOverlay = MultiBot.reward.frames["Overlay"]
	local tReward = MultiBot.reward
	
	tReward.to = tReward.to - 12
	tReward.now = tReward.now - 1
	tReward.from = tReward.from - 12
	tOverlay.setText("Pages", tReward.now .. "/" .. tReward.max)
	tOverlay.buttons[">"].doShow()
	
	if(tReward.now == 1) then pButton.doHide() end
	local tIndex = 1
	
	for i = tReward.from, tReward.to do
		MultiBot.setReward(tIndex, MultiBot.reward.units[i])
		tIndex = tIndex + 1
	end
end

tOverlay.wowButton(">", -82, 351, 15, 18, 11)
.doLeft = function(pButton)
	local tOverlay = MultiBot.reward.frames["Overlay"]
	local tReward = MultiBot.reward
	
	tReward.to = tReward.to + 12
	tReward.now = tReward.now + 1
	tReward.from = tReward.from + 12
	tOverlay.setText("Pages", tReward.now .. "/" .. tReward.max)
	tOverlay.buttons["<"].doShow()
	
	if(tReward.now == tReward.max) then pButton.doHide() end
	local tIndex = 1
	
	for i = tReward.from, tReward.to do
		MultiBot.setReward(tIndex, MultiBot.reward.units[i])
		tIndex = tIndex + 1
	end
end

tOverlay.wowButton("X", 13, 381, 17, 20, 11)
.doLeft = function(pButton)
	MultiBot.reward:Hide()
end

-- GROUP:U01 --

local tFrame = tOverlay.addFrame("U01", -156, 282, 23, 154, 48)
tFrame.addText("U01", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U02 --

local tFrame = tOverlay.addFrame("U02", 0, 282, 23, 154, 48)
tFrame.addText("U02", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U03 --

local tFrame = tOverlay.addFrame("U03", -156, 228, 23, 154, 48)
tFrame.addText("U03", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U04 --

local tFrame = tOverlay.addFrame("U04", 0, 228, 23, 154, 48)
tFrame.addText("U04", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U05 --

local tFrame = tOverlay.addFrame("U05", -156, 174, 23, 154, 48)
tFrame.addText("U05", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U06 --

local tFrame = tOverlay.addFrame("U06", 0, 174, 23, 154, 48)
tFrame.addText("U06", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U07 --

local tFrame = tOverlay.addFrame("U07", -156, 120, 23, 154, 48)
tFrame.addText("U07", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U08 --

local tFrame = tOverlay.addFrame("U08", 0, 120, 23, 154, 48)
tFrame.addText("U08", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U09 --

local tFrame = tOverlay.addFrame("U09", -156, 66, 23, 154, 48)
tFrame.addText("U09", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U10 --

local tFrame = tOverlay.addFrame("U10", 0, 66, 23, 154, 48)
tFrame.addText("U10", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U11 --

local tFrame = tOverlay.addFrame("U11", -156, 12, 23, 154, 48)
tFrame.addText("U11", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- GROUP:U12 --

local tFrame = tOverlay.addFrame("U12", 0, 12, 23, 154, 48)
tFrame.addText("U12", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = function(pButton)
	InspectUnit(pButton.getName())
end

-- TALENT --

MultiBot.talent = MultiBot.newFrame(MultiBot, -104, -276, 28, 1024, 1024)
MultiBot.talent.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent.blp")
MultiBot.talent.addText("Points", MultiBot.info.talent["Points"], "CENTER", -228, -8, 13)
MultiBot.talent.addText("Title", MultiBot.info.talent["Title"], "CENTER", -228, 491, 13)
MultiBot.talent:SetMovable(true)
MultiBot.talent:Hide()

MultiBot.talent.movButton("Move", -960, 960, 64, MultiBot.tips.move.talent)

MultiBot.talent.wowButton(MultiBot.info.talent.Apply, -474, 966, 100, 20, 12).doHide()
.doLeft = function(pButton)
	local tValues = ""
	
	for i = 1, 3 do
		local tTab = MultiBot.talent.frames["Tab" .. i]
		
		for j = 1, table.getn(tTab.buttons) do
			tValues = tValues .. tTab.buttons[j].value
		end
		
		if(i < 3) then tValues = tValues .. "-" end
	end
	
	SendChatMessage("talents apply " ..tValues, "WHISPER", nil, MultiBot.talent.name)
	pButton.doHide()
end

MultiBot.talent.wowButton(MultiBot.info.talent.Copy, -854, 966, 100, 20, 12)
.doLeft = function(pButton)
	local tName = UnitName("target")
	if(tName == nil or tName == "Unknown Entity") then return SendChatMessage(MultiBot.info.target, "SAY") end
	
	local tLocClass, tClass = UnitClass("target")
	if(MultiBot.talent.class ~= MultiBot.toClass(tClass)) then return SendChatMessage("The Classes do not match.", "SAY") end
	
	local tUnit = MultiBot.toUnit(MultiBot.talent.name)
	if(UnitLevel(tUnit) ~= UnitLevel("target")) then return SendChatMessage("The Levels do not match.", "SAY") end
	
	local tValues = ""
	
	for i = 1, 3 do
		local tTab = MultiBot.talent.frames["Tab" .. i]
		
		for j = 1, table.getn(tTab.buttons) do
			tValues = tValues .. tTab.buttons[j].value
		end
		
		if(i < 3) then tValues = tValues .. "-" end
	end

	SendChatMessage("talents apply " ..tValues, "WHISPER", nil, tName)
end

MultiBot.talent.wowButton("X", -470, 992, 17, 20, 13)
.doLeft = function(pButton)
	local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
	local tButton = tUnits.frames[MultiBot.talent.name].buttons["Talent"]
	tButton.doLeft(tButton)
end

local tTab = MultiBot.talent.addFrame("Tab1", -830, 518, 28, 170, 408)
tTab.addTexture("Interface\\AddOns\\MultiBot\\Textures\\White.blp")
tTab.addText("Title", "Title", "CENTER", 0, 214, 13)
tTab.arrows = {}
tTab.value = 0
tTab.id = 1

local tTab = MultiBot.talent.addFrame("Tab2", -656, 518, 28, 170, 408)
tTab.addTexture("Interface\\AddOns\\MultiBot\\Textures\\White.blp")
tTab.addText("Title", "Title", "CENTER", 0, 214, 13)
tTab.arrows = {}
tTab.value = 0
tTab.id = 2

local tTab = MultiBot.talent.addFrame("Tab3", -482, 518, 28, 170, 408)
tTab.addTexture("Interface\\AddOns\\MultiBot\\Textures\\White.blp")
tTab.addText("Title", "Title", "CENTER", 0, 214, 13)
tTab.arrows = {}
tTab.value = 0
tTab.id = 3

--[[
local tTab = MultiBot.talent.addFrame("Tab4", -513, 518, 28, 456, 430)
tTab.addFrame("Glow", 0, 0, 28, 456, 430).setAlpha(0.5).doHide().addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Glow.blp")
tTab.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs.blp")
tTab:Hide()

-- GLYPH:SOCKET1 --

-- Level 15
local tGlyph = tTab.addFrame("Socket1", -176.5, 324, 102)
tGlyph.addFrame("Glow",   0,  0, 102).setLevel(7).doHide().addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Major.blp")
tGlyph.addFrame("Rune", -29, 29,  44).setLevel(8).setAlpha(0.7).doHide().addTexture("Interface/Spellbook/UI-Glyph-Rune-1")
tGlyph.type = "Major"
tGlyph.item = 0

tGlyph.addFrame("Overlay", -10, 10, 82).setLevel(9).doHide()
.addButton("Rune", 0, 0, "Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Major_Socket.blp", "")
.setHighlight("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Highlight.blp")
.doLeft = function(pButton)
	local tType, tItem, tLink = GetCursorInfo()
	if(tType ~= "item") then return end
	
	local tGlyph = MultiBot.doSplit(MultiBot.data.talent.glylphs[pButton.getClass()][pButton.parent.parent.type][cItem], ", ")
	if(tGlyph == nil) then return SendChatMessage("This Glyph is not allowed in this Socket.", "SAY") end
	
	local tLevel = UnitLevel(MultiBot.toUnit(pButton.getName()))
	if(tGlyph[1] > tLevel) then return SendChatMessage("The Level of the Bot is to low.", "SAY") end
	
	local tSocket = pButton.parent.parent
	tSocket.frames["Glow"].doShow()
	tSocket.frames["Rune"].doShow().setTexture("Interface/Spellbook/UI-Glyph-Rune" .. tGlyph[2])
	tSocket.item = tItem
	DeleteCursorItem()
end

-- GLYPH:SOCKET2 --

-- Level 15
local tGlyph = tTab.addFrame("Socket2", -187, 18.5, 82)
tGlyph.addFrame("Glow",   0,  0, 82).setLevel(7).doHide().addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Minor.blp")
tGlyph.addFrame("Rune", -25, 25, 32).setLevel(8).setAlpha(0.7).doHide().addTexture("Interface/Spellbook/UI-Glyph-Rune-1")
tGlyph.type = "Minor"

tGlyph.addFrame("Overlay", -7, 7, 68).setLevel(9).doHide()
.addButton("Rune", 0, 0, "Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Minor_Socket.blp", "")
.setHighlight("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Highlight.blp")
.doLeft = function(pButton)
end

-- GLYPH:SOCKET3 --

-- Level 30
local tGlyph = tTab.addFrame("Socket3", -18.5, 50.5, 102)
tGlyph.addFrame("Glow",   0,  0, 102).setLevel(7).doHide().addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Major.blp")
tGlyph.addFrame("Rune", -29, 29,  44).setLevel(8).setAlpha(0.7).doHide().addTexture("Interface/Spellbook/UI-Glyph-Rune-1")
tGlyph.type = "Major"

tGlyph.addFrame("Overlay", -10, 10, 82).setLevel(9).doHide()
.addButton("Rune", 0, 0, "Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Major_Socket.blp", "")
.setHighlight("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Highlight.blp")
.doLeft = function(pButton)
end

-- GLYPH:SOCKET4 --

-- Level 50
local tGlyph = tTab.addFrame("Socket4", -302.5, 218, 82)
tGlyph.addFrame("Glow",   0,  0, 82).setLevel(7).doHide().addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Minor.blp")
tGlyph.addFrame("Rune", -25, 25, 32).setLevel(8).setAlpha(0.7).doHide().addTexture("Interface/Spellbook/UI-Glyph-Rune-1")
tGlyph.type = "Minor"

tGlyph.addFrame("Overlay", -7, 7, 68).setLevel(9).doHide()
.addButton("Rune", 0, 0, "Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Minor_Socket.blp", "")
.setHighlight("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Highlight.blp")
.doLeft = function(pButton)
end

-- GLYPH:SOCKET5 --

-- Level 70
local tGlyph = tTab.addFrame("Socket5", -72.5, 218, 82)
tGlyph.addFrame("Glow",   0,  0, 82).setLevel(7).doHide().addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Minor.blp")
tGlyph.addFrame("Rune", -25, 25, 32).setLevel(8).setAlpha(0.7).doHide().addTexture("Interface/Spellbook/UI-Glyph-Rune-1")
tGlyph.type = "Minor"

tGlyph.addFrame("Overlay", -7, 7, 68).setLevel(9).doHide()
.addButton("Rune", 0, 0, "Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Minor_Socket.blp", "")
.setHighlight("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Highlight.blp")
.doLeft = function(pButton)
end

-- GLYPH:SOCKET6 --

-- Level 80
local tGlyph = tTab.addFrame("Socket6", -336, 50.5, 102)
tGlyph.addFrame("Glow",   0,  0, 102).setLevel(7).doHide().addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Major.blp")
tGlyph.addFrame("Rune", -29, 29,  44).setLevel(8).setAlpha(0.7).doHide().addTexture("Interface/Spellbook/UI-Glyph-Rune-1")
tGlyph.type = "Major"

tGlyph.addFrame("Overlay", -10, 10, 82).setLevel(9).doHide()
.addButton("Rune", 0, 0, "Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Major_Socket.blp", "")
.setHighlight("Interface\\AddOns\\MultiBot\\Textures\\Talent_Glyphs_Highlight.blp")
.doLeft = function(pButton)
end

local tTab = MultiBot.talent.addFrame("Tab5", -900, 461, 28, 96, 24)
tTab.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Tab.blp")
tTab.wowButton("Talents", -2, 6, 92, 17, 11)
.doLeft = function(pButton)
	MultiBot.talent.setText("Title", MultiBot.doReplace(MultiBot.info.talent.Title, "NAME", MultiBot.talent.name))
	MultiBot.talent.texts["Points"]:Show()
	MultiBot.talent.frames["Tab1"]:Show()
	MultiBot.talent.frames["Tab2"]:Show()
	MultiBot.talent.frames["Tab3"]:Show()
	MultiBot.talent.frames["Tab4"]:Hide()
end

local tTab = MultiBot.talent.addFrame("Tab6", -800, 461, 28, 96, 24)
tTab.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Tab.blp")
tTab.wowButton("Glyphs", -2, 6, 92, 17, 11)
.doLeft = function(pButton)
	MultiBot.talent.setText("Title", "Glyphs of " .. MultiBot.talent.name)
	MultiBot.talent.texts["Points"]:Hide()
	MultiBot.talent.frames["Tab1"]:Hide()
	MultiBot.talent.frames["Tab2"]:Hide()
	MultiBot.talent.frames["Tab3"]:Hide()
	MultiBot.talent.frames["Tab4"]:Show()
end
]]--

MultiBot.talent.addArrow = function(pTab, pID, pNeeds, piX, piY, pTexture)
	local tArrow = pTab.addFrame("Arrow" .. pID, piX * 36 - 153, 395 - piY * 36, 44)
	tArrow.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Silver_" .. pTexture .. ".blp")
	tArrow.active = "Interface\\AddOns\\MultiBot\\Textures\\Talent_Gold_" .. pTexture .. ".blp"
	tArrow.needs = pNeeds
	tArrow:SetFrameLevel(7)
	return tArrow
end

MultiBot.talent.addTalent = function(pTab, pID, pNeeds, pValue, pMax, piX, piY, pTexture, pTips)
	local tTalent = pTab.addButton(pID, piX * 36 - 161, 403 - piY * 36, pTexture, pTips[pValue + 1])
	tTalent.points = piY * 5 - 5
	tTalent.needs = pNeeds
	tTalent.value = pValue
	tTalent.tips = pTips
	tTalent.max = pMax
	tTalent.id = pID
	
	tTalent.doLeft = function(pButton)
		if(MultiBot.talent.points == 0) then return end
		
		local tButtons = pButton.parent.buttons
		local tValue = pButton.parent.frames[pButton.id]
		local tTab = pButton.parent
		
		if(pButton.state == false) then return end
		if(pButton.value == pButton.max) then return end
		if(pButton.needs > 0 and tButtons[pButton.needs].value == 0) then return end
		
		MultiBot.talent.points = MultiBot.talent.points - 1
		MultiBot.talent.setText("Points", MultiBot.info.talent["Points"] .. MultiBot.talent.points)
		
		tTab.value = tTab.value + 1
		tTab.setText("Title", MultiBot.info.talent[pButton.getClass() .. tTab.id] .. " ("  .. tTab.value .. ")")
		
		pButton.value = pButton.value + 1
		pButton.tip = pButton.tips[pButton.value + 1]
		
		local tColor = MultiBot.IF(pButton.value < pButton.max, "|cff4db24d", "|cffffcc00")
		tValue.setText("Value", tColor .. pButton.value .. "/" .. pButton.max .. "|r")
		tValue:Show()
		
		for i = 1, table.getn(tButtons) do
			if(tButtons[i].points > tTab.value)
			then tButtons[i].setDisable()
			else
				if(tButtons[i].needs > 0)
				then if(tButtons[tButtons[i].needs].value > 0) then tButtons[i].setEnable() end
				else tButtons[i].setEnable()
				end
			end
		end
		
		MultiBot.talent.buttons[MultiBot.info.talent.Apply].doShow()
		MultiBot.talent.doState()
	end
	
	tTalent:SetFrameLevel(8)
	return tTalent
end

MultiBot.talent.addValue = function(pTab, pID, piX, piY, pRank, pMax)
	local tColor = MultiBot.IF(pRank > 0, MultiBot.IF(pRank < pMax, "|cff4db24d", "|cffffcc00"), "|cffffffff")
	local tValue = pTab.addFrame(pID, piX * 36 - 157, 399 - piY * 36, 24, 18, 12)
	tValue.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_Black.blp")
	tValue.addText("Value", tColor .. pRank .. "/" .. pMax .. "|r", "CENTER", -0.5, 1, 10)
	if(MultiBot.talent.points == 0 and pRank == 0) then tValue:Hide() end
	tValue:SetFrameLevel(9)
	return tValue
end

MultiBot.talent.setTalents = function()
	local tClass = MultiBot.data.talent.talents[MultiBot.talent.class]
	local tArrow = MultiBot.data.talent.arrows[MultiBot.talent.class]
	
	MultiBot.talent.points = tonumber(GetUnspentTalentPoints(true))
	MultiBot.talent.setText("Points", MultiBot.info.talent["Points"] .. MultiBot.talent.points)
	MultiBot.talent.setText("Title", MultiBot.doReplace(MultiBot.info.talent["Title"], "NAME", MultiBot.talent.name))
	
	for i = 1, 3 do
		local tTab = MultiBot.talent.frames["Tab" .. i]
		tTab.setTexture("Interface\\AddOns\\MultiBot\\Textures\\Talent_" .. MultiBot.talent.class .. i .. ".blp")
		tTab.value = 0
		tTab.id = 1
		
		for j = 1, table.getn(tArrow[i]) do
			local tData = MultiBot.doSplit(tArrow[i][j], ", ")
			local tNeed = tonumber(tData[1])
			tTab.arrows[j] = MultiBot.talent.addArrow(tTab, j, tNeed, tData[2], tData[3], tData[4])
		end
		
		for j = 1, table.getn(tClass[i]) do
			local tTale = MultiBot.doSplit(MultiBot.doSplit(GetTalentLink(i, j, true), "|")[3], ":")[2]
			local iName, iIcon, iTier, iColumn, iRank = GetTalentInfo(i, j, true)
			local tData = MultiBot.doSplit(tClass[i][j], ", ")
			local tMaxi = table.getn(tData) - 4
			local tNeed = tonumber(tData[1])
			local tRank = tonumber(iRank)
			local tTips = {}
			
			tTab.value = tTab.value + tRank
			table.insert(tTips, "|cff4e96f7|Htalent:" .. tTale ..":-1|h[" .. iName .. "]|h|r")
			for k = 5, table.getn(tData) do	table.insert(tTips, "|cff4e96f7|Htalent:" .. tTale ..":" .. (k - 5) .. "|h[" .. iName .. "]|h|r") end
			
			MultiBot.talent.addTalent(tTab, j, tNeed, tRank, tMaxi, tData[2], tData[3], tData[4], tTips)
			MultiBot.talent.addValue(tTab, j, tData[2], tData[3], tRank, tMaxi)
		end
		
		tTab.setText("Title", MultiBot.info.talent[MultiBot.talent.class .. i] .. " (" .. tTab.value .. ")")
	end
	
	MultiBot.talent.doState()
	MultiBot.talent:Show()
end

MultiBot.talent.doState = function()
	for i = 1, 3 do
		local tTab = MultiBot.talent.frames["Tab" .. i]
		
		for j = 1, table.getn(tTab.buttons) do
			local tTalent = tTab.buttons[j]
			local tValue = tTab.frames[j]
			
			if(MultiBot.talent.points == 0) then
				if(tTalent.value == 0) then
					tTalent.setDisable()
					tValue:Hide()
				else
					tTalent.setEnable()
					tValue:Show()
				end
			else
				if(tTab.value < tTalent.points) then
					tTalent.setDisable()
					tValue:Hide()
				else
					tTalent.setEnable()
					tValue:Show()
				end
			end
		end
		
		for j = 1, table.getn(tTab.arrows) do
			if(tTab.buttons[tTab.arrows[j].needs].value > 0) then
				tTab.arrows[j].setTexture(tTab.arrows[j].active)
			end
		end
	end
end

MultiBot.talent.doClear = function()
	for i = 1, 3 do
		local tTab = MultiBot.talent.frames["Tab" .. i]
		for j = 1, table.getn(tTab.buttons) do tTab.buttons[j]:Hide() end
		for j = 1, table.getn(tTab.frames) do tTab.frames[j]:Hide() end
		for j = 1, table.getn(tTab.arrows) do tTab.arrows[j]:Hide() end
		table.wipe(tTab.buttons)
		table.wipe(tTab.frames)
		table.wipe(tTab.arrows)
		tTab.buttons = {}
		tTab.frames = {}
		tTab.arrows = {}
	end
end


-- FINISH --

MultiBot.state = true
print("MultiBot")