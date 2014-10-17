

function createStartScene()
	isMusicOn = true 
	local startscene = CCScene:create()
    local startlayer = CCLayer:create()
    local visibleSize = CCDirector:sharedDirector():getWinSize()
    local bgsprit = CCSprite:create("start_bg.png")
    bgsprit:setPosition(ccp(visibleSize.width/2, visibleSize.height/2))


    --crate menu
    local menuplay, menuMusicOn, menuMusicOff

    local function menuCallPlay()
     
          print("play")
          require "Selectscene"
          CCDirector:sharedDirector():replaceScene(createSelectscene())
         

          -- require "SelectScene"
          -- CCDirector:sharedDirector():replaceScene(createSelectScene())

          -- require "ShopScene"
          -- CCDirector:sharedDirector():replaceScene(CCTransitionFadeTR:create(0.1, createShopScene()))
          -- CCDirector:sharedDirector():replaceScene(createShopScene())
    end 

    local function menuCallMusicOff()
    	if(isMusicOn == false) then
    		-- local bgMusicPath = CCFileUtils:sharedFileUtils():fullPathForFilename("ab_cave_ambient.mp3")
      --        SimpleAudioEngine:sharedEngine():playBackgroundMusic(bgMusicPath)
    		isMusicOn = true
            print("ture")
    	else
    		 -- SimpleAudioEngine:sharedEngine():pauseBackgroundMusic()
    		isMusicOn = false
            print("false")
    	end
    end

    menuplay = CCMenuItemImage:create("play_nor.png", "play_pre.png")
    menuplay:registerScriptTapHandler(menuCallPlay)
    menuplay:setPosition(ccp(240,130))
    

    menuMusicOn = CCMenuItemImage:create("musicon.png", "musicon.png")

    menuMusicOff = CCMenuItemImage:create("musicoff.png", "musicoff.png")

    local toggle = CCMenuItemToggle:create(menuMusicOn)
    toggle:addSubItem(menuMusicOff)
    toggle:setPosition(ccp(400, 240))
    toggle:registerScriptTapHandler(menuCallMusicOff)

    local menu = CCMenu:create()
    menu:addChild(menuplay)
    menu:addChild(toggle)
    menu:setPosition(ccp(0,0))
    
    startlayer:addChild(menu,1)
    startlayer:addChild(bgsprit)
    startscene:addChild(startlayer)
    CCDirector:sharedDirector():pushScene(CCTransitionFade:create(0.5, startscene, ccc3(0,255,255)))	
    return startscene
end

