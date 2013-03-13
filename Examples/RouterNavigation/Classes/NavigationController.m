//
//  CJNavigationController.m
//  Router
//
//  Created by Jérémy chaufourier on 16/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "NavigationController.h"
#import "View1Controller.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)loadView 
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];

    View1Controller *viewController = [[View1Controller alloc] init];
    
    [self pushViewController:viewController animated:YES];
}

- (void)buttonView1
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routernavigation://view3"]];
}

- (void)buttonView2
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routernavigation://view2"]];
}

@end
