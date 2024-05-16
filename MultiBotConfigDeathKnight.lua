MultiBot.config.deathknight.presence = {
	"SELECT",
	"presence",
	{
		{
			"OPTION",
			"unholy",
			"spell_deathknight_unholypresence",
			"co -unholy,?",
			"co +unholy,?",
			"Click to enable Unholy",
			"unholy"
		},{
			"OPTION",
			"frost",
			"spell_deathknight_frostpresence",
			"co -frost,?",
			"co +frost,?",
			"Click to enable Frost",
			"frost"
		},{
			"OPTION",
			"blood",
			"spell_deathknight_bloodpresence",
			"co -blood,?",
			"co +blood,?",
			"Click to enable Blood",
			"blood"
		}
	},
	"Left Click for Options | Right Click for disable Presence",
	"Left Click for Options | Right Click for enable Presence"
}

MultiBot.config.deathknight.dps = {
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

print("AfterMultiBotConfigDeathKnight")