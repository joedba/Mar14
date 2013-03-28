//
//  View.m
//  Mar14
//
//  Created by Joe Gabela on 3/24/13.
//  Copyright (c) 2013 Joe Gabela. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame:frame];
	if (self)
    {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		tapCount = 0;
		delay = 2;
	}
	return self;
}

- (void) noTap
{	//called when no tap is currently being received
	tapCount = 0;
	[self setNeedsDisplay];
}


- (void) singleTap
{	//called when a single tap is received.
	tapCount = 1;
	[self setNeedsDisplay];
    
	//After a few seconds, the single tap wears off.
	[self performSelector: @selector(noTap) withObject: nil
               afterDelay: delay];
}


- (void) doubleTap
{	//called when a double tap is received
	tapCount = 2;
	[self setNeedsDisplay];
	
	//After a few seconds, the double tap wears off.
	[self performSelector: @selector(noTap) withObject: nil
               afterDelay: delay];
}

- (void) tripleTap
{	//called when a triple tap is received
	tapCount = 3;
	[self setNeedsDisplay];
	
	//After a few seconds, the triple tap wears off.
	[self performSelector: @selector(noTap) withObject: nil
               afterDelay: delay];
}


- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	UITouch *touch = [touches anyObject];
	
  if (touch.tapCount == 1)
    {
		[self performSelector: @selector(singleTap) withObject: nil
                   afterDelay: 0.3];
	}
  else if (touch.tapCount == 2)
    {
 		[self performSelector: @selector(doubleTap) withObject: nil
                   afterDelay: 0.3];
	}
  else if (touch.tapCount == 3)
  {
      [self tripleTap];
  }
}



 

 

 

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	UITouch *touch = [touches anyObject];
    
    if (touch.tapCount == 3) {
		[NSObject cancelPreviousPerformRequestsWithTarget: self];
	}
	
	if (touch.tapCount == 2) {
		[NSObject cancelPreviousPerformRequestsWithTarget: self];
	}
    
}






// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
	NSString *string = [NSString stringWithFormat: @"%u", tapCount];
	UIFont *font = [UIFont systemFontOfSize: 6 * 72];
	CGSize size = [string sizeWithFont: font];
  
    
	if (tapCount == 1)
      {
    	self.backgroundColor = [UIColor redColor];
      }
    
    if (tapCount == 2)
    {
    	self.backgroundColor = [UIColor blueColor];
    }
    
    if (tapCount == 3)
    {
    	self.backgroundColor = [UIColor yellowColor];
    }
	
	CGRect b = self.bounds;
	CGFloat x = b.origin.x + (b.size.width - size.width) / 2;
	CGFloat y = b.origin.y + (b.size.height - size.height) / 2;
	[string drawAtPoint: CGPointMake(x, y) withFont: font];
}


@end
