MultiBot.eventHandler = CreateFrame("Frame")
MultiBot.eventHandler:RegisterEvent("PLAYER_TARGET_CHANGED")
MultiBot.eventHandler:RegisterEvent("CHAT_MSG_WHISPER")
MultiBot.eventHandler:RegisterEvent("CHAT_MSG_SYSTEM")
MultiBot.eventHandler:RegisterEvent("CHAT_MSG_ADDON")
MultiBot.eventHandler:RegisterEvent("UPDATE")
MultiBot.eventHandler:Hide()

-- MultiBot.waitFor = {}

MultiBot.eventHandler:SetScript("OnEvent", function()
	if (event == "PLAYER_TARGET_CHANGED") then
	end

	if (event == "CHAT_MSG_SYSTEM") then
		if(MultiBot.isInside(arg1, "Bot roster: ")) then
			MultiBot.button = MultiBot.newDouble(MultiBot, 0, 0, MultiBot.config.start, "SHOW")
			
			MultiBot.left = MultiBot.newFrame(MultiBot, -43, 2, 36)
			local tX = 0
			
			MultiBot.left.addSingle(tX, 0, MultiBot.config.flee).setChat("PARTY")
			tX = tX - 39
			
			MultiBot.left.addDouble(tX, 0, MultiBot.config.stay, "follow").setChat("PARTY")
			tX = tX - 39
			
			MultiBot.left.addDouble(tX, 0, MultiBot.config.passive, "").setState(true).setChat("PARTY")
			tX = tX - 39
			
			MultiBot.left.addSingle(tX, 0, MultiBot.config.attack).setChat("PARTY")
			tX = tX - 39
			
			MultiBot.left.addSingle(tX, 0, MultiBot.config.tanker).setChat("PARTY")
			tX = tX + 39
			
			MultiBot.right = MultiBot.newFrame(MultiBot, 39, 2, 36)
			local tX = 0
			
			
			MultiBot.right.addSingle(tX, 0, MultiBot.config.release).setChat("PARTY")
			tX = tX + 39
			
			MultiBot.right.addSingle(tX, 0, MultiBot.config.revive).setChat("PARTY")
			tX = tX + 39
			
			MultiBot.right.addSingle(tX, 0, MultiBot.config.sumall).setChat("WHISPER")
			tX = tX + 39
			
			MultiBot.setRoster(string.sub(arg1, 13))
		end
		
		if(MultiBot.isInside(arg1, " - player already logged in")) then
			local tName = string.sub(arg1, 6, string.find(arg1, " ", 6) - 1)
			SendChatMessage("Asked " .. tName .. " for Combat Strategies", "SAY")
			SendChatMessage("co ?", "WHISPER", nil, tName)
			MultiBot.chars[tName].waitFor = "CO"
		end
		
		if(MultiBot.isInside(arg1, "remove: ")) then
			local tName = string.sub(arg1, 9, string.find(arg1, " ", 9) - 1)
			if(MultiBot.chars[tName] == nil) then SendChatMessage(string.sub(arg1, 9, string.find(arg1, " ", 9) - 1), "SAY") end
			MultiBot.chars[tName].button.setState(false)
			MultiBot.chars[tName].doHide()
		end
	end
	
	if(event == "CHAT_MSG_WHISPER") then
		if(MultiBot.chars[arg2] == nil) then return end
		
		if(arg1 == "Hello!") then
			MultiBot.chars[arg2].waitFor = "CO"
			MultiBot.chars[arg2].button.setState(true)
			SendChatMessage("co ?", "WHISPER", nil, arg2)
			SendChatMessage("Asked " .. arg2 .. " for Combat Strategies", "SAY")
		end
		
		if(MultiBot.chars[arg2].waitFor == "NC" and MultiBot.isInside(arg1, "Strategies: ")) then
			MultiBot.chars[arg2].waitFor = ""
			MultiBot.chars[arg2].setNormal(string.sub(arg1, 13))
			MultiBot.chars[arg2].setStrate()
		end
		
		if(MultiBot.chars[arg2].waitFor == "CO" and MultiBot.isInside(arg1, "Strategies: ")) then
			MultiBot.chars[arg2].waitFor = "NC"
			MultiBot.chars[arg2].setCombat(string.sub(arg1, 13))
			SendChatMessage("nc ?", "WHISPER", nil, arg2)
			SendChatMessage("Asked " .. arg2 .. " for Normal Strategies", "SAY")
		end
		
		if(MultiBot.chars[arg2].waitFor == "=== Inventory ===" and MultiBot.isInside(arg1, "Bag")) then
			MultiBot.chars[arg2].inventory:Show()
			MultiBot.chars[arg2].waitFor = ""
		end
		
		if(MultiBot.chars[arg2].waitFor == "=== Inventory ===" and arg1 ~= "=== Inventory ===") then
			SendChatMessage("stats", "WHISPER", nil, arg2)
			MultiBot.chars[arg2].inventory.addItem(arg1)
		end
	end
end)

SLASH_MULTIBOT1 = "/multibot"
SLASH_MULTIBOT2 = "/mbot"
SLASH_MULTIBOT3 = "/mb"

SlashCmdList["MULTIBOT"] = function()
	if(MultiBot:IsVisible()) then
		MultiBot:Hide()
	else
		SendChatMessage(".playerbot bot list", "SAY")
		MultiBot:Show()
	end
end

print("AfterMultiBotControl")