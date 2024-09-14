MultiBot.newDouble = function(pParent, pX, pY, pConfig, pStrate)
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
	button.icon:SetAllPoints(button)
	button.icon:Show()
	
	button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square", "ADD")
	button:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
	
	-- SET --
	
	button.setDouble = function(pStrate)
		button.state = MultiBot.isInside(pStrate, button.config[6])
		
		if(button.state) then
			button.icon:SetTexture("Interface/Icons/" .. button.config[3])
			button.tip = MultiBot.newTip(button.parent, button.config[7])
		else
			button.icon:SetTexture("Interface/Icons/" .. button.config[4])
			button.tip = MultiBot.newTip(button.parent, button.config[8])
		end
		
		return button
	end
	
	button.setState = function(pState)
		button.state = pState
		
		if(pState) then
			button.icon:SetTexture("Interface/Icons/" .. button.config[3])
			button.tip = MultiBot.newTip(button.parent, button.config[7])
		else
			button.icon:SetTexture("Interface/Icons/" .. button.config[4])
			button.tip = MultiBot.newTip(button.parent, button.config[8])
		end
		
		return button
	end
	
	button.setChat = function(pChat)
		button.chat = pChat
		return button
	end
	
	-- GET --
	
	button.getChat = function()
		if(GetNumPartyMembers() > 5) then return "RAID" end
		if(GetNumPartyMembers() > 0) then return "PARTY" end
		return "WHISPER"
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
		if(button.chat == "WHISPER")
		then button.doWhisper(pButton)
		else button.doParty(pButton)
		end
	end)
	
	-- DO --
	
	button.doWhisper = function(pButton)
		if(pButton == "LeftButton") then
			if(button.state) then
				if(string.sub(button.config[5], 1, 1) == "/") then
					MultiBot.doSlash(button.config[5], button.parent.getName())
				elseif(button.config[5] == "HIDE") then
					button.parent.doHide()
				else
					SendChatMessage(button.config[5], button.chat, nil, button.parent.getName())
				end
				
				button.setState(false)
			else
				if(string.sub(button.config[6], 1, 1) == "/") then
					MultiBot.doSlash(button.config[6], button.parent.getName())
				elseif(button.config[6] == "SHOW") then
					button.parent.doShow()
				else
					SendChatMessage(button.config[6], button.chat, nil, button.parent.getName())
				end
				
				button.setState(true)
			end
		end
		
		if(pButton == "RightButton") then
			if(button.config[9] ~= nil) then
				if(string.sub(button.config[9], 1, 1) == "/") then
					MultiBot.doSlash(button.config[9], "")
				else
					SendChatMessage(button.config[9], button.chat, nil, button.parent.getName())
				end
			end
		end
	end
	
	button.doParty = function(pButton)
		if(pButton == "LeftButton") then
			if(button.state) then
				SendChatMessage(button.config[5], button.getChat())
				button.setState(false)
			else
				SendChatMessage(button.config[6], button.getChat())
				button.setState(true)
			end
		end
		
		if(pButton == "RightButton") then
			if(button.config[9] ~= nil) then
				SendChatMessage(button.config[9], button.getChat())
			end
		end
	end
	
	-- RETURN --
	
	return button.setDouble(pStrate)
end

print("AfterMultiBotDouble")