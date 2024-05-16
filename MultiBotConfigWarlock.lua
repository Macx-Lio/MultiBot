MultiBot.config.warlock.buff = {
	"SELECT",
	"buff",
	{
		{
			"SWITCH:buff",
			"bhealth",
			"spell_shadow_lifedrain02",
			"nc -bhealth,?",
			"nc +bhealth,?",
			"Click to enable Health Buffs",
			"bhealth"
		},{
			"SWITCH:buff",
			"bmana",
			"spell_shadow_siphonmana",
			"nc -bmana,?",
			"nc +bmana,?",
			"Click to enable Mana Buffs",
			"bmana"
		},{
			"SWITCH:buff",
			"bdps",
			"spell_shadow_haunting",
			"nc -bdps,?",
			"nc +bdps,?",
			"Click to enable DPS Buffs",
			"bdps"
		}
	},
	"Left Click for Options | Right Click for disable Buff",
	"Left Click for Options | Right Click for enable Buff"
}

MultiBot.config.warlock.dps = {
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
			"SWITCH",
			"dpsDebuff",
			"spell_holy_restoration",
			"co -dps debuff,?",
			"co +dps debuff,?",
			"Click to disable DPS Debuff",
			"Click to enable DPS Debuff",
			"dps debuff"
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
			"SWITCH:heal",
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

print("AfterMultiBotConfigWarlock")