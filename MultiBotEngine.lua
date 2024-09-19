MultiBot = CreateFrame("Frame", nil, UIParent)
MultiBot.inventory = nil
MultiBot.player = nil
MultiBot.right = nil
MultiBot.left = nil

MultiBot.friends = {}
MultiBot.players = {}
MultiBot.index = {}
MultiBot.raid = {}

MultiBot.size = 36

MultiBot:SetPoint("BOTTOMRIGHT", -304, 104)
MultiBot:SetSize(MultiBot.size, MultiBot.size)
MultiBot:Hide()

MultiBot.addControl = function(pGroup)
	MultiBot.raid[pGroup] = MultiBot.newControl(pGroup, MultiBot.size)
	return MultiBot.raid[pGroup]
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

MultiBot.newTip = function(pParent, pTip)
	return { pTip, "ANCHOR_TOPRIGHT", -(pParent.size + 2), 2 }
end

MultiBot.getBot = function(pName)
	local tBot = nil
	if(MultiBot.players ~= nil and tBot == nil) then tBot = MultiBot.players.getBotByName(pName) end
	if(MultiBot.friends ~= nil and tBot == nil) then tBot = MultiBot.friends.getBotByName(pName) end
	if(tBot == nil) then SendChatMessage("Could not find " .. pName, "SAY") end
	return tBot
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

MultiBot.doHide = function(pType)
	if(pType == "PLAYERS") then
		MultiBot.players.doHide()
	end
	
	if(pType == "FRIENDS") then
		MultiBot.friends.doHide()
	end
end

MultiBot.doShow = function(pType)
	if(pType == "PLAYERS") then
		MultiBot.doHide("FRIENDS")
		MultiBot.friends.setState(false)
		MultiBot.players.doShow()
	end
	
	if(pType == "FRIENDS") then
		MultiBot.doHide("PLAYERS")
		MultiBot.players.setState(false)
		MultiBot.friends.doShow()
	end
end

print("AfterMultiBotEngine")