//
//  CJRouter.m
//  Router
//
//  Created by Jérémy chaufourier on 05/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "CJRouter.h"
#import "CJRoute.h"

@implementation CJRouter

@synthesize delegate = _delegate;

static CJRouter* _sharedCJRouter = nil;

+(CJRouter*)sharedCJRouter
{
	@synchronized([CJRouter class])
	{
		if (!_sharedCJRouter)
			[[self alloc] init];
        
		return _sharedCJRouter;
	}
    
	return nil;
}

+(id)alloc
{
	@synchronized([CJRouter class])
	{
		NSAssert(_sharedCJRouter == nil,
                 @"Attempted to allocate a second instance of a singleton.");
		_sharedCJRouter = [super alloc];
		return _sharedCJRouter;
	}
    
	return nil;
}

-(id)init {
	self = [super init];
	if (self != nil) {
		NSDictionary *configurations = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Routes" withExtension:@"plist"]];
        configs = [[configurations objectForKey:@"Routes"] copy];
        routes = [NSMutableDictionary dictionary];
	}
    
	return self;
}

-(void)launchControllerAtRoute:(NSURL*) url {
    NSString *host = [url host];
    NSDictionary *dictionary = [configs objectForKey:[url host]];

    if (host) {
        CJRoute *route = [[CJRoute alloc] initWithDictionary:dictionary forRoute: url];

        [self setViewControllerWithRoute:route];
    }
    else {
        if (![[_delegate class] isSubclassOfClass:[UITabBarController class]]) {
            [_delegate dismissModalViewControllerAnimated:NO];
        }
    }
}

-(void)launchControllerAtRoute:(NSURL*) url before:(void(^)(NSDictionary *dictionary, UIViewController *controller))beforeHandler {
    _beforeHandler = [beforeHandler copy];
    
    NSString *host = [url host];
    NSDictionary *dictionary = [configs objectForKey:[url host]];

    if (host) {
        CJRoute *route = [[CJRoute alloc] initWithDictionary:dictionary forRoute: url];
        
        _beforeHandler(route.configs, route.controller);
        [self setViewControllerWithRoute:route];
    }
    else {
        if (![[_delegate class] isSubclassOfClass:[UITabBarController class]]) {
            [_delegate dismissModalViewControllerAnimated:NO];
        }
    }

    [_beforeHandler release];
    _beforeHandler = nil;
}

-(void)launchControllerAtRoute:(NSURL*) url after:(void(^)(NSDictionary *dictionary, UIViewController *controller))afterHandler {
    _afterHandler = [afterHandler copy];
    
    NSString *host = [url host];
    NSDictionary *dictionary = [configs objectForKey:[url host]];

    if (host) {
        CJRoute *route = [[CJRoute alloc] initWithDictionary:dictionary forRoute: url];

        [self setViewControllerWithRoute:route];
        _afterHandler(route.configs, route.controller);
    }
    else {
        if (![[_delegate class] isSubclassOfClass:[UITabBarController class]]) {
            [_delegate dismissModalViewControllerAnimated:NO];
        }
    }
    
    [_afterHandler release];
    _afterHandler = nil;
}

-(void)launchControllerAtRoute:(NSURL*) url before:(void(^)(NSDictionary *dictionary, UIViewController *controller))beforeHandler after:(void(^)(NSDictionary *dictionary, UIViewController *controller))afterHandler {
    _beforeHandler = [beforeHandler copy];
    _afterHandler = [afterHandler copy];
    
    NSString *host = [url host];
    NSDictionary *dictionary = [configs objectForKey:[url host]];

    if (host) {
        CJRoute *route = [[CJRoute alloc] initWithDictionary:dictionary forRoute: url];

        _beforeHandler(route.configs, route.controller);
        [self setViewControllerWithRoute:route];
        _afterHandler(route.configs, route.controller);
    }
    else {
        if (![[_delegate class] isSubclassOfClass:[UITabBarController class]]) {
            [_delegate dismissModalViewControllerAnimated:NO];
        }
    }

    [_beforeHandler release];
    _beforeHandler = nil;
    [_afterHandler release];
    _afterHandler = nil;
}

-(void) setViewControllerWithRoute:(CJRoute*)route {

    if ([[_delegate class] isSubclassOfClass:[UITabBarController class]]) {
        NSNumber *index = [[route.configs objectForKey:@"UITabBar"] objectForKey:@"index"];
        
        UITabBarItem *tabItem = [[[_delegate viewControllers] objectAtIndex:[index intValue]] tabBarItem];
        route.controller.tabBarItem = tabItem;
        
        NSMutableArray *controllers = [NSMutableArray arrayWithArray:[_delegate viewControllers]];
        
        [controllers replaceObjectAtIndex:[index intValue] withObject:route.controller];
        [_delegate setViewControllers:controllers];
        
        [_delegate setSelectedIndex:[index intValue]];
        
        [_delegate reloadInputViews];
    }
    else if ([[_delegate class] isSubclassOfClass:[UINavigationController class]]) {
        [_delegate pushViewController:route.controller animated:YES];
    }
    else {
        [_delegate dismissModalViewControllerAnimated:NO];
        
        [_delegate presentModalViewController:route.controller animated:YES];
    }

}

-(void)dealloc
{
    [super dealloc];
    [_sharedCJRouter release];
    [_delegate release];
}

@end