TextScroller
============

A text scroller View (scrolls left or right horizontally)

Method to use
--------------
1.Just initiate with the following method, 
- (id)initWithFrame:(CGRect)frame Text:(NSString*)text Font:(UIFont*)font ScrollDirectionRightToLeft:(BOOL)scrollRightToLeft;

2.If you like to change the speed of the scrolling , change the value of macros (inside TextScrollerView.h file). Current declaration:

SCROLL_PIXELS_PER_UNIT_TIME     5
SCROLL_FIRE_INTERVAL            0.1