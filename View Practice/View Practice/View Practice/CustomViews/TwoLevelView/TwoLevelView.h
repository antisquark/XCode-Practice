//
//  FCSignInLabel.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"

@interface TwoLevelView : UIView
{

}
@property (retain, nonatomic) FCRectangleStyle *viewRectStyle;
@property (retain, nonatomic) FCShapeStyle *viewTopStyle;
@property (retain, nonatomic) FCShapeStyle *viewBottomStyle;
@property (retain, nonatomic) FCShapeStyle *viewFrameStyle;

@property (assign) CGFloat topHeightFractionOfTotal;

@end

