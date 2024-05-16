MultiBot.config.shaman.ntotem = {
	"SELECT",
	"ntotem",
	{
		{
			"OPTION",
			"bmana",
			"spell_nature_manaregentotem",
			"nc -bmana,?",
			"nc +bmana,?",
			"Click to enable Mana Totem",
			"bmana"
		},{
			"OPTION",
			"bdps",
			"spell_nature_windfury",
			"nc -bdps,?",
			"nc +bdps,?",
			"Click to enable DPS Totem",
			"bdps"
		}
	},
	"Normal | Left Click for Options | Right Click for disable Totem",
	"Normal | Left Click for Options | Right Click for enable Totem"
}

MultiBot.config.shaman.ctotem = {
	"SELECT",
	"ctotem",
	{
		{
			"OPTION",
			"bmana",
			"spell_nature_manaregentotem",
			"co -bmana,?",
			"co +bmana,?",
			"Click to enable Mana Totem",
			"bmana"
		},{
			"OPTION",
			"bdps",
			"spell_nature_windfury",
			"co -bdps,?",
			"co +bdps,?",
			"Click to enable DPS Totem",
			"bdps"
		}
	},
	"Combat | Left Click for Options | Right Click for disable Totem",
	"Combat | Left Click for Options | Right Click for enable Totem"
}

MultiBot.config.shaman.playbook = {
	"SWITCHBAR",
	"playbook",
	"inv_misc_book_06",
	{
		{
			"SWITCH",
			"totems",
			"inv_relics_totemofrebirth",
			"co -totems,?",
			"co +totems,?",
			"Click to disable Totems",
			"Click to enable Totems",
			"totems"
		},{
			"SWITCH",
			"casterAoe",
			"spell_nature_lightningoverload",
			"co -caster aoe,?",
			"co +caster aoe,?",
			"Click to disable Caster AOE",
			"Click to enable Caster AOE",
			"caster aoe"
		},{
			"SWITCH:heal",
			"caster",
			"spell_nature_lightning",
			"co -caster,?",
			"co +caster,?",
			"Click to disable Caster",
			"Click to enable Caster",
			"caster,"
		},{
			"SWITCH",
			"meleeAoe",
			"ability_warrior_shockwave",
			"co -melee aoe,?",
			"co +melee aoe,?",
			"Click to disable Melee AOE",
			"Click to enable Melee AOE",
			"melee aoe"
		},{
			"SWITCH:heal",
			"melee",
			"ability_parry",
			"co -melee,?",
			"co +melee,?",
			"Click to disable Melee",
			"Click to enable Melee",
			"melee,"
		}
	},
	"Click to open the Playbook"
}

MultiBot.config.shaman.dps = {
	"SWITCHBAR",
	"dps",
	"ability_warrior_challange",
	{
		{
			"SWITCH:dps",
			"dpsAssist",
			"spell_holy_heroism",
			"co -dps assist,?",
			"co +dps assist,?",
			"Click to disable DPS Assist",
			"Click to enable DPS Assist",
			"dps assist"
		},{
			"SWITCH:dps",
			"dpsAoe",
			"spell_holy_surgeoflight",
			"co -dps aoe,?",
			"co +dps aoe,?",
			"Click to disable DPS AOE",
			"Click to enable DPS AOE",
			"dps aoe"
		}
	},
	"Click to open Damage Control"
}

print("AfterMultiBotConfigShaman")