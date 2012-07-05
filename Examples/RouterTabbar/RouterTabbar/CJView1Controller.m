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

    self.view.backgroundColor = [UIColor whiteColor];
    
    view1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view1.frame = CGRectMake(20, 70, 280, 44);
    [view1 setTitle:@"view 2 in tabbar index 0" forState:UIControlStateNormal];
    [view1 addTarget:self action:@selector(buttonView1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view1];
    
    view2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view2.frame = CGRectMake(20, 120, 280, 44);
    [view2 setTitle:@"view 3 in tabbar index 0" forState:UIControlStateNormal];
    [view2 addTarget:self action:@selector(buttonView2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view2];
    NSLog(@"uid %@", uid);
}

- (void)buttonView1
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbar://view2"]];
}

- (void)buttonView2
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbar://view3"]];
}

@end
