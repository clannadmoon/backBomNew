require "AudioEngine" 

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end
local function main()
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)

    local cclog = function(...)
        print(string.format(...))
    end

    require "hello2"
    cclog("result is " .. myadd(3, 5))

    ---------------
local visibleSize = CCDirector:sharedDirector():getVisibleSize()
local bgsprit = CCSprite:create("start_bg.png")
bgsprit:setPosition(ccp(visibleSize.width/2, visibleSize.height/2))

 --加载进度条
	
local progress = CCProgressTimer:create(CCSprite:create("progressbar.png"))
	  progress:setPosition(ccp(240, 160))

	 progress:setType(kCCProgressTimerTypeBar)
	 progress:setMidpoint(ccp(0, 0.5))
	 progress:setScale(0.5)


	 local progressto = CCProgressTo:create(1, 100)
	 progress:runAction(progressto)

local PreLoadScene = CCScene:create()
local layer = CCLayer:create();
PreLoadScene:addChild(layer)
layer:addChild(bgsprit)
layer:addChild(progress)
cclog("dfjsklkldsfjkdfklskdfs")
print("456789")

CCDirector:sharedDirector():runWithScene(PreLoadScene)

-- require "StartScene"
-- local time = CCDelayTime:create(1)
-- local func = CCCallFunc:create(createStartScene)
-- local seq = CCSequence:createWithTwoActions(time, func)
-- layer:runAction(seq)


require "WinScene"
local time = CCDelayTime:create(1)
local func = CCCallFunc:create(creatWinScene)
local seq = CCSequence:createWithTwoActions(time, func)
PreLoadScene:runAction(seq)


-- require "ShopScene"
-- local time = CCDelayTime:create(1)
-- local func = CCCallFunc:create(createShopScene)
-- local seq = CCSequence:createWithTwoActions(time, func)
-- PreLoadScene:runAction(seq)

-- creatWinScene()




end
xpcall(main, __G__TRACKBACK__)
