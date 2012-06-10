//
//  SPTextScrollerView.h
//  TextScroller
//
//  Created by Suraj on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPTextScrollerView : UIView

// Init Method
- (id)initWithFrame:(CGRect)frame Text:(NSString*)text Font:(UIFont*)font ScrollDirectionRightToLeft:(BOOL)scrollRightToLeft;

@end

