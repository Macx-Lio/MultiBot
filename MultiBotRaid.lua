MultiBot.newControl = function(pGroup, pSize)
	local frame = CreateFrame("Frame", nil, MultiBot)
	frame.active = false
	frame.button = nil
	frame.right = nil
	frame.left = nil
	
	frame.parent = MultiBot
	frame.size = pSize
	
	frame:SetPoint("BOTTOMRIGHT", 0, pGroup * -(pSize + 2))
	frame:SetSize(pSize, pSize)
	frame:Hide()
	
	-- SET
	
	frame.setFrame = function(pGroup)
		frame.button = MultiBot.newDouble(frame, 0, 0, MultiBot.config.raid[pGroup].start, "SHOW")
		
		-- LEFT --
		
		frame.left = MultiBot.newFrame(frame, 0 - frame.size - 2, 2, frame.size - 4)
		local tX = 0
		
		frame.left.addSingle(tX, 0, MultiBot.config.raid[pGroup].flee).setChat("PARTY")
		tX = tX - frame.size + 2
		
		frame.left.addDouble(tX, 0, MultiBot.config.raid[pGroup].stay, "@group" .. pGroup .. " follow").setChat("PARTY")
		tX = tX - frame.size + 2
		
		frame.left.addDouble(tX, 0, MultiBot.config.raid[pGroup].passive, "").setState(true).setChat("PARTY")
		tX = tX - frame.size + 2
		
		frame.left.addSingle(tX, 0, MultiBot.config.raid[pGroup].attack).setChat("PARTY")
		tX = tX - frame.size + 2
		
		frame.left.addSingle(tX, 0, MultiBot.config.raid[pGroup].tanker).setChat("PARTY")
		tX = tX - frame.size + 2
		
		-- RIGHT --
		
		frame.right = MultiBot.newFrame(frame, frame.size - 2, 2, frame.size - 4)
		local tX = 0
		
		frame.right.addSingle(tX, 0, MultiBot.config.raid[pGroup].release).setChat("PARTY")
		tX = tX + frame.size - 2
		
		frame.right.addSingle(tX, 0, MultiBot.config.raid[pGroup].revive).setChat("PARTY")
		tX = tX + frame.size - 2
		
		return frame
	end
	
	-- DO
	
	frame.doDisable = function()
		if(frame.active == false) then return end
		local tPoint, tRelativeTo, tRelativePoint, tX, tY = MultiBot:GetPoint()
		MultiBot:SetPoint("BOTTOMRIGHT", tX, tY - (frame.size + 2))
		frame.active = false
		frame:Hide()
	end
	
	frame.doEnable = function()
		if(frame.active == true) then return end
		local tPoint, tRelativeTo, tRelativePoint, tX, tY = MultiBot:GetPoint()
		MultiBot:SetPoint("BOTTOMRIGHT", tX, tY + (frame.size + 2))
		frame.active = true
		frame:Show()
	end
	
	frame.doHide = function()
		frame.right:Hide()
		frame.left:Hide()
	end
	
	frame.doShow = function()
		frame.right:Show()
		frame.left:Show()
	end
	
	return frame.setFrame(pGroup)
end

print("AfterMultiBotRaid")