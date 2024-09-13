MultiBot.newInventory = function(pParent, pName)
	local frame = CreateFrame("Frame", nil, pParent)
	frame.items = {}
	frame.size = 36
	
	frame:SetPoint("TOPLEFT", -400, 600)
	frame:SetSize(frame.size, frame.size)
	frame:Show()
	
	frame.name = pName;
	
	frame.addItem = function(pInfo)
		local tIndex = table.getn(frame.items)
		local tItem = MultiBot.newItem(frame, tIndex, pInfo)
		table.insert(frame.items, tItem)
		return tItem
	end
	
	frame.doClose = function()
		while(table.getn(frame.items) > 0) do table.remove(frame.items) end
		frame:Hide()
	end
	
	return frame;
end

print("AfterMultiBotInventory")