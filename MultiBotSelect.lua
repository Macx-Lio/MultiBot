MultiBot.newSelect = function(pParent, pX, pY, pConfig)
	local button = CreateFrame("Button", nil, pParent)
	button.options = MultiBot.newFrame(pParent, -2, pParent.size + 3, pParent.size -4)
	
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
	
	button.addOptions = function(pStrate)
		for i = 1, table.getn(button.config[3]) do
			if(MultiBot.isInside(pStrate, button.config[3][i][7])) then button.setEnable(button.config[3][i]) end
			button.options.addOption(pX, i - 1, button, button.config[3][i])
		end
		
		if(button.action == nil) then
			button.setDisable(button.config[3][table.getn(button.config[3])])
		end
		
		return button
	end
	
	-- SET --
	
	button.setSelect = function(pStrate)
		for i = 1, table.getn(button.config[3]) do
			if(MultiBot.isInside(pStrate, button.config[3][i][7])) then button.setEnable(button.config[3][i]) end
		end
		
		if(button.action == nil) then
			button.setDisable(button.config[3][table.getn(button.config[3])])
		end
	end
	
	button.setDisable = function(pConfig)
		if(pConfig ~= nil) then
			button.icon:SetTexture("Interface/Icons/" .. pConfig[3])
			button.action = pConfig
		end
		
		button.tip = MultiBot.newTip(button.parent, button.config[5])
		button.icon:SetDesaturated(1)
		button.state = false
	end
	
	button.setEnable = function(pConfig)
		if(pConfig ~= nil) then
			button.icon:SetTexture("Interface/Icons/" .. pConfig[3])
			button.action = pConfig
		end
		
		button.tip = MultiBot.newTip(button.parent, button.config[4])
		button.icon:SetDesaturated(nil)
		button.state = true
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
		
		if(pButton == "LeftButton" and button.options ~= nil) then
			if(button.options:IsVisible()) then
				button.options:Hide()
			else
				button.options:Show()
			end
		end
		
		if(pButton == "RightButton" and button.action ~= nil) then
			if(button.state) then
				SendChatMessage(button.action[4], button.chat, nil, button.parent.getName())
				button.setDisable()
			else
				SendChatMessage(button.action[5], button.chat, nil, button.parent.getName())
				button.setEnable()
			end
		end
	end)
	
	-- RETURN --
	
	button.options:Hide()
	return button
end

print("AfterMultiBotSelect")