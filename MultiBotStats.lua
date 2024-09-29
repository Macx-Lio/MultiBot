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
	
	-- ADD --
	
	frame.addStat = function(pName, pX, pY)
		if(pName == nil or pName == "Unknown Entity") then return false end
		frame.stats[pName] = MultiBot.newStat(frame, pX, pY)
		SendChatMessage("stats", "WHISPER", nil, pName)
		return true
	end
	
	-- HAS --
	
	frame.hasStat = function(pName)
		if(frame.stats[pName] == nil) then return false end
		return true
	end
	
	-- DO --
	
	frame.doDisable = function()
		for key, value in pairs(frame.stats) do value:Hide() end
		MultiBot.auto.stats = false
		frame:Hide()
	end
	
	frame.doEnable = function()
		MultiBot.auto.stats = true
		
		for i = 1, 4 do
			if(UnitIsConnected("party" .. i))
			then if(frame.addStat(UnitName("party" .. i), 0, (i - 1) * -60) == false) then break end
			else break
			end
		end
		
		frame:Show()
	end
	
	-- RETURN --
	
	return frame
end

print("AfterMultiBotStats")