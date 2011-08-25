//
//  UIViewGradient.h
//  Button Practice
//
//  Created by Isaac Greenbride on 8/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCGraphicsAPI.h"
#import "FCRectangleStyle.h"

@interface UIViewGradient : UIView
{
    FCRectangleStyle *viewStyle;
}
@property (retain, nonatomic) FCRectangleStyle *viewStyle; 

@end
