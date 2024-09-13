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
	button.icon:SetTexture("Interface/Icons/" .. button.config[3])
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
		
		for k, v in pairs(MultiBot.config.radio[button.radio]) do
			if(k ~= button.config[2]) then v.setState(false) end
		end
	end
	
	button.setLink = function()
		if(button.link == nil) then return end
		
		for k, v in pairs(MultiBot.config.link[button.link]) do
			if(k ~= button.config[2]) then v.setState(button.state) end
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
			if(MultiBot.isInside(button.config[4], "=== Inventory:Close ===")) then
				MultiBot.chars[button.parent.getName()].inventory.doClose()
			end
		else
			if(MultiBot.isInside(button.config[5], "=== Inventory:Open ===")) then
				for key, value in pairs(MultiBot.chars) do
					if(value.right ~= nil) then
						value.right.buttons[button.config[2]].setState(false)
						value.inventory.doClose()
					end
				end
				
				MultiBot.chars[button.parent.getName()].waitFor = "=== Inventory ==="
				SendChatMessage(button.config[8], button.chat, nil, button.parent.getName())
			end
		end
		
		if(button.state) then
			button.setState(false)
			SendChatMessage(button.config[4], button.chat, nil, button.parent.getName())
			button.parent.setLink(button)
		else
			button.setState(true) 
			SendChatMessage(button.config[5], button.chat, nil, button.parent.getName())
			button.parent.setRadio(button)
			button.parent.setLink(button)
		end
	end)
	
	return button.setSwitch(pStrate)
end

print("AfterMultiBotSwitch")