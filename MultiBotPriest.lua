MultiBot.addPriest = function(pFrame, pCombat, pNormal)
	pFrame.addButton("Heal", 0, 0, "spell_holy_aspiration", MultiBot.tips.priest.heal).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +heal,?", "co -heal,?", pButton.getName())) then
			pButton.getButton("Shadow").setDisable()
			pButton.getButton("Dps").setDisable()
		end
	end
	
	-- BUFF --
	
	pFrame.addButton("Buff", -30, 0, "spell_holy_power", MultiBot.tips.priest.buff).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +buff,?", "co -buff,?", pButton.getName())
	end
	
	-- PLAYBOOK --
	
	pFrame.addButton("Playbook", -60, 0, "inv_misc_book_06", MultiBot.tips.priest.playbook.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("Playbook"))
	end
	
	local tFrame = pFrame.addFrame("Playbook", -62, 30)
	tFrame:Hide()
	
	tFrame.addButton("ShadowDebuff", 0, 0, "spell_shadow_demonicempathy", MultiBot.tips.priest.playbook.shadowDebuff).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +shadow debuff,?", "co -shadow debuff,?", pButton.getName())) then
			pButton.getButton("DpsDebuff").setEnable()
		else
			pButton.getButton("DpsDebuff").setDisable()
		end
	end
	
	tFrame.addButton("ShadowAoe", 0, 26, "spell_arcane_arcanetorrent", MultiBot.tips.priest.playbook.shadowAoe).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "co +shadow aoe,?", "co -shadow aoe,?", pButton.getName())
	end
	
	tFrame.addButton("Shadow", 0, 52, "spell_holy_devotion", MultiBot.tips.priest.playbook.shadow).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +shadow,?", "co -shadow,?", pButton.getName())) then
			pButton.getButton("Heal").setDisable()
			pButton.getButton("Dps").setEnable()
		else
			pButton.getButton("Dps").setDisable()
		end
	end
	
	-- DPS --
	
	pFrame.addButton("DpsControl", -90, 0, "ability_warrior_challange", MultiBot.tips.priest.dps.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("DpsControl"))
	end
	
	local tFrame = pFrame.addFrame("DpsControl", -92, 30)
	tFrame:Hide()
	
	tFrame.addButton("DpsAssist", 0, 0, "spell_holy_heroism", MultiBot.tips.priest.dps.dpsAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +healer dps,?", "co -healer dps,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	tFrame.addButton("DpsDebuff", 0, 26, "spell_holy_restoration", MultiBot.tips.priest.dps.dpsDebuff).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +shadow debuff,?", "co -shadow debuff,?", pButton.getName())) then
			pButton.getButton("ShadowDebuff").setEnable()
		else
			pButton.getButton("ShadowDebuff").setDisable()
		end
	end
	
	tFrame.addButton("DpsAoe", 0, 52, "spell_holy_surgeoflight", MultiBot.tips.priest.dps.dpsAoe).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps aoe,?", "co -dps aoe,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAssist").setDisable()
		end
	end
	
	tFrame.addButton("Dps", 0, 78, "spell_holy_divinepurpose", MultiBot.tips.priest.dps.dps).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +shadow,?", "co -shadow,?", pButton.getName())) then
			pButton.getButton("Shadow").setEnable()
			pButton.getButton("Heal").setDisable()
		else
			pButton.getButton("Shadow").setDisable()
		end
	end
	
	-- ASSIST --
	
	pFrame.addButton("TankAssist", -120, 0, "ability_warrior_innerrage", MultiBot.tips.priest.tankAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +tank assist,?", "co -tank assist,?", pButton.getName())) then
			pButton.getButton("DpsAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	-- STRATEGIES --
	
	if(MultiBot.isInside(pCombat, "heal")) then pFrame.getButton("Heal").setEnable() end
	if(MultiBot.isInside(pNormal, "buff,")) then pFrame.getButton("Buff").setEnable() end
	if(MultiBot.isInside(pCombat, "shadow debuff")) then pFrame.getButton("ShadowDebuff").setEnable() end
	if(MultiBot.isInside(pCombat, "shadow aoe")) then pFrame.getButton("ShadowAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "shadow,")) then pFrame.getButton("Shadow").setEnable() end
	if(MultiBot.isInside(pCombat, "healer dps")) then pFrame.getButton("DpsAssist").setEnable() end
	if(MultiBot.isInside(pCombat, "shadow debuff")) then pFrame.getButton("DpsDebuff").setEnable() end
	if(MultiBot.isInside(pCombat, "dps aoe")) then pFrame.getButton("DpsAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "shadow,")) then pFrame.getButton("Shadow").setEnable() end
	if(MultiBot.isInside(pCombat, "tank assist")) then pFrame.getButton("TankAssist").setEnable() end
end