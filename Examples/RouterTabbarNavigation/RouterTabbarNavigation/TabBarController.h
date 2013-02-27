//
//  TabBarController.h
//  Router
//
//  Created by Jérémy chaufourier on 10/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NavigationController, Navigation2Controller;

@interface TabBarController : UITabBarController

@property (assign, nonatomic) NavigationController *viewController;
@property (assign, nonatomic) Navigation2Controller *viewController2;

@end
