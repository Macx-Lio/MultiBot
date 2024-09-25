MultiBot.newAction = function(pParent, pX, pY, pActionbar, pConfig)
	local button = CreateFrame("Button", nil, pParent)
	button.tip = MultiBot.newTip(pParent, pConfig[5])
	
	button.actionbar = pActionbar
	button.parent = pParent
	button.config = pConfig
	button.x = pX
	button.y = pY
	
	button:EnableMouse(true)
	button:RegisterForClicks("LeftButtonDown", "RightButtonDown")
	button:SetPoint("BOTTOMRIGHT", button.x, button.y)
	button:SetSize(button.parent.size, button.parent.size)
	
	button.icon = button:CreateTexture(nil, "BACKGROUND")
	button.icon:SetTexture(MultiBot.IF(string.sub(pConfig[3], 1, 9) ~= "Interface", "Interface/Icons/", "")  .. pConfig[3])
	button.icon:SetAllPoints(button)
	button.icon:Show()
	
	button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square", "ADD")
	button:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
	
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
			if(string.sub(button.config[4], 1, 7) == "@target")
			then button.doTarget(string.sub(button.config[4], 9), UnitName("target"))
			elseif(button.actionbar.chat == "WHISPER")
			then SendChatMessage(button.config[4], button.actionbar.chat, nil, button.parent.getName())
			else SendChatMessage(button.config[4], MultiBot.getChat())
			end
		end
		
		if(pButton == "RightButton") then
			button.actionbar.setAction(button.config)
			button.parent:Hide()
		end
	end)
	
	-- DO --
	
	button.doTarget = function(pAction, pName)
		if(pName == nil or pName == "Unknown Entity") then return end
		SendChatMessage(pAction, "WHISPER", nil, pName)
	end
	
	-- RETURN --
	
	return button
end

print("AfterMultiBotAction")