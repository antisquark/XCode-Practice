//
//  FCTimerView2.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCCircularProgressIndicator.h"
#import "FCGraphicsAPI.h"
#import "FCProgressStyle.h"
#import "FCShapeStyle.h"

@implementation FCCircularProgressIndicator
@synthesize progressStyles;
@synthesize totalTime;
@synthesize currentTime;
@synthesize timer;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        // Initialization code
        timer = nil;

        //default styles        
        FCShapeStyle *progressStyle = [[FCShapeStyle alloc]init];
        progressStyle.strokeWidth = [NSNumber numberWithInt:2];
        progressStyle.strokeColor = [UIColor whiteColor];
        progressStyle.fillColor = [UIColor redColor];
        
        
        FCShapeStyle *remainingStyle = [[FCShapeStyle alloc]init];
        remainingStyle.strokeWidth = progressStyles.progressStyle.strokeWidth;
        remainingStyle.strokeColor = [UIColor clearColor];
        remainingStyle.fillColor = [UIColor clearColor];
        
        progressStyles = [[FCProgressStyle alloc]init];
        progressStyles.progressStyle = progressStyle;
        progressStyles.remainingStyle = remainingStyle;
        [self setOpaque:NO];
    }
    return self;
}
- (id)initWithSeconds:(float)seconds
{
    CGRect newFrame = CGRectMake(0, 0, 100, 100);
    self = [super initWithFrame:newFrame];
    if(self)
    {
        totalTime = seconds;
        currentTime = 0;
        timer = nil;
    
        //default styles        
        FCShapeStyle *progressStyle = [[FCShapeStyle alloc]init];
        progressStyle.strokeWidth = [NSNumber numberWithInt:5];
        progressStyle.strokeColor = [UIColor whiteColor];
        progressStyle.fillColor = [UIColor redColor];
        
        
        FCShapeStyle *remainingStyle = [[FCShapeStyle alloc]init];
        remainingStyle.strokeWidth = progressStyles.progressStyle.strokeWidth;
        remainingStyle.strokeColor = [UIColor clearColor]; //[UIColor grayColor];
        remainingStyle.fillColor = [UIColor clearColor]; //[UIColor blueColor];
        
        progressStyles = [[FCProgressStyle alloc]init];
        progressStyles.progressStyle = progressStyle;
        progressStyles.remainingStyle = remainingStyle;
        [self setOpaque:NO];


        
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *) event
{
    [super touchesEnded:touches withEvent:event];
//    NSLog(@"Touches detected in %@", self);
    [self startStop];
}
//- (void) pressed
- (void) startStop
{
//    NSLog(@"pressed executing");
    if (nil == timer) 
    {
//        NSLog(@"No timer");
        if(currentTime == totalTime) //reset on click if timer==complete
        {
            currentTime=0;
        }
//        NSLog(@"Creating a timer");
//        timer = 
        timer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target:self selector:@selector(update:) userInfo:nil repeats: YES];
    } 
    else
    {
        [timer invalidate];
        timer = nil;
    }
    [self setNeedsDisplay]; 
}

- (void)update: (NSTimer *) theTimer 
{
//    currentTime +=1;
    currentTime += theTimer.timeInterval;
    if(currentTime >=totalTime)
    {
//        NSLog(@"Freeing timer %@", timer);
        currentTime = totalTime;
        [timer invalidate];
        timer = nil;
    }
    [self setNeedsDisplay]; 
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    // Drawing code
//    FCShapeStyle *timerBgStyle = [[FCShapeStyle alloc]init];
//    timerBgStyle.fillColor = [UIColor redColor];
//    timerBgStyle.strokeWidth = [NSNumber numberWithInt:5];
//    timerBgStyle.strokeColor = [UIColor greenColor];

//    [self setOpaque:NO];
//    [self setBackgroundColor: [UIColor clearColor]];
    
    [FCGraphicsAPI drawEllipse:rect withStyle:progressStyles.remainingStyle context:currentContext];
//    NSLog(@"%@ Progress Style", self.progressStyles);
    float percentage = currentTime/totalTime;
//    NSLog(@"current %f, total %f,percentage %f", currentTime, totalTime, percentage);
//    [FCGraphicsAPI drawEllipseSlice:rect withStyle:progressStyles.progressStyle arclength:percentage*2*M_PI context:currentContext];
    [FCGraphicsAPI drawEllipseSliceStart:rect withStyle:progressStyles.progressStyle arcAngleStart:3*M_PI_2 arcAngleLength:percentage*2*M_PI context:currentContext];
}

- (void) dealloc
{
    [FCProgressStyle release];
    [super dealloc];
}


@end
