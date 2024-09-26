MultiBot.newSwitch = function(pParent, pX, pY, pConfig, pStrate)
	local button = CreateFrame("Button", nil, pParent)
	button.radio = nil
	button.link = nil
	
	button.parent = pParent
	button.config = pConfig
	button.chat = "WHISPER"
	button.x = pX
	button.y = pY
	
	button:EnableMouse(true)
	button:RegisterForClicks("LeftButtonDown")
	button:SetPoint("BOTTOMRIGHT", button.x, button.y)
	button:SetSize(button.parent.size, button.parent.size)
	
	button.icon = button:CreateTexture(nil, "BACKGROUND")
	button.icon:SetTexture(MultiBot.IF(string.sub(pConfig[3], 1, 9) ~= "Interface", "Interface/Icons/", "")  .. pConfig[3])
	button.icon:SetAllPoints(button)
	button.icon:Show()
	
	button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square", "ADD")
	button:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
	
	if(string.find(pConfig[1], ":")) then
		button.radio = string.sub(pConfig[1], string.find(pConfig[1], ":") + 1)
		if(string.find(button.radio, "=")) then button.radio = string.sub(button.radio, 1, string.find(button.radio, "=") - 1) end
		button.parent.addRadio(button, button.radio)
	end
	
	if(string.find(pConfig[1], "=")) then
		button.link = string.sub(pConfig[1], string.find(pConfig[1], "=") + 1)
		button.parent.addLink(button, button.link)
	end
	
	-- SET --
	
	button.setPoint = function(pX, pY)
		button:SetPoint("BOTTOMRIGHT", pX, pY)
		button.x = pX
		button.y = pY
	end
	
	button.setSwitch = function(pStrate)
		button.state = MultiBot.isInside(pStrate, button.config[8])
		
		if(button.state) then
			button.tip = MultiBot.newTip(button.parent, button.config[6])
			button.icon:SetDesaturated(nil)
		else
			button.tip = MultiBot.newTip(button.parent, button.config[7])
			button.icon:SetDesaturated(1)
		end
		
		return button
	end
	
	button.setState = function(pState)
		button.state = pState
		
		if(button.state) then
			button.tip = MultiBot.newTip(button.parent, button.config[6])
			button.icon:SetDesaturated(nil)
		else
			button.tip = MultiBot.newTip(button.parent, button.config[7])
			button.icon:SetDesaturated(1)
		end
		
		return button
	end
	
	button.setRadio = function()
		if(button.radio == nil) then return end
		
		for key, value in pairs(MultiBot.config.radio[button.radio]) do
			if(key ~= button.config[2]) then value.setState(false) end
		end
	end
	
	button.setLink = function()
		if(button.link == nil) then return end
		
		for key, value in pairs(MultiBot.config.link[button.link]) do
			if(key ~= button.config[2]) then value.setState(button.state) end
		end
	end
	
	button.setChat = function(pChat)
		button.chat = pChat
		return button
	end
	
	-- EVENT --
	
	button:SetScript("OnEnter", function()
		if(button.tip ~= nil) then
			MultiBot.setTip(button, button.tip)
		end
	end)
	
	button:SetScript("OnLeave", function()
		button:SetPoint("BOTTOMRIGHT", button.x, button.y)
		button:SetSize(button.parent.size, button.parent.size)
		GameTooltip:Hide()
	end)
	
	button:SetScript("OnClick", function()
		button:SetPoint("BOTTOMRIGHT", button.x - 1, button.y + 1)
		button:SetSize(button.parent.size - 2, button.parent.size - 2)
		
		if(button.state) then
			if(string.sub(button.chat, 1, 4) == "RAID") then
				SendChatMessage(string.sub(button.chat, 6) .. " " .. button.config[4], MultiBot.getChat())
				return button.setState(false)
			elseif(button.config[4] == "RELEASE:DISABLE") then
				MultiBot.auto.release = false
				return button.setState(false)
			end
		else
			if(string.sub(button.chat, 1, 4) == "RAID") then
				SendChatMessage(string.sub(button.chat, 6) .. " " .. button.config[5], MultiBot.getChat())
				return button.setState(true)
			elseif(button.config[5] == "RELEASE:ENABLE") then
				MultiBot.auto.release = true
				return button.setState(true)
			end
		end
		
		local bot = MultiBot.getBot(button.parent.getName())
		if(bot == nil) then return end
		
		if(button.state) then
			if(button.doCloseInventory(bot)) then
				return button.setState(false)
			else
				SendChatMessage(button.config[4], button.chat, nil, bot.name)
				button.parent.setLink(button)
				return button.setState(false)
			end
		else
			if(button.doOpenInventory(bot)) then
				return button.setState(true)
			else
				SendChatMessage(button.config[5], button.chat, nil, bot.name)
				button.parent.setRadio(button)
				button.parent.setLink(button)
				return button.setState(true)
			end
		end
	end)
	
	-- DO --
	
	button.doCloseInventory = function(bot)
		if(button.config[4] ~= "INVENTORY:CLOSE") then return false end
		bot.inventory.doClose()
		return true
	end
	
	button.doOpenInventory = function(bot)
		if(button.config[5] ~= "INVENTORY:OPEN") then return false end
		
		MultiBot.players.doCloseInventories(bot.name)
		MultiBot.friends.doCloseInventories(bot.name)
		bot.inventory.doOpen()
		
		SendChatMessage(button.config[8], button.chat, nil, bot.name)
		return true
	end
	
	return button.setSwitch(pStrate)
end

print("AfterMultiBotSwitch")