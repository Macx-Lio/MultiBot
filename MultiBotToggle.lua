MultiBot.newToggle = function(pParent, pX, pY, pConfig, pState)
	local button = CreateFrame("Button", nil, pParent)
	
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
	button.icon:Show()
	
	button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square", "ADD")
	button:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
	
	-- SET --
	
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
	
	button:SetScript("OnClick", function(pSelf, pButton)
		button:SetPoint("BOTTOMRIGHT", button.x - 1, button.y + 1)
		button:SetSize(button.parent.size - 2, button.parent.size - 2)
		
		if(pButton == "LeftButton") then
			if(button.state) then
				if(button.parent.left:IsVisible()) then
					button.parent.doHide()
				else
					button.parent.doShow()
				end
			else
				SendChatMessage(button.config[5], button.chat, nil, button.parent.getName())
				button.setState(true)
			end
		end
		
		if(pButton == "RightButton") then
			SendChatMessage(button.config[4], button.chat, nil, button.parent.getName())
			button.setState(false)
		end
	end)
	
	return button.setState(pState)
end

print("AfterMultiBotToggle")