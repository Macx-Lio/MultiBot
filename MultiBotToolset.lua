MultiBot.IF = function(pCondition, pSuccess, pFailure)
	if(pCondition) then return pSuccess end
	return pFailure
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

MultiBot.doSlash = function(pCommand, pArguments)
	local tCommand = string.upper(string.sub(pCommand, 2))
	
	for tKey, tFunc in pairs(SlashCmdList) do
--		SendChatMessage(tKey, "SAY")
		if(tKey == tCommand) then return tFunc(pArguments) end
	end
end

MultiBot.isInside = function(pString, pPattern)
	if(string.find(pString, pPattern)) then return true end
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

MultiBot.toUnit = function(pName)
	if(GetNumRaidMembers() > 5) then
		for i = 1, GetNumRaidMembers() do
			if(UnitName("raid" .. i) == pName) then return "raid" .. i end
		end
	end
	
	if(GetNumPartyMembers() > 0) then
		for i = 1, 4 do
			if(UnitName("party" .. i) == pName) then return "party" .. i end
		end
	end
	
	if(UnitName("player") == pName) then
		return "player"
	end
	
	return nil
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

print("AfterMultiBotToolset")