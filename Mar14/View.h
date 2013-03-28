//
//  View.h
//  Mar14
//
//  Created by Joe Gabela on 3/24/13.
//  Copyright (c) 2013 Joe Gabela. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView
{
	NSUInteger tapCount;	//1 for single tap, 2 for double, 0 for no tap
	NSTimeInterval delay; 	//after this number of seconds, a tap wears off
}

@end
