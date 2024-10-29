MultiBot.addShaman = function(pFrame, pCombat, pNormal)
	pFrame.addButton("Heal", 0, 0, "spell_holy_aspiration", MultiBot.tips.priest.heal).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +heal,?", "co -heal,?", pButton.getName())) then
			pButton.getButton("Caster").setDisable()
			pButton.getButton("Melee").setDisable()
		end
	end
	
	-- NON-COMBAT-TOTEM --
	
	local tButton = pFrame.addButton("NonCombatTotem", -30, 0, "spell_nature_manaregentotem", MultiBot.tips.shaman.ntotem.master)
	tButton.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.parent.frames["NonCombatTotem"])
	end
	
	local tFrame = pFrame.addFrame("NonCombatTotem", -32, 30)
	tFrame:Hide()
	
	tFrame.addButton("NonCombatMana", 0, 0, "spell_nature_manaregentotem", MultiBot.tips.shaman.ntotem.bmana)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatTotem", pButton.texture, "nc +bmana,?", pButton.getName())
		pButton.getButton("NonCombatTotem").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bmana,?", "nc -bmana,?", pButton.getName())
		end
	end
	
	tFrame.addButton("NonCombatDps", 0, 26, "spell_nature_windfury", MultiBot.tips.shaman.ntotem.bdps)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatTotem", pButton.texture, "nc +bdps,?", pButton.getName())
		pButton.getButton("NonCombatTotem").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bdps,?", "nc -bdps,?", pButton.getName())
		end
	end
	
	-- STRATEGIES:NON-COMBAT-TOTEM --
	
	if(MultiBot.isInside(pNormal, "bmana")) then
		tButton.setTexture("spell_nature_manaregentotem").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bmana,?", "nc -bmana,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "bdps")) then
		tButton.setTexture("spell_nature_windfury").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bdps,?", "nc -bdps,?", pButton.getName())
		end
	end
	
	-- COMBAT-TOTEM --
	
	local tButton = pFrame.addButton("CombatTotem", -60, 0, "spell_nature_manaregentotem", MultiBot.tips.shaman.ctotem.master)
	tButton.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.parent.frames["CombatTotem"])
	end
	
	local tFrame = pFrame.addFrame("CombatTotem", -62, 30)
	tFrame:Hide()
	
	tFrame.addButton("CombatMana", 0, 0, "spell_nature_manaregentotem", MultiBot.tips.shaman.ctotem.bmana)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatTotem", pButton.texture, "co +bmana,?", pButton.getName())
		pButton.getButton("CombatTotem").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bmana,?", "co -bmana,?", pButton.getName())
		end
	end
	
	tFrame.addButton("CombatDps", 0, 26, "spell_nature_windfury", MultiBot.tips.shaman.ctotem.bdps)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatTotem", pButton.texture, "co +bdps,?", pButton.getName())
		pButton.getButton("CombatTotem").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bdps,?", "co -bdps,?", pButton.getName())
		end
	end
	
	-- STRATEGIES:COMBAT-TOTEM --
	
	if(MultiBot.isInside(pCombat, "bmana")) then
		tButton.setTexture("spell_nature_manaregentotem").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bmana,?", "co -bmana,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "bdps")) then
		tButton.setTexture("spell_nature_windfury").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bdps,?", "co -bdps,?", pButton.getName())
		end
	end
	
	-- PLAYBOOK --
	
	pFrame.addButton("Playbook", -90, 0, "inv_misc_book_06", MultiBot.tips.shaman.playbook.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("Playbook"))
	end
	
	tFrame = pFrame.addFrame("Playbook", -92, 30)
	tFrame:Hide()
	
	tFrame.addButton("Totems", 0, 0, "inv_relics_totemofrebirth", MultiBot.tips.shaman.playbook.totems).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +totems,?", "co -totems,?", pButton.getName())
	end
	
	tFrame.addButton("CasterAoe", 0, 26, "spell_nature_lightningoverload", MultiBot.tips.shaman.playbook.casterAoe).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +caster aoe,?", "co -caster aoe,?", pButton.getName())
	end
	
	tFrame.addButton("Caster", 0, 52, "spell_nature_lightning", MultiBot.tips.shaman.playbook.caster).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +caster,?", "co -caster,?", pButton.getName())) then
			pButton.getButton("Melee").setDisable()
			pButton.getButton("Heal").setDisable()
		end
	end
	
	tFrame.addButton("MeleeAoe", 0, 78, "ability_warrior_shockwave", MultiBot.tips.shaman.playbook.meleeAoe).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +melee aoe,?", "co -melee aoe,?", pButton.getName())
	end
	
	tFrame.addButton("Melee", 0, 104, "ability_parry", MultiBot.tips.shaman.playbook.melee).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +melee,?", "co -melee,?", pButton.getName())) then
			pButton.getButton("Caster").setDisable()
			pButton.getButton("Heal").setDisable()
		end
	end
	
	-- STRATEGIES:PLAYBOOK --
	
	if(MultiBot.isInside(pCombat, "heal")) then pFrame.getButton("Heal").setEnable() end
	if(MultiBot.isInside(pCombat, "melee,")) then pFrame.getButton("Melee").setEnable() end
	if(MultiBot.isInside(pCombat, "totems")) then pFrame.getButton("Totems").setEnable() end
	if(MultiBot.isInside(pCombat, "caster,")) then pFrame.getButton("Caster").setEnable() end
	if(MultiBot.isInside(pCombat, "melee aoe")) then pFrame.getButton("MeleeAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "caster aoe")) then pFrame.getButton("CasterAoe").setEnable() end
	
	-- DPS --
	
	pFrame.addButton("DpsControl", -120, 0, "ability_warrior_challange", MultiBot.tips.shaman.dps.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("DpsControl"))
	end
	
	local tFrame = pFrame.addFrame("DpsControl", -122, 30)
	tFrame:Hide()
	
	tFrame.addButton("DpsAssist", 0, 0, "spell_holy_heroism", MultiBot.tips.shaman.dps.dpsAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps assist,?", "co -dps assist,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	tFrame.addButton("DpsAoe", 0, 26, "spell_holy_surgeoflight", MultiBot.tips.shaman.dps.dpsAoe).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps aoe,?", "co -dps aoe,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAssist").setDisable()
		end
	end
	
	-- ASSIST --
	
	pFrame.addButton("TankAssist", -150, 0, "ability_warrior_innerrage", MultiBot.tips.shaman.tankAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +tank assist,?", "co -tank assist,?", pButton.getName())) then
			pButton.getButton("DpsAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	-- STRATEGIES --
	
	if(MultiBot.isInside(pCombat, "dps aoe")) then pFrame.getButton("DpsAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "dps assist")) then pFrame.getButton("DpsAssist").setEnable() end
	if(MultiBot.isInside(pCombat, "tank assist")) then pFrame.getButton("TankAssist").setEnable() end
end