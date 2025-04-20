MultiBot.addItem = function(pFrame, pInfo)
	local tInfo = MultiBot.doSplit(pInfo, "|")
	local tID = MultiBot.doSplit(tInfo[3], ":")[2]

	local tIcon = GetItemIcon(tID)
	local tName, tLink, tRare = GetItemInfo(tID)

	local tX = (pFrame.index%8) * 38
	local tY = math.floor(pFrame.index/8) * -37.1

	if(tName == nil) then tName = string.sub(tInfo[4], 3, string.len(tInfo[4]) - 1) end
	if(tLink == nil) then tLink = "|" .. tInfo[2] .. "|" .. tInfo[3] .. "|" .. tInfo[4] .. "|h|r" end
	if(tRare == nil) then tRare = 4 end -- for Security

	local tButton = pFrame.addButton(tName, tX, tY, tIcon, tLink)
	pFrame.catButton("Catecher", 270, -490, 308, 524)

	tButton.item = {}
	tButton.item.id = tID
	tButton.item.link = tLink
	tButton.item.name = tName
	tButton.item.info = pInfo
	tButton.item.rare = tRare

	tButton.doLeft = function(pButton)
		local tAction = MultiBot.inventory.action
		local tName = MultiBot.inventory.name

		if(tAction == "") then
			-- SendChatMessage(MultiBot.info.action, "SAY")
			return
		end

		if(tAction == "s" and MultiBot.isTarget()) then
			-- if(pButton.item.id == "6948") then return SendChatMessage("I cant sell this Item.", "SAY") end
			-- if(MultiBot.isInside(pButton.item.info, "key")) then return SendChatMessage("I will not sell Keys.", "SAY") end
			-- if(MultiBot.isInside(pButton.item.info, "Key")) then return SendChatMessage("I will not sell Keys.", "SAY") end
			SendChatMessage(tAction .. " " .. pButton.tip, "WHISPER", nil, tName)
			pButton:Hide()
			return
		end

		if(tAction == "e" or tAction == "u" or tAction == "give") then
			SendChatMessage(tAction .. " " .. pButton.tip, "WHISPER", nil, tName)
			return
		end

		if(tAction == "destroy") then
			-- if(pButton.item.id == "6948") then return SendChatMessage("I cant drop this Item.", "SAY") end
			-- if(MultiBot.isInside(pButton.item.info, "key")) then return SendChatMessage("I will not drop Keys.", "SAY") end
			-- if(MultiBot.isInside(pButton.item.info, "Key")) then return SendChatMessage("I will not drop Keys.", "SAY") end
			-- if(pButton.item.rare > 3) then return SendChatMessage("I will not drop that good Items.", "SAY") end
			SendChatMessage(tAction .. " " .. pButton.tip, "WHISPER", nil, tName)
			pButton:Hide()
			return
		end
	end

	if(string.sub(tInfo[6], 1, 2) == "rx") then
		tButton.setAmount(string.sub(MultiBot.doSplit(tInfo[6], " ")[1], 3))
	end

	pFrame.index = pFrame.index + 1
end
