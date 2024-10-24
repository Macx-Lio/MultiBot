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
	
	if(MultiBot.spellbook.index < 13) then
		MultiBot.setSpell(MultiBot.spellbook.index, tSpell)
	end
end

MultiBot.setSpell = function(pIndex, pSpell)
	local tIndex = MultiBot.IF(pIndex < 10, "0", "") .. pIndex
	
	if(pSpell ~= nil) then
		local tTitle = MultiBot.IF(string.len(pSpell[2]) > 16, string.sub(pSpell[2], 1, 16) .. "...", pSpell[2])
		MultiBot.spellbook.setButton("S" .. tIndex, pSpell[4], pSpell[5])
		MultiBot.spellbook.setText("T" .. tIndex, "|cffffcc00" .. tTitle .. "|r")
		MultiBot.spellbook.setText("R" .. tIndex, "|cff503010" .. pSpell[3] .. "|r")
		MultiBot.spellbook.buttons["S" .. tIndex].spell = pSpell[1]
		MultiBot.spellbook.buttons["S" .. tIndex].doShow()
		MultiBot.spellbook.texts["T" .. tIndex]:Show()
		MultiBot.spellbook.texts["R" .. tIndex]:Show()
	else
		MultiBot.spellbook.buttons["S" .. tIndex].spell = 0
		MultiBot.spellbook.buttons["S" .. tIndex].doHide()
		MultiBot.spellbook.texts["T" .. tIndex]:Hide()
		MultiBot.spellbook.texts["R" .. tIndex]:Hide()
	end
end