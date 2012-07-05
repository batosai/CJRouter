//
//  CJView2Controller.m
//  Router
//
//  Created by Jérémy chaufourier on 08/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "CJView2Controller.h"

@interface CJView2Controller ()

@end

@implementation CJView2Controller

@synthesize index;

-(id)initWithDictionnary:(NSDictionary*)dictionary
{
    self = [super init];
	if (self != nil) {
        NSLog(@"%@", dictionary);
	}
	return self;
}

- (void)loadView 
{
    [super loadView];

    self.view.backgroundColor = [UIColor whiteColor];

    if (index && [index isEqualToNumber: [NSNumber numberWithInt:1]]) {
        view1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        view1.frame = CGRectMake(20, 70, 280, 44);
        [view1 setTitle:@"view 4 in tabbar index 1" forState:UIControlStateNormal];
        [view1 addTarget:self action:@selector(buttonView3) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:view1];
        
        view2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        view2.frame = CGRectMake(20, 120, 280, 44);
        [view2 setTitle:@"view 5 in tabbar index 1" forState:UIControlStateNormal];
        [view2 addTarget:self action:@selector(buttonView4) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:view2];
    }
    else {
        view1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        view1.frame = CGRectMake(20, 70, 280, 44);
        [view1 setTitle:@"view 1 in tabbar index 0" forState:UIControlStateNormal];
        [view1 addTarget:self action:@selector(buttonView1) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:view1];
        
        view2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        view2.frame = CGRectMake(20, 120, 280, 44);
        [view2 setTitle:@"view 3 in tabbar index 0" forState:UIControlStateNormal];
        [view2 addTarget:self action:@selector(buttonView2) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:view2];
    }

}

- (void)buttonView1
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbar://view1"]];
}

- (void)buttonView2
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbar://view3"]];
}

- (void)buttonView3
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbar://view4"]];
}

- (void)buttonView4
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbar://view5"]];
}

@end
