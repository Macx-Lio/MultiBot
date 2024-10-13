MultiBot.tips.every = {}

MultiBot.tips.every.summon =
"Summon|cffffffff\n"..
"Summons this Bot to your Position.|r\n\n"..
"|cffff0000Left-Click to summons the Bot|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.uninvite =
"Uninvite|cffffffff\n"..
"Dismiss this Bot from your Group.|r\n\n"..
"|cffff0000Left-Click to dismiss the Bot|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.invite =
"Invite|cffffffff\n"..
"Invites this Bot to your Group.|r\n\n"..
"|cffff0000Left-Click to invite the Bot|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.food =
"Food|cffffffff\n"..
"It enables or disables the Food-Strategies.|r\n\n"..
"|cffff0000Left-Click to allow Food|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.loot =
"Loot|cffffffff\n"..
"It enables or disables the Loot-Strategies.|r\n\n"..
"|cffff0000Left-Click to allow Loot|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.gather =
"Gather|cffffffff\n"..
"It enables or disables the Gather-Strategies.|r\n\n"..
"|cffff0000Left-Click to allow Gather|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.inventory =
"Inventory|cffffffff\n"..
"It opens or closes the Inventory of this Bot.|r\n\n"..
"|cffff0000Left-Click to open or close the Inventory|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.spellbook =
"Spellbook|cffffffff\n"..
"It opens or closes the Spellbook of this Bot.|r\n\n"..
"|cffff0000Left-Click to open or close the Spellbook|r\n"..
"|cff999999(Execution-Order: Bot)|r";

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
	
	pFrame.addButton("Inventory", 214, 0, "inv_misc_bag_08", MultiBot.tips.every.inventory).setDisable()
	.doLeft = function(pButton)
		if(pButton.state) then
			MultiBot.inventory:Hide()
			pButton.setDisable()
		else
			local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
			for key, value in pairs(MultiBot.index.actives) do tUnits.frames[value].getButton("Inventory").setDisable() end
			
			--if(MultiBot.spellbook:IsVisible()) then
			--	tUnits.frames[MultiBot.spellbook.name].buttons["Spellbook"].setDisable()
			--	MultiBot.spellbook:Hide()
			--end
			
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
			
			--if(MultiBot.inventory:IsVisible()) then
			--	tUnits.frames[MultiBot.inventory.name].buttons["Inventory"].setDisable()
			--	MultiBot.inventory:Hide()
			--end
			
			pButton.setEnable()
			MultiBot.spellbook.name = pButton.getName()
			tUnits.buttons[MultiBot.spellbook.name].waitFor = "SPELLBOOK"
			SendChatMessage("spells", "WHISPER", nil, pButton.getName())
		end
	end
	
	-- STRATEGIES --
	
	if(MultiBot.isInside(pNormal, "food")) then pFrame.getButton("Food").setEnable() end
	if(MultiBot.isInside(pNormal, "loot")) then pFrame.getButton("Loot").setEnable() end
	if(MultiBot.isInside(pNormal, "gather")) then pFrame.getButton("Gather").setEnable() end
end