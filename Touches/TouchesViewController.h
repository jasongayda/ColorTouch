//
//  TouchesViewController.h
//  Touches
//
//  Created by Jason on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchesViewController : UIViewController {
    
        
}

@property (retain, nonatomic) UIView *touchView;

-(void)removeTouches:(UIView *)theTouchView; //:(NSTimer *)theTimer;

@end
