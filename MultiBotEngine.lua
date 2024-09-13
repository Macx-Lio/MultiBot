MultiBot = CreateFrame("Frame", nil, UIParent)
MultiBot:SetPoint("BOTTOMRIGHT", -304, 104)
MultiBot:SetSize(40, 40)
MultiBot:Hide()

MultiBot.left = nil
MultiBot.right = nil
MultiBot.button = nil
MultiBot.inventory = nil
MultiBot.chars = {}
MultiBot.size = 40

MultiBot.newTip = function(pParent, pTip)
	return { pTip, "ANCHOR_TOPRIGHT", -(pParent.size + 2), 2 }
end

MultiBot.addCharacter = function(pName, pClass, pX, pY)
	if(MultiBot.chars[pName] == nil) then MultiBot.chars[pName] = MultiBot.newCharacter(MultiBot, pName, pClass, pX, pY, 40) end
	return MultiBot.chars[pName]
end

MultiBot.setButton = function(pX, pIndex, pConfig)
	MultiBot.button = MultiBot.newDouble(MultiBot, pX, MultiBot.size * pIndex, pConfig, "SHOW")
	return MultiBot.button
end

MultiBot.setTip = function(pParent, pTip)
	GameTooltip:SetOwner(pParent, pTip[2], pTip[3], pTip[4])
	GameTooltip:SetText(pTip[1])
	GameTooltip:Show()
end

MultiBot.setRoster = function(pRoster)
	local tList = MultiBot.doSplit(pRoster, ", ")
	
	for i = 1, table.getn(tList) do
		local tFrom, tTo = string.find(tList[i], " ", 1)
		local tName = string.sub(tList[i], 2, tFrom - 1)
		local tClass = string.sub(tList[i], tTo + 1)
		local tOnline = string.sub(tList[i], 1, 1)
		
		local tConfig = {
			"TOGGLE",
			tName,
			-- "class_" .. strlower(tClass),
			"inv_scroll_05",
			".playerbot bot remove " .. tName,
			".playerbot bot add " .. tName,
			"Left to show or hide Options | Right to logout " .. tName,
			tClass .. " - " .. tName,
			tName
		}
		
		MultiBot
		.addCharacter(tName, tClass, 0, i * 42)
		.setButton(tConfig)
	end
end

MultiBot.doHide = function()
	for k, v in pairs(MultiBot.chars) do
		v.doHide()
		v:Hide()
	end
end

MultiBot.doShow = function()
	for k, v in pairs(MultiBot.chars) do
		v.doShow()
		v:Show()
	end
end

print("AfterMultiBotEngine")