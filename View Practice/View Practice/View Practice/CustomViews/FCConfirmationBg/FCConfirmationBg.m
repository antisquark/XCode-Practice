//
//  FCConfirmationBg.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//DONE

#import "FCConfirmationBg.h"
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"
#import "FCGraphicsAPI.h"
#define SHADOW_OFFSET 3
#define FRACTION 13

@implementation FCConfirmationBg
@synthesize viewRectStyle;
@synthesize viewTopStyle;
@synthesize viewMiddleStyle;
@synthesize viewBottomStyle;

/*
 confirmationBg:
 - stroke: #BEADAF
 - fill: top (#FDB4CB) middle (#FADEE8) bottom (#8F0037)
 confirmationBg:
 320x417
 */

- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width, myOrigin.height, 320, 417);
    self = [super initWithFrame:newFrame];//frame];
    if (self) {
        // Initialization code
        [self setOpaque:NO];
        
        viewRectStyle = [[FCRectangleStyle alloc]init];
//        FCShapeStyle *viewStyle = [[FCShapeStyle alloc]init];
//        viewStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xFECBE2 withAlpha:.8];
//        viewRectStyle.style = viewStyle;
        viewTopStyle = [[FCShapeStyle alloc]init];
        viewTopStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xFDB4CB];
        viewMiddleStyle = [[FCShapeStyle alloc]init];
        viewMiddleStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xFADEE8];
        viewMiddleStyle.strokeWidth = [NSNumber numberWithInt:0];
        viewBottomStyle = [[FCShapeStyle alloc]init];
        viewBottomStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0x8F0037];
        viewRectStyle.style = viewTopStyle;
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGFloat subHeight = rect.size.height/FRACTION;
    CGFloat topHeight = subHeight;
    CGFloat middleHeight = subHeight*(FRACTION-4);
    CGFloat bottomHeight = subHeight*3;
    
    FCShapeStyle *shadowStyle = [[FCShapeStyle alloc]init];
    shadowStyle.fillColor = [UIColor colorWithWhite:0 alpha:.2];
    CGRect currentDrawingRect =CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, subHeight);
    
    //Draw bottom area
    currentDrawingRect.origin.y += topHeight+middleHeight;    //adjust down for other shapes
    currentDrawingRect.size.height =bottomHeight;
    viewRectStyle.style = viewBottomStyle;
    [FCGraphicsAPI drawRect:currentDrawingRect withStyle:viewRectStyle context:currentContext];
    
    //Draw top area
    currentDrawingRect.origin.y = 0;
    viewRectStyle.style = viewTopStyle;
    //CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
    [FCGraphicsAPI drawRect:currentDrawingRect withStyle:viewRectStyle context:currentContext];
    
    
    //Draw middle area 
    currentDrawingRect.origin.y = topHeight;       //adjust down for previous shape
    currentDrawingRect.size.height = middleHeight;
    ////draw shadow first
    viewRectStyle.style = shadowStyle;
    [FCGraphicsAPI drawRect:CGRectMake(currentDrawingRect.origin.x, currentDrawingRect.origin.y + SHADOW_OFFSET, currentDrawingRect.size.width, currentDrawingRect.size.height) 
                  withStyle:viewRectStyle 
                    context:currentContext];
    ////draw fill over shadow
    viewRectStyle.style = viewMiddleStyle;
    [FCGraphicsAPI drawRect:currentDrawingRect withStyle:viewRectStyle context:currentContext];
    //Draw triangle
    currentDrawingRect.origin.y = topHeight+middleHeight -1;       //adjust down for previous shape
    CGRect triangleRect = CGRectMake(rect.size.width/20*9, currentDrawingRect.origin.y, currentDrawingRect.size.width/10, rect.size.height/35);
    ////draw shadow
    [FCGraphicsAPI drawTriangle:CGRectMake(triangleRect.origin.x, triangleRect.origin.y + SHADOW_OFFSET + 1, triangleRect.size.width, triangleRect.size.height) withStyle:shadowStyle orientation:kFCTriangleDown context:currentContext];
    ////draw triangle
    [FCGraphicsAPI drawTriangle:triangleRect withStyle:viewMiddleStyle orientation:kFCTriangleDown context:currentContext];

}
-(void) dealloc 
{
    [viewRectStyle release];
    [viewTopStyle release];
    [viewBottomStyle release];
    [viewMiddleStyle release];
    [super dealloc];
    //don't have to release the topHeight variable; it's just a float.
}

@end
