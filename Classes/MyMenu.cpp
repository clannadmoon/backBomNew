//
//  MyMenu.cpp
//  AngryBirds
//
//  Created by Teacher on 14-9-26.
//
//

#include "MyMenu.h"
MyMenu::MyMenu()
{
    
}

MyMenu::~MyMenu()
{
    
}

MyMenu* MyMenu::create()
{
    MyMenu* pRet = new MyMenu;
    if(pRet && pRet->init())
    {
        pRet->autorelease();
        return pRet;
    }
    CC_SAFE_DELETE(pRet);
    return NULL;
}

bool MyMenu::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent)
{
    move = false;
    return CCMenu::ccTouchBegan(pTouch, pEvent);
}

void MyMenu::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent)
{
    move = true;
    CCMenu::ccTouchMoved(pTouch, pEvent);
}

void MyMenu::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent)
{
    if(!move)
    {
        CCMenu::ccTouchEnded(pTouch, pEvent);
    }
    else
    {
        m_eState = kCCMenuStateWaiting;
    }
    
}

void MyMenu::ccTouchCancelled(CCTouch *pTouch, CCEvent *pEvent)
{
    
}