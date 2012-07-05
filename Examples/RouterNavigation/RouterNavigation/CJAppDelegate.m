//
//  CJAppDelegate.m
//  RouterNavigation
//
//  Created by Jérémy chaufourier on 17/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "CJAppDelegate.h"
#import "CJNavigationController.h"
#import "CJRouter.h"

@implementation CJAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];

    CJNavigationController *rootViewController = [[CJNavigationController alloc] init];

    self.window.rootViewController = rootViewController;
    [[CJRouter sharedCJRouter] setDelegate:self.window.rootViewController];

    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [[CJRouter sharedCJRouter] launchControllerAtRoute:url];
    
    return YES;
}


@end
