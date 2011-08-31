//
//  FCTimerView2.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCProgressStyle.h"
//@interface FCCircularProgressIndicator : UIButton
@interface FCCircularProgressIndicator : UIView
{
    FCProgressStyle *progressStyles;
    NSTimer *timer;
    float totalTime;
    float currentTime;
}
//- (void) pressed;
- (void) startStop;
- (id)initWithSeconds:(float)seconds;
- (void) update:(NSTimer *)theTimer;
@property (retain, nonatomic) FCProgressStyle *progressStyles;
@property (retain, nonatomic) NSTimer *timer;
@property (assign) float totalTime;
@property (assign) float currentTime;
@end
