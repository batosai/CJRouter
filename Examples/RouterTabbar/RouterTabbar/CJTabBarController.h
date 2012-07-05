//
//  CJTabBarController.h
//  Router
//
//  Created by Jérémy chaufourier on 10/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJView1Controller, CJView4Controller;

@interface CJTabBarController : UITabBarController {
    CJView1Controller *viewController;
    CJView4Controller *viewController4;
}

@end
