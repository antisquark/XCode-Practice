//
//  UIView3Mode.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCRectangleStyle.h"
enum{
    kFCViewDefault,
    kFCViewLocked,
    kFCViewSelected
} FCViewState;

@interface UIView3Mode : UIView
{
    //this could be broken into smaller pieces, i.e. have a single rect style, then separate complex corner and shape/gradient styles.
    //this seems to give the most and clearest control, though.
    FCRectangleStyle *rStyleDefault;
    FCRectangleStyle *rStyleLocked;
    FCRectangleStyle *rStyleSelected;
    int viewState;
}

@property (retain, nonatomic) FCRectangleStyle *rStyleDefault;
@property (retain, nonatomic) FCRectangleStyle *rStyleLocked;
@property (retain, nonatomic) FCRectangleStyle *rStyleSelected;
@property (assign) int viewState;

@end
