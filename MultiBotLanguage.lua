if(GetLocale() == "deDE") then
MultiBot.info.command =
"Befehl nicht gefunden.";

MultiBot.info.target =
"Ich habe kein Ziel.";

MultiBot.info.spell =
"Ich konnte den Zauber nicht identifizieren.";

MultiBot.info.macro =
"Ich habe bereits das Maximum an privaten Makros.";

MultiBot.info.neither =
"Ich habe weder ein Ziel noch bin ich in einem Raid oder einer Gruppe.";

MultiBot.info.group =
"Ich bin weder in einem Raid noch in einer Party.";

MultiBot.info.inviting =
"Lade NAME in die Gruppe ein.";

MultiBot.info.combat =
"Frage NAME nach Kampf-Strategien.";

MultiBot.info.teleport =
"wird dich zu 'MAP - ZONE' teleportieren";

MultiBot.info.normal =
"Frage NAME nach Nicht-Kampf-Strategien.";

MultiBot.info.inventory =
"Inventar von NAME";

MultiBot.info.spellbook =
"Zauberbuch von NAME";

MultiBot.info.player =
"Ich werde 'NAME' vom Playerbot-Roster nicht Auto-Initialisieren.";

MultiBot.info.member =
"Ich werde 'NAME' vom Gilden-Roster nicht Auto-Initialisieren.";

MultiBot.info.players =
"Ich werde niemanden vom Playerbot-Roster Auto-Initialisieren.";

MultiBot.info.members =
"Ich werden niemanden vom Gilden-Roster Auto-Initialisieren.";

MultiBot.info.wait =
"Ich lade bereits Mitglieder ein, bitte warte bis ich fertig bin.";

MultiBot.info.starting =
"Ich beginne jetzt Mitglieder einzuladen.";

MultiBot.info.stats =
"Auto-Stats ist für Party's nicht für Raid's.";

MultiBot.info.location =
"hat keine Position in sich gespeichert.";

MultiBot.info.itlocation =
"Er hat keine Position gespeichert.";

MultiBot.info.saving =
"Ich bin immer noch dabei meine Position zu speichern.";

MultiBot.info.action =
"Ich muss eine Aktion auswählen.";

MultiBot.info.combination =
"Es gibt keine Items für diese Kombination.";

-- MOVE --

MultiBot.tips.move.inventory =
"Rechtskicken und halten um das Inventar zu bewegen";

MultiBot.tips.move.stats =
"Rechtsklicken und halten um die Auto-Stats zu bewegen";

MultiBot.tips.move.itemus =
"Rechtsklicken und halten um Itemus zu bewegen";

MultiBot.tips.move.iconos = 
"Rechtsklicken und halten um Iconos zu bewegen";

MultiBot.tips.move.spellbook = 
"Rechtsklicken und halten um das Zauberbuch zu bewegen";

MultiBot.tips.move.reward =
"Rechtsklicken und halten um den Reward-Selector zu bewegen";

-- TANKER --

MultiBot.tips.tanker.master = 
"Tank-Attack\n|cffffffff"..
"Mit diesem Kommando befiehlt man den gepanzerten Einheiten anzugreifen.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um Tank-Attack auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

-- ATTACK --

MultiBot.tips.attack.master = 
"Attack-Control\n|cffffffff"..
"Mit dieser Steuereinheit befiehlt man den Angriff.\n"..
"Die Option rechtsklicken um eine neue Standardaktion festzulegen.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um die Standardaktion auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken um die Optionen ein- und auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.attack.attack = 
"Attack\n|cffffffff"..
"Mit diesem Kommando befiehlt man dem Raid oder der Party anzugreifen.|r\n\n"..
"|cffff0000Linksklicken um Attack auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.attack.ranged = 
"Ranged-Attack\n|cffffffff"..
"Mit diesem Kommando befiehlt man den Fernkämpfern anzugreifen.|r\n\n"..
"|cffff0000Linksklicken um Ranged-Attack auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.attack.melee = 
"Melee-Attack\n|cffffffff"..
"Mit diesem Kommando befiehlt man den Nahkämpfern anzugreifen.|r\n\n"..
"|cffff0000Linksklicken um Melee-Attack auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.attack.healer = 
"Healer-Attack\n|cffffffff"..
"Mit diesem Kommando befiehlt man den Heilern anzugreifen.|r\n\n"..
"|cffff0000Linksklicken um Healer-Attack auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.attack.dps = 
"DPS-Attack\n|cffffffff"..
"Mit diesem Kommando befiehlt man der DPS anzugreifen.|r\n\n"..
"|cffff0000Linksklicken um DPS-Attack auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.attack.tank = 
"Tank-Attack\n|cffffffff"..
"Mit diesem Kommando befiehlt man dem Tank anzugreifen.|r\n\n"..
"|cffff0000Linksklicken um Tank-Attack auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- MODE --

MultiBot.tips.mode.master = 
"Modus-Control\n|cffffffff"..
"Mit dieser Steuereinheit kann man Kampfmodi ein- und ausschalten.\n"..
"Die Option Linksklicken um einen neuen Kampfmodus auszuwählen.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um den Kampfmodus zu wechseln|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken um die Optionen ein- und auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.mode.passive = 
"Passiv-Modus\n|cffffffff"..
"Im Passiv-Modus greifen Einheiten keinen Gegner an.\n"..
"Dieser Modus verhindert, dass der Tank in die Gegner läuft während ihr welche anlockt.\n"..
"Das Stay-Kommando hebt Passiv-Modus auf, in Kombination sollte Stay zuerst befohlen werden.\n"..
"Das Follow-Kommando hebt den Passiv-Modus auf, in Kombination sollte Follow zuerst befohlen werden.|r\n\n"..
"|cffff0000Linksklicken um den Passiv-Modus auszuwählen und auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

MultiBot.tips.mode.grind = 
"Grind-Modus\n|cffffffff"..
"Im Grind-Modus greifen Einheiten eigenständig Gegner an.\n"..
"Dieser Modus ermöglicht ein eigenständiges Level deiner Einheiten.|r\n\n"..
"|cffff0000Linksklicken um den Grind-Modus auszuwählen und auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

-- STAY|FOLLOW --

MultiBot.tips.stallow.stay = 
"Stay|Follow\n|cffffffff"..
"Mit dieser Schaltfläche gibt man den Befehl zum Stehen-Bleiben.\n"..
"Dieses Kommando hebt den Passiv-Modus auf, in Kombination sollte Stay zuerst befohlen werden.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um Stay auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

MultiBot.tips.stallow.follow = 
"Stay|Follow\n|cffffffff"..
"Mit dieser Schaltfläche gibt man den Befehl zum Folgen.\n"..
"Dieses Kommando hebt den Passiv-Modus auf, in Kombination sollte Follow zuerst befohlen werden.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um Follow auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

-- FLEE --

MultiBot.tips.flee.master = 
"Flee-Control\n|cffffffff"..
"Mit dieser Steuereinheit befiehlt man die Flucht.\n"..
"Die Option rechtsklicken um eine neue Standardaktion festzulegen.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um die Standardaktion auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken um die Optionen ein- und auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.flee.flee = 
"Flee\n|cffffffff"..
"Mit diesem Kommando befiehlt man dem Raid oder der Party zu flüchten.|r\n\n"..
"|cffff0000Linksklicken um Flee auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.flee.ranged = 
"Ranged-Flee\n|cffffffff"..
"Mit diesem Kommando befiehlt man den Fernkämpfern zu flüchten.|r\n\n"..
"|cffff0000Linksklicken um Ranged-Flee auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.flee.melee = 
"Melee-Flee\n|cffffffff"..
"Mit diesem Kommando befiehlt man den Nahkämpfern zu flüchten.|r\n\n"..
"|cffff0000Linksklicken um Melee-Flee auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.flee.healer = 
"Healer-Flee\n|cffffffff"..
"Mit diesem Kommando befiehlt man den Heilern zu flüchten.|r\n\n"..
"|cffff0000Linksklicken um Healer-Flee auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.flee.dps = 
"DPS-Flee\n|cffffffff"..
"Mit diesem Kommando befiehlt man der DPS zu flüchten.|r\n\n"..
"|cffff0000Linksklicken um DPS-Flee auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.flee.tank = 
"Tank-Flee\n|cffffffff"..
"Mit diesem Kommando befiehlt man den Tank zu flüchten.|r\n\n"..
"|cffff0000Linksklicken um Tank-Flee auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.flee.target = 
"Target-Flee\n|cffffffff"..
"Mit diesem Kommando befiehlt man dem Ziel zu flüchten.|r\n\n"..
"|cffff0000Linksklicken um Target-Flee auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r\n\n"..
"|cffff0000Rechtsklicken zum Festlegen als Standardaktion|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- FORMATION --

MultiBot.tips.format.master = 
"Formation-Control\n|cffffffff"..
"Mit dieser Steuereinheit kann man die Formation der Bots zu ändern.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- und auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Rechtsklicken um die aktuellen Formation abzurufen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

MultiBot.tips.format.arrow = 
"Arrow-Formation\n|cffffffff"..
"Die Bots stellen sich in einer Pfeil-Formation auf.\n"..
"Die Blickrichtung der Bots entspricht der deinigen.\n\n"..
"1. Reihe Tanks\n"..
"2. Reihe Nahkämpfer\n"..
"3. Reihe Fernkämpfer\n"..
"4. Reihe Heiler|r\n\n"..
"|cffff0000Linksklicken um die Arrow-Formation auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

MultiBot.tips.format.queue = 
"Queue-Formation\n|cffffffff"..
"Die Bots stellen sich in einer defensiven Formation auf.\n"..
"Die Blickrichtung der Bots entspricht der deinigen.|r\n\n"..
"|cffff0000Linksklicken um die Queue-Formation auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

MultiBot.tips.format.near = 
"Near-Formation\n|cffffffff"..
"Die Bots stellen sich dicht nebeneinander auf.\n"..
"Die Blickrichtung der Bots entspricht der deinigen.|r\n\n"..
"|cffff0000Linksklicken um die Near-Formation auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

MultiBot.tips.format.melee = 
"Melee-Formation\n|cffffffff"..
"Die Bots stellen sich für den Nahkampf auf.\n"..
"Die Blickrichtung der Bots entspricht der deinigen.|r\n\n"..
"|cffff0000Linksklicken um die Melee-Formation auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

MultiBot.tips.format.line = 
"Line-Formation\n|cffffffff"..
"Die Bots stellen sich links und rechts von dir in einer Linie auf.\n"..
"Die Blickrichtung der Bots entspricht der deinigen.|r\n\n"..
"|cffff0000Linksklicken um die Line-Formation auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

MultiBot.tips.format.circle = 
"Circle-Formation\n|cffffffff"..
"Die Bots stellen sich in einem Kreis um dich herum auf.\n"..
"Die Blickrichtung der Bots ist nach außen gereichtet.|r\n\n"..
"|cffff0000Linksklicken um die Circle-Formation auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

MultiBot.tips.format.chaos = 
"Chaos-Formation\n|cffffffff"..
"Jeder Bots folgt dir nach eigenem Ermessen.\n"..
"Sie stellen sich völlig chaotisch auf.\n"..
"Die Blickrichtung ist vollkommen willkürlich.|r\n\n"..
"|cffff0000Linksklicken um die Chaos-Formation auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

MultiBot.tips.format.shield = 
"Shield-Formation\n|cffffffff"..
"Die Bots stellen sich vor und neben dir auf.\n"..
"Die Blickrichtung der Bots entspricht der deinigen.|r\n\n"..
"|cffff0000Linksklicken um die Shield-Formation auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

-- BEASTMASTER --

MultiBot.tips.beast.master = 
"Beastmaster-Control\n|cffffffff"..
"Diese Steuereinheit ist für Mod-NPC-Beastmaster des Azerothcore.\n"..
"Mod-NPC-Beastmaster erlaubt es jedem Character eine Bestie wie Jäger zu haben.\n"..
"Dein Character kann die notwendigen Zauber bei 'White Fang' erlernen.\n"..
"Der GameMaster muss 'White Fang' in der Spielwelt platzieren.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- und auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.beast.release =
"Bestie freilassen\n|cffffffff"..
"Mit diesem Kommando kann man die Bestie freilassen.|r\n\n".. 
"|cffff0000Linksklicken um die Bestie freizulassen|r\n"..
"|cff999999(Ausführreihenfolge: Ziel, Raid, Party)|r";

MultiBot.tips.beast.revive =
"Bestie wiederbeleben\n|cffffffff"..
"Mit diesem Kommando kann man die Bestie wiederbeleben.|r\n\n"..
"|cffff0000Linksklicken um die Bestie wiederzubeleben|r\n"..
"|cff999999(Ausführreihenfolge: Ziel, Raid, Party)|r";

MultiBot.tips.beast.heal =
"Bestie heilen\n|cffffffff"..
"Mit diesem Kommando kann man die Bestie heilen.|r\n\n"..
"|cffff0000Linksklicken um die Bestie zu heilen|r\n"..
"|cff999999(Ausführreihenfolge: Ziel, Raid, Party)|r";

MultiBot.tips.beast.feed =
"Bestie füttern\n|cffffffff"..
"Mit diesem Kommando kann man die Bestie füttern.|r\n\n"..
"|cffff0000Linksklicken um die Bestie zu füttern|r\n"..
"|cff999999(Ausführreihenfolge: Ziel, Raid, Party)|r";

MultiBot.tips.beast.call =
"Bestie herbeirufen\n|cffffffff"..
"Mit diesem Kommando kann man die Bestie herbeirufen.|r\n\n"..
"|cffff0000Linksklicken um die Bestie herbeizurufen|r\n"..
"|cff999999(Ausführreihenfolge: Ziel, Raid, Party)|r";

-- CREATOR --

MultiBot.tips.creator.master = 
"Creator-Control\n|cffffffff"..
"Mit dieser Steuereinheit kann man Random-Bots nach Klassen erzeugen.\n"..
"Das Standard-Limit liegt bei 40 Random-Bots pro Account.\n"..
"Es gibt kein Kommando die Bots nach gebrauch zu löschen.\n"..
"Ladet sie in die Freundesliste ein, um sie wiederzuverwenden.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- und auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.warrior =
"Krieger erstellen\n|cffffffff"..
"Diese Schaltfläche erstellt einen Krieger als Random-Bot.|r\n\n"..
"|cffff0000Linksklicken um einen Krieger zu erstellen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.warlock =
"Hexenmeister erstellen\n|cffffffff"..
"Diese Schaltfläche erstellt einen Hexenmeister als Random-Bot.|r\n\n"..
"|cffff0000Linksklicken um einen Hexenmeister zu erstellen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.shaman =
"Schamanen erstellen\n|cffffffff"..
"Diese Schaltfläche erstellt einen Schamanen als Random-Bot.|r\n\n"..
"|cffff0000Linksklicken um einen Schamanen zu erstellen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.rogue =
"Schurken erstellen\n|cffffffff"..
"Diese Schaltfläche erstellt einen Schurken als Random-Bot.|r\n\n"..
"|cffff0000Linksklicken um einen Schurken zu erstellen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.priest =
"Priester erstellen\n|cffffffff"..
"Diese Schaltfläche erstellt einen Priester als Random-Bot.|r\n\n"..
"|cffff0000Linksklicken um einen Priester zu erstellen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.paladin =
"Paladin erstellen\n|cffffffff"..
"Diese Schaltfläche erstellt einen Paladin als Random-Bot.|r\n\n"..
"|cffff0000Linksklicken um einen Paladin zu erstellen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.mage =
"Magier erstellen\n|cffffffff"..
"Diese Schaltfläche erstellt einen Magier als Random-Bot.|r\n\n"..
"|cffff0000Linksklicken um einen Magier zu erstellen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.hunter =
"Jäger erstellen\n|cffffffff"..
"Diese Schaltfläche erstellt einen Jäger als Random-Bot.|r\n\n"..
"|cffff0000Linksklicken um einen Jäger zu erstellen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.druid =
"Druide erstellen\n|cffffffff"..
"Diese Schaltfläche erstellt einen Druiden als Random-Bot.|r\n\n"..
"|cffff0000Linksklicken um einen Druiden zu erstellen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.deathknight =
"Todesritter erstellen\n|cffffffff"..
"Diese Schaltfläche erstellt einen Todesritter als Random-Bot.|r\n\n"..
"|cffff0000Linksklicken um einen Todesritter zu erstellen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.creator.inspect =
"Ziel betrachten\n|cffffffff"..
"Diese Schaltfläche öffnet ein Dialog-Fenster in dem man sein Ziel betrachten kann.|r\n\n"..
"|cffff0000Linksklicken um das Ziel zu betrachten|r\n"..
"|cff999999(Ausführreihenfolge: Ziel)|r";

MultiBot.tips.creator.init =
"Auto-Initialisiern\n|cffffffff"..
"Diese Schaltfläche initialisiert ein(e) Ziel, Raid oder Party automatisch.\n"..
"Es gibt 2 Limitationen, damit keine Ausrüstung überschrieben wird:\n"..
"- es funktioniert nicht mit Bots auf dem Playerbot-Roster.\n"..
"- es funktioniert nicht mit Bots auf dem Gilden-Roster.|r\n\n"..
"|cffff0000Linksklicken um ein Ziel zu initialisieren|r\n"..
"|cff999999(Ausführreihenfolge: Ziel)|r\n\n"..
"|cffff0000Rechtsklicken um eine Gruppe zu initialisieren|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

-- UNIT --

MultiBot.tips.unit.selfbot =
"Selfbot\n"..
"|cffffffffDiese Schaltfläche schaltet den Selfbot-Modus ein und aus.|r\n\n"..
"|cffff0000Linksklicken um Selfbot ein- oder auszuschalten|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.unit.button =
"|cffffffff\n"..
"Mit dieser Schaltfläche kann man NAME in seine Gruppe ein- oder ausladen.\n"..
"MultiBot wird den Playerbot nach seinen Kampf- und Nicht-Kampf-Strategien fragen.\n"..
"Die Strategien können mit der linken und rechten Schaltflächenleiste konfiguriert werden.\n"..
"Die Schaltflächenleisten erscheinen nach dem einalden eines Bots.|r\n\n"..
"|cffff0000Linksklicken um NAME einzuladen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Rechtsklicken um NAME auszuladen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- UNITS --

MultiBot.tips.units.master =
"Unit-Control\n|cffffffff"..
"In dieser Steuereinheit findet man die Playerbots.\n"..
"Jede Schaltfläche steht für einen Character, Gilden-Mitglied oder Freund.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um die Einheiten ein- und auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Rechtsklicken um die Roster zu aktualisieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- UNIT:FILTER --

MultiBot.tips.units.filter =
"Klassen-Filter\n|cffffffff"..
"Mit dem Klassen-Filter kann man die Einheiten nach ihrer Klasse filtern.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- und auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Rechtsklicken um den Filter zu entfernen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.deathknight =
"Klassen-Filter\n|cffffffff"..
"Filtert die Einheiten nach Todesrittern.|r\n\n"..
"|cffff0000Linksklicken um nach Todesrittern zu filtern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.druid =
"Klassen-Filter\n|cffffffff"..
"Filtert die Einheiten nach Druiden.|r\n\n"..
"|cffff0000Linksklicken um nach Druiden zu filtern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.hunter =
"Klassen-Filter\n|cffffffff"..
"Filtert die Einheiten nach Jägern.|r\n\n"..
"|cffff0000Linksklicken um nach Jägern zu filtern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.mage =
"Klassen-Filter\n|cffffffff"..
"Filtert die Einheiten nach Magiern.|r\n\n"..
"|cffff0000Linksklicken um nach Magiern zu filtern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.paladin =
"Klassen-Filter\n|cffffffff"..
"Filtert die Einheiten nach Paladine.|r\n\n"..
"|cffff0000Linksklicken um nach Paladine zu filtern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.priest =
"Klassen-Filter\n|cffffffff"..
"Filtert die Einheiten nach Priestern.|r\n\n"..
"|cffff0000Linksklicken um nach Priestern zu filtern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.rogue =
"Klassen-Filter\n|cffffffff"..
"Filtert die Einheiten nach Schurken.|r\n\n"..
"|cffff0000Linksklicken um nach Schurken zu filtern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.shaman =
"Klassen-Filter\n|cffffffff"..
"Filtert die Einheiten nach Schamanen.|r\n\n"..
"|cffff0000Linksklicken um nach Schamanen zu filtern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.warlock =
"Klassen-Filter\n|cffffffff"..
"Filtert die Einheiten nach Hexenmeistern.|r\n\n"..
"|cffff0000Linksklicken um nach Hexenmeistern zu filtern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.warrior =
"Klassen-Filter\n|cffffffff"..
"Filtert die Einheiten nach Kriegern.|r\n\n"..
"|cffff0000Linksklicken um nach Kriegern zu filtern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.none =
"Klassen-Filter\n|cffffffff"..
"Entfernt den Klassen-Filter von den Einheiten.|r\n\n"..
"|cffff0000Linksklicken um den Filter zu entfernen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- UNITS:ROSTER --

MultiBot.tips.units.roster =
"Roster-Filter\n|cffffffff"..
"Mit dem Roster-Filter kann man zwischen den verschienden Rostern wechseln.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- und auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Rechtsklicken um den Filter zu entfernen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.actives =
"Roster-Filter\n|cffffffff"..
"Zeigt alle aktiven Gruppen-Mitglieder an.|r\n\n"..
"|cffff0000Linksklicken um den Aktiv-Roster auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.players =
"Roster-Filter\n|cffffffff"..
"Zeigt den Playerbot-Roster.\n"..
"Normalerweise deine Characteren und Andere welche in der Gruppe verblieben sind.|r\n\n"..
"|cffff0000Linksklicken um den Playerbot-Roster auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.members =
"Roster-Filter\n|cffffffff"..
"Zeigt den Gilden-Roster.\n"..
"Der Gilden-Roster zeigt nicht deine eigenen Character an.|r\n\n"..
"|cffff0000Linksklicken um den Gilden-Roster auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.friends =
"Roster-Filter\n|cffffffff"..
"Zeigt den Freunde-Roster.\n"..
"Der Freund-Roster zeigt nicht deine eignen Character und nicht die Gilden-Mitglieder an.|r\n\n"..
"|cffff0000Linksklicken um den Freunde-Roster auszuwählen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- UNIT:BROWSE --

MultiBot.tips.units.browse =
"Browse\n|cffffffff"..
"Mit dieser Schaltfläche kann man den Roster durchblättern.\n"..
"Sie wird ausgeblendet sobald ein Roster weniger als 11 Einheiten hat.|r\n\n"..
"|cffff0000Linksklicken um den Roster durchzublättern|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.invite =
"Invite-Control\n|cffffffff"..
"Mit dieser Steuereinheit kann man die Gruppe automatisch auffüllen.\n"..
"Die linke Schaltfläche ist für 'Party-Invite', die rechten Schaltflächen sind für 'Raid-Invite'.\n"..
"Ein Rechtsklick auf diese Schaltfläche entfernt alle Bots auf einmal.|r\n\n"..
"|cffff0000Linksklicken um die Steuereinheit ein- oder auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Rechtklicken um alle Bots zu entfernen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.inviteParty5 =
"5er Party\n|cffffffff"..
"Mit dieser Schaltfläche füllt man seine Party auf.\n"..
"Diese Funktion nimmt Einheiten vom aktuellen Roster und ignoriert dabei den Klassen-Filter.\n"..
"Sie hält am Ende des Rosters oder sobald die Gruppe 5 Mitglieder hat.|r\n\n"..
"|cffff0000Linksklicken um Party-Mitglieder einzuladen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.inviteRaid10 =
"10er Raid\n|cffffffff"..
"Mit dieser Schaltfläche füllt man sein Raid auf.\n"..
"Diese Funktion nimmt Einheiten vom aktuellen Roster und ignoriert dabei den Klassen-Filter.\n"..
"Sie hält am Ende des Rosters oder sobald die Gruppe 10 Mitglieder hat.|r\n\n"..
"|cffff0000Linksklicken um Raid-Mitglieder einzuladen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.inviteRaid25 =
"25er Raid\n|cffffffff"..
"Mit dieser Schaltfläche füllt man sein Raid auf.\n"..
"Diese Funktion nimmt Einheiten vom aktuellen Roster und ignoriert dabei den Klassen-Filter.\n"..
"Sie hält am Ende des Rosters oder sobald die Gruppe 25 Mitglieder hat.|r\n\n"..
"|cffff0000Linksklicken um Raid-Mitglieder einzuladen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.units.inviteRaid40 =
"40er Raid\n|cffffffff"..
"Mit dieser Schaltfläche füllt man sein Raid auf.\n"..
"Diese Funktion nimmt Einheiten vom aktuellen Roster und ignoriert dabei den Klassen-Filter.\n"..
"Sie hält am Ende des Rosters oder sobald die Gruppe 40 Mitglieder hat.|r\n\n"..
"|cffff0000Linksklicken um Raid-Mitglieder einzuladen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- MAIN --

MultiBot.tips.main.master =
"Main-Control\n|cffffffff"..
"In dieser Steuereinheit findet man die Auto-Schalter und Reset-Kommandos.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- oder auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Rechtsklicken um MultiBot zu schließen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.main.coords =
"Reset-Coords\n|cffffffff"..
"Setzt die Koordinaten der folgenden Erweiterungen zurück:\n"..
"MultiBar, Inventar, Zauberbuch, Itemus, Iconos und Reward-Selector|r\n\n"..
"|cffff0000Linksklicken um die Koordinaten zurückzusetzen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.main.release =
"Auto-Release\n|cffffffff"..
"Diese Erweiterung erkennt wenn ein Bot stirbt.\n"..
"Tode Bots werden automatisch freigelassen und herbeigerufen.\n"..
"Dadurch werden die Bots innerhalb von Sekunden wiederbelebt.\n"..
"|cffff0000Linksklicken um Auto-Release ein- oder auszuschalten|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.main.stats =
"Auto-Stats\n|cffffffff"..
"Diese Erweiterung visualisiert die Werte vom Stats-Kommando.\n"..
"Die Stats-Werte aktualisieren sich 45 Sekunden.|r\n\n"..
"|cffff0000Linksklicken um Auto-Stats ein- oder auszuschalten|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.main.reward =
"Reward-Selector\n|cffffffff"..
"Diese Erweiterung visualisiert die Auswahl von Belohnungen.\n"..
"Mein Rat ist, zuerest die Belohnung für den eigenen Character auszuwählen.\n"..
"Dann hat man keine Probleme beim Betrachten der Bots.\n"..
"Wichtig:\n"..
"Sobald der eigene Character eine Quest beendet hat, müssen auch alle Bots die Quest beenden.\n"..
"Also brecht nicht den Reward-Selector ab sobald der eigene Character seine Belohnung hat.\n"..
"|cffffffffMod-Playerbot-Konfiguration:\n"..
"- (muss) AiPlayerbot.AutoPickReward = no\n"..
"- (sollte) AiPlayerbot.SyncQuestWithPlayer = 1|r\n\n"..
"|cffff0000Linksklicken um Reward-Selector ein- oder auszuschalten|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Rechtsklicken um Reward-Selector zu öffnen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.main.reset =
"Reset-Bots\n|cffffffff"..
"Diese Schaltfläche setzt die künstliche Intelligenz der Bots zurück.|r\n\n"..
"|cffff0000Linksklicken um die künstliche Intelligenz zurückzusetzen|r\n"..
"|cff999999(Ausführreihenfolge: Ziel, Raid, Party)|r";

MultiBot.tips.main.action =
"Reset-Action\n|cffffffff"..
"Diese Schaltfläche bricht die aktuelle Aktion der Bots ab.|r\n\n"..
"|cffff0000Linksklicken um die Aktion abzubrechen|r\n"..
"|cff999999(Ausführreihenfolge: Ziel, Raid, Party)|r";

-- GAMEMASTER --

MultiBot.tips.game.master =
"GameMaster-Control\n|cffffffff"..
"In dieser Steuereinheit findet man nützliche GameMaster-Kommandos und -Werkzeuge.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- oder auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Rechtsklicken und halten um MultiBar zu verschieben|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.game.necronet =
"Necro-Network\n|cffffffff"..
"Diese Schaltfläche aktiviert oder deaktiviert das Necro-Network.\n"..
"Wenn das Necro-Network aktiviert ist, findet man Grabstein-Schaltflächen auf der Weltkarte.\n"..
"Mit jeder Grabstein-Schaltfläche kann man sich zum entsprehenden Friedhof teleportieren.\n"..
"Man benötigt GameMaster-Rechte um diese Schaltflächen zu benutzen.|r\n\n"..
"|cffff0000Linksklicken um Necro-Network ein- oder auszuschalten|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.game.portal =
"Memory-Portal\n|cffffffff"..
"In dieser Kiste findet man die Memory-Steine.\n"..
"Benutze die Memory-Steine um deine aktuelle Position zu speichern.\n"..
"Mit einen Memory-Stein kann man sich jederzeit an die gespeicherte Position teleportieren.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- oder auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.game.memory =
"Memory-Gem\n|cffffffff"..
"Dieser Memory-Stein ABOUT.\n"..
"Man benötigt GameMaster-Rechte um diese Schaltflächen zu benutzen.|r\n\n"..
"|cffff0000Linksklicken um eine Position zu speichern oder abzurufen|r\n"..
"|cff999999(Ausführreihenfolge: Selbst)|r\n\n"..
"|cffff0000Rechtsklicken um eine Position zu vergessen|r\n"..
"|cff999999(Ausführreihenfolge: Selbst)|r";

MultiBot.tips.game.itemus = 
"Itemus\n|cffffffff"..
"Man findet jedes Item in der Kiste des GameMasters.\n"..
"Ziehlt auf einen Spieler oder Bot, mit einem Linksklick auf das Item werden Träume war.\n"..
"Wichtig, nicht jedes Item kann man generieren, daher muss man es schon ausprobieren.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um Itemus zu öffnen oder schließen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.game.iconos = 
"Iconos\n|cffffffff"..
"Man findet jedes Icon inklusive Pfadangabe in diesem Werkzeug.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um Iconos zu öffnen oder schließen|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.game.summon =
"Summon\n|cffffffff"..
"Beschwört einen anvisierten Spieler oder Bot an deine Position.\n"..
"Man benötigt GameMaster-Rechte um diese Schaltflächen zu benutzen.|r\n\n"..
"|cffff0000Linskklicken um das Ziel zu beschwören|r\n"..
"|cff999999(Ausführreihenfolge: Ziel)|r";

MultiBot.tips.game.appear =
"Appear\n|cffffffff"..
"Du erscheinst an der Position des anvisierten Spielers oder Bots.\n"..
"Man benötigt GameMaster-Rechte um diese Schaltflächen zu benutzen.|r\n\n"..
"|cffff0000Linksklicken um beim Ziel zu erscheinen|r\n"..
"|cff999999(Ausführreihenfolge: Ziel)|r";

-- DRINK --

MultiBot.tips.drink.group = 
"Group-Drink\n|cffffffff"..
"Mit diesem Kommando befiehlt man der Gruppe etwas zu trinken.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um Group-Drink auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

-- RELEASE --

MultiBot.tips.release.group = 
"Group-Release\n|cffffffff"..
"Mit diesem Kommando geben die toten Bots ihre Geister auf den nächsten Friedhof frei.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um Group-Release auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

-- REVIVE --

MultiBot.tips.revive.group = 
"Group-Revive\n|cffffffff"..
"Mit diesem Kommando werden Geister-Bots auf dem nächsten Friedhof wiederbelebt.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um Group-Revive auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

-- SUMALL --

MultiBot.tips.summon.group = 
"Group-Summon\n|cffffffff"..
"Mit diesem Kommando ruft man die Gruppe an seine Position.\n"..
"Die Ausführreihenfolge zeigt die Empfänger des Befehls.|r\n\n"..
"|cffff0000Linksklicken um Group-Summon auszuführen|r\n"..
"|cff999999(Ausführreihenfolge: Raid, Party)|r";

-- INVENTORY --

MultiBot.tips.inventory.sell =
"Items verkaufen|cffffffff\n"..
"Diese Schaltfläche aktiviert den Verkaufs-Modus des Inventars.\n"..
"Man muss einen Händler als Ziel ausgewählt haben.\n"..
"Aus Sicherheitsgründen verkaufen Bots keine:\n"..
"- Items mit 'Schlüssel' in ihrem Namen\n"..
"- den Ruhestein|r\n\n"..
"|cffff0000Linksklicken um Verkauf zu aktiviern|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.inventory.equip =
"Items ausrüsten|cffffffff\n"..
"Diese Schaltfläche aktiviert den Ausrüst-Modus des Inventars.\n"..
"|cffff0000Linksklicken um Ausrüsten zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.inventory.use =
"Items benutzen|cffffffff\n"..
"Diese Schaltfläche aktiviert den Benutzen-Modus des Inventars.\n"..
"|cffff0000Linksklicken um Benutzen zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.inventory.drop =
"Items zerstören|cffffffff\n"..
"Diese Schaltfläche aktiviert den Zerstör-Modus des Inventars.\n"..
"Aus Sicherheitsgründen zerstören Bots keine:\n"..
"- Items mit einer Qualität von Episch oder besser\n"..
"- Items mit 'Schlüssel' in ihrem Namen\n"..
"- den Ruhestein|r\n\n"..
"|cffff0000Linktsklicken um Zerstören zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

-- ITEMUS:LEVEL --

MultiBot.tips.itemus.level.master =
"Level-Filter|cffffffff\n"..
"Filtert die Items nach Level in 10er Schritten.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- oder auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.level.L10 =
"Level 0 bis 10|cffffffff\n"..
"Zeigt alle Items mit einer Level-Vorraussetzung von 0 bis 10 an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.level.L20 =
"Level 11 bis 20|cffffffff\n"..
"Zeigt alle Items mit einer Level-Vorraussetzung von 11 bis 20 an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.level.L30 =
"Level 21 bis 30|cffffffff\n"..
"Zeigt alle Items mit einer Level-Vorraussetzung von 21 bis 30 an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.level.L40 =
"Level 31 bis 40|cffffffff\n"..
"Zeigt alle Items mit einer Level-Vorraussetzung von 31 bis 40 an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.level.L50 =
"Level 41 bis 50|cffffffff\n"..
"Zeigt alle Items mit einer Level-Vorraussetzung von 41 bis 50 an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.level.L60 =
"Level 51 bis 60|cffffffff\n"..
"Zeigt alle Items mit einer Level-Vorraussetzung von 51 bis 60 an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.level.L70 =
"Level 61 bis 70|cffffffff\n"..
"Zeigt alle Items mit einer Level-Vorraussetzung von 61 bis 70 an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.level.L80 =
"Level 71 bis 80|cffffffff\n"..
"Zeigt alle Items mit einer Level-Vorraussetzung von 71 bis 80 an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- ITEMUS:RARE --

MultiBot.tips.itemus.rare.master =
"Quality-Filter|cffffffff\n"..
"Filtert die Items nach Qualität.\n"..
"Dieser Filter ist additiv zum Level-Filter.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- und auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.rare.R00 =
"Poor-Quality|cffffffff\n"..
"Zeigt alle Items von schlechter Qualität an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.rare.R01 =
"Common-Quality|cffffffff\n"..
"Zeigt alle Items von einfacher Qualität an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.rare.R02 =
"Non-Common-Quality|cffffffff\n"..
"Zeigt alle Items von unüblicher Qualität an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.rare.R03 =
"Rare-Quality|cffffffff\n"..
"Zeigt alle Items von seltener Qualität an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.rare.R04 =
"Epic-Quality|cffffffff\n"..
"Zeigt alle Items von epischer Qualität an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.rare.R05 =
"Legendary-Quality|cffffffff\n"..
"Zeigt alle Items von legendärer Qualität an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.rare.R06 =
"Artifact-Quality|cffffffff\n"..
"Zeigt alle Items der Artefakt-Qualität an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.rare.R07 =
"Heirlooms-Quality|cffffffff\n"..
"Zeigt alle Items der Erbstück-Qualität an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- ITEMUS:SLOT --

MultiBot.tips.itemus.slot.master =
"Slot-Filter|cffffffff\n"..
"Filtert die Items nach Ausrüstungsplätzen.\n"..
"Dieser Filter ist additiv zum Level- und Qualitäts-Filter.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- oder auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S00 =
"Non-Equipable|cffffffff\n"..
"Zeigt alle nicht ausrüstbaren Items an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S01 =
"Head-Slot|cffffffff\n"..
"Zeigt alle Items die man am Kopf ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S02 =
"Neck-Slot|cffffffff\n"..
"Zeigt alle Items die man am Hals ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S03 =
"Shoulder-Slot|cffffffff\n"..
"Zeigt alle Items die man an den Schultern ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S04 =
"Shirt-Slot|cffffffff\n"..
"Zeigt alle Items die man als Hemd ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S05 =
"Chest-Slot|cffffffff\n"..
"Zeigt alle Items die man an der Brust ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S06 =
"Waist-Slot|cffffffff\n"..
"Zeit alle Items die man an der Taille ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S07 =
"Legs-Slot|cffffffff\n"..
"Zeigt alle Items die man an den Beinen ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S08 =
"Feets-Slot|cffffffff\n"..
"Zeigt alle Items die man an den Füßen ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S09 =
"Wrists-Slot|cffffffff\n"..
"Zeigt alle Items die man am Handgelenken ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S10 =
"Hands-Slot|cffffffff\n"..
"Zeigt alle Items die man an den Händen ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S11 =
"Finger-Slot|cffffffff\n"..
"Zeigt alle Items die man an dem Fingern ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S12 =
"Trinket-Slot|cffffffff\n"..
"Zeigt alle Items die man an den Ohren ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S13 =
"One-Hand-Weapon-Slot|cffffffff\n"..
"Zeigt alle Items die man als Einhandwaffe ausrüsten kann an.\n"..
"Diese Waffen können in der Haupt- und Nebenhand geführt werden.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S14 =
"Shield-Slot|cffffffff\n"..
"Zeigt alle Items die man als Schild ausrüsten kann an.\n"..
"Schilde werden immer in der Nebenhand geführt.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S15 =
"Ranged-Slot|cffffffff\n"..
"Zeigt alle Items die man als Fernkampfwaffe ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S16 =
"Back-Slot|cffffffff\n"..
"Zeigt alle Items die man am Rücken ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S17 =
"Two-Hand-Weapon-Slot|cffffffff\n"..
"Zeigt alle Items die man als Zweihandwaffe ausrüsten kann an.\n"..
"Diese Waffen werden in der Haupthand geführt und blockieren die Nebenhand.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S18 =
"Bag-Slot|cffffffff\n"..
"Zeigt alle Items die man als Tasche ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S19 =
"Tabard-Slot|cffffffff\n"..
"Zeigt alle Items die als Wappenrock ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S20 =
"Robe-Slot|cffffffff\n"..
"Zeigt alle Items die man als Robe ausrüsten kann an.\n"..
"Roben werden an der Burst ausgerüstet.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S21 =
"Main-Hand-Weapons-Slot|cffffffff\n"..
"Zeigt alle Waffen die man in der Haupthand ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S22 =
"Off-Hand-Weapons-Slot|cffffffff\n"..
"Zeigt alle Waffen die man in der Nebenhand ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S23 =
"Off-Hand-Items-Slot|cffffffff\n"..
"Zeigt alle Items die man in der Nebenhand ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S24 =
"Ammo-Slot|cffffffff\n"..
"Zeigt alle Items die man als Munition ausrüsten kann an.\n"..
"Dieser Rüstplatz ist der gleiche wie 'Ranged-Right'|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S25 =
"Throw-Slot|cffffffff\n"..
"Zeigt alle Items die man als Wurfwaffen ausrüsten kann an.\n"..
"Dieser Rüstplatz ist der gleiche wie 'Ranged'|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S26 =
"Ranged-Right-Slot|cffffffff\n"..
"Zeigt alle Items die man als Munition ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S27 =
"Quiver-Slot|cffffffff\n"..
"Zeigt alle Items die man als Köcher ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

MultiBot.tips.itemus.slot.S28 =
"Relic-Slot|cffffffff\n"..
"Zeigt alle Items die man als Relikt ausrüsten kann an.|r\n\n"..
"|cffff0000Linksklickem um diesen Filter zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- ITEMUS:TYPE --

MultiBot.tips.itemus.type =
"Type-Filter|cffffffff\n"..
"Mit diesem Filter kann man zwischen Player-Character und Non-Player-Character Items wechseln.\n"..
"Dieser Filter ist additiv zum Level-, Qualitäts- und Slot-Filter.|r\n\n"..
"|cffff0000Linksklicken zwischen PC- und NPC-Ausrüstung umzuschalten|r\n"..
"|cff999999(Ausführreihenfolge: System)|r";

-- DEATHKNIGHT --

MultiBot.tips.deathknight.presence.master =
"Präsenz-Control|cffffffff\n"..
"Diese Steuereinheit erlaubt es die Präsenz auszuwählen, zu aktivieren oder deaktivieren.|r\n\n"..
"This Control allows you to select, enable or disable the default Precence.|r\n\n"..
"|cffff0000Linksklicken um die Optionen ein- oder auszublenden|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Rechtsklicken um die Präsenz ein- oder auszuschalten.|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.deathknight.presence.unholy =
"Unheilige-Präsenz|cffffffff\n"..
"Diese Option aktiviert die Unheilige-Präsenz.|r\n\n"..
"|cffff0000Linksklicken um die Unheilige-Präsenz zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.deathknight.presence.frost =
"Eisige-Präsenz|cffffffff\n"..
"Diese Option aktiviert die Eisige-Präsenz.|r\n\n"..
"|cffff0000Linksklicken um die Eisige-Präsenz zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.deathknight.presence.blood =
"Blutige-Präsenz|cffffffff\n"..
"Diese Option aktiviert die Blutige-Präsenz.|r\n\n"..
"|cffff0000Linksklicken um die Blutige-Präsenz zu aktivieren|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.deathknight.dps.master =
"DPS-Control|cffffffff\n"..
"Mit dieser Steuereinheit legt man die generelle DPS-Strategie fest.|r\n\n"..
"|cffff0000Linksklicken um die Steuereinheit ein- oder auszublenden|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.deathknight.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"Diese Schaltfläche aktiviert die DPS-Assist-Strategie.\n"..
"DPS-AOE, DPS-Assist und Tank-Assist schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um DPS-Assist ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.deathknight.dps.dpsAoe =
"DPS-AOE|cffffffff\n"..
"Diese Schaltfläche aktiviert die DPS-AOE-Strategie.\n"..
"DPS-AOE, DPS-Assist und Tank-Assist schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um DPS-AOE ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.deathknight.tankAssist =
"Tank-Assist|cffffffff\n"..
"Diese Schaltfläche aktiviert die Tank-Assist-Strategie.\n"..
"DPS-AOE, DPS-Assist und Tank-Assist schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um Tank-Assist ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

-- DRUID --

MultiBot.tips.druid.heal =
"Heal|cffffffff\n"..
"Diese Strategie macht den Druiden zum Heiler der Gruppe.\n"..
"Bär, Katze, Zauberer und Heiler schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um Heal ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.buff =
"Buff|cffffffff\n"..
"Diese Strategie erlaubt dem Druiden die Gruppe zu buffen.|r\n\n"..
"|cffff0000Linksklicken um Buff ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.playbook.master =
"Playbook|cffffffff\n"..
"Im Playbook findet man die Klassen-typischen Strategien.|r\n\n"..
"|cffff0000Linksklicken um das Playbook ein- oder auszublenden|r\n"..
"|cf9999999(Ausführreihenfolge: System)|r";

MultiBot.tips.druid.playbook.casterDebuff =
"Caster-Debuff|cffffffff\n"..
"Diese Strategie erlaubt dem Druiden als Zauberer Debuff-Spells während des Kampfes zu verwenden.|r\n\n"..
"|cffff0000Linksklicken um Caster-Debuff ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.playbook.casterAoe =
"Caster-AOE|cffffffff\n"..
"Diese Strategie erlaubt dem Druiden als Zauberer AOE-Spells während des Kampfes zu verwenden.|r\n\n"..
"|cffff0000Linksklicken um Caster-AOE ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.playbook.caster =
"Caster|cffffffff\n"..
"Diese Strategie macht den Druiden zum Zauberer.|r\n\n"..
"Bär, Katze, Zauberer und Heiler schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um Caster ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.playbook.catAoe =
"Cat-AOE|cffffffff\n"..
"Diese Strategie erlaubt dem Druiden als Katze AOE-Attacken zu verwenden.|r\n\n"..
"|cffff0000Linksklicken um Cat-AOE ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.playbook.cat =
"Cat|cffffffff\n"..
"Diese Strategie versetzt den Druiden in die Katzen-Gestalt.\n"..
"Bär, Katze, Zauberer und Heiler schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um Cat ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.playbook.bear =
"Bear|cffffffff\n"..
"Diese Strategie versetzt den Druiden in die Bären-Gestalt.\n"..
"Bär, Katze, Zauberer und Heiler schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um Bear ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.dps.master =
"DPS-Control|cffffffff\n"..
"Mit dieser Steuereinheit legt man die generelle DPS-Strategie fest.|r\n\n"..
"|cffff0000Linksklicken um die Steuereinheit ein- oder auszublenden|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"Diese Schaltfläche aktiviert die DPS-Assist-Strategie.\n"..
"DPS-AOE, DPS-Assist und Tank-Assist schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um DPS-Assist ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.dps.dpsDebuff =
"DPS-Debuff|cffffffff\n"..
"Diese Schaltfläche aktiviert die Debuff-Strategie.\n"..
"Der Druide kann diese Strategie nur als Zauberer verwenden.\n"..
"Bär, Katze, Zauberer und Heiler schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um DPS-Debuff ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.dps.dpsAoe =
"DPS-AOE|cffffffff\n"..
"Diese Schaltfläche aktiviert die DPS-AOE-Strategie.\n"..
"Der Druide kann diese Strategie nur als Katze oder Zauberer verwenden.\n"..
"DPS-AOE, DPS-Assist und Tank-Assist schließen sich gegenseitig aus.\n"..
"Bär, Katze, Zauberer und Heiler schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um DPS-AOE ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.dps.dps = 
"DPS|cffffffff\n"..
"Diese Schaltfläche aktiviert die DPS-Strategie.\n"..
"Der Druide kann diese Strategie nur als Katze verwenden.\n"..
"DPS-AOE, DPS-Assist und Tank-Assist schließen sich gegenseitig aus.\n"..
"Bär, Katze, Zauberer und Heiler schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um DPS ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.tankAssist = 
"Tank-Assist|cffffffff\n"..
"Diese Schaltfläche aktiviert die Tank-Assist-Strategie.\n"..
"DPS-AOE, DPS-Assist und Tank-Assist schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um Tank-Assist ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.druid.tank = 
"Tank|cffffffff\n"..
"Diese Schaltfläche aktiviert die Tank-Strategie.\n"..
"Der Druide kann diese Strategie nur als Bär verwenden.\n"..
"Bär, Katze, Zauberer und Heiler schließen sich gegenseitig aus.\n"..
"Nur eine dieser Strategien kann zeitgleich aktiviert sein.|r\n\n"..
"|cffff0000Linksklicken um Tank ein- oder auszuschalten|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

-- HUNTER --

MultiBot.tips.hunter.naspect.master =
"Non-Combat-Buff|cffffffff\n"..
"This Control allows you to select, enable or disable the default Non-Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Buff.|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.naspect.rnature =
"Resist-Nature-Buff|cffffffff\n"..
"It enables the Resist-Nature-Buff as Non-Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Resist-Nature-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.naspect.bmana =
"Mana-Buff|cffffffff\n"..
"It enables the Mana-Buff as Non-Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Mana-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.naspect.bdps =
"DPS-Buff|cffffffff\n"..
"It enables the DPS-Buff as Non-Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable DPS-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.caspect.master =
"Combat-Buff|cffffffff\n"..
"This Control allows you to select, enable or disable the default Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Buff.|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.caspect.rnature =
"Resist-Nature-Buff|cffffffff\n"..
"It enables the Resist-Nature-Buff as Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Resist-Nature-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.caspect.bmana =
"Mana-Buff|cffffffff\n"..
"It enables the Mana-Buff as Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Mana-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.caspect.bdps =
"DPS-Buff|cffffffff\n"..
"It enables the DPS-Buff as Combat-Buff.|r\n\n"..
"|cffff0000Left-Click to enable DPS-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.dps.master =
"DPS-Control|cffffffff\n"..
"In the DPS-Control you will find the general DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to show or hide DPS-Control|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"It enables the DPS-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.dps.dpsDebuff =
"DPS-Debuff|cffffffff\n"..
"It enables the Debuff-Strategies.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Debuff|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.dps.dpsAoe = 
"DPS-AOE|cffffffff\n"..
"It enables the DPS-AOE-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.dps.dps = 
"DPS|cffffffff\n"..
"It enables the DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.hunter.tankAssist = 
"Tank-Assist|cffffffff\n"..
"It enables the Tank-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

-- MAGE --

MultiBot.tips.mage.buff.master =
"Buff-Control|cffffffff\n"..
"This Control allows you to select, enable or disable the default Buff.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Buff.|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.buff.bmana =
"Mana-Buff|cffffffff\n"..
"It enables the Mana-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Mana-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.buff.bdps =
"DPS-Buff|cffffffff\n"..
"It enables the DPS-Buff.|r\n\n"..
"|cffff0000Left-Click to enable DPS-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.playbook.master =
"Playbook|cffffffff\n"..
"In the Playbook you will find the Strategies typical for the Class.|r\n\n"..
"|cffff0000Left-Click to show or hide Playbook|r\n"..
"|cf9999999(Ausführreihenfolge: System)|r";

MultiBot.tips.mage.playbook.arcaneAoe =
"Arcane-AOE|cffffffff\n"..
"Allows the Mage to use Arcane-AOE-Spells during the Combat.|r\n\n"..
"|cffff0000Left-Click to enable or disable Arcane-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.playbook.arcane =
"Arcane-Magic|cffffffff\n"..
"Allows the Mage to use Arcane-Magic during the Combat.\n"..
"Arcane-, Frost- and Fire-Magic are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Arcane-Magic|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.playbook.frostAoe =
"Frost-AOE|cffffffff\n"..
"Allows the Mage to use Frost-AOE-Spells during the Combat.|r\n\n"..
"|cffff0000Left-Click to enable or disable Arcane-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.playbook.frost =
"Frost-Magic|cffffffff\n"..
"Allows the Mage to use Frost-Magic during the Combat.\n"..
"Arcane-, Frost- and Fire-Magic are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Frost-Magic|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.playbook.fireAoe =
"Fire-AOE|cffffffff\n"..
"Allows the Mage to use Fire-AOE-Spells during the Combat.|r\n\n"..
"|cffff0000Left-Click to enable or disable Fire-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.playbook.fire =
"Fire-Magic|cffffffff\n"..
"Allows the Mage to use Fire-Magic during the Combat.\n"..
"Arcane-, Frost- and Fire-Magic are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Fire-Magic|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.dps.master =
"DPS-Control|cffffffff\n"..
"In the DPS-Control you will find the general DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to show or hide DPS-Control|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"It enables the DPS-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.dps.dpsAoe = 
"DPS-AOE|cffffffff\n"..
"It enables the DPS-AOE-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.mage.tankAssist = 
"Tank-Assist|cffffffff\n"..
"It enables the Tank-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

-- PALADIN --

MultiBot.tips.paladin.heal =
"Heal|cffffffff\n"..
"It allows the Paladin to use Heal-Spells.\n"..
"Tank, DPS and Heal are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Heal|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.seal.master =
"Seal-Control|cffffffff\n"..
"This Control allows you to select, enable or disable the default Seal.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Seal.|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.seal.bhealth =
"Health-Seal|cffffffff\n"..
"It enables the Health-Seal.|r\n\n"..
"|cffff0000Left-Click to enable Health-Seal|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.seal.bmana =
"Mana-Seal|cffffffff\n"..
"It enables the Mana-Seal.|r\n\n"..
"|cffff0000Left-Click to enable Mana-Seal|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.seal.bstats =
"Stats-Seal|cffffffff\n"..
"It enables the Stats-Seal.|r\n\n"..
"|cffff0000Left-Click to enable Stats-Seal|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.seal.bdps =
"DPS-Seal|cffffffff\n"..
"It enables the DPS-Seal.|r\n\n"..
"|cffff0000Left-Click to enable DPS-Seal|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.naura.master =
"Non-Combat-Aura|cffffffff\n"..
"This Control allows you to select, enable or disable the default Non-Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Aura.|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.naura.bspeed =
"Speed-Aura|cffffffff\n"..
"It enables the Speed-Aura as Non-Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to enable Speed-Aura|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.naura.rfire =
"Fire-Resist-Aura|cffffffff\n"..
"It enables the Fire-Resist-Aura as Non-Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to enable Fire-Resist-Aura|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.naura.rfrost =
"Frost-Resist-Aura|cffffffff\n"..
"It enables the Frost-Resist-Aura as Non-Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to enable Frost-Resist-Aura|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.naura.rshadow =
"Shadow-Resist-Aura|cffffffff\n"..
"It enables the Shadow-Resist-Aura as Non-Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to enable Shadow-Resist-Aura|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.naura.barmor =
"Armor-Aura|cffffffff\n"..
"It enables the Armor-Aura as Non-Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to enable Armor-Aura|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.caura.master =
"Combat-Aura|cffffffff\n"..
"This Control allows you to select, enable or disable the default Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Aura.|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.caura.bspeed =
"Speed-Aura|cffffffff\n"..
"It enables the Speed-Aura as Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to enable Speed-Aura|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.caura.rfire =
"Fire-Resist-Aura|cffffffff\n"..
"It enables the Fire-Resist-Aura as Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to enable Fire-Resist-Aura|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.caura.rfrost =
"Frost-Resist-Aura|cffffffff\n"..
"It enables the Frost-Resist-Aura as Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to enable Frost-Resist-Aura|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.caura.rshadow =
"Shadow-Resist-Aura|cffffffff\n"..
"It enables the Shadow-Resist-Aura as Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to enable Shadow-Resist-Aura|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.caura.barmor =
"Armor-Aura|cffffffff\n"..
"It enables the Armor-Aura as Combat-Arua.|r\n\n"..
"|cffff0000Left-Click to enable Armor-Aura|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.dps.master =
"DPS-Control|cffffffff\n"..
"In the DPS-Control you will find the general DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to show or hide DPS-Control|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"It enables the DPS-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.dps.dpsAoe = 
"DPS-AOE|cffffffff\n"..
"It enables the DPS-AOE-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.dps.dps = 
"DPS|cffffffff\n"..
"It enables the DPS-Strategies.\n"..
"Tank, DPS and Heal are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.tankAssist = 
"Tank-Assist|cffffffff\n"..
"It enables the Tank-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.paladin.tank = 
"Tank|cffffffff\n"..
"It enables the Tank-Strategies.\n"..
"Tank, DPS and Heal are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

-- PRIEST --

MultiBot.tips.priest.heal =
"Heal|cffffffff\n"..
"It makes the Priest to the Healer of the Group.\n"..
"Shadow and Heal are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Heal|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.priest.buff =
"Buff|cffffffff\n"..
"It allows the Priest to Buff the Group.|r\n\n"..
"|cffff0000Left-Click to enable or disable Buff|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.priest.playbook.master =
"Playbook|cffffffff\n"..
"In the Playbook you will find the Strategies typical for the Class.|r\n\n"..
"|cffff0000Left-Click to show or hide Playbook|r\n"..
"|cf9999999(Ausführreihenfolge: System)|r";

MultiBot.tips.priest.playbook.shadowDebuff =
"Shadow-Debuff|cffffffff\n"..
"Allows the Priest to use Shadow-Debuff-Spells during the Combat.|r\n\n"..
"|cffff0000Left-Click to enable or disable Shadow-Debuff|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.priest.playbook.shadowAoe =
"Shadow-AOE|cffffffff\n"..
"Allows the Priest to use Shadow-AOE-Spells during the Combat.|r\n\n"..
"|cffff0000Left-Click to enable or disable Shadow-AOE-Debuff|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.priest.playbook.shadow =
"Shadow|cffffffff\n"..
"Allows the Priest to use Shadow-Spells during the Combat.\n"..
"Shadow and Heal are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Shadow|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.priest.dps.master =
"DPS-Control|cffffffff\n"..
"In the DPS-Control you will find the general DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to show or hide DPS-Control|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.priest.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"It enables the DPS-Assist-Strategies for Healers.\n"..
"DPS-AOE, DPS-Assist ('Healer-DPS') and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.priest.dps.dpsDebuff =
"DPS-Debuff|cffffffff\n"..
"It enables the Debuff-Strategies.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Debuff|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.priest.dps.dpsAoe = 
"DPS-AOE|cffffffff\n"..
"It enables the DPS-AOE-Strategies.\n"..
"DPS-AOE, DPS-Assist ('Healer-DPS') and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.priest.dps.dps = 
"DPS|cffffffff\n"..
"It enables the DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.priest.tankAssist = 
"Tank-Assist|cffffffff\n"..
"It enables the Tank-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist ('Healer-DPS') and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

-- ROGUE --

MultiBot.tips.rogue.dps.master =
"DPS-Control|cffffffff\n"..
"In the DPS-Control you will find the general DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to show or hide DPS-Control|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.rogue.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"It enables the DPS-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.rogue.dps.dpsAoe = 
"DPS-AOE|cffffffff\n"..
"It enables the DPS-AOE-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.rogue.dps.dps = 
"DPS|cffffffff\n"..
"It enables the DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.rogue.tankAssist = 
"Tank-Assist|cffffffff\n"..
"It enables the Tank-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

-- SHAMAN --

MultiBot.tips.shaman.heal =
"Heal|cffffffff\n"..
"It makes the Shaman to the Healer of the Group.\n"..
"Caster, Melee and Heal are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Heal|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.ntotem.master =
"Non-Combat-Totem|cffffffff\n"..
"This Control allows you to select, enable or disable the default Non-Combat-Totem.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Totem.|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.ntotem.bmana =
"Mana-Totem|cffffffff\n"..
"It enables the Mana-Totem as Non-Combat-Totem.|r\n\n"..
"|cffff0000Left-Click to enable Mana-Totem|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.ntotem.bdps =
"DPS-Totem|cffffffff\n"..
"It enables the DPS-Totem as Non-Combat-Totem.|r\n\n"..
"|cffff0000Left-Click to enable DPS-Totem|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.ctotem.master =
"Combat-Totem|cffffffff\n"..
"This Control allows you to select, enable or disable the default Combat-Totem.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Totem.|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.ctotem.bmana =
"Mana-Totem|cffffffff\n"..
"It enables the Mana-Totem as Combat-Totem.|r\n\n"..
"|cffff0000Left-Click to enable Mana-Totem|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.ctotem.bdps =
"DPS-Totem|cffffffff\n"..
"It enables the DPS-Totem as Combat-Totem.|r\n\n"..
"|cffff0000Left-Click to enable DPS-Totem|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.playbook.master =
"Playbook|cffffffff\n"..
"In the Playbook you will find the Strategies typical for the Class.|r\n\n"..
"|cffff0000Left-Click to show or hide Playbook|r\n"..
"|cf9999999(Ausführreihenfolge: System)|r";

MultiBot.tips.shaman.playbook.totems =
"Totems|cffffffff\n"..
"Allows the Shaman to use Totems during the Combat.|r\n\n"..
"|cffff0000Left-Click to enable or disable Totems|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.playbook.casterAoe =
"Caster-AOE|cffffffff\n"..
"Allows the Shaman to use AOE-Spells during the Combat.|r\n\n"..
"|cffff0000Left-Click to enable or disable Caster-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.playbook.caster =
"Caster|cffffffff\n"..
"Allows the Shaman to use Spells during the Combat.\n"..
"Caster, Melee and Heal are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Caster|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.playbook.meleeAoe =
"Melee-AOE|cffffffff\n"..
"Allows the Shaman to use Melee-AOE-Attacks during the Combat.|r\n\n"..
"|cffff0000Left-Click to enable or disable Melee-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.playbook.melee =
"Melee|cffffffff\n"..
"Allows the Shaman to use Melee-Attacks during the Combat.\n"..
"Caster, Melee and Heal are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Caster|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.dps.master =
"DPS-Control|cffffffff\n"..
"In the DPS-Control you will find the general DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to show or hide DPS-Control|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"It enables the DPS-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.dps.dpsAoe = 
"DPS-AOE|cffffffff\n"..
"It enables the DPS-AOE-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.shaman.tankAssist = 
"Tank-Assist|cffffffff\n"..
"It enables the Tank-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

-- WARLOCK --

MultiBot.tips.warlock.buff.master =
"Buff|cffffffff\n"..
"This Control allows you to select, enable or disable the default Buff.|r\n\n"..
"|cffff0000Left-Click to show or hide Options|r\n"..
"|cff999999(Ausführreihenfolge: System)|r\n\n"..
"|cffff0000Right-Click to enable or disable the default Buff.|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warlock.buff.bhealth =
"Health-Buff|cffffffff\n"..
"It enables the Health-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Health-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warlock.buff.bmana =
"Mana-Buff|cffffffff\n"..
"It enables the Mana-Buff.|r\n\n"..
"|cffff0000Left-Click to enable Mana-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warlock.buff.bdps =
"DPS-Buff|cffffffff\n"..
"It enables the DPS-Buff.|r\n\n"..
"|cffff0000Left-Click to enable DPS-Buff|r\n"..
"|cff999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warlock.dps.master =
"DPS-Control|cffffffff\n"..
"In the DPS-Control you will find the general DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to show or hide DPS-Control|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warlock.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"It enables the DPS-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warlock.dps.dpsDebuff =
"DPS-Debuff|cffffffff\n"..
"It enables the DPS-Debuff-Strategies.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Debuff|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warlock.dps.dpsAoe = 
"DPS-AOE|cffffffff\n"..
"It enables the DPS-AOE-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warlock.dps.dps = 
"DPS|cffffffff\n"..
"It enables the DPS-Strategies.\n"..
"DPS and Tank are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warlock.tankAssist = 
"Tank-Assist|cffffffff\n"..
"It enables the Tank-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warlock.tank = 
"Tank|cffffffff\n"..
"It enables the Tank-Strategies.\n"..
"DPS and Tank are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

-- WARRIOR --

MultiBot.tips.warrior.dps.master =
"DPS-Control|cffffffff\n"..
"In the DPS-Control you will find the general DPS-Strategies.|r\n\n"..
"|cffff0000Left-Click to show or hide DPS-Control|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warrior.dps.dpsAssist =
"DPS-Assist|cffffffff\n"..
"It enables the DPS-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warrior.dps.dpsAoe = 
"DPS-AOE|cffffffff\n"..
"It enables the DPS-AOE-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable DPS-AOE|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warrior.tankAssist = 
"Tank-Assist|cffffffff\n"..
"It enables the Tank-Assist-Strategies.\n"..
"DPS-AOE, DPS-Assist and Tank-Assist are mutually exclusive.\n"..
"Only one of these Strategies can be activated.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank-Assist|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

MultiBot.tips.warrior.tank = 
"Tank|cffffffff\n"..
"It enables the Tank-Strategies.|r\n\n"..
"|cffff0000Left-Click to enable or disable Tank|r\n"..
"|cf9999999(Ausführreihenfolge: Bot)|r";

-- EVERY --

MultiBot.tips.every.summon =
"Summon|cffffffff\n"..
"Summons this Bot to your Position.|r\n\n"..
"|cffff0000Left-Click to summons the Bot|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.uninvite =
"Uninvite|cffffffff\n"..
"Dismiss this Bot from your Group.|r\n\n"..
"|cffff0000Left-Click to dismiss the Bot|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.invite =
"Invite|cffffffff\n"..
"Invites this Bot to your Group.|r\n\n"..
"|cffff0000Left-Click to invite the Bot|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.food =
"Food|cffffffff\n"..
"It enables or disables the Food-Strategies.|r\n\n"..
"|cffff0000Left-Click to allow Food|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.loot =
"Loot|cffffffff\n"..
"It enables or disables the Loot-Strategies.|r\n\n"..
"|cffff0000Left-Click to allow Loot|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.gather =
"Gather|cffffffff\n"..
"It enables or disables the Gather-Strategies.|r\n\n"..
"|cffff0000Left-Click to allow Gather|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.inventory =
"Inventory|cffffffff\n"..
"It opens or closes the Inventory of this Bot.|r\n\n"..
"|cffff0000Left-Click to open or close the Inventory|r\n"..
"|cff999999(Execution-Order: Bot)|r";

MultiBot.tips.every.spellbook =
"Spellbook|cffffffff\n"..
"It opens or closes the Spellbook of this Bot.\n"..
"Left-Click the Spell to cast it immediately.\n"..
"Right-Click the Spell to pickup a Macro for your Hotbars.|r\n\n"..
"|cffff0000Left-Click to open or close the Spellbook|r\n"..
"|cff999999(Execution-Order: Bot)|r";
end