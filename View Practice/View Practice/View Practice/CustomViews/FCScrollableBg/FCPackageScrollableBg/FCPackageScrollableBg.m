//
//  FCPackageScrollableBg.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCPackageScrollableBg.h"
#import "FCScrollableBg.h"
#import "FCGraphicsAPI.h"
#import "FCScrollableBg.h"
#import "JewelView.h"

@implementation FCPackageScrollableBg
@synthesize jewelColor;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        jewelColor = JEWEL_CREDIT_COLOR;    //defaults to the orange?
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGRect topRect = CGRectMake(rect.origin.x+BG_CONTENTS_INSET, 
                                rect.origin.y+BG_CONTENTS_INSET, 
                                rect.size.width-2*BG_CONTENTS_INSET, 
                                (rect.size.height-2*BG_CONTENTS_INSET)/super.topHeightFractionOfTotal);
    
    CGRect middleRect = CGRectMake(BG_INTERNAL_DEFAULT_VERTICAL_SPACER, 
                                   topRect.origin.y + topRect.size.height + BG_INTERNAL_DEFAULT_VERTICAL_SPACER, 
                                   rect.size.width-2*BG_INTERNAL_DEFAULT_VERTICAL_SPACER, 
                                   rect.size.height -2*BG_INTERNAL_DEFAULT_VERTICAL_SPACER - 2*BG_CONTENTS_INSET - topRect.size.height - JEWEL_HEIGHT);
    
    CGRect bottomRect = CGRectMake(rect.size.width-BG_INTERNAL_DEFAULT_VERTICAL_SPACER - JEWEL_WIDTH,
                                   middleRect.origin.y + middleRect.size.height + BG_INTERNAL_DEFAULT_VERTICAL_SPACER, 
                                   JEWEL_WIDTH, JEWEL_HEIGHT);
//    NSLog(@"Setting Super's Gradient 1 1 1 to whiteColor");
    FCGradientStyle *sMiddleGradientStyle = ((FCGradientStyle *)super.viewMiddleRStyle.style);
    //this box gradient looks like it's actually drawing a gradient in a square and then clipping to a rectangle
//    sMiddleGradientStyle.gradientColor = [UIColor redColor];
//    ((FCGradientStyle *)super.viewMiddleRStyle.style).gradientColor = [UIColor colorWithRed:.6 green:.6 blue:.6 alpha:1];
//    ((FCGradientStyle *)super.viewMiddleRStyle.style).fillColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
//    sMiddleGradientStyle.fillColor = [UIColor blueColor];
//    sMiddleGradientStyle.fillColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:0]; //this is the color it's getting set to..
    sMiddleGradientStyle.gradientColor = [FCGraphicsAPI UIColorFromRGB:LIGHTER_GRAY];
    sMiddleGradientStyle.fillType = kFCGradientRadial;
    sMiddleGradientStyle.strokeGradientColor =  sMiddleGradientStyle.strokeColor;
    sMiddleGradientStyle.strokeType = kFCGradientHorizontal;
    
    //draw the frame under the rest
    //    viewRectStyle.style = viewFrameStyle;
    [FCGraphicsAPI drawRect:rect withStyle:super.viewFrameRStyle context:currentContext];
    //draw the top box
    [FCGraphicsAPI drawRect:topRect withStyle:super.viewTopRStyle context:currentContext];
    
    //draw this rectangle below the first and let it fill the rest of the frame (except for the icon bar at the bottom).
    ////there was a single line of pixels between the two boxes, hence the -1 in the y value below
    //    viewRectStyle.style = viewBottomStyle;
//    NSLog(@"Drawing Middle Rect for package");
    /*
     Uncovered some REALLY strange behavior with the gradient drawing.. it was shifting through a gold color between the two endpoints.
     Maybe the colorspace is getting corrupted? Only happens when the fill color is defined in the super class, and the gradient color is defined in the child class
     */
     [FCGraphicsAPI drawRect:middleRect withStyle:super.viewMiddleRStyle context:currentContext]; 
//    NSLog(@"Finished Drawing Middle Rect for package");
    
    JewelView *bottomView = [[JewelView alloc]initWithFrame:bottomRect];
    bottomView.colorInt = jewelColor;//JEWEL_CASH_COLOR;
    [bottomView setOpaque:NO];
    [self addSubview:bottomView];
    [bottomView release];
    
}

@end
