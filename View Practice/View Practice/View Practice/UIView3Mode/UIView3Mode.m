//
//  UIView3Mode.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIView3Mode.h"
#import "FCRectangleStyle.h"
#import "FCGraphicsAPI.h"

@implementation UIView3Mode
@synthesize rStyleLocked;
@synthesize rStyleDefault;
@synthesize rStyleSelected;
@synthesize viewState;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setOpaque:NO];        //necessary?
        rStyleSelected = nil;
        rStyleLocked = nil;
        rStyleDefault = nil;
        viewState = kFCViewDefault;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    FCRectangleStyle *drawStyle = rStyleDefault;
    //could add checks to be sure these styles exist--worth it?
    switch (viewState) {
        case kFCViewLocked:
            drawStyle = rStyleLocked;
            break;
        case kFCViewSelected:
            drawStyle = rStyleSelected;
            break;
        default:
            drawStyle = rStyleDefault;
            break;
    }
    
   
    [FCGraphicsAPI drawRect:rect withStyle:drawStyle context:currentContext];
}


@end
