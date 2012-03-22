//
//  TouchesAppDelegate.h
//  Touches
//
//  Created by Jason on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchesViewController;

@interface TouchesAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TouchesViewController *viewController;

@end
