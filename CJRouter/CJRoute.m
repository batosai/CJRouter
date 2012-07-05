//
//  CJRoute.m
//  Router
//
//  Created by Jérémy chaufourier on 07/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "CJRoute.h"

@implementation CJRoute

@synthesize configs = _configs;
@synthesize route = _route;
@synthesize controller = _controller;

-(id)initWithDictionary:(NSDictionary*) dictionary forRoute:(NSURL *)url {
	self = [super init];
	if (self != nil) {
        _configs = dictionary;
        _route = url;
        params = [NSMutableDictionary dictionary];

        [self initialisation];
        [self configuration];
	}
	return self;
}

-(void)initialisation
{
    NSString *class = [_configs objectForKey:@"class"];
    Class detailClass = NSClassFromString(class);

    NSDictionary *method;
    if ((method = [_configs objectForKey:@"method"]))
    {
        id param1, param2;

        if ((param1 = [method objectForKey:@"param1"]) && (param2 = [method objectForKey:@"param2"])) {
            selector = NSSelectorFromString([NSString stringWithFormat: @"%@:", [method objectForKey:@"name"]]);

            @try {
                _controller = [[detailClass alloc] performSelector:selector withObject:param1 withObject:param2];
            }
            @catch (NSException * e) {
                NSLog(@"*** Router Exception: %@ method with %@ class not exist.", [method objectForKey:@"name"], [detailClass class]);
            }
        }
        else if ((param1 = [method objectForKey:@"param1"])) {
            selector = NSSelectorFromString([NSString stringWithFormat: @"%@:", [method objectForKey:@"name"]]);
            
            @try {
                _controller = [[detailClass alloc] performSelector:selector withObject:param1];
            }
            @catch (NSException * e) {
                NSLog(@"*** Router Exception: %@ method with %@ class not exist.", [method objectForKey:@"name"], [detailClass class]);
            }
        }
        else {
            selector = NSSelectorFromString([method objectForKey:@"name"]);

            @try {
                _controller = [[detailClass alloc] performSelector:selector];
            }
            @catch (NSException * e) {
                NSLog(@"*** Router Exception: %@ method with %@ class not exist.", [method objectForKey:@"name"], [detailClass class]);
            }
        }
    }
    else {
        _controller = [[detailClass alloc] init];
    }
}

-(void)configuration
{
    [self paramsWithDictionary];
    [self paramsWithQuery];
}

-(void)paramsWithDictionary
{
    NSDictionary *properties;
    if ((properties = [_configs objectForKey:@"properties"]))
    {
        for (NSString * key in properties) {
            [self setVarForvalue:[properties valueForKey:key] andForKey:key];
        }
    }
}

-(void)paramsWithQuery
{
    NSString *query = [_route query];
    if (query)
    {
        NSArray * pairs = [query componentsSeparatedByString:@"&"];

        for (NSString * pair in pairs) {
            NSArray * bits = [pair componentsSeparatedByString:@"="];
            NSString * key = [[bits objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
            NSString * value = [[bits objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
            [params setObject:value forKey:key];

            [self setVarForvalue:value andForKey:key];
        }
    }
}

-(void)setVarForvalue:(NSString*)value andForKey:(NSString*)key {
    @try {
        [_controller setValue:value forKey:key];
    }
    @catch (NSException * e) {
        NSLog(@"*** Router Exception: %@ class is not key value coding-compliant for the key %@.", [_controller class], key);
    }
}

-(void)dealloc
{
    [super dealloc];
    [_configs release];
    [_route release];
    [_controller release];
}

@end
