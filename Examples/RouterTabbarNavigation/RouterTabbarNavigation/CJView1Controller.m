//
//  CJView1Controller.m
//  Router
//
//  Created by Jérémy chaufourier on 05/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "CJView1Controller.h"

@interface CJView1Controller ()

@end

@implementation CJView1Controller

@synthesize uid;

- (void)loadView 
{
    [super loadView];
    
    self.title = @"view 1";

    self.view.backgroundColor = [UIColor whiteColor];
    
    view1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view1.frame = CGRectMake(20, 70, 280, 44);
    [view1 setTitle:@"view 1" forState:UIControlStateNormal];
    [view1 addTarget:self action:@selector(buttonView1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view1];
    NSLog(@"uid %@", uid);
}

- (void)buttonView1
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbarnavigation://view1"]];
}

@end
