//
//  CJView1Controller.m
//  Router
//
//  Created by Jérémy chaufourier on 05/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "View4Controller.h"

@interface View4Controller ()

@end

@implementation View4Controller

- (void)loadView 
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    view1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view1.frame = CGRectMake(20, 70, 280, 44);
    [view1 setTitle:@"view 1 in tabbar index 0" forState:UIControlStateNormal];
    [view1 addTarget:self action:@selector(buttonView1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view1];
    
    view2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view2.frame = CGRectMake(20, 120, 280, 44);
    [view2 setTitle:@"view 5 in tabbar index 1" forState:UIControlStateNormal];
    [view2 addTarget:self action:@selector(buttonView2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view2];
    
    view3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view3.frame = CGRectMake(20, 170, 280, 44);
    [view3 setTitle:@"view 2 in tabbar index 1" forState:UIControlStateNormal];
    [view3 addTarget:self action:@selector(buttonView3) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view3];
}

- (void)buttonView1
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbar://view1"]];
}

- (void)buttonView2
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbar://view5"]];
}

- (void)buttonView3
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbar://view6"]];
}

@end
