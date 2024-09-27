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
	
	button.setPoint = function(pX, pY)
		button:SetPoint("BOTTOMRIGHT", pX, pY)
		button.x = pX
		button.y = pY
	end
	
	button.setDouble = function(pStrate)
		button.state = MultiBot.isInside(pStrate, button.config[6])
		
		if(button.state) then
			button.icon:SetTexture(MultiBot.IF(string.sub(pConfig[3], 1, 9) ~= "Interface", "Interface/Icons/", "")  .. pConfig[3])
			button.tip = MultiBot.newTip(button.parent, button.config[7])
		else
			button.icon:SetTexture(MultiBot.IF(string.sub(pConfig[4], 1, 9) ~= "Interface", "Interface/Icons/", "")  .. pConfig[4])
			button.tip = MultiBot.newTip(button.parent, button.config[8])
		end
		
		return button
	end
	
	button.setState = function(pState)
		button.state = pState
		
		if(pState) then
			button.icon:SetTexture(MultiBot.IF(string.sub(pConfig[3], 1, 9) ~= "Interface", "Interface/Icons/", "")  .. pConfig[3])
			button.tip = MultiBot.newTip(button.parent, button.config[7])
		else
			button.icon:SetTexture(MultiBot.IF(string.sub(pConfig[4], 1, 9) ~= "Interface", "Interface/Icons/", "")  .. pConfig[4])
			button.tip = MultiBot.newTip(button.parent, button.config[8])
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
				elseif(button.config[5] == "HIDE:CONTROL") then
					MultiBot.control.frames["controls"]:Hide()
				elseif(button.config[5] == "HIDE:UNITS") then
					MultiBot.units.doHide()
				elseif(button.config[5] == "HIDE:RAID") then
					button.parent.doHide()
				else
					SendChatMessage(button.config[5], button.chat, nil, button.parent.getName())
				end
				
				button.setState(false)
			else
				if(string.sub(button.config[6], 1, 1) == "/") then
					MultiBot.doSlash(button.config[6], button.parent.getName())
				elseif(button.config[6] == "SHOW:CONTROL") then
					MultiBot.control.frames["controls"]:Show()
				elseif(button.config[6] == "SHOW:UNITS") then
					MultiBot.units.doShow()
				elseif(button.config[6] == "SHOW:RAID") then
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
				elseif(button.config[9] == "UNITS:REFRESH") then
					MultiBot.units.doRefresh()
				else
					SendChatMessage(button.config[9], button.chat, nil, button.parent.getName())
				end
			end
		end
	end
	
	button.doParty = function(pButton)
		if(pButton == "LeftButton") then
			if(button.state) then
				if(string.sub(button.chat, 1, 4) == "RAID") then
					SendChatMessage(string.sub(button.chat, 6) .. " " .. button.config[5], MultiBot.getChat())
				else
					SendChatMessage(button.config[5], MultiBot.getChat())
				end
				
				button.setState(false)
			else
				if(string.sub(button.chat, 1, 4) == "RAID") then
					SendChatMessage(string.sub(button.chat, 6) .. " " .. button.config[6], MultiBot.getChat())
				else
					SendChatMessage(button.config[6], MultiBot.getChat())
				end
				
				button.setState(true)
			end
		end
		
		if(pButton == "RightButton") then
			if(button.config[9] ~= nil) then
				SendChatMessage(button.config[9], MultiBot.getChat())
			end
		end
	end
	
	-- RETURN --
	
	return button.setDouble(pStrate)
end

print("AfterMultiBotDouble")