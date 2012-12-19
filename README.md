##TextScroller


<i> A text scroller View (scrolls left or right horizontally) </i>

![ScreenShot](http://www.pictureshoster.com/files/d72ubnfqxky310441px.png)

###How to use ?

1. **Initiate**

  <i>Init with UILabel </i>
 
				- (id)initWithUILabel:(UILabel *)label;
		
  <i>Init With your frame and text </i>
 
		- (id)initWithFrame:(CGRect)frame Text:(NSString*)text Font:(UIFont*)font ScrollType:(ScrollerType)scrollType;

			
2. Configurable Parameters

		CGFloat speed;						// Scrolls pixels per unit time, 5.0 by default
		UIColor *textColor;					// gray by default
		UIFont  *textFont;
		NSString *text;
		ScrollerType textScrollerType;			


3. Helper Methods

			- (void) startScrolling;		// Start Scrolling
			- (void) stopScrolling;			// Pause Scrolling
			
4. Scroller types
	
			typedef enum 
			{
			ScrollerTypeRightToLeft		= 0,
			ScrollerTypeLeftToRight		= 1,
			ScrollerTypeFloating		= 2,
			ScrollerTypeUnknown			= -1
			}ScrollerType;