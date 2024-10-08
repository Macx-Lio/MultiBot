MultiBot.tips.hunter = {}
MultiBot.tips.hunter.dps = {}
MultiBot.tips.hunter.naspect = {}
MultiBot.tips.hunter.caspect = {}

MultiBot.tips.hunter.naspect.master =
"Non-Combat-Buff|cffffffff\n"..
"This Control allows you to select, enable or disable the default Non-Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Execution-Order: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Buff.|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.naspect.rnature =
"Resist-Nature-Buff|cffffffff\n"..
"It enables the Resist-Nature-Buff as Non-Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Resist-Nature-Buff|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.naspect.bmana =
"Mana-Buff|cffffffff\n"..
"It enables the Mana-Buff as Non-Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Mana-Buff|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.naspect.bdps =
"DPS-Buff|cffffffff\n"..
"It enables the DPS-Buff as Non-Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable DPS-Buff|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.caspect.master =
"Combat-Buff|cffffffff\n"..
"This Control allows you to select, enable or disable the default Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Execution-Order: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Buff.|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.caspect.rnature =
"Resist-Nature-Buff|cffffffff\n"..
"It enables the Resist-Nature-Buff as Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Resist-Nature-Buff|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.caspect.bmana =
"Mana-Buff|cffffffff\n"..
"It enables the Mana-Buff as Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Mana-Buff|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.caspect.bdps =
"DPS-Buff|cffffffff\n"..
"It enables the DPS-Buff as Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable DPS-Buff|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.dps.master =
"DPS-Control|cffffffff\n"..
"In the DPS-Control you will find the general DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to show or hide DPS-Control|r\n"..
"|cf9999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"It enables the DPS-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Assist|r\n"..
"|cf9999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.dps.dpsDebuff =
"DPS-Debuff|cffffffff\n"..
"It enables the Debuff-Strategies.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Debuff|r\n"..
"|cf9999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.dps.dpsAoe = 
"DPS-AOE|cffffffff\n"..
"It enables the DPS-AOE-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-AOE|r\n"..
"|cf9999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.dps.dps = 
"DPS|cffffffff\n"..
"It enables the DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS|r\n"..
"|cf9999999(Execution-Order: Bot)|r";

MultiBot.tips.hunter.tankAssist = 
"Tank-Assist|cffffffff\n"..
"It enables the Tank-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank-Assist|r\n"..
"|cf9999999(Execution-Order: Bot)|r";

MultiBot.addHunter = function(pFrame, pCombat, pNormal)
	local tButton = pFrame.addButton("NonCombatAspect", 0, 0, "spell_nature_protectionformnature", MultiBot.tips.hunter.naspect.master)
	tButton.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.parent.frames["NonCombatAspect"])
	end
	
	local tFrame = pFrame.addFrame("NonCombatAspect", -2, 30)
	tFrame:Hide()
	
	tFrame.addButton("NonCombatNature", 0, 0, "spell_nature_protectionformnature", MultiBot.tips.hunter.naspect.rnature)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatAspect", pButton.texture, "nc +rnature,?", pButton.getName())
		pButton.getButton("NonCombatAspect").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +rnature,?", "nc -rnature,?", pButton.getName())
		end
	end
	
	tFrame.addButton("NonCombatMana", 0, 26, "ability_hunter_aspectoftheviper", MultiBot.tips.hunter.naspect.bmana)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatAspect", pButton.texture, "nc +bmana,?", pButton.getName())
		pButton.getButton("NonCombatAspect").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bmana,?", "nc -bmana,?", pButton.getName())
		end
	end
	
	tFrame.addButton("NonCombatDps", 0, 52, "ability_hunter_pet_dragonhawk", MultiBot.tips.hunter.naspect.bdps)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatAspect", pButton.texture, "nc +bdps,?", pButton.getName())
		pButton.getButton("NonCombatAspect").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bdps,?", "nc -bdps,?", pButton.getName())
		end
	end
	
	-- STRATEGIES:NON-COMBAT-BUFF --
	
	if(MultiBot.isInside(pNormal, "rnature")) then
		tButton.setTexture("spell_nature_protectionformnature").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +rnature,?", "nc -rnature,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "bmana")) then
		tButton.setTexture("ability_hunter_aspectoftheviper").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bmana,?", "nc -bmana,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "bdps")) then
		tButton.setTexture("ability_hunter_pet_dragonhawk").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bdps,?", "nc -bdps,?", pButton.getName())
		end
	end
	
	-- COMABT-BUFF --
	
	local tButton = pFrame.addButton("CombatAspect", -30, 0, "spell_nature_protectionformnature", MultiBot.tips.hunter.caspect.master)
	tButton.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.parent.frames["CombatAspect"])
	end
	
	local tFrame = pFrame.addFrame("CombatAspect", -32, 30)
	tFrame:Hide()
	
	tFrame.addButton("CombatNature", 0, 0, "spell_nature_protectionformnature", MultiBot.tips.hunter.caspect.rnature)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatAspect", pButton.texture, "co +rnature,?", pButton.getName())
		pButton.getButton("CombatAspect").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +rnature,?", "co -rnature,?", pButton.getName())
		end
	end
	
	tFrame.addButton("CombatMana", 0, 26, "ability_hunter_aspectoftheviper", MultiBot.tips.hunter.caspect.bmana)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatAspect", pButton.texture, "co +bmana,?", pButton.getName())
		pButton.getButton("CombatAspect").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bmana,?", "co -bmana,?", pButton.getName())
		end
	end
	
	tFrame.addButton("CombatDps", 0, 52, "ability_hunter_pet_dragonhawk", MultiBot.tips.hunter.caspect.bdps)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatAspect", pButton.texture, "co +bdps,?", pButton.getName())
		pButton.getButton("CombatAspect").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bdps,?", "co -bdps,?", pButton.getName())
		end
	end
	
	-- STRATEGIES:COMABT-ASPECT --
	
	if(MultiBot.isInside(pCombat, "rnature")) then
		tButton.setTexture("spell_nature_protectionformnature").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +rnature,?", "co -rnature,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "bmana")) then
		tButton.setTexture("ability_hunter_aspectoftheviper").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bmana,?", "co -bmana,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "bdps")) then
		tButton.setTexture("ability_hunter_pet_dragonhawk").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bdps,?", "co -bdps,?", pButton.getName())
		end
	end
	
	-- DPS --
	
	pFrame.addButton("DpsControl", -60, 0, "ability_warrior_challange", MultiBot.tips.hunter.dps.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("DpsControl"))
	end
	
	local tFrame = pFrame.addFrame("DpsControl", -62, 30)
	tFrame:Hide()
	
	tFrame.addButton("DpsAssist", 0, 0, "spell_holy_heroism", MultiBot.tips.hunter.dps.dpsAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps assist,?", "co -dps assist,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	tFrame.addButton("DpsDebuff", 0, 26, "spell_holy_restoration", MultiBot.tips.hunter.dps.dpsDebuff).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +dps debuff,?", "co -dps debuff,?", pButton.getName())
	end
	
	tFrame.addButton("DpsAoe", 0, 52, "spell_holy_surgeoflight", MultiBot.tips.hunter.dps.dpsAoe).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps aoe,?", "co -dps aoe,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAssist").setDisable()
		end
	end
	
	tFrame.addButton("Dps", 0, 78, "spell_holy_divinepurpose", MultiBot.tips.hunter.dps.dps).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +dps,?", "co -dps,?", pButton.getName())
	end
	
	-- ASSIST --
	
	pFrame.addButton("TankAssist", -90, 0, "ability_warrior_innerrage", MultiBot.tips.hunter.tankAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +tank assist,?", "co -tank assist,?", pButton.getName())) then
			pButton.getButton("DpsAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	-- STRATEGIES --
	
	if(MultiBot.isInside(pCombat, "dps,")) then pFrame.getButton("Dps").setEnable() end
	if(MultiBot.isInside(pCombat, "dps aoe")) then pFrame.getButton("DpsAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "dps assist")) then pFrame.getButton("DpsAssist").setEnable() end
	if(MultiBot.isInside(pCombat, "dps debuff")) then pFrame.getButton("DpsDebuff").setEnable() end
	if(MultiBot.isInside(pCombat, "tank assist")) then pFrame.getButton("TankAssist").setEnable() end
end