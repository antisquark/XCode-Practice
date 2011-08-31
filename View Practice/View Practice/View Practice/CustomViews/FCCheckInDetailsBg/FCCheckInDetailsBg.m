//
//  FCCheckInDetails_bkgd.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

////PROBLEM: IMAGE NOT LOADING -->stored with incorrect path?--Have to add it to the XCode project, genius.--Oh, right.
/*
 
 checkInDetails_bkgd:
 - stroke: #C0AEB7
 - fill pattern: see attached image (checkInDetails_bkgd.png)
 320x431
 */

#import "FCCheckInDetailsBg.h"
#import "FCShapeStyle.h"
#import "FCRectangleStyle.h"
#import "FCGraphicsAPI.h"

@implementation FCCheckInDetailsBg
@synthesize viewRectStyle;

- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width, myOrigin.height, 320, 431);
    self = [super initWithFrame:newFrame];
    if (self) {
        // Initialization code
        viewRectStyle = [[FCRectangleStyle alloc]init];
        viewRectStyle.cornerRadius = [NSNumber numberWithInt:5];
        FCShapeStyle *viewStyle = [[FCShapeStyle alloc]init];
        viewStyle.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"checkInDetails_bkgd.png"]];  
        viewStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0xC0AEB7];//FECBE2];  //this was the color you gave me, but it's WAY too light to match...
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
