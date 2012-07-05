//
//  CJView2Controller.m
//  Router
//
//  Created by Jérémy chaufourier on 08/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "CJView2Controller.h"
#import "CJRouter.h"

@interface CJView2Controller ()

@end

@implementation CJView2Controller

-(id)initWithDictionnary:(NSDictionary*)dictionary
{
    self = [super init];
	if (self != nil) {
        NSLog(@"%@", dictionary);
	}
	return self;
}

- (void)loadView 
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    close = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    close.frame = CGRectMake(20, 20, 280, 44);
    [close setTitle:@"close view 2" forState:UIControlStateNormal];
    [close addTarget:self action:@selector(buttonClose) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:close];
    
    view1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view1.frame = CGRectMake(20, 70, 280, 44);
    [view1 setTitle:@"view 1" forState:UIControlStateNormal];
    [view1 addTarget:self action:@selector(buttonView1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view1];
    
    view2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view2.frame = CGRectMake(20, 120, 280, 44);
    [view2 setTitle:@"view 3(webview)" forState:UIControlStateNormal];
    [view2 addTarget:self action:@selector(buttonView2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view2];
}

- (void)buttonClose
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"router://"]];
}

- (void)buttonView1
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"router://view1"]];
}

- (void)buttonView2
{
    [[CJRouter sharedCJRouter] launchControllerAtRoute:[NSURL URLWithString:@"router://view3"]];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"router://view3"]];
}

@end
