//
//  FCGrayText.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
/*
 grayText:
 - stroke: #B8B3B2
 - fill: #D9D1D3
 grayText:
 300x66
 */

#import "FCGrayText.h"
#import "FCGraphicsAPI.h"
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"

@implementation FCGrayText
@synthesize viewRectStyle;

- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width, myOrigin.height, 300, 66);
    self = [super initWithFrame:newFrame];//frame];
    if (self) {
        // Initialization code
        viewRectStyle = [[FCRectangleStyle alloc]init];
        viewRectStyle.cornerRadius = [NSNumber numberWithInt:10];
        FCShapeStyle *viewStyle = [[FCShapeStyle alloc]init];
        UIColor *lGray = [FCGraphicsAPI UIColorFromRGB:0xD9D1D3];
        UIColor *dGray = [FCGraphicsAPI UIColorFromRGB:0xB8B3B2];
        viewStyle.fillColor = lGray;
        viewStyle.strokeColor = dGray;
        viewStyle.strokeWidth = [NSNumber numberWithInt:1]; //test for visibility doesn't work as expected.
        viewRectStyle.style = viewStyle;
        [self setOpaque:NO];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [FCGraphicsAPI drawRect:rect withStyle:viewRectStyle context:currentContext];
}
-(void) dealloc 
{
    [viewRectStyle release];
    [super dealloc];
    //don't have to release the topHeight variable; it's just a float.
}

@end
