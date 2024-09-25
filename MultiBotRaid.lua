MultiBot.newRaidbar = function(pIndex, pX, pY, pSize)
	local frame = CreateFrame("Frame", nil, MultiBot)
	frame.active = false
	frame.button = nil
	frame.right = nil
	frame.left = nil
	
	frame.parent = MultiBot
	frame.index = pIndex
	frame.size = pSize
	
	frame:SetPoint("BOTTOMRIGHT", pX, pY)
	frame:SetSize(pSize, pSize)
	frame:Hide()
	
	-- ADD --
	
	frame.addGroup = function(pGroup)
		if(frame.left == nil) then
			frame.left = MultiBot.newFrame(frame, 0 - frame.size - 2, 2, frame.size - 4)
			local tX = 0
			
			frame.left.addSingle(tX, 0, MultiBot.config.raid.flee).setChat("RAID:@group" .. pGroup)
			tX = tX - frame.size + 2
			
			frame.left.addDouble(tX, 0, MultiBot.config.raid.stay, "").setState(true).setChat("RAID:@group" .. pGroup)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.raid.passive, "").setState(false).setChat("RAID:@group" .. pGroup)
			tX = tX - frame.size + 2
			
			frame.left.addSingle(tX, 0, MultiBot.config.raid.attack).setChat("RAID:@group" .. pGroup)
			tX = tX - frame.size + 2
			
			frame.left.addSingle(tX, 0, MultiBot.config.raid.tanker).setChat("RAID:@group" .. pGroup)
			tX = tX - frame.size + 2
		end
		
		if(frame.right == nil) then
			frame.right = MultiBot.newFrame(frame, frame.size - 2, 2, frame.size - 4)
			local tX = 0
			
			frame.right.addSingle(tX, 0, MultiBot.config.raid.flee).setChat("RAID:@group" .. pGroup)
			tX = tX + frame.size - 2
			
			frame.right.addDouble(tX, 0, MultiBot.config.raid.stay, "").setState(true).setChat("RAID:@group" .. pGroup)
			tX = tX + frame.size - 2
			
			frame.right.addSwitch(tX, 0, MultiBot.config.raid.passive, "").setState(false).setChat("RAID:@group" .. pGroup)
			tX = tX + frame.size - 2
			
			frame.right.addSingle(tX, 0, MultiBot.config.raid.attack).setChat("RAID:@group" .. pGroup)
			tX = tX + frame.size - 2
			
			frame.right.addSingle(tX, 0, MultiBot.config.raid.tanker).setChat("RAID:@group" .. pGroup)
			tX = tX + frame.size - 2
		end
		
		frame.right:Hide()
		frame.left:Hide()
		return frame
	end
	
	-- SET --
	
	frame.setButton = function()
		frame.button = MultiBot.newDouble(frame, 0, 0, MultiBot.config.raid.start, "").setState(true)
		return frame
	end
	
	-- DO --
	
	frame.doDisable = function()
		if(frame.active == false) then return end
		local tPoint, tRelativeTo, tRelativePoint, tX, tY = MultiBot:GetPoint()
		MultiBot:SetPoint("BOTTOMRIGHT", tX, tY - (frame.size + 2))
		frame.active = false
		frame.doHide()
		frame:Hide()
	end
	
	frame.doEnable = function()
		if(frame.active == true) then return end
		local tPoint, tRelativeTo, tRelativePoint, tX, tY = MultiBot:GetPoint()
		MultiBot:SetPoint("BOTTOMRIGHT", tX, tY + (frame.size + 2))
		frame.active = true
		frame.doShow()
		frame:Show()
	end
	
	frame.doHide = function()
		frame.right:Hide()
		frame.left:Hide()
	end
	
	frame.doShow = function()
		if(GetNumRaidMembers() > (frame.index * 2 - 1) * 5) then frame.right:Show() end
		if(GetNumRaidMembers() > (frame.index * 2 - 2) * 5) then frame.left:Show() end
	end
	
	return frame.setButton()
end

print("AfterMultiBotRaid")