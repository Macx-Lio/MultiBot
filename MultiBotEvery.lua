MultiBot.tips.every = {}

MultiBot.tips.every.summon =
"召唤 |cffffffff\n"..
"将此机器人召唤到你的位置。|r\n\n"..
"|cffff0000左键单击召唤机器人|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.every.uninvite =
"踢出 |cffffffff\n"..
"将此机器人从你的队伍中移除。|r\n\n"..
"|cffff0000左键单击踢出机器人|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.every.invite =
"邀请 |cffffffff\n"..
"邀请此机器人加入你的队伍。|r\n\n"..
"|cffff0000左键单击邀请机器人|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.every.food =
"食物 |cffffffff\n"..
"启用或禁用进食策略。|r\n\n"..
"|cffff0000左键单击允许进食|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.every.loot =
"拾取 |cffffffff\n"..
"启用或禁用拾取策略。|r\n\n"..
"|cffff0000左键单击允许拾取|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.every.gather =
"采集 |cffffffff\n"..
"启用或禁用采集策略。|r\n\n"..
"|cffff0000左键单击允许采集|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.every.inventory =
"背包 |cffffffff\n"..
"打开或关闭此机器人的背包。|r\n\n"..
"|cffff0000左键单击打开或关闭背包|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.tips.every.spellbook =
"法术书 |cffffffff\n"..
"打开或关闭此机器人的法术书。\n"..
"左键单击法术立即施放。\n"..
"右键单击法术可以将宏添加到你的技能栏。|r\n\n"..
"|cffff0000左键单击打开或关闭法术书|r\n"..
"|cff999999(执行命令: 机器人)|r";

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