//
//  TabBarController.m
//  Router
//
//  Created by Jérémy chaufourier on 10/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "Navigation2Controller.h"

@implementation TabBarController

@synthesize viewController2 = _viewController2;
@synthesize viewController = _viewController;

- (id)init
{
    self = [super init];
    if (self) {
        _viewController = [[[NavigationController alloc] init] autorelease];
        _viewController.title = @"Title";
        
        _viewController2 = [[[Navigation2Controller alloc] init] autorelease];
        _viewController2.title = @"title 2";

        NSLog(@"%@", [self superclass]);

        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:3];

        _viewController.tabBarItem = tabItem;

        UITabBarItem *tabItem2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:3];

        _viewController2.tabBarItem = tabItem2;

        self.viewControllers = [NSArray arrayWithObjects:_viewController, _viewController2, nil];
        [self viewControllers];
        
        [tabItem release];
        [tabItem2 release];
    }
    return self;
}

@end
