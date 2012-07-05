//
//  CJTabBarController.h
//  Router
//
//  Created by Jérémy chaufourier on 10/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJView1Controller, CJView2Controller;

@interface CJTabBarController : UITabBarController {
    CJView1Controller *viewController;
    CJView2Controller *viewController2;
}

@end
