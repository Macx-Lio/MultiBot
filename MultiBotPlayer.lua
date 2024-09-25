MultiBot.newPlayer = function(pParent, pName, pClass, pX, pY, pSize)
	local frame = CreateFrame("Frame", nil, pParent)
	frame.inventory = MultiBot.newInventory(MultiBot, pName)
	frame.button = nil
	frame.combat = nil
	frame.normal = nil
	frame.right = nil
	frame.left = nil
	
	frame.players = {}
	frame.radio = {}
	frame.link = {}
	
	frame.parent = pParent
	frame.class = pClass
	frame.name = pName
	frame.size = pSize
	
	frame:SetPoint("BOTTOMRIGHT", pX, pY)
	frame:SetSize(pSize, pSize)
	frame:Show()
	
	-- ADD --
	
	frame.addRadio = function(pButton, pIndex)
		if(frame.radio[pIndex] == nil) then frame.radio[pIndex] = {} end
		frame.radio[pIndex][pButton.config[2]] = pButton
		return frame
	end
	
	frame.addLink = function(pButton, pIndex)
		if(frame.link[pIndex] == nil) then frame.link[pIndex] = {} end
		frame.link[pIndex][pButton.config[2]] = pButton
		return frame
	end
	
	-- SET --
	
	frame.setPoint = function(pX, pY)
		frame:SetPoint("BOTTOMRIGHT", pX, pY)
	end
	
	frame.setRadio = function(pButton)
		if(pButton.radio == nil) then return end
		
		for key, value in pairs(frame.radio[pButton.radio]) do
			if(key ~= pButton.config[2]) then value.setState(false) end
		end
		
		return frame
	end
	
	frame.setLink = function(pButton)
		if(pButton.link == nil) then return end
		
		for key, value in pairs(frame.link[pButton.link]) do
			if(key ~= pButton.config[2]) then value.setState(pButton.state) end
		end
		
		return frame
	end
	
	frame.setButton = function(pConfig)
		if(frame.button ~= nil) then return frame.button end
		frame.button = MultiBot.newToggle(frame, 0, 0, pConfig, false)
		return frame.button
	end
	
	frame.setCombat = function(pStrate)
		frame.combat = pStrate
		return frame
	end
	
	frame.setNormal = function(pStrate)
		frame.normal = pStrate
		return frame
	end
	
	frame.setLeft = function()
		if(frame.left ~= nil) then frame.left:Hide() end
		frame.left = MultiBot.newFrame(frame, 0 - frame.size - 2, 2, frame.size - 4)
		local tX = 0
		
		if(frame.class == "DeathKnight") then
			frame.left.addSelect(tX, 0, MultiBot.config.deathknight.presence, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.deathknight.dps, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.assist, frame.combat)
			tX = tX - frame.size + 2
			return frame
		end
		
		if(frame.class == "Druid") then
			frame.left.addSwitch(tX, 0, MultiBot.config.heal, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.druid.buff, frame.normal)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.druid.playbook, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.druid.dps, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.assist, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.tank, frame.combat)
			tX = tX - frame.size + 2
			return frame
		end
		
		if(frame.class == "Hunter") then
			frame.left.addSelect(tX, 0, MultiBot.config.hunter.naspect, frame.normal)
			tX = tX - frame.size + 2
			
			frame.left.addSelect(tX, 0, MultiBot.config.hunter.caspect, frame.combat)
			tX = tX - frame.size + 2

			frame.left.addSwitchbar(tX, 0, MultiBot.config.hunter.dps, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.assist, frame.combat)
			tX = tX - frame.size + 2
			return frame
		end
		
		if(frame.class == "Mage") then
			frame.left.addSwitchbar(tX, 0, MultiBot.config.mage.buff, frame.normal)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.mage.playbook, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.mage.dps, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.assist, frame.combat)
			tX = tX - frame.size + 2
			return frame
		end
		
		if(frame.class == "Paladin") then
			frame.left.addSwitch(tX, 0, MultiBot.config.heal, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSelect(tX, 0, MultiBot.config.paladin.seal, frame.normal)
			tX = tX - frame.size + 2
			
			frame.left.addSelect(tX, 0, MultiBot.config.paladin.naura, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSelect(tX, 0, MultiBot.config.paladin.caura, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.paladin.dps, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.assist, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.tank, frame.combat)
			tX = tX - frame.size + 2
			return frame
		end
		
		if(frame.class == "Priest") then
			frame.left.addSwitch(tX, 0, MultiBot.config.heal, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.priest.buff, frame.normal)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.priest.playbook, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.priest.dps, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.assist, frame.combat)
			tX = tX - frame.size + 2
			return frame
		end
		
		if(frame.class == "Shaman") then
			frame.left.addSwitch(tX, 0, MultiBot.config.heal, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSelect(tX, 0, MultiBot.config.shaman.ntotem, frame.normal)
			tX = tX - frame.size + 2
			
			frame.left.addSelect(tX, 0, MultiBot.config.shaman.ctotem, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.shaman.playbook, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.shaman.dps, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.assist, frame.combat)
			tX = tX - frame.size + 2
			return frame
		end
		
		if(frame.class == "Rogue") then
			frame.left.addSwitchbar(tX, 0, MultiBot.config.rogue.dps, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.assist, frame.combat)
			tX = tX - frame.size + 2
			return frame
		end
		
		if(frame.class == "Warlock") then
			frame.left.addSelect(tX, 0, MultiBot.config.warlock.buff, frame.normal)
			tX = tX - frame.size + 2
			
			frame.left.addSwitchbar(tX, 0, MultiBot.config.warlock.dps, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.assist, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.tank, frame.combat)
			tX = tX - frame.size + 2
			return frame
		end
		
		if(frame.class == "Warrior") then
			frame.left.addSwitchbar(tX, 0, MultiBot.config.warrior.dps, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.assist, frame.combat)
			tX = tX - frame.size + 2
			
			frame.left.addSwitch(tX, 0, MultiBot.config.tank, frame.combat)
			tX = tX - frame.size + 2
			return frame
		end
	end
	
	frame.setRight = function()
		if(frame.right ~= nil) then frame.right:Hide() end
		frame.right = MultiBot.newFrame(frame, frame.size - 2, 2, frame.size - 4)
		local tX = 0
		
		frame.right.addSingle(tX, 0, MultiBot.config.summon, frame.normal)
		tX = tX + frame.size - 2
		
		frame.right.addDouble(tX, 0, MultiBot.config.group, frame.normal).setState(MultiBot.isMember(frame.name))
		tX = tX + frame.size - 2
		
		frame.right.addSwitch(tX, 0, MultiBot.config.food, frame.normal)
		tX = tX + frame.size - 2
		
		frame.right.addSwitch(tX, 0, MultiBot.config.loot, frame.normal)
		tX = tX + frame.size - 2
		
		frame.right.addSwitch(tX, 0, MultiBot.config.gather, frame.normal)
		tX = tX + frame.size - 2
		
		frame.right.addSwitch(tX, 0, MultiBot.config.inventory, frame.normal)
		tX = tX + frame.size - 2
		return frame
	end
	
	frame.setStrate = function()
		if(frame.combat == nil) then return end
		if(frame.normal == nil) then return end
		frame.setRight()
		frame.setLeft()
		return frame
	end
	
	-- GET --
	
	frame.getClass = function()
		return frame.class
	end
	
	frame.getName = function()
		return frame.name
	end
	
	-- DO --
	
	frame.doHide = function()
		if(frame.right ~= nil) then frame.right:Hide() end
		if(frame.left ~= nil) then frame.left:Hide() end
		return frame
	end
	
	frame.doShow = function()
		if(frame.button.state == false) then return frame end
		if(frame.right ~= nil) then frame.right:Show() end
		if(frame.left ~= nil) then frame.left:Show() end
		return frame
	end
	
	return frame
end

print("AfterMultiBotCharacter")