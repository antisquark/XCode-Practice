//
//  checkInCaption_bkgd.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//DONE
/*
 checkInCaption_bkgd: 
 - fill: white 
 - stroke: #FECBE2 
 303x87

 */

#import "FCCheckInCaptionBg.h"
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"
#import "FCGraphicsAPI.h"

@implementation FCCheckInCaptionBg
@synthesize viewRectStyle;

- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width, myOrigin.height, 303, 87);
    self = [super initWithFrame:newFrame];//frame];
    if (self) {
        // Initialization code
        viewRectStyle = [[FCRectangleStyle alloc]init];
        viewRectStyle.cornerRadius = [NSNumber numberWithInt:10];
        FCShapeStyle *viewStyle = [[FCShapeStyle alloc]init];
        viewStyle.fillColor = [UIColor whiteColor];
        viewStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0xFF0099];//FECBE2];  //this was the color you gave me, but it's WAY too light to match...
        viewStyle.strokeWidth = [NSNumber numberWithInt:1];
        viewRectStyle.style = viewStyle;
        [self setOpaque:NO];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
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
