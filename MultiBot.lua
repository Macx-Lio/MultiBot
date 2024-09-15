MultiBot.config = {}
MultiBot.config.raid = { {}, {}, {}, {}, {} }
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

-- USE: All
MultiBot.config.start = {
	"DOUBLE",
	"start",
	"inv_scroll_04",
	"inv_scroll_03",
	"HIDE",
	"SHOW",
	"Left Click to hide Playerbots | Right Click to close MultiBot",
	"Left Click to show Playerbots | Right Click to close Multibot",
	"/multibot"
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

-- USE: All
MultiBot.config.inventory = {
	"SWITCH",
	"inventory",
	"inv_misc_bag_08",
	"=== Inventory:Close ===",
	"=== Inventory:Open ===",
	"Click to close Inventory",
	"Click to open Inventory",
	"items"
}

-- GROUP --

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
	"=== Summon:All ===",
	"ability_hunter_beastcall",
	"summon",
	"Click to summon all active Bots"
}

MultiBot.config.flee = {
	"SINGLE",
	"flee",
	"achievement_bg_returnxflags_def_wsg",
	"flee",
	"Click for Flee"
}

MultiBot.config.stay = {
	"DOUBLE",
	"stay",
	"spell_holy_crusade",
	"achievement_bg_ab_defendflags",
	"stay",
	"follow",
	"Click for Stay",
	"Click for Follow"
}

MultiBot.config.passive = {
	"DOUBLE",
	"passive",
	"spell_holy_weaponmastery",
	"ability_dualwield",
	"co +passive,?",
	"co -passive,?",
	"Click for passive Mode",
	"Click for active Mode"
}

MultiBot.config.attack = {
	"SINGLE",
	"attack",
	"ability_rogue_ambush",
	"d attack my target",
	"Click for Attack"
}

MultiBot.config.tanker = {
	"SINGLE",
	"tanker",
	"ability_warrior_shieldbash",
	"@tank d attack my target",
	"Click for Attack by Tank"
}

-- RAID:GROUP1 --

MultiBot.config.raid[1].start = {
	"DOUBLE",
	"start",
	"inv_scroll_06",
	"inv_scroll_03",
	"HIDE",
	"SHOW",
	"Left Click to hide Group-Control",
	"Left Click to show Group-Control",
	""
}

MultiBot.config.raid[1].revive = {
	"SINGLE",
	"revive",
	"spell_holy_guardianspirit",
	"@group1 revive",
	"Click for Revive"
}

MultiBot.config.raid[1].release = {
	"SINGLE",
	"release",
	"achievement_bg_xkills_avgraveyard",
	"@group1 release",
	"Click for Release"
}

MultiBot.config.raid[1].flee = {
	"SINGLE",
	"flee",
	"achievement_bg_returnxflags_def_wsg",
	"@group1 flee",
	"Click for Flee"
}

MultiBot.config.raid[1].stay = {
	"DOUBLE",
	"stay",
	"spell_holy_crusade",
	"achievement_bg_ab_defendflags",
	"@group1 stay",
	"@group1 follow",
	"Click for Stay",
	"Click for Follow"
}

MultiBot.config.raid[1].passive = {
	"DOUBLE",
	"passive",
	"spell_holy_weaponmastery",
	"ability_dualwield",
	"@group1 co +passive,?",
	"@group1 co passive,-passive,?",
	"Click for passive Mode",
	"Click for active Mode"
}

MultiBot.config.raid[1].attack = {
	"SINGLE",
	"attack",
	"ability_rogue_ambush",
	"@group1 d attack my target",
	"Click for Attack"
}

MultiBot.config.raid[1].tanker = {
	"SINGLE",
	"tanker",
	"ability_warrior_shieldbash",
	"@group1 @tank d attack my target",
	"Click for Attack by Tank"
}

-- RAID:GROUP2 --

MultiBot.config.raid[2].start = {
	"DOUBLE",
	"start",
	"inv_scroll_06",
	"inv_scroll_03",
	"HIDE",
	"SHOW",
	"Left Click to hide Group-Control",
	"Left Click to show Group-Control",
	""
}

MultiBot.config.raid[2].revive = {
	"SINGLE",
	"revive",
	"spell_holy_guardianspirit",
	"@group2 revive",
	"Click for Revive"
}

MultiBot.config.raid[2].release = {
	"SINGLE",
	"release",
	"achievement_bg_xkills_avgraveyard",
	"@group2 release",
	"Click for Release"
}

MultiBot.config.raid[2].flee = {
	"SINGLE",
	"flee",
	"achievement_bg_returnxflags_def_wsg",
	"@group2 flee",
	"Click for Flee"
}

MultiBot.config.raid[2].stay = {
	"DOUBLE",
	"stay",
	"spell_holy_crusade",
	"achievement_bg_ab_defendflags",
	"@group2 stay",
	"@group2 follow",
	"Click for Stay",
	"Click for Follow"
}

MultiBot.config.raid[2].passive = {
	"DOUBLE",
	"passive",
	"spell_holy_weaponmastery",
	"ability_dualwield",
	"@group2 co +passive,?",
	"@group2 co passive,-passive,?",
	"Click for passive Mode",
	"Click for active Mode"
}

MultiBot.config.raid[2].attack = {
	"SINGLE",
	"attack",
	"ability_rogue_ambush",
	"@group2 d attack my target",
	"Click for Attack"
}

MultiBot.config.raid[2].tanker = {
	"SINGLE",
	"tanker",
	"ability_warrior_shieldbash",
	"@group2 @tank d attack my target",
	"Click for Attack by Tank"
}

-- RAID:GROUP3 --

MultiBot.config.raid[3].start = {
	"DOUBLE",
	"start",
	"inv_scroll_06",
	"inv_scroll_03",
	"HIDE",
	"SHOW",
	"Left Click to hide Group-Control",
	"Left Click to show Group-Control",
	""
}

MultiBot.config.raid[3].revive = {
	"SINGLE",
	"revive",
	"spell_holy_guardianspirit",
	"@group3 revive",
	"Click for Revive"
}

MultiBot.config.raid[3].release = {
	"SINGLE",
	"release",
	"achievement_bg_xkills_avgraveyard",
	"@group3 release",
	"Click for Release"
}

MultiBot.config.raid[3].flee = {
	"SINGLE",
	"flee",
	"achievement_bg_returnxflags_def_wsg",
	"@group3 flee",
	"Click for Flee"
}

MultiBot.config.raid[3].stay = {
	"DOUBLE",
	"stay",
	"spell_holy_crusade",
	"achievement_bg_ab_defendflags",
	"@group3 stay",
	"@group3 follow",
	"Click for Stay",
	"Click for Follow"
}

MultiBot.config.raid[3].passive = {
	"DOUBLE",
	"passive",
	"spell_holy_weaponmastery",
	"ability_dualwield",
	"@group3 co +passive,?",
	"@group3 co passive,-passive,?",
	"Click for passive Mode",
	"Click for active Mode"
}

MultiBot.config.raid[3].attack = {
	"SINGLE",
	"attack",
	"ability_rogue_ambush",
	"@group3 d attack my target",
	"Click for Attack"
}

MultiBot.config.raid[3].tanker = {
	"SINGLE",
	"tanker",
	"ability_warrior_shieldbash",
	"@group3 @tank d attack my target",
	"Click for Attack by Tank"
}

-- RAID:GROUP4 --

MultiBot.config.raid[4].start = {
	"DOUBLE",
	"start",
	"inv_scroll_06",
	"inv_scroll_03",
	"HIDE",
	"SHOW",
	"Left Click to hide Group-Control",
	"Left Click to show Group-Control",
	""
}

MultiBot.config.raid[4].revive = {
	"SINGLE",
	"revive",
	"spell_holy_guardianspirit",
	"@group4 revive",
	"Click for Revive"
}

MultiBot.config.raid[4].release = {
	"SINGLE",
	"release",
	"achievement_bg_xkills_avgraveyard",
	"@group4 release",
	"Click for Release"
}

MultiBot.config.raid[4].flee = {
	"SINGLE",
	"flee",
	"achievement_bg_returnxflags_def_wsg",
	"@group4 flee",
	"Click for Flee"
}

MultiBot.config.raid[4].stay = {
	"DOUBLE",
	"stay",
	"spell_holy_crusade",
	"achievement_bg_ab_defendflags",
	"@group4 stay",
	"@group4 follow",
	"Click for Stay",
	"Click for Follow"
}

MultiBot.config.raid[4].passive = {
	"DOUBLE",
	"passive",
	"spell_holy_weaponmastery",
	"ability_dualwield",
	"@group4 co +passive,?",
	"@group4 co passive,-passive,?",
	"Click for passive Mode",
	"Click for active Mode"
}

MultiBot.config.raid[4].attack = {
	"SINGLE",
	"attack",
	"ability_rogue_ambush",
	"@group4 d attack my target",
	"Click for Attack"
}

MultiBot.config.raid[4].tanker = {
	"SINGLE",
	"tanker",
	"ability_warrior_shieldbash",
	"@group4 @tank d attack my target",
	"Click for Attack by Tank"
}

-- RAID:GROUP5 --

MultiBot.config.raid[5].start = {
	"DOUBLE",
	"start",
	"inv_scroll_06",
	"inv_scroll_03",
	"HIDE",
	"SHOW",
	"Left Click to hide Group-Control",
	"Left Click to show Group-Control",
	""
}

MultiBot.config.raid[5].revive = {
	"SINGLE",
	"revive",
	"spell_holy_guardianspirit",
	"@group5 revive",
	"Click for Revive"
}

MultiBot.config.raid[5].release = {
	"SINGLE",
	"release",
	"achievement_bg_xkills_avgraveyard",
	"@group5 release",
	"Click for Release"
}

MultiBot.config.raid[5].flee = {
	"SINGLE",
	"flee",
	"achievement_bg_returnxflags_def_wsg",
	"@group5 flee",
	"Click for Flee"
}

MultiBot.config.raid[5].stay = {
	"DOUBLE",
	"stay",
	"spell_holy_crusade",
	"achievement_bg_ab_defendflags",
	"@group5 stay",
	"@group5 follow",
	"Click for Stay",
	"Click for Follow"
}

MultiBot.config.raid[5].passive = {
	"DOUBLE",
	"passive",
	"spell_holy_weaponmastery",
	"ability_dualwield",
	"@group5 co +passive,?",
	"@group5 co passive,-passive,?",
	"Click for passive Mode",
	"Click for active Mode"
}

MultiBot.config.raid[5].attack = {
	"SINGLE",
	"attack",
	"ability_rogue_ambush",
	"@group5 d attack my target",
	"Click for Attack"
}

MultiBot.config.raid[5].tanker = {
	"SINGLE",
	"tanker",
	"ability_warrior_shieldbash",
	"@group5 @tank d attack my target",
	"Click for Attack by Tank"
}

print("AfterMultiBot")