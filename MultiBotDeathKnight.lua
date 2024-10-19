MultiBot.tips.deathknight = {}
MultiBot.tips.deathknight.dps = {}
MultiBot.tips.deathknight.presence = {}

MultiBot.tips.deathknight.presence.master =
"姿态控制 |cffffffff\n"..
"此控制允许您选择、启用或禁用默认姿态。|r\n\n"..
"|cffff0000左键单击显示或隐藏选项|r\n"..
"|cff999999(执行命令: 系统)|r\n\n"..
"|cffff0000右键单击启用或禁用默认姿态。|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.deathknight.presence.unholy =
"邪恶姿态 |cffffffff\n"..
"启用邪恶姿态。|r\n\n"..
"|cffff0000左键单击启用邪恶姿态|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.deathknight.presence.frost =
"冰霜姿态 |cffffffff\n"..
"启用冰霜姿态。|r\n\n"..
"|cffff0000左键单击启用冰霜姿态|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.deathknight.presence.blood =
"鲜血姿态 |cffffffff\n"..
"启用鲜血姿态。|r\n\n"..
"|cffff0000左键单击启用鲜血姿态|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.deathknight.dps.master =
"DPS控制 |cffffffff\n"..
"在DPS控制中，您将找到一般的DPS策略。|r\n\n"..
"|cffff0000左键单击显示或隐藏DPS控制|r\n"..
"|cf9999999(执行命令: 机器人)|r";

MultiBot.tips.deathknight.dps.dpsAssist =
"DPS辅助 |cffffffff\n"..
"启用DPS辅助策略。\n"..
"DPS-AOE、DPS辅助和坦克辅助是互斥的。\n"..
"一次只能激活其中一种策略。|r\n\n"..
"|cffff0000左键单击启用或禁用DPS辅助|r\n"..
"|cf9999999(执行命令: 机器人)|r";

MultiBot.tips.deathknight.dps.dpsAoe =
"DPS-AOE |cffffffff\n"..
"启用DPS-AOE策略。\n"..
"DPS-AOE、DPS辅助和坦克辅助是互斥的。\n"..
"一次只能激活其中一种策略。|r\n\n"..
"|cffff0000左键单击启用或禁用DPS-AOE|r\n"..
"|cf9999999(执行命令: 机器人)|r";

MultiBot.tips.deathknight.tankAssist =
"坦克辅助 |cffffffff\n"..
"启用坦克辅助策略。\n"..
"DPS-AOE、DPS辅助和坦克辅助是互斥的。\n"..
"一次只能激活其中一种策略。|r\n\n"..
"|cffff0000左键单击启用或禁用坦克辅助|r\n"..
"|cf9999999(执行命令: 机器人)|r";

MultiBot.addDeathKnight = function(pFrame, pCombat, pNormal)
	local tButton = pFrame.addButton("Presence", 0, 0, "spell_deathknight_bloodpresence", MultiBot.tips.deathknight.presence.master).setDisable()
	tButton.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("Presence"))
	end
	
	local tFrame = pFrame.addFrame("Presence", -2, 30)
	tFrame:Hide()
	
	tFrame.addButton("Unholy", 0, 0, "spell_deathknight_unholypresence", MultiBot.tips.deathknight.presence.unholy)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "Presence", pButton.texture, "co +unholy,?", pButton.getName())
		pButton.getButton("Presence").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +unholy,?", "co -unholy,?", pButton.getName())
		end
	end
	
	tFrame.addButton("Frost", 0, 26, "spell_deathknight_frostpresence", MultiBot.tips.deathknight.presence.frost)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "Presence", pButton.texture, "co +frost,?", pButton.getName())
		pButton.getButton("Presence").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +frost,?", "co -frost,?", pButton.getName())
		end
	end
	
	tFrame.addButton("Blood", 0, 52, "spell_deathknight_bloodpresence", MultiBot.tips.deathknight.presence.blood)
	.doLeft = function(pButton)
		MultiBot.SelectToTarget(pButton.get(), "Presence", pButton.texture, "co +blood,?", pButton.getName())
		pButton.getButton("Presence").doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +blood,?", "co -blood,?", pButton.getName())
		end
	end
	
	-- SRATEGIES:PRESENCE ---
	
	if(MultiBot.isInside(pCombat, "unholy")) then
		tButton.setTexture("spell_deathknight_unholypresence").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +unholy,?", "co -unholy,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "frost")) then
		tButton.setTexture("spell_deathknight_frostpresence").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +frost,?", "co -frost,?", pButton.getName())
		end
	elseif(MultiBot.isInside(pCombat, "blood")) then
		tButton.setTexture("spell_deathknight_bloodpresence").setEnable().doRight = function(pButton)
			MultiBot.OnOffActionToTarget(pButton, "co +blood,?", "co -blood,?", pButton.getName())
		end
	end
	
	-- DPS --
	
	pFrame.addButton("DpsControl", -30, 0, "ability_warrior_challange", MultiBot.tips.deathknight.dps.master)
	.doLeft = function(pButton)
		MultiBot.ShowHideSwitch(pButton.getFrame("DpsControl"))
	end
	
	local tFrame = pFrame.addFrame("DpsControl", -32, 30)
	tFrame:Hide()
	
	tFrame.addButton("DpsAssist", 0, 0, "spell_holy_heroism", MultiBot.tips.deathknight.dps.dpsAssist).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps assist,?", "co -dps assist,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAoe").setDisable()
		end
	end
	
	tFrame.addButton("DpsAoe", 0, 26, "spell_holy_surgeoflight", MultiBot.tips.deathknight.dps.dpsAoe).setDisable()
	.doLeft = function(pButton)
		if(MultiBot.OnOffActionToTarget(pButton, "co +dps aoe,?", "co -dps aoe,?", pButton.getName())) then
			pButton.getButton("TankAssist").setDisable()
			pButton.getButton("DpsAssist").setDisable()
		end
	end
	
	-- ASSIST --
	
	pFrame.addButton("TankAssist", -60, 0, "ability_warrior_innerrage", MultiBot.tips.deathknight.tankAssist).setDisable()
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