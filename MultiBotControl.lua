MultiBot.eventHandler = CreateFrame("Frame")
MultiBot.eventHandler:RegisterEvent("PLAYER_TARGET_CHANGED")
MultiBot.eventHandler:RegisterEvent("CHAT_MSG_WHISPER")
MultiBot.eventHandler:RegisterEvent("CHAT_MSG_SYSTEM")
MultiBot.eventHandler:RegisterEvent("CHAT_MSG_ADDON")
MultiBot.eventHandler:RegisterEvent("UPDATE")
MultiBot.eventHandler:Hide()

MultiBot.eventHandler:SetScript("OnEvent", function()
	if (event == "PLAYER_TARGET_CHANGED") then
	end

	if (event == "CHAT_MSG_SYSTEM") then
		if(MultiBot.isInside(arg1, "Bot roster: ")) then
			local tX = 0
			
			MultiBot.players = MultiBot.newPlayers(MultiBot, tX, 0, MultiBot.size)
			MultiBot.players.setButton(MultiBot.config.players, "SHOW:PLAYERS")
			tX = tX + MultiBot.size + 2
			
			MultiBot.friends = MultiBot.newFriends(MultiBot, tX, 0, MultiBot.size)
			MultiBot.friends.setButton(MultiBot.config.friends, "HIDE:FRIENDS")
			tX = tX + MultiBot.size + 2
			
			-- LEFT --
			
			MultiBot.left = MultiBot.newFrame(MultiBot, 0 - MultiBot.size - 2, 2, MultiBot.size - 4)
			local tX = 0
			
			MultiBot.left.addSingle(tX, 0, MultiBot.config.flee).setChat("PARTY")
			tX = tX - MultiBot.size + 2
			
			MultiBot.left.addDouble(tX, 0, MultiBot.config.stay, "follow").setChat("PARTY")
			tX = tX - MultiBot.size + 2
			
			MultiBot.left.addDouble(tX, 0, MultiBot.config.passive, "").setState(true).setChat("PARTY")
			tX = tX - MultiBot.size + 2
			
			MultiBot.left.addSingle(tX, 0, MultiBot.config.attack).setChat("PARTY")
			tX = tX - MultiBot.size + 2
			
			MultiBot.left.addSingle(tX, 0, MultiBot.config.tanker).setChat("PARTY")
			tX = tX - MultiBot.size + 2
			
			-- RIGHT --
			
			MultiBot.right = MultiBot.newFrame(MultiBot, MultiBot.size * 2, 2, MultiBot.size - 4)
			local tX = 0
			
			MultiBot.right.addSingle(tX, 0, MultiBot.config.release).setChat("PARTY")
			tX = tX + MultiBot.size - 2
			
			MultiBot.right.addSingle(tX, 0, MultiBot.config.revive).setChat("PARTY")
			tX = tX + MultiBot.size - 2
			
			MultiBot.right.addSingle(tX, 0, MultiBot.config.sumall).setChat("WHISPER")
			tX = tX + MultiBot.size - 2
			
			--MultiBot.right.addSingle(tX, 0, MultiBot.config.resize).setChat("WHISPER")
			--tX = tX + MultiBot.size - 2
			
			-- CONTROL --
			
			MultiBot.addControl(1)
			MultiBot.addControl(2)
			MultiBot.addControl(3)
			MultiBot.addControl(4)
			MultiBot.addControl(5)
			MultiBot.doRaid()
			
			-- ROOSTER --
			
			MultiBot.players.setPlayers(string.sub(arg1, 13))
		end
		
		if(MultiBot.isInside(arg1, " - player already logged in")) then
			local bot = MultiBot.getBot(string.sub(arg1, 6, string.find(arg1, " ", 6) - 1))
			if(bot == nil) then return end
			
			if(MultiBot.isMember(bot.name)) then
				bot.waitFor = "CO"
				SendChatMessage("Asked " .. bot.name .. " for Combat Strategies", "SAY")
				SendChatMessage("co ?", "WHISPER", nil, bot.name)
			else
				if(GetNumPartyMembers() == 4) then ConvertToRaid() end
				MultiBot.doSlash("/invite", bot.name)
			end
		end
		
		if(MultiBot.isInside(arg1, "remove: ")) then
			local bot = MultiBot.getBot(string.sub(arg1, 9, string.find(arg1, " ", 9) - 1))
			if(bot == nil) then return end
			
			bot.button.setState(false)
			bot.doHide()
		end
	end
	
	if(event == "CHAT_MSG_WHISPER") then
		local bot = MultiBot.getBot(arg2)
		if(bot == nil) then return end
		
		if(arg1 == "Hello") then
			bot.waitFor = "CO"
			bot.button.setState(true)
			SendChatMessage("co ?", "WHISPER", nil, arg2)
			SendChatMessage("Asked " .. arg2 .. " for Combat Strategies", "SAY")
			MultiBot.doRaid()
		end
		
		if(arg1 == "Goodbye!") then
			MultiBot.doRaid()
		end
		
		if(arg1 == "Hello!") then
			bot.waitFor = "CO"
			bot.button.setState(true)
			SendChatMessage("co ?", "WHISPER", nil, arg2)
			SendChatMessage("Asked " .. arg2 .. " for Combat Strategies", "SAY")
			MultiBot.doRaid()
		end
		
		if(bot.waitFor == "NC" and MultiBot.isInside(arg1, "Strategies: ")) then
			bot.waitFor = ""
			bot.setNormal(string.sub(arg1, 13))
			bot.setStrate()
		end
		
		if(bot.waitFor == "CO" and MultiBot.isInside(arg1, "Strategies: ")) then
			bot.waitFor = "NC"
			bot.setCombat(string.sub(arg1, 13))
			SendChatMessage("nc ?", "WHISPER", nil, arg2)
			SendChatMessage("Asked " .. arg2 .. " for Normal Strategies", "SAY")
		end
		
		if(bot.waitFor == "=== Inventory ===" and MultiBot.isInside(arg1, "Bag")) then
			InspectUnit(bot.name)
			bot.inventory:Show()
			bot.waitFor = ""
		end
		
		if(bot.waitFor == "=== Inventory ===" and arg1 ~= "=== Inventory ===") then
			SendChatMessage("stats", "WHISPER", nil, arg2)
			bot.inventory.addItem(arg1)
		end
		
		if(bot.waitFor == "equipping" and MultiBot.isInside(arg1, "equipping")) then
			bot.inventory.doRefresh()
		end
	end
end)

SLASH_MULTIBOT1 = "/multibot"
SLASH_MULTIBOT2 = "/mbot"
SLASH_MULTIBOT3 = "/mb"

SlashCmdList["MULTIBOT"] = function()
	if(MultiBot:IsVisible()) then
		for key, value in pairs(MultiBot.players.players) do value.inventory.doClose() end
		for key, value in pairs(MultiBot.friends.friends) do value.inventory.doClose() end
		for key, value in pairs(MultiBot.raid) do value:Hide() end
		
		MultiBot.players:Hide()
		MultiBot.friends:Hide()
		MultiBot.right:Hide()
		MultiBot.left:Hide()
		MultiBot:Hide()
		
		table.wipe(MultiBot.players.players)
		table.wipe(MultiBot.friends.friends)
		table.wipe(MultiBot.raid)
	else
		SendChatMessage(".playerbot bot list", "SAY")
		MultiBot:Show()
	end
end

print("AfterMultiBotControl")