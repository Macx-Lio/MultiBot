MultiBot.config = {}
MultiBot.config.raid = {}
MultiBot.config.beastmaster = {}
MultiBot.config.deathknight = {}
MultiBot.config.druid = {}
MultiBot.config.hunter = {}
MultiBot.config.mage = {}
MultiBot.config.paladin = {}
MultiBot.config.priest = {}
MultiBot.config.rogue = {}
MultiBot.config.shaman = {}
MultiBot.config.warlock = {}
MultiBot.config.warrior = {}

MultiBot.notice = {}
MultiBot.notice.allrounder = "\n|cffff0000Notice: |r|cfff9f9f9This Button works with Target, Group and Raid.|r"
MultiBot.notice.merchant = "\n|cffff0000Notice: |r|cfff9f9f9You will need a Merchant as Target.|r"

-- USE: All
MultiBot.config.control = {
	"DOUBLE",
	"control",
	"inv_gizmo_02",
	"inv_gizmo_02",
	"HIDE:CONTROL",
	"SHOW:CONTROL",
	"Left Click to hide AI-Control | Right Click to close MultiBot",
	"Left Click to show AI-Control | Right Click to close Multibot",
	"/multibot"
}

MultiBot.config.players = {
	"DOUBLE",
	"players",
	"inv_scroll_04",
	"inv_scroll_03",
	"HIDE:PLAYERS",
	"SHOW:PLAYERS",
	"Left Click to hide Playerbots",
	"Left Click to show Playerbots",
	"PLAYERS:REFRESH"
}

MultiBot.config.friends = {
	"DOUBLE",
	"friends",
	"inv_scroll_05",
	"inv_scroll_03",
	"HIDE:FRIENDS",
	"SHOW:FRIENDS",
	"Left Click to hide Friendbots | Right Click to refresh Friendbots",
	"Left Click to show Friendbots | Right Click to refresh Friendbots",
	"FRIENDS:REFRESH"
}

-- CONTROL --

MultiBot.config.naxx = {
	"SINGLE",
	"naxx",
	"achievement_boss_kelthuzad_01",
	"CONTROL:naxx",
	"Click to activate AI for Naxxramas" .. MultiBot.notice.allrounder
}

MultiBot.config.reset = {
	"SINGLE",
	"reset",
	"inv_misc_tournaments_symbol_gnome",
	"CONTROL:reset botAI",
	"Click to reset AI" .. MultiBot.notice.allrounder
}

MultiBot.config.action = {
	"SINGLE",
	"action",
	"inv_helmet_02",
	"CONTROL:reset",
	"Click to reset Actions" .. MultiBot.notice.allrounder
}

-- LEFT --

-- USE: Druid, Paladin, Priest, Shaman
-- NOT: DeathKnight, Hunter, Mage, Rogue, Warlock, Warrior
MultiBot.config.heal = {
	"SWITCH:heal",
	"heal",
	"spell_holy_aspiration",
	"co -heal,?",
	"co +heal,?",
	"Click to disable Heal",
	"Click to enable Heal",
	"heal"
}

-- USE: All
MultiBot.config.assist = {
	"SWITCH:dps",
	"assist",
	"ability_warrior_innerrage",
	"co -tank assist,?",
	"co +tank assist,?",
	"Click to disable Tank Assist",
	"Click to enable Tank Assist",
	"tank assist"
}

-- USE: Druid(Bear), Paladin, Warlock, Warrior  
-- NOT: DeathKnight, Hunter, Mage, Priest, Rogue, Shaman
MultiBot.config.tank = {
	"SWITCH:heal=tank",
	"tank",
	"ability_warrior_shieldmastery",
	"co -tank,?",
	"co +tank,?",
	"Click to disable Tank",
	"Click to enable Tank",
	"tank,"
}

-- RIGHT --

-- USE: All
MultiBot.config.summon = {
	"SINGLE",
	"summon",
	"ability_hunter_beastcall",
	"summon",
	"Click to summon Playerbot"
}

-- USE: All
MultiBot.config.group = {
	"DOUBLE",
	"group",
	"inv_misc_grouplooking",
	"inv_misc_groupneedmore",
	"/uninvite",
	"/invite",
	"Click to dismiss Playerbot",
	"Click to invite Playerbot"
}

-- USE: All
MultiBot.config.food = {
	"SWITCH",
	"food",
	"inv_drink_24_sealwhey",
	"nc -food,?",
	"nc +food,?",
	"Click to disable Food",
	"Click to enable Food",
	"food"
}

-- USE: All
MultiBot.config.loot = {
	"SWITCH",
	"loot",
	"inv_misc_coin_16",
	"nc -loot,?",
	"nc +loot,?",
	"Click to disable Loot",
	"Click to enable Loot",
	"loot"
}

-- USE: All
MultiBot.config.gather = {
	"SWITCH",
	"gather",
	"trade_mining",
	"nc -gather,?",
	"nc +gather,?",
	"Click to disable Gather",
	"Click to enable Gather",
	"gather"
}

-- BEASTMASTER --

MultiBot.config.beastmaster.start = {
	"SINGLE",
	"start",
	"ability_mount_swiftredwindrider",
	"BEASTMASTER:SWITCH",
	"Click to show or hide Beastmaster-Actions"
}

MultiBot.config.beastmaster.call = {
	"SINGLE",
	"call",
	"ability_hunter_beastcall",
	"BEASTMASTER:883",
	"Click to call the Beast" .. MultiBot.notice.allrounder
}

MultiBot.config.beastmaster.feed = {
	"SINGLE",
	"feed",
	"ability_hunter_beasttraining",
	"BEASTMASTER:6991",
	"Click to feed the Beast" .. MultiBot.notice.allrounder
}

MultiBot.config.beastmaster.heal = {
	"SINGLE",
	"heal",
	"ability_hunter_mendpet",
	"BEASTMASTER:48990",
	"Click to heal the Beast" .. MultiBot.notice.allrounder
}

MultiBot.config.beastmaster.revive = {
	"SINGLE",
	"revive",
	"ability_hunter_beastsoothe",
	"BEASTMASTER:982",
	"Click to revive the Beast" .. MultiBot.notice.allrounder
}

MultiBot.config.beastmaster.release = {
	"SINGLE",
	"release",
	"spell_nature_spiritwolf",
	"BEASTMASTER:2641",
	"Click to release the Beast" .. MultiBot.notice.allrounder
}

-- Friends --

MultiBot.config.browse = {
	"SINGLE",
	"browse",
	"Interface\\AddOns\\MultiBot\\Icons\\filter_browse.blp",
	"FRIENDS:BROWSE",
	"Click to browse Friendbots"
}

MultiBot.config.filter = {
	"SELECT",
	"filter",
	{
		{
			"OPTION",
			"deathknight",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_deathknight.blp",
			"FRIENDS:NONE",
			"FRIENDS:DEATHKNIGHT",
			"Click to filter by DeathKnights",
			"deathknight"
		},{
			"OPTION",
			"druid",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_druid.blp",
			"FRIENDS:NONE",
			"FRIENDS:DRUID",
			"Click to filter by Druids",
			"druid"
		},{
			"OPTION",
			"hunter",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_hunter.blp",
			"FRIENDS:NONE",
			"FRIENDS:HUNTER",
			"Click to filter by Hunters",
			"hunter"
		},{
			"OPTION",
			"mage",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_mage.blp",
			"FRIENDS:NONE",
			"FRIENDS:MAGE",
			"Click to filter by Mages",
			"mage"
		},{
			"OPTION",
			"paladin",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_paladin.blp",
			"FRIENDS:NONE",
			"FRIENDS:PALADIN",
			"Click to filter by Paladins",
			"paladin"
		},{
			"OPTION",
			"priest",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_priest.blp",
			"FRIENDS:NONE",
			"FRIENDS:PRIEST",
			"Click to filter by Priests",
			"priest"
		},{
			"OPTION",
			"rogue",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_rogue.blp",
			"FRIENDS:NONE",
			"FRIENDS:ROGUE",
			"Click to filter by Rogues",
			"rogue"
		},{
			"OPTION",
			"shaman",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_shaman.blp",
			"FRIENDS:NONE",
			"FRIENDS:SHAMAN",
			"Click to filter by Shamans",
			"shaman"
		},{
			"OPTION",
			"warlock",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_warlock.blp",
			"FRIENDS:NONE",
			"FRIENDS:WARLOCK",
			"Click to filter by Warlocks",
			"warlock"
		},{
			"OPTION",
			"warrior",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_warrior.blp",
			"FRIENDS:NONE",
			"FRIENDS:WARRIOR",
			"Click to filter by Warriors",
			"warrior"
		},{
			"OPTION",
			"none",
			"Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp",
			"FRIENDS:NONE",
			"FRIENDS:NONE",
			"Click to disable Filter",
			"none"
		}
	},
	"Left Click for Options | Right Click for disable Filter",
	"Left Click for Options | Right Click for enable Filter"
}

-- Inventory --

MultiBot.config.inventory = {
	"SWITCH",
	"inventory",
	"inv_misc_bag_08",
	"INVENTORY:CLOSE",
	"INVENTORY:OPEN",
	"Click to close Inventory",
	"Click to open Inventory",
	"items"
}

MultiBot.config.sell = {
	"SWITCH:inventory",
	"sell",
	"inv_misc_coin_16",
	"INVENTORY:NONE",
	"INVENTORY:SELL",
	"Click to disable Sell" .. MultiBot.notice.merchant,
	"Click to sell Items" .. MultiBot.notice.merchant,
	"SELL"
}

MultiBot.config.equip = {
	"SWITCH:inventory",
	"equip",
	"inv_helmet_22",
	"INVENTORY:NONE",
	"INVENTORY:EQUIP",
	"Click to disable Equip",
	"Click to equip Items",
	"EQUIP"
}

MultiBot.config.use = {
	"SWITCH:inventory",
	"use",
	"inv_gauntlets_25",
	"INVENTORY:NONE",
	"INVENTORY:USE",
	"Click to disable Use",
	"Click to use Items",
	"USE"
}

MultiBot.config.drop = {
	"SWITCH:inventory",
	"drop",
	"inv_hammer_15",
	"INVENTORY:NONE",
	"INVENTORY:DROP",
	"Click to disable Destroy",
	"Click to destroy Items",
	"DROP"
}

-- GROUP --

MultiBot.config.drink = {
	"SINGLE",
	"drink",
	"inv_drink_24_sealwhey",
	"drink",
	"Click for Drink"
}

MultiBot.config.revive = {
	"SINGLE",
	"revive",
	"spell_holy_guardianspirit",
	"revive",
	"Click for Revive"
}

MultiBot.config.release = {
	"SINGLE",
	"release",
	"achievement_bg_xkills_avgraveyard",
	"release",
	"Click for Release"
}

MultiBot.config.sumall = {
	"SINGLE",
	"summon",
	"ability_hunter_beastcall",
	"SUMMON:ALL",
	"Click to summon all active Bots"
}

MultiBot.config.formation = {
	"SELECT",
	"formation",
	{
		{
			"OPTION",
			"arrow",
			"Interface\\AddOns\\MultiBot\\Icons\\formation_arrow.blp",
			"formation",
			"formation arrow",
			"Click for Arrow-Formation",
			"arrow"
		},{
			"OPTION",
			"queue",
			"Interface\\AddOns\\MultiBot\\Icons\\formation_queue.blp",
			"formation",
			"formation queue",
			"Click for Queue-Formation",
			"queue"
		},{
			"OPTION",
			"near",
			"Interface\\AddOns\\MultiBot\\Icons\\formation_near.blp",
			"formation",
			"formation near",
			"Click for Near-Formation",
			"near"
		},{
			"OPTION",
			"melee",
			"Interface\\AddOns\\MultiBot\\Icons\\formation_melee.blp",
			"formation",
			"formation melee",
			"Click for Melee-Formation",
			"melee"
		},{
			"OPTION",
			"line",
			"Interface\\AddOns\\MultiBot\\Icons\\formation_line.blp",
			"formation",
			"formation line",
			"Click for Line-Formation",
			"line"
		},{
			"OPTION",
			"circle",
			"Interface\\AddOns\\MultiBot\\Icons\\formation_circle.blp",
			"formation",
			"formation circle",
			"Click for Circle-Formation",
			"circle"
		},{
			"OPTION",
			"chaos",
			"Interface\\AddOns\\MultiBot\\Icons\\formation_chaos.blp",
			"formation",
			"formation chaos",
			"Click for Chaos-Formation",
			"chaos"
		},{
			"OPTION",
			"shield",
			"Interface\\AddOns\\MultiBot\\Icons\\formation_shield.blp",
			"formation",
			"formation shield",
			"Click for Shield-Formation",
			"shield"
		}
	},
	"Left Click for Options | Right Click to ask for Formation",
	"Left Click for Options | Right Click to ask for Formation"
}

MultiBot.config.flee = {
	"ACTIONBAR",
	"flee",
	{
		{
			"ACTION",
			"flee",
			"Interface\\AddOns\\MultiBot\\Icons\\flee.blp",
			"flee",
			"Click for All to flee | Right Click for set as Default"
		},{
			"ACTION",
			"range",
			"Interface\\AddOns\\MultiBot\\Icons\\flee_range.blp",
			"@ranged flee",
			"Click for Ranged to flee | Right Click for set as Default"
		},{
			"ACTION",
			"melee",
			"Interface\\AddOns\\MultiBot\\Icons\\flee_melee.blp",
			"@melee flee",
			"Click for Melee to flee | Right Click for set as Default"
		},{
			"ACTION",
			"healer",
			"Interface\\AddOns\\MultiBot\\Icons\\flee_healer.blp",
			"@healer flee",
			"Click for Healer to flee | Right Click for set as Default"
		},{
			"ACTION",
			"dps",
			"Interface\\AddOns\\MultiBot\\Icons\\flee_dps.blp",
			"@dps flee",
			"Click for DPS to flee | Right Click for set as Default"
		},{
			"ACTION",
			"tank",
			"Interface\\AddOns\\MultiBot\\Icons\\flee_tank.blp",
			"@tank flee",
			"Click for Tank to flee | Right Click for set as Default"
		},{
			"ACTION",
			"target",
			"Interface\\AddOns\\MultiBot\\Icons\\flee_target.blp",
			"@target flee",
			"Click for Target to flee | Right Click for set as Default"
		}
	},
	"Left Click for default Action | Right Click for advance Actions"
}

MultiBot.config.stay = {
	"DOUBLE",
	"stay",
	"Interface\\AddOns\\MultiBot\\Icons\\command_follow.blp",
	"Interface\\AddOns\\MultiBot\\Icons\\command_stay.blp",
	"stay",
	"follow",
	"Click for Stay",
	"Click for Follow"
}

MultiBot.config.mode = {
	"MODEBAR",
	"flee",
	{
		{
			"MODE",
			"passive",
			"Interface\\AddOns\\MultiBot\\Icons\\mode_passive.blp",
			"co -passive,-grind,?",
			"co +passive,?",
			"Click to disable Passive-Mode",
			"Click to enable Passive-Mode",
			"passive"
		},{
			"MODE",
			"grind",
			"Interface\\AddOns\\MultiBot\\Icons\\mode_grind.blp",
			"co -passive,-grind,?",
			"co +grind,?",
			"Click to disable Grind-Mode",
			"Click to enable Grind-Mode",
			"grind"
		}
	},
	"Left Click to toggle Mode | Right Click to select Mode"
}

MultiBot.config.attack = {
	"ACTIONBAR",
	"attack",
	{
		{
			"ACTION",
			"attack",
			"Interface\\AddOns\\MultiBot\\Icons\\attack.blp",
			"d attack my target",
			"Click for All to attack | Right Click for set as Default"
		},{
			"ACTION",
			"range",
			"Interface\\AddOns\\MultiBot\\Icons\\attack_range.blp",
			"@ranged d attack my target",
			"Click for Ranged to attack | Right Click for set as Default"
		},{
			"ACTION",
			"melee",
			"Interface\\AddOns\\MultiBot\\Icons\\attack_melee.blp",
			"@melee d attack my target",
			"Click for Melee to attack | Right Click for set as Default"
		},{
			"ACTION",
			"healer",
			"Interface\\AddOns\\MultiBot\\Icons\\attack_healer.blp",
			"@healer d attack my target",
			"Click for Healer to attack | Right Click for set as Default"
		},{
			"ACTION",
			"dps",
			"Interface\\AddOns\\MultiBot\\Icons\\attack_dps.blp",
			"@dps d attack my target",
			"Click for DPS to attack | Right Click for set as Default"
		},{
			"ACTION",
			"tank",
			"Interface\\AddOns\\MultiBot\\Icons\\attack_tank.blp",
			"@tank d attack my target",
			"Click for Tank to attack | Right Click for set as Default"
		}
	},
	"Left Click for default Action | Right Click for advance Actions"
}

MultiBot.config.tanker = {
	"SINGLE",
	"tanker",
	"ability_warrior_shieldbash",
	"@tank d attack my target",
	"Click for Attack by Tank"
}

-- RAID --

MultiBot.config.raid.start = {
	"DOUBLE",
	"start",
	"inv_scroll_06",
	"inv_scroll_03",
	"HIDE:RAID",
	"SHOW:RAID",
	"Left Click to hide Group-Controls",
	"Left Click to show Group-Controls",
	""
}

MultiBot.config.raid.flee = {
	"SINGLE",
	"flee",
	"achievement_bg_returnxflags_def_wsg",
	"flee",
	"Click for Flee"
}

MultiBot.config.raid.stay = {
	"DOUBLE",
	"stay",
	"spell_holy_crusade",
	"achievement_bg_ab_defendflags",
	"stay",
	"follow",
	"Click for Stay",
	"Click for Follow"
}

MultiBot.config.raid.passive = {
	"SWITCH",
	"passive",
	"achievement_bg_winwsg_underxminutes",
	"co +passive,?",
	"co +passive,-passive,?",
	"Click for passive Mode",
	"Click for active Mode",
	"stay"
}

MultiBot.config.raid.attack = {
	"SINGLE",
	"attack",
	"ability_warrior_challange",
	"d attack my target",
	"Click for Attack"
}

MultiBot.config.raid.tanker = {
	"SINGLE",
	"tanker",
	"ability_warrior_shieldbash",
	"@tank d attack my target",
	"Click for Attack by Tank"
}

print("AfterMultiBot")