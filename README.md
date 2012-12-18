##TextScroller


<i> A text scroller View (scrolls left or right horizontally) </i>

![ScreenShot](http://www.pictureshoster.com/files/l0m2pvyl7ljc25a3zhvt.png)

###How to use ?

1. **Initiate**

  <i>Init with UILabel </i>
 
				- (id)initWithUILabel:(UILabel *)label;
		
  <i>Init With your frame and text </i>
 
		- (id)initWithFrame:(CGRect)frame Text:(NSString*)text Font:(UIFont*)font ScrollDirectionRightToLeft:(BOOL)scrollRightToLeft;
			
2. Configurable Parameters

		CGFloat speed;						// Scrolls pixels per unit time, 5.0 by default
		UIColor *textColor;					// gray by default
		UIFont  *textFont;
		NSString *text;
		BOOL shouldScrollFromRightToLeft;	// direction of scroll


3. Helper Methods
			- (void) startScrolling;		// Start Scrolling
			- (void) stopScrolling;			// Pause Scrolling