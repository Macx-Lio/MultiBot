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
MultiBot.raidus.save = "1" -- Prevent to save in a empty slot
MultiBot.raidus.from = 1
MultiBot.raidus.to = 11

MultiBot.raidus.movButton("Move", -780, 790, 90, MultiBot.tips.move.raidus)

MultiBot.raidus.wowButton("x", -13, 841, 16, 20, 12)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].frames["Main"].buttons["Raidus"]
	tButton.doLeft(tButton)
end

-- Avoid Lua erreor if player choose a empty slot and click Load
MultiBot.raidus.wowButton("Load", -762, 360, 80, 20, 12)
.doLeft = function(pButton)
	local tPool = MultiBot.raidus.frames["Pool"]
	local tData = MultiBotSave["Raidus" .. MultiBot.raidus.save]
	if not tData or tData == "" then                       -- nothin registered
		SendChatMessage("Nothing saved in this slot.", "SAY")
		return                                             -- leave handler
	end

	local tLoad = MultiBot.doSplit(tData, ";")             -- make the call

	
	for i = 1, 8, 1 do
		local tGroup = MultiBot.doSplit(tLoad[i], ",")
		for j = 1, 5, 1 do
			local tDrop = MultiBot.raidus.frames["Group" .. i].frames["Slot" .. j]
			local tName = tGroup[j]
			if tName and tName ~= "-" then
				for _, tDrag in pairs(tPool.frames) do
					if tDrag.name == tName then
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
-- end
	
MultiBot.raidus.wowButton("1", -734, 360, 22, 20, 12).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		pButton.parent.save = ""
		pButton.setDisable()
		MultiBot.raidus.setRaidus()
	else
		pButton.parent.save = "1"
		pButton.parent.buttons["2"].setDisable()
		pButton.parent.buttons["3"].setDisable()
		pButton.setEnable()
		MultiBot.raidus.setRaidus()
	end
end

MultiBot.raidus.wowButton("2", -707, 360, 22, 20, 12).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		pButton.parent.save = ""
		pButton.setDisable()
		MultiBot.raidus.setRaidus()
	else
		pButton.parent.save = "2"
		pButton.parent.buttons["1"].setDisable()
		pButton.parent.buttons["3"].setDisable()
		pButton.setEnable()
		MultiBot.raidus.setRaidus()
	end
end

MultiBot.raidus.wowButton("3", -680, 360, 22, 20, 12).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		pButton.parent.save = ""
		pButton.setDisable()
		MultiBot.raidus.setRaidus()
	else
		pButton.parent.save = "3"
		pButton.parent.buttons["1"].setDisable()
		pButton.parent.buttons["2"].setDisable()
		pButton.setEnable()
		MultiBot.raidus.setRaidus()
	end
end

-- Set button 1 to first button
MultiBot.raidus.buttons["1"].setEnable()

MultiBot.raidus.wowButton("Save", -597, 360, 80, 20, 12)
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
	
	MultiBotSave["Raidus" .. MultiBot.raidus.save] = tSave
	SendChatMessage("I wrote it down.", "SAY")
end



MultiBot.raidus.wowButton("Apply", -514, 360, 80, 20, 12)
.doLeft = function(pButton)
	local tRaidByIndex, tRaidByName = MultiBot.raidus.getRaidTarget()
	if(tRaidByIndex == nil or tRaidByName == nil) then return end
	
	local tSelf = UnitName("player")
	MultiBot.index.raidus = {}
	
	for tName, tValue in pairs(MultiBot.frames["MultiBar"].frames["Units"].buttons) do
		if(tValue.state) then
			if(tName ~= tSelf and tRaidByName[tName] == nil) then
				if(UnitInGroup(tName) or UnitInRaid(tName)) then UninviteUnit(tName) end
				SendChatMessage(".playerbot bot remove " .. tName, "SAY")
			end
		else
			if(tName ~= tSelf and tRaidByName[tName] ~= nil) then
				table.insert(MultiBot.index.raidus, tName)
			end
		end
	end
	
	local tNeeds = table.getn(MultiBot.index.raidus)
	
	if(tNeeds > 0) then
		SendChatMessage(MultiBot.info.starting, "SAY")
		MultiBot.timer.invite.roster = "raidus"
		MultiBot.timer.invite.needs = tNeeds
		MultiBot.timer.invite.index = 1
		MultiBot.auto.invite = true
	else
		MultiBot.timer.sort.elapsed = 0
		MultiBot.timer.sort.index = 1
		MultiBot.timer.sort.needs = 0
		MultiBot.auto.sort = true
	end
end

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

-- SETTTER --

MultiBot.raidus.setRaidus = function()
	local tPool = MultiBot.raidus.frames["Pool"]
	local tSlot = 1
	local tY = 426
	
	for k,v in pairs(tPool.frames) do v:Hide() end
	
	local tBots = {}
	local tIndex = 1
	
	for tName, tValue in pairs(MultiBotGlobalSave) do
		local tDetails = MultiBot.doSplit(tValue, ",")
		local tBot = {}
		
		tBot.name = tName
		tBot.race = tDetails[1]
		tBot.gender = tDetails[2]
		tBot.special = tDetails[3]
		tBot.talents = tDetails[4]
		tBot.class = tDetails[5]
		tBot.level = tonumber(tDetails[6])
		tBot.score = tonumber(tDetails[7])
		
		-- Correcte LUA error MultiBotRaidus.lua:262: attempt to perform arithmetic on a nil value when clixk in Raidus-Switch button
		local tLevel = tonumber(tDetails[6]) or 0
		local tScore = tonumber(tDetails[7]) or 0
		
		tBot.level = tLevel
		tBot.score = tScore
		
		local tClass = MultiBot.toClass(tBot.class)
		
		-- Correcte LUA error MultiBotRaidus.lua:262: attempt to perform arithmetic on a nil value when clixk in Raidus-Switch button
		tBot.sort = tLevel * 1000
		+ MultiBot.IF(tClass == "DeathKnight", 1100000
		, MultiBot.IF(tClass == "Druid", 1200000
		, MultiBot.IF(tClass == "Hunter", 1300000
		, MultiBot.IF(tClass == "Mage", 1400000
		, MultiBot.IF(tClass == "Paladin", 1500000
		, MultiBot.IF(tClass == "Priest", 1600000
		, MultiBot.IF(tClass == "Rogue", 1700000
		, MultiBot.IF(tClass == "Shaman", 1800000
		, MultiBot.IF(tClass == "Warlock", 1900000
		, MultiBot.IF(tClass == "Warrior", 2000000
		, 1000000)))))))))) + tScore; -- Correcte LUA error MultiBotRaidus.lua:262: attempt to perform arithmetic on a nil value when clixk in Raidus-Switch button
		
		tBots[tIndex] = tBot
		tIndex = tIndex + 1
	end
	
	for tIndex = 1, table.getn(tBots) do
		local tMax = tIndex
		
		for tSearch = tIndex + 1, table.getn(tBots) do
			if(tBots[tMax].sort < tBots[tSearch].sort) then
				tMax = tSearch
			end
		end
		
		tBots[tIndex], tBots[tMax] = tBots[tMax], tBots[tIndex]
	end
	
	for tIndex = 1, table.getn(tBots) do
		local tBot = tBots[tIndex]
		
		local tFrame = tPool.addFrame("Slot" .. tSlot, 0, tY, 28, 160, 36)
		tFrame.addTexture("Interface\\AddOns\\MultiBot\\Textures\\grey.blp")
		tFrame:SetResizable(false)
		tFrame:SetMovable(true)
		tFrame.class = MultiBot.toClass(tBot.class)
		tFrame.slot = "Slot" .. tSlot
		tFrame.name = tBot.name
		tFrame.bot = tBot
		
		local tButton = tFrame.addButton("Icon", -128, 3, "Interface\\AddOns\\MultiBot\\Icons\\class_" .. strlower(tFrame.class) .. ".blp", "")
		tButton.doRight = function(pButton)
			SendChatMessage(".playerbot bot add " .. pButton.parent.name, "SAY")
		end
		
		tButton:SetScript("OnEnter", function(pButton)
			local tBot = pButton.parent.bot
			local tReward = tBot.level .. "." .. MultiBot.IF(tBot.score < 100, "0", MultiBot.IF(tBot.score < 10, "00", "")) .. tBot.score
			pButton.tip = MultiBot.newFrame(pButton, -pButton.size, 160, 28, 256, 512, "TOPRIGHT")
			pButton.tip.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Raidus_Wanted.blp")
			pButton.tip.addModel(tBot.name, 0, 64, 160, 240, 1.0)
			pButton.tip.addText("1", "|cff555555- WANTED -|h", "TOP", 0, -30, 24)
			pButton.tip.addText("2", "|cff555555-DEAD OR ALIVE-|h", "TOP", 0, -55, 24)
			pButton.tip.addText("3", "|cff333333" .. tBot.name .. " - " .. tBot.gender .. " - " .. tBot.race .. "|h", "BOTTOM", 0, 220, 15)
			pButton.tip.addText("4", "|cff333333" .. tBot.class .. " - " .. tBot.talents .. " - " .. tBot.special .. "|h", "BOTTOM", 0, 200, 15)
			pButton.tip.addText("5", "|cff555555--------------------------------------------|h", "BOTTOM", 0, 188, 15)
			pButton.tip.addText("6", "|cff555555CASH - " .. tReward .. " - GOLD|h", "BOTTOM", 0, 170, 20)
			pButton.tip.addText("7", "|cff555555--------------------------------------------|h", "BOTTOM", 0, 160, 15)
			pButton.tip:Show()
		end)
		
		tButton:SetScript("OnMouseDown", function(pButton)
			pButton.parent:StartMoving()
			pButton.parent.isMoving = true
		end)
		
		tButton:SetScript("OnMouseUp", function(pButton)
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
		
		tFrame.addText("1", tBot.level .. " - " .. tBot.class, "BOTTOMLEFT", 36, 18, 12)
		tFrame.addText("2", tBot.score .. " - " .. tBot.special, "BOTTOMLEFT", 36, 6, 12)
		
		if(tSlot > 11) then tFrame:Hide() else tFrame:Show() end
		tY = MultiBot.IF(mod(tSlot, 11) == 0, 426, tY - 40)
		tSlot = tSlot + 1
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

-- GETTER --

MultiBot.raidus.getRaidState = function()
	local tRaidByMembers = {}
	local tRaidByGroups = {}
	
	local tRaid = GetNumRaidMembers()
	local tGroup = GetNumPartyMembers()
	local tAmount = MultiBot.IF(tRaid > tGroup, tRaid, tGroup)
	
	for tIndex = 1, tAmount do
		local xName, xRank, xGroup = GetRaidRosterInfo(tIndex)
		if(xName and xRank and xGroup) then
			tRaidByMembers[xName] = { index = tIndex, group = xGroup }
			tRaidByGroups[xGroup] = (tRaidByGroups[xGroup] or 0) + 1
		end
	end
	
	return tRaidByMembers, tRaidByGroups
end

MultiBot.raidus.getRaidTarget = function()
	local tRaidByIndex = {}
	local tRaidByName = {}
	local tIndex = 1
	
	local tSelf = UnitName("player")
	local tUser = true
	local tBots = true
	
	for tGroup = 1, 8 do
		for tSlot = 1, 5 do
			local tName = MultiBot.raidus.frames["Group" .. tGroup].frames["Slot" .. tSlot].name
			if(tName ~= nil) then
				if(tName == tSelf) then tUser = false end
				tRaidByIndex[tIndex] = { name = tName, group = tGroup }
				tRaidByName[tName] = tGroup
				tIndex = tIndex + 1
				tBots = false
			end
		end
	end
	
	if(tBots) then return SendChatMessage("There is no Bot in the Raid", "SAY") end
	if(tUser) then return SendChatMessage("I must be in the Raid!", "SAY") end
	return tRaidByIndex, tRaidByName
end

-- EVENTS --

MultiBot.raidus.doRaidSortCheck = function()
	local tRaidByIndex, tRaidByName = MultiBot.raidus.getRaidTarget()
	local tRaidByMembers, tRaidByGroups = MultiBot.raidus.getRaidState()
	
	for tName, tGroup in pairs(tRaidByName) do
		if(tRaidByMembers[tName] ~= nil and tRaidByMembers[tName].group ~= tGroup) then return 1 end
	end
	
	return nil
end

MultiBot.raidus.doRaidSort = function(pIndex)
	local tRaidByIndex, tRaidByName = MultiBot.raidus.getRaidTarget()
	local tRaidByMembers, tRaidByGroups = MultiBot.raidus.getRaidState()
	
	if(pIndex > table.getn(tRaidByIndex)) then return nil end
	
	local tName = tRaidByIndex[pIndex].name
	local tGroup = tRaidByIndex[pIndex].group
	
	if(tRaidByMembers[tName] ~= nil and tRaidByMembers[tName].group ~= tGroup) then
		if(tRaidByGroups[tGroup] == nil) then
			SetRaidSubgroup(tRaidByMembers[tName].index, tGroup)
		else
			if(tRaidByGroups[tGroup] < 5) then
				SetRaidSubgroup(tRaidByMembers[tName].index, tGroup)
			else
				for xName, xValue in pairs(tRaidByMembers) do
					if(xValue.group == tGroup and tRaidByName[xName] ~= tGroup) then
						SwapRaidSubgroup(tRaidByMembers[tName].index, xValue.index)
						break
					end
				end
			end
		end
	end
	
	return pIndex + 1
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