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

 
local PreLoadScene = CCScene:create()
local layer = CCLayer:create();
PreLoadScene:addChild(layer)
layer:addChild(bgsprit)

cclog("dfjsklkldsfjkdfklskdfs")
print("456789")

--加载进度条
require "Progress"
local sa = classProgress:new()
local spt = sa:addProgress("progressbar.png", ccp(1, 0), 0.0, ccp(50, 50), ccp(0,0), layer)
local prog = CCProgressTo:create(1, 100)
spt:runAction(prog)

CCDirector:sharedDirector():runWithScene(PreLoadScene)

-- require "StartScene"
-- local time = CCDelayTime:create(1)
-- local func = CCCallFunc:create(createStartScene)
-- local seq = CCSequence:createWithTwoActions(time, func)
-- layer:runAction(seq)


require "StartScene"
local time = CCDelayTime:create(3)
local func = CCCallFunc:create(createStartScene)
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
