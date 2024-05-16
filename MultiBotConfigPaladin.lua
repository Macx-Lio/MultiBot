MultiBot.config.paladin.seal = {
	"SELECT",
	"seal",
	{
		{
			"OPTION",
			"health",
			"spell_holy_healingaura",
			"nc -bhealth,?",
			"nc +bhealth,?",
			"Click to enable Health Buffs",
			"bhealth"
		},{
			"OPTION",
			"mana",
			"spell_holy_sealofwisdom",
			"nc -bmana,?",
			"nc +bmana,?",
			"Click to enable Mana Buffs",
			"bmana"
		},{
			"OPTION",
			"stats",
			"spell_magic_magearmor",
			"nc -bstats,?",
			"nc +bstats,?",
			"Click to enable Stats Buffs",
			"bstats"
		},{
			"OPTION",
			"dps",
			"inv_hammer_01",
			"nc -bdps,?",
			"nc +bdps,?",
			"Click to enable DPS Buffs",
			"bdps"
		}
	},
	"Left Click for Options | Right Click for disable Seal",
	"Left Click for Options | Right Click for enable Seal"
}

MultiBot.config.paladin.naura = {
	"SELECT",
	"naura",
	{
		{
			"OPTION",
			"speed",
			"spell_holy_crusaderaura",
			"nc -bspeed,?",
			"nc +bspeed,?",
			"Click to enable Horse Aura",
			"bspeed"
		},{
			"OPTION",
			"fire",
			"spell_fire_sealoffire",
			"nc -rfire,?",
			"nc +rfire,?",
			"Click to enable Fire Aura",
			"rfire"
		},{
			"OPTION",
			"frost",
			"spell_frost_wizardmark",
			"nc -rfrost,?",
			"nc +rfrost,?",
			"Click to enable Frost Aura",
			"rfrost"
		},{
			"OPTION",
			"shadow",
			"spell_shadow_sealofkings",
			"nc -rshadow,?",
			"nc +rshadow,?",
			"Click to enable Shadow Aura",
			"rshadow"
		},{
			"OPTION",
			"armor",
			"spell_holy_devotionaura",
			"nc -barmor,?",
			"nc +barmor,?",
			"Click to enable Armor Aura",
			"barmor"
		}
	},
	"Normal | Left Click for Options | Right Click for disable Aura",
	"Normal | Left Click for Options | Right Click for enable Aura"
}

MultiBot.config.paladin.caura = {
	"SELECT",
	"caura",
	{
		{
			"OPTION",
			"speed",
			"spell_holy_crusaderaura",
			"co -bspeed,?",
			"co +bspeed,?",
			"Click to enable Horse Aura",
			"bspeed"
		},{
			"OPTION",
			"fire",
			"spell_fire_sealoffire",
			"co -rfire,?",
			"co +rfire,?",
			"Click to enable Fire Aura",
			"rfire"
		},{
			"OPTION",
			"frost",
			"spell_frost_wizardmark",
			"co -rfrost,?",
			"co +rfrost,?",
			"Click to enable Frost Aura",
			"rfrost"
		},{
			"OPTION",
			"shadow",
			"spell_shadow_sealofkings",
			"co -rshadow,?",
			"co +rshadow,?",
			"Click to enable Shadow Aura",
			"rshadow"
		},{
			"OPTION",
			"armor",
			"spell_holy_devotionaura",
			"co -barmor,?",
			"co +barmor,?",
			"Click to enable Armor Aura",
			"barmor"
		}
	},
	"Combat | Left Click for Options | Right Click for disable Aura",
	"Combat | Left Click for Options | Right Click for enable Aura"
}

MultiBot.config.paladin.dps = {
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

print("AfterMultiBotConfigPaladin")