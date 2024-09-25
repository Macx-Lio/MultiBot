MultiBot.newModebar = function(pParent, pX, pY, pConfig)
	local button = CreateFrame("Button", nil, pParent)
	button.modes = MultiBot.newFrame(pParent, -2, pParent.size + 2, pParent.size - 4)
	button.parent = pParent
	button.config = pConfig
	button.chat = "WHISPER"
	button.x = pX
	button.y = pY
	
	button:EnableMouse(true)
	button:RegisterForClicks("LeftButtonDown", "RightButtonDown")
	button:SetPoint("BOTTOMRIGHT", button.x, button.y)
	button:SetSize(button.parent.size, button.parent.size)
	
	button.icon = button:CreateTexture(nil, "BACKGROUND")
	button.icon:SetAllPoints(button)
	button.icon:SetDesaturated(nil)
	button.icon:Show()
	
	button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square", "ADD")
	button:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
	
	-- ADD --
	
	button.addModes = function(pDefault)
		for i = 1, table.getn(button.config[3]) do
			button.modes.addMode(pX, i - 1, button, button.config[3][i])
		end
		
		button.setMode(button.config[3][pDefault])
		return button
	end
	
	-- SET --
	
	button.setMode = function(pConfig)
		button.icon:SetTexture(MultiBot.IF(string.sub(pConfig[3], 1, 9) ~= "Interface", "Interface/Icons/", "") .. pConfig[3])
		button.mode = pConfig
		button.setState(true)
	end
	
	button.setState = function(pState)
		button.state = pState
		
		if(button.state) then
			button.tip = MultiBot.newTip(button.parent, button.mode[6])
			button.icon:SetDesaturated(nil)
		else
			button.tip = MultiBot.newTip(button.parent, button.mode[7])
			button.icon:SetDesaturated(1)
		end
		
		return button
	end
	
	button.setChat = function(pChat)
		button.chat = pChat
		return button
	end
	
	-- EVENTS --
	
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
	
	button:SetScript("OnClick", function(pSelf, pButton)
		button:SetPoint("BOTTOMRIGHT", button.x - 1, button.y + 1)
		button:SetSize(button.parent.size - 2, button.parent.size - 2)
		if(button.mode == nil) then return end
		
		if(pButton == "LeftButton") then
			if(button.state) then
				button.doExecute(button.mode[4])
				button.setState(false)
			else
				button.doExecute(button.mode[5])
				button.setState(true)
			end
		end
		
		if(pButton == "RightButton") then
			if(button.modes:IsVisible())
			then button.modes:Hide()
			else button.modes:Show()
			end
		end
	end)
	
	-- DO --
	
	button.doExecute = function(pAction, pState)
		if(button.chat == "WHISPER")
		then SendChatMessage(pAction, button.chat, nil, button.parent.getName())
		else SendChatMessage(pAction, MultiBot.getChat())
		end
	end
	
	-- RETURN --
	
	button.modes:Hide()
	return button
end

print("AfterMultiBotModebar")