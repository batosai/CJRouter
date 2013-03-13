//
//  CJAppDelegate.m
//  RouterTabbar
//
//  Created by Jérémy chaufourier on 17/05/12.
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
    self.window.backgroundColor = [UIColor whiteColor];
    
    TabBarController *rootViewController = [[TabBarController alloc] init];
    
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [[CJRouter sharedCJRouter] setDelegate:self.window.rootViewController];
    [[CJRouter sharedCJRouter] launchControllerAtRoute:url];
    return YES;
}

@end
