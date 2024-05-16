MultiBot.config.mage.buff = {
	"SWITCHBAR",
	"buff",
	"spell_holy_power",
	{
		{
			"SWITCH:buff",
			"bmana",
			"inv_elemental_primal_mana",
			"nc -bmana,?",
			"nc +bmana,?",
			"Click to disable Mana Buffs",
			"Click to enable Mana Buffs",
			"bmana"
		},{
			"SWITCH:buff",
			"bdps",
			"inv_elemental_primal_nether",
			"nc -bdps,?",
			"nc +bdps,?",
			"Click to disable DPS Buffs",
			"Click to enable DPS Buffs",
			"bdps"
		}
	},
	"Left Click to open Control | Right Click to disable Buff",
	"Left Click to open Control | Right Click to enable Buff",
	"nc -buff,?",
	"nc +buff,?",
	"buff"
}

MultiBot.config.mage.playbook = {
	"SWITCHBAR",
	"playbook",
	"inv_misc_book_06",
	{
		{
			"SWITCH",
			"arcaneAoe",
			"spell_arcane_starfire",
			"co -arcane aoe,?",
			"co +arcane aoe,?",
			"Click to disable Arcane AOE",
			"Click to enable Arcane AOE",
			"arcane aoe"
		},{
			"SWITCH:playbook",
			"arcane",
			"ability_mage_arcanebarrage",
			"co -arcane,?",
			"co +arcane,?",
			"Click to disable Arcane",
			"Click to enable Arcane",
			"arcane,"
		},{
			"SWITCH",
			"frostAoe",
			"spell_frost_freezingbreath",
			"co -frost aoe,?",
			"co +frost aoe,?",
			"Click to disable Frost AOE",
			"Click to enable Frost AOE",
			"frost aoe"
		},{
			"SWITCH:playbook",
			"frost",
			"spell_frost_frostbolt02",
			"co -frost,?",
			"co +frost,?",
			"Click to disable Frost",
			"Click to enable Frost",
			"frost,"
		},{
			"SWITCH",
			"fireAoe",
			"spell_shadow_rainoffire",
			"co -fire aoe,?",
			"co +fire aoe,?",
			"Click to disable Fire",
			"Click to enable Fire",
			"fire aoe"
		},{
			"SWITCH:playbook",
			"fire",
			"spell_fire_fireball02",
			"co -fire,?",
			"co +fire,?",
			"Click to disable Fire",
			"Click to enable Fire",
			"fire,"
		}
	},
	"Click to open the Playbook"
}

MultiBot.config.mage.dps = {
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

print("AfterMultiBotConfigMage")