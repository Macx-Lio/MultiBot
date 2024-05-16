MultiBot.config.druid.buff = {
	"SWITCH",
	"buff",
	"spell_holy_power",
	"nc -buff,?",
	"nc +buff,?",
	"Click to disable Buffs",
	"Click to enable Buffs",
	"buff,"
}

MultiBot.config.druid.playbook = {
	"SWITCHBAR",
	"playbook",
	"inv_misc_book_06",
	{
		{
			"SWITCH=debuff",
			"casterDebuff",
			"ability_druid_cower",
			"co -caster debuff,?",
			"co +caster debuff,?",
			"Click to disable Caster Debuff",
			"Click to enable Caster Debuff",
			"caster debuff"
		},{
			"SWITCH",
			"casterAoe",
			"spell_arcane_starfire",
			"co -caster aoe,?",
			"co +caster aoe,?",
			"Click to disable Caster AOE",
			"Click to enable Caster AOE",
			"caster aoe"
		},{
			"SWITCH:heal",
			"caster",
			"spell_nature_starfall",
			"co -caster,?",
			"co +caster,?",
			"Click to disable Caster",
			"Click to enable Caster",
			"caster,"
		},{
			"SWITCH",
			"catAoe",
			"ability_druid_bash",
			"co -cat aoe,?",
			"co +cat aoe,?",
			"Click to disable Cat AOE",
			"Click to enable Cat AOE",
			"cat aoe"
		},{
			"SWITCH:heal=cat",
			"cat",
			"ability_druid_catform",
			"co -cat,?",
			"co +cat,?",
			"Click to disable Cat",
			"Click to enable Cat",
			"cat,"
		},{
			"SWITCH:heal=tank",
			"bear",
			"ability_racial_bearform",
			"co -bear,?",
			"co +bear,?",
			"Click to disable Bear",
			"Click to enable Bear",
			"bear"
		}
	},
	"Click to open the Playbook"
}

MultiBot.config.druid.dps = {
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
			"SWITCH=debuff",
			"dpsDebuff",
			"spell_holy_restoration",
			"co -caster debuff,?",
			"co +caster debuff,?",
			"Click to disable DPS Debuff",
			"Click to enable DPS Debuff",
			"caster debuff"
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
			"SWITCH=cat",
			"dps",
			"spell_holy_divinepurpose",
			"co -cat,?",
			"co +cat,?",
			"Click to disable DPS",
			"Click to enable DPS",
			"cat,"
		}
	},
	"Click to open Damage Control"
}

print("AfterMultiBotConfigDruid")