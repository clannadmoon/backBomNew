	function createMaingameScene()
		local tagSp = 1
		local mainScene = CCScene:create()
		local mainlayer = CCLayer:create()
		local size = CCDirector:sharedDirector():getWinSize()

		-- local bg = CCSprite:create("start_bg.png")
		-- bg:setPosition(ccp(size.width/2,size.height/2))

		 bg = CCSprite:create("start_bg.png")
		      bg:setPosition(ccp(size.width/2,size.height/2))


		 bg1 = CCSprite:create("bg.png")
		 bg1:setPosition(ccp(size.width+size.width/2, size.height/2))

		local function mapRoll()
			  

		      local iSpeed = 2
		      local bgX = bg:getPositionX()
		      local bg1X = bg:getPositionX()

		      bgX = bgX - 3
		      bg1X = bg1X - 3



		      if(bgX == -size.width/2) then
		      	bg1X = size.width/2
		      	bgX = size.width + size.width/2
		      end

		      if(bg1X == -size.width/2) then
		      	bgX = size.width/2
		      	bg1X = size.width + size.width/2
		      end

		      bg:setPositionX(bgX)
		      bg1:setPositionX(bg1X)

              print("rolllllll")
		     
		end
        
        local textureDog = CCTextureCache:sharedTextureCache():addImage("dog.png")
        local tect = 1
        local frame1 = CCSpriteFrame:createWithTexture(textureDog, CCRectMake(0, 0, 105, 91)
        	)
        local frame2 = CCSpriteFrame:createWithTexture(textureDog, CCRectMake(105, 0, 105, 91))

        local array = CCArray:create()
        array:addObject(frame1)
        array:addObject(frame2)

        local animation = CCAnimation:createWithSpriteFrames(array, 0.3)
        local animate = CCAnimate:create(animation)
       
        


        
        
        sp = CCSprite:createWithSpriteFrame(frame1)

        local blink = CCBlink:create(1, 5)
        sp:setPosition(ccp(100, 200))
        sp:setScale(0.7)
        sp:runAction(CCRepeatForever:create(animate))
        sp:setTag(1)


	    
	    local gold = CCSprite:create("1.png")
	    gold:setPosition(ccp(30, 300))
	    gold:setScale(0.5)

	    local diamond = CCSprite:create("2.png")
	    diamond:setPosition(ccp(200, 300))
	    diamond:setScale(0.5)

	    local goldTtf = CCLabelTTF:create(":100", "Market felt", 25)
	    goldTtf:setPosition(ccp(80, 300))
	    goldTtf:setColor(ccc3(100, 100, 255))

	    local diaTtf = CCLabelTTF:create(":200", "Market felt", 25)
	    diaTtf:setPosition(ccp(250, 300))
	    diaTtf:setColor(ccc3(100, 100, 255))

	    local function menuCallPause()
	    	print("暂停")
	    	sp:runAction(CCJumpBy:create(1, ccp(0, -30), 30, 1))
	    end 

	    local function menuCallRoll()
	    	print("滚动")
	    	sp:runAction(CCMoveBy:create(1, ccp(5, 0)))
	    end

	    local function menuCallJump()
	    	print("跳跃")
	    	-- local sp = mainScene:getChildByTag(1)
	    	sp:runAction(CCJumpTo:create(1, ccp(100, 300), 50, 2))
	    end

	    local function menuCallSkill()
	    	print("技能")
	    end

	    local pauseItem = CCMenuItemImage:create("3.png","3.png")
	    pauseItem:setPosition(ccp(450, 300))
	    pauseItem:setScale(0.5)
	    pauseItem:registerScriptTapHandler(menuCallPause)


	    local rollItem = CCMenuItemImage:create("4.png","4.png")
	    rollItem:setPosition(ccp(30, 20))
	    rollItem:setScale(0.7)
	    rollItem:registerScriptTapHandler(menuCallRoll)

	    local killItem = CCMenuItemImage:create("5.png","5.png")
	    killItem:setPosition(ccp(230, 20))
	    killItem:setScale(0.7)
	    killItem:registerScriptTapHandler(menuCallSkill)

	    local jumpItem = CCMenuItemImage:create("6.png","6.png")
	    jumpItem:setPosition(ccp(430, 20))
	    jumpItem:setScale(0.7)
	    jumpItem:registerScriptTapHandler(menuCallJump)
 
	    local  menu = CCMenu:create()
	    menu:setPosition(ccp(0, 0))
	    menu:addChild(pauseItem)
	    menu:addChild(rollItem)
	    menu:addChild(killItem)
	    menu:addChild(jumpItem)
        
        -- mainlayer:addChild(bg)
        
        -- mapRoll()
        -- mainlayer:registerScriptHandler(mapRoll)

        local func = CCCallFunc:create(mapRoll)
        --bg:runAction(CCRepeatForever:create(CCMoveBy:create(1, ccp(-10, 0))))
        --bg1:runAction(CCRepeatForever:create(CCMoveBy:create(1, ccp(-10, 0))))

        -- if()

        mainlayer:addChild(bg)
		mainlayer:addChild(bg1)
		mainlayer:runAction(func)
       
        mainlayer:addChild(sp)
        mainlayer:addChild(menu)
	    mainlayer:addChild(gold)
	    mainlayer:addChild(diamond)
	    mainlayer:addChild(goldTtf)
	    mainlayer:addChild(diaTtf)
	    
	    mainScene:addChild(mainlayer)
	    return mainScene
	end