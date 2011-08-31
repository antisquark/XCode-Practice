//
//  FCFancyCircularProgressIndicator.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCFancyCircularProgressIndicator.h"
#import "FCGraphicsAPI.h"
#import "FCShapeStyle.h"
#import "FCGradientStyle.h"
#import "FCRectangleStyle.h"
#import "stdio.h"

@implementation FCFancyCircularProgressIndicator

@synthesize textStyle;

- (id)init
{
//    NSLog(@"Starting init");
    self = [super init];
    if (self) {
        // Initialization code here.
        textStyle = [[FCShapeStyle alloc]init]; 
        textStyle.fillColor = [UIColor redColor];
        textStyle.strokeColor = [UIColor whiteColor];
        textStyle.strokeWidth = [NSNumber numberWithInt:2];
        progressStyles.progressStyle.strokeColor = [UIColor grayColor];
        progressStyles.remainingStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xCCFFFF];
        progressStyles.remainingStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0x003366];
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
//        FCShapeStyle *progressStyle = [[FCShapeStyle alloc]init];
//        progressStyle.strokeWidth = [NSNumber numberWithInt: 15];
//        progressStyle.strokeColor = [UIColor grayColor];
//        progressStyle.fillColor = [UIColor redColor];
//        
//        NSLog(@"Setting styles");
//        FCShapeStyle *remainingStyle = [[FCShapeStyle alloc]init];
//        remainingStyle.strokeWidth = [NSNumber numberWithInt: 10];
//        remainingStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0x003366];
//        remainingStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xCCFFFF];        
        
        //the Timer Style
        FCGradientStyle *progressStyle = [[FCGradientStyle alloc]init];
        //        progressStyle.strokeWidth = [NSNumber numberWithInt: 10];
        progressStyle.strokeWidth = [NSNumber numberWithInt: 0];
        progressStyle.strokeColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        progressStyle.strokeGradientColor = [UIColor colorWithRed:.3 green:.3 blue:.3 alpha:1];
        progressStyle.strokeType = kFCGradientVertical;
        progressStyle.fillColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        progressStyle.gradientColor = [UIColor colorWithRed:.3 green:.3 blue:.3 alpha:1];
        progressStyle.fillType = kFCGradientVertical;
        
        //the base style
        FCGradientStyle *remainingStyle = [[FCGradientStyle alloc]init];
        remainingStyle.strokeWidth = [NSNumber numberWithInt: 4];
        remainingStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0x003366];
        remainingStyle.strokeGradientColor = remainingStyle.strokeColor;
        remainingStyle.strokeType = kFCGradientVertical;
        remainingStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xCCFFFF];
        remainingStyle.gradientColor = remainingStyle.fillColor;
        remainingStyle.fillType = kFCGradientVertical;

        
        textStyle = [[FCShapeStyle alloc]init]; 
        textStyle.fillColor = [UIColor redColor];
        textStyle.strokeColor = [UIColor whiteColor];
        textStyle.strokeWidth = [NSNumber numberWithInt:2];
        
        progressStyles = [[FCProgressStyle alloc]init];
        progressStyles.progressStyle = progressStyle;
        progressStyles.remainingStyle = remainingStyle;
        [self setOpaque:NO];
        
        
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    float percentage = currentTime/totalTime;
//    //Draw the Circles
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [FCGraphicsAPI drawEllipseSliceStart:rect withStyle:progressStyles.progressStyle arcAngleStart:3*M_PI_2 arcAngleLength:2*M_PI-percentage*2*M_PI context:currentContext];
    float offsetAmt = rect.size.height/OFFSET_FRACTION;
    CGRect topEllipse = CGRectMake(offsetAmt,
                                   offsetAmt,
                                   rect.size.width-2*offsetAmt,
                                   rect.size.height-2*offsetAmt);
                                                       
    [FCGraphicsAPI drawEllipse:topEllipse withStyle:progressStyles.remainingStyle context:currentContext];
    
         
//    [super drawRect:rect];
    //Draw the Text if there should be any visible
    int displayTime = (int)(super.totalTime - floor(super.currentTime));
    if(displayTime > 0)
    {
        
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(currentContext);
        
        //now add Text
//        float textHeight = rect.size.height/1.5- offsetAmt*2;
//        float textHeight = topEllipse.size.height*2/3;//-offsetAmt-[progressStyles.remainingStyle.strokeWidth floatValue];
        float textHeight = topEllipse.size.height *2/3;;
        
//        NSLog(@"Center %f,%f",CGRectGetMidX(rect),CGRectGetMidY(rect));
        //Using string drawing method--gives horizontal alignment for free
        NSString *displayString = [NSString stringWithFormat:@"%d",displayTime];
//        CGRect textRect = CGRectMake(offsetAmt+[progressStyles.remainingStyle.strokeWidth floatValue], 
//                                     offsetAmt+[progressStyles.remainingStyle.strokeWidth floatValue], 
//                                     topEllipse.size.width - [progressStyles.remainingStyle.strokeWidth floatValue]*2, 
//                                     topEllipse.size.height - [progressStyles.remainingStyle.strokeWidth floatValue]*2);//textHeight);        
//        FCRectangleStyle *textRectStyle = [[FCRectangleStyle alloc]init];
//        
//        textStyle.fillColor = [UIColor clearColor];
//        textRectStyle.style = textStyle;
//        [FCGraphicsAPI drawRect:textRect withStyle:textRectStyle context:currentContext];
//        textStyle.fillColor = [UIColor redColor];
        //using CG Text drawing methods
        [textStyle.fillColor setFill];
        [textStyle.strokeColor setStroke];
        CGContextSetLineWidth(currentContext, [textStyle.strokeWidth floatValue]);
        CGContextSetTextDrawingMode(currentContext, kCGTextFillStroke);
//
//        CGSize textSize = [displayString drawInRect:textRect withFont:[UIFont boldSystemFontOfSize:textHeight] lineBreakMode:UILineBreakModeClip alignment:UITextAlignmentCenter];//UITextAlignmentLeft];//
//        NSLog(@"Font actually used w%f, h%f, vs. textRect Height %f",textSize.width, textSize.height, textRect.size.height);
        
        //using the draw at point
        UIFont *displayFont = [UIFont boldSystemFontOfSize:textHeight];
        CGSize tSize = [displayString sizeWithFont:displayFont];   
        float x_pos = (topEllipse.size.width -tSize.width) / 2; 
        float y_pos = (topEllipse.size.height - tSize.height) /2; 
        [displayString drawAtPoint:CGPointMake(topEllipse.origin.x + x_pos, topEllipse.origin.y + y_pos) withFont:displayFont];
        
        
        CGContextRestoreGState(currentContext);
//        
//        [displayString release];
//        [displayFont release];
    }
}

-(void) dealloc
{
    [textStyle release];
    [super dealloc];
}
@end
