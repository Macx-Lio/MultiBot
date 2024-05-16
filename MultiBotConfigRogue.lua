MultiBot.config.rogue.dps = {
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
		},{
			"SWITCH",
			"dps",
			"spell_holy_divinepurpose",
			"co -dps,?",
			"co +dps,?",
			"Click to disable DPS",
			"Click to enable DPS",
			"dps,"
		}
	},
	"Click to open Damage Control"
}

print("AfterMultiBotConfigRogue")