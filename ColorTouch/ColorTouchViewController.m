//
//  ColorTouchViewController.m
//  ColorTouch
//
//  Created by Jason on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ColorTouchViewController.h"
#import <QuartzCore/QuartzCore.h>

UIView *myTouchView;

@implementation ColorTouchViewController

@synthesize touchView = _theTouchView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setMultipleTouchEnabled:YES];
    [self.view setBackgroundColor:([UIColor blackColor])];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
   // NSSet *allTouches = [event allTouches];
    
    // TODO: This needs to be released
    _theTouchView = [[UIView alloc] init];
    
    NSLog(@"touchView alloc: touchView retain=%d",[_theTouchView retainCount]);
    
    CGFloat myred =  (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat myblue = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat mygreen = (CGFloat)random()/(CGFloat)RAND_MAX;
    
    // Enumerate over all the touches and draw a dot where the touches were
    [touches enumerateObjectsUsingBlock:^(id obj, BOOL *stop) 
    {
        // Get each touch and it's location
        UITouch *touch = obj;
        CGPoint touchPoint = [touch locationInView:self.view];
                 
        // TODO: Set random color depending on where they touched
        //Screen is 320px wide
        [_theTouchView setBackgroundColor:[UIColor 
                                       colorWithRed:myred
                                       green:mygreen
                                       blue:myblue
                                       alpha:1]];
                 
        _theTouchView.frame = CGRectMake(touchPoint.x - 20, 
                                     touchPoint.y - 20, 
                                     40, 
                                     40);
        
        _theTouchView.layer.cornerRadius = 20;
                 
        [self.view addSubview:_theTouchView];
                 
        NSLog(@"touchView addSubView: touchView retain=%d",[_theTouchView retainCount]);
    }];

    //timer = [NSTimer scheduledTimerWithTimeInterval:1
    //                                         target:self
    //                                       selector:@selector(removeTouches:) 
    //                                       userInfo:touchView 
    //                                        repeats:NO];
    
    //[timer retain];
    
    [self removeTouches:_theTouchView];
    NSLog(@"touchView after remove touches: touchView retain=%d",[_theTouchView retainCount]);
}



//-(void)removeTouches:(NSTimer *)theTimer
-(void)removeTouches:(UIView *)theTouchView
{
    myTouchView = theTouchView;
    //theTouchView = ((UIView *)theTimer.userInfo);
    
    theTouchView.alpha = 1;

    [UIView beginAnimations:@"Fade Out" context:nil]; 
                        
    // wait for time before begin
    [UIView setAnimationDelay:0];
    [UIView setAnimationDuration:2];
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    theTouchView.alpha = 0.0;  
    
    [UIView commitAnimations];

    [theTouchView release];
    NSLog(@"removeTouches: theTouchView retain=%d",[theTouchView retainCount]);
}

- (void)animationDidStop:(NSString *)animationID finished:(BOOL *)finished context:(void *)context {
    if ([animationID isEqualToString:@"Fade Out"]) 
    {
        myTouchView.alpha = 0.0;
        NSLog(@"animationDidStop: myTouchView retain=%d",[myTouchView retainCount]);

        [(NSNumber *)context release];
        [animationID release];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    [myTouchView release];
    [_theTouchView release];
    [super dealloc];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



@end
