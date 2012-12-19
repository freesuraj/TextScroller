//
//  SPTextScrollerView.h
//  TextScroller
//
//  Created by Suraj on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	ScrollerTypeRightToLeft		= 0,
	ScrollerTypeLeftToRight		= 1,
	ScrollerTypeFloating			= 2,
	ScrollerTypeUnknown				= -1
}ScrollerType;

@interface SPTextScrollerView : UIView

@property (nonatomic) CGFloat speed;										// Scrolls pixels per unit time, 5.0 by default
@property (nonatomic, strong) UIColor *textColor;				// gray by default
@property (nonatomic, strong) UIFont  *textFont;
@property (nonatomic, strong) NSString *text;
@property (nonatomic) ScrollerType textScrollerType;

// Init Methods
- (id)initWithFrame:(CGRect)frame Text:(NSString*)text Font:(UIFont*)font ScrollType:(ScrollerType)scrollType;
- (id)initWithUILabel:(UILabel *)label;

- (void) startScrolling;		// Start Scrolling
- (void) stopScrolling;			// Pause Scrolling

@end

