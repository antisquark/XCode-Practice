//
//  FCButtonBg.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//  DONE

#import "FCButtonBg.h"
#import "FCShapeStyle.h"
#import "FCGraphicsAPI.h"

@implementation FCButtonBg
@synthesize viewRectStyle;

- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width, myOrigin.height, 300, 218);
    self = [super initWithFrame:newFrame];//frame];
    if (self) {
        // Initialization code
        viewRectStyle = [[FCRectangleStyle alloc]init];
        viewRectStyle.cornerRadius = [NSNumber numberWithInt:10];
        FCShapeStyle *viewStyle = [[FCShapeStyle alloc]init];
        viewStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xFECBE2 withAlpha:.8];
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
