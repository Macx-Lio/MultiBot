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
	button.icon:SetTexture("Interface/Icons/" .. button.config[3])
	button.icon:SetAllPoints(button)
	button.icon:Show()
	
	button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square", "ADD")
	button:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
	
	-- SET --
	
	button.setChat = function(pChat)
		button.chat = pChat
		return button
	end
	
	-- GET --
	
	button.getChat = function()
		if(GetNumRaidMembers() > 5) then return "RAID" end
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
		if(button.config[2] == "=== Summon:All ===") then
			for key, value in pairs(MultiBot.chars) do
				if(value.button.state == true) then
					SendChatMessage(button.config[4], button.chat, nil, key)
				end
			end
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