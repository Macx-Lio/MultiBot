MultiBot = CreateFrame("Frame", nil, UIParent)
MultiBot:RegisterEvent("PLAYER_ENTERING_WORLD")
MultiBot:RegisterEvent("PLAYER_TARGET_CHANGED")
MultiBot:RegisterEvent("CHAT_MSG_WHISPER")
MultiBot:RegisterEvent("CHAT_MSG_SYSTEM")
MultiBot:RegisterEvent("CHAT_MSG_ADDON")
MultiBot:SetPoint("BOTTOMRIGHT", 1, 1)
MultiBot:SetSize(1, 1)
MultiBot:Show()

MultiBot.index = {}
MultiBot.index.classes = {}
MultiBot.index.classes.actives = {}
MultiBot.index.classes.players = {}
MultiBot.index.classes.members = {}
MultiBot.index.classes.friends = {}
MultiBot.index.actives = {}
MultiBot.index.players = {}
MultiBot.index.members = {}
MultiBot.index.friends = {}
MultiBot.frames = {}
MultiBot.units = {}
MultiBot.tips = {}

MultiBot.auto = {}
MultiBot.auto.stats = false
MultiBot.auto.invite = false
MultiBot.auto.release = false

MultiBot.timer = {}
MultiBot.timer.stats = {}
MultiBot.timer.stats.elapsed = 0
MultiBot.timer.stats.interval = 45
MultiBot.timer.invite = {}
MultiBot.timer.invite.elapsed = 0
MultiBot.timer.invite.interval = 5

MultiBot.IF = function(pCondition, pSuccess, pFailure)
	if(pCondition) then return pSuccess else return pFailure end
end

MultiBot.doSlash = function(pCommand, pArguments)
	local tCommand = string.upper(string.sub(pCommand, 2))
	
	for tKey, tFunc in pairs(SlashCmdList) do
		if(tKey == tCommand) then
			tFunc(pArguments)
			return true
		end
	end
	
	SendChatMessage("Command not found.", "SAY")
	return false
end

MultiBot.doDotWithTarget = function(pCommand)
	local tName = UnitName("target")
	
	if(tName ~= nil and tName ~= "Unknown Entity") then
		SendChatMessage(pCommand .. tName, "SAY")
		return true
	end
	
	SendChatMessage("I dont have a Target.", "SAY")
	return false
end

MultiBot.doSplit = function(pString, pPattern)
	local tResult = {}
	local tStart = 1
	local tFrom, tTo = string.find(pString, pPattern, tStart)
	
	while tFrom do
		table.insert(tResult, string.sub(pString, tStart, tFrom - 1))
		tStart = tTo + 1
		tFrom, tTo = string.find(pString, pPattern, tStart)
	end
	
	table.insert(tResult, string.sub(pString, tStart))
	return tResult
end

MultiBot.doReplace = function(pString, pSearch, pReplace)
	local tFrom, tTo = string.find(pString, pSearch) 
	return string.sub(pString, 1, tFrom - 1) .. pReplace .. string.sub(pString, tTo + 1)
end

MultiBot.doRemove = function(pIndex, pName)
	local tFound = 0
	
	for i = 1, table.getn(pIndex) do
		if(pIndex[i] == pName) then
			tFound = i
			break
		end
	end
	
	if(tFound == 0) then return false end
	table.remove(pIndex, tFound)
	return true
end

MultiBot.isInside = function(pString, p1stPattern, o2ndPattern, o3rdPattern)
	if(p1stPattern ~= nil and string.find(pString, p1stPattern)) then return true end
	if(o2ndPattern ~= nil and string.find(pString, o2ndPattern)) then return true end
	if(o3rdPattern ~= nil and string.find(pString, o3rdPattern)) then return true end
	return false
end

MultiBot.isMember = function(pName)
	if(GetNumRaidMembers() > 5) then
		for i = 1, GetNumRaidMembers() do
			if(UnitName("raid" .. i) == pName) then return true end
		end
	end
	
	if(GetNumPartyMembers() > 0) then
		for i = 1, 4 do
			if(UnitName("party" .. i) == pName) then return true end
		end
	end
	
	if(UnitName("player") == pName) then
		return true
	end
	
	return false
end

MultiBot.isTarget = function()
	local tName = UnitName("target")
	
	if(tName ~= nil and tName ~=  "Unknown Entity") then	
		return true
	end
	
	SendChatMessage("I dont have a Target.", "SAY")
	return false
end

MultiBot.isUnit = function(pUnit)
	local tName = UnitName(pUnit)
	
	if(tName == nil or tName == "Unknown Entity") then
		return false
	end
	
	return true
end

MultiBot.toClass = function(pClass)
	local tClass = string.lower(string.sub(pClass, 1, 1) .. string.sub(pClass, 4, 4))
	if(tClass == "di" or tClass == "di") then return "Druid" end
	if(tClass == "he" or tClass == "wl") then return "Warlock" end
	if(tClass == "jg" or tClass == "ht") then return "Hunter" end
	if(tClass == "ke" or tClass == "wr") then return "Warrior" end
	if(tClass == "mi" or tClass == "me") then return "Mage" end
	if(tClass == "pa" or tClass == "pa") then return "Paladin" end
	if(tClass == "pe" or tClass == "pe") then return "Priest" end
	if(tClass == "sa" or tClass == "sm") then return "Shaman" end
	if(tClass == "su" or tClass == "ru") then return "Rogue" end
	if(tClass == "te" or tClass == "dt") then return "DeathKnight" end
	return pClass
end

MultiBot.toUnit = function(pName)
	if(GetNumRaidMembers() > 5) then
		for i = 1, GetNumRaidMembers() do
			if(UnitName("raid" .. i) == pName) then
				return "raid" .. i
			end
		end
	end
	
	if(GetNumPartyMembers() > 0) then
		for i = 1, GetNumPartyMembers() do
			if(UnitName("party" .. i) == pName) then
				return "party" .. i
			end
		end
	end
	
	if(UnitName("player") == pName) then
		return "player"
	end
	
	return nil
end

MultiBot.ActionToTarget = function(pAction, oTarget)
	local tName = MultiBot.IF(oTarget == nil, UnitName("target"), oTarget)
	
	if(tName ~= nil and tName ~= "Unknown Entity") then
		SendChatMessage(pAction, "WHISPER", nil, tName)
		return true
	end
	
	SendChatMessage("I dont have a Target.", "SAY")
	return false
end

MultiBot.ActionToTargetOrGroup = function(pAction)
	local tName = UnitName("target")
	
	if(tName ~= nil and tName ~= "Unknown Entity") then
		SendChatMessage(pAction, "WHISPER", nil, tName)
		return true
	end
	
	if(GetNumRaidMembers() > 5) then
		SendChatMessage(pAction, "RAID")
		return true
	end
	
	if(GetNumPartyMembers() > 0) then
		SendChatMessage(pAction, "PARTY")
		return true
	end
	
	SendChatMessage("I neither have a Target nor am I in a Raid or Party.", "SAY")
	return false
end

MultiBot.ActionToGroup = function(pAction)
	if(GetNumRaidMembers() > 5) then
		SendChatMessage(pAction, "RAID")
		return true
	end
	
	if(GetNumPartyMembers() > 0) then
		SendChatMessage(pAction, "PARTY")
		return true
	end
	
	SendChatMessage("I neither in a Raid nor in a Party.", "SAY")
	return false
end

MultiBot.SelectToTarget = function(pParent, pIndex, pTexture, pAction, oTarget)
	if(MultiBot.ActionToTarget(pAction, oTarget)) then
		local tFrame = pParent.frames[pIndex]
		local tButton = pParent.buttons[pIndex]
		tButton.setTexture(pTexture)
		tFrame:Hide()
		return true
	end
	
	return false
end

MultiBot.SelectToTargetButton = function(pParent, pIndex, pTexture, pAction, oTarget)
	local tFrame = pParent.frames[pIndex]
	local tButton = pParent.buttons[pIndex]
	tButton.doLeft = function(pButton) MultiBot.ActionToTarget(pAction, oTarget) end
	tButton.setTexture(pTexture)
	tFrame:Hide()
	return true
end

MultiBot.SelectToGroupButtonWithTarget = function(pParent, pIndex, pTexture, pAction)
	local tFrame = pParent.frames[pIndex]
	local tButton = pParent.buttons[pIndex]
	tButton.doLeft = function(pButton) if(MultiBot.isTarget()) then MultiBot.ActionToGroup(pAction) end end
	tButton.setTexture(pTexture)
	tFrame:Hide()
	return true
end

MultiBot.SelectToGroupButton = function(pParent, pIndex, pTexture, pAction)
	local tFrame = pParent.frames[pIndex]
	local tButton = pParent.buttons[pIndex]
	tButton.doLeft = function(pButton) MultiBot.ActionToGroup(pAction) end
	tButton.setTexture(pTexture)
	tFrame:Hide()
	return true
end

MultiBot.SelectToGroup = function(pParent, pIndex, pTexture, pAction)
	if(MultiBot.ActionToGroup(pAction)) then
		local tFrame = pParent.frames[pIndex]
		local tButton = pParent.buttons[pIndex]
		tButton.setTexture(pTexture)
		tFrame:Hide()
		return true
	end
	
	return false
end

MultiBot.Select = function(pParent, pIndex, pTexture)
	local tFrame = pParent.frames[pIndex]
	local tButton = pParent.buttons[pIndex]
	tButton.setTexture(pTexture)
	tFrame:Hide()
	return true
end

MultiBot.ShowHideSwitch = function(pFrame)
	if(pFrame:IsVisible()) then
		pFrame:Hide()
		return false
	end
	
	pFrame:Show()
	return true
end

MultiBot.OnOffActionToTarget = function(pButton, pOn, pOff, pTarget)
	if(pButton.state) then
		MultiBot.ActionToTarget(pOff, pTarget)
		pButton.setDisable()
		return false
	else
		MultiBot.ActionToTarget(pOn, pTarget)
		pButton.setEnable()
		return true
	end
end

MultiBot.OnOffSwitch = function(pButton)
	if(pButton.state) then
		pButton.setDisable()
		return false
	end
	
	pButton.setEnable()
	return true
end

-- MULTIBOT:FRAME --

MultiBot.newFrame = function(pParent, pX, pY, pSize, oWidth, oHeight)
	local frame = CreateFrame("Frame", nil, pParent)
	frame:SetPoint("BOTTOMRIGHT", pX, pY)
	frame:Show()
	
	if(oWidth ~= nil and oHeight ~= nil)
	then frame:SetSize(oWidth, oHeight)
	else frame:SetSize(pSize, pSize)
	end
	
	frame.buttons = {}
	frame.frames = {}
	frame.texts = {}
	
	frame.parent = pParent
	frame.size = pSize
	
	-- ADD --
	
	frame.addTexture = function(pTexture)
		if(frame.texture ~= nil) then frame.texture:Hide() end
		frame.texture = frame:CreateTexture(nil, "BACKGROUND")
		frame.texture:SetTexture(MultiBot.IF(string.sub(pTexture, 1, 9) ~= "Interface", "Interface/Icons/", "") .. pTexture)
		frame.texture:SetAllPoints(frame)
		frame.texture:Show()
		return frame.texture
	end
	
	frame.addText = function(pIndex, pText, pAlign, pX, pY, pSize)
		if(frame.texts[pIndex] ~= nil) then frame.texts[pIndex]:Hide() end
		frame.texts[pIndex] = frame:CreateFontString(nil, "ARTWORK")
		frame.texts[pIndex]:SetFont("Fonts\\ARIALN.ttf", pSize, "OUTLINE")
		frame.texts[pIndex]:SetPoint(pAlign, pX, pY)
		frame.texts[pIndex]:SetText(pText)
		frame.texts[pIndex]:Show()
		return frame.texts[pIndex]
	end
	
	frame.addButton = function(pName, pX, pY, pTexture, pTip)
		if(frame.buttons[pName] ~= nil) then frame.buttons[pName]:Hide() end
		frame.buttons[pName] = MultiBot.newButton(frame, pX, pY, frame.size, pTexture, pTip)
		return frame.buttons[pName]
	end
	
	frame.addFrame = function(pName, pX, pY, oSize, oWidth, oHeight)
		if(frame.frames[pName] ~= nil) then frame.frames[pName]:Hide() end
		frame.frames[pName] = MultiBot.newFrame(frame, pX, pY, MultiBot.IF(oSize ~= nil, oSize, frame.size - 4), oWidth, oHeight)
		return frame.frames[pName]
	end
	
	-- SET --
	
	frame.setPoint = function(pX, pY)
		frame:SetPoint("BOTTOMRIGHT", pX, pY)
		return true
	end
	
	frame.setTexture = function(pTexture)
		frame.texture:SetTexture(MultiBot.IF(string.sub(pTexture, 1, 9) ~= "Interface", "Interface/Icons/", "") .. pTexture)
		frame.texture:SetAllPoints(frame)
		frame.texture:Show()
		return true
	end
	
	-- GET --
	
	frame.getButton = function(pIndex)
		if(frame.buttons[pIndex] ~= nil) then
			return frame.buttons[pIndex]
		end
		
		for key, value in pairs(frame.frames) do
			local tButton = value.getButton(pIndex)
			if(tButton ~= nil) then return tButton end
		end
		
		return nil
	end
	
	frame.getFrame = function(pIndex)
		if(frame.frames[pIndex] ~= nil) then
			return frame.frames[pIndex]
		end
		
		for key, value in pairs(frame.frames) do
			local tFrame = value.getFrame(pIndex)
			if(tFrame ~= nil) then return tFrame end
		end
		
		return nil
	end
	
	frame.getClass = function()
		if(frame.class ~= nil) then return frame.class end
		return frame.parent.getClass()
	end
	
	frame.getName = function()
		if(frame.name ~= nil) then return frame.name end
		return frame.parent.getName()
	end
	
	frame.get = function()
		if(frame.name ~= nil) then return frame end
		return frame.parent.get()
	end
	
	return frame
end

-- MULTIBOT:BUTTON --

MultiBot.newButton = function(pParent, pX, pY, pSize, pTexture, pTip)
	local button = CreateFrame("Button", nil, pParent)
	button:SetPoint("BOTTOMRIGHT", pX, pY)
	button:SetSize(pSize, pSize)
	button:Show()
	
	button.icon = button:CreateTexture(nil, "BACKGROUND")
	button.icon:SetTexture(MultiBot.IF(string.sub(pTexture, 1, 9) ~= "Interface", "Interface/Icons/", "") .. pTexture)
	button.icon:SetAllPoints(button)
	button.icon:Show()
	
	button:EnableMouse(true)
	button:RegisterForClicks("LeftButtonDown", "RightButtonDown")
	button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square", "ADD")
	button:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
	
	button.texture = pTexture
	button.parent = pParent
	button.size = pSize
	button.tip = pTip
	button.x = pX
	button.y = pY
	
	-- SET --
	
	button.setPoint = function(pX, pY)
		button:SetPoint("BOTTOMRIGHT", pX, pY)
		button.x = pX
		button.y = pY
		return button
	end
	
	button.setTexture = function(pTexture)
		button.icon:SetTexture(MultiBot.IF(string.sub(pTexture, 1, 9) ~= "Interface", "Interface/Icons/", "") .. pTexture)
		button.icon:SetAllPoints(button)
		button.texture = pTexture
		return button
	end
	
	button.setAmount = function(pAmount)
		button.amount = button:CreateFontString(nil, "ARTWORK")
		button.amount:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
		button.amount:SetPoint("BOTTOMRIGHT", 0, 0)
		button.amount:SetText(pAmount)
		return button
	end
	
	button.setDisable = function()
		button.icon:SetDesaturated(1)
		button.state = false
		return button
	end
	
	button.setEnable = function()
		button.icon:SetDesaturated(nil)
		button.state = true
		return button
	end
	
	-- GET --
	
	button.getButton = function(pIndex)
		return button.parent.get().getButton(pIndex)
	end
	
	button.getFrame = function(pIndex)
		return button.parent.get().getFrame(pIndex)
	end
	
	button.getClass = function()
		return button.parent.getClass()
	end
	
	button.getName = function()
		return button.parent.getName()
	end
	
	button.get = function()
		return button.parent.get()
	end
	
	-- DO --
	
	button.doHide = function()
		button:SetPoint("BOTTOMRIGHT", button.x, button.y)
		button:SetSize(button.size, button.size)
		button:Hide()
		return button
	end
	
	button.doShow = function()
		button:SetPoint("BOTTOMRIGHT", button.x, button.y)
		button:SetSize(button.size, button.size)
		button:Show()
		return button
	end
	
	-- EVENT --
	
	button:SetScript("OnEnter", function()
		GameTooltip:SetOwner(button, "ANCHOR_TOPRIGHT", 0 - button.size, 2)
		if(string.sub(button.tip, 1, 1) == "|") then GameTooltip:SetHyperlink(button.tip) else GameTooltip:SetText(button.tip) end
		GameTooltip:Show()
	end)
	
	button:SetScript("OnLeave", function()
		button:SetPoint("BOTTOMRIGHT", button.x, button.y)
		button:SetSize(button.size, button.size)
		GameTooltip:Hide()
	end)
	
	button:SetScript("OnClick", function(pSelf, pEvent)
		button:SetPoint("BOTTOMRIGHT", button.x - 1, button.y + 1)
		button:SetSize(button.size - 2, button.size - 2)
		GameTooltip:Hide()
		
		if(pEvent == "RightButton" and button.doRight ~= nil) then button.doRight(button) end
		if(pEvent == "LeftButton" and button.doLeft ~= nil) then button.doLeft(button) end
	end)
	
	return button
end

-- MULTIBOT:ADD --

MultiBot.addFrame = function(pName, pX, pY, pSize)
	local tFrame = MultiBot.newFrame(MultiBot, pX, pY, pSize)
	MultiBot.frames[pName] = tFrame
	return tFrame
end

MultiBot.addPlayer = function(pName, pClass, pTexture, pTip)
	if(MultiBot.frames["MultiBar"].frames["Units"].buttons[pName] ~= nil) then return MultiBot.frames["MultiBar"].frames["Units"].buttons[pName] end
	local tClass = MultiBot.toClass(pClass)
	local tButton = MultiBot.frames["MultiBar"].frames["Units"].addButton(pName, 0, 0, pTexture, pTip)
	if(MultiBot.index.classes.players[tClass] == nil) then MultiBot.index.classes.players[tClass] = {} end
	table.insert(MultiBot.index.classes.players[tClass], pName)
	table.insert(MultiBot.index.players, pName)
	return tButton
end

MultiBot.addMember = function(pName, pClass, pTexture, pTip)
	if(MultiBot.frames["MultiBar"].frames["Units"].buttons[pName] ~= nil) then return MultiBot.frames["MultiBar"].frames["Units"].buttons[pName] end
	local tClass = MultiBot.toClass(pClass)
	local tButton = MultiBot.frames["MultiBar"].frames["Units"].addButton(pName, 0, 0, pTexture, pTip)
	if(MultiBot.index.classes.members[tClass] == nil) then MultiBot.index.classes.members[tClass] = {} end
	table.insert(MultiBot.index.classes.members[tClass], pName)
	table.insert(MultiBot.index.members, pName)
	return tButton
end

MultiBot.addFriend = function(pName, pClass, pTexture, pTip)
	if(MultiBot.frames["MultiBar"].frames["Units"].buttons[pName] ~= nil) then return MultiBot.frames["MultiBar"].frames["Units"].buttons[pName] end
	local tClass = MultiBot.toClass(pClass)
	local tButton = MultiBot.frames["MultiBar"].frames["Units"].addButton(pName, 0, 0, pTexture, pTip)
	if(MultiBot.index.classes.friends[tClass] == nil) then MultiBot.index.classes.friends[tClass] = {} end
	table.insert(MultiBot.index.classes.friends[tClass], pName)
	table.insert(MultiBot.index.friends, pName)
	return tButton
end