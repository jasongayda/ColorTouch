//
//  ColorTouchAppDelegate.h
//  ColorTouch
//
//  Created by Jason on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorTouchViewController;

@interface ColorTouchAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ColorTouchViewController *viewController;

@end
