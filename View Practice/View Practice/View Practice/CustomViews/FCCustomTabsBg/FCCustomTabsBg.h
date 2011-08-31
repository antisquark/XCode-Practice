//
//  FCCustomTabsBg.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"
#import "FCGradientStyle.h"

@interface FCCustomTabsBg : UIView
{
    
}

@property (retain, nonatomic) FCRectangleStyle *viewRectStyle;
@property (retain, nonatomic) FCGradientStyle *viewTopStyle;
@property (retain, nonatomic) FCGradientStyle *viewBottomStyle;
@property (retain, nonatomic) FCShapeStyle *viewFrameStyle;
@property (assign) CGFloat topHeightFractionOfTotal;

- (id) initWithSize:(CGSize)myOrigin;
@end
