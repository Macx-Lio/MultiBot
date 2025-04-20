MultiBot.raidus = MultiBot.newFrame(MultiBot, -340, -126, 32, 884, 884)
MultiBot.raidus.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Raidus.blp")
MultiBot.raidus:SetMovable(true)
MultiBot.raidus:Hide()

MultiBot.raidus.addFrame("Pool", -20, 360, 28, 160, 490)
MultiBot.raidus.addFrame("Btop", -35, 822, 24, 128, 32).addTexture("Interface\\AddOns\\MultiBot\\Textures\\Raidus_Banner_Top.blp")
MultiBot.raidus.addFrame("Bbot", -35, 354, 24, 128, 32).addTexture("Interface\\AddOns\\MultiBot\\Textures\\Raidus_Banner_Bottom.blp")
MultiBot.raidus.addFrame("Group8", -185, 364, 28, 160, 240)
MultiBot.raidus.addFrame("Group7", -350, 364, 28, 160, 240)
MultiBot.raidus.addFrame("Group6", -515, 364, 28, 160, 240)
MultiBot.raidus.addFrame("Group5", -680, 364, 28, 160, 240)
MultiBot.raidus.addFrame("Group4", -185, 604, 28, 160, 240)
MultiBot.raidus.addFrame("Group3", -350, 604, 28, 160, 240)
MultiBot.raidus.addFrame("Group2", -515, 604, 28, 160, 240)
MultiBot.raidus.addFrame("Group1", -680, 604, 28, 160, 240)
MultiBot.raidus.from = 1
MultiBot.raidus.to = 11

MultiBot.raidus.movButton("Move", -780, 790, 90, MultiBot.tips.move.raidus)

MultiBot.raidus.wowButton("x", -13, 841, 16, 20, 12)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].frames["Main"].buttons["Raidus"]
	tButton.doLeft(tButton)
end

MultiBot.raidus.wowButton("Load", -762, 360, 80, 20, 12)
.doLeft = function(pButton)
	local tPool = MultiBot.raidus.frames["Pool"]
	local tLoad = MultiBot.doSplit(MultiBotSave["Raidus"], ";")
	
	for i = 1, 8, 1 do
		local tGroup = MultiBot.doSplit(tLoad[i], ",")
		
		for j = 1, 5, 1 do
			local tDrop = MultiBot.raidus.frames["Group" .. i].frames["Slot" .. j]
			local tName = tGroup[j]
			
			if(tName ~= "-") then
				for tIndex, tDrag in pairs(tPool.frames) do
					if(tDrag.name ~= nil and tDrag.name == tName) then
						local tVisible = tDrag:IsVisible()
						local tParent = tDrag.parent
						local tHeight = tDrag.height
						local tWidth = tDrag.width
						local tSlot = tDrag.slot
						local tX = tDrag.x
						local tY = tDrag.y
						
						MultiBot.raidus.doDrop(tDrag, tDrop.parent, tDrop.x, tDrop.y, tDrop.width, tDrop.height, tDrop.slot)
						if(tDrop:IsVisible()) then tDrag:Show() else tDrag:Hide() end
						
						MultiBot.raidus.doDrop(tDrop, tParent, tX, tY, tWidth, tHeight, tSlot)
						if(tVisible) then tDrop:Show() else tDrop:Hide() end
					end
				end
			end
		end
	end
end

MultiBot.raidus.wowButton("Save", -679, 360, 80, 20, 12)
.doLeft = function(pButton)
	local tSave = ""
	
	for i = 1, 8, 1 do
		local tGroup = ""
		
		for j = 1, 5, 1 do
			local tSlot = MultiBot.raidus.frames["Group" .. i].frames["Slot" .. j]
			local tName = MultiBot.IF(tSlot.name == nil, "-", tSlot.name)
			tGroup = tGroup .. MultiBot.IF(tGroup == "", "", ",")
			tGroup = tGroup .. tName
		end
		
		tSave = tSave .. MultiBot.IF(tSave == "", "", ";")
		tSave = tSave .. tGroup
	end
	
	MultiBotSave["Raidus"] = tSave
	SendChatMessage("I wrote it down.", "SAY")
end

MultiBot.raidus.wowButton("Apply", -597, 360, 80, 20, 12)

MultiBot.raidus.wowButton("<", -40, 360, 16, 20, 12)
.doLeft = function(pButton)
	for k,v in pairs(MultiBot.raidus.frames["Pool"].frames) do v:Hide() end
	
	MultiBot.raidus.from = MultiBot.raidus.from - 11
	MultiBot.raidus.to = MultiBot.raidus.to - 11
	
	if(MultiBot.raidus.to < 1) then
		MultiBot.raidus.from = MultiBot.raidus.slots - 10
		MultiBot.raidus.to = MultiBot.raidus.slots
	end
	
	for i = 1, MultiBot.raidus.slots, 1 do
		local tSlot = MultiBot.raidus.frames["Pool"].frames["Slot" .. i]
		if(i >= MultiBot.raidus.from and i <= MultiBot.raidus.to) then tSlot:Show() else tSlot:Hide() end
	end
end

MultiBot.raidus.wowButton(">", -20, 360, 16, 20, 12)
.doLeft = function(pButton)
	MultiBot.raidus.from = MultiBot.raidus.from + 11
	MultiBot.raidus.to = MultiBot.raidus.to + 11
	
	if(MultiBot.raidus.from > MultiBot.raidus.slots) then
		MultiBot.raidus.from = 1
		MultiBot.raidus.to = 11
	end
	
	for i = 1, MultiBot.raidus.slots, 1 do
		local tSlot = MultiBot.raidus.frames["Pool"].frames["Slot" .. i]
		if(i >= MultiBot.raidus.from and i <= MultiBot.raidus.to) then tSlot:Show() else tSlot:Hide() end
	end
end

MultiBot.raidus.getDrop = function()
	for i = 1, 8, 1 do
		local tGroup = MultiBot.raidus.frames["Group" .. i]
		
		if(MouseIsOver(tGroup)) then
			for j = 1, 5, 1 do
				local tSlot = tGroup.frames["Slot" .. j]
				if(MouseIsOver(tSlot)) then return tSlot end
			end
		end
	end
	
	for i = 1, MultiBot.raidus.slots, 1 do
		local tSlot = MultiBot.raidus.frames["Pool"].frames["Slot" .. i]
		if(MouseIsOver(tSlot)) then return tSlot end
	end
	
	return nil
end

MultiBot.raidus.doDrop = function(pObject, pParent, pX, pY, pWidth, pHeight, pSlot)
	pParent.frames[pSlot] = pObject
	pObject:ClearAllPoints()
	pObject:SetParent(pParent)
	pObject:SetPoint("BOTTOMRIGHT", pX, pY)
	pObject:SetSize(pWidth, pHeight)
	pObject.parent = pParent
	pObject.height = pHeight
	pObject.width = pWidth
	pObject.slot = pSlot
	pObject.x = pX
	pObject.y = pY
end

MultiBot.raidus.setRaidus = function()
	local tPool = MultiBot.raidus.frames["Pool"]
	local tSlot = 1
	local tY = 426
	
	for k,v in pairs(tPool.frames) do v:Hide() end
	
	for k,v in pairs(MultiBotGlobalSave) do
		local tDetails = MultiBot.doSplit(v, " ")
		
		local tBot = {}
		tBot.name = k
		tBot.race = tDetails[1]
		tBot.gender = tDetails[2]
		tBot.special = strupper(strsub(tDetails[3], 1, 1)) .. strsub(tDetails[3], 2)
		tBot.talents = strsub(tDetails[4], 2, strlen(tDetails[4]) - 1)
		tBot.class = MultiBot.toClass(strlower(tDetails[5]))
		tBot.level = tonumber(strsub(tDetails[6], 2))
		tBot.score = tonumber(tDetails[8])
		
		local tReward = tBot.level .. "." .. MultiBot.IF(tBot.score < 100, "0", MultiBot.IF(tBot.score < 10, "00", "")) .. tBot.score
		
		local tScale = 1.1
		if(tBot.race == "Gnome") then tScale = 1.0 end
		
		local tFrame = tPool.addFrame("Slot" .. tSlot, 0, tY, 28, 160, 36)
		tFrame.addTexture("Interface\\AddOns\\MultiBot\\Textures\\grey.blp")
		tFrame:SetResizable(false)
		tFrame:SetMovable(true)
		tFrame.class = tBot.class
		tFrame.slot = "Slot" .. tSlot
		tFrame.name = k
		
		local tButton = tFrame.addButton("Icon", -128, 3, "Interface\\AddOns\\MultiBot\\Icons\\class_" .. strlower(tFrame.class) .. ".blp", "")
		tButton:RegisterForDrag("LeftButton")
		
		tButton:SetScript("OnDragStart", function(pButton)
			pButton.parent:StartMoving()
			pButton.parent.isMoving = true
		end)
		
		tButton:SetScript("OnDragStop", function(pButton)
			pButton.parent:StopMovingOrSizing()
			pButton.parent.isMoving = false
			
			local tDrag = pButton.parent
			local tDrop = MultiBot.raidus.getDrop()
			
			if(tDrop ~= nil) then
				local tParent = tDrag.parent
				local tHeight = tDrag.height
				local tWidth = tDrag.width
				local tSlot = tDrag.slot
				local tX = tDrag.x
				local tY = tDrag.y
				
				MultiBot.raidus.doDrop(tDrag, tDrop.parent, tDrop.x, tDrop.y, tDrop.width, tDrop.height, tDrop.slot)
				MultiBot.raidus.doDrop(tDrop, tParent, tX, tY, tWidth, tHeight, tSlot)
			else
				pButton.parent:ClearAllPoints()
				pButton.parent:SetPoint(pButton.parent.align, pButton.parent.x, pButton.parent.y)
				pButton.parent:SetSize(pButton.parent.width, pButton.parent.height)
			end
		end)
		
		tButton:SetScript("OnHide", function(pButton)
			if(pButton.isMoving) then
				pButton.parent:StopMovingOrSizing()
				pButton.parent.isMoving = false
			end
		end)
		
		tFrame.addText("1", tBot.level .. " - " .. tBot.class, "BOTTOMLEFT", 36, 18, 12)
		tFrame.addText("2", tBot.score .. " - " .. tBot.special, "BOTTOMLEFT", 36, 6, 12)
		
		tButton.tip = MultiBot.newFrame(tButton, -tButton.size, 160, 28, 256, 512, "TOPRIGHT")
		tButton.tip.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Raidus_Wanted.blp")
		tButton.tip.addModel(tBot.name, 0, 64, 160, 240, tScale)
		tButton.tip.addText("1", "|cff555555- WANTED -|h", "TOP", 0, -30, 24)
		tButton.tip.addText("2", "|cff555555-DEAD OR ALIVE-|h", "TOP", 0, -55, 24)
		tButton.tip.addText("3", "|cff333333" .. tBot.name .. " - " .. tBot.gender .. " - " .. tBot.race .. "|h", "BOTTOM", 0, 220, 15)
		tButton.tip.addText("4", "|cff333333" .. tBot.class .. " - " .. tBot.talents .. " - " .. tBot.special .. "|h", "BOTTOM", 0, 200, 15)
		tButton.tip.addText("5", "|cff555555--------------------------------------------|h", "BOTTOM", 0, 188, 15)
		tButton.tip.addText("6", "|cff555555CASH - " .. tReward .. " - GOLD|h", "BOTTOM", 0, 170, 20)
		tButton.tip.addText("7", "|cff555555--------------------------------------------|h", "BOTTOM", 0, 160, 15)
		tButton.tip:Hide()
		
		if(tSlot > 11) then tFrame:Hide() else tFrame:Show() end
		tSlot = tSlot + 1
		tY = MultiBot.IF(mod(tSlot, 12) == 0, 426, tY - 40)
	end
	
	for i = mod(tSlot, 11), 11, 1 do
		local tFrame = tPool.addFrame("Slot" .. tSlot, 0, tY, 28, 160, 36)
		tFrame.addTexture("Interface\\AddOns\\MultiBot\\Textures\\grey.blp")
		tFrame.slot = "Slot" .. tSlot
		if(tSlot > 11) then tFrame:Hide() else tFrame:Show() end
		tSlot = tSlot + 1
		tY = tY - 40
	end
	
	MultiBot.raidus.slots = tSlot - 1
	
	for i = 1, 8, 1 do
		local tGroup = MultiBot.raidus.frames["Group" .. i]
		local tY = 182
		
		tGroup.addText("Title", "- Group" .. i .. " -", "BOTTOM", 0, 223, 12)
		tGroup.group = "Group" .. i
		
		for j = 1, 5, 1 do
			local tFrame = tGroup.addFrame("Slot" .. j, 0, tY, 28, 160, 36)
			tFrame.addTexture("Interface\\AddOns\\MultiBot\\Textures\\grey.blp")
			tFrame.slot = "Slot" .. j
			tY = tY - 40
		end
	end
end