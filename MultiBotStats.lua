MultiBot.newStats = function(pParent, pX, pY)
	local frame = CreateFrame("Frame", nil, pParent)
	frame.state = false
	frame.stats = {}
	
	frame.parent = pParent
	frame.x = pX
	frame.y = pY
	
	frame:SetPoint("TOPRIGHT", frame.x, frame.y)
	frame:SetSize(frame.parent.size, frame.parent.size)
	frame:Hide()
	
	-- SET --
	
	frame.setStats = function()
		for i = 1, 4 do frame.stats["party" .. i] = MultiBot.newStat(frame, 0, (i - 1) * -60) end
		return frame
	end
	
	-- GET --
	
	frame.getStat = function(pName)
		local tUnit = MultiBot.toUnit(pName)
		if(tUnit == nil or frame.stats[tUnit] == nil) then return nil end
		return frame.stats[tUnit]
	end
	
	-- DO --
	
	frame.doWhisper = function(pName)
		if(pName == nil or pName == "Unknown Entity") then return false end
		SendChatMessage("stats", "WHISPER", nil, pName)
		return true
	end
	
	frame.doDisable = function()
		for key, value in pairs(frame.stats) do value:Hide() end
		MultiBot.auto.stats = false
		frame:Hide()
	end
	
	frame.doEnable = function()
		for i = 1, 4 do frame.doWhisper(UnitName("party" .. i)) end
		MultiBot.auto.stats = true
		frame:Show()
	end
	
	-- RETURN --
	
	return frame.setStats()
end

print("AfterMultiBotStats")