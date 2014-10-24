Menu = {}
Menu.__index = Menu

function Menu:new()
    local self = {}
    setmetatable(self,Menu)
    return self
end


function Menu:addMenu(imgn, imgs, imgd, callback, pos, scale, parent, zorder)  
    local sNormal = CCSprite:createWithTexture(CCTextureCache:sharedTextureCache():addImage(imgn))  
    local sSelected = CCSprite:createWithTexture(CCTextureCache:sharedTextureCache():addImage(imgs));  
    local sDisabled = CCSprite:createWithTexture(CCTextureCache:sharedTextureCache():addImage(imgd));  
    local item = CCMenuItemSprite:create(sNormal, sSelected, sDisabled)  
    item:registerScriptTapHandler(callback)  
    item:setPosition(pos)  
    item:setScale(scale)  
  
    local menu = CCMenu:create()  
    menu:addChild(item)  
    menu:setPosition(CCPoint(0, 0))  
    parent:addChild(menu, zorder)  
    return item  
end  