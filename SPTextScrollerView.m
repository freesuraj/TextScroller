//
//  SPTextScrollerView.m
//  TextScroller
//
//  Created by Suraj on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SPTextScrollerView.h"
#import <QuartzCore/QuartzCore.h>

#define SCROLL_PIXELS_PER_UNIT_TIME     5
#define SCROLL_FIRE_INTERVAL            2.0

@interface SPTextScrollerView()

@property (nonatomic, strong) UILabel *containerLabel;
@property (nonatomic, strong) CADisplayLink *timer;

@end


@implementation SPTextScrollerView
@synthesize containerLabel = _containerLabel;
@synthesize shouldScrollFromRightToLeft = _shouldScrollFromRightToLeft;

//============================================================================
#pragma mark - Initialization
//============================================================================

- (void) awakeFromNib
{
	self.textFont = [UIFont systemFontOfSize:16.0];
	self.textColor = [UIColor grayColor];
	_containerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	_containerLabel.backgroundColor = [UIColor clearColor];
	[self addSubview:_containerLabel];
}

- (id) init
{
	self = [super init];
	if(self){
		self.textFont = [UIFont systemFontOfSize:16.0];
		self.textColor = [UIColor grayColor];
		_containerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		_containerLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:_containerLabel];
	}
	return self;
}

- (id) initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if(self){
		self.textFont = [UIFont systemFontOfSize:16.0];
		self.textColor = [UIColor grayColor];
		_containerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		_containerLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:_containerLabel];

	}
	return self;
}

- (id)initWithUILabel:(UILabel *)label
{
	self = [super initWithFrame:label.frame];
	if(self){
		self.containerLabel = label;
		[self startScrolling];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame Text:(NSString*)text Font:(UIFont*)font ScrollDirectionRightToLeft:(BOOL)scrollRightToLeft
{
    self = [super initWithFrame:frame];
	
	// set its values
	self.shouldScrollFromRightToLeft = scrollRightToLeft;
	self.textFont = font;
	self.text = text;
	
    CGSize sizeOfContainerLabel = [self.text sizeWithFont:self.textFont constrainedToSize:CGSizeMake(MAXFLOAT, self.frame.size.height)];
    _containerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, sizeOfContainerLabel.width, frame.size.height)];
    _containerLabel.text = text;
	_containerLabel.textColor = self.textColor ? self.textColor : [UIColor blackColor];
    _containerLabel.font = font;
    [self setClipsToBounds:YES];
	
		self.backgroundColor = [UIColor grayColor];
	
    _containerLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_containerLabel];
    self.shouldScrollFromRightToLeft = scrollRightToLeft;
  
	[self startScrolling];
	
	return self;
}

- (void) setText:(NSString *)aText
{
	[_containerLabel removeFromSuperview];
	CGSize sizeOfContainerLabel = [aText sizeWithFont:self.textFont constrainedToSize:CGSizeMake(MAXFLOAT, self.frame.size.height)];
	_containerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, sizeOfContainerLabel.width, self.frame.size.height)];
	_containerLabel.text = aText;
	_containerLabel.textColor = self.textColor ? self.textColor : [UIColor blackColor];
	_containerLabel.font = self.textFont;
	
	NSLog(@"label fram: %@",NSStringFromCGRect(_containerLabel.frame));
	[self addSubview:_containerLabel];
	
	[self startScrolling];
}

//============================================================================
#pragma mark - Scroll Methods
//============================================================================

- (void)scrollView:(NSTimer*)sender
{
	CGFloat speedToMove = self.speed ? self.speed : SCROLL_PIXELS_PER_UNIT_TIME;
	
	if(speedToMove < 0 || speedToMove > 100) speedToMove = 5.0;
	
    if (self.shouldScrollFromRightToLeft)
		{
			[self scrollTheLabelAtCenterX:self.containerLabel.center.x - speedToMove];
			if (self.containerLabel.center.x <= -self.containerLabel.frame.size.width/2) {
				[self scrollTheLabelAtCenterX:self.containerLabel.frame.size.width + self.containerLabel.frame.size.width];
				[self scrollTheLabelAtCenterX:self.containerLabel.frame.size.width + self.containerLabel.frame.size.width/2];
			}
    }
    else
		{
			[self scrollTheLabelAtCenterX:self.containerLabel.center.x + speedToMove];
			if (self.containerLabel.center.x >= self.containerLabel.frame.size.width + self.containerLabel.frame.size.width/2) {
				[self scrollTheLabelAtCenterX:-self.containerLabel.frame.size.width - self.containerLabel.frame.size.width];
				[self scrollTheLabelAtCenterX:-self.containerLabel.frame.size.width/2];
			}
    }
    
}

//============================================================================
#pragma mark - Helpers
//============================================================================

- (void) startScrolling
{
	if(self.timer == nil){
		self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(scrollView:)];
		self.timer.frameInterval = SCROLL_FIRE_INTERVAL;
	}
		[self.timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void) stopScrolling
{
	[self.timer removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void) scrollTheLabelAtCenterX:(CGFloat)centerX
{
	[UIView animateWithDuration:SCROLL_FIRE_INTERVAL animations:^{
		self.containerLabel.center = CGPointMake(centerX, self.containerLabel.center.y);
	} completion:^(BOOL finished) {
		//
	}];
}


@end
