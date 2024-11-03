MultiBot.addSpell = function(pInfo)
	local tInfo = MultiBot.doSplit(pInfo, "|")
	local tID = MultiBot.doSplit(tInfo[3], ":")[2]
	
	local tName, tRank, tIcon = GetSpellInfo(tID)
	local tLink = GetSpellLink(tID)
	
	if(tName == nil) then tName = "" end
	if(tRank == nil) then tRank = "" end
	if(tIcon == nil) then tIcon = "inv_misc_questionmark" end
	if(tLink == nil) then tLink = tName end
	
	local tSpell = { tID, tName, tRank, tIcon, tLink }
	
	table.insert(MultiBot.spellbook.spells, tSpell)
	MultiBot.spellbook.index = MultiBot.spellbook.index + 1
	
	if(MultiBot.spellbook.index < 17) then
		MultiBot.setSpell(MultiBot.spellbook.index, tSpell)
	end
end

MultiBot.setSpell = function(pIndex, pSpell)
	local tIndex = MultiBot.IF(pIndex < 10, "0", "") .. pIndex
	local tOverlay = MultiBot.spellbook.frames["Overlay"]
	
	if(pSpell ~= nil) then
		local tTitle = MultiBot.IF(string.len(pSpell[2]) > 16, string.sub(pSpell[2], 1, 16) .. "...", pSpell[2])	
		tOverlay.setButton("S" .. tIndex, pSpell[4], pSpell[5])
		tOverlay.setText("T" .. tIndex, "|cffffcc00" .. tTitle .. "|r")
		tOverlay.setText("R" .. tIndex, "|cff402000" .. pSpell[3] .. "|r")
		tOverlay.buttons["S" .. tIndex].spell = pSpell[1]
		tOverlay.buttons["S" .. tIndex].doShow()
		tOverlay.texts["T" .. tIndex]:Show()
		tOverlay.texts["R" .. tIndex]:Show()
	else
		tOverlay.buttons["S" .. tIndex].spell = 0
		tOverlay.buttons["S" .. tIndex].doHide()
		tOverlay.texts["T" .. tIndex]:Hide()
		tOverlay.texts["R" .. tIndex]:Hide()
	end
end