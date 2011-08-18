//
//  DrawButton.h
//  Button Fun
//
//  Created by Isaac Greenbride on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCShapeStyle.h"
#import "FCRectangleStyle.h"

@interface DrawButton : UIButton
{
    FCRectangleStyle *buttonStyle;
}

@property (retain, nonatomic) FCRectangleStyle *buttonStyle;


@end

