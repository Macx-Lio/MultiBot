MultiBot.addMage = function(pFrame, pCombat, pNormal)
	local tButton = pFrame.addButton("Buff", 0, 0, "inv_elemental_primal_mana", MultiBot.tips.mage.buff.master)
	tButton.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.parent.frames["Buff"])
	end
	
	local tFrame = pFrame.addFrame("Buff", -2, 30)
	tFrame:Hide()
	
	tFrame.addButton("NonCombatMana", 0, 0, "inv_elemental_primal_mana", MultiBot.tips.mage.buff.bmana)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "Buff", pButton.texture, "nc +bmana,?", pButton.getName())
		pButton.getButton("Buff").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bmana,?", "nc -bmana,?", pButton.getName())
		end
	end
	
	tFrame.addButton("NonCombatDps", 0, 26, "inv_elemental_primal_nether", MultiBot.tips.mage.buff.bdps)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "Buff", pButton.texture, "nc +bdps,?", pButton.getName())
		pButton.getButton("Buff").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bdps,?", "nc -bdps,?", pButton.getName())
		end
	end
	
	-- STRATEGIES:BUFF --
	
	if(MultiBot.isInside(pNormal, "bmana")) then
		tButton.setTexture("inv_elemental_primal_mana").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bmana,?", "nc -bmana,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "bdps")) then
		tButton.setTexture("inv_elemental_primal_nether").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bdps,?", "nc -bdps,?", pButton.getName())
		end
	end
	
	-- PLAYBOOK --
	
	pFrame.addButton("Playbook", -30, 0, "inv_misc_book_06", MultiBot.tips.mage.playbook.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("Playbook"))
	end
	
	tFrame = pFrame.addFrame("Playbook", -32, 30)
	tFrame:Hide()
	
	tFrame.addButton("ArcaneAoe", 0, 0, "spell_arcane_starfire", MultiBot.tips.mage.playbook.arcaneAoe).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +arcane aoe,?", "co -arcane aoe,?", pButton.getName())
	end
	
	tFrame.addButton("Arcane", 0, 26, "ability_mage_arcanebarrage", MultiBot.tips.mage.playbook.arcane).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +arcane,?", "co -arcane,?", pButton.getName())) then
			pButton.getButton("Frost").setDisable()
			pButton.getButton("Fire").setDisable()
		end
	end
	
	tFrame.addButton("FrostAoe", 0, 52, "spell_frost_freezingbreath", MultiBot.tips.mage.playbook.frostAoe).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +frost aoe,?", "co -frost aoe,?", pButton.getName())
	end
	
	tFrame.addButton("Frost", 0, 78, "spell_frost_frostbolt02", MultiBot.tips.mage.playbook.frost).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +frost,?", "co -frost,?", pButton.getName())) then
			pButton.getButton("Arcane").setDisable()
			pButton.getButton("Fire").setDisable()
		end
	end
	
	tFrame.addButton("FireAoe", 0, 104, "spell_shadow_rainoffire", MultiBot.tips.mage.playbook.fireAoe).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +fire aoe,?", "co -fire aoe,?", pButton.getName())
	end
	
	tFrame.addButton("Fire", 0, 130, "spell_fire_fireball02", MultiBot.tips.mage.playbook.fire).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +fire,?", "co -fire,?", pButton.getName())) then
			pButton.getButton("Arcane").setDisable()
			pButton.getButton("Frost").setDisable()
		end
	end
	
	-- STRATEGIES:PLAYBOOK --
	
	if(MultiBot.isInside(pCombat, "arcane aoe")) then pFrame.getButton("ArcaneAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "arcane,")) then pFrame.getButton("Arcane").setEnable() end
	if(MultiBot.isInside(pCombat, "frost aoe")) then pFrame.getButton("FrostAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "frost,")) then pFrame.getButton("Frost").setEnable() end
	if(MultiBot.isInside(pCombat, "fire aoe")) then pFrame.getButton("FireAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "fire,")) then pFrame.getButton("Fire").setEnable() end
	
	-- DPS --
	
	pFrame.addButton("DpsControl", -60, 0, "ability_warrior_challange", MultiBot.tips.mage.dps.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("DpsControl"))
	end
	
	local tFrame = pFrame.addFrame("DpsControl", -62, 30)
	tFrame:Hide()
	
	tFrame.addButton("DpsAssist", 0, 0, "spell_holy_heroism", MultiBot.tips.mage.dps.dpsAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps assist,?", "co -dps assist,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	tFrame.addButton("DpsAoe", 0, 26, "spell_holy_surgeoflight", MultiBot.tips.mage.dps.dpsAoe).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps aoe,?", "co -dps aoe,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAssist").setDisable()
		end
	end
	
	-- ASSIST --
	
	pFrame.addButton("TankAssist", -90, 0, "ability_warrior_innerrage", MultiBot.tips.mage.tankAssist).setDisable()
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