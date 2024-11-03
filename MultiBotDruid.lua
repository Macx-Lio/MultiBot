MultiBot.addDruid = function(pFrame, pCombat, pNormal)
	pFrame.addButton("Heal", 0, 0, "spell_holy_aspiration", MultiBot.tips.druid.heal).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +heal,?", "co -heal,?", pButton.getName())) then
			pButton.getButton("Caster").setDisable()
			pButton.getButton("Tank").setDisable()
			pButton.getButton("Bear").setDisable()
			pButton.getButton("Cat").setDisable()
			pButton.getButton("Dps").setDisable()
		end
	end
	
	-- BUFF --
	
	pFrame.addButton("Buff", -30, 0, "spell_holy_power", MultiBot.tips.druid.buff).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "nc +buff,?", "nc -buff,?", pButton.getName())
	end
	
	-- PLAYBOOK --
	
	pFrame.addButton("Playbook", -60, 0, "inv_misc_book_06", MultiBot.tips.druid.playbook.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("Playbook"))
	end
	
	local tFrame = pFrame.addFrame("Playbook", -62, 30)
	tFrame:Hide()
	
	tFrame.addButton("CasterDebuff", 0, 0, "ability_druid_cower", MultiBot.tips.druid.playbook.casterDebuff).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +caster debuff,?", "co -caster debuff,?", pButton.getName())) then
			pButton.getButton("DpsDebuff").setEnable()
		else
			pButton.getButton("DpsDebuff").setDisable()
		end
	end
	
	tFrame.addButton("CasterAoe", 0, 26, "spell_arcane_starfire", MultiBot.tips.druid.playbook.casterAoe).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +caster aoe,?", "co -caster aoe,?", pButton.getName())
	end
	
	tFrame.addButton("Caster", 0, 52, "spell_nature_starfall", MultiBot.tips.druid.playbook.caster).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +caster,?", "co -caster,?", pButton.getName())) then
			pButton.getButton("Heal").setDisable()
			pButton.getButton("Tank").setDisable()
			pButton.getButton("Bear").setDisable()
			pButton.getButton("Cat").setDisable()
			pButton.getButton("Dps").setDisable()
		end
	end
	
	tFrame.addButton("CatAoe", 0, 78, "ability_druid_bash", MultiBot.tips.druid.playbook.catAoe).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +cat aoe,?", "co -cat aoe,?", pButton.getName())
	end
	
	tFrame.addButton("Cat", 0, 104, "ability_druid_catform", MultiBot.tips.druid.playbook.cat).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +cat,?", "co -cat,?", pButton.getName())) then
			pButton.getButton("Caster").setDisable()
			pButton.getButton("Heal").setDisable()
			pButton.getButton("Tank").setDisable()
			pButton.getButton("Bear").setDisable()
			pButton.getButton("Dps").setEnable()
		else
			pButton.getButton("Dps").setDisable()
		end
	end
	
	tFrame.addButton("Bear", 0, 130, "ability_racial_bearform", MultiBot.tips.druid.playbook.bear).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +bear,?", "co -bear,?", pButton.getName())) then
			pButton.getButton("Caster").setDisable()
			pButton.getButton("Heal").setDisable()
			pButton.getButton("Cat").setDisable()
			pButton.getButton("Dps").setDisable()
			pButton.getButton("Tank").setEnable()
		else
			pButton.getButton("Tank").setDisable()
		end
	end
	
	-- DPS --
	
	pFrame.addButton("DpsControl", -90, 0, "ability_warrior_challange", MultiBot.tips.druid.dps.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("DpsControl"))
	end
	
	local tFrame = pFrame.addFrame("DpsControl", -92, 30)
	tFrame:Hide()
	
	tFrame.addButton("DpsAssist", 0, 0, "spell_holy_heroism", MultiBot.tips.druid.dps.dpsAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps assist,?", "co -dps assist,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	tFrame.addButton("DpsDebuff", 0, 26, "spell_holy_restoration", MultiBot.tips.druid.dps.dpsDebuff).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +caster debuff,?", "co -caster debuff,?", pButton.getName())) then
			pButton.getButton("CasterDebuff").setEnable()
		else
			pButton.getButton("CasterDebuff").setDisable()
		end
	end
	
	tFrame.addButton("DpsAoe", 0, 52, "spell_holy_surgeoflight", MultiBot.tips.druid.dps.dpsAoe).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps aoe,?", "co -dps aoe,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAssist").setDisable()
		end
	end
	
	tFrame.addButton("Dps", 0, 78, "spell_holy_divinepurpose", MultiBot.tips.druid.dps.dps).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +cat,?", "co -cat,?", pButton.getName())) then
			pButton.getButton("Caster").setDisable()
			pButton.getButton("Tank").setDisable()
			pButton.getButton("Bear").setDisable()
			pButton.getButton("Cat").setEnable()
		else
			pButton.getButton("Cat").setDisable()
		end
	end
	
	-- ASSIST --
	
	pFrame.addButton("TankAssist", -120, 0, "ability_warrior_innerrage", MultiBot.tips.druid.tankAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +tank assist,?", "co -tank assist,?", pButton.getName())) then
			pButton.getButton("DpsAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	-- TANK --
	
	pFrame.addButton("Tank", -150, 0, "ability_warrior_shieldmastery", MultiBot.tips.druid.tank).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +tank,?", "co -tank,?", pButton.getName())) then
			pButton.getButton("Caster").setDisable()
			pButton.getButton("Heal").setDisable()
			pButton.getButton("Dps").setDisable()
			pButton.getButton("Cat").setDisable()
			pButton.getButton("Bear").setEnable()
		else
			pButton.getButton("Bear").setDisable()
		end
	end
	
	-- STRATEGIES --
	
	if(MultiBot.isInside(pCombat, "heal")) then pFrame.getButton("Heal").setEnable() end
	if(MultiBot.isInside(pNormal, "buff,")) then pFrame.getButton("Buff").setEnable() end
	if(MultiBot.isInside(pCombat, "caster debuff")) then pFrame.getButton("CasterDebuff").setEnable() end
	if(MultiBot.isInside(pCombat, "caster aoe")) then pFrame.getButton("CasterAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "caster,")) then pFrame.getButton("Caster").setEnable() end
	if(MultiBot.isInside(pCombat, "cat aoe")) then pFrame.getButton("CatAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "cat,")) then pFrame.getButton("Cat").setEnable() end
	if(MultiBot.isInside(pCombat, "bear")) then pFrame.getButton("Bear").setEnable() end
	if(MultiBot.isInside(pCombat, "dps assist")) then pFrame.getButton("DpsAssist").setEnable() end
	if(MultiBot.isInside(pCombat, "dps aoe")) then pFrame.getButton("DpsAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "cat,")) then pFrame.getButton("Dps").setEnable() end
	if(MultiBot.isInside(pCombat, "tank assist")) then pFrame.getButton("TankAssist").setEnable() end
	if(MultiBot.isInside(pCombat, "bear,")) then pFrame.getButton("Tank").setEnable() end
end