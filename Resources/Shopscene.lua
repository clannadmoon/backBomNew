	 function createShopScene()
		local shopScene = CCScene:create()
		local shoplayer = CCLayer:create()
		local size = CCDirector:sharedDirector():getWinSize()
		local bg = CCSprite:create("start_bg.png")
		bg:setPosition(ccp(size.width/2,size.height/2))

		
        

		shoplayer:addChild(bg)
		shopScene:addChild(shoplayer)
		
		return shopScene
	end