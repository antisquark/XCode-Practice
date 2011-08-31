//
//  FCGrayOut.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
// mostly DONE --stroke could look better


#import "FCGrayOut.h"
#import "FCGraphicsAPI.h"
#import "FCRectangleStyle.h"
#import "FCGradientStyle.h"

@implementation FCGrayOut
@synthesize viewRectStyle;

- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width, myOrigin.height, 300, 183);
    self = [super initWithFrame:newFrame];//frame];
    if (self) {
        // Initialization code
        viewRectStyle = [[FCRectangleStyle alloc]init];
        viewRectStyle.cornerRadius = [NSNumber numberWithInt:10];
        FCGradientStyle *viewStyle = [[FCGradientStyle alloc]init];
        UIColor *lGray = [FCGraphicsAPI UIColorFromRGB:0xD6D6D6 withAlpha:.8];
        UIColor *dGray = [FCGraphicsAPI UIColorFromRGB:0xCCC2C7 withAlpha:.9];   //alpha?
        viewStyle.fillColor = lGray;
        viewStyle.gradientColor = lGray;
        viewStyle.fillType = kFCGradientVertical; //won't draw without a type.. can there be a "solid" type?
        viewStyle.strokeGradientColor = dGray;
        viewStyle.strokeColor = lGray;
        viewStyle.strokeType = kFCGradientRadial;
        viewStyle.strokeWidth = [NSNumber numberWithInt:3]; //test for visibility doesn't work as expected.
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
