//
//  AppDelegate.h
//  RouterTabbarNavigation
//
//  Created by Jérémy chaufourier on 23/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    TabBarController *rootViewController;
}

@property (strong, nonatomic) UIWindow *window;

@end
