//
//  FCSignInLabel.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
// DONE
/*
 signInLabel:
 - fill: #FEC5DE
 298x40
 */

#import "FCSignInLabel.h"
#import "FCGraphicsAPI.h"
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"

@implementation FCSignInLabel
@synthesize viewRectStyle;

- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width, myOrigin.height, 298, 40);
    self = [super initWithFrame:newFrame];//frame];
    if (self) {
        // Initialization code
        viewRectStyle = [[FCRectangleStyle alloc]init];
        viewRectStyle.cornerRadius = [NSNumber numberWithInt:10];
        FCShapeStyle *viewStyle = [[FCShapeStyle alloc]init];
        viewStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xFEC5DE withAlpha:.5];
        viewStyle.strokeColor = [UIColor whiteColor];
        viewStyle.strokeWidth = [NSNumber numberWithInt:1]; 
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
