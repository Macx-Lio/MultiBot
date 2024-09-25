MultiBot.newActionbar = function(pParent, pX, pY, pConfig)
	local button = CreateFrame("Button", nil, pParent)
	button.actions = MultiBot.newFrame(pParent, -2, pParent.size + 2, pParent.size - 4)
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
	
	button.addActions = function(pDefault)
		for i = 1, table.getn(button.config[3]) do
			button.actions.addAction(pX, i - 1, button, button.config[3][i])
		end
		
		button.setAction(button.config[3][pDefault])
		return button
	end
	
	-- SET --
	
	button.setAction = function(pConfig)
		button.icon:SetTexture(MultiBot.IF(string.sub(pConfig[3], 1, 9) ~= "Interface", "Interface/Icons/", "") .. pConfig[3])
		button.tip = MultiBot.newTip(button.parent, button.config[4])
		button.action = pConfig
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
		if(button.action == nil) then return end
		
		if(pButton == "LeftButton") then
			if(string.sub(button.action[4], 1, 7) == "@target")
			then button.doTarget(string.sub(button.action[4], 9), UnitName("target"))
			elseif(button.chat == "WHISPER")
			then SendChatMessage(button.action[4], button.chat, nil, button.parent.getName())
			else SendChatMessage(button.action[4], MultiBot.getChat())
			end
		end
		
		if(pButton == "RightButton") then
			if(button.actions:IsVisible())
			then button.actions:Hide()
			else button.actions:Show()
			end
		end
	end)
	
	-- DO --
	
	button.doTarget = function(pAction, pName)
		if(pName == nil or pName == "Unknown Entity") then return end
		SendChatMessage(pAction, "WHISPER", nil, pName)
	end
	
	-- RETURN --
	
	button.actions:Hide()
	return button
end

print("AfterMultiBotActionbar")