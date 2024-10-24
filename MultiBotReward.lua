MultiBot.setReward = function()
	if(MultiBot.reward.state == false) then return end
	local tPrefix = MultiBot.IF(GetNumRaidMembers() > 0, "raid", MultiBot.IF(GetNumPartyMembers() > 0, "party", nil))
	local tChoices = MultiBot.IF(GetNumQuestChoices() > 6, 6, GetNumQuestChoices())
	local tRewards = {}
	local tPrefix = nil
	local tUnits = 0
	
	for i = 1, tChoices do
		local tLink = GetQuestItemLink("CHOICE", i)
		local tName, tIcon = GetQuestItemInfo("CHOICE", i)
		tRewards[i] = { tLink, tName, tIcon }
	end
	
	for i = 1, 12 do
		local tID = "U" .. MultiBot.IF(i < 10, "0", "") .. i
		local tUnit = MultiBot.reward.frames["Group"].frames[tID]
		for j = 1, 6 do tUnit.buttons["R" .. j]:Hide() end
		tUnit:Hide()
	end
	
	if(GetNumRaidMembers() > 0) then
		tUnits = MultiBot.IF(GetNumRaidMembers() > 12, 12, GetNumRaidMembers())
		tPrefix = "raid"
	elseif(GetNumPartyMembers() > 0) then
		tUnits = GetNumPartyMembers()
		tPrefix = "party"
	end
	
	if(tChoices > 0 and tPrefix ~= nil) then	
		local tGroup = MultiBot.reward.frames["Group"]
		local tIndex = 1
		
		for i = 1, tUnits do
			local tBot = MultiBot.getBot(UnitName(tPrefix .. i))
			
			if(tBot ~= nil and tBot.name ~= UnitName("player")) then
				local tID = "U" .. MultiBot.IF(i < 10, "0", "") .. tIndex
				local tUnit = tGroup.frames[tID]
				tUnit.setText(tID, tBot.name .. " - " .. tBot.class)
				tUnit.class = tBot.class
				tUnit.name = tBot.name
				tUnit:Show()
				
				for j = 1, tChoices do
					local tReward = tUnit.buttons["R" .. j]
					tReward:Show()
					tReward.name = tBot.name
					tReward.link = tRewards[j][1]
					tReward.setButton(tRewards[j][3], tRewards[j][1])
					tReward.doLeft = function(pButton)
						pButton.parent:Hide()
						SendChatMessage("r " .. pButton.link, "WHISPER", nil, pButton.name)
						MultiBot.reward.doClose()
					end
				end
				
				tIndex = tIndex + 1
			end
		end
		
		tGroup:Show()
		MultiBot.reward:Show()
	end
end