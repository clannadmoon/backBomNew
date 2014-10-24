
--进度条加载
classProgress = {}
classProgress.__index = classProgress

function classProgress:new()
	local self = {}
	setmetatable(self, classProgress)
	return self
end

function classProgress:addProgress( img,direc,percent,pos,anch,parent )
	local spt = CCProgressTimer:create(CCSprite:create(img))
	spt:setMidpoint(ccp(0,0.5))
	spt:setBarChangeRate(direc)
	spt:setType(kCCProgressTimerTypeBar)
	spt:setPosition(pos)
	spt:setAnchorPoint(anch)
	spt:setPercentage(percent)
	parent:addChild(spt)
	return spt
end





--C++实现Progress
--[[

	//1.利用精灵创建进度条，并设置一些属性
    progresstime2 = CCProgressTimer::create(psSprite2);    //初始化CCProgressTimer
    progresstime2->setPercentage(100.0f);    //设置初始百分比的值
    progresstime2->setScale(3);            //设置进度条大小为原始的3倍
    progresstime2->setBarChangeRate(ccp(1, 0));    //设置进度条的长度和高度开始变化的大小
    progresstime2->setType(kCCProgressTimerTypeBar);    //设置进度条为水平
    progresstime2->setPosition(ccp(size.width/2, size.height/2 - 30));    //放置进度条位置

    this->addChild(progresstime2, 101);    //加入Layer中

    this->scheduleUpdate();        //调用定时器更新进度条

		

	//2.利用周期回调update修改setPercentage()（设置加载百分比）
	void LoadGame::update(float dt)

    //CCProgressTimer *progresstime = static_cast(this->getChildByTag(100));
    float ct1 = progresstime1->getPercentage();    //取得当前进度的百分比
    float ct2 = progresstime2->getPercentage();    //取得当前进度的百分比
    
    ct1 = ct1 + 0.5f;    //每帧+0.5%
    ct2 = ct2 - 0.5f;
    
    //如果进度条小于100%，设置进度条的百分比
    if (ct1 <= 100)    
    {
        CCLOG("progresstime1:%f, progresstime2:%f", ct1, ct2);
        progresstime1->setPercentage(ct1);
        progresstime2->setPercentage(ct2);
    }
    //如果进度条达到100%，则进入过渡场景，过渡场景会在2秒后进入主场景
    else
    {
        CCTransitionFade *tScene = CCTransitionFade::create(2, HelloWorld::scene(), ccWHITE);
        CCDirector::sharedDirector()->replaceScene(tScene);
    }
    
}



	//解释setBarChangeRate
	//从左到右  
    progressTimer->setMidpoint(ccp(0, 0.5));  
    progressTimer->setBarChangeRate(ccp(1, 0));  
      
    //从右到左  
//    progressTimer->setMidpoint(ccp(1, 0.5));  
//    progressTimer->setBarChangeRate(ccp(1, 0));  
      
    //从上到下  
//    progressTimer->setMidpoint(ccp(0.5, 1));  
//    progressTimer->setBarChangeRate(ccp(0, 1));  
      
    //从下到上  
//    progressTimer->setMidpoint(ccp(0.5, 0));  
//    progressTimer->setBarChangeRate(ccp(0, 1));  

        ]]