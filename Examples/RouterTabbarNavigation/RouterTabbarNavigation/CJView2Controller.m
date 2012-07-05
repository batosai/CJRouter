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
    
    self.title = @"view 2";
    
    self.view.backgroundColor = [UIColor whiteColor];

    view2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    view2.frame = CGRectMake(20, 70, 280, 44);
    [view2 setTitle:@"view 2" forState:UIControlStateNormal];
    [view2 addTarget:self action:@selector(buttonView2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view2];
}

- (void)buttonView2
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"routertabbarnavigation://view2"]];
}

@end
