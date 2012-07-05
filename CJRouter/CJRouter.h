//
//  CJRouter.h
//  Router
//
//  Created by Jérémy chaufourier on 05/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJRouter : NSObject {
    NSDictionary *configs;
    NSMutableDictionary *routes;
    
    void (^_beforeHandler)(NSDictionary *dictionary, UIViewController *controller);
    void (^_afterHandler)(NSDictionary *dictionary, UIViewController *controller);
}

+(CJRouter*)sharedCJRouter;

-(void)launchControllerAtRoute:(NSURL*) url;
-(void)launchControllerAtRoute:(NSURL*) url
                        before:(void(^)(NSDictionary *dictionary, UIViewController *controller))beforeHandler;
-(void)launchControllerAtRoute:(NSURL*) url
                         after:(void(^)(NSDictionary *dictionary, UIViewController *controller))afterHandler;
-(void)launchControllerAtRoute:(NSURL*) url
                        before:(void(^)(NSDictionary *dictionary, UIViewController *controller))beforeHandler
                         after:(void(^)(NSDictionary *dictionary, UIViewController *controller))afterHandler;

@property (assign, nonatomic) id delegate;

@end
