MultiBot.newSingle = function(pParent, pX, pY, pConfig)
	local button = CreateFrame("Button", nil, pParent)
	button.tip = MultiBot.newTip(pParent, pConfig[5])
	
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
	if(string.sub(button.config[3], 1, 9) ~= "Interface")
	then button.icon:SetTexture("Interface/Icons/" .. button.config[3])
	else button.icon:SetTexture(button.config[3]) end
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
	
	button.setChat = function(pChat)
		button.chat = pChat
		return button
	end
	
	-- GET --
	
	button.getChat = function()
		if(GetNumRaidMembers() > 5) then return "RAID" end
		return "PARTY"
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
		if(button.chat == "WHISPER")
		then button.doWhisper()
		else button.doParty()
		end
	end)
	
	-- DO --
	
	button.doWhisper = function()
		if(button.config[4] == "SUMMON:ALL") then
			MultiBot.players.doSummon()
			MultiBot.friends.doSummon()
		elseif(button.config[4] == "FRIENDS:BROWSE") then
			MultiBot.friends.doBrowse()
		else
			SendChatMessage(button.config[4], button.chat, nil, button.parent.getName())
		end
	end
	
	button.doParty = function()
		SendChatMessage(button.config[4], button.getChat())
	end
	
	-- RETURN --
	
	return button
end

print("AfterMultiBotSingle")