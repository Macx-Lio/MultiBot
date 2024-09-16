MultiBot.newItem = function(pParent, pIndex, pInfo)
	local button = CreateFrame("Button", nil, pParent)
	button.parent = pParent
	button.chat = "WHISPER"
	
	button.index = pIndex + 1
	button.id = MultiBot.doSplit(pInfo, ":")[2]
	button.x = pIndex%4 * (pParent.size + 4)
	button.y = math.floor(pIndex / 4) * (pParent.size + 4) * -1
	
	button:EnableMouse(true)
	button:SetPoint("BOTTOMRIGHT", button.x, button.y)
	button:SetSize(button.parent.size, button.parent.size)
	button:RegisterForClicks("LeftButtonDown", "RightButtonDown")
	
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
	
	button.setItem = function()
		local iName, iLink, iRarity, iLevel, iMinLevel, iType, iSubType, iStackCount, iEquipLoc, iTexture, iSellPrice = GetItemInfo(button.id)
		button.tip = MultiBot.newTip(button.parent, iLink)
		button.link = iLink
		return button
	end
	
	button:SetScript("OnEnter", function()
		if(button.tip ~= nil) then
			MultiBot.setItemTip(button, button.tip)
		end
	end)
	
	button:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	
	button:SetScript("OnClick", function(pSelf, pButton)
		if(pButton == "LeftButton") then
			SendChatMessage("s " .. button.link, button.chat, nil, button.parent.name)
			button:Hide()
		end
		
		if(pButton == "RightButton") then
			SendChatMessage("destroy " .. button.link, button.chat, nil, button.parent.name)
			button:Hide()
		end
	end)
	
	return button.setItem()
end

print("AfterMultiBotItem")