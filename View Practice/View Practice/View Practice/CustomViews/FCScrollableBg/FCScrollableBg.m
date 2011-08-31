//
//  FCScrollableBg.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCScrollableBg.h"
#import "FCGraphicsAPI.h"
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"
#import "FCGradientStyle.h"
#import "FCComplexCorner.h"
#import "JewelView.h"


@implementation FCScrollableBg
//@synthesize viewRectStyle;
@synthesize viewTopRStyle;
@synthesize viewMiddleRStyle;
@synthesize viewBottomRStyle;
@synthesize viewFrameRStyle;
@synthesize topHeightFractionOfTotal;

- (id)initWithFrame:(CGRect)frame
{
    //    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, 320, 416);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        topHeightFractionOfTotal=10;
        
//        viewRectStyle = [[FCRectangleStyle alloc]init];
        FCGradientStyle *viewTopStyle = [[FCGradientStyle alloc]init]; 
        viewTopStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:MEDIUM_GRAY];
        viewTopStyle.gradientColor = [FCGraphicsAPI UIColorFromRGB:DARK_GRAY];
        viewTopStyle.fillType = kFCGradientVertical;
        
        viewTopRStyle = [[FCRectangleStyle alloc]init];
        viewTopRStyle.complexCorner = [[FCComplexCorner alloc] initWithScheme:kFCCornerSchemeUpper];        
        viewTopRStyle.cornerRadius = [NSNumber numberWithInt: BG_CORNER_RADIUS-BG_CONTENTS_INSET];    //the background's corner radius minus the contents inset value
        viewTopRStyle.style = viewTopStyle;
        
        FCGradientStyle *viewMiddleStyle = [[FCGradientStyle alloc]init];
//        viewMiddleStyle.fillColor = [UIColor whiteColor]; //once again, this was the problem: whiteColor doesn't fully define the UIColor, so you get weird behavior
        viewMiddleStyle.fillColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1]; 
        viewMiddleStyle.gradientColor = viewMiddleStyle.fillColor;//[UIColor greenColor];    //added for gradient testing
        viewMiddleStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:LIGHT_GRAY];
        viewMiddleStyle.strokeGradientColor = viewMiddleStyle.strokeColor;
        viewMiddleStyle.strokeWidth = [NSNumber numberWithInt:1];
        viewMiddleRStyle = [[FCRectangleStyle alloc]init];
        viewMiddleRStyle.style = viewMiddleStyle;
        
        
        
        FCShapeStyle *viewFrameStyle = [[FCShapeStyle alloc]init];
        viewFrameStyle.fillColor = [UIColor whiteColor];
        viewFrameStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:LIGHT_GRAY];//this needs a dropshadow.. a stroke with an 'inside-to-outside' gradient would work too..
        viewFrameStyle.strokeWidth = [NSNumber numberWithInt:1];
        
        
        viewFrameRStyle = [[FCRectangleStyle alloc] init];
        viewFrameRStyle.style = viewFrameStyle;
        viewFrameRStyle.cornerRadius = [NSNumber numberWithInt:BG_CORNER_RADIUS]; //doesn't this use the auto release pool?

        
        [self setOpaque:NO];
    }
    return self;
}

-(void) dealloc 
{
//    [viewRectStyle release];
    [viewTopRStyle release];
    [viewBottomRStyle release];
    [viewFrameRStyle release];
    [super dealloc];
    //don't have to release the topHeight variable; it's just a float.
}

@end
