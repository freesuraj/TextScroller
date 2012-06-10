//
//  SPTextScrollerView.m
//  TextScroller
//
//  Created by Suraj on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SPTextScrollerView.h"

#define SCROLL_PIXELS_PER_UNIT_TIME     15
#define SCROLL_FIRE_INTERVAL            0.1

@interface SPTextScrollerView()
@property (nonatomic, strong) UILabel *containerLabel;
@end

BOOL shouldScrollFromRightToLeft;

@implementation SPTextScrollerView
@synthesize containerLabel = _containerLabel;


- (id)initWithFrame:(CGRect)frame Text:(NSString*)text Font:(UIFont*)font ScrollDirectionRightToLeft:(BOOL)scrollRightToLeft
{
    self = [super initWithFrame:frame];
    CGSize sizeOfContainerLabel = [text sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, self.frame.size.height)];
    _containerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, sizeOfContainerLabel.width, frame.size.height)];
    _containerLabel.text = text;
    _containerLabel.textColor = [UIColor blackColor];
    _containerLabel.font = font;
    [self setClipsToBounds:YES];
    self.backgroundColor = [UIColor grayColor];
    _containerLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_containerLabel];
    shouldScrollFromRightToLeft = scrollRightToLeft;
   [NSTimer scheduledTimerWithTimeInterval:SCROLL_FIRE_INTERVAL target:self selector:@selector(scrollView:) userInfo:nil repeats:YES];
    return self;
}

#pragma mark - Scroll Methods

- (void)scrollView:(NSTimer*)sender
{
    [UIView beginAnimations:@"scroll" context:nil];
    if (shouldScrollFromRightToLeft) {
    _containerLabel.center = CGPointMake(_containerLabel.center.x-SCROLL_PIXELS_PER_UNIT_TIME, _containerLabel.center.y);
    [UIView commitAnimations];
        if (_containerLabel.center.x<=-_containerLabel.frame.size.width/2) {
        _containerLabel.center = CGPointMake(self.frame.size.width+_containerLabel.frame.size.width, _containerLabel.center.y);
        [UIView beginAnimations:@"scrollRepeat" context:nil];
        _containerLabel.center = CGPointMake(self.frame.size.width+_containerLabel.frame.size.width/2, _containerLabel.center.y);
        [UIView commitAnimations];
        }
    }
    else {
        _containerLabel.center = CGPointMake(_containerLabel.center.x+SCROLL_PIXELS_PER_UNIT_TIME, _containerLabel.center.y);
        [UIView commitAnimations];
        if (_containerLabel.center.x>=self.frame.size.width+_containerLabel.frame.size.width/2) {
            _containerLabel.center = CGPointMake(-self.frame.size.width-_containerLabel.frame.size.width, _containerLabel.center.y);
            [UIView beginAnimations:@"scrollRepeat" context:nil];
            _containerLabel.center = CGPointMake(-_containerLabel.frame.size.width/2, _containerLabel.center.y);
            [UIView commitAnimations];
        }
    }
    
}


@end
