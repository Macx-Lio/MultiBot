MultiBot = CreateFrame("Frame", nil, UIParent)
MultiBot.inventory = nil
MultiBot.button = nil
MultiBot.right = nil
MultiBot.left = nil

MultiBot.chars = {}
MultiBot.raid = {}

MultiBot.size = 36

MultiBot:SetPoint("BOTTOMRIGHT", -304, 104)
MultiBot:SetSize(MultiBot.size, MultiBot.size)
MultiBot:Hide()

MultiBot.newTip = function(pParent, pTip)
	return { pTip, "ANCHOR_TOPRIGHT", -(pParent.size + 2), 2 }
end

MultiBot.addCharacter = function(pName, pClass, pX, pY)
	if(MultiBot.chars[pName] == nil) then MultiBot.chars[pName] = MultiBot.newCharacter(MultiBot, pName, pClass, pX, pY, MultiBot.size) end
	return MultiBot.chars[pName]
end

MultiBot.addControl = function(pGroup)
	MultiBot.raid[pGroup] = MultiBot.newControl(pGroup, MultiBot.size)
	return MultiBot.raid[pGroup]
end

MultiBot.setButton = function(pX, pIndex, pConfig)
	MultiBot.button = MultiBot.newDouble(MultiBot, pX, MultiBot.size * pIndex, pConfig, "SHOW")
	return MultiBot.button
end

MultiBot.setItemTip = function(pParent, pTip)
	GameTooltip:SetOwner(pParent, pTip[2], pTip[3], pTip[4])
	GameTooltip:SetHyperlink(pTip[1])
	GameTooltip:Show()
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
		.addCharacter(tName, tClass, 0, i * (MultiBot.size + 2))
		.setButton(tConfig)
	end
end

MultiBot.doRaid = function()
	if(GetNumRaidMembers() > 20) then
		MultiBot.raid[5].doEnable()
	else
		MultiBot.raid[5].doDisable()
	end
	
	if(GetNumRaidMembers() > 15) then 
		MultiBot.raid[4].doEnable()
	else
		MultiBot.raid[4].doDisable()
	end
	
	if(GetNumRaidMembers() > 10) then
		MultiBot.raid[3].doEnable()
	else
		MultiBot.raid[3].doDisable()
	end
	
	if(GetNumRaidMembers() > 5) then
		MultiBot.raid[2].doEnable()
		MultiBot.raid[1].doEnable()
	else
		MultiBot.raid[2].doDisable()
		MultiBot.raid[1].doDisable()
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