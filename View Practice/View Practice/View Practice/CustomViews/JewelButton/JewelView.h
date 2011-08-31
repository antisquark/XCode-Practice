//
//  JewelView.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CORNER_OFFSET 2

@interface JewelView : UIView
@property (assign) int colorInt;
@property (assign) float cornerRadius;
+(UIColor *)darkenByWithAlpha:(UIColor *)color amt:(float)darkenAmt alpha:(float)aAmt;

@end
