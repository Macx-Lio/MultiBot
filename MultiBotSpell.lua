MultiBot.getSpellID = function(pInfo)
	local tInfo = MultiBot.doSplit(pInfo, "|")
	if(string.sub(tInfo[3], 1, 6) == "Hspell") then return string.sub(tInfo[3], 8) end
	return 0
end

MultiBot.addSpell = function(pInfo, pName)
	local tInfo = MultiBot.doSplit(pInfo, "|")
	local tID = MultiBot.getSpellID(pInfo)
	if(tID == 0) then return end
	
	local tName, tRank, tIcon = GetSpellInfo(tID)
	local tLink = GetSpellLink(tID)
	
	if(tName == nil) then tName = "" end
	if(tRank == nil) then tRank = "" end
	if(tIcon == nil) then tIcon = "inv_misc_questionmark" end
	if(tLink == nil) then tLink = tName end
	
	local tSpell = { tID, tName, tRank, tIcon, tLink }
	
	table.insert(MultiBot.spellbook.spells, tSpell)
	MultiBot.spellbook.index = MultiBot.spellbook.index + 1
	
	if(MultiBot.spells[pName] == nil) then MultiBot.spells[pName] = {} end
	if(MultiBot.spells[pName][tID] == nil) then MultiBot.spells[pName][tID] = true end
	
	if(MultiBot.spellbook.index < 17) then
		MultiBot.setSpell(MultiBot.spellbook.index, tSpell, MultiBot.spells[pName][tID])
	end
end

MultiBot.setSpell = function(pIndex, pSpell, pState)
	local tIndex = MultiBot.IF(pIndex < 10, "0", "") .. pIndex
	local tOverlay = MultiBot.spellbook.frames["Overlay"]
	
	if(pSpell ~= nil) then
		local tTitle = MultiBot.IF(string.len(pSpell[2]) > 16, string.sub(pSpell[2], 1, 16) .. "...", pSpell[2])
		tOverlay.setButton("S" .. tIndex, pSpell[4], pSpell[5])
		tOverlay.setText("T" .. tIndex, "|cffffcc00" .. tTitle .. "|r")
		tOverlay.setText("R" .. tIndex, "|cff402000" .. pSpell[3] .. "|r")
		tOverlay.buttons["S" .. tIndex].spell = pSpell[1]
		tOverlay.buttons["C" .. tIndex].spell = pSpell[1]
		tOverlay.buttons["S" .. tIndex].doShow()
		tOverlay.buttons["C" .. tIndex].doShow()
		tOverlay.texts["T" .. tIndex]:Show()
		tOverlay.texts["R" .. tIndex]:Show()
		
		tOverlay.buttons["C" .. tIndex]:SetChecked(pState)
		tOverlay.buttons["C" .. tIndex].doClick = function(pButton)
			local tName = pButton.getName()
			local tAction = ""
			
			MultiBot.spells[tName][pButton.spell] = MultiBot.IF(MultiBot.spells[tName][pButton.spell], false, true)
			pButton:SetChecked(MultiBot.spells[tName][pButton.spell])
			
			for id, state in pairs(MultiBot.spells[tName]) do
				if(state == false) then tAction = tAction .. MultiBot.IF(tAction == "", "ss +", ", +") .. id end
			end
			
			MultiBot.ActionToTarget(MultiBot.IF(tAction == "", "ss -" .. pButton.spell, tAction), tName)
		end
	else
		tOverlay.buttons["S" .. tIndex].spell = 0
		tOverlay.buttons["C" .. tIndex].spell = 0
		tOverlay.buttons["S" .. tIndex].doHide()
		tOverlay.buttons["C" .. tIndex].doHide()
		tOverlay.texts["T" .. tIndex]:Hide()
		tOverlay.texts["R" .. tIndex]:Hide()
	end
end