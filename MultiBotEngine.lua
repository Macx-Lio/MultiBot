MultiBot = CreateFrame("Frame", nil, UIParent)
MultiBot.inventory = nil
MultiBot.control = nil
MultiBot.units = nil
MultiBot.right = nil
MultiBot.left = nil
MultiBot.raid = {}
MultiBot.auto = {}

MultiBot.auto.release = false
MultiBot.size = 36

MultiBot:SetPoint("BOTTOMRIGHT", -262, 144)
MultiBot:SetSize(MultiBot.size, MultiBot.size)
MultiBot:Hide()

MultiBot.addRaidbar = function(pIndex, pX, pY, pSize)
	MultiBot.raid[pIndex] = MultiBot.newRaidbar(pIndex, pX, pY, pSize)
	return MultiBot.raid[pIndex]
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
	return MultiBot.units.getBot(pName)
end

MultiBot.getChat = function()
	if(GetNumRaidMembers() > 5) then return "RAID" end
	return "PARTY"
end

MultiBot.doAutoRelease = function(pPrefix, pAmount)
	for i = 1, pAmount do
		local tName = UnitName(pPrefix .. i)
		
		if(tName ~= nil and UnitIsDead(tName) ~= nil) then
			SendChatMessage("release", "WHISPER", nil, tName)
		end
	end
end

MultiBot.doRaid = function()
	if(GetNumRaidMembers() > 30)
	then MultiBot.raid[2].doEnable()
	else MultiBot.raid[2].doDisable()
	end
	
	if(GetNumRaidMembers() > 20)
	then MultiBot.raid[3].doEnable()
	else MultiBot.raid[3].doDisable()
	end
	
	if(GetNumRaidMembers() > 10)
	then MultiBot.raid[2].doEnable()
	else MultiBot.raid[2].doDisable()
	end
	
	if(GetNumRaidMembers() > 5)
	then MultiBot.raid[1].doEnable()
	else MultiBot.raid[1].doDisable()
	end
end

MultiBot.doHide = function(pType)
	if(pType == "PLAYERS") then
		MultiBot.players.doHide()
	end
	
	if(pType == "MEMBERS") then
		MultiBot.members.doHide()
	end
	
	if(pType == "FRIENDS") then
		MultiBot.friends.doHide()
	end
end

MultiBot.doShow = function(pType)
	if(pType == "PLAYERS") then
		MultiBot.doHide("MEMBERS")
		MultiBot.doHide("FRIENDS")
		MultiBot.members.setState(false)
		MultiBot.friends.setState(false)
		MultiBot.players.setState(true)
		MultiBot.players.doShow()
	end
	
	if(pType == "MEMBERS") then
		MultiBot.doHide("PLAYERS")
		MultiBot.doHide("FRIENDS")
		MultiBot.players.setState(false)
		MultiBot.friends.setState(false)
		MultiBot.members.setState(true)
		MultiBot.members.doShow()
	end
	
	if(pType == "FRIENDS") then
		MultiBot.doHide("PLAYERS")
		MultiBot.doHide("MEMBERS")
		MultiBot.players.setState(false)
		MultiBot.members.setState(false)
		MultiBot.friends.setState(true)
		MultiBot.friends.doShow()
	end
end

print("AfterMultiBotEngine")