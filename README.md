# MultiBot
User interface for AzerothCore-Module "Playerbot" by Liyunfan1223.<br>
Tested with American and German 3.3.5 Wotlk-Client.
# Installation
Simply place the files in a folder called "MultiBot" in your World of Warcraft AddOns directory.<br>
Example: "C:\WorldOfWarcraft\Interface\AddOns\MultiBot"
# Use
Start World of Warcraft and enter "/multibot" or "/mbot" or "/mb" in the chat.
# Current Status
![You will see the MultiBot-Interface without any active Bot.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-00-Start.jpg?raw=true)
This Picture shows the default MultiBot without any active Bot.<br>
The grey Class-Icons represent the Characters in your list.<br><br>

![You will see the MultiBot-Interface without any active Bot but a Hint.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-01-Playerbots.jpg?raw=true)
The Hint tells you the Class and Name of the Character.<br>
The Icon show the Class of the Character.<br>
Left click to start the Bot.<br><br>

![You will see the MultiBot-Interface with active Bot-Controls.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-02-Bot-Controls.jpg?raw=true)
After the left click you need to wait a little.<br>
As soon the Playerbot is online he tells us his Strategies.<br>
MultiBot generates the Control-Buttons based on the Class and the active Strategies.<br>
The Hints will tell you what the Buttons mean.<br><br>

![You will see the MultiBot-Interface with hidden Bot-Controls.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-03-Bot-Minimize.jpg?raw=true)
To save space on the screen, you could minimize the Bot-Controls by left click the Playerbot-Icons.<br>
A second left click will maximize the Bot-Controls again.<br><br>

![You will see the MultiBot-Interface with a Group of Playerbots.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-04-Group.jpg?raw=true)
At the bottom you have horizontal line of Buttons, this is the Main-Control.<br>
As long as you have only one Group of active Bots, there will be only the Main-Control.<br>
With the Main-Control you can give all Bots the same commands.<br>
The currently possible Commands are:<br>

<ul>
<li>@Tank attack my Target</li>
<li>@All attack my Target</li>
<li>@All toggle between passive and active Mode</li>
<li>@All toggle between stay and follow</li>
<li>@All flee</li>
<li>@All relase to Graveyard</li>
<li>@All revive at Angel</li>
<li>Summon all active Bots</li>
</ul>

![You will see the MultiBot-Interface with a Raid of Playerbots.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-05-Raid.jpg?raw=true)
As soon as you have more than one group and player bots, the raid controls will be displayed.<br>
Depending on the amount of Groups in the Raid you will get an additional Raid-Control.<br>
From top to the Bottom you could give the 1st, 2nd, 3rd and so on Group individual commands.<br>
Currently the commands are the same as in the Main-Control.<br><br>

![You will see the MultiBot-Interface with minimized Bot-Controls.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-06-Minimized.jpg?raw=true)
To save space on the screen, you could hide all Bot-Controls by left click the Scroll-Icons.<br>
A second left click will show the all Bot-Controls again.<br><br>

![You will see the MultiBot-Interface with selected Friendbot-Control.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-07-Friendbots.jpg?raw=true)
The grey Class-Icons represent the Characters in your Friendlist.<br>
Currently the maximum of supportet Characters in your Friendlist is 50, this depends on Bugs in the WoW-Lua-Engine.<br>
MultiBot will show only 10 Character at the same time, but you are able to browse throu them with the Arrow-Icon on the top.<br>

![You will see the MultiBot-Interface with selected Friendbot-Control after browsing.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-08-Browse-Friendbots.jpg?raw=true)
After a left click on the Arrow-Icon you will see the next 10 Bots and again the next 10 and so on.<br>
At the end of the List the Browse-Button starts from the beginning.<br>
So you will rotate throu your Friendlist.<br>

![You will see the MultiBot-Interface with Filter for Friendbots.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-09-Filter-Friendbots.jpg?raw=true)
To make things faster I added a Filter for the Friendbots.<br>
Simply select the Class of Character you want.<br><br>

![You will see the MultiBot-Interface with Filtered Friendbots.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-10-Filtered-Friendbots.jpg?raw=true)
If the Filter-Result is smaller than 10, the Browse-Buttons will be disappear.<br>
With a right click you could reset the Filter back to normal.<br><br>

![You will see the MultiBot-Interface with active Friendbots.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-11-Grouped-with-Friendbots.jpg?raw=true)
As you can see the Friendbot-Bot-Controls are identical to the Playerbot-Bot-Controls.<br>
Depending on there Classes and Strategies the Buttons will be generated.<br>
IMPORTANT: Friendbots could need some Time to reakt on your Group-Invitation.<br>
IMPORTANT: The Buttons will only be generated after the Friendbot told us his Strategies.<br>

![You will see the MultiBot-Interface with filtered active Friendbots.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-12-Filtered-with-Grouped-Friendbots.jpg?raw=true)
You could filter the Friendbots even with active Bots in your Group.<br>
The Bot-Controls will be keept alive and only hidden for those Bots, which dont equal to your filter.<br><br>

![You will see the MultiBot-Interface with Hint to open the Bot-Inventory.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-13-Open-Bot-Inventory.jpg?raw=true)
To open the Bot-Inventory just left click the Backpack-Icon in the Bot-Controls.<br>
The could only be one open Inventory at the same time.<br>

![You will see the MultiBot-Interface with open Bot-Inventory.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-14-Default-Option-Sell.jpg?raw=true)
A left click on the Backpack-Icon also opens the Inspect-Window, as long your Bot is in range.<br>
The Inventory set to sell by default.<br>
This means that a left click on a Item sells this Item to the targeted Merchant.<br><br>

![You will see the MultiBot-Interface with open Bot-Inventory.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-15-Equip-Option.jpg?raw=true)
The 2nd Button will switch the left click from "Sell" the "Equip".<br><br>

![You will see the MultiBot-Interface with open Bot-Inventory.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-16-Use-Option.jpg?raw=true)
The 3rd Button will switch the left click to "Use".<br><br>

![You will see the MultiBot-Interface with open Bot-Inventory.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-17-Destroy-Option.jpg?raw=true)
The 4th Button will switch the left click to "Destroy".<br>
IMPORTANT: There is no additional security question!<br><br>

![You will see the MultiBot-Interface with open Bot-Inventory.](https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/MultiBot-18-Item-Tooltip.jpg?raw=true)
On Mouse over you will get the well known Item-Tooltips.<br>
Sometimes MultiBot has Problems to identifiy a Item, then you will see a simplyfied Hint with the Name of the Item.<br>

# Comming soon
Next i work on the Group- and Raid-Controls.

# Currently not supported
QUEST
