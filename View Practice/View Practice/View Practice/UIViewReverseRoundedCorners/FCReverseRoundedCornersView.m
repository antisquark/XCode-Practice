//
//  UIViewReverseRoundedCorners.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCReverseRoundedCornersView.h"
#import "FCGraphicsAPI.h"
#import "FCRectangleStyle.h"
#import "FCGradientStyle.h"
#import "FCShapeStyle.h"

@implementation FCReverseRoundedCornersView
@synthesize frameStyle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [FCGraphicsAPI drawInverseRect:rect withStyle:frameStyle context:currentContext];
}
/*
    this version uses actual clipping but doesn't currently allow a stroke 
 (that could be added, but the clipping path would need to be altered to accomodate it. 
  it's just a little more math, and one more path)
 */
//- (void)drawRect:(CGRect)rect
//{
//    //the clipping frame will be 1 pixel inside of the actual frame
//    CGFloat minx = CGRectGetMinX(rect), midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect);
//    CGFloat miny = CGRectGetMinY(rect), midy = CGRectGetMidY(rect), maxy = CGRectGetMaxY(rect);
//    CGContextRef aContext = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(aContext);
//    
//    CGContextSetLineWidth(aContext, [frameStyle.style.strokeWidth floatValue]);
//    CGContextBeginPath(aContext);
//    
//    // The below is not true.. maybe the order in which the subpath is declared is what does it?
//    //(if they're the same width, the Even-Odd Rule will fail when they intersect)
//    // rectangle frame just outside of the internal rectangle
//    // Outer rect path
//    CGContextMoveToPoint(aContext, minx, miny); 
//    CGContextAddLineToPoint(aContext, maxx, miny);
//    CGContextAddLineToPoint(aContext, maxx, maxy);
//    CGContextAddLineToPoint(aContext, minx, maxy);
//    CGContextAddLineToPoint(aContext, minx, miny); 
//    CGContextClosePath(aContext);
//    // Rectangle outline
//    
//    // Internal Rounded Rect path
//    CGContextMoveToPoint(aContext, minx, midy);
//    if (frameStyle.complexCorner.upperLeft) CGContextAddArcToPoint(aContext, minx, miny, midx, miny, [frameStyle.cornerRadius floatValue]);
//    else CGContextAddArcToPoint(aContext, minx, miny, midx, miny, 0);
//    if (frameStyle.complexCorner.upperRight) CGContextAddArcToPoint(aContext, maxx, miny, maxx, midy, [frameStyle.cornerRadius floatValue]);
//    else CGContextAddArcToPoint(aContext, maxx, miny, maxx, midy, 0);
//    if (frameStyle.complexCorner.lowerRight) CGContextAddArcToPoint(aContext, maxx, maxy, midx, maxy, [frameStyle.cornerRadius floatValue]);
//    else CGContextAddArcToPoint(aContext, maxx, maxy, midx, maxy, 0);
//    if (frameStyle.complexCorner.lowerLeft) CGContextAddArcToPoint(aContext, minx, maxy, minx, midy, [frameStyle.cornerRadius floatValue]);
//    else CGContextAddArcToPoint(aContext, minx, maxy, minx, midy, 0);
//    CGContextClosePath(aContext);
//    // end Internal Rounded Rect outline
//
//    //Clip using the two subpaths defined
//    CGContextEOClip(aContext);
//    //Set the fill color
//    [frameStyle.style.fillColor setFill];
//    //Basically draw a box the size of the frame and fill it. 
//    CGContextBeginPath(aContext);
//    CGContextMoveToPoint(aContext, minx-1, miny-1); 
//    CGContextAddLineToPoint(aContext, maxx +1, miny-1);
//    CGContextAddLineToPoint(aContext, maxx +1, maxy+1);
//    CGContextAddLineToPoint(aContext, minx -1, maxy+1);
//    CGContextAddLineToPoint(aContext, minx-1, miny-1);
//    CGContextDrawPath(aContext, kCGPathFill);
//    
//    CGContextRestoreGState(aContext);
//
////    FCGradientStyle *testGradientStyle = [[FCGradientStyle alloc]init];
////    testGradientStyle.fillColor = [UIColor redColor];
////    testGradientStyle.gradientColor = [UIColor blueColor];
////    testGradientStyle.strokeColor = [UIColor blueColor];
////    testGradientStyle.strokeGradientColor = [UIColor redColor];
////    testGradientStyle.strokeWidth = [NSNumber numberWithInt:5];
////    testGradientStyle.fillType = kFCGradientHorizontal;
////    testGradientStyle.strokeType = kFCGradientRadial;
////    FCRectangleStyle *testGradientRectStyle = [[FCRectangleStyle alloc]init];
////    testGradientRectStyle.style = testGradientStyle;
////    CGContextRef currentContext = UIGraphicsGetCurrentContext();
////    [FCGraphicsAPI drawRect:rect withStyle:testGradientRectStyle context:currentContext];
//    
//}

@end
