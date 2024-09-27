MultiBot.newOption = function(pParent, pX, pY, pSelect, pConfig)
	local button = CreateFrame("Button", nil, pParent)
	button.tip = MultiBot.newTip(pParent, pConfig[6])
	
	button.parent = pParent
	button.select = pSelect
	button.config = pConfig
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
	
	-- SET --
	
	button.setPoint = function(pX, pY)
		button:SetPoint("BOTTOMRIGHT", pX, pY)
		button.x = pX
		button.y = pY
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
		button.select.setEnable(button.config)
		button.parent:Hide()
		
		if(string.sub(button.config[5], 1, 5) == "UNITS") then
			MultiBot.units.doBrowse(0)
		else
			if(button.select.chat == "WHISPER")
			then SendChatMessage(button.config[5], button.select.chat, nil, button.parent.getName())
			else SendChatMessage(button.config[5], MultiBot.getChat())
			end
		end
	end)
	
	-- RETURN --
	
	return button
end

print("AfterMultiBotOption")