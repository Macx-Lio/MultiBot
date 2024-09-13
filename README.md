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

With my last Update I added a simple Inventory.<br>
The basic functions are:<br>
- Left click the Backpack-Icon to open and close the Inventory
- Left click on Items will sell them to the targeted Merchent
- Right click on Items will drop them<br>

It is realy basic stuff, so dont expext too much.<br>
In the future, the inventory should look exactly like a normal backpack.<br>
The item notes should also be as close to the original as possible.<br>
# Currently not supported
RAID - QUEST<br>
# Missing Class Icons
Some client versions doesn't support the Class-Icons.<br>
So I replaced them with a Scroll-Icon.
# Screenshots
![You will see the MultiBot-Interface without any active Bot.](https://github.com/Macx-Lio/MultiBot/blob/main/MultiBot-Startet.jpg?raw=true)
This Picture shows the default MultiBot without any active Bot.<br>
The grey Scrolls represent the Characters in your list.<br>
The Hint tells you the Class and Name of the Character.<br>
Left click the Character-Icon the start a Bot.<br><br>
![You will see the MultiBot-Interface with some active Bot.](https://github.com/Macx-Lio/MultiBot/blob/main/MultiBot-Minimized.jpg?raw=true)
This Picture shows MultiBot with some active Bots.<br><br>
On the left Side of the Character-Icon is the Behaviour-Control for Combat- and Non-Combat-Actions.<br>
Behaviors that exclude each other are taken into account and the interface is set automatically.<br>
These Options will be differend for each Character-Class.<br><br>
On the right Side of the Character-Icon you will find the Summon, Group|Ungroup, Food, Loot, Gather and Inventory-Buttons.<br>
![You will see the minimized MultiBot-Interface.](https://github.com/Macx-Lio/MultiBot/blob/main/MultiBot-Active-Characters.jpg?raw=true)
This Picture shows the minimized MultiBot-Interface.<br>
A simple left click on the MultiBot-Icon will mini- or maximize it.<br>
You will find the same functionallity by the Character-Icons.<br>
