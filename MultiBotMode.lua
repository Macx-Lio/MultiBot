MultiBot.newMode = function(pParent, pX, pY, pModebar, pConfig)
	local button = CreateFrame("Button", nil, pParent)
	button.tip = MultiBot.newTip(pParent, pConfig[7])
	
	button.modebar = pModebar
	button.parent = pParent
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
			button.modebar.doExecute(button.config[4])
			button.modebar.setMode(button.config)
			button.parent:Hide()
		end
	end)
	
	-- RETURN --
	
	return button
end

print("AfterMultiBotMode")