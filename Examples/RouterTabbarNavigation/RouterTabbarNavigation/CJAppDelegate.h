//
//  CJAppDelegate.h
//  RouterTabbarNavigation
//
//  Created by Jérémy chaufourier on 23/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJTabBarController;

@interface CJAppDelegate : UIResponder <UIApplicationDelegate> {
    CJTabBarController *rootViewController;
}

@property (strong, nonatomic) UIWindow *window;

@end
