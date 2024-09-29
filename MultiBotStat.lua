MultiBot.newStat = function(pParent, pX, pY)
	local frame = CreateFrame("Frame", nil, pParent)
	frame.progress = {}
	frame.config = { 99, 90, 81, 72, 63, 54, 45, 36, 27, 18, 9 }
	
	frame.parent = pParent
	frame.x = pX
	frame.y = pY
	
	frame:SetPoint("TOPRIGHT", frame.x, frame.y)
	frame:SetSize(192, 96)
	frame:Hide()
	
	frame.texture = frame:CreateTexture(nil, "BACKGROUND")
	frame.texture:SetTexture("Interface\\AddOns\\MultiBot\\Textures\\Stats.blp")
	frame.texture:SetAllPoints(frame)
	frame.texture:Show()
	
	for key, value in pairs(frame.config) do
		frame.progress[value] = CreateFrame("Frame", nil, frame)
		frame.progress[value].value = value
		frame.progress[value]:SetPoint("TOPRIGHT", -2, -2)
		frame.progress[value]:SetSize(48, 48)
		frame.progress[value]:Hide()
		
		frame.progress[value].texture = frame.progress[value]:CreateTexture(nil, "BACKGROUND")
		frame.progress[value].texture:SetTexture("Interface\\AddOns\\MultiBot\\Icons\\xp_progress_" .. value .. "_percent.blp")
		frame.progress[value].texture:SetAllPoints(frame.progress[value])
		frame.progress[value].texture:Show()
	end
	
	frame.data = CreateFrame("Frame", nil, frame)
	frame.data:SetPoint("TOPRIGHT", 0, 0)
	frame.data:SetSize(192, 96)
	frame.data:Show()
	
	frame.name = frame.data:CreateFontString(nil, "ARTWORK")
	frame.name:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
	frame.name:SetPoint("TOPLEFT", 54, -10)
	
	frame.level = frame.data:CreateFontString(nil, "ARTWORK")
	frame.level:SetFont("Fonts\\ARIALN.ttf", 11, "OUTLINE")
	frame.level:SetPoint("TOPLEFT", 174.6, -37)
	
	frame.additional = frame.data:CreateFontString(nil, "ARTWORK")
	frame.additional:SetFont("Fonts\\ARIALN.ttf", 11, "OUTLINE")
	frame.additional:SetPoint("TOPLEFT", 54, -27.5)
	
	frame.percent = frame.data:CreateFontString(nil, "ARTWORK")
	frame.percent:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
	frame.percent:SetPoint("TOPLEFT", 153, -14)
	
	-- SET --
	
	frame.setStat = function(pName, pLevel, pStats)
		local tStats = MultiBot.doSplit(pStats, ", ")
		local tMoney = "|cffffdd55" .. tStats[1] .. "|r, "
		local tBag = tStats[2]
		
		frame.name:SetText(pName)
		frame.level:SetText(pLevel)
		frame.additional:SetText(tMoney .. tBag)
		
		if(pLevel == 80) then
			local tDur = MultiBot.doSplit(string.sub(MultiBot.doSplit(tStats[3], "|")[2], 10), " ")
			local tQuality = tonumber(string.sub(tDur[1], 1, string.len(tDur[1]) - 1))
			local tRepair = tonumber(string.sub(tDur[2], 2, string.len(tDur[2]) - 1))
			if(tQuality == 0 and tRepair == 0) then tQuality = 100 end
			frame.percent:SetText(frame.setProgress(tQuality) .. "%\nDur")
		else
			local tXP = tonumber(string.sub(MultiBot.doSplit(tStats[4], "|")[2], 10))
			frame.percent:SetText(frame.setProgress(tXP) .. "%\nXP")
		end
		
		frame:Show()
	end
	
	frame.setStatOfPlayer = function(pName, pLevel, pStats)
		local tStats = MultiBot.doSplit(pStats, " ")
		local tMana = tonumber(tStats[5])
		local tXP = tonumber(tStats[4])
		
		frame.name:SetText(pName)
		frame.level:SetText(pLevel)
		frame.additional:SetText("Player")
		
		if(pLevel == 80) then
			frame.percent:SetText(frame.setProgress(tMana) .. "%\nMP")
		else
			frame.percent:SetText(frame.setProgress(tXP) .. "%\nXP")
		end
		
		frame:Show()
	end
	
	frame.setProgress = function(pProgress)
		for key, value in pairs(frame.progress) do value:Hide() end
		
		if(pProgress >= 99) then frame.progress[99]:Show()
		elseif(pProgress >= 90) then frame.progress[90]:Show()
		elseif(pProgress >= 81) then frame.progress[81]:Show()
		elseif(pProgress >= 72) then frame.progress[72]:Show()
		elseif(pProgress >= 63) then frame.progress[63]:Show()
		elseif(pProgress >= 54) then frame.progress[54]:Show()
		elseif(pProgress >= 45) then frame.progress[45]:Show()
		elseif(pProgress >= 36) then frame.progress[36]:Show()
		elseif(pProgress >= 27) then frame.progress[27]:Show()
		elseif(pProgress >= 18) then frame.progress[18]:Show()
		elseif(pProgress >= 9) then frame.progress[9]:Show()
		end
		
		return pProgress
	end
	
	-- RETURN --
	
	return frame
end

print("AfterMultiBotStat")