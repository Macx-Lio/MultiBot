# MultiBot
User interface for AzerothCore-Module "Playerbot" by Liyunfan1223.<br>
Tested with American and German 3.3.5 Wotlk-Client.
# Installation
Simply place the files in a folder called "MultiBot" in your World of Warcraft AddOns directory.<br>
Example: "C:\WorldOfWarcraft\Interface\AddOns\MultiBot"
# Use
Start World of Warcraft and enter "/multibot" or "/mbot" or "/mb" in the chat.
# Current Status
Reads the character list and offers a button for the available Playerbots.<br>
Simply press the corresponding button to start the Playerbot.<br><br>
The interface retrieves the current strategies and offers a selection structure for settings.<br>
This allows you to define the behavior of the individual player bots.<br><br>
Various strategies depend on each other or cancel each other out.<br>
I tried to display the dependencies in the user interface.<br>
This is the reason why the tank button goes off when you activate the DPS button.<br><br>
I also added a simple group control.<br>
Buttons are available for the following actions:<br>
- @Tank attack my Target
- Group attack my Target
- Toggle passive mode
- Stay or Follow
- Group Release
- Group Revive
- Group Summon of all active Bots<br>

With the Update from 09/13/2024, I added a simple Inventory.<br>
The basic functions are:<br>
- Left click the Backpack-Icon to open and close the Inventory
- Left click on Items will sell them to the targeted Merchent
- Right click on Items will drop them<br>

It is realy basic stuff, so dont expext too much.<br>
In the future, the inventory should look exactly like a normal backpack.<br>
The item notes should also be as close to the original as possible.<br>

With the Update from 09/15/2024, I added separate raid controls.<br>
As soon as there are more than 5 members in a party, the group control sends to the raid channel.<br>
This makes it the main control unit that can be used to control all bots at the same time.<br>
Depending on the number of raid members you will receive group control units.<br>

The main control unit is pinned to the red scroll button.<br>
The group control units are pinned to the green scroll button.<br>
From top to bottom, the group control units represent the respective raid groups.<br>

The separate control units allow you to give the groups different commands.<br>
For example, group 1 can guard an area while group 2 follows you.<br>
Or Tank1 attack MonsterA and Tank2 attack MonsterB.<br>
There are many options, just give it a try.<br>

# Currently not supported
25 RAIDS - QUEST

# Missing Class Icons
Some client versions doesn't support the Class-Icons.<br>
So I replaced them with a Scroll-Icon.

# Screenshots
![You will see the MultiBot-Interface without any active Bot.](https://github.com/Macx-Lio/MultiBot/blob/main/MultiBot-Startet.jpg?raw=true)
This Picture shows the default MultiBot without any active Bot.<br>
The grey Scrolls represent the Characters in your list.<br>
The Hint tells you the Class and Name of the Character.<br>
Left click the Character-Icon the start a Bot.<br><br>
![You will see the MultiBot-Interface with some active Bot.](https://github.com/Macx-Lio/MultiBot/blob/main/MultiBot-Active-Characters.jpg?raw=true)
This Picture shows MultiBot with some active Bots.<br>
On the left Side of the Character-Icon is the Behaviour-Control for Combat- and Non-Combat-Actions.<br>
Behaviors that exclude each other are taken into account and the interface is set automatically.<br>
On the right Side you will find the Summon, Group|Ungroup, Food, Loot, Gather and Inventory-Buttons.<br>
Please notice that the Inventory is still experimental.<br><br>
![You will see the minimized MultiBot-Interface.](https://github.com/Macx-Lio/MultiBot/blob/main/MultiBot-Minimized.jpg?raw=true)
This Picture shows the minimized MultiBot-Interface.<br>
A simple left click on the MultiBot-Icon will mini- or maximize it.<br>
You will find the same functionallity by the Character-Icons.<br>
To understand the Buttons you should read the Hints.<br><br>
![You will see the MultiBot-Interface for Raids.](https://github.com/Macx-Lio/MultiBot/blob/main/MultiBot-Raid-Control.jpg?raw=true)
This Picture shows the Raid-Control of the MultiBot-Interface.<br>
The main control unit is pinned to the red scroll button.<br>
The group control units are pinned to the green scroll button.<br>
From top to bottom, the group control units represent the respective raid groups.<br><br>
