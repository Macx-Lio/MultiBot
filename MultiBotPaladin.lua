MultiBot.addPaladin = function(pFrame, pCombat, pNormal)
	pFrame.addButton("Heal", 0, 0, "spell_holy_aspiration", MultiBot.tips.paladin.heal).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +heal,?", "co -heal,?", pButton.getName())) then
			pButton.getButton("Tank").setDisable()
			pButton.getButton("Dps").setDisable()
		end
	end
	
	-- SEAL --
	
	local tButton = pFrame.addButton("Seal", -30, 0, "spell_holy_healingaura", MultiBot.tips.paladin.seal.master)
	tButton.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.parent.frames["Seal"])
	end
	
	local tFrame = pFrame.addFrame("Seal", -32, 30)
	tFrame:Hide()
	
	tFrame.addButton("SealHealth", 0, 0, "spell_holy_healingaura", MultiBot.tips.paladin.seal.bhealth)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "Seal", pButton.texture, "nc +bhealth,?", pButton.getName())
		pButton.getButton("Seal").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bhealth,?", "nc -bhealth,?", pButton.getName())
		end
	end
	
	tFrame.addButton("SealMana", 0, 26, "spell_holy_sealofwisdom", MultiBot.tips.paladin.seal.bmana)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "Seal", pButton.texture, "nc +bmana,?", pButton.getName())
		pButton.getButton("Seal").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bmana,?", "nc -bmana,?", pButton.getName())
		end
	end
	
	tFrame.addButton("SealStats", 0, 52, "spell_magic_magearmor", MultiBot.tips.paladin.seal.bstats)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "Seal", pButton.texture, "nc +bstats,?", pButton.getName())
		pButton.getButton("Seal").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bstats,?", "nc -bstats,?", pButton.getName())
		end
	end
	
	tFrame.addButton("SealDps", 0, 78, "inv_hammer_01", MultiBot.tips.paladin.seal.bdps)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "Seal", pButton.texture, "nc +bdps,?", pButton.getName())
		pButton.getButton("Seal").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bdps,?", "nc -bdps,?", pButton.getName())
		end
	end
	
	-- STRATEGIES:SEAL --
	
	if(MultiBot.isInside(pNormal, "bhealth")) then
		tButton.setTexture("spell_holy_healingaura").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bhealth,?", "nc -bhealth,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "bmana")) then
		tButton.setTexture("spell_holy_sealofwisdom").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bmana,?", "nc -bmana,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "bstats")) then
		tButton.setTexture("spell_magic_magearmor").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bstats,?", "nc -bstats,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "bdps")) then
		tButton.setTexture("inv_hammer_01").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bdps,?", "nc -bdps,?", pButton.getName())
		end
	end
	
	-- NON-COMBAT-AURA --
	
	local tButton = pFrame.addButton("NonCombatAura", -60, 0, "spell_holy_crusaderaura", MultiBot.tips.paladin.naura.master)
	tButton.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.parent.frames["NonCombatAura"])
	end
	
	local tFrame = pFrame.addFrame("NonCombatAura", -62, 30)
	tFrame:Hide()
	
	tFrame.addButton("NonCombatSpeed", 0, 0, "spell_holy_crusaderaura", MultiBot.tips.paladin.naura.bspeed)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatAura", pButton.texture, "nc +bspeed,?", pButton.getName())
		pButton.getButton("NonCombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bspeed,?", "nc -bspeed,?", pButton.getName())
		end
	end
	
	tFrame.addButton("NonCombatFire", 0, 26, "spell_fire_sealoffire", MultiBot.tips.paladin.naura.rfire)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatAura", pButton.texture, "nc +rfire,?", pButton.getName())
		pButton.getButton("NonCombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +rfire,?", "nc -rfire,?", pButton.getName())
		end
	end
	
	tFrame.addButton("NonCombatFrost", 0, 52, "spell_frost_wizardmark", MultiBot.tips.paladin.naura.rfrost)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatAura", pButton.texture, "nc +rfrost,?", pButton.getName())
		pButton.getButton("NonCombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +rfrost,?", "nc -rfrost,?", pButton.getName())
		end
	end
	
	tFrame.addButton("NonCombatShadow", 0, 78, "spell_shadow_sealofkings", MultiBot.tips.paladin.naura.rshadow)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatAura", pButton.texture, "nc +rshadow,?", pButton.getName())
		pButton.getButton("NonCombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +rshadow,?", "nc -rshadow,?", pButton.getName())
		end
	end
	
	tFrame.addButton("NonCombatDamage", 0, 104, "spell_holy_auraoflight", MultiBot.tips.paladin.naura.baoe)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatAura", pButton.texture, "nc +baoe,?", pButton.getName())
		pButton.getButton("NonCombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +baoe,?", "nc -baoe,?", pButton.getName())
		end
	end
	
	tFrame.addButton("NonCombatArmor", 0, 130, "spell_holy_devotionaura", MultiBot.tips.paladin.naura.barmor)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatAura", pButton.texture, "nc +barmor,?", pButton.getName())
		pButton.getButton("NonCombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +barmor,?", "nc -barmor,?", pButton.getName())
		end
	end
	
		tFrame.addButton("NonCombatCast", 0, 156, "spell_holy_mindsooth", MultiBot.tips.paladin.naura.bcast)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "NonCombatAura", pButton.texture, "nc +bcast,?", pButton.getName())
		pButton.getButton("NonCombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bcast,?", "nc -bcast,?", pButton.getName())
		end
	end
	
	-- STRATEGIES:NON-COMBAT-AURA --
	
	if(MultiBot.isInside(pNormal, "bspeed")) then
		tButton.setTexture("spell_holy_crusaderaura").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bspeed,?", "nc -bspeed,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "rfire")) then
		tButton.setTexture("spell_fire_sealoffire").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +rfire,?", "nc -rfire,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "rfrost")) then
		tButton.setTexture("spell_frost_wizardmark").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +rfrost,?", "nc -rfrost,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "rshadow")) then
		tButton.setTexture("spell_shadow_sealofkings").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +rshadow,?", "nc -rshadow,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "baoe")) then
		tButton.setTexture("spell_holy_auraoflight").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +baoe,?", "nc -baoe,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "barmor")) then
		tButton.setTexture("spell_holy_devotionaura").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +barmor,?", "nc -barmor,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pNormal, "bcast")) then
		tButton.setTexture("spell_holy_mindsooth").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "nc +bcast,?", "nc -bcast,?", pButton.getName())
		end
	end
	
	-- COMBAT-AURA --
	
	local tButton = pFrame.addButton("CombatAura", -90, 0, "spell_holy_crusaderaura", MultiBot.tips.paladin.caura.master)
	tButton.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.parent.frames["CombatAura"])
	end
	
	local tFrame = pFrame.addFrame("CombatAura", -92, 30)
	tFrame:Hide()
	
	tFrame.addButton("CombatSpeed", 0, 0, "spell_holy_crusaderaura", MultiBot.tips.paladin.caura.bspeed)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatAura", pButton.texture, "co +bspeed,?", pButton.getName())
		pButton.getButton("CombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bspeed,?", "co -bspeed,?", pButton.getName())
		end
	end
	
	tFrame.addButton("CombatFire", 0, 26, "spell_fire_sealoffire", MultiBot.tips.paladin.caura.rfire)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatAura", pButton.texture, "co +rfire,?", pButton.getName())
		pButton.getButton("CombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +rfire,?", "co -rfire,?", pButton.getName())
		end
	end
	
	tFrame.addButton("CombatFrost", 0, 52, "spell_frost_wizardmark", MultiBot.tips.paladin.caura.rfrost)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatAura", pButton.texture, "co +rfrost,?", pButton.getName())
		pButton.getButton("CombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +rfrost,?", "co -rfrost,?", pButton.getName())
		end
	end
	
	tFrame.addButton("CombatShadow", 0, 78, "spell_shadow_sealofkings", MultiBot.tips.paladin.caura.rshadow)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatAura", pButton.texture, "co +rshadow,?", pButton.getName())
		pButton.getButton("CombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +rshadow,?", "co -rshadow,?", pButton.getName())
		end
	end
	
	tFrame.addButton("CombatDamage", 0, 104, "spell_holy_auraoflight", MultiBot.tips.paladin.caura.baoe)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatAura", pButton.texture, "co +baoe,?", pButton.getName())
		pButton.getButton("CombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +baoe,?", "co -baoe,?", pButton.getName())
		end
	end
	
	tFrame.addButton("CombatArmor", 0, 130, "spell_holy_devotionaura", MultiBot.tips.paladin.caura.barmor)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatAura", pButton.texture, "co +barmor,?", pButton.getName())
		pButton.getButton("CombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +barmor,?", "co -barmor,?", pButton.getName())
		end
	end
	
		tFrame.addButton("CombatCast", 0, 156, "spell_holy_mindsooth", MultiBot.tips.paladin.caura.bcast)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "CombatAura", pButton.texture, "co +bcast,?", pButton.getName())
		pButton.getButton("CombatAura").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bcast,?", "co -bcast,?", pButton.getName())
		end
	end
	
	-- STRATEGIES:COMBAT-AURA --
	
	if(MultiBot.isInside(pCombat, "bspeed")) then
		tButton.setTexture("spell_holy_crusaderaura").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bspeed,?", "co -bspeed,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "rfire")) then
		tButton.setTexture("spell_fire_sealoffire").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +rfire,?", "co -rfire,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "rfrost")) then
		tButton.setTexture("spell_frost_wizardmark").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +rfrost,?", "co -rfrost,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "rshadow")) then
		tButton.setTexture("spell_shadow_sealofkings").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +rshadow,?", "co -rshadow,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "baoe")) then
		tButton.setTexture("spell_holy_auraoflight").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +baoe,?", "co -baoe,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "barmor")) then
		tButton.setTexture("spell_holy_devotionaura").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +barmor,?", "co -barmor,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "bcast")) then
		tButton.setTexture("spell_holy_mindsooth").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +bcast,?", "co -bcast,?", pButton.getName())
		end
	end
	
	-- DPS --
	
	pFrame.addButton("DpsControl", -120, 0, "ability_warrior_challange", MultiBot.tips.paladin.dps.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("DpsControl"))
	end
	
	local tFrame = pFrame.addFrame("DpsControl", -122, 30)
	tFrame:Hide()
	
	tFrame.addButton("DpsAssist", 0, 0, "spell_holy_heroism", MultiBot.tips.paladin.dps.dpsAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps assist,?", "co -dps assist,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	tFrame.addButton("DpsAoe", 0, 26, "spell_holy_surgeoflight", MultiBot.tips.paladin.dps.dpsAoe).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps aoe,?", "co -dps aoe,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAssist").setDisable()
		end
	end
	
	tFrame.addButton("Dps", 0, 52, "spell_holy_divinepurpose", MultiBot.tips.paladin.dps.dps).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps,?", "co -dps,?", pButton.getName())) then
			pButton.getButton("Heal").setDisable()
			pButton.getButton("Tank").setDisable()
		end
	end
	
	-- ASSIST --
	
	pFrame.addButton("TankAssist", -150, 0, "ability_warrior_innerrage", MultiBot.tips.paladin.tankAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +tank assist,?", "co -tank assist,?", pButton.getName())) then
			pButton.getButton("DpsAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	-- TANK --
	
	pFrame.addButton("Tank", -180, 0, "ability_warrior_shieldmastery", MultiBot.tips.paladin.tank).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +tank,?", "co -tank,?", pButton.getName())) then
			pButton.getButton("Heal").setDisable()
			pButton.getButton("Dps").setDisable()
		end
	end
	
	-- STRATEGIES --
	
	if(MultiBot.isInside(pCombat, "dps,")) then pFrame.getButton("Dps").setEnable() end
	if(MultiBot.isInside(pCombat, "heal")) then pFrame.getButton("Heal").setEnable() end
	if(MultiBot.isInside(pCombat, "tank,")) then pFrame.getButton("Tank").setEnable() end
	if(MultiBot.isInside(pCombat, "dps aoe")) then pFrame.getButton("DpsAoe").setEnable() end
	if(MultiBot.isInside(pCombat, "dps assist")) then pFrame.getButton("DpsAssist").setEnable() end
	if(MultiBot.isInside(pCombat, "tank assist")) then pFrame.getButton("TankAssist").setEnable() end
end