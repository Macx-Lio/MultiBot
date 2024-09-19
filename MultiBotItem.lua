MultiBot.newItem = function(pParent, pIndex, pInfo)
	local button = CreateFrame("Button", nil, pParent)
	button.parent = pParent
	button.chat = "WHISPER"
	
	button.index = pIndex + 1
	button.id = MultiBot.doSplit(pInfo, ":")[2]
	button.x = pIndex%8 * (pParent.size + 6) + pParent.ox
	button.y = math.floor(pIndex / 8) * (pParent.size + 5) * -1 - pParent.oy
	
	button:EnableMouse(true)
	button:SetPoint("TOPLEFT", button.x, button.y)
	button:SetSize(button.parent.size + 4, button.parent.size + 4)
	button:RegisterForClicks("LeftButtonDown")
	
	button.icon = button:CreateTexture(nil, "BACKGROUND")
	button.icon:SetTexture(GetItemIcon(button.id))
	button.icon:SetAllPoints(button)
	button.icon:Show()
	
	button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square", "ADD")
	button:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
	
	button.amount = button:CreateFontString(nil, "ARTWORK")
	button.amount:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
	button.amount:SetPoint("BOTTOMRIGHT", 0, 0)
	button.amount:SetText(string.sub(MultiBot.doSplit(MultiBot.doSplit(pInfo, "]")[2], " ")[1], 6))
	
	button.setItem = function(pInfo)
		local iName, iLink, iRarity, iLevel, iMinLevel, iType, iSubType, iStackCount, iEquipLoc, iTexture, iSellPrice = GetItemInfo(button.id)
		
		if(iLink == nil) then
			button.tip = MultiBot.newTip(button.parent, pInfo)
		else
			button.tip = MultiBot.newTip(button.parent, iLink)
		end
		
		button.link = iLink
		return button
	end
	
	button:SetScript("OnEnter", function()
		if(button.tip ~= nil) then
			if(button.link ~= nil) then
				MultiBot.setItemTip(button, button.tip)
			else
				MultiBot.setTip(button, button.tip)
			end
		end
	end)
	
	button:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	
	button:SetScript("OnClick", function(pSelf, pButton)
		local tAction = button.parent.getAction()
		
		if(tAction == "SELL") then
			SendChatMessage("s " .. button.link, button.chat, nil, button.parent.name)
			button:Hide()
		end
		
		if(tAction == "EQUIP") then
			SendChatMessage("e " .. button.link, button.chat, nil, button.parent.name)
			MultiBot.getBot(button.parent.name).waitFor = "equipping"
		end
		
		if(tAction == "USE") then
			SendChatMessage("u " .. button.link, button.chat, nil, button.parent.name)
		end
		
		if(tAction == "DROP") then
			SendChatMessage("destroy " .. button.link, button.chat, nil, button.parent.name)
			button:Hide()
		end
	end)
	
	return button.setItem(pInfo)
end

print("AfterMultiBotItem")