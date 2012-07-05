//
//  CJNavigation2Controller.m
//  RouterTabbarNavigation
//
//  Created by Jérémy chaufourier on 28/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "CJNavigation2Controller.h"
#import "CJView2Controller.h"

@interface CJNavigation2Controller ()

@end

@implementation CJNavigation2Controller

- (void)loadView 
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CJView2Controller *viewController = [[CJView2Controller alloc] init];
    
    [self pushViewController:viewController animated:YES];
}

- (void)buttonView1
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbarnavigation://view3"]];
}

- (void)buttonView2
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbarnavigation://view2"]];
}

@end
