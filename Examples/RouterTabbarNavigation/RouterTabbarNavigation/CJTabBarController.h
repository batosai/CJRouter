//
//  CJTabBarController.h
//  Router
//
//  Created by Jérémy chaufourier on 10/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJNavigationController, CJNavigation2Controller;

@interface CJTabBarController : UITabBarController

@property (assign, nonatomic) CJNavigationController *viewController;
@property (assign, nonatomic) CJNavigation2Controller *viewController2;

@end
