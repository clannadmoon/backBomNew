	function createSelectLevel()

		local selectLevelScene = CCScene:create()
		local selectlevel  = CCLayer:create()
		local size = CCDirector:sharedDirector():getWinSize()
		local bg = CCSprite:create("start_bg.png")
		bg:setPosition(ccp(size.width/2,size.height/2))
        
        local function backCallBack()	
        	print("back")
        	require "Selectscene"
        	CCDirector:sharedDirector():replaceScene(createSelectscene())

        end

        local function level1CallBack()
        	print("level1")
        	require "MaingameScene.lua"
        	CCDirector:sharedDirector():replaceScene(createMaingameScene())
        end

        local function level2CallBack()
        	print("level2")
        end

        local function level3CallBack()
        	print("level3")
        end

        local function level4CallBack()
        	print("level4")
        end

        local function level5CallBack()
        	print("level5")
        end

        local function level6CallBack()
        	print("level6")
        end

		local backItem = CCMenuItemImage:create("backarrow.png","backarrow.png")
		backItem:registerScriptTapHandler(backCallBack)
		backItem:setPosition(ccp(40, 280))
		backItem:setScale(0.6)

		local levelItem1 = CCMenuItemImage:create("backarrow.png","backarrow.png")
		levelItem1:registerScriptTapHandler(level1CallBack)
		levelItem1:setScale(0.6)

		local levelItem2 = CCMenuItemImage:create("backarrow.png","backarrow.png")
		levelItem2:registerScriptTapHandler(level2CallBack)
		levelItem2:setScale(0.6)

		local levelItem3 = CCMenuItemImage:create("backarrow.png","backarrow.png")
		levelItem3:registerScriptTapHandler(level3CallBack)
		levelItem3:setScale(0.6)

		local levelItem4 = CCMenuItemImage:create("backarrow.png","backarrow.png")
		levelItem4:registerScriptTapHandler(level4CallBack)
		levelItem4:setScale(0.6)

		local levelItem5 = CCMenuItemImage:create("backarrow.png","backarrow.png")
		levelItem5:registerScriptTapHandler(level5CallBack)
		levelItem5:setScale(0.6)

		local levelItem6 = CCMenuItemImage:create("backarrow.png","backarrow.png")
		levelItem6:registerScriptTapHandler(level6CallBack)
		levelItem6:setScale(0.6)

		local menu = CCMenu:create()
		 menu:setPosition(ccp(0, 0))
		menu:addChild(backItem)

		local menu1 = CCMenu:create()
		menu1:setAnchorPoint(ccp(0, 0))
		menu1:setPosition(ccp(190, 120))
		menu1:addChild(levelItem1)
		menu1:addChild(levelItem3)
		menu1:addChild(levelItem5)
		menu1:alignItemsHorizontallyWithPadding(80)

        local menu2 = CCMenu:create()
        menu2:setAnchorPoint(ccp(0, 0))
		menu2:setPosition(ccp(260, 240))
		menu2:addChild(levelItem2)
		menu2:addChild(levelItem4)
		menu2:addChild(levelItem6)
		menu2:alignItemsHorizontallyWithPadding(80)


		 -- menu:addChild(backItem1)
		-- menu:addChild(backItem)
		-- menu:alignItemsHorizontallyWithPadding(20)
		--menu:alignItemsInRowsWithArray(columns)

        selectlevel:addChild(menu,1)
        selectlevel:addChild(menu1,1)
        selectlevel:addChild(menu2,1)
		selectlevel:addChild(bg)
		selectLevelScene:addChild(selectlevel)
		return selectLevelScene
	end