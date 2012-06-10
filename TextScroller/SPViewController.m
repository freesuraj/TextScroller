//
//  SPViewController.m
//  TextScroller
//
//  Created by Suraj on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SPViewController.h"
#import "SPTextScrollerView.h"

@interface SPViewController ()

@end

@implementation SPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *text = @"i don't know what's going to happen when repeating....";
    SPTextScrollerView *scrollerView = [[SPTextScrollerView alloc]initWithFrame:CGRectMake(20, 100, 280, 30) Text:text Font:[UIFont systemFontOfSize:20] ScrollDirectionRightToLeft:YES];
    [self.view addSubview:scrollerView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
