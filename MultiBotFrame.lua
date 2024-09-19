MultiBot.newFrame = function(pParent, pX, pY, pSize)
	local frame = CreateFrame("Frame", nil, pParent)
	frame.buttons = {}
	frame.frames = {}
	
	frame.parent = pParent
	frame.size = pSize
	
	frame:SetPoint("BOTTOMRIGHT", pX, pY)
	frame:SetSize(pSize, pSize)
	frame:Show()
	
	-- ADD --
	
	frame.addFrame = function(pName, pX, pY, pSize)
		frame.frames[pName] = MultiBot.newFrame(frame, pX, pY, pSize)
		return frame.frames[pName]
	end
	
	frame.addSingle = function(pX, pIndex, pConfig)
		frame.buttons[pConfig[2]] = MultiBot.newSingle(frame, pX, (frame.size + 2) * pIndex, pConfig)
		return frame.buttons[pConfig[2]]
	end
	
	frame.addDouble = function(pX, pIndex, pConfig, pStrate)
		frame.buttons[pConfig[2]] = MultiBot.newDouble(frame, pX, (frame.size + 2) * pIndex, pConfig, pStrate)
		return frame.buttons[pConfig[2]]
	end
	
	frame.addSwitch = function(pX, pIndex, pConfig, pStrate)
		frame.buttons[pConfig[2]] = MultiBot.newSwitch(frame, pX, (frame.size + 2) * pIndex, pConfig, pStrate)
		return frame.buttons[pConfig[2]]
	end
	
	frame.addSelect = function(pX, pIndex, pConfig, pStrate)
		frame.buttons[pConfig[2]] = MultiBot.newSelect(frame, pX, (frame.size + 2) * pIndex, pConfig)
		return frame.buttons[pConfig[2]].addOptions(pStrate)
	end
	
	frame.addOption = function(pX, pIndex, pSelect, pConfig)
		if(pSelect.horizontal == false) then frame.buttons[pConfig[2]] = MultiBot.newOption(frame, pX, (frame.size + 2) * pIndex, pSelect, pConfig) end
		if(pSelect.horizontal == true) then frame.buttons[pConfig[2]] = MultiBot.newOption(frame, -(frame.size + 2) * pIndex, pX, pSelect, pConfig) end
		return frame.buttons[pConfig[2]]
	end
	
	frame.addSwitchbar = function(pX, pIndex, pConfig, pStrate)
		frame.buttons[pConfig[2]] = MultiBot.newSwitchbar(frame,  pX, (frame.size + 2) * pIndex, pConfig, pStrate)
		return frame.buttons[pConfig[2]].addSwitches(pStrate)
	end
	
	frame.addRadio = function(pButton, pIndex)
		frame.parent.addRadio(pButton, pIndex)
	end
	
	frame.addLink = function(pButton, pIndex)
		frame.parent.addLink(pButton, pIndex)
	end
	
	-- SET --
	
	frame.setPoint = function(pX, pY)
		frame:SetPoint("BOTTOMRIGHT", pX, pY)
	end
	
	frame.setRadio = function(pButton)
		frame.parent.setRadio(pButton)
	end
	
	frame.setLink = function(pButton)
		frame.parent.setLink(pButton)
	end
	
	-- GET --
	
	frame.getClass = function()
		return frame.parent.getClass()
	end
	
	frame.getName = function()
		return frame.parent.getName()
	end
	
	return frame
end

print("AfterMultiBotFrame")