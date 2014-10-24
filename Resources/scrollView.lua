scrollView = {}
scrollView.__index = scrollView

function scrollView:new()
	local self = {}
	setmetatable(self, scrollView)
	return self
end

function scrollView:addScroll( size,pos,lay, parent)  
    local scroll = CCScrollView:create(size)  
    scroll:setDirection(kCCScrollViewDirectionHorizontal) 
    scroll:setContentOffset(ccp(0, 0))  
    scroll:setContainer(lay)
    scroll:setPosition(pos)   
    parent:addChild(scroll,10)  
    print("create a scrollView ")
    --scroll:setContentSize(CCSize(size.width, sLayerH))               --一般和laye大小相等  
    return scroll
end