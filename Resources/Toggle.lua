--ToggleMenu
Toggle = {}
Toggle.on = true
Toggle.__index = Toggle


function Toggle:new()
	local self = {}
	setmetatable(self, Toggle)
	return self
end

--[[local function menuCallOff( tag )
    if ToggleMenu.on == false then
    	ToggleMenu.on = true
        print("ture")
    else 
    	ToggleMenu.on = false
        print("false")
    end
    return tag
 end]]

function Toggle:addToggle(img1,img2,pos,parent,menuCallOff,zorder,tog)
	local itemOn = CCMenuItemImage:create(img1,img1)
	local itemOff = CCMenuItemImage:create(img2,img2)
	local toggle = CCMenuItemToggle:create(itemOn)
	toggle:addSubItem(itemOff)
	toggle:setPosition(pos)
	toggle:registerScriptTapHandler(menuCallOff)


	parent:addChild(toggle,zorder,tog)
	parent:setPosition(ccp(0,0))
	return toggle
end