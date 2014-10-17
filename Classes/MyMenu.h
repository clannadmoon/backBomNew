//
//  MyMenu.h
//  AngryBirds
//
//  Created by Teacher on 14-9-26.
//
//

#ifndef __AngryBirds__MyMenu__
#define __AngryBirds__MyMenu__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;
class MyMenu:public CCMenu
{
public:
    MyMenu();
    ~MyMenu();
    static MyMenu* create();
    virtual void registerWithTouchDispatcher()
    {
        CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(this, 1, false);
    }
    bool move;
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchCancelled(CCTouch *pTouch, CCEvent *pEvent);
};
#endif /* defined(__AngryBirds__MyMenu__) */
