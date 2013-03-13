//
//  CJTabBarController.h
//  Router
//
//  Created by Jérémy chaufourier on 10/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class View1Controller, View4Controller;

@interface TabBarController : UITabBarController {
    View1Controller *viewController;
    View4Controller *viewController4;
}

@end
