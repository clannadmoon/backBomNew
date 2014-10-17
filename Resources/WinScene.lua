	 function creatWinScene()
		local winScene = CCScene:create()
		local winLayer = CCLayer:create()
		
	    local size = CCDirector:sharedDirector():getWinSize()
	    local bgsprit = CCSprite:create("start_bg.png")
	    bgsprit:setPosition(ccp(size.width/2,size.height/2))

	    local pLable = CCLabelTTF:create("Game Win", "Marker Felt", 40)
	    pLable:setPosition(ccp(size.width / 2, size.height * 3 / 4))
	    pLable:setColor(ccc3(255, 0, 0))


	    local pLable1 = CCLabelTTF:create("Exit Game", "Marker Felt", 40)
	    pLable1:setColor(ccc3(255, 0, 0))


	    local pLable2 = CCLabelTTF:create("Game Again", "Marker Felt", 40)
	    pLable2:setColor(ccc3(255, 0, 0))

        local function ExitCallBack()
        	print("Exit")
        	CCDirector:sharedDirector():endToLua()
        	 
        end

        local function AgainCallBack()
        	require "StartScene"
        	print("Again")
        	CCDirector:sharedDirector():replaceScene(createStartScene())
        	
        end

	    local exititem = CCMenuItemLabel:create(pLable1)
	    exititem:setPosition(ccp(size.width / 2, size.height / 4))
	    exititem:registerScriptTapHandler(ExitCallBack)

	    local againitem = CCMenuItemLabel:create(pLable2)
	    againitem:setPosition(ccp(size.width / 2, size.height / 2))
	    againitem:registerScriptTapHandler(AgainCallBack)
        

        local menu = CCMenu:createWithItem(againitem)
        local menu1 = CCMenu:createWithItem(exititem)


        menu:setPosition(ccp(0, 0))
        menu1:setPosition(ccp(0, 0))

	 --    local system = CCParticleSystemQuad:create("fengye.plist")
		-- --system:setTextureWithRect(CCTextureCache:sharedTextureCache():addImage("fengye.png"), CCRectMake(0, 0, 91, 91))
		-- local batch = CCParticleBatchNode:createWithTexture(system:getTexture())

	 --    system:setPosition(ccp(240, 160))

	    -- local emitter = CCParticleSnow:create(CCTextureCache:sharedTextureCache():addImage("fengye.png"))
	    -- emitter:setTexture(CCTextureCache:sharedTextureCache():addImage("fengye.png"))
	    -- emitter:setPosition(ccp(240, 160))

     --    winLayer:addChild(emitter)
        
     

        
	    winLayer:addChild(bgsprit)
	    winLayer:addChild(menu)
	    winLayer:addChild(menu1)
	    
	    winLayer:addChild(pLable)
	    
	    winScene:addChild(winLayer)
	    
        
		
		
	   
        CCDirector:sharedDirector():replaceScene(winScene)
   
	end