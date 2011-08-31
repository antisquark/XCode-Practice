//
//  FCScrollableBg.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"
#import "FCGradientStyle.h"
#define BG_CONTENTS_INSET 5     //want all the contents indented a certain amount? use this value
#define BG_CORNER_RADIUS 10      //what the outermost corners of this BG should have as a radius
#define BG_INTERNAL_DEFAULT_VERTICAL_SPACER 8  //the vertical spacing between elements
#define JEWEL_HEIGHT 30
#define JEWEL_WIDTH 70
#define JEWEL_CREDIT_COLOR 0x0099FF
#define JEWEL_DOLLAR_COLOR 0xFF9900//0XFFCC00 

///COLORS
#define DARK_GRAY 0x222222
#define MEDIUM_GRAY 0x333333
#define LIGHT_GRAY 0x555555
#define LIGHTER_GRAY 0xCCCCCC
///

@interface FCScrollableBg : UIView
{
    
}
//@property (retain, nonatomic) FCRectangleStyle *viewRectStyle;
@property (retain, nonatomic) FCRectangleStyle *viewTopRStyle;
@property (retain, nonatomic) FCRectangleStyle *viewMiddleRStyle;
@property (retain, nonatomic) FCRectangleStyle *viewBottomRStyle;
@property (retain, nonatomic) FCRectangleStyle *viewFrameRStyle;

@property (assign) CGFloat topHeightFractionOfTotal;

@end
