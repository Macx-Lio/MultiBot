MultiBot.config.priest.buff = {
	"SWITCH",
	"buff",
	"spell_holy_power",
	"nc -buff,?",
	"nc +buff,?",
	"Click to disable Buffs",
	"Click to enable Buffs",
	"buff,"
}

MultiBot.config.priest.playbook = {
	"SWITCHBAR",
	"playbook",
	"inv_misc_book_06",
	{
		{
			"SWITCH=debuff",
			"shadowDebuff",
			"spell_shadow_demonicempathy",
			"co -shadow debuff,?",
			"co +shadow debuff,?",
			"Click to disable Shadow Debuff",
			"Click to enable Shadow Debuff",
			"shadow debuff"
		},{
			"SWITCH:dps",
			"shadowAoe",
			"spell_arcane_arcanetorrent",
			"co -shadow aoe,?",
			"co +shadow aoe,?",
			"Click to disable Shadow AOE",
			"Click to enable Shadow AOE",
			"shadow aoe"
		},{
			"SWITCH:heal=shadow",
			"shadow",
			"spell_holy_devotion",
			"co -shadow,?",
			"co +shadow,?",
			"Click to disable Shadow",
			"Click to enable Shadow",
			"shadow,"
		}
	},
	"Click to open the Playbook"
}

MultiBot.config.priest.dps = {
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
			"co -shadow debuff,?",
			"co +shadow debuff,?",
			"Click to disable DPS Debuff",
			"Click to enable DPS Debuff",
			"shadow debuff"
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
			"SWITCH:heal=shadow",
			"dps",
			"spell_holy_divinepurpose",
			"co -shadow,?",
			"co +shadow,?",
			"Click to disable DPS",
			"Click to enable DPS",
			"shadow,"
		}
	},
	"Click to open Damage Control"
}

print("AfterMultiBotConfigPriest")