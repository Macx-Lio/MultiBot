MultiBot.tips.unit = {}
MultiBot.tips.unit.selfbot =
"Selfbot\n"..
"|cffffffffThis Button switches the Selfbot-Mode on and off.|r\n\n"..
"|cffff0000Left-Click to execute Selfbot|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.unit.button =
"|cffffffff\n"..
"This Button adds or removes NAME to or from your Group.\n"..
"MultiBot will ask Playerbot about the Combat- and Non-Combat-Strategies.\n"..
"The Stretegies can be configured with the Buttonbars on the left and right side.\n"..
"The Buttonbars will appear after adding the Bot.|r\n\n"..
"|cffff0000Left-Click to add NAME|r\n"..
"|cff999999(Execution-Order: System)|r\n\n"..
"|cffff0000Right-Click to remove NAME|r\n"..
"|cff999999(Execution-Order: System)|r";

-- TIMER --

MultiBot:SetScript("OnUpdate", function(pSelf, pElapsed)
	MultiBot.timer.invite.elapsed = MultiBot.timer.invite.elapsed + pElapsed
	MultiBot.timer.stats.elapsed = MultiBot.timer.stats.elapsed + pElapsed
	
	if(MultiBot.auto.stats and MultiBot.timer.stats.elapsed >= MultiBot.timer.stats.interval) then
		for i = 1, GetNumPartyMembers() do SendChatMessage("stats", "WHISPER", nil, UnitName("party" .. i)) end
		MultiBot.timer.stats.elapsed = 0
		return
	end
	
	if(MultiBot.auto.invite and MultiBot.timer.invite.elapsed >= MultiBot.timer.invite.interval) then
		local tTable = MultiBot.index[MultiBot.timer.invite.roster]
		
		if(MultiBot.isMember(tTable[MultiBot.timer.invite.index]) == false) then
			SendChatMessage("Inviting " .. tTable[MultiBot.timer.invite.index] .. " to the Group.", "SAY")
			SendChatMessage(".playerbot bot add " .. tTable[MultiBot.timer.invite.index], "SAY")
			MultiBot.timer.invite.needs = MultiBot.timer.invite.needs - 1
		end
		
		if(MultiBot.timer.invite.needs == 0 or tIndex == table.getn(tTable)) then
			MultiBot.timer.invite.rooster = ""
			MultiBot.timer.invite.index = 1
			MultiBot.timer.invite.needs = 0
			MultiBot.auto.invite = false
			return
		end
		
		MultiBot.timer.invite.index = MultiBot.timer.invite.index + 1
		MultiBot.timer.invite.elapsed = 0
		return
	end
end)

-- HANDLER --

MultiBot:SetScript("OnEvent", function()
	if(event == "PLAYER_ENTERING_WORLD") then
		if(MultiBot.init == nil) then
			SendChatMessage(".playerbot bot list", "SAY")
			MultiBot.init = true
		end
	end
	
	if(event == "CHAT_MSG_SYSTEM") then
		if(MultiBot.auto.release and MultiBot.isInside(arg1, "ist tot", "has dies")) then
			SendChatMessage("release", "WHISPER", nil, MultiBot.doSplit(arg1, " ")[1])
		end
		
		if(string.sub(arg1, 1, 12) == "Bot roster: ") then
			local tLocClass, tClass, tLocRace, tRace, tSex, tName = GetPlayerInfoByGUID(UnitGUID("player"))
			tClass = MultiBot.toClass(tClass)
			
			local tPlayer = MultiBot.addPlayer(tName, tClass, "inv_misc_head_clockworkgnome_01", MultiBot.tips.unit.selfbot).setDisable()
			tPlayer.class = tClass
			tPlayer.name = tName
			
			tPlayer.doLeft = function(pButton)
				MultiBot.ShowHideSwitch(pButton.parent.frames[pButton.name])
				SendChatMessage(".playerbot bot self", "SAY")
				MultiBot.OnOffSwitch(pButton)
			end
			
			-- PLAYERBOTS --
			
			local tTable = MultiBot.doSplit(string.sub(arg1, 13), ", ")
			
			for key, value in pairs(tTable) do
				local tBot = MultiBot.doSplit(value, " ")
				local tName = string.sub(tBot[1], 2)
				local tClass = MultiBot.toClass(tBot[2])
				local tOnline = string.sub(tBot[1], 1, 1)
				
				
				local tTip = tClass .. " - " .. tName .. MultiBot.doReplace(MultiBot.doReplace(MultiBot.doReplace(MultiBot.tips.unit.button, "NAME", tName), "NAME", tName), "NAME", tName)
				local tPlayer = MultiBot.addPlayer(tName, tClass, "Interface\\AddOns\\MultiBot\\Icons\\class_" .. string.lower(tClass) .. ".blp", tTip).setDisable()
				tPlayer.class = tClass
				tPlayer.name = tName
				
				tPlayer.doRight = function(pButton)
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
					local tClass = MultiBot.toClass(tClass)
					local tTip = tClass .. " - " .. tLevel .. " - " .. tName .. MultiBot.doReplace(MultiBot.doReplace(MultiBot.doReplace(MultiBot.tips.unit.button, "NAME", tName), "NAME", tName), "NAME", tName)
					local tMember = MultiBot.addMember(tName, tClass, "Interface\\AddOns\\MultiBot\\Icons\\class_" .. string.lower(tClass) .. ".blp", tTip).setDisable()
					tMember.class = tClass
					tMember.name = tName
					
					tMember.doRight = function(pButton)
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
				
				-- Ensure that the Counter is not bigger than the Amount of Members in Guildlist
				if(tName ~= nil and tLevel ~= nil and tClass ~= nil and tName ~= UnitName("player")) then
					local tClass = MultiBot.toClass(tClass)
					local tTip = tClass .. " - " .. tLevel .. " - " .. tName .. MultiBot.doReplace(MultiBot.doReplace(MultiBot.doReplace(MultiBot.tips.unit.button, "NAME", tName), "NAME", tName), "NAME", tName)
					local tFriend = MultiBot.addFriend(tName, tClass, "Interface\\AddOns\\MultiBot\\Icons\\class_" .. string.lower(tClass) .. ".blp", tTip).setDisable()
					tFriend.class = tClass
					tFriend.name = tName
					
					tFriend.doRight = function(pButton)
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
			
			return
		end
		
		if(MultiBot.isInside(arg1, "player already logged in")) then
			local tName = string.sub(arg1, 6, string.find(arg1, " ", 6) - 1)
			local tButton = MultiBot.frames["MultiBar"].frames["Units"].buttons[tName]
			if(tButton == nil) then return end
			
			if(MultiBot.isMember(tName)) then
				tButton.waitFor = "CO"
				SendChatMessage("Asked " .. tName .. " for Combat-Strategies.", "SAY")
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
			SendChatMessage("Asked " .. tName .. " for Combat-Strategies.", "SAY")
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
			
			tPlayer.memory.goMap = tLocation[2]
			tPlayer.memory.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "will teleport you to '" .. tMap .. "-" .. tZone .. "'.")
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
	
	if(event == "CHAT_MSG_WHISPER") then
		if(MultiBot.auto.release and arg1 == "Meet me at the graveyard") then
			SendChatMessage("summon", "WHISPER", nil, arg2)
			return
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
		if(tButton == nil) then return end
		
		if(tButton.waitFor ~= "ITEM" and tButton.waitFor ~= "SPELL" and MultiBot.isInside(arg1, "Bag")) then
			local tUnit = MultiBot.toUnit(arg2)
			if(MultiBot.stats.frames[tUnit] == nil) then MultiBot.addStats(MultiBot.stats, "party1", 0, 0, 32, 192, 96) end
			MultiBot.stats.frames[tUnit].setStats(arg2, UnitLevel(tUnit), arg1)
		end
		
		if(arg1 == "Hello" or arg1 == "Hello!") then
			tButton.waitFor = "CO"
			SendChatMessage("Asked " .. arg2 .. " for Combat-Strategies.", "SAY")
			SendChatMessage("co ?", "WHISPER", nil, arg2)
			--MultiBot.doRaid()
			return
		end
		
		if(arg1 == "Goodbye!") then
			--local tFrame = MultiBot.frames["MultiBar"].frames["Units"].frames[arg2]
			--if(tFrame ~= nil) then tFrame:Hide() end
			--tButton.setDisable()
			--MultiBot.doRaid()
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
			table.insert(MultiBot.index.classes.actives[tButton.class], tButton.name)
			table.insert(MultiBot.index.actives, tButton.name)
			
			tButton.setEnable()
			return
		end
		
		if(tButton.waitFor == "CO" and MultiBot.isInside(arg1, "Strategies: ")) then
			tButton.waitFor = "NC"
			tButton.combat = string.sub(arg1, 13)
			SendChatMessage("Asked " .. arg2 .. " for Non-Combat-Strategies.", "SAY")
			SendChatMessage("nc ?", "WHISPER", nil, arg2)
			return
		end
		
		-- Inventory --
		
		if(tButton.waitFor == "INVENTORY" and MultiBot.isInside(arg1, "Inventory")) then
			local tItems = MultiBot.inventory.frames["Items"]
			for key, value in pairs(tItems.buttons) do value:Hide() end
			table.wipe(tItems.buttons)
			MultiBot.inventory.setText("Title", "Inventory of " .. arg2)
			MultiBot.inventory.name = arg2
			tItems.index = 0
			tButton.waitFor = "ITEM"
			SendChatMessage("stats", "WHISPER", nil, arg2)
			return
		end
		
		if(tButton.waitFor == "ITEM" and MultiBot.isInside(arg1, "Bag", "Dur", "XP")) then
			MultiBot.inventory:Show()
			tButton.waitFor = ""
			InspectUnit(arg2)
			return
		end
		
		if(tButton.waitFor == "ITEM") then
			MultiBot.addItem(MultiBot.inventory.frames["Items"], arg1)
			return
		end
		
		-- Spellbook --
		
		if(tButton.waitFor == "SPELLBOOK" and MultiBot.isInside(arg1, "Spells")) then
			table.wipe(MultiBot.spellbook.spells)
			MultiBot.spellbook.setText("Title", "Spellbook of " .. arg2)
			MultiBot.spellbook.name = arg2
			MultiBot.spellbook.index = 0
			MultiBot.spellbook.from = 1
			MultiBot.spellbook.to = 12
			tButton.waitFor = "SPELL"
			SendChatMessage("stats", "WHISPER", nil, arg2)
			return
		end
		
		if(tButton.waitFor == "SPELL" and MultiBot.isInside(arg1, "Bag", "Dur", "XP")) then
			MultiBot.spellbook.now = 1
			MultiBot.spellbook.max = math.ceil(MultiBot.spellbook.index / 12)
			MultiBot.spellbook.setText("Pages", "|cffffcc00" .. MultiBot.spellbook.now .. "/" .. MultiBot.spellbook.max .. "|r")
			if(MultiBot.spellbook.now == MultiBot.spellbook.max) then MultiBot.spellbook.buttons[">"].doHide() end
			MultiBot.spellbook.buttons["<"].doHide()
			MultiBot.spellbook:Show()
			tButton.waitFor = ""
			InspectUnit(arg2)
			return
		end
		
		if(tButton.waitFor == "SPELL") then
			MultiBot.addSpell(arg1)
			return
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