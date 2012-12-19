##TextScroller

### Description

<i> A text scroller View (scrolls left or right horizontally) </i>.
 This is a `UIView` that holds a `UILabel` in it. The text of the `UILabel` is scrolled. Three types of scrolling types are available at the moment.

1. Right to Left
2. Left to Right
3. Floating

### ScreenShot

This git package contains an example Xcode project. Executing which you would get a screen shot like below.

![ScreenShot](http://www.pictureshoster.com/files/d72ubnfqxky310441px.png)

###Usage

#### Files
Just copy the following files and put them inside your project. 

1. 	`SPTextScrollerView.h` 	 
2. `SPTextScrollerView.m` 
 

#### Frameworks
Add `QuartzCore.Framework` into your project

#### Start

1. **Initiate**

  <i>Init with `UILabel` </i>
 
				- (id)initWithUILabel:(UILabel *)label;
		
  <i>Init With your `frame` and `text` </i>
 
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
			
### More
Follow me [@freesuraj](http://twitter.com/freesuraj) on Twitter for the latest news.