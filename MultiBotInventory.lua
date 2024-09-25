MultiBot.newInventory = function(pParent, pName)
	local frame = CreateFrame("Frame", nil, pParent)
	frame.name = pName;
	frame.buttons = {}
	frame.items = {}
	frame.radio = {}
	frame.link = {}
	frame.size = 32
	frame.ox = 11
	frame.oy = 44
	
	frame:SetPoint("TOPLEFT", -820, 560)
	frame:SetSize(442, 884)
	frame:Hide()
	
	frame.texture = frame:CreateTexture(nil, "BACKGROUND")
	frame.texture:SetTexture("Interface\\AddOns\\MultiBot\\Textures\\Inventory.blp")
	frame.texture:SetAllPoints(frame)
	frame.texture:Show()
	
	frame.title = frame:CreateFontString(nil, "ARTWORK")
	frame.title:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
	frame.title:SetPoint("CENTER", -56, 429)
	frame.title:SetText("Inventory of " .. frame.name)
	
	-- ADD
	
	frame.addRadio = function(pButton, pIndex)
		if(frame.radio[pIndex] == nil) then frame.radio[pIndex] = {} end
		frame.radio[pIndex][pButton.config[2]] = pButton
		return frame
	end
	
	frame.addLink = function(pButton, pIndex)
		if(frame.link[pIndex] == nil) then frame.link[pIndex] = {} end
		frame.link[pIndex][pButton.config[2]] = pButton
		return frame
	end
	
	frame.addButton = function(pX, pY, pConfig, pStrate)
		if(frame.buttons[pConfig[2]] == nil) then frame.buttons[pConfig[2]] = MultiBot.newSwitch(frame, pX, pY, pConfig, pStrate) end
		return frame.buttons[pConfig[2]]
	end
	
	frame.addItem = function(pInfo)
		local tIndex = table.getn(frame.items)
		local tItem = MultiBot.newItem(frame, tIndex, pInfo)
		table.insert(frame.items, tItem)
		return tItem
	end
	
	-- SET
	
	frame.setRadio = function(pButton)
		if(pButton.radio == nil) then return end
		
		for key, value in pairs(frame.radio[pButton.radio]) do
			if(key ~= pButton.config[2]) then value.setState(false) end
		end
		
		return frame
	end
	
	frame.setLink = function(pButton)
		if(pButton.link == nil) then return end
		
		for key, value in pairs(frame.link[pButton.link]) do
			if(key ~= pButton.config[2]) then value.setState(pButton.state) end
		end
		
		return frame
	end
	
	frame.setInventory = function()
		local tStrate = "SELL"
		local tX = -94
		local tY = 806
		
		frame.addButton(tX, tY, MultiBot.config.sell, tStrate)
		tY = tY - frame.size - 5
		
		frame.addButton(tX, tY, MultiBot.config.equip, tStrate)
		tY = tY - frame.size - 5
		
		frame.addButton(tX, tY, MultiBot.config.use, tStrate)
		tY = tY - frame.size - 5
		
		frame.addButton(tX, tY, MultiBot.config.drop, tStrate)
		tY = tY - frame.size - 5
		
		return frame
	end
	
	-- GET
	
	frame.getAction = function()
		for key, value in pairs(frame.buttons) do
			if(value.state) then return value.config[8] end
		end
		
		return "NONE"
	end
	
	frame.getName = function()
		return frame.name
	end
	
	-- DO
	
	frame.doRefresh = function()
		for key, value in pairs(frame.items) do value:Hide() end
		table.wipe(frame.items)
		MultiBot.getBot(frame.name).waitFor = "=== Inventory ==="
		SendChatMessage("items", "WHISPER", nil, frame.name)
	end
	
	frame.doClose = function()
		for key, value in pairs(frame.items) do value:Hide() end
		table.wipe(frame.items)
		frame:Hide()
	end
	
	frame.doOpen = function()
		frame.setInventory()
		MultiBot.getBot(frame.name).waitFor = "=== Inventory ==="
		frame:Show()
	end
	
	return frame
end

print("AfterMultiBotInventory")