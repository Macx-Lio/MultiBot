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
	
	return false
end

print("AfterMultiBotToolset")