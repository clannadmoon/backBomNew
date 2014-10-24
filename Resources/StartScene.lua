
require "Load" 
function createStartScene()

	local startscene = CCScene:create()
    local startlayer = CCLayer:create()

    local visibleSize = CCDirector:sharedDirector():getWinSize()

    local bgsprit = CCSprite:create("start_bg.png")
    bgsprit:setPosition(ccp(visibleSize.width/2, visibleSize.height/2))
    startlayer:addChild(bgsprit)

    function callback( )
        print("play")
          require "Selectscene"
          CCDirector:sharedDirector():replaceScene(createSelectscene())    
    end

    require "Menu"
    local sb = Menu:new()
    sb:addMenu("play_nor.png" ,"play_pre.png", "musicon.png", callback, ccp(240,130), 1, startlayer, 3)

    require "ToggleMenu"
    local sa = ToggleMenu:new()
    sa:addToggleMenu("musicon.png","musicoff.png",ccp(420, 280),startlayer)
    print(sa.on)

    local function menuCallMusicOff()
        if(sa.on == false) then
            -- local bgMusicPath = CCFileUtils:sharedFileUtils():fullPathForFilename("ab_cave_ambient.mp3")
      --        SimpleAudioEngine:sharedEngine():playBackgroundMusic(bgMusicPath)
            print("ture")
        else
             -- SimpleAudioEngine:sharedEngine():pauseBackgroundMusic()
            print("false")
        end
    end

    startscene:addChild(startlayer)
    CCDirector:sharedDirector():pushScene(CCTransitionFade:create(0.5, startscene, ccc3(0,255,255)))
    
    return startscene
end

