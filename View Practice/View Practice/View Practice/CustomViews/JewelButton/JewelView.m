//
//  JewelView.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "JewelView.h"
#import "FCRectangleStyle.h"
#import "FCGraphicsAPI.h"
#import "FCGradientStyle.h"

@implementation JewelView
@synthesize colorInt;
@synthesize cornerRadius;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        cornerRadius = 8;
    }
    return self;
}
+(UIColor *)darkenByWithAlpha:(UIColor *)color amt:(float)darkenAmt alpha:(float)aAmt
{
    const CGFloat *endComponents = CGColorGetComponents([color CGColor]);
    
    //    NSLog(@"Before: r%f, g%f, b%f, a%f", endComponents[0], endComponents[1],endComponents[2],1.0);
    //    NSLog(@"After:  r%f, g%f, b%f, a%f", endComponents[0]-darkenAmt, endComponents[1]-darkenAmt,endComponents[2]-darkenAmt,1.0);
    return [UIColor colorWithRed:fmax(fmin(endComponents[0]-darkenAmt, 1), 0) 
                           green:fmax(fmin(endComponents[1]-darkenAmt, 1), 0) 
                            blue:fmax(fmin(endComponents[2]-darkenAmt, 1), 0) alpha:aAmt];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    FCRectangleStyle *drawRect = [[FCRectangleStyle alloc]init];
    drawRect.cornerRadius = [NSNumber numberWithInt: cornerRadius];
    
    FCGradientStyle *drawStyle = [[FCGradientStyle alloc]init];
    drawStyle.gradientColor =  [FCGraphicsAPI UIColorFromRGB:colorInt];
    drawStyle.fillColor = [JewelView darkenByWithAlpha:drawStyle.gradientColor amt:.5 alpha:1];
    drawStyle.fillType = kFCGradientVertical;
    drawStyle.strokeGradientColor = drawStyle.fillColor;
    drawStyle.strokeColor = drawStyle.gradientColor;
//    drawStyle.strokeType = kFCGradientVertical;
//    drawStyle.strokeWidth = [NSNumber numberWithInt:0];
    drawRect.style = drawStyle;
    [FCGraphicsAPI drawRect:rect withStyle:drawRect context:currentContext];

    drawRect.cornerRadius = [NSNumber numberWithInt: cornerRadius -CORNER_OFFSET];
//    drawStyle.gradientColor = [FCGraphicsAPI UIColorFromRGB:colorInt];
    drawStyle.fillColor = [JewelView darkenByWithAlpha:drawStyle.gradientColor amt:-.4 alpha:1];
    drawStyle.fillType = kFCGradientVertical;
    drawStyle.strokeGradientColor = drawStyle.fillColor;
    drawStyle.strokeColor = drawStyle.gradientColor;
    drawStyle.strokeType = kFCGradientVertical;
    drawStyle.strokeWidth = [NSNumber numberWithInt:2];

    [FCGraphicsAPI drawRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-2) withStyle:drawRect context:currentContext];

    // Drawing code
}


@end
