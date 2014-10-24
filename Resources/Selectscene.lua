

 function createSelectscene()
    local scene = CCScene:create()
    local Selectscene = CCLayer:create()

    local  visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()

     -- add in farm background
    local bg = CCSprite:create("bg.png")
    bg:setPosition(ccp(visibleSize.width/2,visibleSize.height/2))
    Selectscene:addChild(bg)

        
     --create scrollView
    local function createScrollView()
        local scrollView = CCScrollView:create()

        --MenuItem绑定方法
        local function chapterSelect( tag )
                print(tag)
            require "SelectLevelScene"
            if tag == 1000  then
                print("Item1")         
            elseif tag == 1001 then
                print("Item2")
            elseif tag == 1002 then
                print("Item3")
                CCDirector:sharedDirector():replaceScene(createSelectLevel())
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
            --menuItem:setAnchorPoint(ccp(0, 0))
            menuItem:setPosition(ccp(60+140*i, 125))
            menu:addChild(menuItem,0,i+1000)
        end
        --menu:alignItemsHorizontallyWithPadding(20)
        menu:setAnchorPoint(ccp(0,0))
        menu:setPosition(ccp(0, 0))

        --create continerLayer
        local continerLayer = CCLayer:create()
        continerLayer:addChild(menu)
        continerLayer:setAnchorPoint(ccp(0,0))
        continerLayer:setPosition(ccp(0, 0))
        continerLayer:setContentSize(CCSizeMake(540, 250))

        --填充scrollView
        scrollView:setContainer(continerLayer)
        scrollView:setContentOffset(ccp(0,0))
        --scrollView:setAnchorPoint(ccp(0,0))
        scrollView:setViewSize(CCSizeMake(260, 250))
        scrollView:setDirection(kCCScrollViewDirectionHorizontal)

        --设置scrollView的位置
        scrollView:setPosition(ccp(110, 30))
    
        return scrollView;
    end


    --create menu
    local function createMenu( )

        local function toShop( )
            print("Enter Shop")
            require "Shop"
            CCDirector:sharedDirector():replaceScene(createShopScene())
        end

        local function toBack( )
            print("Back")
            require "StartScene"
            CCDirector:sharedDirector():replaceScene(createStartScene())
        end


        local shopMenu = CCMenu:create()
        shopMenu:setPosition(ccp(0, 0))
        local shopItem = CCMenuItemImage:create("menu1.png","menu1.png")
        local backItem = CCMenuItemImage:create("backarrow.png", "backarrow.png")
        backItem:setScale(0.6)
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
    Selectscene:addChild(scrollView)

    --add menu
    local shopMenu = createMenu()
    Selectscene:addChild(shopMenu)




    local oldlayX 
    local layX

    --  scrollView自调整
    local function adjuestScrollView()

        local offset = layX%140 - layX%1
            local t = -(layX/140 - (layX/140)%1)
            local time = (offset/400)
        if layX < oldlayX then
            
            local adjustPos = ccp(-140*(t),0)
            print("adjust  %f   %f",adjustPos.x,adjustPos.y )
            scrollView:setContentOffsetInDuration(adjustPos, time)
        end 
        if layX > oldlayX then
            --local offset = layX%140 - layX%1
            --local t = -(layX/140 - (layX/140)%1)
            --local time = -(offset/400)
            local adjustPos = ccp(-140*t,0)
            print("adjust  %f   %f",adjustPos.x,adjustPos.y )
            scrollView:setContentOffsetInDuration(adjustPos, time)
        end 
        
    end

    local function onTouchBegan(x,y)
        
        oldlayX = scrollView:getContentOffset().x
        print("onTouchBegan: %f     %f   %f ",x ,y ,oldlayX)
        return true
    end
    local function onTouchMoved(x,y)
           print("onTouchMoved: %f     %f  ",x ,y)
           
    end
    local function onTouchEnded()
         
          layX = scrollView:getContentOffset().x
           print("onTouchEnded:%f     %f  %f ",x ,y,layX)
           adjuestScrollView()

    end
    local function onTouch(eventType,x,y)
           print("onTouch:%f     %f  ",x ,y)


        if eventType == "began" then
            return onTouchBegan(x,y)
                elseif eventType == "moved" then
                    return onTouchMoved(x,y)
        else
          return onTouchEnded(x,y)  
      end
    end



    Selectscene:registerScriptTouchHandler(onTouch)
     Selectscene:setTouchEnabled(true)
   scene:addChild(Selectscene)
    return scene
end