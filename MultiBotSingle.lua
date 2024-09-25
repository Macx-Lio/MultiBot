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
		
		if(button.config[4] == "SUMMON:ALL") then
			MultiBot.players.doSummon()
			MultiBot.friends.doSummon()
		elseif(button.config[4] == "FRIENDS:BROWSE") then
			MultiBot.friends.doBrowse(UnitName("target"))
		elseif(string.sub(button.chat, 1, 4) == "RAID") then
			button.doRaid(button.config[4], string.sub(button.chat, 6))
		elseif(string.sub(button.config[4], 1, 7) == "CONTROL") then
			button.doControl(string.sub(button.config[4], 9), UnitName("target"))
		elseif(string.sub(button.config[4], 1, 11) == "BEASTMASTER") then
			button.doBeastmaster(string.sub(button.config[4], 13), UnitName("target"))
		elseif(button.chat == "WHISPER") then
			SendChatMessage(button.config[4], button.chat, nil, button.parent.getName())
		else
			SendChatMessage(button.config[4], MultiBot.getChat())
		end
	end)
	
	-- DO --
	
	button.doBeastmaster = function(pAction, pName)
		if(pAction == "SWITCH") then
			if(button.parent.frames["SPELLS"]:IsVisible())
			then button.parent.frames["SPELLS"]:Hide()
			else button.parent.frames["SPELLS"]:Show()
			end
		else
			if(pName == nil or pName == "Unknown Entity")
			then SendChatMessage("cast " .. pAction, MultiBot.getChat())
			else SendChatMessage("cast " .. pAction, "WHISPER", nil, pName)
			end
		end
	end
	
	button.doControl = function(pAction, pName)
		if(pName == nil or pName == "Unknown Entity")
		then SendChatMessage(pAction, MultiBot.getChat())
		else SendChatMessage(pAction, "WHISPER", nil, pName)
		end
	end
	
	button.doRaid = function(pAction, pGroup)
		SendChatMessage(pGroup .. " " .. pAction, MultiBot.getChat())
	end
	
	-- RETURN --
	
	return button
end

print("AfterMultiBotSingle")