//
//  Mar14AppDelegate.h
//  Mar14
//
//  Created by Joe Gabela on 3/24/13.
//  Copyright (c) 2013 Joe Gabela. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Mar14AppDelegate : UIResponder <UIApplicationDelegate>
{
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
