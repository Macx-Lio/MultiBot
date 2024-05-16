MultiBot.config = {}
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

print("AfterMultiBot")