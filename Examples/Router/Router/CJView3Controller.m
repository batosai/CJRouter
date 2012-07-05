//
//  CJView3Controller.m
//  Router
//
//  Created by Jérémy chaufourier on 09/05/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "CJView3Controller.h"

@interface CJView3Controller ()

@end

@implementation CJView3Controller

@synthesize webview;

- (id)initWithNibName:(NSString *)nibNameOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"index" 
                                                     ofType:@"html"];
    
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];

    [webview loadHTMLString:content baseURL:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
