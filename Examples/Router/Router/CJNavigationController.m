//
//  CJNavigationController.m
//  Router
//
//  Created by Jérémy chaufourier on 16/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "CJNavigationController.h"
#import "CJRootViewController.h"

@interface CJNavigationController ()

@end

@implementation CJNavigationController

- (void)loadView 
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];

    CJRootViewController *rootViewController = [[CJRootViewController alloc] init];
    
    [self pushViewController:rootViewController animated:YES];
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
