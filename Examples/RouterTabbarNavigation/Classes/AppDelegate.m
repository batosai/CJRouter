//
//  AppDelegate.m
//  RouterTabbarNavigation
//
//  Created by Jérémy chaufourier on 23/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "CJRouter.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    rootViewController = [[TabBarController alloc] init];
    
    self.window.rootViewController = rootViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{

    [[CJRouter sharedCJRouter] launchControllerAtRoute:url before:^
        (NSDictionary *dictionary, UIViewController *controller){

        NSNumber *index = [[dictionary objectForKey:@"UITabBar"] objectForKey:@"index"];

        if ([index intValue] == 0) {
            [[CJRouter sharedCJRouter] setDelegate:
             rootViewController.viewController];
        }
        else {
            [[CJRouter sharedCJRouter] setDelegate:
             rootViewController.viewController2];
        }
        [rootViewController setSelectedIndex:[index intValue]];
    }];

    return YES;
}

@end
