//
//  SPTextScrollerView.h
//  TextScroller
//
//  Created by Suraj on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPTextScrollerView : UIView

@property (nonatomic) CGFloat speed;										// Scrolls pixels per unit time, 5.0 by default
@property (nonatomic, strong) UIColor *textColor;				// gray by default
@property (nonatomic, strong) UIFont  *textFont;
@property (nonatomic, strong) NSString *text;
@property (nonatomic) BOOL shouldScrollFromRightToLeft;

// Init Methods
- (id)initWithFrame:(CGRect)frame Text:(NSString*)text Font:(UIFont*)font ScrollDirectionRightToLeft:(BOOL)scrollRightToLeft;
- (id)initWithUILabel:(UILabel *)label;

- (void) startScrolling;		// Start Scrolling
- (void) stopScrolling;			// Pause Scrolling

@end

