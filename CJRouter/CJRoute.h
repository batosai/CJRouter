//
//  CJRoute.h
//  Router
//
//  Created by Jérémy chaufourier on 07/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJRoute : NSObject {
    SEL selector;
    NSMutableDictionary *params;
}

@property (assign, nonatomic) NSDictionary *configs;
@property (assign, nonatomic) NSURL *route;
@property (assign, nonatomic) UIViewController *controller;

-(id)initWithDictionary:(NSDictionary*) dictionary forRoute:(NSURL*) url;
-(void)initialisation;
-(void)configuration;
-(void)paramsWithDictionary;
-(void)paramsWithQuery;
@end
