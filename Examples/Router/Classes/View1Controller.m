//
//  CJView1Controller.m
//  Router
//
//  Created by Jérémy chaufourier on 05/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "View1Controller.h"

@interface View1Controller ()

@end

@implementation View1Controller

@synthesize uid, framestring;

- (void)loadView 
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];

    close = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    close.frame = CGRectMake(20, 20, 280, 44);
    [close setTitle:@"close view 1" forState:UIControlStateNormal];
    [close addTarget:self action:@selector(buttonClose) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:close];
    
    view1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view1.frame = CGRectMake(20, 70, 280, 44);
    [view1 setTitle:@"view 3(webview)" forState:UIControlStateNormal];
    [view1 addTarget:self action:@selector(buttonView1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view1];
    
    view2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view2.frame = CGRectMake(20, 120, 280, 44);
    [view2 setTitle:@"view 2" forState:UIControlStateNormal];
    [view2 addTarget:self action:@selector(buttonView2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view2];

    NSLog(@"uid %@", uid);
    
    CGRect frame = CGRectFromString(framestring);
    
    NSLog(@"frameString %@", NSStringFromCGRect(frame));
}

- (void)buttonClose
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)buttonView1
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"router://view3"]];
}

- (void)buttonView2
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"router://view2"]];
}

@end
