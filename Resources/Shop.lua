function createShopScene(  )
    local scene = CCScene:create()
    local shoplayer = CCLayer:create()

    local winSize = CCDirector:sharedDirector():getWinSize()

    --添加背景图片
    local bg = CCSprite:create("bg.png")
    bg:setPosition(ccp(winSize.width/2, winSize.height/2))
    shoplayer:addChild(bg)


    --添加scrollView

    --1、设置scrollView的contentlayer
    local contentlayer = CCLayer:create()
    local contentMenu = CCMenu:create()



--[[local function menuCallOff( tag )
    if ToggleMenu.on == false then
        ToggleMenu.on = true
        print("ture")
    else 
        ToggleMenu.on = false
        print("false")
    end
    return tag
end

    require("Toggle")

    --for i=0,6 do
        local temp = ToggleMenu:new()
        local tt = temp:addToggle("play_nor.png","play_pre.png",ccp(i*100+50,100),contentMenu,menuCallOff,2,100+i)
        contentMenu:addChild(tt)
    end
    local temp = Toggle:new()
    local tt = temp:addToggle("play_nor.png","play_pre.png",ccp(100+50,100),contentMenu,menuCallOff,2,100)
    local temp1 = Toggle:new()
    local tt1 = temp:addToggle("play_pre.png","play_pre.png",ccp(200+50,100),contentMenu,menuCallOff,2,101)
    contentMenu:addChild(tt)
    contentMenu:addChild(tt1)
    contentlayer:addChild(contentMenu)]]
    





    --[[local function menuCallMusicOff()
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
    menuMusicOn = CCMenuItemImage:create("musicon.png", "musicon.png")

    menuMusicOff = CCMenuItemImage:create("musicoff.png", "musicoff.png")

    local toggle = CCMenuItemToggle:create(menuMusicOn)
    toggle:addSubItem(menuMusicOff)
    toggle:setPosition(ccp(winSize.width/2, winSize.height/2))
    toggle:registerScriptTapHandler(menuCallMusicOff)

    contentMenu:addChild(toggle)
    contentMenu:setPosition(ccp(0,0))
    contentlayer:addChild(contentMenu)]]
    require "ToggleMenu"
    contentlayer:setContentSize(CCSizeMake(820, 250))
    for i=0,5 do
        local str = "LEVELSELECTION_" ..(1+1) ..".png"
        local sp1 = CCSprite:create(str)
        sp1:setPosition(ccp(60+140*i, 125))
        contentlayer:addChild(sp1,0)

        local sa = ToggleMenu:new()
        sa:addToggleMenu("musicon.png","musicoff.png",ccp(60+140*i,50),contentlayer)
        print(sa.on)

    end
    


    local function toBack( )
        print("Back")
        require "Selectscene"
        CCDirector:sharedDirector():replaceScene(createSelectscene())
    end

    local Menu = CCMenu:create()
        Menu:setPosition(ccp(0, 0))
        local backItem = CCMenuItemImage:create("menu1.png", "menu1.png")
        backItem:setPosition(50,280)
        backItem:registerScriptTapHandler(toBack)
        Menu:addChild(backItem)
        shoplayer:addChild(Menu)


    require "scrollView"
    local scroll = scrollView:new()
    scroll:addScroll(CCSizeMake(400, 250),ccp(40,20),contentlayer,shoplayer)

    scene:addChild(shoplayer)
    return scene

end