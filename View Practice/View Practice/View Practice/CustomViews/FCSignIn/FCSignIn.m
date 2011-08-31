//
//  FCSignInLabel.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
// DONE

/*
 signIn:
 - stroke: #BDAAAB
 - fill: top (#8F0234), bottom (#FCE2E5)
 320x416
 looks like the bottom might actually have a gradient
 */

#import "FCSignIn.h"
#import "FCShapeStyle.h"
#import "FCRectangleStyle.h"
#import "FCGraphicsAPI.h"

@implementation FCSignIn

- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width, myOrigin.height, 320, 416);
    self = [super initWithFrame:newFrame];
    if (self) {
        // Initialization code
        super.viewTopStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0x8F0234];
        super.viewBottomStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xFCE2E5];
        super.viewFrameStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0xBDAAAB];
        
        
        super.topHeightFractionOfTotal=10;
        [self setOpaque:NO];
    }
    return self;
}

/* 
 using the TwoLevelView draw Rect
 */
-(void) dealloc 
{
    [super dealloc];
    //don't have to release the topHeight variable; it's just a float.
}
@end