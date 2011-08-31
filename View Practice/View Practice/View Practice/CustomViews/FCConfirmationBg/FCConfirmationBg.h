//
//  FCConfirmationBg.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCRectangleStyle.h"

@interface FCConfirmationBg : UIView
{
    FCRectangleStyle *viewRectStyle;
    FCShapeStyle *viewTopStyle;
    FCShapeStyle *viewMiddleStyle;
    FCShapeStyle *viewBottomStyle;
}
@property (retain, nonatomic) FCRectangleStyle *viewRectStyle;
@property (retain, nonatomic) FCShapeStyle *viewTopStyle;
@property (retain, nonatomic) FCShapeStyle *viewMiddleStyle;
@property (retain, nonatomic) FCShapeStyle *viewBottomStyle;
- (id) initWithSize:(CGSize)myOrigin;
@end
