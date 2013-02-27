//
//  Navigation2Controller.m
//  RouterTabbarNavigation
//
//  Created by Jérémy chaufourier on 28/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "Navigation2Controller.h"
#import "View2Controller.h"

@interface Navigation2Controller ()

@end

@implementation Navigation2Controller

- (void)loadView 
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    View2Controller *viewController = [[View2Controller alloc] init];
    
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
