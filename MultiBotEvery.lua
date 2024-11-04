MultiBot.addEvery = function(pFrame, pCombat, pNormal)
	pFrame.addButton("Summon", 64, 0, "ability_hunter_beastcall", MultiBot.tips.every.summon)
	.doLeft = function(pButton)
		MultiBot.ActionToTarget("summon", pButton.getName())
	end
	
	pFrame.addButton("Uninvite", 94, 0, "inv_misc_grouplooking", MultiBot.tips.every.uninvite).doShow()
	.doLeft = function(pButton)
		MultiBot.doSlash("/uninvite", pButton.getName())
		pButton.getButton("Invite").doShow()
		pButton.doHide()
	end
	
	pFrame.addButton("Invite", 94, 0, "inv_misc_groupneedmore", MultiBot.tips.every.invite).doHide()
	.doLeft = function(pButton)
		MultiBot.doSlash("/invite", pButton.getName())
		pButton.getButton("Uninvite").doShow()
		pButton.doHide()
	end
	
	pFrame.addButton("Food", 124, 0, "inv_drink_24_sealwhey", MultiBot.tips.every.food).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "nc +food,?", "nc -food,?", pButton.getName())
	end
	
	pFrame.addButton("Loot", 154, 0, "inv_misc_coin_16", MultiBot.tips.every.loot).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "nc +loot,?", "nc -loot,?", pButton.getName())
	end
	
	pFrame.addButton("Gather", 184, 0, "trade_mining", MultiBot.tips.every.gather).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "nc +gather,?", "nc -gather,?", pButton.getName())
	end
	
	-- Selfbot is not allowed to use these Tools --
	if(pFrame.getName() == UnitName("player")) then return end
	
	pFrame.addButton("Inventory", 214, 0, "inv_misc_bag_08", MultiBot.tips.every.inventory).setDisable()
	.doLeft = function(pButton)
		if(pButton.state) then
			MultiBot.inventory:Hide()
			pButton.setDisable()
		else
			local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
			for key, value in pairs(MultiBot.index.actives) do tUnits.frames[value].getButton("Inventory").setDisable() end
			
			pButton.setEnable()
			MultiBot.inventory.name = pButton.getName()
			tUnits.buttons[MultiBot.inventory.name].waitFor = "INVENTORY"
			SendChatMessage("items", "WHISPER", nil, pButton.getName())
		end
	end
	
	pFrame.addButton("Spellbook", 244, 0, "inv_misc_book_09", MultiBot.tips.every.spellbook).setDisable()
	.doLeft = function(pButton)
		if(pButton.state) then
			MultiBot.spellbook:Hide()
			pButton.setDisable()
		else
			local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
			for key, value in pairs(MultiBot.index.actives) do tUnits.frames[value].getButton("Spellbook").setDisable() end
			
			pButton.setEnable()
			MultiBot.spellbook.name = pButton.getName()
			tUnits.buttons[MultiBot.spellbook.name].waitFor = "SPELLBOOK"
			SendChatMessage("spells", "WHISPER", nil, pButton.getName())
		end
	end
	
	pFrame.addButton("Talent", 274, 0, "ability_marksmanship", MultiBot.tips.every.talent).setDisable()
	.doLeft = function(pButton)
		if(pButton.state) then
			pButton.setDisable()
			MultiBot.talent:Hide()
			MultiBot.talent.doClear()
		elseif(UnitLevel(MultiBot.toUnit(pButton.getName())) < 10) then
			SendChatMessage(MultiBot.info.talent.Level, "SAY")
		elseif(CheckInteractDistance(MultiBot.toUnit(pButton.getName()), 1) == nil) then
			SendChatMessage(MultiBot.info.talent.OutOfRange, "SAY")
		else
			local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
			for key, value in pairs(MultiBot.index.actives) do tUnits.frames[value].getButton("Talent").setDisable() end
			
			InspectUnit(MultiBot.toUnit(pButton.getName()))
			pButton.setEnable()
			
			MultiBot.talent.name = pButton.getName()
			MultiBot.talent.class = pButton.getClass()
			MultiBot.auto.talent = true
		end
	end
	
	-- STRATEGIES --
	
	if(MultiBot.isInside(pNormal, "food")) then pFrame.getButton("Food").setEnable() end
	if(MultiBot.isInside(pNormal, "loot")) then pFrame.getButton("Loot").setEnable() end
	if(MultiBot.isInside(pNormal, "gather")) then pFrame.getButton("Gather").setEnable() end
end