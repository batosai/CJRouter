//
//  CJView2Controller.m
//  Router
//
//  Created by Jérémy chaufourier on 08/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "View2Controller.h"

@interface View2Controller ()

@end

@implementation View2Controller

-(id)initWithDictionnary:(NSDictionary*)dictionary
{
    self = [super init];
	if (self) {
        NSLog(@"%@", dictionary);
        
        CGRect frame = CGRectFromString([dictionary valueForKey:@"frame"]);
        NSLog(@"frame %@", NSStringFromCGRect(frame));
	}
	return self;
}

- (void)loadView 
{
    [super loadView];
    
    self.title = @"view 2";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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

- (void)buttonView1
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routernavigation://view1"]];
}

- (void)buttonView2
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routernavigation://view3"]];
}

@end
