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
    local origin = CCDirector:sharedDirector():getVisibleOrigin()

    -- create farm
    local function createLayerFarm()
        local layerFarm = CCLayer:create()

        local  visibleSize = CCDirector:sharedDirector():getVisibleSize()
        local origin = CCDirector:sharedDirector():getVisibleOrigin()

        -- add in farm background
        local bg = CCSprite:create("bg.png")
        bg:setPosition(ccp(visibleSize.width/2,visibleSize.height/2))
        layerFarm:addChild(bg)

        
        --create scrollView
        local function createScrollView()
            local scrollView = CCScrollView:create()

            --MenuItem绑定方法
            local function chapterSelect( tag )
                    print(tag)
                if tag == 1000  then
                    print("Item1")         
                elseif tag == 1001 then
                    print("Item2")
                elseif tag == 1002 then
                    print("Item3")
                 else
                    print("Item4")
                end  
            end

            --create Menu
            local menu = MyMenu:create()
            for i=0,3 do
                local str = "LEVELSELECTION_" ..(i+1) ..".png"
                local menuItem = CCMenuItemImage:create(str,str)
                menuItem:registerScriptTapHandler(chapterSelect)
                menuItem:setAnchorPoint(ccp(0, 0))
                menu:addChild(menuItem,i+1000,i+1000)
            end
            menu:alignItemsHorizontallyWithPadding(20)
            menu:setAnchorPoint(ccp(0,0))
            menu:setPosition(ccp(0, 0))

            --create continerLayer
            local continerLayer = CCLayer:create()
            continerLayer:addChild(menu)
            continerLayer:setAnchorPoint(ccp(0,0))
            continerLayer:setPosition(ccp(0, 0))
            continerLayer:setContentSize(CCSizeMake(540, 300))

            --填充scrollView
            scrollView:setContainer(continerLayer)
            scrollView:setContentOffset(ccp(0,0))
            --scrollView:setAnchorPoint(ccp(0,0))
            scrollView:setViewSize(CCSizeMake(260, 300))
            scrollView:setDirection(kCCScrollViewDirectionHorizontal)

            --设置scrollView的位置
            scrollView:setPosition(ccp(100, 40))
    
            return scrollView;
        end


        --create menu
        local function createMenu( )

            local function toShop( )
                print("Enter Shop ")
            end

            local function toBack( )
                print("Back")
            end


            local shopMenu = CCMenu:create()
            shopMenu:setPosition(ccp(0, 0))
            local shopItem = CCMenuItemImage:create("menu1.png","menu1.png")
            local backItem = CCMenuItemImage:create("menu1.png", "menu1.png")
            shopItem:setPosition(400,280)
            backItem:setPosition(50,280)
            shopItem:registerScriptTapHandler(toShop)
            backItem:registerScriptTapHandler(toBack)
            shopMenu:addChild(shopItem)
            shopMenu:addChild(backItem)

            return shopMenu
        end
    
    
        --add scrollView
        local scrollView = createScrollView()
        layerFarm:addChild(scrollView)

        --add menu
        local shopMenu = createMenu()
        layerFarm:addChild(shopMenu)
        --[[add scrollView

    local scrollView = CCScrollView:create()
    local continerLayer = CCLayer:create()
    --给Layer添加对象
    local sprite1 = CCSprite:create("Icon-144.png")
    local sprite2 = CCSprite:create("Icon-144.png")
    local sprite3 = CCSprite:create("Icon-144.png")

    --[[item1 = CCMenuItemSprite:create(sprite1)
    local function menuCallback(sender)
        cclog("menuCallback...")
       -- tolua.cast(ret:getParent(), "CCLayerMultiplex"):switchTo(1)
    end
    item1:registerScriptTapHandler(menuCallback)


    sprite1:setPosition(ccp(100,100))
    sprite2:setPosition(ccp(300, 100))
    sprite3:setPosition(ccp(500, 100))
    continerLayer:addChild(sprite1)
    continerLayer:addChild(sprite2)
    continerLayer:addChild(sprite3)
    continerLayer:setAnchorPoint(ccp(0, 0))
    continerLayer:setContentSize(CCSizeMake(580, 200))
    scrollView:setContainer(continerLayer)
    scrollView:setAnchorPoint(ccp(0, 0))
    scrollView:setViewSize(CCSizeMake(300, 200))
    scrollView:setDirection(kCCScrollViewDirectionHorizontal)
    scrollView:setPosition(ccp(winSize.width/8, winSize.height/8))
    layerFarm:addChild(scrollView)]]

        --[[ handing touch events
        local touchBeginPoint = nil
        local  oldlayX = nil
        local layX = nil

        local function onTouchBegan(x, y)
            cclog("onTouchBegan: %0.2f, %0.2f", x, y)
           -- touchBeginPoint = {x = x, y = y}
            oldlayX = scrollView:getContentOffset().x
            
            -- CCTOUCHBEGAN event must return true
            return true
        end

        local function onTouchMoved(x, y)
            --cclog("onTouchMoved: %0.2f, %0.2f", x, y)
            --if touchBeginPoint then
                --local cx, cy = layerFarm:getPosition()
                --layerFarm:setPosition(cx + x - touchBeginPoint.x,
                                      --cy + y - touchBeginPoint.y)
                --touchBeginPoint = {x = x, y = y}
            --end
        end

        local function onTouchEnded(x, y)
            cclog("onTouchEnded: %0.2f, %0.2f", x, y)
            --touchBeginPoint = nil
            layX = scrollView:getContentOffset().x
            adjustScrollView()
        end

        local function onTouch(eventType, x, y)
            if eventType == "began" then   
                return onTouchBegan(x, y)
            elseif eventType == "moved" then
                return onTouchMoved(x, y)
            else
                return onTouchEnded(x, y)
            end
        end]]
        return layerFarm
    end


    --[[create menu
    local function createLayerMenu()
        local layerMenu = CCLayer:create()

        local menuPopup, menuTools, effectID

        local function menuCallbackClosePopup()
            -- stop test sound effect
            AudioEngine.stopEffect(effectID)
            menuPopup:setVisible(false)
        end

        local function menuCallbackOpenPopup()
            -- loop test sound effect
            local effectPath = CCFileUtils:sharedFileUtils():fullPathForFilename("effect1.wav")
            effectID = AudioEngine.playEffect(effectPath)
            menuPopup:setVisible(true)
        end

        -- add a popup menu
        local menuPopupItem = CCMenuItemImage:create("menu2.png", "menu2.png")
        menuPopupItem:setPosition(0, 0)
        menuPopupItem:registerScriptTapHandler(menuCallbackClosePopup)
        menuPopup = CCMenu:createWithItem(menuPopupItem)
        menuPopup:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)
        menuPopup:setVisible(false)
        layerMenu:addChild(menuPopup)

        -- add the left-bottom "tools" menu to invoke menuPopup
        local menuToolsItem = CCMenuItemImage:create("menu1.png", "menu1.png")
        menuToolsItem:setPosition(0, 0)
        menuToolsItem:registerScriptTapHandler(menuCallbackOpenPopup)
        menuTools = CCMenu:createWithItem(menuToolsItem)
        local itemWidth = menuToolsItem:getContentSize().width
        local itemHeight = menuToolsItem:getContentSize().height
        menuTools:setPosition(origin.x + itemWidth/2, origin.y + itemHeight/2)
        layerMenu:addChild(menuTools)

        return layerMenu
    end]]

    -- play background music, preload effect

    -- uncomment below for the BlackBerry version
    -- local bgMusicPath = CCFileUtils:sharedFileUtils():fullPathForFilename("background.ogg")
    local bgMusicPath = CCFileUtils:sharedFileUtils():fullPathForFilename("background.mp3")
    AudioEngine.playMusic(bgMusicPath, true)
    local effectPath = CCFileUtils:sharedFileUtils():fullPathForFilename("effect1.wav")
    AudioEngine.preloadEffect(effectPath)

    -- run
    local sceneGame = CCScene:create()
    sceneGame:addChild(createLayerFarm())
   -- sceneGame:addChild(createLayerMenu())
    CCDirector:sharedDirector():runWithScene(sceneGame)
end

xpcall(main, __G__TRACKBACK__)
