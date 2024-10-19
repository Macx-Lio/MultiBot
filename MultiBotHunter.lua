MultiBot.tips.hunter = {}
MultiBot.tips.hunter.dps = {}
MultiBot.tips.hunter.naspect = {}
MultiBot.tips.hunter.caspect = {}

MultiBot.tips.hunter.naspect.master =
"非战斗增益|cffffffff\n"..
"此控制允许您选择、启用或禁用默认的非战斗增益。|r\n\n"..
"|cffff0000左键单击以显示或隐藏选项|r\n"..
"|cff999999(执行命令: 系统)|r\n\n"..
"|cffff0000右键单击以启用或禁用默认增益。|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.naspect.rnature =
"自然抗性增益|cffffffff\n"..
"它启用自然抗性增益作为非战斗增益。|r\n\n"..
"|cffff0000左键单击以启用自然抗性增益|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.naspect.bmana =
"法力增益|cffffffff\n"..
"它启用法力增益作为非战斗增益。|r\n\n"..
"|cffff0000左键单击以启用法力增益|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.naspect.bdps =
"DPS增益|cffffffff\n"..
"它启用DPS增益作为非战斗增益。|r\n\n"..
"|cffff0000左键单击以启用DPS增益|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.caspect.master =
"战斗增益|cffffffff\n"..
"此控制允许您选择、启用或禁用默认的战斗增益。|r\n\n"..
"|cffff0000左键单击以显示或隐藏选项|r\n"..
"|cff999999(执行命令: 系统)|r\n\n"..
"|cffff0000右键单击以启用或禁用默认增益。|r\n"..
"|cff999999(执行命令: 机器人)|r";

-- 猎人战斗方面增益

MultiBot.tips.hunter.caspect.rnature =
"自然抗性增益|cffffffff\n" ..
"它启用自然抗性增益作为战斗增益。|r\n\n" ..
"|cffff0000左键单击以启用自然抗性增益|r\n" ..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.caspect.bmana =
"法力增益|cffffffff\n" ..
"它启用法力增益作为战斗增益。|r\n\n" ..
"|cffff0000左键单击以启用法力增益|r\n" ..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.caspect.bdps =
"DPS增益|cffffffff\n" ..
"它启用DPS增益作为战斗增益。|r\n\n" ..
"|cffff0000左键单击以启用DPS增益|r\n" ..
"|cff999999(执行命令: 机器人)|r";

-- 猎人 伤害输出 (DPS) 控制

MultiBot.tips.hunter.dps.master =
"伤害输出控制 |cffffffff\n" ..
"在伤害输出控制中，您将找到常规的伤害输出策略。|r\n\n" ..
"|cffff0000左键单击以显示或隐藏伤害输出控制|r\n" ..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.dps.dpsAssist =
"伤害输出辅助 |cffffffff\n" ..
"它启用伤害输出辅助策略。\n" ..
"伤害输出-AOE、伤害输出-辅助和坦克-辅助互斥。\n" ..
"只能激活其中之一的策略。|r\n\n" ..
"|cffff0000左键单击以启用或禁用伤害输出辅助|r\n" ..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.dps.dpsDebuff =
"伤害输出减益 |cffffffff\n" ..
"它启用减益策略。|r\n\n" ..
"|cffff0000左键单击以启用或禁用伤害输出减益|r\n" ..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.dps.dpsAoe = 
"伤害输出-AOE|cffffffff\n"..
"它启用伤害输出-AOE策略。\n"..
"伤害输出-AOE、伤害输出-辅助和坦克-辅助互斥。\n"..
"只能激活其中之一的策略。|r\n\n"..
"|cffff0000左键单击以启用或禁用伤害输出-AOE|r\n"..
"|cf9999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.dps.dps = 
"伤害输出|cffffffff\n"..
"它启用伤害输出策略。|r\n\n"..
"|cffff0000左键单击以启用或禁用伤害输出|r\n"..
"|cf9999999(执行命令: 机器人)|r";

MultiBot.tips.hunter.tankAssist = 
"坦克-辅助|cffffffff\n"..
"它启用坦克-辅助策略。\n"..
"伤害输出-AOE、伤害输出-辅助和坦克-辅助互斥。\n"..
"只能激活其中之一的策略。|r\n\n"..
"|cffff0000左键单击以启用或禁用坦克-辅助|r\n"..
"|cf9999999(执行命令: 机器人)|r";

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