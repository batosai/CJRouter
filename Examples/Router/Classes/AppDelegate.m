//
//  CJAppDelegate.m
//  Router
//
//  Created by Jérémy chaufourier on 05/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
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

    RootViewController *rootViewController = [[RootViewController alloc] init];
    
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //NSLog(@"sourceApplication : %@", sourceApplication);
    //NSLog(@"host : %@", [url host]);
    //NSLog(@"absoluteURL : %@", [url absoluteURL]);
    //NSLog(@"scheme : %@", [url scheme]);

    [[CJRouter sharedCJRouter] setDelegate:self.window.rootViewController];
    [[CJRouter sharedCJRouter] launchControllerAtRoute:url];

    return YES;
}

@end
