-- MULTIBAR --

local tMultiBar = MultiBot.addFrame("MultiBar", -262, 144, 36)
tMultiBar:SetMovable(true)

-- LEFT --

local tLeft = tMultiBar.addFrame("Left", -76, 2, 32)

-- TANKER --

MultiBot.tips.tanker = {}
MultiBot.tips.tanker.master = 
"坦克攻击\n|cffffffff"..
"按此按钮坦克开始攻击你的目标.\n"..
"执行命令时显示命令的接收者。|r\n\n"..
"|cffff0000左键点击执行 坦克攻击|r\n"..
"|cff999999(执行命令: 团队, 小队)|r";

tLeft.addButton("坦克", -238, 0, "ability_warrior_shieldbash", MultiBot.tips.tanker.master)
.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@tank do attack my target") end
end

-- ATTACK --

MultiBot.tips.attack = {}
MultiBot.tips.attack.master = 
"攻击控制\n|cffffffff".. 
"使用此控制，您可以发出攻击命令。\n".. 
"右键点击选项来定义新的默认动作。\n".. 
"执行命令时显示命令的接收者。|r\n\n".. 
"|cffff0000左键点击执行默认动作|r\n".. 
"|cff999999(执行命令: 团队, 队伍)|r\n\n".. 
"|cffff0000右键点击显示或隐藏选项|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.attack.attack = 
"攻击\n|cffffffff".. 
"使用此命令，整个团队或小队将开始攻击你的目标。|r\n\n".. 
"|cffff0000左键点击执行攻击|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.attack.ranged = 
"远程攻击\n|cffffffff".. 
"使用此命令，远程攻击者将开始攻击你的目标。|r\n\n".. 
"|cffff0000左键点击执行远程攻击|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.attack.melee = 
"近战攻击\n|cffffffff".. 
"使用此命令，近战攻击者将开始攻击你的目标。|r\n\n".. 
"|cffff0000左键点击执行近战攻击|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";


MultiBot.tips.attack.healer = 
"治疗攻击\n|cffffffff".. 
"使用此命令，治疗者将开始攻击你的目标。|r\n\n".. 
"|cffff0000左键点击执行治疗攻击|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.attack.dps = 
"DPS攻击\n|cffffffff".. 
"使用此命令，DPS将开始攻击你的目标。|r\n\n".. 
"|cffff0000左键点击执行DPS攻击|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.attack.tank = 
"坦克攻击\n|cffffffff".. 
"使用此命令，坦克将开始攻击你的目标。|r\n\n".. 
"|cffff0000左键点击执行坦克攻击|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";


local tButton = tLeft.addButton("Attack", -204, 0, "Interface\\AddOns\\MultiBot\\Icons\\attack.blp", MultiBot.tips.attack.master)
tButton.doRight = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Attack"])
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("do attack my target") end
end

local tAttack = tLeft.addFrame("Attack", -206, 34)
tAttack:Hide()

local tButton = tAttack.addButton("Attack", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\attack.blp", MultiBot.tips.attack.attack)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("do attack my target") end
end

local tButton = tAttack.addButton("Ranged", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\attack_ranged.blp", MultiBot.tips.attack.ranged)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "@ranged do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@ranged do attack my target") end
end

local tButton = tAttack.addButton("Melee", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\attack_melee.blp", MultiBot.tips.attack.melee)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "@melee do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@melee do attack my target") end
end

local tButton = tAttack.addButton("Healer", 0, 90, "Interface\\AddOns\\MultiBot\\Icons\\attack_healer.blp", MultiBot.tips.attack.healer)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "@healer do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@healer do attack my target") end
end

local tButton = tAttack.addButton("Dps", 0, 120, "Interface\\AddOns\\MultiBot\\Icons\\attack_dps.blp", MultiBot.tips.attack.dps)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "@dps do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@dps do attack my target") end
end

local tButton = tAttack.addButton("Tank", 0, 150, "Interface\\AddOns\\MultiBot\\Icons\\attack_tank.blp", MultiBot.tips.attack.tank)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButtonWithTarget(pButton.parent.parent, "Attack", pButton.texture, "@tank do attack my target")
end
tButton.doLeft = function(pButton)
	if(MultiBot.isTarget()) then MultiBot.ActionToGroup("@tank do attack my target") end
end

-- MODE --

MultiBot.tips.mode = {}
MultiBot.tips.mode.master = 
"模式控制\n|cffffffff".. 
"此控制允许你开启或关闭战斗模式。\n".. 
"左键点击选项可选择另一种战斗模式。\n".. 
"执行命令时显示命令的接收者。|r\n\n".. 
"|cffff0000左键点击切换战斗模式|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击显示或隐藏选项|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.mode.passive = 
"被动模式\n|cffffffff".. 
"在被动模式下，你的机器人不会攻击任何对手。\n".. 
"此模式在拉怪时防止坦克冲向敌人时非常有用。|r\n\n".. 
"|cffff0000左键点击选择并激活被动模式|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";

MultiBot.tips.mode.grind = 
"打怪模式\n|cffffffff".. 
"在打怪模式下，你的机器人会随机攻击每个对手。\n".. 
"当你遭遇过多敌人攻击时，此模式非常有用。|r\n\n".. 
"|cffff0000左键点击选择并激活打怪模式|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";


local tButton = tLeft.addButton("Mode", -170, 0, "Interface\\AddOns\\MultiBot\\Icons\\mode_passive.blp", MultiBot.tips.mode.master).setDisable()
tButton.doRight = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Mode"])
end
tButton.doLeft = function(pButton)
	if(MultiBot.OnOffSwitch(pButton))
	then MultiBot.ActionToGroup("co +passive,?")
	else
		MultiBot.ActionToGroup("co -passive,?")
		MultiBot.ActionToGroup("follow")
	end
end

local tMode = tLeft.addFrame("Mode", -172, 34)
tMode:Hide()

tMode.addButton("Passive", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\mode_passive.blp", MultiBot.tips.mode.passive)
.doLeft = function(pButton)
	if(MultiBot.SelectToGroup(pButton.parent.parent, "Mode", pButton.texture, "co +passive,?")) then
		pButton.parent.parent.buttons["Mode"].setEnable().doLeft = function(pButton)
			if(MultiBot.OnOffSwitch(pButton))
			then MultiBot.ActionToGroup("co +passive,?")
			else
				MultiBot.ActionToGroup("co -passive,?")
				MultiBot.ActionToGroup("follow")
			end
		end
	end
end

tMode.addButton("Grind", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\mode_grind.blp", MultiBot.tips.mode.grind)
.doLeft = function(pButton)
	if(MultiBot.SelectToGroup(pButton.parent.parent, "Mode", pButton.texture, "grind")) then
		pButton.parent.parent.buttons["Mode"].setEnable().doLeft = function(pButton)
			if(MultiBot.OnOffSwitch(pButton))
			then MultiBot.ActionToGroup("grind")
			else
				MultiBot.ActionToGroup("co -passive,?")
				MultiBot.ActionToGroup("follow")
			end
		end
	end
end

-- STAY|FOLLOW --

MultiBot.tips.stallow = {}
MultiBot.tips.stallow.stay = 
"停留|跟随\n|cffffffff".. 
"使用此按钮，你可以立即发出停留命令。\n".. 
"执行命令时显示命令的接收者。|r\n\n".. 
"|cffff0000左键点击执行停留|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";

MultiBot.tips.stallow.follow = 
"停留|跟随\n|cffffffff".. 
"使用此按钮，你可以立即发出跟随命令。\n".. 
"执行命令时显示命令的接收者。|r\n\n".. 
"|cffff0000左键点击执行跟随|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";


tLeft.addButton("Stay", -136, 0, "Interface\\AddOns\\MultiBot\\Icons\\command_follow.blp", MultiBot.tips.stallow.stay)
.doLeft = function(pButton)
	if(MultiBot.ActionToGroup("stay")) then
		pButton.parent.buttons["Follow"].doShow()
		pButton:doHide()
	end
end

tLeft.addButton("Follow", -136, 0, "Interface\\AddOns\\MultiBot\\Icons\\command_stay.blp", MultiBot.tips.stallow.follow).doHide()
.doLeft = function(pButton)
	if(MultiBot.ActionToGroup("follow")) then
		pButton.parent.buttons["Stay"].doShow()
		pButton:doHide()
	end
end

-- FLEE --

MultiBot.tips.flee = {}
MultiBot.tips.flee.master = 
"逃跑控制\n|cffffffff".. 
"使用此控制，你可以发出逃跑命令。\n".. 
"右键点击选项以定义新的默认动作。\n".. 
"执行命令时显示命令的接收者。|r\n\n".. 
"|cffff0000左键点击执行默认动作|r\n".. 
"|cff999999(执行命令: '目标', 团队, 小队)|r\n\n".. 
"|cffff0000右键点击显示或隐藏选项|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.flee.flee = 
"逃跑\n|cffffffff".. 
"使用此命令，整个团队或小队将开始逃跑。|r\n\n".. 
"|cffff0000左键点击执行逃跑|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.flee.ranged = 
"远程逃跑\n|cffffffff".. 
"使用此命令，远程战斗者将开始逃跑。|r\n\n".. 
"|cffff0000左键点击执行远程逃跑|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.flee.melee = 
"近战逃跑\n|cffffffff".. 
"使用此命令，近战战斗者将开始逃跑。|r\n\n".. 
"|cffff0000左键点击执行近战逃跑|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.flee.healer = 
"治疗逃跑\n|cffffffff".. 
"使用此命令，治疗者将开始逃跑。|r\n\n".. 
"|cffff0000左键点击执行治疗逃跑|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.flee.dps = 
"DPS逃跑\n|cffffffff".. 
"使用此命令，DPS将开始逃跑。|r\n\n".. 
"|cffff0000左键点击执行DPS逃跑|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.flee.tank = 
"坦克逃跑\n|cffffffff".. 
"使用此命令，坦克将开始逃跑。|r\n\n".. 
"|cffff0000左键点击执行坦克逃跑|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.flee.target = 
"目标逃跑\n|cffffffff".. 
"使用此命令，目标将开始逃跑。|r\n\n".. 
"|cffff0000左键点击执行目标逃跑|r\n".. 
"|cff999999(执行命令: 目标)|r\n\n".. 
"|cffff0000右键点击设为默认动作|r\n".. 
"|cff999999(执行命令: 系统)|r";


local tButton = tLeft.addButton("Flee", -102, 0, "Interface\\AddOns\\MultiBot\\Icons\\flee.blp", MultiBot.tips.flee.master)
tButton.doRight = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Flee"])
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("flee")
end

local tFlee = tLeft.addFrame("Flee", -104, 34)
tFlee:Hide()

local tButton = tFlee.addButton("Flee", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\flee.blp", MultiBot.tips.flee.flee)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("flee")
end

local tButton = tFlee.addButton("Ranged", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\flee_ranged.blp", MultiBot.tips.flee.ranged)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "@ranged flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("@ranged flee")
end

local tButton = tFlee.addButton("Melee", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\flee_melee.blp", MultiBot.tips.flee.melee)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "@melee flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("@melee flee")
end

local tButton = tFlee.addButton("Healer", 0, 90, "Interface\\AddOns\\MultiBot\\Icons\\flee_healer.blp", MultiBot.tips.flee.healer)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "@healer flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("@healer flee")
end

local tButton = tFlee.addButton("Dps", 0, 120, "Interface\\AddOns\\MultiBot\\Icons\\flee_dps.blp", MultiBot.tips.flee.dps)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "@dps flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("@dps flee")
end

local tButton = tFlee.addButton("Tank", 0, 150, "Interface\\AddOns\\MultiBot\\Icons\\flee_tank.blp", MultiBot.tips.flee.tank)
tButton.doRight = function(pButton)
	MultiBot.SelectToGroupButton(pButton.parent.parent, "Flee", pButton.texture, "@tank flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToGroup("@tank flee")
end

local tButton = tFlee.addButton("Target", 0, 180, "Interface\\AddOns\\MultiBot\\Icons\\flee_target.blp", MultiBot.tips.flee.target)
tButton.doRight = function(pButton)
	MultiBot.SelectToTargetButton(pButton.parent.parent, "Flee", pButton.texture, "flee")
end
tButton.doLeft = function(pButton)
	MultiBot.ActionToTarget("flee")
end

-- FORMATION --

MultiBot.tips.format = {}
MultiBot.tips.format.master = 
"阵型控制\n|cffffffff".. 
"此控制允许你改变机器人阵型。\n".. 
"执行命令时显示命令的接收者。|r\n\n".. 
"|cffff0000左键点击显示或隐藏选项|r\n".. 
"|cff999999(执行命令: 系统)|r\n\n".. 
"|cffff0000右键点击询问当前阵型|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";

MultiBot.tips.format.arrow = 
"箭头阵型\n|cffffffff".. 
"机器人排列成箭头阵型。\n".. 
"机器人的视线方向朝向你。\n\n".. 
"1. 前排为坦克\n".. 
"2. 第二排为近战战斗者\n".. 
"3. 第三排为远程战斗者\n".. 
"4. 最后一排为治疗者|r\n\n".. 
"|cffff0000左键点击选择箭头阵型|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";

MultiBot.tips.format.queue = 
"队列阵型\n|cffffffff".. 
"机器人排列成防御阵型。\n".. 
"机器人的视线方向朝向你。|r\n\n".. 
"|cffff0000左键点击选择队列阵型|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";

MultiBot.tips.format.near = 
"近距离阵型\n|cffffffff".. 
"机器人在你附近排列。\n".. 
"机器人的视线方向朝向你。|r\n\n".. 
"|cffff0000左键点击选择近距离阵型|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";

MultiBot.tips.format.melee = 
"近战阵型\n|cffffffff".. 
"机器人为近战战斗排列。\n".. 
"机器人的视线方向朝向你。|r\n\n".. 
"|cffff0000左键点击选择近战阵型|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";

MultiBot.tips.format.line = 
"直线阵型\n|cffffffff".. 
"机器人在左侧和右侧排列成平行的直线。\n".. 
"机器人的视线方向朝向你。|r\n\n".. 
"|cffff0000左键点击选择直线阵型|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";

MultiBot.tips.format.circle = 
"圆形阵型\n|cffffffff".. 
"机器人围绕你排列成圆形。\n".. 
"机器人的视线朝向外部。|r\n\n".. 
"|cffff0000左键点击选择圆形阵型|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";

MultiBot.tips.format.chaos = 
"混乱阵型\n|cffffffff".. 
"每个机器人各自跟随你。\n".. 
"他们会随意排列，视线可以朝向任意方向。|r\n\n".. 
"|cffff0000左键点击选择混乱阵型|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";

MultiBot.tips.format.shield = 
"盾牌阵型\n|cffffffff".. 
"机器人在前方、左侧和右侧排列。\n".. 
"机器人的视线方向朝向你。|r\n\n".. 
"|cffff0000左键点击选择盾牌阵型|r\n".. 
"|cff999999(执行命令: 团队, 小队)|r";


local tButton = tLeft.addButton("Format", -68, 0, "Interface\\AddOns\\MultiBot\\Icons\\formation_near.blp", MultiBot.tips.format.master)
tButton.doRight = function(pButton)
	MultiBot.ActionToGroup("formation")
end
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Format"])
end

local tFormat = tLeft.addFrame("Format", -70, 34)
tFormat:Hide()

tFormat.addButton("Arrow", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\formation_arrow.blp", MultiBot.tips.format.arrow)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation arrow")
end

tFormat.addButton("Queue", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\formation_queue.blp", MultiBot.tips.format.queue)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation queue")
end

tFormat.addButton("Near", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\formation_near.blp", MultiBot.tips.format.near)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation near")
end

tFormat.addButton("Melee", 0, 90, "Interface\\AddOns\\MultiBot\\Icons\\formation_melee.blp", MultiBot.tips.format.melee)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation melee")
end

tFormat.addButton("Line", 0, 120, "Interface\\AddOns\\MultiBot\\Icons\\formation_line.blp", MultiBot.tips.format.line)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation line")
end

tFormat.addButton("Circle", 0, 150, "Interface\\AddOns\\MultiBot\\Icons\\formation_circle.blp", MultiBot.tips.format.circle)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation circle")
end

tFormat.addButton("Chaos", 0, 180, "Interface\\AddOns\\MultiBot\\Icons\\formation_chaos.blp", MultiBot.tips.format.chaos)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation chaos")
end

tFormat.addButton("Shield", 0, 210, "Interface\\AddOns\\MultiBot\\Icons\\formation_shield.blp", MultiBot.tips.format.shield)
.doLeft = function(pButton)
	MultiBot.SelectToGroup(pButton.parent.parent, "Format", pButton.texture, "formation shield")
end

-- BEAST --

MultiBot.tips.beast = {}
MultiBot.tips.beast.master = 
"兽王控制\n|cffffffff".. 
"此控制用于 Azerothcore 的 Mod-兽王。\n".. 
"Mod-兽王允许每个角色像猎人一样拥有宠物。\n".. 
"你的角色可以从白牙那里学习必要的法术。\n".. 
"白牙必须由游戏管理员放置在世界中。\n".. 
"执行命令时显示命令的接收者。|r\n\n".. 
"|cffff0000左键点击显示或隐藏选项|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.beast.release =
"释放野兽\n|cffffffff".. 
"此命令将释放野兽。|r\n\n".. 
"|cffff0000左键点击释放野兽|r\n".. 
"|cff999999(执行命令: 目标, 团队, 小队)|r";

MultiBot.tips.beast.revive =
"复活野兽\n|cffffffff".. 
"此命令将复活野兽。|r\n\n".. 
"|cffff0000左键点击复活野兽|r\n".. 
"|cff999999(执行命令: 目标, 团队, 小队)|r";

MultiBot.tips.beast.heal =
"治疗野兽\n|cffffffff".. 
"此命令将治疗野兽。|r\n\n".. 
"|cffff0000左键点击治疗野兽|r\n".. 
"|cff999999(执行命令: 目标, 团队, 小队)|r";

MultiBot.tips.beast.feed =
"喂养野兽\n|cffffffff".. 
"此命令将喂养野兽。|r\n\n".. 
"|cffff0000左键点击喂养野兽|r\n".. 
"|cff999999(执行命令: 目标, 团队, 小队)|r";

MultiBot.tips.beast.call =
"召唤野兽\n|cffffffff".. 
"此命令将召唤野兽。|r\n\n".. 
"|cffff0000左键点击召唤野兽|r\n".. 
"|cff999999(执行命令: 目标, 团队, 小队)|r";


tLeft.addButton("Beast", -34, 0, "ability_mount_swiftredwindrider", MultiBot.tips.beast.master)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Beast"])
end

local tBeast = tLeft.addFrame("Beast", -36, 34)
tBeast:Hide()

tBeast.addButton("Release", 0, 0, "spell_nature_spiritwolf", MultiBot.tips.beast.release)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("cast 2641")
end

tBeast.addButton("Revive", 0, 30, "ability_hunter_beastsoothe", MultiBot.tips.beast.revive)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("cast 982")
end

tBeast.addButton("Heal", 0, 60, "ability_hunter_mendpet", MultiBot.tips.beast.heal)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("cast 48990")
end

tBeast.addButton("Feed", 0, 90, "ability_hunter_beasttraining", MultiBot.tips.beast.feed)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("cast 6991")
end

tBeast.addButton("Call", 0, 120, "ability_hunter_beastcall", MultiBot.tips.beast.call)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("cast 883")
end

-- CREATOR --

MultiBot.tips.creator = {}
MultiBot.tips.creator.master = 
"创造者控制\n|cffffffff".. 
"使用此控制，你可以按职业创建随机机器人。\n".. 
"默认限制是每个账号最多40个随机机器人。\n".. 
"没有命令可以在使用后删除它们。\n".. 
"所以将它们添加到你的好友列表中以便重用。\n".. 
"执行命令时显示命令的接收者。|r\n\n".. 
"|cffff0000左键点击显示或隐藏选项|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.creator.warrior =
"创建战士\n|cffffffff".. 
"此按钮将创建一个作为战士的随机机器人。|r\n\n".. 
"|cffff0000左键点击创建战士|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.creator.warlock =
"创建术士\n|cffffffff".. 
"此按钮将创建一个作为术士的随机机器人。|r\n\n".. 
"|cffff0000左键点击创建术士|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.creator.shaman =
"创建萨满\n|cffffffff".. 
"此按钮将创建一个作为萨满的随机机器人。|r\n\n".. 
"|cffff0000左键点击创建萨满|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.creator.rogue =
"创建潜行者\n|cffffffff".. 
"此按钮将创建一个作为潜行者的随机机器人。|r\n\n".. 
"|cffff0000左键点击创建潜行者|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.creator.priest =
"创建牧师\n|cffffffff".. 
"此按钮将创建一个作为牧师的随机机器人。|r\n\n".. 
"|cffff0000左键点击创建牧师|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.creator.paladin =
"创建圣骑士\n|cffffffff".. 
"此按钮将创建一个作为圣骑士的随机机器人。|r\n\n".. 
"|cffff0000左键点击创建圣骑士|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.creator.mage =
"创建法师\n|cffffffff".. 
"此按钮将创建一个作为法师的随机机器人。|r\n\n".. 
"|cffff0000左键点击创建法师|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.creator.hunter =
"创建猎人\n|cffffffff".. 
"此按钮将创建一个作为猎人的随机机器人。|r\n\n".. 
"|cffff0000左键点击创建猎人|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.creator.druid =
"创建德鲁伊\n|cffffffff".. 
"此按钮将创建一个作为德鲁伊的随机机器人。|r\n\n".. 
"|cffff0000左键点击创建德鲁伊|r\n".. 
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.creator.deathknight =
"创建死亡骑士\n|cffffffff".. 
"此按钮将创建一个作为死亡骑士的随机机器人。|r\n\n".. 
"|cffff0000左键点击创建死亡骑士|r\n".. 
"|cff999999(执行命令: 系统)|r";


MultiBot.tips.creator.init =
"自动初始化\n|cffffffff"..
"使用此按钮自动初始化您的目标。\n"..
"由于装备将被覆盖，因此有两个限制：\n"..
"- 它不适用于玩家机器人名单中的任何人。\n"..
"- 它不适用于公会名单中的任何人。|r\n\n"..
"|cff000000左键点击自动初始化|r\n"..
"|cff999999(执行命令序：目标)|r";


tLeft.addButton("Creator", -0, 0, "inv_helmet_145a", MultiBot.tips.creator.master)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Creator"])
	MultiBot.frames["MultiBar"].frames["Units"]:Hide()
end

local tCreator = tLeft.addFrame("Creator", -2, 34)
tCreator:Hide()

tCreator.addButton("Warrior", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\addclass_warrior", MultiBot.tips.creator.warrior)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass warrior", "SAY")
	--pButton.parent:Hide()
end

tCreator.addButton("Warlock", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\addclass_warlock", MultiBot.tips.creator.warlock)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass warlock", "SAY")
	--pButton.parent:Hide()
end

tCreator.addButton("Shaman", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\addclass_shaman", MultiBot.tips.creator.shaman)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass shaman", "SAY")
	--pButton.parent:Hide()
end

tCreator.addButton("Rogue", 0, 90, "Interface\\AddOns\\MultiBot\\Icons\\addclass_rogue", MultiBot.tips.creator.rogue)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass rogue", "SAY")
	--pButton.parent:Hide()
end

tCreator.addButton("Priest", 0, 120, "Interface\\AddOns\\MultiBot\\Icons\\addclass_priest", MultiBot.tips.creator.priest)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass priest", "SAY")
	--pButton.parent:Hide()
end

tCreator.addButton("Paladin", 0, 150, "Interface\\AddOns\\MultiBot\\Icons\\addclass_paladin", MultiBot.tips.creator.paladin)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass paladin", "SAY")
	--pButton.parent:Hide()
end

tCreator.addButton("Mage", 0, 180, "Interface\\AddOns\\MultiBot\\Icons\\addclass_mage", MultiBot.tips.creator.mage)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass mage", "SAY")
	--pButton.parent:Hide()
end

tCreator.addButton("Hunter", 0, 210, "Interface\\AddOns\\MultiBot\\Icons\\addclass_hunter", MultiBot.tips.creator.hunter)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass hunter", "SAY")
	--pButton.parent:Hide()
end

tCreator.addButton("Druid", 0, 240, "Interface\\AddOns\\MultiBot\\Icons\\addclass_druid", MultiBot.tips.creator.druid)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass druid", "SAY")
	--pButton.parent:Hide()
end

tCreator.addButton("DeathKnight", 0, 270, "Interface\\AddOns\\MultiBot\\Icons\\addclass_deathknight", MultiBot.tips.creator.deathknight)
.doLeft = function(pButton)
	SendChatMessage(".playerbot bot addclass deathknight", "SAY")
	--pButton.parent:Hide()
end

tCreator.addButton("Init", 0, 300, "inv_misc_enggizmos_27", MultiBot.tips.creator.init)
.doLeft = function(pButton)
	local tName = UnitName("target")
	if(tName == nil or tName == "Unknown Entity") then return SendChatMessage("I dont have a Target.", "SAY") end
	if(MultiBot.isRoster("players", tName)) then return SendChatMessage("I wont Auto-Initialize anyone from the Playerbot-Roster.", "SAY") end
	if(MultiBot.isRoster("members", tName)) then return SendChatMessage("I wont Auto-Initialize anyone from the Guild-Roster.", "SAY") end
	SendChatMessage(".playerbot bot init=auto", "WHISPER", nil, tName)
	--pButton.parent:Hide()
end
-- UNITS --

MultiBot.tips.units = {}
MultiBot.tips.units.master =
"单位控制\n|cffffffff"..
"在这个控制中，你会找到你的玩家机器人。\n"..
"每个按钮代表你的一个角色、公会成员或好友。\n"..
"执行命令时显示命令的接收者。|r\n\n"..
"|cffff0000左键单击显示或隐藏单位|r\n"..
"|cff999999(执行命令: 系统)|r\n\n"..
"|cffff0000右击刷新名单|r\n"..
"|cff999999(执行命令: 系统)|r";


local tButton = tMultiBar.addButton("Units", -38, 0, "inv_scroll_04", MultiBot.tips.units.master)
tButton.roster = "players"
tButton.filter = "none"

tButton.doRight = function(pButton)

	local tUnits = pButton.parent.frames["Units"]
	for key, value in pairs(tUnits.buttons) do value:Hide() end
	for key, value in pairs(tUnits.frames) do value:Hide() end
	tUnits.frames["Control"]:Hide()
	
	-- MEMBERBOTS --
	
	for i = 1, 50 do
		local tName, tRank, tIndex, tLevel, tClass = GetGuildRosterInfo(i)
		
		-- Ensure that the Counter is not bigger than the Amount of Members in Guildlist
		if(tName ~= nil and tLevel ~= nil and tClass ~= nil and tName ~= UnitName("player")) then
			local tMember = MultiBot.addMember(tClass, tLevel, tName).setDisable()
			
			tMember.doRight = function(pButton)
				if(pButton.state == false) then return end
				SendChatMessage(".playerbot bot remove " .. pButton.name, "SAY")
				if(pButton.parent.frames[pButton.name] ~= nil) then pButton.parent.frames[pButton.name]:Hide() end
				pButton.setDisable()
			end
			
			tMember.doLeft = function(pButton)
				if(pButton.state) then
					if(pButton.parent.frames[pButton.name] ~= nil) then MultiBot.ShowHideSwitch(pButton.parent.frames[pButton.name]) end
				else
					SendChatMessage(".playerbot bot add " .. pButton.name, "SAY")
					pButton.setEnable()
				end
			end
		else
			break
		end
	end
	
	-- FRIENDBOTS --
	
	for i = 1, 50 do
		local tName, tLevel, tClass = GetFriendInfo(i)
		
		-- Ensure that the Counter is not bigger than the Amount of Members in Guildlist
		if(tName ~= nil and tLevel ~= nil and tClass ~= nil and tName ~= UnitName("player")) then
			local tFriend = MultiBot.addFriend(tClass, tLevel, tName).setDisable()
			
			tFriend.doRight = function(pButton)
				if(pButton.state == false) then return end
				SendChatMessage(".playerbot bot remove " .. pButton.name, "SAY")
				if(pButton.parent.frames[pButton.name] ~= nil) then pButton.parent.frames[pButton.name]:Hide() end
				pButton.setDisable()
			end
			
			tFriend.doLeft = function(pButton)
				if(pButton.state) then
					if(pButton.parent.frames[pButton.name] ~= nil) then MultiBot.ShowHideSwitch(pButton.parent.frames[pButton.name]) end
				else
					SendChatMessage(".playerbot bot add " .. pButton.name, "SAY")
					pButton.setEnable()
				end
			end
		else
			break
		end
	end
	
	-- REFRESH:RAID --
	
	if(GetNumRaidMembers() > 4) then
		for i = 1, GetNumRaidMembers() do
			local tName = UnitName("raid" .. i)
			SendChatMessage(".playerbot bot add " .. tName, "SAY")
		end
		
		return
	end
	
	-- REFRESH:GROUP --
	
	if(GetNumPartyMembers() > 0) then
		for i = 1, GetNumPartyMembers() do
			local tName = UnitName("party" .. i)
			SendChatMessage(".playerbot bot add " .. tName, "SAY")
		end
		
		return
	end
	
	pButton.doLeft(pButton, pButton.roster, pButton.filter)

end

tButton.doLeft = function(pButton, oRoster, oFilter)
	local tUnits = pButton.parent.frames["Units"]
	local tTable = nil
	
	for key, value in pairs(tUnits.buttons) do value:Hide() end
	for key, value in pairs(tUnits.frames) do value:Hide() end
	tUnits.frames["Control"]:Show()
	
	if(oRoster == nil and oFilter == nil) then MultiBot.ShowHideSwitch(tUnits)
	elseif(oRoster ~= nil) then pButton.roster = oRoster
	elseif(oFilter ~= nil) then pButton.filter = oFilter
	end
	
	if(pButton.filter ~= "none")
	then tTable = MultiBot.index.classes[pButton.roster][pButton.filter]
	else tTable = MultiBot.index[pButton.roster]
	end
	
	local tButton = nil
	local tFrame = nil
	local tIndex = 0
	
	if(tTable ~= nil)
	then pButton.limit = table.getn(tTable)
	else pButton.limit = 0
	end
	
	pButton.from = 1
	pButton.to = 10
	
	for i = 1, pButton.limit do
		tIndex = (i - 1)%10 + 1
		tFrame = tUnits.frames[tTable[i]]
		tButton = tUnits.buttons[tTable[i]]
		tButton.setPoint(0, (tUnits.size + 2) * (tIndex - 1))
		if(tFrame ~=nil) then tFrame.setPoint(-34, (tUnits.size + 2) * (tIndex - 1) + 2) end
		
		if(pButton.from <= i and pButton.to >= i) then
			if(tFrame ~= nil and tButton.state) then tFrame:Show() end
			tButton:Show()
		end
	end
	
	if(pButton.limit < pButton.to)
	then tUnits.frames["Control"].setPoint(-2, (tUnits.size + 2) * pButton.limit)
	else tUnits.frames["Control"].setPoint(-2, (tUnits.size + 2) * pButton.to)
	end
	
	if(pButton.limit < 10)
	then tUnits.frames["Control"].buttons["Browse"]:Hide()
	else tUnits.frames["Control"].buttons["Browse"]:Show()
	end
end

local tUnits = tMultiBar.addFrame("Units", -40, 38)
tUnits:Hide()

local tControl = tUnits.addFrame("Control", -2, 0)
tControl:Show()

-- UNIT:FILTER --

-- 所有职业筛选器的提示信息

MultiBot.tips.units.filter =
  "职业筛选器\n|cffffffff"..  -- 设置字体颜色为白色
  "通过职业筛选器你可以根据职业来过滤单位。|r\n\n"..  -- 设置字体颜色为默认
  "|cffff0000左键单击显示或隐藏选项|r\n"..  -- 设置字体颜色为红色
  "|cff999999(执行命令: 系统)|r\n\n"..  -- 设置字体颜色为灰色
  "|cffff0000右键单击重置筛选器|r\n"..
  "|cff999999(执行命令: 系统)|r";

-- 死亡骑士筛选器
MultiBot.tips.units.deathknight =
  "职业筛选器\n|cffffffff"..
  "将单位筛选为死亡骑士。|r\n\n"..
  "|cffff0000左键单击筛选死亡骑士|r\n"..
  "|cff999999(执行命令: 系统)|r";

-- 德鲁伊筛选器
MultiBot.tips.units.druid =
  "职业筛选器\n|cffffffff"..
  "将单位筛选为德鲁伊。|r\n\n"..
  "|cffff0000左键单击筛选德鲁伊|r\n"..
  "|cff999999(执行命令: 系统)|r";

-- 猎人筛选器
MultiBot.tips.units.hunter =
  "职业筛选器\n|cffffffff"..
  "将单位筛选为猎人。|r\n\n"..
  "|cffff0000左键单击筛选猎人|r\n"..
  "|cff999999(执行命令: 系统)|r";

-- ... 其他职业筛选器（法师、战士、牧师等） ...

-- 法师筛选器
MultiBot.tips.units.mage =
"职业筛选器\n|cffffffff"..
"将单位筛选为法师。|r\n\n"..
"|cffff0000左键单击筛选法师|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 圣骑士筛选器
MultiBot.tips.units.paladin =
"职业筛选器\n|cffffffff"..
"将单位筛选为圣骑士。|r\n\n"..
"|cffff0000左键单击筛选圣骑士|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 牧师筛选器
MultiBot.tips.units.priest =
"职业筛选器\n|cffffffff"..
"将单位筛选为牧师。|r\n\n"..
"|cffff0000左键单击筛选牧师|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 盗贼筛选器
MultiBot.tips.units.rogue =
"职业筛选器\n|cffffffff"..
"将单位筛选为盗贼。|r\n\n"..
"|cffff0000左键单击筛选盗贼|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 萨满祭司筛选器
MultiBot.tips.units.shaman =
"职业筛选器\n|cffffffff"..
"将单位筛选为萨满祭司。|r\n\n"..
"|cffff0000左键单击筛选萨满祭司|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 术士筛选器
MultiBot.tips.units.warlock =
"职业筛选器\n|cffffffff"..
"将单位筛选为术士。|r\n\n"..
"|cffff0000左键单击筛选术士|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 战士筛选器
MultiBot.tips.units.warrior =
"职业筛选器\n|cffffffff"..
"将单位筛选为战士。|r\n\n"..
"|cffff0000左键单击筛选战士|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 无筛选器
MultiBot.tips.units.none =
"职业筛选器\n|cffffffff"..
"移除单位的职业筛选器。|r\n\n"..
"|cffff0000左键单击移除筛选器|r\n"..
"|cff999999(执行命令: 系统)|r";

local tButton = tControl.addButton("Filter", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", MultiBot.tips.units.filter)
tButton.doRight = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent, "Filter", "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp")
	tButton.doLeft(tButton, nil, "none")
end
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Filter"])
end

local tFilter = tControl.addFrame("Filter", -30, 2)
tFilter:Hide()

tFilter.addButton("DeathKnight", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_deathknight.blp", MultiBot.tips.units.deathknight)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "DeathKnight")
end

tFilter.addButton("Druid", -26, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_druid.blp", MultiBot.tips.units.druid)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Druid")
end

tFilter.addButton("Hunter", -52, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_hunter.blp", MultiBot.tips.units.hunter)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Hunter")
end

tFilter.addButton("Mage", -78, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_mage.blp", MultiBot.tips.units.mage)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Mage")
end

tFilter.addButton("Paladin", -104, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_paladin.blp", MultiBot.tips.units.paladin)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Paladin")
end

tFilter.addButton("Priest", -130, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_priest.blp", MultiBot.tips.units.priest)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Priest")
end

tFilter.addButton("Rogue", -156, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_rogue.blp", MultiBot.tips.units.rogue)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Rogue")
end

tFilter.addButton("Shaman", -182, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_shaman.blp", MultiBot.tips.units.shaman)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Shaman")
end

tFilter.addButton("Warlock", -208, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_warlock.blp", MultiBot.tips.units.warlock)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Warlock")
end

tFilter.addButton("Warrior", -234, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_warrior.blp", MultiBot.tips.units.warrior)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "Warrior")
end

tFilter.addButton("None", -260, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", MultiBot.tips.units.none)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Filter", pButton.texture)
	tButton.doLeft(tButton, nil, "none")
end

-- UNITS:ROSTER --

-- 团队筛选器
MultiBot.tips.units.roster =
"团队筛选器\n|cffffffff"..
"通过团队筛选器，你可以切换不同的团队。|r\n\n"..
"|cffff0000左键单击显示或隐藏选项|r\n"..
"|cff999999(执行命令: 系统)|r\n\n"..
"|cffff0000右键单击重置筛选器|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 活动团队
MultiBot.tips.units.actives =
"团队筛选器\n|cffffffff"..
"显示活动团队。|r\n\n"..
"|cffff0000左键单击选择活动团队|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 玩家机器人团队
MultiBot.tips.units.players =
"团队筛选器\n|cffffffff"..
"显示玩家机器人团队。\n"..
"通常是你的角色和其他留在队伍中的人。|r\n\n"..
"|cffff0000左键单击选择玩家机器人团队|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 公会团队
MultiBot.tips.units.members =
"团队筛选器\n|cffffffff"..
"显示公会团队。\n"..
"公会团队不会显示你的角色。|r\n\n"..
"|cffff0000左键单击选择公会团队|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 好友团队
MultiBot.tips.units.friends =
"团队筛选器\n|cffffffff"..
"显示好友团队。\n"..
"好友团队不会显示你的角色或公会成员。|r\n\n"..
"|cffff0000左键单击选择好友团队|r\n"..
"|cff999999(执行命令: 系统)|r";

local tButton = tControl.addButton("Roster", 0, 30, "Interface\\AddOns\\MultiBot\\Icons\\roster_players.blp", MultiBot.tips.units.roster)
tButton.doRight = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent, "Roster", "Interface\\AddOns\\MultiBot\\Icons\\roster_players.blp")
	tButton.doLeft(tButton, "players")
end
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Roster"])
end

local tRoster = tControl.addFrame("Roster", -30, 32)
tRoster:Hide()

tRoster.addButton("Friends", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_friends.blp", MultiBot.tips.units.friends)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	pButton.parent.parent.buttons["Invite"].setEnable()
	pButton.parent.parent.frames["Invite"]:Hide()
	tButton.doLeft(tButton, "friends")
end

tRoster.addButton("Members", -26, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_members.blp", MultiBot.tips.units.members)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	pButton.parent.parent.buttons["Invite"].setEnable()
	pButton.parent.parent.frames["Invite"]:Hide()
	tButton.doLeft(tButton, "members")
end

tRoster.addButton("Players", -52, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_players.blp", MultiBot.tips.units.players)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	pButton.parent.parent.buttons["Invite"].setEnable()
	pButton.parent.parent.frames["Invite"]:Hide()
	tButton.doLeft(tButton, "players")
end

tRoster.addButton("Actives", -78, 0, "Interface\\AddOns\\MultiBot\\Icons\\roster_actives.blp", MultiBot.tips.units.actives)
.doLeft = function(pButton)
	local tButton = MultiBot.frames["MultiBar"].buttons["Units"]
	MultiBot.Select(pButton.parent.parent, "Roster", pButton.texture)
	pButton.parent.parent.buttons["Invite"].setDisable()
	pButton.parent.parent.frames["Invite"]:Hide()
	tButton.doLeft(tButton, "actives")
end

-- UNIT:BROWSE --

-- 浏览团队
MultiBot.tips.units.browse =
"浏览团队\n|cffffffff"..
"使用此按钮可以浏览团队列表。\n"..
"如果团队单位少于 10 个，则此按钮将隐藏。|r\n\n"..
"|cffff0000左键单击浏览团队|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 邀请控制
MultiBot.tips.units.invite =
"邀请控制\n|cffffffff"..
"使用此控制可以自动填充你的队伍。\n"..
"左侧按钮用于 '组队邀请'，右侧按钮用于 '团队邀请'。|r\n\n"..
"|cffff0000左键单击显示或隐藏控制|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 邀请五人组
MultiBot.tips.units.inviteParty5 =
"五人组\n|cffffffff"..
"使用此按钮可以填充你的队伍。\n"..
"此功能会从选定的团队列表中获取单位，忽略职业筛选器。\n"..
"它会在团队列表结束处或队伍达到 5 名成员时停止。|r\n\n"..
"|cffff0000左键单击邀请组队成员|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 邀请十人团队
MultiBot.tips.units.inviteRaid10 =
"十人团队\n|cffffffff"..
"使用此按钮可以填充你的团队。\n"..
"此功能会从选定的团队列表中获取单位，忽略职业筛选器。\n"..
"它会在团队列表结束处或队伍达到 10 名成员时停止。|r\n\n"..
"|cffff0000左键单击邀请团队成员|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 邀请二十五人团队
MultiBot.tips.units.inviteRaid25 =
"二十五人团队\n|cffffffff"..
"使用此按钮可以填充你的团队。\n"..
"此功能会从选定的团队列表中获取单位，忽略职业筛选器。\n"..
"它会在团队列表结束处或队伍达到 25 名成员时停止。|r\n\n"..
"|cffff0000左键单击邀请团队成员|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 邀请四十人团队
MultiBot.tips.units.inviteRaid40 =
"四十人团队\n|cffffffff"..
"使用此按钮可以填充你的团队。\n"..
"此功能会从选定的团队列表中获取单位，忽略职业筛选器。\n"..
"它会在团队列表结束处或队伍达到 40 名成员时停止。|r\n\n"..
"|cffff0000左键单击邀请团队成员|r\n"..
"|cff999999(执行命令: 系统)|r";

tControl.addButton("Invite", 0, 60, "Interface\\AddOns\\MultiBot\\Icons\\invite.blp", MultiBot.tips.units.invite).setEnable()
.doLeft = function(pButton)
	if(pButton.state) then MultiBot.ShowHideSwitch(pButton.parent.frames["Invite"]) end
end

local tInvite = tControl.addFrame("Invite", -30, 62)
tInvite:Hide()

tInvite.addButton("Party+5", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_party_5.blp", MultiBot.tips.units.inviteParty5)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage("I already invite Members, please wait until I am done.", "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 5 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage("Starting to invite Members.", "SAY")
end

tInvite.addButton("Raid+10", 56, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_raid_10.blp", MultiBot.tips.units.inviteRaid10)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage("I already invite Members, please wait until I am done.", "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 10 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage("Starting to invite Members.", "SAY")
end

tInvite.addButton("Raid+25", 82, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_raid_25.blp", MultiBot.tips.units.inviteRaid25)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage("I already invite Members, please wait until I am done.", "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 25 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage("Starting to invite Members.", "SAY")
end

tInvite.addButton("Raid+40", 108, 0, "Interface\\AddOns\\MultiBot\\Icons\\invite_raid_40.blp", MultiBot.tips.units.inviteRaid40)
.doLeft = function(pButton)
	if(MultiBot.auto.invite) then return SendChatMessage("I already invite Members, please wait until I am done.", "SAY") end
	local tRaid = GetNumRaidMembers()
	local tParty = GetNumPartyMembers()
	MultiBot.timer.invite.roster = MultiBot.frames["MultiBar"].buttons["Units"].roster
	MultiBot.timer.invite.needs = 40 - MultiBot.IF(tRaid > 0, tRaid, MultiBot.IF(tParty > 0, tParty + 1, 1))
	MultiBot.timer.invite.index = 1
	MultiBot.auto.invite = true
	pButton.parent:Hide()
	SendChatMessage("Starting to invite Members.", "SAY")
end

tControl.addButton("Browse", 0, 90, "Interface\\AddOns\\MultiBot\\Icons\\browse.blp", MultiBot.tips.units.browse)
.doLeft = function(pButton)
	local tMaster = MultiBot.frames["MultiBar"].buttons["Units"]
	local tFrom = tMaster.from + 10
	local tTo = tMaster.to + 10
	
	if(tMaster.filter ~= "none")
	then tTable = MultiBot.index.classes[tMaster.roster][tMaster.filter]
	else tTable = MultiBot.index[tMaster.roster]
	end
	
	local tUnits = tMaster.parent.frames["Units"]
	local tButton = nil
	local tFrame = nil
	local tIndex = 0
	
	if(tFrom > tMaster.limit) then
		tFrom = 1
		tTo = 10
	end
	
	if(tTo > tMaster.limit) then
		tTo = tMaster.limit
	end
	
	for i = 1, tMaster.limit do
		tFrame = tUnits.frames[tTable[i]]
		tButton = tUnits.buttons[tTable[i]]
		
		if(tMaster.from <= i and tMaster.to >= i) then
			if(tFrame ~= nil) then tFrame:Hide() end
			tButton:Hide()
		end
		
		if(tFrom <= i and tTo >= i) then
			tIndex = tIndex + 1
			if(tFrame ~= nil and tButton.state) then tFrame:Show() end 
			tButton:Show()
		end
	end
	
	tMaster.from = tFrom
	tMaster.to = tTo
	
	tUnits.frames["Control"].setPoint(-2, (tUnits.size + 2) * tIndex)
end

-- MAIN --

-- 主控制面板
MultiBot.tips.main = {}
MultiBot.tips.main.master =
"主控制面板\n|cffffffff"..
"此控制面板包含自动切换、特殊策略和重置命令。\n"..
"执行命令时会显示命令的接收者。|r\n\n"..
"|cffff0000左键单击显示或隐藏选项|r\n"..
"|cff999999(执行命令: 系统)|r\n\n"..
"|cffff0000右键单击关闭 MultiBot|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 重置坐标
MultiBot.tips.main.coords =
"重置坐标\n|cffffffff"..
"重置以下功能的坐标：\n"..
"多功能栏、背包、技能书、物品栏和图标栏|r\n\n"..
"|cffff0000左键单击重置坐标|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 自动释放
MultiBot.tips.main.release =
"自动释放\n|cffffffff"..
"此功能可以检测机器人的死亡。\n"..
"死亡的机器人将自动释放并召唤。|r\n\n"..
"|cffff0000左键单击启用或禁用自动释放|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 自动属性
MultiBot.tips.main.stats =
"自动属性\n|cffffffff"..
"此功能可视化属性数据。\n"..
"属性数据每分钟更新一次。|r\n\n"..
"|cffff0000左键单击启用或禁用自动属性|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 纳克萨玛斯策略
MultiBot.tips.main.naxx =
"纳克萨玛斯策略\n|cffffffff"..
"此按钮将激活你机器人的纳克萨玛斯策略。|r\n\n"..
"|cffff0000左键单击激活纳克萨玛斯策略|r\n"..
"|cff999999(执行命令: 目标、团队、队伍)|r";  -- 注意，这里的 Execution-Order 使用了多种选项

-- 重置机器人
MultiBot.tips.main.reset =
"重置机器人\n|cffffffff"..
"此按钮将重置你机器人的人工智能。|r\n\n"..
"|cffff0000左键单击重置人工智能|r\n"..
"|cff999999(执行命令: 目标、团队、队伍)|r";  -- 注意，这里的 Execution-Order 使用了多种选项

-- 重置动作
MultiBot.tips.main.action =
"重置动作\n|cffffffff"..
"此按钮将重置你机器人的当前动作。|r\n\n"..
"|cffff0000左键单击重置动作|r\n"..
"|cff999999(执行命令: 目标、团队、队伍)|r";  -- 注意，这里的 Execution-Order 使用了多种选项

local tButton = tMultiBar.addButton("Main", 0, 0, "inv_gizmo_02", MultiBot.tips.main.master)
tButton.doRight = function(pButton)
	MultiBot.doSlash("/MultiBot", "")
end
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Main"])
end

local tMain = tMultiBar.addFrame("Main", -2, 38)
tMain:Hide()

tMain.addButton("Coords", 0, 0, "inv_gizmo_03", MultiBot.tips.main.coords)
.doLeft = function(pButton)
	MultiBot.frames["MultiBar"].setPoint(-262, 144)
	MultiBot.inventory.setPoint(-700, -144)
	MultiBot.spellbook.setPoint(-566, 170)
	MultiBot.itemus.setPoint(-860, -144)
	MultiBot.iconos.setPoint(-860, -144)
	MultiBot.stats.setPoint(-60, 560)
end

tMain.addButton("Release", 0, 34, "achievement_bg_xkills_avgraveyard", MultiBot.tips.main.release).setDisable()
.doLeft = function(pButton)
	if(MultiBot.OnOffSwitch(pButton)) then
		MultiBot.auto.release = true
	else
		MultiBot.auto.release = false
	end
end

tMain.addButton("Stats", 0, 68, "inv_scroll_08", MultiBot.tips.main.stats).setDisable()
.doLeft = function(pButton)
	if(MultiBot.OnOffSwitch(pButton)) then
		MultiBot.auto.stats = true
		for i = 1, GetNumPartyMembers() do SendChatMessage("stats", "WHISPER", nil, UnitName("party" .. i)) end
	else
		MultiBot.auto.stats = false
		for key, value in pairs(MultiBot.stats.frames) do value:Hide() end
	end
end

tMain.addButton("Naxx", 0, 102, "achievement_boss_kelthuzad_01", MultiBot.tips.main.naxx)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("naxx")
end

tMain.addButton("Reset", 0, 136, "inv_misc_tournaments_symbol_gnome", MultiBot.tips.main.reset)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("reset botAI")
end

tMain.addButton("Actions", 0, 170, "inv_helmet_02", MultiBot.tips.main.action)
.doLeft = function(pButton)
	MultiBot.ActionToTargetOrGroup("reset")
end

-- MASTERS --

-- 游戏管理员控制面板
MultiBot.tips.game = {}
MultiBot.tips.game.master =
"游戏管理员控制面板\n|cffffffff"..
"此控制面板包含一些实用的游戏管理员命令。\n"..
"执行命令时显示命令的接收者。|r\n\n"..
"|cffff0000左键单击显示或隐藏选项|r\n"..
"|cff999999(执行命令: 系统)|r\n\n"..
"|cffff0000右键单击拖动和移动 MultiBot|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 亡灵帝国
MultiBot.tips.game.necronet =
"亡灵帝国\n|cffffffff"..
"此按钮启用或禁用亡灵帝国。\n"..
"如果亡灵帝国络处于激活状态，你将在世界地图上找到墓地按钮。\n"..
"每个墓地按钮都可以让你传送至对应的墓地。\n"..
"您需要游戏管理员权限才能使用这些按钮。|r\n\n"..
"|cffff0000左键单击启用或禁用亡灵帝国|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 记忆传送门
MultiBot.tips.game.portal =
"记忆传送门\n|cffffffff"..
"此框中包含记忆宝石。\n"..
"使用记忆宝石储存你的当前位置。\n"..
"你可以通过使用记忆宝石传送到储存的位置。\n"..
"执行命令时显示命令的接收者。|r\n\n"..
"|cffff0000左键单击显示或隐藏灵魂宝石|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 记忆宝石
MultiBot.tips.game.memory =
"记忆宝石\n|cffffffff"..
"关于记忆宝石。\n"..
"您需要游戏管理员权限才能使用此按钮。|r\n\n"..
"|cffff0000左键单击存储或传送到该位置|r\n"..
"|cff999999(执行命令: 目标)|r\n\n"..
"|cffff0000右键单击忘记该位置|r\n"..
"|cff999999(执行命令: 目标)|r";

-- 物品生成器
MultiBot.tips.game.itemus = 
"物品生成器\n|cffffffff"..
"游戏管理员工具箱中包含所有物品。\n"..
"只需选择玩家或机器人，然后左键单击物品，愿望即可成真。\n"..
"重要提示，并非所有物品都可以生成，因此您需要尝试找出可生成的物品。|r\n\n"..
"|cffff0000左键单击打开或关闭物品生成器|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 图标生成器
MultiBot.tips.game.iconos = 
"图标生成器\n|cffffffff"..
"此工具中包含所有图标及其路径。\n"..
"执行命令时显示命令的接收者。|r\n\n"..
"|cffff0000左键单击打开或关闭图标生成器|r\n"..
"|cff999999(执行命令: 系统)|r";

-- 召唤
MultiBot.tips.game.summon =
"召唤\n|cffffffff"..
"将你的目标召唤到你的位置。\n"..
"您需要游戏管理员权限才能使用此按钮。|r\n\n"..
"|cffff0000左键单击召唤你的目标|r\n"..
"|cff999999(执行命令: 目标)|r";

-- 传送
MultiBot.tips.game.appear =
"传送\n|cffffffff"..
"你将出现在你的目标位置。\n"..
"您需要游戏管理员权限才能使用此按钮。|r\n\n"..
"|cffff0000左键单击传送到你的目标|r\n"..
"|cff999999(执行命令: 目标)|r";

local tButton = tMultiBar.addButton("Masters", 38, 0, "mail_gmicon", MultiBot.tips.game.master)
tButton:RegisterForDrag("RightButton")
tButton:SetScript("OnDragStart", function()
	MultiBot.frames["MultiBar"]:StartMoving()
end)
tButton:SetScript("OnDragStop", function()
	MultiBot.frames["MultiBar"]:StopMovingOrSizing()
end)
tButton.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Masters"])
end

local tMasters = tMultiBar.addFrame("Masters", 36, 38)
tMasters:Hide()

tMasters.addButton("NecroNet", 0, 0, "achievement_bg_xkills_avgraveyard", MultiBot.tips.game.necronet).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.necronet.state = false
		for key, value in pairs(MultiBot.necronet.buttons) do value:Hide() end
		pButton.setDisable()
	else
		MultiBot.necronet.cont = 0
		MultiBot.necronet.area = 0
		MultiBot.necronet.zone = 0
		MultiBot.necronet.state = true
		pButton.setEnable()
	end
end

tMasters.addButton("Portal", 0, 34, "inv_box_02", MultiBot.tips.game.portal)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Portal"])
end

local tPortal = tMasters.addFrame("Portal", 30, 36)
tPortal:Hide()

local tButton = tPortal.addButton("Red", 0, 0, "inv_jewelcrafting_gem_16", MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside.")).setDisable()
tButton.doRight = function(pButton)
	if(pButton.state == false) then return SendChatMessage("It has no Location stored inside.", "SAY") end
	pButton.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside")
	pButton.setDisable()
end
tButton.doLeft = function(pButton)
	local tPlayer = MultiBot.getBot(UnitName("player"))
	if(tPlayer.waitFor == nil) then tPlayer.waitFor = "" end
	if(tPlayer.waitFor ~= "") then return SendChatMessage("I am still in the process of saving my position.", "SAY") end
	if(pButton.state) then return SendChatMessage(".go xyz " .. pButton.goX .. " " .. pButton.goY .. " " .. pButton.goZ .. " " .. pButton.goMap, "SAY")	end
	tPlayer.memory = pButton
	tPlayer.waitFor = "COORDS"
	SendChatMessage(".gps", "SAY")
end

local tButton = tPortal.addButton("Green", 30, 0, "inv_jewelcrafting_gem_13", MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside.")).setDisable()
tButton.doRight = function(pButton)
	if(pButton.state == false) then return SendChatMessage("It has no Location stored inside.", "SAY") end
	pButton.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside")
	pButton.setDisable()
end
tButton.doLeft = function(pButton)
	local tPlayer = MultiBot.getBot(UnitName("player"))
	if(tPlayer.waitFor == nil) then tPlayer.waitFor = "" end
	if(tPlayer.waitFor ~= "") then return SendChatMessage("I am still in the process of saving my position.", "SAY") end
	if(pButton.state) then return SendChatMessage(".go xyz " .. pButton.goX .. " " .. pButton.goY .. " " .. pButton.goZ .. " " .. pButton.goMap, "SAY")	end
	tPlayer.memory = pButton
	tPlayer.waitFor = "COORDS"
	SendChatMessage(".gps", "SAY")
end

local tButton = tPortal.addButton("Blue", 60, 0, "inv_jewelcrafting_gem_17", MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside.")).setDisable()
tButton.doRight = function(pButton)
	if(pButton.state == false) then return SendChatMessage("It has no Location stored inside.", "SAY") end
	pButton.tip = MultiBot.doReplace(MultiBot.tips.game.memory, "ABOUT", "has no Location stored inside")
	pButton.setDisable()
end
tButton.doLeft = function(pButton)
	local tPlayer = MultiBot.getBot(UnitName("player"))
	if(tPlayer.waitFor == nil) then tPlayer.waitFor = "" end
	if(tPlayer.waitFor ~= "") then return SendChatMessage("I am still in the process of saving my position.", "SAY") end
	if(pButton.state) then return SendChatMessage(".go xyz " .. pButton.goX .. " " .. pButton.goY .. " " .. pButton.goZ .. " " .. pButton.goMap, "SAY")	end
	tPlayer.memory = pButton
	tPlayer.waitFor = "COORDS"
	SendChatMessage(".gps", "SAY")
end

tMasters.addButton("Itemus", 0, 68, "inv_box_01", MultiBot.tips.game.itemus)
.doLeft = function(pButton)
	if(MultiBot.ShowHideSwitch(MultiBot.itemus)) then
		MultiBot.itemus.addItems()
	end
end

tMasters.addButton("Iconos", 0, 102, "inv_mask_01", MultiBot.tips.game.iconos)
.doLeft = function(pButton)
	if(MultiBot.ShowHideSwitch(MultiBot.iconos)) then
		MultiBot.iconos.addIcons()
	end
end

tMasters.addButton("Summon", 0, 136, "spell_holy_prayerofspirit", MultiBot.tips.game.summon)
.doLeft = function(pButton)
	MultiBot.doDotWithTarget(".summon")
end

tMasters.addButton("Appear", 0, 170, "spell_holy_divinespirit", MultiBot.tips.game.appear)
.doLeft = function(pButton)
	MultiBot.doDotWithTarget(".appear")
end

-- RIGHT --

local tRight = tMultiBar.addFrame("Right", 72, 2, 32)

-- DRINK --

MultiBot.tips.drink = {}
MultiBot.tips.drink.group = 
"团队饮水\n|cffffffff"..
"使用此按钮命令团队饮水。\n"..
"执行命令时显示命令的接收者。|r\n\n"..
"|cffff0000左键单击执行团队饮水|r\n"..
"|cff999999(执行命令: 团队, 队伍)|r";

tRight.addButton("Drink", 0, 0, "inv_drink_24_sealwhey", MultiBot.tips.drink.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("drink")
end

-- RELEASE --

MultiBot.tips.release = {}
MultiBot.tips.release.group = 
"团队释放\n|cffffffff"..
"使用此按钮，死亡的机器人将释放其灵魂到下一个墓地。\n"..
"执行命令时显示命令的接收者。|r\n\n"..
"|cffff0000左键单击执行团队释放|r\n"..
"|cff999999(执行命令: 团队, 队伍)|r";

tRight.addButton("Release", 34, 0, "achievement_bg_xkills_avgraveyard", MultiBot.tips.release.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("release")
end

-- REVIVE --

MultiBot.tips.revive = {}
MultiBot.tips.revive.group = 
"团队复活\n|cffffffff"..
"使用此按钮，灵魂状态的机器人将在下一个墓地复活。\n"..
"执行命令时显示命令的接收者。|r\n\n"..
"|cffff0000左键单击执行团队复活|r\n"..
"|cff999999(执行命令: 团队, 队伍)|r";

tRight.addButton("Revive", 68, 0, "spell_holy_guardianspirit", MultiBot.tips.revive.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("revive")
end

-- SUMALL --

MultiBot.tips.summon = {}
MultiBot.tips.summon.group = 
"团队召唤\n|cffffffff"..
"使用此按钮将团队召唤到你的位置。\n"..
"执行命令时显示命令的接收者。|r\n\n"..
"|cffff0000左键单击执行团队召唤|r\n"..
"|cff999999(执行命令: 团队, 队伍)|r";

tRight.addButton("Summon", 102, 0, "ability_hunter_beastcall", MultiBot.tips.summon.group)
.doLeft = function(pButton)
	MultiBot.ActionToGroup("summon")
end

-- INVENTORY --

MultiBot.tips.inventory = {}

-- 背包 - 出售物品
MultiBot.tips.inventory.sell =
"出售物品 |cffffffff\n"..
"此功能启用背包的出售模式。\n"..
"你必须将商人设置为目标。\n"..
"出于安全原因，你的机器人不会出售：\n"..
" - 名称中包含 '钥匙' 的任何物品\n"..
" - 炉石 |r\n\n"..
"|cffff0000左键单击出售物品|r\n"..
"|cff999999(执行命令: 机器人)|r";

-- 背包 - 装备物品
MultiBot.tips.inventory.equip =
"装备物品 |cffffffff\n"..
"此功能启用背包的装备模式。|r\n\n"..
"|cffff0000左键单击装备物品|r\n"..
"|cff999999(执行命令: 机器人)|r";

-- 背包 - 使用物品
MultiBot.tips.inventory.use =
"使用物品 |cffffffff\n"..
"此功能启用背包的使用模式。|r\n\n"..
"|cffff0000左键单击使用物品|r\n"..
"|cff999999(执行命令: 机器人)|r";

-- 背包 - 丢弃物品
MultiBot.tips.inventory.drop =
"丢弃物品 |cffffffff\n"..
"此功能启用背包的丢弃模式。\n"..
"出于安全原因，你的机器人不会丢弃：\n"..
" - 稀有品质或更高品质的任何物品\n"..
" - 名称中包含 '钥匙' 的任何物品\n"..
" - 炉石 |r\n\n"..
"|cffff0000左键单击丢弃物品|r\n"..
"|cff999999(执行命令: 机器人)|r";

MultiBot.inventory = MultiBot.newFrame(MultiBot, -700, -144, 32, 442, 884)
MultiBot.inventory.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Inventory.blp")
MultiBot.inventory.addText("Title", "Inventory", "CENTER", -58, 429, 12)
MultiBot.inventory.action = "s"
MultiBot.inventory:SetMovable(true)
MultiBot.inventory:Hide()

MultiBot.inventory.movButton("Move", -406, 849, 34, "Right-Click to drag and move the Inventory")

MultiBot.inventory.wowButton("X", -126, 862, 15, 18, 13)
.doLeft = function(pButton)
	local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
	local tButton = tUnits.frames[MultiBot.inventory.name].buttons["Inventory"]
	tButton.doLeft(tButton)
end

MultiBot.inventory.addButton("Sell", -94, 806, "inv_misc_coin_16", MultiBot.tips.inventory.sell).setEnable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
	else
		MultiBot.inventory.action = "s"
		pButton.getButton("Destroy").setDisable()
		pButton.getButton("Equip").setDisable()
		pButton.getButton("Use").setDisable()
		pButton.setEnable()
	end
end

MultiBot.inventory.addButton("Equip", -94, 768, "inv_helmet_22", MultiBot.tips.inventory.equip).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
	else
		MultiBot.inventory.action = "e"
		pButton.getButton("Destroy").setDisable()
		pButton.getButton("Sell").setDisable()
		pButton.getButton("Use").setDisable()
		pButton.setEnable()
	end
end

MultiBot.inventory.addButton("Use", -94, 731, "inv_gauntlets_25", MultiBot.tips.inventory.use).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
	else
		MultiBot.inventory.action = "u"
		pButton.getButton("Destroy").setDisable()
		pButton.getButton("Equip").setDisable()
		pButton.getButton("Sell").setDisable()
		pButton.setEnable()
	end
end

MultiBot.inventory.addButton("Destroy", -94, 694, "inv_hammer_15", MultiBot.tips.inventory.drop).setDisable()
.doLeft = function(pButton)
	if(pButton.state) then
		MultiBot.inventory.action = ""
		pButton.setDisable()
	else
		MultiBot.inventory.action = "destroy"
		pButton.getButton("Equip").setDisable()
		pButton.getButton("Sell").setDisable()
		pButton.getButton("Use").setDisable()
		pButton.setEnable()
	end
end

local tFrame = MultiBot.inventory.addFrame("Items", -397, 807, 32)
tFrame:Show()

-- STATS --

MultiBot.stats = MultiBot.newFrame(MultiBot, -60, 560, 32)
MultiBot.stats:SetMovable(true)
MultiBot.addStats(MultiBot.stats, "party1", 0,    0, 32, 192, 96)
MultiBot.addStats(MultiBot.stats, "party2", 0,  -60, 32, 192, 96)
MultiBot.addStats(MultiBot.stats, "party3", 0, -120, 32, 192, 96)
MultiBot.addStats(MultiBot.stats, "party4", 0, -180, 32, 192, 96)
MultiBot.stats.movButton("Move", 0, -80, 160, "Right-Click to drag and move Auto-Stats")
-- ITEMUS --

MultiBot.tips.itemus = {}

MultiBot.itemus = MultiBot.newFrame(MultiBot, -860, -144, 32, 442, 884)
MultiBot.itemus.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Inventory.blp")
MultiBot.itemus.addText("Title", "Itemus", "CENTER", -57, 429, 13)
MultiBot.itemus.addText("Pages", "0/0", "CENTER", -57, 409, 13)
MultiBot.itemus.name = UnitName("Player")
MultiBot.itemus.index = {}
MultiBot.itemus.color = "cff9d9d9d"
MultiBot.itemus.level = "L10"
MultiBot.itemus.rare = "R00"
MultiBot.itemus.slot = "S00"
MultiBot.itemus.type = "PC"
MultiBot.itemus.max = 1
MultiBot.itemus.now = 1
MultiBot.itemus:SetMovable(true)
MultiBot.itemus:Hide()

MultiBot.itemus.movButton("Move", -407, 850, 32, "Right-Click to drag and move Itemus")

MultiBot.itemus.wowButton("<", -319, 841, 15, 18, 13).doHide()
.doLeft = function(pButton)
	MultiBot.itemus.now = MultiBot.itemus.now - 1
	MultiBot.itemus.addItems()
end

MultiBot.itemus.wowButton(">", -225, 841, 15, 18, 13).doHide()
.doLeft = function(pButton)
	MultiBot.itemus.now = MultiBot.itemus.now + 1
	MultiBot.itemus.addItems()
end

MultiBot.itemus.wowButton("X", -126, 862, 15, 18, 13)
.doLeft = function(pButton)
	MultiBot.itemus:Hide()
end

local tFrame = MultiBot.itemus.addFrame("Items", -397, 807, 32)
tFrame:Show()

-- ITEMUS:LEVEL --

MultiBot.tips.itemus.level = {}
-- 物品生成器 - 等级过滤器
MultiBot.tips.itemus.level.master =
"等级过滤器 |cffffffff\n"..
"以 10 级为间隔过滤物品。|r\n\n"..
"|cffff0000左键单击显示或隐藏选项|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.level.L10 =
"0 级到 10 级 |cffffffff\n"..
"显示需要等级介于 0 到 10 之间的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.level.L20 =
"11 级到 20 级 |cffffffff\n"..
"显示需要等级介于 11 到 20 之间的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.level.L30 =
"21 级到 30 级 |cffffffff\n"..
"显示需要等级介于 21 到 30 之间的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.level.L40 =
"31 级到 40 级 |cffffffff\n"..
"显示需要等级介于 31 到 40 之间的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.level.L50 =
"41 级到 50 级 |cffffffff\n"..
"显示需要等级介于 41 到 50 之间的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.level.L60 =
"51 级到 60 级 |cffffffff\n"..
"显示需要等级介于 51 到 60 之间的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.level.L70 =
"61 级到 70 级 |cffffffff\n"..
"显示需要等级介于 61 到 70 之间的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.level.L80 =
"71 级到 80 级 |cffffffff\n"..
"显示需要等级介于 71 到 80 之间的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.itemus.addButton("Level", -94, 806, "achievement_level_10", MultiBot.tips.itemus.level.master).setEnable()
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Level"])
end

local tFrame = MultiBot.itemus.addFrame("Level", -61, 808, 28)
tFrame:Hide()

tFrame.addButton("L10", 0, 0, "achievement_level_10", MultiBot.tips.itemus.level.L10)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L10"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L20", 30, 0, "achievement_level_20", MultiBot.tips.itemus.level.L20)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L20"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L30", 60, 0, "achievement_level_30", MultiBot.tips.itemus.level.L30)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L30"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L40", 90, 0, "achievement_level_40", MultiBot.tips.itemus.level.L40)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L40"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L50", 120, 0, "achievement_level_50", MultiBot.tips.itemus.level.L50)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L50"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L60", 150, 0, "achievement_level_60", MultiBot.tips.itemus.level.L60)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L60"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L70", 180, 0, "achievement_level_70", MultiBot.tips.itemus.level.L70)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L70"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("L80", 210, 0, "achievement_level_80", MultiBot.tips.itemus.level.L80)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Level", pButton.texture)
	MultiBot.itemus.level = "L80"
	MultiBot.itemus.addItems(1)
end

-- ITEMUS:RARE --

MultiBot.tips.itemus.rare = {}
-- 物品生成器 - 品质过滤器
MultiBot.tips.itemus.rare.master =
"品质过滤器 |cffffffff\n"..
"根据物品品质进行过滤。\n"..
"此过滤器可以叠加在等级过滤器之上。|r\n\n"..
"|cffff0000左键单击显示或隐藏选项|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.rare.R00 =
"普通品质 |cffffffff\n"..
"显示普通品质的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.rare.R01 =
"一般品质 |cffffffff\n"..
"显示一般品质的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.rare.R02 =
"非一般品质 |cffffffff\n"..
"显示非一般品质的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.rare.R03 =
"稀有品质 |cffffffff\n"..
"显示稀有品质的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.rare.R04 =
"史诗品质 |cffffffff\n"..
"显示史诗品质的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.rare.R05 =
"传说品质 |cffffffff\n"..
"显示传说品质的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(Execution-Order: System)|r";  // 这里将错别字修正为 "System"

MultiBot.tips.itemus.rare.R06 =
"神器品质 |cffffffff\n"..
"显示神器品质的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.rare.R07 =
"传家宝品质 |cffffffff\n"..
"显示传家宝品质的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.itemus.addButton("Rare", -94, 768, "achievement_quests_completed_01", MultiBot.tips.itemus.rare.master)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Rare"])
end

local tFrame = MultiBot.itemus.addFrame("Rare", -61, 770)
tFrame:Hide()

tFrame.addButton("R00", 0, 0, "achievement_quests_completed_01", MultiBot.tips.itemus.rare.R00)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cff9d9d9d"
	MultiBot.itemus.rare = "R00"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R01", 30, 0, "achievement_quests_completed_02", MultiBot.tips.itemus.rare.R01)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cffffffff"
	MultiBot.itemus.rare = "R01"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R02", 60, 0, "achievement_quests_completed_03", MultiBot.tips.itemus.rare.R02)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cff1eff00"
	MultiBot.itemus.rare = "R02"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R03", 90, 0, "achievement_quests_completed_04", MultiBot.tips.itemus.rare.R03)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cff0070dd"
	MultiBot.itemus.rare = "R03"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R04", 120, 0, "achievement_quests_completed_05", MultiBot.tips.itemus.rare.R04)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cffa335ee"
	MultiBot.itemus.rare = "R04"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R05", 150, 0, "achievement_quests_completed_06", MultiBot.tips.itemus.rare.R05)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cffff8000"
	MultiBot.itemus.rare = "R05"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R06", 180, 0, "achievement_quests_completed_07", MultiBot.tips.itemus.rare.R06)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cffff0000"
	MultiBot.itemus.rare = "R06"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("R07", 210, 0, "achievement_quests_completed_08", MultiBot.tips.itemus.rare.R07)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Rare", pButton.texture)
	MultiBot.itemus.color = "cffe6cc80"
	MultiBot.itemus.rare = "R07"
	MultiBot.itemus.addItems(1)
end

-- ITEMUS:SLOT --

MultiBot.tips.itemus.slot = {}
-- 物品生成器 - 槽位过滤器
MultiBot.tips.itemus.slot.master =
"槽位过滤器 |cffffffff\n"..
"根据物品槽位进行过滤。\n"..
"此过滤器可以叠加在等级和品质过滤器之上。|r\n\n"..
"|cffff0000左键单击显示或隐藏选项|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S00 =
"不可装备 |cffffffff\n"..
"显示不可装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S01 =
"头部 |cffffffff\n"..
"显示头部装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S02 =
"颈部 |cffffffff\n"..
"显示颈部装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S03 =
"肩部 |cffffffff\n"..
"显示肩部装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S04 =
"衬衫槽位 |cffffffff\n"..
"显示衬衫槽位的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S05 =
"胸部 |cffffffff\n"..
"显示胸部装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S06 =
"腰部 |cffffffff\n"..
"显示腰部装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S07 =
"腿部 |cffffffff\n"..
"显示腿部装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S08 =
"脚部 |cffffffff\n"..
"显示脚部装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S09 =
"手腕槽位 |cffffffff\n"..
"显示手腕装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S10 =
"手部 |cffffffff\n"..
"显示手部装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S11 =
"手指 |cffffffff\n"..
"显示手指装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S12 =
"饰品槽位 |cffffffff\n"..
"显示饰品槽位的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S13 =
"单手武器槽位 |cffffffff\n"..
"显示单手武器槽位的物品。\n"..
"注意：此物品可以作为主手或副手武器使用。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S14 =
"盾牌槽位 |cffffffff\n"..
"显示盾牌槽位的物品。|r\n"..
"注意：此槽位与副手武器槽位相同。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S15 =
"远程武器槽位 |cffffffff\n"..
"显示远程武器槽位的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S16 =
"背部槽位 |cffffffff\n"..
"显示背部装备的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S17 =
"双手武器槽位 |cffffffff\n"..
"显示双手武器槽位的物品。|r\n"..
"注意：此槽位与主手武器槽位相同。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S18 =
"背包槽位 |cffffffff\n"..
"显示背包槽位的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S19 =
"披风槽位 |cffffffff\n"..
"显示披风槽位的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S20 =
"长袍槽位 |cffffffff\n"..
"显示长袍槽位的物品。|r\n"..
"注意：此槽位与胸部相同。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S21 =
"主手武器槽位 |cffffffff\n"..
"显示主手武器槽位的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S22 =
"副手武器槽位 |cffffffff\n"..
"显示副手武器槽位的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S23 =
"副手物品槽位 |cffffffff\n"..
"显示副手物品槽位的物品。|r\n"..
"注意：此槽位与副手武器相同。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S24 =
"弹药槽位 |cffffffff\n"..
"显示弹药槽位的物品。|r\n"..
"注意：此槽位与远程-右手相同。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S25 =
"投掷物槽位 |cffffffff\n"..
"显示投掷物槽位的物品。|r\n"..
"注意：此槽位与远程相同。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(Execution-Order: System)|r";

MultiBot.tips.itemus.slot.S26 =
"远程-右手槽位 |cffffffff\n"..
"显示远程-右手槽位的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S27 =
"箭筒槽位 |cffffffff\n"..
"显示箭筒槽位的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.tips.itemus.slot.S28 =
"圣物槽位 |cffffffff\n"..
"显示圣物槽位的物品。|r\n\n"..
"|cffff0000左键单击设置过滤器|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.itemus.addButton("Slot", -94, 731, "inv_drink_18", MultiBot.tips.itemus.slot.master)
.doLeft = function(pButton)
	MultiBot.ShowHideSwitch(pButton.parent.frames["Slot"])
end

local tFrame = MultiBot.itemus.addFrame("Slot", -61, 733)
tFrame:Hide()

tFrame.addButton("S00", 0, 0, "inv_drink_18", MultiBot.tips.itemus.slot.S00)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S00"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S01", 30, 0, "inv_misc_desecrated_platehelm", MultiBot.tips.itemus.slot.S01)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S01"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S02", 60, 0, "inv_jewelry_necklace_22", MultiBot.tips.itemus.slot.S02)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S02"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S03", 90, 0, "inv_misc_desecrated_plateshoulder", MultiBot.tips.itemus.slot.S03)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S03"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S04", 120, 0, "inv_shirt_grey_01", MultiBot.tips.itemus.slot.S04)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S04"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S05", 150, 0, "inv_misc_desecrated_platechest", MultiBot.tips.itemus.slot.S05)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S05"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S06", 180, 0, "inv_misc_desecrated_platebelt", MultiBot.tips.itemus.slot.S06)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S06"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S07", 210, 0, "inv_misc_desecrated_platepants", MultiBot.tips.itemus.slot.S07)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S07"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S08", 0, -30, "inv_misc_desecrated_plateboots", MultiBot.tips.itemus.slot.S08)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S08"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S09", 30, -30, "inv_misc_desecrated_platebracer", MultiBot.tips.itemus.slot.S09)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S09"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S10", 60, -30, "inv_misc_desecrated_plategloves", MultiBot.tips.itemus.slot.S10)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S10"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S11", 90, -30, "inv_jewelry_ring_19", MultiBot.tips.itemus.slot.S11)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S11"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S12", 120, -30, "inv_jewelry_ring_07", MultiBot.tips.itemus.slot.S12)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S12"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S13", 150, -30, "inv_sword_23", MultiBot.tips.itemus.slot.S13)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S13"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S14", 180, -30, "inv_shield_04", MultiBot.tips.itemus.slot.S14)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S14"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S15", 210, -30, "inv_weapon_bow_05", MultiBot.tips.itemus.slot.S15)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S15"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S16", 0, -60, "inv_misc_cape_20", MultiBot.tips.itemus.slot.S16)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S16"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S17", 30, -60, "inv_axe_14", MultiBot.tips.itemus.slot.S17)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S17"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S18", 60, -60, "inv_misc_bag_07_black", MultiBot.tips.itemus.slot.S18)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S18"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S19", 90, -60, "inv_shirt_guildtabard_01", MultiBot.tips.itemus.slot.S19)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S19"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S20", 120, -60, "inv_misc_desecrated_clothchest", MultiBot.tips.itemus.slot.S20)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S20"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S21", 150, -60, "inv_hammer_07", MultiBot.tips.itemus.slot.S21)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S21"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S22", 180, -60, "inv_sword_15", MultiBot.tips.itemus.slot.S22)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S22"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S23", 210, -60, "inv_misc_book_09", MultiBot.tips.itemus.slot.S23)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S23"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S24", 0, -90, "inv_misc_ammo_arrow_01", MultiBot.tips.itemus.slot.S24)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S24"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S25", 30, -90, "inv_throwingknife_02", MultiBot.tips.itemus.slot.S25)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S25"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S26", 60, -90, "inv_wand_07", MultiBot.tips.itemus.slot.S26)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S26"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S27", 90, -90, "inv_misc_quiver_07", MultiBot.tips.itemus.slot.S27)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S26"
	MultiBot.itemus.addItems(1)
end

tFrame.addButton("S28", 120, -90, "inv_relics_idolofrejuvenation", MultiBot.tips.itemus.slot.S28)
.doLeft = function(pButton)
	MultiBot.Select(MultiBot.itemus, "Slot", pButton.texture)
	MultiBot.itemus.slot = "S28"
	MultiBot.itemus.addItems(1)
end

-- ITEMUS:TYPE --

MultiBot.tips.itemus.type =
"类型过滤器 |cffffffff\n"..
"使用此过滤器可以在玩家角色物品和非玩家角色物品之间切换。\n"..
"此过滤器可以叠加在等级、品质和槽位过滤器之上。|r\n\n"..
"|cffff0000左键单击启用或禁用NPC物品|r\n"..
"|cff999999(执行命令: 系统)|r";

MultiBot.itemus.addButton("Type", -94, 694, "inv_misc_head_clockworkgnome_01", MultiBot.tips.itemus.type).setDisable()
.doLeft = function(pButton)
	MultiBot.itemus.type = MultiBot.IF(MultiBot.OnOffSwitch(pButton), "NPC", "PC")
	MultiBot.itemus.addItems(1)
end

-- ICONOS --

MultiBot.iconos = MultiBot.newFrame(MultiBot, -860, -144, 32, 442, 884)
MultiBot.iconos.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Iconos.blp")
MultiBot.iconos.addText("Title", "Iconos", "CENTER", -57, 429, 13)
MultiBot.iconos.addText("Pages", "0/0", "CENTER", -57, 409, 13)
MultiBot.iconos.max = 1
MultiBot.iconos.now = 1
MultiBot.iconos:SetMovable(true)
MultiBot.iconos:Hide()

MultiBot.iconos.movButton("Move", -407, 850, 32, "Right-Click to drag and move Iconos")

MultiBot.iconos.wowButton("<", -319, 841, 15, 18, 13).doHide()
.doLeft = function(pButton)
	MultiBot.iconos.now = MultiBot.iconos.now - 1
	MultiBot.iconos.addIcons()
end

MultiBot.iconos.wowButton(">", -225, 841, 15, 18, 13).doHide()
.doLeft = function(pButton)
	MultiBot.iconos.now = MultiBot.iconos.now + 1
	MultiBot.iconos.addIcons()
end

MultiBot.iconos.wowButton("X", -126, 862, 15, 18, 13)
.doLeft = function(pButton)
	MultiBot.iconos:Hide()
end

local tFrame = MultiBot.iconos.addFrame("Icons", -397, 807, 32)
tFrame:Show()

-- SPELLBOOK --

MultiBot.spellbook = MultiBot.newFrame(MultiBot, -566, 170, 32, 576, 576)
MultiBot.spellbook.addTexture("Interface\\AddOns\\MultiBot\\Textures\\spellbook.blp")
MultiBot.spellbook.addText("Pages", "|cffffcc000/0|r", "CENTER", -138, -54, 13)
MultiBot.spellbook.addText("Title", "Spellbook", "CENTER", -128, 269, 12)
MultiBot.spellbook.spells = {}
MultiBot.spellbook.icons = {}
MultiBot.spellbook.max = 1
MultiBot.spellbook.now = 1
MultiBot.spellbook:SetMovable(true)
MultiBot.spellbook:Hide()

MultiBot.spellbook.movButton("Move", -525, 525, 48, "Right-Click to drag and move the Spellbook")
for i = 1, GetNumMacroIcons() do MultiBot.spellbook.icons[GetMacroIconInfo(i)] = i end

MultiBot.spellbook.wowButton("<", -540, 225, 15, 18, 13).doShow()
.doLeft = function(pButton)
	MultiBot.spellbook.to = MultiBot.spellbook.to - 12
	MultiBot.spellbook.now = MultiBot.spellbook.now - 1
	MultiBot.spellbook.from = MultiBot.spellbook.from - 12
	MultiBot.spellbook.setText("Pages", "|cffffcc00" .. MultiBot.spellbook.now .. "/" .. MultiBot.spellbook.max .. "|r")
	MultiBot.spellbook.buttons[">"].doShow()
	
	if(MultiBot.spellbook.now == 1) then pButton.doHide() end
	local tIndex = 1
	
	for i = MultiBot.spellbook.from, MultiBot.spellbook.to do
		MultiBot.setSpell(tIndex, MultiBot.spellbook.spells[i])
		tIndex = tIndex + 1
	end
end

MultiBot.spellbook.wowButton(">", -300, 225, 15, 18, 13).doShow()
.doLeft = function(pButton)
	MultiBot.spellbook.to = MultiBot.spellbook.to + 12
	MultiBot.spellbook.now = MultiBot.spellbook.now + 1
	MultiBot.spellbook.from = MultiBot.spellbook.from + 12
	MultiBot.spellbook.setText("Pages", "|cffffcc00" .. MultiBot.spellbook.now .. "/" .. MultiBot.spellbook.max .. "|r")
	MultiBot.spellbook.buttons["<"].doShow()
	
	if(MultiBot.spellbook.now == MultiBot.spellbook.max) then pButton.doHide() end
	local tIndex = 1
	
	for i = MultiBot.spellbook.from, MultiBot.spellbook.to do
		MultiBot.setSpell(tIndex, MultiBot.spellbook.spells[i])
		tIndex = tIndex + 1
	end
end

MultiBot.spellbook.wowButton("X", -287, 548, 15, 18, 13)
.doLeft = function(pButton)
	local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
	local tButton = tUnits.frames[MultiBot.spellbook.name].buttons["Spellbook"]
	tButton.doLeft(tButton)
end

MultiBot.spellbook.addText("R01", "|cff806040Rank|r", "TOPLEFT", 58, -88, 11)
MultiBot.spellbook.addText("T01", "|cffffcc00Title|r", "TOPLEFT", 58, -72, 12)
local tButton = MultiBot.spellbook.addButton("S01", -522, 475, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R02", "|cff806040Rank|r", "TOPLEFT", 190, -88, 11)
MultiBot.spellbook.addText("T02", "|cffffcc00Title|r", "TOPLEFT", 190, -72, 12)
local tButton = MultiBot.spellbook.addButton("S02", -389, 475, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R03", "|cff806040Rank|r", "TOPLEFT", 58, -131, 11)
MultiBot.spellbook.addText("T03", "|cffffcc00Title|r", "TOPLEFT", 58, -115, 12)
local tButton = MultiBot.spellbook.addButton("S03", -522, 432, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R04", "|cff806040Rank|r", "TOPLEFT", 190, -131, 11)
MultiBot.spellbook.addText("T04", "|cffffcc00Title|r", "TOPLEFT", 190, -115, 12)
local tButton = MultiBot.spellbook.addButton("S04", -389, 432, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R05", "|cff806040Rank|r", "TOPLEFT", 58, -174, 11)
MultiBot.spellbook.addText("T05", "|cffffcc00Title|r", "TOPLEFT", 58, -158, 12)
local tButton = MultiBot.spellbook.addButton("S05", -522, 389, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R06", "|cff806040Rank|r", "TOPLEFT", 190, -174, 11)
MultiBot.spellbook.addText("T06", "|cffffcc00Title|r", "TOPLEFT", 190, -158, 12)
local tButton = MultiBot.spellbook.addButton("S06", -389, 389, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R07", "|cff806040Rank|r", "TOPLEFT", 58, -217, 11)
MultiBot.spellbook.addText("T07", "|cffffcc00Title|r", "TOPLEFT", 58, -201, 12)
local tButton = MultiBot.spellbook.addButton("S07", -522, 346, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R08", "|cff806040Rank|r", "TOPLEFT", 190, -217, 11)
MultiBot.spellbook.addText("T08", "|cffffcc00Title|r", "TOPLEFT", 190, -201, 12)
local tButton = MultiBot.spellbook.addButton("S08", -389, 346, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R09", "|cff806040Rank|r", "TOPLEFT", 58, -260, 11)
MultiBot.spellbook.addText("T09", "|cffffcc00Title|r", "TOPLEFT", 58, -244, 12)
local tButton = MultiBot.spellbook.addButton("S09", -522, 303, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R10", "|cff806040Rank|r", "TOPLEFT", 190, -260, 11)
MultiBot.spellbook.addText("T10", "|cffffcc00Title|r", "TOPLEFT", 190, -244, 12)
local tButton = MultiBot.spellbook.addButton("S10", -389, 303, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R11", "|cff806040Rank|r", "TOPLEFT", 58, -303, 11)
MultiBot.spellbook.addText("T11", "|cffffcc00Title|r", "TOPLEFT", 58, -287, 12)
local tButton = MultiBot.spellbook.addButton("S11", -522, 260, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

MultiBot.spellbook.addText("R12", "|cff806040Rank|r", "TOPLEFT", 190, -303, 11)
MultiBot.spellbook.addText("T12", "|cffffcc00Title|r", "TOPLEFT", 190, -287, 12)
local tButton = MultiBot.spellbook.addButton("S12", -389, 260, "inv_misc_questionmark", "Text")
tButton.doRight = function(pButton)
	MultiBot.SpellToMacro(MultiBot.spellbook.name, pButton.spell, pButton.texture)
end
tButton.doLeft = function(pButton)
	SendChatMessage("cast " .. pButton.spell, "WHISPER", nil, MultiBot.spellbook.name)
end

-- FINISH --

MultiBot.state = true
print("MultiBot")