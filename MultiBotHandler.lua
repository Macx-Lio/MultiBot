-- TIMER --

MultiBot:SetScript("OnUpdate", function(pSelf, pElapsed)
	if(MultiBot.auto.invite) then MultiBot.timer.invite.elapsed = MultiBot.timer.invite.elapsed + pElapsed end
	if(MultiBot.auto.talent) then MultiBot.timer.talent.elapsed = MultiBot.timer.talent.elapsed + pElapsed end
	if(MultiBot.auto.stats) then MultiBot.timer.stats.elapsed = MultiBot.timer.stats.elapsed + pElapsed end
	
	if(MultiBot.auto.stats and MultiBot.timer.stats.elapsed >= MultiBot.timer.stats.interval) then
		for i = 1, GetNumPartyMembers() do SendChatMessage("stats", "WHISPER", nil, UnitName("party" .. i)) end
		MultiBot.timer.stats.elapsed = 0
	end
	
	if(MultiBot.auto.talent and MultiBot.timer.talent.elapsed >= MultiBot.timer.talent.interval) then
		MultiBot.talent.setTalents()
		MultiBot.timer.talent.elapsed = 0
		MultiBot.auto.talent = false
	end
	
	if(MultiBot.auto.invite and MultiBot.timer.invite.elapsed >= MultiBot.timer.invite.interval) then
		local tTable = MultiBot.index[MultiBot.timer.invite.roster]
		
		if(MultiBot.isMember(tTable[MultiBot.timer.invite.index]) == false) then
			SendChatMessage(MultiBot.doReplace(MultiBot.info.inviting, "NAME", tTable[MultiBot.timer.invite.index]), "SAY")
			SendChatMessage(".playerbot bot add " .. tTable[MultiBot.timer.invite.index], "SAY")
			MultiBot.timer.invite.needs = MultiBot.timer.invite.needs - 1
		end
		
		if(MultiBot.timer.invite.needs == 0 or MultiBot.timer.invite.index  == table.getn(tTable)) then
			MultiBot.timer.invite.elapsed = 0
			MultiBot.timer.invite.roster = ""
			MultiBot.timer.invite.index = 1
			MultiBot.timer.invite.needs = 0
			MultiBot.auto.invite = false
			return
		end
		
		MultiBot.timer.invite.index = MultiBot.timer.invite.index + 1
		MultiBot.timer.invite.elapsed = 0
	end
end)

-- HANDLER --

MultiBot:SetScript("OnEvent", function()
	if(event == "PLAYER_LOGOUT") then
		local tX, tY = MultiBot.toPoint(MultiBot.frames["MultiBar"])
		MultiBotSave["MultiBarPoint"] = tX .. ", " .. tY
		
		local tX, tY = MultiBot.toPoint(MultiBot.inventory)
		MultiBotSave["InventoryPoint"] = tX .. ", " .. tY
		
		local tX, tY = MultiBot.toPoint(MultiBot.spellbook)
		MultiBotSave["SpellbookPoint"] = tX .. ", " .. tY
		
		local tX, tY = MultiBot.toPoint(MultiBot.itemus)
		MultiBotSave["ItemusPoint"] = tX .. ", " .. tY
		
		local tX, tY = MultiBot.toPoint(MultiBot.iconos)
		MultiBotSave["IconosPoint"] = tX .. ", " .. tY
		
		local tX, tY = MultiBot.toPoint(MultiBot.stats)
		MultiBotSave["StatsPoint"] = tX .. ", " .. tY
		
		local tX, tY = MultiBot.toPoint(MultiBot.reward)
		MultiBotSave["RewardPoint"] = tX .. ", " .. tY
		
		local tX, tY = MultiBot.toPoint(MultiBot.talent)
		MultiBotSave["TalentPoint"] = tX .. ", " .. tY
		
		local tPortal = MultiBot.frames["MultiBar"].frames["Masters"].frames["Portal"]
		MultiBotSave["MemoryGem1"] =  MultiBot.SavePortal(tPortal.buttons["Red"])
		MultiBotSave["MemoryGem2"] =  MultiBot.SavePortal(tPortal.buttons["Green"])
		MultiBotSave["MemoryGem3"] =  MultiBot.SavePortal(tPortal.buttons["Blue"])
		
		local tValue = MultiBot.doSplit(MultiBot.frames["MultiBar"].frames["Left"].buttons["Attack"].texture, "\\")[5]
		tValue = string.sub(tValue, 1, string.len(tValue) - 4)
		MultiBotSave["AttackButton"] = tValue
		
		local tValue = MultiBot.doSplit(MultiBot.frames["MultiBar"].frames["Left"].buttons["Flee"].texture, "\\")[5]
		tValue = string.sub(tValue, 1, string.len(tValue) - 4)
		MultiBotSave["FleeButton"] = tValue
		
		MultiBotSave["AutoRelease"] = MultiBot.IF(MultiBot.auto.release, "true", "false")
		MultiBotSave["NecroNet"] = MultiBot.IF(MultiBot.necronet.state, "true", "false")
		MultiBotSave["Reward"] = MultiBot.IF(MultiBot.reward.state, "true", "false")
		
		MultiBotSave["Masters"] = MultiBot.IF(MultiBot.frames["MultiBar"].frames["Main"].buttons["Masters"].state, "true", "false")
		MultiBotSave["Creator"] = MultiBot.IF(MultiBot.frames["MultiBar"].frames["Main"].buttons["Creator"].state, "true", "false")
		MultiBotSave["Beast"] = MultiBot.IF(MultiBot.frames["MultiBar"].frames["Main"].buttons["Beast"].state, "true", "false")
		
		return
	end
	
	-- ADDON:LOADED --
	
	if(event == "ADDON_LOADED" and arg1 == "MultiBot") then
		if(MultiBotSave["MultiBarPoint"] ~= nil) then
			local tPoint = MultiBot.doSplit(MultiBotSave["MultiBarPoint"], ", ")
			MultiBot.frames["MultiBar"].setPoint(tonumber(tPoint[1]), tonumber(tPoint[2]))
		end
		
		if(MultiBotSave["InventoryPoint"] ~= nil) then
			local tPoint = MultiBot.doSplit(MultiBotSave["InventoryPoint"], ", ")
			MultiBot.inventory.setPoint(tonumber(tPoint[1]), tonumber(tPoint[2]))
		end
		
		if(MultiBotSave["SpellbookPoint"] ~= nil) then
			local tPoint = MultiBot.doSplit(MultiBotSave["SpellbookPoint"], ", ")
			MultiBot.spellbook.setPoint(tonumber(tPoint[1]), tonumber(tPoint[2]))
		end
		
		if(MultiBotSave["ItemusPoint"] ~= nil) then
			local tPoint = MultiBot.doSplit(MultiBotSave["ItemusPoint"], ", ")
			MultiBot.itemus.setPoint(tonumber(tPoint[1]), tonumber(tPoint[2]))
		end
		
		if(MultiBotSave["IconosPoint"] ~= nil) then
			local tPoint = MultiBot.doSplit(MultiBotSave["IconosPoint"], ", ")
			MultiBot.iconos.setPoint(tonumber(tPoint[1]), tonumber(tPoint[2]))
		end
		
		if(MultiBotSave["StatsPoint"] ~= nil) then
			local tPoint = MultiBot.doSplit(MultiBotSave["StatsPoint"], ", ")
			MultiBot.stats.setPoint(tonumber(tPoint[1]), tonumber(tPoint[2]))
		end
		
		if(MultiBotSave["RewardPoint"] ~= nil) then
			local tPoint = MultiBot.doSplit(MultiBotSave["RewardPoint"], ", ")
			MultiBot.reward.setPoint(tonumber(tPoint[1]), tonumber(tPoint[2]))
		end
		
		if(MultiBotSave["TalentPoint"] ~= nil) then
			local tPoint = MultiBot.doSplit(MultiBotSave["TalentPoint"], ", ")
			MultiBot.talent.setPoint(tonumber(tPoint[1]), tonumber(tPoint[2]))
		end
		
		if(MultiBotSave["MemoryGem1"] ~= nil) then
			local tGem = MultiBot.frames["MultiBar"].frames["Masters"].frames["Portal"].buttons["Red"]
			MultiBot.LoadPortal(tGem, MultiBotSave["MemoryGem1"])
		end
		
		if(MultiBotSave["MemoryGem2"] ~= nil) then
			local tGem = MultiBot.frames["MultiBar"].frames["Masters"].frames["Portal"].buttons["Green"]
			MultiBot.LoadPortal(tGem, MultiBotSave["MemoryGem2"])
		end
		
		if(MultiBotSave["MemoryGem3"] ~= nil) then
			local tGem = MultiBot.frames["MultiBar"].frames["Masters"].frames["Portal"].buttons["Blue"]
			MultiBot.LoadPortal(tGem, MultiBotSave["MemoryGem3"])
		end
		
		if(MultiBotSave["AttackButton"] ~= nil) then
			if(MultiBotSave["AttackButton"] == "attack") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Attack"].buttons["Attack"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["AttackButton"] == "attack_ranged") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Attack"].buttons["Ranged"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["AttackButton"] == "attack_melee") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Attack"].buttons["Melee"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["AttackButton"] == "attack_healer") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Attack"].buttons["Healer"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["AttackButton"] == "attack_dps") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Attack"].buttons["Dps"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["AttackButton"] == "attack_tank") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Attack"].buttons["Tank"]
				tButton.doRight(tButton)
			end
		end
		
		if(MultiBotSave["FleeButton"] ~= nil) then
			if(MultiBotSave["FleeButton"] == "flee") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Flee"].buttons["Flee"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["FleeButton"] == "flee_ranged") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Flee"].buttons["Ranged"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["FleeButton"] == "flee_melee") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Flee"].buttons["Melee"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["FleeButton"] == "flee_healer") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Flee"].buttons["Healer"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["FleeButton"] == "flee_dps") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Flee"].buttons["Dps"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["FleeButton"] == "flee_tank") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Flee"].buttons["Tank"]
				tButton.doRight(tButton)
				
			elseif(MultiBotSave["FleeButton"] == "flee_target") then
				local tButton = MultiBot.frames["MultiBar"].frames["Left"].frames["Flee"].buttons["Target"]
				tButton.doRight(tButton)
			end
		end
		
		if(MultiBotSave["AutoRelease"] ~= nil) then
			local tButton = MultiBot.frames["MultiBar"].frames["Main"].buttons["Release"]
			
			if(MultiBotSave["AutoRelease"] == "true")
			then tButton.setDisable()
			else tButton.setEnable()
			end
			
			tButton.doLeft(tButton)
		end
		
		if(MultiBotSave["NecroNet"] ~= nil) then
			local tButton = MultiBot.frames["MultiBar"].frames["Masters"].buttons["NecroNet"]
			
			if(MultiBotSave["NecroNet"] == "true")
			then tButton.setDisable()
			else tButton.setEnable()
			end
			
			tButton.doLeft(tButton)
		end
		
		if(MultiBotSave["Reward"] ~= nil) then
			local tButton = MultiBot.frames["MultiBar"].frames["Main"].buttons["Reward"]
			
			if(MultiBotSave["Reward"] == "true")
			then tButton.setDisable()
			else tButton.setEnable()
			end
			
			tButton.doLeft(tButton)
		end
		
		if(MultiBotSave["Masters"] ~= nil) then
			local tButton = MultiBot.frames["MultiBar"].frames["Main"].buttons["Masters"]
			
			if(MultiBotSave["Masters"] == "true") then
				MultiBot.GM = true
				tButton.setDisable()
				tButton.doLeft(tButton)
			end
		end
		
		if(MultiBotSave["Creator"] ~= nil) then
			local tButton = MultiBot.frames["MultiBar"].frames["Main"].buttons["Creator"]
			
			if(MultiBotSave["Creator"] == "true") then
				tButton.setDisable()
				tButton.doLeft(tButton)
			end
		end
		
		if(MultiBotSave["Beast"] ~= nil) then
			local tButton = MultiBot.frames["MultiBar"].frames["Main"].buttons["Beast"]
			
			if(MultiBotSave["Beast"] == "true") then
				tButton.setDisable()
				tButton.doLeft(tButton)
			end
		end
		
		return
	end
	
	-- PLAYER:ENTERING --
	
	if(event == "PLAYER_ENTERING_WORLD") then
		SendChatMessage(".account", "SAY")
		
		if(MultiBot.init == nil) then
			SendChatMessage(".playerbot bot list", "SAY")
			MultiBot.init = true
			return
		end
		
		return
	end
	
	-- CHAT:SYSTEM --
	
	if(event == "CHAT_MSG_SYSTEM") then
		if(MultiBot.isInside(arg1, "Accountlevel", "account level", "niveau de compte", "等级")) then
			local tLevel = tonumber(MultiBot.doSplit(arg1, ": ")[2])
			if(tLevel ~= nil) then MultiBot.GM = tLevel > 1 end
		end
		
		if(MultiBot.isInside(arg1, "Possible strategies")) then
			local tStrategies = MultiBot.doSplit(arg1, ", ")
			SendChatMessage("=== STRATEGIES ===", "SAY")
			for i = 1, table.getn(tStrategies) do SendChatMessage(i .. " : " .. tStrategies[i], "SAY") end
			return
		end
		
		if(MultiBot.isInside(arg1, "Whisper any of")) then
			local tCommands = MultiBot.doSplit(arg1, ", ")
			SendChatMessage("=== WHISPER-COMMANDS ===", "SAY")
			for i = 1, table.getn(tCommands) do SendChatMessage(i .. " : " .. tCommands[i], "SAY") end
			return
		end
		
		if(MultiBot.auto.release == true) then
			if(MultiBot.isInside(arg1, "已经死亡")) then
				SendChatMessage("release", "WHISPER", nil, MultiBot.doReplace(arg1, "已经死亡。", ""))
				return
			end
			
			if(MultiBot.isInside(arg1, "ist tot", "has dies", "has died")) then
				SendChatMessage("release", "WHISPER", nil, MultiBot.doSplit(arg1, " ")[1])
				return
			end
		end
		
		if(string.sub(arg1, 1, 12) == "Bot roster: ") then
			local tLocClass, tClass, tLocRace, tRace, tSex, tName = GetPlayerInfoByGUID(UnitGUID("player"))
			tClass = MultiBot.toClass(tClass)
			
			local tPlayer = MultiBot.addSelf(tClass, tName).setDisable()
			tPlayer.class = tClass
			tPlayer.name = tName
			
			tPlayer.doLeft = function(pButton)
				SendChatMessage(".playerbot bot self", "SAY")
				MultiBot.OnOffSwitch(pButton)
			end
			
			-- PLAYERBOTS --
			
			local tTable = MultiBot.doSplit(string.sub(arg1, 13), ", ")
			
			for key, value in pairs(tTable) do
				if(value == "") then break end
				local tBot = MultiBot.doSplit(value, " ")
				local tName = string.sub(tBot[1], 2)
				local tClass = MultiBot.toClass(tBot[2])
				local tOnline = string.sub(tBot[1], 1, 1)
				
				local tPlayer = MultiBot.addPlayer(tClass, tName).setDisable()
				
				tPlayer.doRight = function(pButton)
					if(pButton.state == false) then return end
					SendChatMessage(".playerbot bot remove " .. pButton.name, "SAY")
					if(pButton.parent.frames[pButton.name] ~= nil) then pButton.parent.frames[pButton.name]:Hide() end
					pButton.setDisable()
				end
				
				tPlayer.doLeft = function(pButton)
					if(pButton.state) then
						if(pButton.parent.frames[pButton.name] ~= nil) then MultiBot.ShowHideSwitch(pButton.parent.frames[pButton.name]) end
					else
						SendChatMessage(".playerbot bot add " .. pButton.name, "SAY")
						pButton.setEnable()
					end
				end
			end
			
			-- MEMBERBOTS --
			
			for i = 1, 50 do
				local tName, tRank, tIndex, tLevel, tClass = GetGuildRosterInfo(i)
				
				-- Ensure that the Counter is not bigger than the Amount of Members in Guildlist
				if(tName ~= nil and tLevel ~= nil and tClass ~= nil and tName ~= UnitName("player")) then
					local tMember = MultiBot.addMember(tClass, tLevel, tName).setDisable()
					
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
					local tFriend = MultiBot.addFriend(tClass, tLevel, tName).setDisable()
					
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
			
			-- REFRESH:RAID --
			
			if(GetNumRaidMembers() > 4) then
				for i = 1, GetNumRaidMembers() do
					local tName = UnitName("raid" .. i)
					SendChatMessage(".playerbot bot add " .. tName, "SAY")
				end
				
				return
			end
			
			-- REFRESH:GROUP --
			
			if(GetNumPartyMembers() > 0) then
				for i = 1, GetNumPartyMembers() do
					local tName = UnitName("party" .. i)
					SendChatMessage(".playerbot bot add " .. tName, "SAY")
				end
				
				return
			end
			
			return
		end
		
		if(MultiBot.isInside(arg1, "player already logged in")) then
			local tName = string.sub(arg1, 6, string.find(arg1, " ", 6) - 1)
			local tButton = MultiBot.frames["MultiBar"].frames["Units"].buttons[tName]
			if(tButton == nil) then return end
			
			if(MultiBot.isMember(tName)) then
				tButton.waitFor = "CO"
				SendChatMessage(MultiBot.doReplace(MultiBot.info.combat, "NAME", tName), "SAY")
				SendChatMessage("co ?", "WHISPER", nil, tName)
				tButton.setEnable()
				--MultiBot.doRaid()
				return
			end
			
			if(GetNumPartyMembers() == 4) then ConvertToRaid() end
			MultiBot.doSlash("/invite", tName)
			return
		end
		
		if(MultiBot.isInside(arg1, "remove: ")) then
			local tName = string.sub(arg1, 9, string.find(arg1, " ", 9) - 1)
			local tFrame = MultiBot.frames["MultiBar"].frames["Units"].frames[tName]
			local tButton = MultiBot.frames["MultiBar"].frames["Units"].buttons[tName]
			if(tButton == nil) then return end
			
			if(MultiBot.isInside(arg1, "not your bot")) then
				SendChatMessage("leave", "WHISPER", nil, tName)
			end
			
			MultiBot.doRemove(MultiBot.index.classes.actives[tButton.class], tButton.name)
			MultiBot.doRemove(MultiBot.index.actives, tButton.name)
			
			if(tFrame ~= nil) then tFrame:Hide() end
			tButton.setDisable()
			--MultiBot.doRaid()
			return
		end
		
		if(arg1 == "Enable player botAI") then
			local tName = UnitName("player")
			local tButton = MultiBot.frames["MultiBar"].frames["Units"].buttons[tName]
			if(tButton == nil) then return end
			tButton.waitFor = "CO"
			SendChatMessage(MultiBot.doReplace(MultiBot.info.combat, "NAME", tName), "SAY")
			SendChatMessage("co ?", "WHISPER", nil, tName)
			tButton.setEnable()
			--MultiBot.doRaid()
			return
		end
		
		if(arg1 == "Disable player botAI") then
			local tName = UnitName("player")
			local tFrame = MultiBot.frames["MultiBar"].frames["Units"].frames[tName]
			local tButton = MultiBot.frames["MultiBar"].frames["Units"].buttons[tName]
			if(tButton == nil) then return end
			if(tFrame ~= nil) then tFrame:Hide() end
			tButton.setDisable()
			--MultiBot.doRaid()
			return
		end
		
		if(MultiBot.isInside(arg1, "Zone:", "zone:")) then
			local tPlayer = MultiBot.getBot(UnitName("player"))
			if(tPlayer.waitFor ~= "COORDS") then return end
			
			local tLocation = MultiBot.doSplit(arg1, " ")
			local tZone = string.sub(tLocation[6], 2, string.len(tLocation[6]) - 1)
			local tMap = string.sub(tLocation[3], 2, string.len(tLocation[3]) - 1)
			local tTip = MultiBot.doReplace(MultiBot.doReplace(MultiBot.info.teleport, "MAP", tMap), "ZONE", tZone)
			
			tPlayer.memory.goMap = tLocation[2]
			tPlayer.memory.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", tTip)
			return
		end
		
		if(MultiBot.isInside(arg1, "X:") and MultiBot.isInside(arg1, "Y:")) then
			local tPlayer = MultiBot.getBot(UnitName("player"))
			if(tPlayer.waitFor ~= "COORDS") then return end
			
			local tCoords = MultiBot.doSplit(arg1, " ")
			tPlayer.memory.goX = tCoords[2]
			tPlayer.memory.goY = tCoords[4]
			tPlayer.memory.goZ = tCoords[6]
			tPlayer.memory.setEnable()
			tPlayer.waitFor = ""
			return
		end
	end
	
	-- CHAT:WHISPER --
	
	if(event == "CHAT_MSG_WHISPER") then
		if(MultiBot.auto.release == true) then
			-- Graveyard not ready to talk Bot in the chinese Version --
			if(arg1 == "在墓地见我") then
				MultiBot.frames["MultiBar"].frames["Units"].buttons[arg2].waitFor = "你好"
				return
			end
			
			if(arg1 == "Meet me at the graveyard") then
				SendChatMessage("summon", "WHISPER", nil, arg2)
				return
			end
		end
		
		if(MultiBot.isInside(arg1, "StatsOfPlayer")) then
			local tUnit = MultiBot.toUnit(arg2)
			MultiBot.stats.frames[tUnit].setStats(arg2, UnitLevel(tUnit), arg1, true)
		end
		
		if(arg1 == "stats" and arg2 ~= UnitName("player")) then
			local tXP = math.floor(100.0 / UnitXPMax("player") * UnitXP("player"))
			local tMana = math.floor(100.0 / UnitManaMax("player") * UnitMana("player"))
			SendChatMessage("StatsOfPlayer " .. tXP .. " " .. tMana, "WHISPER", nil, arg2)
		end
		
		-- REQUIREMENT --
		
		local tButton = MultiBot.frames["MultiBar"].frames["Units"].buttons[arg2]
		
		if(MultiBot.auto.release == true) then
			-- Graveyard ready to talk Bot in the chinese Version --
			if(tButton ~= nil and tButton.waitFor == "你好" and arg1 == "你好") then
				SendChatMessage("summon", "WHISPER", nil, arg2)
				tButton.waitFor = ""
				return
			end
		end
		
		if(MultiBot.isInside(arg1, "Hello", "你好") and tButton == nil) then
			local tUnit = MultiBot.toUnit(arg2)
			local tLocClass, tClass = UnitClass(tUnit)
			local tLevel = UnitLevel(tUnit)
			
			tButton = MultiBot.addActive(tClass, tLevel, arg2).setDisable()
			
			tButton.doRight = function(pButton)
				SendChatMessage(".playerbot bot remove " .. pButton.name, "SAY")
				if(pButton.parent.frames[pButton.name] ~= nil) then pButton.parent.frames[pButton.name]:Hide() end
				pButton.setDisable()
			end
					
			tButton.doLeft = function(pButton)
				if(pButton.state) then
					if(pButton.parent.frames[pButton.name] ~= nil) then MultiBot.ShowHideSwitch(pButton.parent.frames[pButton.name]) end
				else
					SendChatMessage(".playerbot bot add " .. pButton.name, "SAY")
					pButton.setEnable()
				end
			end
		elseif(tButton == nil) then return end
		
		if(MultiBot.isInside(arg1, "Hello", "你好") and tButton.class == "Unknown" and tButton.roster == "friends") then
			local tName = ""
			local tLevel = ""
			local tClass = ""
			
			for i = 1, 50 do
				tName, tLevel, tClass = GetFriendInfo(i)
				if(tName == arg2) then break end
				if(tName == nil) then break end
			end
			
			local tClass = MultiBot.toClass(tClass)
			local tTable = MultiBot.index.classes[tButton.roster][tButton.class]
			local tIndex = 0
			
			for i = 1, table.getn(tTable) do
				if(tTable[i] == arg2) then 
					tIndex = i
					break
				end
			end
			
			if(tIndex > 0) then
				if(MultiBot.index.classes[tButton.roster][tClass] == nil) then MultiBot.index.classes[tButton.roster][tClass] = {} end
				table.remove(MultiBot.index.classes[tButton.roster][tButton.class], tIndex)
				table.insert(MultiBot.index.classes[tButton.roster][tClass], tName)
			end
			
			tButton.setTexture("Interface\\AddOns\\MultiBot\\Icons\\class_" .. string.lower(tClass) .. ".blp")
			tButton.tip = MultiBot.toTip(tClass, tLevel, tName)
			tButton.class = tClass
		end
		
		if(MultiBot.isInside(arg1, "Hello", "你好")) then
			tButton.waitFor = "CO"
			SendChatMessage(MultiBot.doReplace(MultiBot.info.combat, "NAME", arg2), "SAY")
			SendChatMessage("co ?", "WHISPER", nil, arg2)
			--MultiBot.doRaid()
			return
		end
		
		if(MultiBot.isInside(arg1, "Goodbye", "再见")) then
			--MultiBot.doRaid()
			return
		end
		
		if(MultiBot.isInside(arg1, "reset to default") and tButton.waitFor == "CO") then
			SendChatMessage("co ,?", "WHISPER", nil, arg2)
			return
		end
		
		if(MultiBot.isInside(arg1, "reset to default") and tButton.waitFor == "NC") then
			SendChatMessage("nc ,?", "WHISPER", nil, arg2)
			return
		end
		
		if(tButton.waitFor == "NC" and MultiBot.isInside(arg1, "Strategies: ")) then
			tButton.waitFor = ""
			tButton.normal = string.sub(arg1, 13)
			
			tFrame = MultiBot.frames["MultiBar"].frames["Units"].addFrame(arg2, tButton.x - tButton.size - 2, tButton.y + 2)
			tFrame.class = tButton.class
			tFrame.name = tButton.name
			
			MultiBot["add" .. tButton.class](tFrame, tButton.combat, tButton.normal)
			MultiBot.addEvery(tFrame, tButton.combat, tButton.normal)
			
			if(MultiBot.index.classes.actives[tButton.class] == nil) then MultiBot.index.classes.actives[tButton.class] = {} end
			if(MultiBot.isActive(tButton.name) == false) then
				table.insert(MultiBot.index.classes.actives[tButton.class], tButton.name)
				table.insert(MultiBot.index.actives, tButton.name)
			end
			
			tButton.setEnable()
			return
		end
		
		if(tButton.waitFor == "CO" and MultiBot.isInside(arg1, "Strategies: ")) then
			tButton.waitFor = "NC"
			tButton.combat = string.sub(arg1, 13)
			SendChatMessage(MultiBot.doReplace(MultiBot.info.normal, "NAME", arg2), "SAY")
			SendChatMessage("nc ?", "WHISPER", nil, arg2)
			return
		end
		
		if(tButton.waitFor ~= "ITEM" and tButton.waitFor ~= "SPELL" and MultiBot.auto.stats and MultiBot.isInside(arg1, "Bag")) then
			local tUnit = MultiBot.toUnit(arg2)
			if(MultiBot.stats.frames[tUnit] == nil) then MultiBot.addStats(MultiBot.stats, "party1", 0, 0, 32, 192, 96) end
			MultiBot.stats.frames[tUnit].setStats(arg2, UnitLevel(tUnit), arg1)
			return
		end
		
		-- Inventory --
		
		if(tButton.waitFor == "INVENTORY" and MultiBot.isInside(arg1, "Inventory", "背包")) then
			local tItems = MultiBot.inventory.frames["Items"]
			for key, value in pairs(tItems.buttons) do value:Hide() end
			table.wipe(tItems.buttons)
			MultiBot.inventory.setText("Title", MultiBot.doReplace(MultiBot.info.inventory, "NAME", arg2))
			MultiBot.inventory.name = arg2
			tItems.index = 0
			tButton.waitFor = "ITEM"
			SendChatMessage("stats", "WHISPER", nil, arg2)
			return
		end
		
		if(tButton.waitFor == "ITEM" and MultiBot.isInside(arg1, "Bag,", "Dur", "XP", "背包", "耐久度", "经验值")) then
			MultiBot.inventory:Show()
			tButton.waitFor = ""
			InspectUnit(arg2)
			return
		end
		
		if(tButton.waitFor == "ITEM") then
			if(string.sub(arg1, 1, 3) == "---") then return end
			MultiBot.addItem(MultiBot.inventory.frames["Items"], arg1)
			return
		end
		
		-- Spellbook --
		
		if(tButton.waitFor == "SPELLBOOK" and MultiBot.isInside(arg1, "Spells")) then
			local tOverlay = MultiBot.spellbook.frames["Overlay"]
			local tSpellbook = MultiBot.spellbook
			table.wipe(tSpellbook.spells)
			tSpellbook.frames["Overlay"].setText("Title", MultiBot.doReplace(MultiBot.info.spellbook, "NAME", arg2))
			tSpellbook.name = arg2
			tSpellbook.index = 0
			tSpellbook.from = 1
			tSpellbook.to = 16
			tButton.waitFor = "SPELL"
			SendChatMessage("stats", "WHISPER", nil, arg2)
			return
		end
		
		if(tButton.waitFor == "SPELL" and MultiBot.isInside(arg1, "Bag,", "Dur", "XP", "背包", "耐久度", "经验值")) then
			local tOverlay = MultiBot.spellbook.frames["Overlay"]
			local tSpellbook = MultiBot.spellbook
			tSpellbook.now = 1
			tSpellbook.max = math.ceil(tSpellbook.index / 16)
			tOverlay.setText("Pages", "|cffffffff" .. tSpellbook.now .. "/" .. tSpellbook.max .. "|r")
			if(tSpellbook.now == tSpellbook.max) then tOverlay.buttons[">"].doHide() end
			tOverlay.buttons["<"].doHide()
			tSpellbook:Show()
			tButton.waitFor = ""
			InspectUnit(arg2)
			return
		end
		
		if(tButton.waitFor == "SPELL") then
			MultiBot.addSpell(arg1)
			return
		end
		
		-- EQUIPPING --
		
		if(MultiBot.inventory:IsVisible()) then
			if(MultiBot.isInside(arg1, "装备", "使用", "吃", "喝", "盛宴", "摧毁")) then
				tButton.waitFor = "INVENTORY"
				SendChatMessage("items", "WHISPER", nil, tButton.name)
				return
			end
			
			if(MultiBot.isInside(string.lower(arg1), "equipping", "using", "eating", "drinking", "feasting", "destroyed")) then
				tButton.waitFor = "INVENTORY"
				SendChatMessage("items", "WHISPER", nil, tButton.name)
				return
			end
			
			if(MultiBot.inventory:IsVisible() and MultiBot.isInside(string.lower(arg1), "opened")) then
				tButton.waitFor = "LOOT"
				return
			end
		end
		
		return
	end
	
	if(event == "CHAT_MSG_LOOT") then
		if(MultiBot.inventory:IsVisible()) then
			local tButton = nil
			
			if(MultiBot.isInside(arg1, "获得了物品")) then
				local tName = MultiBot.doReplace(MultiBot.doSplit(arg1, ":")[1], "获得了物品", "")
				tButton = MultiBot.frames["MultiBar"].frames["Units"].buttons[tName]
			end
			
			if(MultiBot.isInside(string.lower(arg1), "beute", "receives")) then
				local tName = MultiBot.doSplit(arg1, " ")[1]
				tButton = MultiBot.frames["MultiBar"].frames["Units"].buttons[tName]
			end
			
			if(tButton ~= nil and tButton.waitFor == "LOOT" and tButton ~= nil) then
				tButton.waitFor = "INVENTORY"
				SendChatMessage("items", "WHISPER", nil, tButton.name)
				return
			end
		end
		
		return
	end
	
	if(event == "TRADE_CLOSED") then
		if(MultiBot.inventory:IsVisible()) then
			MultiBot.frames["MultiBar"].frames["Units"].buttons[MultiBot.inventory.name].waitFor = "INVENTORY"
			SendChatMessage("items", "WHISPER", nil, MultiBot.inventory.name)
			return
		end
		
		return
	end
		
	-- QUEST:COMPLETE --
	
	if(event == "QUEST_COMPLETE") then
		if(MultiBot.reward.state) then
			MultiBot.setRewards()
			return
		end
		
		return
	end
	
	-- QUEST:CHANGED --
	
	if(event == "UNIT_QUEST_LOG_CHANGED") then
		local tButton = MultiBot.frames["MultiBar"].frames["Right"].buttons["Quests"]
		tButton.doRight(tButton)
		return
	end
	
	-- WORLD:MAP --
	
	if(event == "WORLD_MAP_UPDATE") then
		if(MultiBot.necronet.state == false) then return end
		
		local tCont = GetCurrentMapContinent()
		local tArea = GetCurrentMapAreaID()
		local tZone = GetCurrentMapZone()
		
		if(MultiBot.necronet.cont ~= tCont or MultiBot.necronet.area ~= tArea or MultiBot.necronet.zone ~= tZone) then
			for key, value in pairs(MultiBot.necronet.buttons) do value:Hide() end
			
			MultiBot.necronet.cont = tCont
			MultiBot.necronet.area = tArea
			MultiBot.necronet.zone = tZone
			
			local tTable = MultiBot.necronet.index[tCont]
			if(tTable ~= nil) then tTable = tTable[tArea] end
			if(tTable ~= nil) then tTable = tTable[tZone] end
			if(tTable ~= nil) then for key, value in pairs(tTable) do value:Show() end end
		end
		
		return
	end
end)

SLASH_MULTIBOT1 = "/multibot"
SLASH_MULTIBOT2 = "/mbot"
SLASH_MULTIBOT3 = "/mb"

SlashCmdList["MULTIBOT"] = function()
	if(MultiBot.state) then
		for key, value in pairs(MultiBot.frames) do value:Hide() end
		MultiBot.state = false
	else
		for key, value in pairs(MultiBot.frames) do value:Show() end
		MultiBot.state = true
	end
end