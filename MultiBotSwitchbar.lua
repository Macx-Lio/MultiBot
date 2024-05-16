MultiBot.newSwitchbar = function(pParent, pX, pY, pConfig, pStrate)
	local button = CreateFrame("Button", nil, pParent)
	button.switches = MultiBot.newFrame(pParent, pX, pParent.size + 3, pParent.size -4)
	button.tip = MultiBot.newTip(pParent, pConfig[5])
	
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
	button.icon:SetTexture("Interface/Icons/" .. button.config[3])
	button.icon:SetAllPoints(button)
	button.icon:SetDesaturated(nil)
	button.icon:Show()
	
	button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square", "ADD")
	button:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
	
	-- ADD --
	
	button.addSwitches = function(pStrate)
		for i = 1, table.getn(button.config[4]) do
			button.switches.addSwitch(-2, i - 1, button.config[4][i], pStrate)
		end
		
		return button
	end
	
	-- SET --
	
	button.setSwitches = function(pStrate)
		for i = 1, table.get(button.config[4]) do
			button.switches[button.config[4][i][2]].setSwitch(pStrate)
		end
	end
	
	button.setSwitchbar = function(pStrate)
		if(table.getn(button.config) ~= 9) then return end
		button.setState(MultiBot.isInside(pStrate, button.config[9]))
	end
	
	button.setState = function(pState)
		button.state = pState
		
		if(button.state) then
			button.tip = MultiBot.newTip(button.parent, pConfig[5])
			button.icon:SetDesaturated(nil)
		else
			button.tip = MultiBot.newTip(button.parent, pConfig[6])
			button.icon:SetDesaturated(1)
		end
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
		
		if(pButton == "LeftButton" and button.switches ~= nil) then
			if(button.switches:IsVisible()) then
				button.switches:Hide()
			else
				button.switches:Show()
			end
		end
		
		if(pButton == "RightButton" and button.state ~= nil) then
			if(button.state) then
				SendChatMessage(button.config[7], button.chat, nil, button.parent.getName())
				button.setState(false)
			else
				SendChatMessage(button.config[8], button.chat, nil, button.parent.getName())
				button.setState(true)
			end
		end
	end)
	
	-- RETURN --
	
	if(table.getn(button.config) == 9) then
		button.setState(MultiBot.isInside(pStrate, button.config[9]))
	end
	
	button.setSwitchbar(pStrate)
	button.switches:Hide()
	return button
end

print("AfterMultiBotSwitchbar")