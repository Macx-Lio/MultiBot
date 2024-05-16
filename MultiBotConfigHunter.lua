MultiBot.config.hunter.naspect = {
	"SELECT",
	"naspect",
	{
		{
			"OPTION",
			"rnature",
			"spell_nature_protectionformnature",
			"nc -rnature,?",
			"nc +rnature,?",
			"Click to enable Nature Apsect",
			"rnature"
		},{
			"OPTION",
			"bmana",
			"ability_hunter_aspectoftheviper",
			"nc -bmana,?",
			"nc +bmana,?",
			"Click to enable Mana Aspect",
			"bmana"
		},{
			"OPTION",
			"bdps",
			"ability_hunter_pet_dragonhawk",
			"nc -bdps,?",
			"nc +bdps,?",
			"Click to enable DPS Aspect",
			"bdps"
		}
	},
	"Normal | Left Click for Options | Right Click for disable Aspect",
	"Normal | Left Click for Options | Right Click for enable Aspect"
}

MultiBot.config.hunter.caspect = {
	"SELECT",
	"caspect",
	{
		{
			"OPTION",
			"rnature",
			"spell_nature_protectionformnature",
			"co -rnature,?",
			"co +rnature,?",
			"Click to enable Nature Apsect",
			"rnature"
		},{
			"OPTION",
			"bmana",
			"ability_hunter_aspectoftheviper",
			"co -bmana,?",
			"co +bmana,?",
			"Click to enable Mana Aspect",
			"bmana"
		},{
			"OPTION",
			"bdps",
			"ability_hunter_pet_dragonhawk",
			"co -bdps,?",
			"co +bdps,?",
			"Click to enable DPS Aspect",
			"bdps"
		}
	},
	"Combat | Left Click for Options | Right Click for disable Buff",
	"Combat | Left Click for Options | Right Click for enable Buff"
}

MultiBot.config.hunter.dps = {
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

print("AfterMultiBotConfigHunter")