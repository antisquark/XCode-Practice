//
//  FCStorePhotosZeroResultsBg.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//  DONE
/*
 storePhotosZeroResults_bkgd:
 - fill: #393939 (with slight drop shadow)
287x43
 */

#import "FCStorePhotosZeroResultsBg.h"
#import "FCGraphicsAPI.h"
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"
#define DROPSHADOW_OFFSET 3

@implementation FCStorePhotosZeroResultsBg
@synthesize viewRectStyle;
@synthesize viewDrawStyle;
@synthesize shadowStyle;

- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width-DROPSHADOW_OFFSET, myOrigin.height-DROPSHADOW_OFFSET, 287 + 2*DROPSHADOW_OFFSET, 43 + 2*DROPSHADOW_OFFSET);
    //maybe expand the frame by double the amount of the stroke for the dropshadow?
    self = [super initWithFrame:newFrame];//frame];
    if (self) {
        // Initialization code
        viewRectStyle = [[FCRectangleStyle alloc]init];
        viewRectStyle.cornerRadius = [NSNumber numberWithInt:10];
        viewDrawStyle = [[FCShapeStyle alloc]init];
        viewDrawStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0x393939 withAlpha:.9];
//        viewDrawStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0x000000 withAlpha:.2]; //inner square draws over half the stroke
//        viewDrawStyle.strokeWidth = [NSNumber numberWithInt:0]; //test for visibility doesn't work as expected.
        viewRectStyle.style = viewDrawStyle;
        
        shadowStyle = [[FCShapeStyle alloc]init];
        shadowStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0x000000 withAlpha:.1];
        [self setOpaque:NO];
//        [self setClipsToBounds:NO];//doesn't work..
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    CGRect rectOverShadow = CGRectMake(rect.origin.x + DROPSHADOW_OFFSET, rect.origin.y + DROPSHADOW_OFFSET, rect.size.width - 2*DROPSHADOW_OFFSET, rect.size.height - 2*DROPSHADOW_OFFSET);
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // Drawing code
    viewRectStyle.style = shadowStyle;
    [FCGraphicsAPI drawRect:rect withStyle:viewRectStyle context:currentContext];
    
    
    
    viewRectStyle.style = viewDrawStyle;
    [FCGraphicsAPI drawRect:rectOverShadow withStyle:viewRectStyle context:currentContext];
    
    
    
    
}

- (void)dealloc
{
    [viewRectStyle release];
    [viewDrawStyle release];
    [shadowStyle release];
    [super dealloc];
}

@end
