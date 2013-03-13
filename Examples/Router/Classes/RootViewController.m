//
//  CJRootViewController.m
//  Router
//
//  Created by Jérémy chaufourier on 05/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "RootViewController.h"
#import "CJRouter.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)loadView 
{
    [super loadView];
    
    view1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view1.frame = CGRectMake(20, 20, 280, 44);
    [view1 setTitle:@"view 1" forState:UIControlStateNormal];
    [view1 addTarget:self action:@selector(buttonView1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view1];
    
    view2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view2.frame = CGRectMake(20, 70, 280, 44);
    [view2 setTitle:@"view 2" forState:UIControlStateNormal];
    [view2 addTarget:self action:@selector(buttonView2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view2];
    
    view3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view3.frame = CGRectMake(20, 120, 280, 44);
    [view3 setTitle:@"view 3(webview)" forState:UIControlStateNormal];
    [view3 addTarget:self action:@selector(buttonView3) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view3];
    
    view4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view4.frame = CGRectMake(20, 170, 280, 44);
    [view4 setTitle:@"TabBar" forState:UIControlStateNormal];
    [view4 addTarget:self action:@selector(buttonView4) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view4];
    
    view5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view5.frame = CGRectMake(20, 220, 280, 44);
    [view5 setTitle:@"Navigation" forState:UIControlStateNormal];
    [view5 addTarget:self action:@selector(buttonView5) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view5];
}

- (void)buttonView1
{
    //[[CJRouter sharedCJRouter] setDelegate:self.view];

    //[[CJRouter sharedCJRouter] launchControllerAtRoute:[NSURL URLWithString:@"router://view1"]];
    // OR
    //[[CJRouter sharedCJRouter] launchControllerWithName:@"view1"];
    
    // OR
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"router://view1"]];
}

- (void)buttonView2
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"router://view2"]];
}

- (void)buttonView3
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"router://view3"]];
}

- (void)buttonView4
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"router://view4"]];
}

- (void)buttonView5
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"router://view5"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
