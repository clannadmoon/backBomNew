--ToggleMenu
ToggleMenu = {}
ToggleMenu.on = true
ToggleMenu.__index = ToggleMenu


function ToggleMenu:new()
	local self = {}
	setmetatable(self, ToggleMenu)
	return self
end

local function menuCallOff()
    	if(ToggleMenu.on == false) then
    		-- local bgMusicPath = CCFileUtils:sharedFileUtils():fullPathForFilename("ab_cave_ambient.mp3")
      --        SimpleAudioEngine:sharedEngine():playBackgroundMusic(bgMusicPath)
    		ToggleMenu.on = true
            print("ture")
    	else
    		 -- SimpleAudioEngine:sharedEngine():pauseBackgroundMusic()
    		ToggleMenu.on = false
            print("false")
    	end
    end

function ToggleMenu:addToggleMenu(img1,img2,pos,layer)
	local itemOn = CCMenuItemImage:create(img1,img1)
	local itemOff = CCMenuItemImage:create(img2,img2)
	local toggle = CCMenuItemToggle:create(itemOn)
	toggle:addSubItem(itemOff)
	toggle:registerScriptTapHandler(menuCallOff)

	local menu = CCMenu:create()
	menu:addChild(toggle)
	menu:setPosition(pos)

	layer:addChild(menu)
	return menu
end



