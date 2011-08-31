//
//  FCInviteNewBg.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
// white line added, but painfully--no way to add just a stroke in the api?
// DONE
/*
 invite_bg & invite_new_bg:
 - stroke: #C0A9AF
 - fill: top (#FDB1CF), bottom (#FFE0E7)  [note thin white line between top & bottom]
 looks like the bottom might actually have a gradient
 320x416
 */
#import "FCInviteNewBg.h"
#import "FCGraphicsAPI.h"
#import "FCShapeStyle.h"


@implementation FCInviteNewBg

- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width, myOrigin.height, 320, 416);
    self = [super initWithFrame:newFrame];
    if (self) {
        // Initialization code
        
        super.viewTopStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xFDB1CF];
        super.viewBottomStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xFFE0E7];        
        super.viewFrameStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0xC0A9AF];
        
        super.topHeightFractionOfTotal=10;
        [self setOpaque:NO];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    
//    CGContextSaveGState(currentContext);
//    
//    CGContextSetLineWidth(currentContext, [super.viewFrameStyle.strokeWidth floatValue]);
//
//    CGContextBeginPath(currentContext);
//    CGContextMoveToPoint(currentContext, rect.origin.x, rect.size.height/super.topHeightFractionOfTotal+1);
//    CGContextAddLineToPoint(currentContext, rect.size.width, rect.size.height/super.topHeightFractionOfTotal+1);
//    CGContextClosePath(currentContext);
    FCShapeStyle *lineStyle = [[FCShapeStyle alloc]init];
    lineStyle.fillColor = [UIColor whiteColor];
    
    super.viewRectStyle.style = lineStyle;
    
    [FCGraphicsAPI drawRect:CGRectMake(rect.origin.x+[super.viewFrameStyle.strokeWidth floatValue], 
                                       rect.size.height/super.topHeightFractionOfTotal, rect.size.width-[super.viewFrameStyle.strokeWidth floatValue]*2, 1) 
                    withStyle:super.viewRectStyle  
                    context:currentContext];
    
    [lineStyle release];
    
}
-(void) dealloc 
{
    [super dealloc];
    //don't have to release the topHeight variable; it's just a float.
}
@end
