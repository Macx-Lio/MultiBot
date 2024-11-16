MultiBot.setRewards = function()
	if(MultiBot.reward.state == false) then return end
	local tChoices = MultiBot.IF(GetNumQuestChoices() > 6, 6, GetNumQuestChoices())
	table.wipe(MultiBot.reward.rewards)
	table.wipe(MultiBot.reward.units)
	MultiBot.reward.rewards = {}
	MultiBot.reward.units = {}
	
	for i = 1, tChoices do
		local tLink = GetQuestItemLink("CHOICE", i)
		local tName, tIcon = GetQuestItemInfo("CHOICE", i)
		MultiBot.reward.rewards[i] = { tLink, tName, tIcon }
	end
	
	for i = 1, 12 do
		local tID = "U" .. MultiBot.IF(i < 10, "0", "") .. i
		local tUnit = MultiBot.reward.frames["Overlay"].frames[tID]
		for j = 1, 6 do tUnit.buttons["R" .. j]:Hide() end
		tUnit:Hide()
	end
	
	if(GetNumRaidMembers() > 0) then
		for i = 1, 40 do
			local tUnit = UnitName("raid" .. i)
			if(tUnit ~= nil) then
				local tBot = MultiBot.getBot(tUnit)
				if(tBot ~= nil and tBot.name ~= UnitName("player")) then table.insert(MultiBot.reward.units, tBot) end
			end
		end
	elseif(GetNumPartyMembers() > 0) then
		for i = 1, 5 do
			local tUnit = UnitName("party" .. i)
			if(tUnit ~= nil) then
				local tBot = MultiBot.getBot(tUnit)
				if(tBot ~= nil and tBot.name ~= UnitName("player")) then table.insert(MultiBot.reward.units, tBot) end
			end
		end
	end
	
	if(table.getn(MultiBot.reward.units) > 0 and tChoices > 0) then
		local tOverlay = MultiBot.reward.frames["Overlay"]
		local tUnits = table.getn(MultiBot.reward.units)
		
		MultiBot.reward.max = math.ceil(tUnits / MultiBot.reward.to)
		tOverlay.setText("Pages", MultiBot.reward.now .. "/" .. MultiBot.reward.max)
		tOverlay.buttons["<"]:Show()
		tOverlay.buttons[">"]:Show()
		
		if(MultiBot.reward.now == 1) then tOverlay.buttons["<"]:Hide() end
		if(MultiBot.reward.now == MultiBot.reward.max) then tOverlay.buttons[">"]:Hide() end
		
		if(tUnits > MultiBot.reward.to) then tUnits = MultiBot.reward.to end
		
		for i = 1, tUnits do
			local tBot = MultiBot.reward.units[i]
			local tUnit = MultiBot.setReward(i, tBot, false)
			
			for j = 1, tChoices do
				local tReward = tUnit.buttons["R" .. j]
				tReward:Show()
				tReward.link = MultiBot.reward.rewards[j][1]
				tReward.setButton(MultiBot.reward.rewards[j][3], MultiBot.reward.rewards[j][1])
				tReward.doLeft = function(pButton)
					pButton.parent:Hide()
					SendChatMessage("r " .. pButton.link, "WHISPER", nil, pButton.getName())
					MultiBot.getBot(pButton.getName()).rewarded = true
					MultiBot.reward.doClose()
				end
			end
		end
		
		MultiBot.reward:Show()
	end
end

MultiBot.setReward = function(pIndex, pBot, oRewarded)
	local tID = "U" .. MultiBot.IF(pIndex < 10, "0", "") .. pIndex
	local tUnit = MultiBot.reward.frames["Overlay"].frames[tID]
	if(oRewarded ~= nil) then pBot.rewarded = oRewarded end
	if(pBot.rewarded) then tUnit:Hide() else tUnit:Show() end
	tUnit.setText(tID, "|cffffcc00" .. pBot.name .. " - " .. pBot.class .. "|r")
	tUnit.class = pBot.class
	tUnit.name = pBot.name
	return tUnit
end