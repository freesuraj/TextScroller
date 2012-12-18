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
@property (strong, nonatomic) IBOutlet SPTextScrollerView *myTextScroller;
@property (strong, nonatomic) IBOutlet UISwitch *leftRight;
@property (strong, nonatomic) IBOutlet UISlider *speedSlider;
@property (strong, nonatomic) IBOutlet UILabel *sliderValueLabel;
@property (strong, nonatomic) IBOutlet UIButton *pausePlayButton;
- (IBAction)pausePlayPressed:(UIButton *)sender;
- (IBAction)sliderMoved:(UISlider *)sender;
- (IBAction)leftRightChanged:(UISwitch *)sender;

@end

@implementation SPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
		NSString *text = @"Text moving from right to left.. like a TV News..";
	[self.myTextScroller setShouldScrollFromRightToLeft:self.leftRight.isOn];
	[self.myTextScroller setSpeed:self.speedSlider.value];
	[self.myTextScroller setText:text];
	[self.sliderValueLabel setText:[NSString stringWithFormat:@"%.1f",self.speedSlider.value]];
	
}

- (void)viewDidUnload
{
	[self setMyTextScroller:nil];
	[self setLeftRight:nil];
	[self setSpeedSlider:nil];
	[self setSliderValueLabel:nil];
	[self setPausePlayButton:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pausePlayPressed:(UIButton *)sender {
	if([sender.titleLabel.text isEqualToString:@"pause"]){
		[self.myTextScroller stopScrolling];
		[sender setTitle:@"scroll" forState:UIControlStateNormal];
	}
	else{
		[self.myTextScroller startScrolling];
		[sender setTitle:@"pause" forState:UIControlStateNormal];
	}
}

- (IBAction)sliderMoved:(UISlider *)sender {
	self.myTextScroller.speed = sender.value;
	[self.sliderValueLabel setText:[NSString stringWithFormat:@"%.1f",self.speedSlider.value]];
}

- (IBAction)leftRightChanged:(UISwitch *)sender {
	self.myTextScroller.shouldScrollFromRightToLeft = sender.isOn;
}
@end
