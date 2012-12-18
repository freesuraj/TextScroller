//
//  SPViewController.m
//  TextScroller
//
//  Created by Suraj on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SPViewController.h"
#import "SPTextScrollerView.h"

@interface SPViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet SPTextScrollerView *myTextScroller;
@property (strong, nonatomic) IBOutlet UISlider *speedSlider;
@property (strong, nonatomic) IBOutlet UILabel *sliderValueLabel;
@property (strong, nonatomic) IBOutlet UIButton *pausePlayButton;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UISwitch *circularSwitch;

- (IBAction)pausePlayPressed:(UIButton *)sender;
- (IBAction)sliderMoved:(UISlider *)sender;
- (IBAction)segValueChanged:(UISegmentedControl *)sender;
- (IBAction)circularSwitchChanged:(UISwitch *)sender;

@end

@implementation SPViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.textField.delegate = self;
	NSString *text = (self.textField.text.length) ? (self.textField.text) : @"Text moving side ways.. right-left or left-right.. like a TV News..";
	[self.myTextScroller setShouldScrollFromRightToLeft:(self.segControl.selectedSegmentIndex == 0)];
	[self.myTextScroller setSpeed:self.speedSlider.value];
	[self.myTextScroller setText:text];
	[self.sliderValueLabel setText:[NSString stringWithFormat:@"%.1f",self.speedSlider.value]];
	
}

- (void)viewDidUnload
{
	[self setMyTextScroller:nil];
	[self setSpeedSlider:nil];
	[self setSliderValueLabel:nil];
	[self setPausePlayButton:nil];
	[self setSegControl:nil];
	[self setTextField:nil];
	[self setCircularSwitch:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//============================================================================
#pragma mark - UITextFieldDelegate
//============================================================================

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	if(textField.text.length)
		[self.myTextScroller setText:textField.text];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	if(textField.text.length)
		[self.myTextScroller setText:textField.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

//============================================================================
#pragma mark - UI Actions
//============================================================================

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

- (IBAction)segValueChanged:(UISegmentedControl *)sender {
		self.myTextScroller.shouldScrollFromRightToLeft = (sender.selectedSegmentIndex == 0);
}

- (IBAction)circularSwitchChanged:(UISwitch *)sender {
	
}
@end
